#include "../src/roblox_0745_layout.hpp"
#include <cassert>

using axiom::experimental::ObservedLuaState0745;
using axiom::experimental::plausible_candidate;

int main() {
    ObservedLuaState0745 s{};
    s.base_ci = 0x100000; s.ci = 0x100030; s.end_ci = 0x100090;
    s.global = 0x200000; s.stack = 0x300000; s.base = 0x300010;
    s.top = 0x300020; s.stack_last = 0x300100;
    assert(plausible_candidate(s));
    s.ci = 0x100038; assert(!plausible_candidate(s));
    s.ci = 0x1000c0; assert(!plausible_candidate(s));
    s.ci = 0x100030; s.top = 0x2ffff8; assert(!plausible_candidate(s));
    s.top = 0x300020; s.global = 0; assert(!plausible_candidate(s));
}
