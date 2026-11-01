#pragma once

#include "Luau/Bytecode.h"
#include "Luau/BytecodeBuilder.h"
#include "Luau/BytecodeUtils.h"

#include <array>
#include <cstdint>
#include <filesystem>
#include <fstream>
#include <stdexcept>
#include <string>

namespace axiom {
using OpcodeTable = std::array<std::uint8_t, 256>;

inline std::uint16_t little16(const std::uint8_t* p) {
    return std::uint16_t(p[0]) | (std::uint16_t(p[1]) << 8);
}
inline std::uint32_t little32(const std::uint8_t* p) {
    return std::uint32_t(p[0]) | (std::uint32_t(p[1]) << 8) |
           (std::uint32_t(p[2]) << 16) | (std::uint32_t(p[3]) << 24);
}
inline std::uint32_t crc32(const OpcodeTable& data) {
    std::uint32_t crc = 0xffffffffu;
    for (std::uint8_t value : data) {
        crc ^= value;
        for (int i = 0; i < 8; ++i)
            crc = (crc >> 1) ^ (0xedb88320u & (0u - (crc & 1u)));
    }
    return ~crc;
}
inline bool isPermutation(const OpcodeTable& data) {
    std::array<bool, 256> seen{};
    for (auto byte : data) {
        if (seen[byte]) return false;
        seen[byte] = true;
    }
    return true;
}

// The values identify the exact 0.745 Windows image checked locally. CRC32 and
// headers are compatibility checks, not a cryptographic authenticity check.
inline OpcodeTable readRobloxOpcodeTable(const std::filesystem::path& path) {
    constexpr std::uint64_t expectedFileSize = 142680528;
    constexpr std::uint32_t expectedTimestamp = 0x884cd255;
    constexpr std::uint32_t expectedImageSize = 0x0922a000;
    constexpr std::uint32_t tableRva = 0x071cfba0;
    constexpr std::uint32_t expectedTableCrc32 = 0xf7e9f1fa;

    std::ifstream f(path, std::ios::binary | std::ios::ate);
    if (!f) throw std::runtime_error("Nao foi possivel abrir RobloxPlayerBeta.exe.");
    const auto end = f.tellg();
    if (end < 0 || static_cast<std::uint64_t>(end) != expectedFileSize)
        throw std::runtime_error("Tamanho do cliente nao corresponde a versao suportada.");
    auto read = [&](std::uint64_t offset, std::uint8_t* destination, std::size_t count) {
        if (offset > expectedFileSize || count > expectedFileSize - offset)
            throw std::runtime_error("Estrutura PE ultrapassa o arquivo.");
        f.seekg(static_cast<std::streamoff>(offset), std::ios::beg);
        if (!f.read(reinterpret_cast<char*>(destination), static_cast<std::streamsize>(count)))
            throw std::runtime_error("Falha ao ler o cliente PE.");
    };

    std::array<std::uint8_t, 64> dos{};
    read(0, dos.data(), dos.size());
    if (dos[0] != 'M' || dos[1] != 'Z') throw std::runtime_error("O arquivo nao e um PE valido.");
    const std::uint32_t peOffset = little32(dos.data() + 0x3c);
    std::array<std::uint8_t, 24> pe{};
    read(peOffset, pe.data(), pe.size());
    if (pe[0] != 'P' || pe[1] != 'E' || pe[2] != 0 || pe[3] != 0 || little16(pe.data() + 4) != 0x8664)
        throw std::runtime_error("Esperava um executavel PE x64.");
    const auto sectionCount = little16(pe.data() + 6);
    const auto optionalSize = little16(pe.data() + 20);
    if (sectionCount == 0 || sectionCount > 96 || optionalSize < 60 || little32(pe.data() + 8) != expectedTimestamp)
        throw std::runtime_error("Versao do cliente incompativel ou cabecalho PE invalido.");
    std::array<std::uint8_t, 60> optional{};
    read(static_cast<std::uint64_t>(peOffset) + 24, optional.data(), optional.size());
    if (little16(optional.data()) != 0x20b || little32(optional.data() + 56) != expectedImageSize)
        throw std::runtime_error("A imagem do cliente nao corresponde a versao suportada.");
    const auto sectionStart = static_cast<std::uint64_t>(peOffset) + 24 + optionalSize;
    for (std::uint16_t i = 0; i < sectionCount; ++i) {
        std::array<std::uint8_t, 40> section{};
        read(sectionStart + std::uint64_t(i) * 40, section.data(), section.size());
        const auto rva = little32(section.data() + 12);
        const auto rawSize = little32(section.data() + 16);
        const auto rawAddress = little32(section.data() + 20);
        if (tableRva < rva || static_cast<std::uint64_t>(tableRva) - rva + 256 > rawSize)
            continue;
        OpcodeTable table{};
        read(static_cast<std::uint64_t>(rawAddress) + (tableRva - rva), table.data(), table.size());
        if (!isPermutation(table) || crc32(table) != expectedTableCrc32)
            throw std::runtime_error("Tabela de opcodes desconhecida; atualize a implementacao antes de continuar.");
        return table;
    }
    throw std::runtime_error("Tabela de opcodes nao encontrada no cliente.");
}

class RobloxOpcodeEncoder final : public Luau::BytecodeEncoder {
public:
    explicit RobloxOpcodeEncoder(const OpcodeTable* table = nullptr) : table_(table) {}
    void encode(std::uint32_t* data, std::size_t count) override {
        for (std::size_t i = 0; i < count;) {
            const auto opcode = static_cast<std::uint8_t>(data[i] & 0xffu);
            const auto length = static_cast<std::size_t>(Luau::getOpLength(static_cast<LuauOpcode>(opcode)));
            if (length == 0 || length > count - i)
                throw std::runtime_error("Instrucao Luau invalida no codificador.");
            const auto intermediate = static_cast<std::uint8_t>(opcode * 227u);
            const auto encoded = table_ ? (*table_)[intermediate] : intermediate;
            data[i] = (data[i] & 0xffffff00u) | encoded;
            i += length;
        }
    }
private:
    const OpcodeTable* table_;
};
} // namespace axiom
