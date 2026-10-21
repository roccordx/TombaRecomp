cmake_minimum_required(VERSION 3.20)
project(TombiPAL LANGUAGES C CXX)

set(PSXRECOMP_ROOT "${CMAKE_CURRENT_SOURCE_DIR}/../psxrecomp" CACHE PATH "Path to psxrecomp")
set(PSX_RECOMP_UI OFF CACHE BOOL "Disable launcher UI for initial PAL build")
set(PSX_NETPLAY OFF CACHE BOOL "Disable netplay for initial PAL build")
set(PSX_SETUP_WIZARD OFF CACHE BOOL "Disable setup wizard")

include("${PSXRECOMP_ROOT}/runtime/runtime.cmake")

psxrecomp_add_game_runtime(psx-runtime
    WINDOW_TITLE "TOMBI! Recompiled PAL"
    DEFAULT_GAME_CONFIG_PATH "pal_ita/game.toml"
    MAX_PLAYERS 1
    GEN_MARKER "generated/SCES_013.30_dispatch.c"
    GEN_FULL_GLOB "generated/SCES_013.30_full_*.c"
)
