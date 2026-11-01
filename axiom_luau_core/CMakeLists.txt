cmake_minimum_required(VERSION 3.18)
project(AxiomLuauCore LANGUAGES CXX)

set(LUAU_BUILD_CLI OFF CACHE BOOL "" FORCE)
set(LUAU_BUILD_TESTS OFF CACHE BOOL "" FORCE)
set(LUAU_BUILD_WEB OFF CACHE BOOL "" FORCE)
add_subdirectory(vendor/luau EXCLUDE_FROM_ALL)

add_executable(axiom-luau src/main.cpp)
target_compile_features(axiom-luau PRIVATE cxx_std_17)
target_link_libraries(axiom-luau PRIVATE Luau.Compiler Luau.VM)
if(MSVC)
    target_compile_options(axiom-luau PRIVATE /W4 /utf-8)
else()
    target_compile_options(axiom-luau PRIVATE -Wall -Wextra -Wpedantic)
endif()

add_executable(axiom-encoder-test EXCLUDE_FROM_ALL tests/encoder_test.cpp)
target_compile_features(axiom-encoder-test PRIVATE cxx_std_17)
target_link_libraries(axiom-encoder-test PRIVATE Luau.Compiler)

add_executable(axiom-layout-test EXCLUDE_FROM_ALL tests/layout_test.cpp)
target_compile_features(axiom-layout-test PRIVATE cxx_std_17)
