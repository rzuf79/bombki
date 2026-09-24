#include <assert.h>
#include <stddef.h>
#include <stdint.h>
#include <string.h>

#include "bombki/game.h"
#include "items.h"

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

static uint32_t seed_for_roll(size_t limit, size_t maximum)
{
    uint32_t seed;

    for (seed = 0; seed < UINT32_C(1000000); ++seed) {
        if ((size_t)(next_value(seed) % (uint32_t)limit) <= maximum) {
            return seed;
        }
    }
    assert(!"could not find deterministic loot seed");
    return 0;
}

static uint32_t seed_for_nettle_success(void)
{
    uint32_t seed;

    for (seed = 0; seed < UINT32_C(1000000); ++seed) {
        uint32_t first = next_value(seed);
        uint32_t second = next_value(first);
        uint32_t third = next_value(second);

        if (first % 100 < 6 && second % 1000 < 43 && third % 100 < 10) {
            return seed;
        }
    }
    assert(!"could not find deterministic nettle seed");
    return 0;
}

static void test_named_unique_routines(void)
{
    GameState state;
    Capture capture = {{0}, 0};
    GameOutput output = {capture_write, &capture};

    game_initialize(&state);
    state.random_state = seed_for_roll(1000, 25);
    assert(game_resolve_enemy_loot(&state, GAME_LOOT_TRENER, output) == 1);
    assert(strcmp(capture.text,
        "ZYSKUJESZ GARNITUR !!!! Z CIALA WROGA !!!!\n"
        "PRZEDMIOT UNIQE !!! 2.5% !!! \n") == 0);
    assert(state.item_quantities[ITEM_SPIKED_SUIT] == 1);

    game_initialize(&state);
    memset(&capture, 0, sizeof(capture));
    state.random_state = seed_for_roll(1000, 42);
    assert(game_resolve_enemy_loot(&state, GAME_LOOT_GLADIATOR, output) == 1);
    assert(strcmp(capture.text,
        "HMMM , A TO CO ? , TOZ TO !!! PIGULKA TRANSPORTUJACA !!! PROSTO Z CIALA WROGA\n")
        == 0);
    assert(state.item_quantities[ITEM_TRANSPORT_PILL] == 1);

    game_initialize(&state);
    memset(&capture, 0, sizeof(capture));
    state.random_state = seed_for_roll(100, 1);
    assert(game_resolve_enemy_loot(&state, GAME_LOOT_LIROY, output) == 1);
    assert(strcmp(capture.text,
        "WYCIAGASZ KASETE LIROYA Z CIALA BIEDNEGO CZLOWIEKA\n"
        "!!! PRZEDMIOT UNIQE 2% !!!\n") == 0);
    assert(state.item_quantities[ITEM_LIROY_CASSETTE] == 1);
    assert(state.maximum_energy == 55);
    assert(state.dexterity == 11);
}

static void test_nettle_drop_order(void)
{
    GameState state;
    Capture capture = {{0}, 0};
    GameOutput output = {capture_write, &capture};

    game_initialize(&state);
    state.random_state = seed_for_nettle_success();
    assert(game_resolve_enemy_loot(&state, GAME_LOOT_POKRZYWA, output) == 3);
    assert(strcmp(capture.text,
        "WYCIAGASZ LISTEK SZCZESCIA Z CIALA WROGIEJ TOBIE POSTACI\n"
        "!!! PRZEDMIOT UNIQE 4% !!!\n"
        "HMMM , A TO CO ? , TOZ TO !!! PIGULKA TRANSPORTUJACA !!! PROSTO Z CIALA WROGA\n"
        "WYCIAGASZ SCROLL POROWNANIA Z WROGIEJ TOBIE POSTACI\n") == 0);
    assert(state.item_quantities[ITEM_LUCKY_LEAF] == 1);
    assert(state.item_quantities[ITEM_TRANSPORT_PILL] == 1);
    assert(state.item_quantities[ITEM_COMPARISON_SCROLL] == 1);
    assert(state.maximum_mana == 140);
}

static void test_dj_nested_drop(void)
{
    GameState state;
    Capture capture = {{0}, 0};
    GameOutput output = {capture_write, &capture};

    game_initialize(&state);
    state.random_state = seed_for_roll(100, 2);
    assert(game_resolve_enemy_loot(&state, GAME_LOOT_DJ, output) == 2);
    assert(strcmp(capture.text,
        "WYCIAGASZ SUCHA RACJA Z CIALA D.J-a\n"
        "WYCIAGASZ KASETE LIROYA Z CIALA D.J-a\n"
        "!!! PRZEDMIOT UNIQE 3% !!!\n") == 0);
    assert(state.item_quantities[ITEM_DRY_RATION] == 1);
    assert(state.item_quantities[ITEM_LIROY_CASSETTE] == 1);
}

static void test_source_groups(void)
{
    static const GameLootSource suit_sources[] = {
        GAME_LOOT_TAKSOWKARZ,
        GAME_LOOT_SPRZEDAWCA,
        GAME_LOOT_GORYL,
        GAME_LOOT_OCHRONIARZ,
        GAME_LOOT_TRENER
    };
    static const GameLootSource pill_sources[] = {
        GAME_LOOT_PEDAL,
        GAME_LOOT_GLADIATOR,
        GAME_LOOT_WOJOWNIK
    };
    static const GameLootSource cassette_sources[] = {
        GAME_LOOT_PERKUSISTA,
        GAME_LOOT_GITARZYSTA,
        GAME_LOOT_LIROY,
        GAME_LOOT_ORGANISTA
    };
    size_t index;

    for (index = 0; index < sizeof(suit_sources) / sizeof(suit_sources[0]); ++index) {
        GameState state;
        GameOutput output = {NULL, NULL};

        game_initialize(&state);
        state.random_state = seed_for_roll(1000, 25);
        assert(game_resolve_enemy_loot(&state, suit_sources[index], output) == 1);
        assert(state.item_quantities[ITEM_SPIKED_SUIT] == 1);
    }
    for (index = 0; index < sizeof(pill_sources) / sizeof(pill_sources[0]); ++index) {
        GameState state;
        GameOutput output = {NULL, NULL};

        game_initialize(&state);
        state.random_state = seed_for_roll(1000, 42);
        assert(game_resolve_enemy_loot(&state, pill_sources[index], output) == 1);
        assert(state.item_quantities[ITEM_TRANSPORT_PILL] == 1);
    }
    for (index = 0;
         index < sizeof(cassette_sources) / sizeof(cassette_sources[0]);
         ++index) {
        GameState state;
        GameOutput output = {NULL, NULL};

        game_initialize(&state);
        state.random_state = seed_for_roll(100, 1);
        assert(game_resolve_enemy_loot(
            &state, cassette_sources[index], output
        ) == 1);
        assert(state.item_quantities[ITEM_LIROY_CASSETTE] == 1);
    }
}

static void test_invalid_source_does_nothing(void)
{
    GameState state;
    Capture capture = {{0}, 0};
    GameOutput output = {capture_write, &capture};
    uint32_t random_state;

    game_initialize(&state);
    random_state = state.random_state;
    assert(game_resolve_enemy_loot(
        &state, (GameLootSource)GAME_LOOT_SOURCE_COUNT, output
    ) == 0);
    assert(capture.text[0] == '\0');
    assert(state.random_state == random_state);
}

int main(void)
{
    test_named_unique_routines();
    test_nettle_drop_order();
    test_dj_nested_drop();
    test_source_groups();
    test_invalid_source_does_nothing();
    return 0;
}
