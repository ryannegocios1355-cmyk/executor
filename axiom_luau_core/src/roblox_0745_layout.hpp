#pragma once

// Experimental layout hypotheses for the desktop image whose SHA-256 is
// a5a13a9e4f578fce0675e0dfc3edcdaad639dcb3e306badeb9df597010ca6229.
// The observed 0x30, 0x38, 0x18, 0x48 and 0x50 accesses are consistent with
// one captured runtime sample. Field identities and the rest of this layout
// remain unverified. This header does not read or modify a Roblox process.

#include <cstddef>
#include <cstdint>

namespace axiom::experimental {
struct ObservedCallInfo0745 {
    std::uint64_t proto;
    std::uint64_t function;
    std::uint64_t base;
    std::uint64_t top;
    std::uint64_t saved_pc_or_error;
    std::int32_t results;
    std::uint32_t flags;
};

struct ObservedLuaState0745 {
    std::uint8_t header[3];
    std::uint8_t status;
    std::uint8_t bookkeeping[12];
    std::uint64_t end_ci;
    std::uint64_t base_ci;
    std::uint64_t userdata;
    std::uint64_t gc_list;
    std::uint64_t ci;
    std::uint64_t global;
    std::uint64_t stack;
    std::uint64_t top;
    std::uint64_t base;
    std::uint64_t stack_last;
    std::uint64_t finalizers;
    std::uint64_t namecall;
    std::uint32_t encoded_stack_size;
    std::uint32_t call_info_size;
    std::uint64_t open_upvalues;
    std::uint64_t globals;
    std::uint8_t trailing[8];
};

static_assert(sizeof(ObservedCallInfo0745) == 0x30);
static_assert(offsetof(ObservedCallInfo0745, flags) == 0x2c);
static_assert(offsetof(ObservedLuaState0745, status) == 0x03);
static_assert(offsetof(ObservedLuaState0745, base_ci) == 0x18);
static_assert(offsetof(ObservedLuaState0745, ci) == 0x30);
static_assert(offsetof(ObservedLuaState0745, global) == 0x38);
static_assert(offsetof(ObservedLuaState0745, top) == 0x48);
static_assert(offsetof(ObservedLuaState0745, base) == 0x50);
static_assert(sizeof(ObservedLuaState0745) == 0x90);

constexpr bool candidate_address(std::uint64_t p) {
    return p >= 0x10000 && p < 0x0000800000000000ULL && (p & 7) == 0;
}

// This is only a rejection heuristic on a copied snapshot. Passing it is NOT
// evidence that the object is a lua_State or that using it would be safe.
constexpr bool plausible_candidate(const ObservedLuaState0745& s) {
    return candidate_address(s.base_ci) && candidate_address(s.ci) &&
        candidate_address(s.end_ci) && candidate_address(s.global) &&
        candidate_address(s.stack) && candidate_address(s.base) &&
        candidate_address(s.top) && candidate_address(s.stack_last) &&
        s.base_ci <= s.ci && s.ci <= s.end_ci &&
        (s.ci - s.base_ci) % sizeof(ObservedCallInfo0745) == 0 &&
        s.stack <= s.base && s.base <= s.top && s.stack <= s.stack_last &&
        s.top <= s.stack_last + 80;
}
} // namespace axiom::experimental
