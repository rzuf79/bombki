cmake_minimum_required(VERSION 3.16)

project(bombki_port VERSION 0.1.0 LANGUAGES C)

set(CMAKE_C_STANDARD 11)
set(CMAKE_C_STANDARD_REQUIRED ON)
set(CMAKE_C_EXTENSIONS OFF)

add_library(bombki_core
    src/enemies.c
    src/game.c
    src/items.c
    src/parser.c
    src/persistence.c
    src/world.c
)

target_include_directories(bombki_core
    PUBLIC include
    PRIVATE src
)

target_compile_options(bombki_core PRIVATE -Wall -Wextra -Wpedantic -Wno-missing-field-initializers)

add_executable(bombki
    src/main.c
    src/terminal.c
)

target_include_directories(bombki PRIVATE src)
target_link_libraries(bombki PRIVATE bombki_core)

target_compile_options(bombki PRIVATE -Wall -Wextra -Wpedantic)

include(CTest)

if(BUILD_TESTING)
    add_executable(test_comparison tests/test_comparison.c)
    target_include_directories(test_comparison PRIVATE src)
    target_link_libraries(test_comparison PRIVATE bombki_core)
    add_test(NAME comparison COMMAND test_comparison)

    add_executable(test_combat tests/test_combat.c)
    target_include_directories(test_combat PRIVATE src)
    target_link_libraries(test_combat PRIVATE bombki_core)
    add_test(NAME combat COMMAND test_combat)

    add_executable(test_encounters tests/test_encounters.c)
    target_include_directories(test_encounters PRIVATE src)
    target_link_libraries(test_encounters PRIVATE bombki_core)
    add_test(NAME encounters COMMAND test_encounters)

    add_executable(test_enemies tests/test_enemies.c)
    target_include_directories(test_enemies PRIVATE src)
    target_link_libraries(test_enemies PRIVATE bombki_core)
    add_test(NAME enemies COMMAND test_enemies)

    add_executable(test_parser tests/test_parser.c)
    target_link_libraries(test_parser PRIVATE bombki_core)
    add_test(NAME parser COMMAND test_parser)

    add_executable(test_game tests/test_game.c)
    target_include_directories(test_game PRIVATE src)
    target_link_libraries(test_game PRIVATE bombki_core)
    add_test(NAME game COMMAND test_game)

    add_executable(test_items tests/test_items.c)
    target_include_directories(test_items PRIVATE src)
    target_link_libraries(test_items PRIVATE bombki_core)
    add_test(NAME items COMMAND test_items)

    add_executable(test_item_actions tests/test_item_actions.c)
    target_include_directories(test_item_actions PRIVATE src)
    target_link_libraries(test_item_actions PRIVATE bombki_core)
    add_test(NAME item-actions COMMAND test_item_actions)

    add_executable(test_shops tests/test_shops.c)
    target_include_directories(test_shops PRIVATE src)
    target_link_libraries(test_shops PRIVATE bombki_core)
    add_test(NAME shops COMMAND test_shops)

    add_executable(test_loot tests/test_loot.c)
    target_include_directories(test_loot PRIVATE src)
    target_link_libraries(test_loot PRIVATE bombki_core)
    add_test(NAME loot COMMAND test_loot)

    add_executable(test_player tests/test_player.c)
    target_link_libraries(test_player PRIVATE bombki_core)
    add_test(NAME player COMMAND test_player)

    add_executable(test_persistence tests/test_persistence.c)
    target_include_directories(test_persistence PRIVATE src)
    target_link_libraries(test_persistence PRIVATE bombki_core)
    add_test(NAME persistence COMMAND test_persistence)

    add_executable(test_turns tests/test_turns.c)
    target_link_libraries(test_turns PRIVATE bombki_core)
    add_test(NAME turns COMMAND test_turns)

    add_executable(test_victory tests/test_victory.c)
    target_include_directories(test_victory PRIVATE src)
    target_link_libraries(test_victory PRIVATE bombki_core)
    add_test(NAME victory COMMAND test_victory)

    add_executable(test_world tests/test_world.c)
    target_include_directories(test_world PRIVATE src)
    target_link_libraries(test_world PRIVATE bombki_core)
    add_test(NAME world COMMAND test_world)

    find_package(Python3 3.10 QUIET COMPONENTS Interpreter)
    if(Python3_Interpreter_FOUND)
        add_test(
            NAME evidence
            COMMAND "${Python3_EXECUTABLE}" "${CMAKE_CURRENT_SOURCE_DIR}/tests/test_evidence.py"
        )
        add_test(
            NAME evidence-generated-files
            COMMAND
                "${Python3_EXECUTABLE}" "${CMAKE_CURRENT_SOURCE_DIR}/tools/evidence.py"
                --source "${CMAKE_CURRENT_SOURCE_DIR}/../og"
                --output "${CMAKE_CURRENT_SOURCE_DIR}/evidence/generated"
                --check
        )
    endif()
endif()

install(TARGETS bombki RUNTIME DESTINATION bin)
