#include "Luau/Bytecode.h"
#include "Luau/BytecodeBuilder.h"
#include "Luau/BytecodeUtils.h"
#include "Luau/Compiler.h"
#include "lua.h"
#include "lualib.h"
#include "roblox_bytecode.hpp"

#include <chrono>
#include <cstdint>
#include <cstdlib>
#include <filesystem>
#include <fstream>
#include <iostream>
#include <limits>
#include <stdexcept>
#include <string>

#ifdef _WIN32
#include <fcntl.h>
#include <io.h>
#endif

namespace fs = std::filesystem;
using Clock = std::chrono::steady_clock;

namespace {
constexpr std::uintmax_t kMaxSource = 4 * 1024 * 1024;
constexpr std::size_t kMaxVmMemory = 64 * 1024 * 1024;

void usage() {
    std::cerr << "Axiom Luau Core - prototipo local\n"
              << "  axiom-luau run ARQUIVO|- [--timeout-ms N]\n"
              << "  axiom-luau check ARQUIVO|-\n"
              << "  axiom-luau compile ARQUIVO --output BYTECODE [--experimental-opcodes | --roblox-client EXE]\n"
              << "A execucao e local e NAO acessa o cliente Roblox.\n";
}

std::string readSource(const fs::path& p) {
    std::error_code ec;
    if (!fs::is_regular_file(p, ec) || ec)
        throw std::runtime_error("Arquivo de origem nao encontrado ou nao e regular.");
    const auto size = fs::file_size(p, ec);
    if (ec || size > kMaxSource)
        throw std::runtime_error("Origem inacessivel ou maior que 4 MiB.");
    std::ifstream in(p, std::ios::binary);
    if (!in) throw std::runtime_error("Nao foi possivel abrir a origem.");
    std::string source((std::istreambuf_iterator<char>(in)), std::istreambuf_iterator<char>());
    if (in.bad() || source.size() > kMaxSource)
        throw std::runtime_error("Falha ao ler origem ou arquivo maior que 4 MiB.");
    return source;
}

std::string readStdin() {
#ifdef _WIN32
    if (_setmode(_fileno(stdin), _O_BINARY) == -1)
        throw std::runtime_error("Nao foi possivel ler a entrada em modo binario.");
#endif
    std::string source;
    char buffer[4096];
    while (std::cin) {
        std::cin.read(buffer, sizeof(buffer));
        const auto count = std::cin.gcount();
        if (count > 0) {
            if (static_cast<std::uintmax_t>(count) > kMaxSource - source.size())
                throw std::runtime_error("Origem maior que 4 MiB.");
            source.append(buffer, static_cast<std::size_t>(count));
        }
    }
    if (!std::cin.eof()) throw std::runtime_error("Falha ao ler a entrada.");
    return source;
}

std::string compile(const std::string& source, bool experimental, const axiom::OpcodeTable* table) {
    axiom::RobloxOpcodeEncoder encoder(table);
    std::string result = Luau::compile(source, {}, {}, experimental || table ? &encoder : nullptr);
    if (result.empty()) throw std::runtime_error("Compilador retornou resultado vazio.");
    if (result[0] == '\0')
        throw std::runtime_error("Erro de sintaxe: " + result.substr(1));
    return result;
}

struct Budget { std::size_t used = 0; Clock::time_point deadline; };

void* boundedAlloc(void* userdata, void* ptr, std::size_t oldSize, std::size_t newSize) {
    auto& budget = *static_cast<Budget*>(userdata);
    if (!ptr) oldSize = 0;
    if (newSize == 0) {
        std::free(ptr);
        budget.used = oldSize <= budget.used ? budget.used - oldSize : 0;
        return nullptr;
    }
    if (newSize > oldSize && (budget.used > kMaxVmMemory || newSize - oldSize > kMaxVmMemory - budget.used))
        return nullptr;
    void* result = std::realloc(ptr, newSize);
    if (result) {
        if (newSize >= oldSize) budget.used += newSize - oldSize;
        else budget.used -= oldSize - newSize;
    }
    return result;
}

void interrupt(lua_State* L, int gc) {
    if (gc >= 0) return;
    auto* budget = static_cast<Budget*>(lua_callbacks(L)->userdata);
    if (budget && Clock::now() > budget->deadline)
        luaL_error(L, "%s", "Tempo limite da execucao local excedido");
}

int run(const std::string& bytecode, unsigned timeoutMs) {
    Budget budget;
    budget.deadline = Clock::now() + std::chrono::milliseconds(timeoutMs);
    lua_State* main = lua_newstate(boundedAlloc, &budget);
    if (!main) throw std::runtime_error("Nao foi possivel iniciar a VM Luau.");
    lua_callbacks(main)->userdata = &budget;
    lua_callbacks(main)->interrupt = interrupt;
    luaL_openlibs(main);
    luaL_sandbox(main);
    lua_State* thread = lua_newthread(main);
    luaL_sandboxthread(thread);
    int status = luau_load(thread, "=axiom", bytecode.data(), bytecode.size(), 0);
    if (status == 0) status = lua_pcall(thread, 0, 0, 0);
    if (status != 0) {
        const char* message = lua_tostring(thread, -1);
        std::cerr << "Erro de execucao local: " << (message ? message : "erro desconhecido") << '\n';
    }
    lua_close(main);
    return status == 0 ? 0 : 1;
}

unsigned parseTimeout(const std::string& s) {
    std::size_t pos = 0;
    unsigned long v;
    try { v = std::stoul(s, &pos); }
    catch (...) { throw std::runtime_error("Tempo invalido."); }
    if (pos != s.size() || v < 10 || v > 60000)
        throw std::runtime_error("Tempo deve estar entre 10 e 60000 ms.");
    return static_cast<unsigned>(v);
}

bool sameFile(const fs::path& a, const fs::path& b) {
    std::error_code ec;
    if (fs::exists(b, ec) && !ec) {
        bool equal = fs::equivalent(a, b, ec);
        if (!ec && equal) return true;
    }
    const auto a1 = fs::absolute(a, ec).lexically_normal();
    if (ec) throw std::runtime_error("Caminho de origem invalido.");
    const auto b1 = fs::absolute(b, ec).lexically_normal();
    if (ec) throw std::runtime_error("Caminho de destino invalido.");
    return a1 == b1;
}
}

int main(int argc, char** argv) {
    try {
        if (argc < 3) { usage(); return 2; }
        const std::string command = argv[1];
        const fs::path input = fs::u8path(argv[2]);
        if (command != "run" && command != "check" && command != "compile") { usage(); return 2; }
        fs::path output;
        fs::path robloxClient;
        bool experimental = false;
        unsigned timeoutMs = 5000;
        bool timeoutSet = false;
        for (int i = 3; i < argc; ++i) {
            const std::string arg = argv[i];
            if (arg == "--output" && command == "compile" && output.empty() && i + 1 < argc)
                output = fs::u8path(argv[++i]);
            else if (arg == "--experimental-opcodes" && command == "compile" && !experimental)
                experimental = true;
            else if (arg == "--roblox-client" && command == "compile" && robloxClient.empty() && i + 1 < argc)
                robloxClient = fs::u8path(argv[++i]);
            else if (arg == "--timeout-ms" && command == "run" && !timeoutSet && i + 1 < argc) {
                timeoutMs = parseTimeout(argv[++i]);
                timeoutSet = true;
            } else throw std::runtime_error("Opcao invalida ou repetida: " + arg);
        }
        if (command == "compile" && output.empty())
            throw std::runtime_error("Informe --output ARQUIVO.");
        if (experimental && !robloxClient.empty())
            throw std::runtime_error("Escolha apenas uma opcao de codificacao experimental.");
        if (!output.empty() && (sameFile(input, output) || (!robloxClient.empty() && sameFile(robloxClient, output))))
            throw std::runtime_error("O destino nao pode ser a origem nem o cliente Roblox.");
        if (command == "compile" && input == fs::path("-"))
            throw std::runtime_error("Entrada padrao esta disponivel apenas para run e check.");
        auto source = input == fs::path("-") ? readStdin() : readSource(input);
        axiom::OpcodeTable table{};
        if (!robloxClient.empty()) table = axiom::readRobloxOpcodeTable(robloxClient);
        auto bytecode = compile(source, experimental, robloxClient.empty() ? nullptr : &table);
        if (command == "check") { std::cout << "Sintaxe Luau compilada com sucesso.\n"; return 0; }
        if (command == "run") return run(bytecode, timeoutMs);
        if (experimental)
            std::cerr << "AVISO: codificacao experimental; compatibilidade Roblox nao foi validada.\n";
        if (!robloxClient.empty())
            std::cerr << "AVISO: tabela da versao 5a21b87bbc2641cf lida; execucao no cliente nao foi validada.\n";
        std::ofstream out(output, std::ios::binary | std::ios::trunc);
        if (!out || !out.write(bytecode.data(), static_cast<std::streamsize>(bytecode.size())))
            throw std::runtime_error("Nao foi possivel gravar o bytecode.");
        out.close();
        if (!out) throw std::runtime_error("Falha ao finalizar o arquivo de saida.");
        std::cout << "Bytecode gravado: " << bytecode.size() << " bytes.\n";
        return 0;
    } catch (const std::exception& e) {
        std::cerr << "Erro: " << e.what() << '\n';
        return 1;
    }
}
