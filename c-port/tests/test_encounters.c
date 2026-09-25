#include <assert.h>
#include <stdint.h>
#include <string.h>

#include "bombki/game.h"
#include "bombki/parser.h"
#include "world.h"

typedef struct {
    char text[256];
    size_t length;
} Capture;

static void capture_write(void *context, const char *text)
{
    Capture *capture = context;
    size_t available = sizeof(capture->text) - capture->length - 1;
    size_t length = strlen(text);

    if (length > available) {
        length = available;
    }
    memcpy(capture->text + capture->length, text, length);
    capture->length += length;
    capture->text[capture->length] = '\0';
}

static uint32_t expected_random(uint32_t *state, uint32_t limit)
{
    *state = *state * UINT32_C(1664525) + UINT32_C(1013904223);
    return *state % limit;
}

static void test_variable_profile_is_rolled_once(void)
{
    GameState state;
    uint32_t expected_state = 123u;
    int expected_energy = 50 + (int)expected_random(&expected_state, 5);
    int expected_dexterity = 10 + (int)expected_random(&expected_state, 5);
    int expected_strength = 13 + (int)expected_random(&expected_state, 2);

    game_initialize(&state);
    state.room_id = ROOM_ARENA_33;
    state.world_actor_rooms[WORLD_ACTOR_SLON] = state.room_id;
    state.random_state = 123u;

    assert(game_select_opponent(&state, "SLON"));
    assert(state.active_opponent_actor == WORLD_ACTOR_SLON);
    assert(state.active_opponent_energy == expected_energy);
    assert(state.active_opponent_maximum_energy == expected_energy);
    assert(state.active_opponent_strength == expected_strength);
    assert(state.active_opponent_dexterity == expected_dexterity);
    assert(state.random_state == expected_state);
    assert(game_state_is_valid(&state));

    assert(game_select_opponent(&state, "SLON"));
    assert(state.random_state == expected_state);
    assert(state.active_opponent_energy == expected_energy);
    assert(!game_select_opponent(&state, "NIEMA"));
    assert(state.random_state == expected_state);
    assert(state.active_opponent_actor == WORLD_ACTOR_SLON);
}

static void test_fixed_profiles_do_not_advance_rng(void)
{
    GameState state;

    game_initialize(&state);
    state.room_id = ROOM_CAGE_DEXTEROUS;
    state.random_state = 987u;

    assert(game_select_opponent(&state, "POTWOR"));
    assert(state.active_opponent_actor == WORLD_ACTOR_CAGE_DEXTEROUS);
    assert(state.active_opponent_energy == 20);
    assert(state.active_opponent_maximum_energy == 20);
    assert(state.active_opponent_strength == 3);
    assert(state.active_opponent_dexterity == 30);
    assert(state.random_state == 987u);
    assert(game_state_is_valid(&state));
}

static void test_attack_enters_combat_and_blocks_movement(void)
{
    GameState state;
    Capture capture = {{0}, 0};
    GameOutput output = {capture_write, &capture};
    Command command;

    game_initialize(&state);
    state.room_id = ROOM_ARENA_33;
    state.world_actor_rooms[WORLD_ACTOR_KORNIK] = state.room_id;
    state.strength = 1;
    state.random_state = 1u;

    command = parser_parse("ZABIJ KORNIK");
    (void)game_execute(&state, &command, output);
    assert(state.active_opponent_actor == WORLD_ACTOR_KORNIK);
    assert(state.active_opponent_energy == 1);
    assert(state.active_opponent_strength == 2);
    assert(state.active_opponent_dexterity == 1);
    assert(state.turn == 1);
    assert(strcmp(capture.text,
        "WALCZYSZ - <<<<TWOJ WROG MA 1%>>>><<<< A TY MASZ 50% ENERGII>>>>>\n"
        "UNIKASZ CIOSU WROGA TWEGO I SMIEJESZ SIE Z JEGO NIEPORADNOSCI\n"
        "MASZ PECHA : LEKKO POPCHNALES GO I STRACIL TYLKO 0% ENERGII\n"
    ) == 0);

    command = parser_parse("N");
    (void)game_execute(&state, &command, output);
    assert(state.room_id == ROOM_ARENA_33);
    assert(state.turn == 1);
    assert(state.active_opponent_actor == WORLD_ACTOR_KORNIK);
    assert(strstr(capture.text,
        "WALCZYSZ I NIE MOZESZ TERAZ TEGO ZROBIC!\n"
    ) != NULL);

    command = parser_parse("");
    (void)game_execute(&state, &command, output);
    assert(state.turn == 2);
}

static void test_regeneration_and_validation(void)
{
    GameState state;

    game_initialize(&state);
    state.room_id = ROOM_CAGE_WEAK;
    assert(game_select_opponent(&state, "POTWOR"));
    game_regenerate_encounters(&state);
    assert(state.active_opponent_actor == BOMBKI_NO_ACTOR);
    assert(game_state_is_valid(&state));

    state.active_opponent_energy = 1;
    assert(!game_state_is_valid(&state));
    game_clear_active_opponent(&state);
    assert(game_state_is_valid(&state));

    state.room_id = ROOM_START;
    state.active_opponent_actor = WORLD_ACTOR_CAGE_WEAK;
    state.active_opponent_energy = 20;
    state.active_opponent_maximum_energy = 20;
    state.active_opponent_strength = 3;
    state.active_opponent_dexterity = 3;
    assert(!game_state_is_valid(&state));
}

int main(void)
{
    test_variable_profile_is_rolled_once();
    test_fixed_profiles_do_not_advance_rng();
    test_attack_enters_combat_and_blocks_movement();
    test_regeneration_and_validation();
    return 0;
}
