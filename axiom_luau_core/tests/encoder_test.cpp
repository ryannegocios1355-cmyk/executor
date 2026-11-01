#include "../src/roblox_bytecode.hpp"
#include <cassert>
#include <cstdint>
#include <stdexcept>

int main() {
    axiom::OpcodeTable table{};
    for (std::size_t i = 0; i < table.size(); ++i) table[i] = static_cast<std::uint8_t>(255 - i);
    assert(axiom::isPermutation(table));
    const auto oldFirst = table[0];
    table[0] = table[1];
    assert(!axiom::isPermutation(table));
    table[0] = oldFirst;

    const std::uint32_t op1 = 0x12345600u | LOP_LOADN;
    const std::uint32_t op2 = 0x23456700u | LOP_GETGLOBAL;
    const std::uint32_t aux = 0xdeadbeefu;
    const std::uint32_t op3 = 0x34567800u | LOP_RETURN;
    std::uint32_t words[] = {op1, op2, aux, op3};
    axiom::RobloxOpcodeEncoder encoder(&table);
    encoder.encode(words, 4);
    const auto transform = [&](std::uint32_t op) {
        return (op & 0xffffff00u) | table[static_cast<std::uint8_t>((op & 0xffu) * 227u)];
    };
    assert(words[0] == transform(op1));
    assert(words[1] == transform(op2));
    assert(words[2] == aux);
    assert(words[3] == transform(op3));

    std::uint32_t truncated[] = {static_cast<std::uint32_t>(LOP_GETGLOBAL)};
    try { encoder.encode(truncated, 1); assert(false); }
    catch (const std::runtime_error&) {}
}
