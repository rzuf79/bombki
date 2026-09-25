#include <assert.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>

#include "bombki/game.h"
#include "bombki/parser.h"
#include "items.h"
#include "world.h"

typedef struct {
    char text[2048];
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

static uint32_t next_value(uint32_t state)
{
    return state * UINT32_C(1664525) + UINT32_C(1013904223);
}

static uint32_t seed_for_standard_heart(void)
{
    uint32_t seed;

    for (seed = 0; seed < UINT32_C(1000000); ++seed) {
        uint32_t coin = next_value(seed);
        uint32_t heart = next_value(coin);

        if (heart % 20 < 5) {
            return seed;
        }
    }
    assert(!"could not find deterministic standard reward seed");
    return 0;
}

static uint32_t seed_for_dog_heart(void)
{
    uint32_t seed;

    for (seed = 0; seed < UINT32_C(1000000); ++seed) {
        uint32_t coin = next_value(seed);
        uint32_t heart = next_value(coin);

        if (heart % 20 < 5) {
            return seed;
        }
    }
    assert(!"could not find deterministic dog reward seed");
    return 0;
}

static uint32_t seed_for_all_cage_drops(void)
{
    uint32_t seed;

    for (seed = 0; seed < UINT32_C(1000000); ++seed) {
        uint32_t coin = next_value(seed);
        uint32_t sword = next_value(coin);
        uint32_t shield = next_value(sword);
        uint32_t heart = next_value(shield);

        if (sword % 20 < 10 && shield % 20 < 10 && heart % 20 < 6) {
            return seed;
        }
    }
    assert(!"could not find deterministic cage reward seed");
    return 0;
}

static uint32_t seed_for_mrowka_paczek(void)
{
    uint32_t seed;

    for (seed = 0; seed < UINT32_C(1000000); ++seed) {
        uint32_t coin = next_value(seed);
        uint32_t paczek = next_value(coin);

        if (paczek % 10 < 7) {
            return seed;
        }
    }
    assert(!"could not find deterministic mrowka reward seed");
    return 0;
}

static uint32_t seed_for_trainer_unique_after_coins(void)
{
    uint32_t seed;

    for (seed = 0; seed < UINT32_C(5000000); ++seed) {
        uint32_t coin = next_value(seed);
        uint32_t heart = next_value(coin);
        uint32_t unique = next_value(heart);

        if (heart % 20 >= 5 && unique % 1000 < 26) {
            return seed;
        }
    }
    assert(!"could not find deterministic named reward seed");
    return 0;
}

static void prepare_enemy(
    GameState *state,
    WorldActorId actor,
    int room,
    const char *name
)
{
    game_initialize(state);
    state->room_id = room;
    state->world_actor_rooms[actor] = room;
    assert(game_select_opponent(state, name));
}

static void assert_victory_state(
    const GameState *state,
    WorldActorId defeated_actor
)
{
    assert(state->world_actor_rooms[defeated_actor] == BOMBKI_ROOM_NOWHERE);
    assert(state->active_opponent_actor == BOMBKI_NO_ACTOR);
    assert(state->active_opponent_energy == 0);
    assert(state->active_opponent_maximum_energy == 0);
    assert(state->active_opponent_strength == 0);
    assert(state->active_opponent_dexterity == 0);
    assert(game_state_is_valid(state));
}

static void test_alive_opponent_is_not_resolved(void)
{
    GameState state;
    Capture capture = {{0}, 0};
    GameOutput output = {capture_write, &capture};
    uint32_t random_state;

    prepare_enemy(&state, WORLD_ACTOR_KORNIK, ROOM_ARENA_33, "KORNIK");
    random_state = state.random_state;

    assert(!game_resolve_active_opponent_victory(&state, output));
    assert(state.active_opponent_actor == WORLD_ACTOR_KORNIK);
    assert(state.world_actor_rooms[WORLD_ACTOR_KORNIK] == ROOM_ARENA_33);
    assert(state.random_state == random_state);
    assert(capture.length == 0);
}

static void test_weak_standard_rewards_are_coins_only(void)
{
    GameState state;
    Capture capture = {{0}, 0};
    GameOutput output = {capture_write, &capture};
    char expected[128];
    uint32_t seed = seed_for_standard_heart();
    int coins = (int)(next_value(seed) % 3);

    prepare_enemy(&state, WORLD_ACTOR_KORNIK, ROOM_ARENA_33, "KORNIK");
    state.random_state = seed;
    state.active_opponent_energy = 0;

    assert(game_resolve_active_opponent_victory(&state, output));
    (void)snprintf(expected, sizeof(expected),
        "ZABILES GO ! ZYSKUJESZ ZA TO 9 KUNSZTU \n"
        "WYCIAGASZ %d MONET Z CIALA\n",
        coins
    );
    assert(strcmp(capture.text, expected) == 0);
    assert(state.coins == coins);
    assert(state.experience == 9);
    assert(state.item_quantities[ITEM_BLOODY_HEART] == 0);
    assert(state.item_quantities[ITEM_DOUGHNUT] == 0);
    assert_victory_state(&state, WORLD_ACTOR_KORNIK);
}

static void test_standard_rewards_are_carried(void)
{
    GameState state;
    Capture capture = {{0}, 0};
    GameOutput output = {capture_write, &capture};
    char expected[128];
    uint32_t seed = seed_for_standard_heart();
    int coins = 10 + (int)(next_value(seed) % 21);

    prepare_enemy(&state, WORLD_ACTOR_DZIK, ROOM_ARENA_33, "DZIK");
    state.random_state = seed;
    state.active_opponent_energy = 0;

    assert(game_resolve_active_opponent_victory(&state, output));
    (void)snprintf(expected, sizeof(expected),
        "ZABILES GO ! ZYSKUJESZ ZA TO %d KUNSZTU \n"
        "WYCIAGASZ %d MONET Z CIALA\n"
        "WYCIAGASZ SERCE Z CIALA TRUPA\n",
        state.experience,
        coins
    );
    assert(state.coins == coins);
    assert(state.item_quantities[ITEM_BLOODY_HEART] == 1);
    assert(state.world_object_rooms[WORLD_OBJECT_BLOODY_HEART]
        == BOMBKI_ROOM_NOWHERE);
    assert_victory_state(&state, WORLD_ACTOR_DZIK);
    assert(strcmp(capture.text, expected) == 0);
}

static void test_standard_heart_rewards_stack(void)
{
    GameState state;
    Capture capture = {{0}, 0};
    GameOutput output = {capture_write, &capture};
    char expected[128];
    uint32_t seed = seed_for_standard_heart();
    int coins = 10 + (int)(next_value(seed) % 21);

    prepare_enemy(&state, WORLD_ACTOR_DZIK, ROOM_ARENA_33, "DZIK");
    state.item_quantities[ITEM_BLOODY_HEART] = 1;
    state.random_state = seed;
    state.active_opponent_energy = 0;

    assert(game_resolve_active_opponent_victory(&state, output));
    (void)snprintf(expected, sizeof(expected),
        "ZABILES GO ! ZYSKUJESZ ZA TO %d KUNSZTU \n"
        "WYCIAGASZ %d MONET Z CIALA\n"
        "WYCIAGASZ SERCE Z CIALA TRUPA\n",
        state.experience,
        coins
    );
    assert(strcmp(capture.text, expected) == 0);
    assert(state.coins == coins);
    assert(state.item_quantities[ITEM_BLOODY_HEART] == 2);
    assert_victory_state(&state, WORLD_ACTOR_DZIK);
}

static void test_mrowka_drops_paczek(void)
{
    GameState state;
    Capture capture = {{0}, 0};
    GameOutput output = {capture_write, &capture};
    char expected[128];
    uint32_t seed = seed_for_mrowka_paczek();
    int coins = (int)(next_value(seed) % 3);

    prepare_enemy(&state, WORLD_ACTOR_MROWKA, ROOM_ARENA_33, "MROWKA");
    state.random_state = seed;
    state.active_opponent_energy = 0;

    assert(game_resolve_active_opponent_victory(&state, output));
    (void)snprintf(expected, sizeof(expected),
        "ZABILES GO ! ZYSKUJESZ ZA TO 9 KUNSZTU \n"
        "WYCIAGASZ %d MONET Z CIALA\n"
        "WYCIAGASZ PACZEK Z CIALA MROWKI\n",
        coins
    );
    assert(strcmp(capture.text, expected) == 0);
    assert(state.coins == coins);
    assert(state.experience == 9);
    assert(state.item_quantities[ITEM_DOUGHNUT] == 1);
    assert(state.item_quantities[ITEM_BLOODY_HEART] == 0);
    assert_victory_state(&state, WORLD_ACTOR_MROWKA);
}

static void test_mrowka_drops_paczek_again_when_carrying(void)
{
    GameState state;
    Capture capture = {{0}, 0};
    GameOutput output = {capture_write, &capture};
    char expected[128];
    uint32_t seed = seed_for_mrowka_paczek();
    int coins = (int)(next_value(seed) % 3);

    prepare_enemy(&state, WORLD_ACTOR_MROWKA, ROOM_ARENA_33, "MROWKA");
    state.item_quantities[ITEM_DOUGHNUT] = 1;
    state.random_state = seed;
    state.active_opponent_energy = 0;

    assert(game_resolve_active_opponent_victory(&state, output));
    (void)snprintf(expected, sizeof(expected),
        "ZABILES GO ! ZYSKUJESZ ZA TO 9 KUNSZTU \n"
        "WYCIAGASZ %d MONET Z CIALA\n"
        "WYCIAGASZ PACZEK Z CIALA MROWKI\n",
        coins
    );
    assert(strcmp(capture.text, expected) == 0);
    assert(state.coins == coins);
    assert(state.item_quantities[ITEM_DOUGHNUT] == 2);
    assert_victory_state(&state, WORLD_ACTOR_MROWKA);
}

static void test_dog_rewards_stay_in_the_room(void)
{
    GameState state;
    Capture capture = {{0}, 0};
    GameOutput output = {capture_write, &capture};
    char expected[160];
    uint32_t seed = seed_for_dog_heart();
    int coins = (int)(next_value(seed) % 15);

    prepare_enemy(&state, WORLD_ACTOR_JAMNIK, ROOM_SHOP_STREET, "JAMNIK");
    state.random_state = seed;
    state.active_opponent_energy = 0;

    assert(game_resolve_active_opponent_victory(&state, output));
    (void)snprintf(expected, sizeof(expected),
        "ZABILES GO ! ZYSKUJESZ ZA TO 17 KUNSZTU \n"
        "WYCIAGASZ %d MONET Z CIALA PSA\n"
        "WYCIAGASZ ZAKRWAWIONE SERCE Z CIALA PSA\n",
        coins
    );
    assert(strcmp(capture.text, expected) == 0);
    assert(state.coins == coins);
    assert(state.experience == 17);
    assert(state.item_quantities[ITEM_BLOODY_HEART] == 0);
    assert(state.world_object_rooms[WORLD_OBJECT_BLOODY_HEART]
        == ROOM_SHOP_STREET);
    assert_victory_state(&state, WORLD_ACTOR_JAMNIK);
}

static void test_spaniel_speaks_after_victory(void)
{
    GameState state;
    Capture capture = {{0}, 0};
    GameOutput output = {capture_write, &capture};
    char expected[256];
    int coins = (int)(next_value(1u) % 15);

    prepare_enemy(&state, WORLD_ACTOR_SPANIEL, ROOM_SHOP_STREET, "SPANIEL");
    state.item_quantities[ITEM_BLOODY_HEART] = 1;
    state.random_state = 1u;
    state.active_opponent_energy = 0;

    assert(game_resolve_active_opponent_victory(&state, output));
    (void)snprintf(expected, sizeof(expected),
        "ZABILES GO ! ZYSKUJESZ ZA TO 17 KUNSZTU \n"
        "WYCIAGASZ %d MONET Z CIALA PSA\n"
        "GDY NAGLE!!!! NIEBIOSA SIE OTWIERAJA\n"
        "A SPANIEL PRZEMAWIA DO CIEBIE LUDZKIM GLOSEM !!!!!\n"
        "HAU HAU CHAMIE PO CO MNIE ZABILES ??? \n",
        coins
    );
    assert(strcmp(capture.text, expected) == 0);
    assert_victory_state(&state, WORLD_ACTOR_SPANIEL);
}

static void test_school_completion_places_diploma_in_teleporter(void)
{
    GameState state;
    Capture capture = {{0}, 0};
    GameOutput output = {capture_write, &capture};
    Command command;

    prepare_enemy(&state, WORLD_ACTOR_CAGE_ALL, ROOM_CAGE_ALL, "POTWOR");
    state.world_actor_rooms[WORLD_ACTOR_CAGE_WEAK] = BOMBKI_ROOM_NOWHERE;
    state.world_actor_rooms[WORLD_ACTOR_CAGE_DEXTEROUS] = BOMBKI_ROOM_NOWHERE;
    state.world_actor_rooms[WORLD_ACTOR_CAGE_RESISTANT] = BOMBKI_ROOM_NOWHERE;
    state.world_actor_rooms[WORLD_ACTOR_CAGE_STRONG] = BOMBKI_ROOM_NOWHERE;
    state.active_opponent_energy = 0;

    assert(game_resolve_active_opponent_victory(&state, output));
    assert(state.world_object_rooms[WORLD_OBJECT_SCHOOL_DIPLOMA]
        == BOMBKI_ROOM_NOWHERE);

    command = parser_parse("DOL");
    (void)game_execute(&state, &command, output);
    command = parser_parse("DOL");
    (void)game_execute(&state, &command, output);

    assert(state.room_id == ROOM_TELEPORT);
    assert(state.world_object_rooms[WORLD_OBJECT_SCHOOL_DIPLOMA]
        == ROOM_TELEPORT);
    assert(strstr(capture.text,
        "W TYM POKOJU ZNAJDUJE SIE !DYPLOM! MUD SZKOLY"
    ) != NULL);
    assert(game_state_is_valid(&state));
}

static void test_cage_rewards_use_original_roll_order(void)
{
    GameState state;
    Capture capture = {{0}, 0};
    GameOutput output = {capture_write, &capture};
    char expected[512];
    uint32_t seed = seed_for_all_cage_drops();
    int coins = (int)(next_value(seed) % 30);

    prepare_enemy(&state, WORLD_ACTOR_CAGE_ALL, ROOM_CAGE_ALL, "POTWOR");
    state.random_state = seed;
    state.active_opponent_energy = 0;

    assert(game_resolve_active_opponent_victory(&state, output));
    (void)snprintf(expected, sizeof(expected),
        "ZABILES GO ! ZYSKUJESZ ZA TO 30 KUNSZTU \n"
        "WYCIAGASZ %d MONET Z CIALA POTWORA\n"
        "WYCIAGASZ STARY ZARDZEWIALY MIECZ Z CIALA POTWORA\n"
        "WYCIAGASZ ZWYKLA MALA TARCZA Z CIALA POTWORA\n"
        "WYCIAGASZ ZAKRWAWIONE SERCE Z CIALA POTWORA\n",
        coins
    );
    assert(strcmp(capture.text, expected) == 0);
    assert(state.coins == coins);
    assert(state.experience == 30);
    assert(state.world_object_rooms[WORLD_OBJECT_OLD_SWORD] == ROOM_CAGE_ALL);
    assert(state.world_object_rooms[WORLD_OBJECT_SMALL_SHIELD] == ROOM_CAGE_ALL);
    assert(state.world_object_rooms[WORLD_OBJECT_BLOODY_HEART] == ROOM_CAGE_ALL);
    assert(state.item_quantities[ITEM_OLD_SWORD] == 0);
    assert(state.item_quantities[ITEM_SMALL_SHIELD] == 0);
    assert(state.item_quantities[ITEM_BLOODY_HEART] == 0);
    assert_victory_state(&state, WORLD_ACTOR_CAGE_ALL);
}

static void test_named_loot_follows_ordinary_rewards(void)
{
    GameState state;
    Capture capture = {{0}, 0};
    GameOutput output = {capture_write, &capture};
    char expected[256];
    uint32_t seed = seed_for_trainer_unique_after_coins();
    int coins = 20 + (int)(next_value(seed) % 40);

    prepare_enemy(&state, WORLD_ACTOR_TRENER, ROOM_ARENA_57, "TRENER");
    state.item_quantities[ITEM_BLOODY_HEART] = 1;
    state.random_state = seed;
    state.active_opponent_maximum_energy = 60;
    state.active_opponent_strength = 15;
    state.active_opponent_dexterity = 12;
    state.active_opponent_energy = 0;

    assert(game_resolve_active_opponent_victory(&state, output));
    (void)snprintf(expected, sizeof(expected),
        "ZABILES GO ! ZYSKUJESZ ZA TO 44 KUNSZTU \n"
        "WYCIAGASZ %d MONET Z CIALA\n"
        "ZYSKUJESZ GARNITUR !!!! Z CIALA WROGA !!!!\n"
        "PRZEDMIOT UNIQE !!! 2.5%% !!! \n",
        coins
    );
    assert(strcmp(capture.text, expected) == 0);
    assert(state.coins == coins);
    assert(state.experience == 44);
    assert(state.item_quantities[ITEM_SPIKED_SUIT] == 1);
    assert_victory_state(&state, WORLD_ACTOR_TRENER);
}

int main(void)
{
    test_alive_opponent_is_not_resolved();
    test_weak_standard_rewards_are_coins_only();
    test_standard_rewards_are_carried();
    test_standard_heart_rewards_stack();
    test_mrowka_drops_paczek();
    test_mrowka_drops_paczek_again_when_carrying();
    test_dog_rewards_stay_in_the_room();
    test_spaniel_speaks_after_victory();
    test_cage_rewards_use_original_roll_order();
    test_school_completion_places_diploma_in_teleporter();
    test_named_loot_follows_ordinary_rewards();
    return 0;
}
