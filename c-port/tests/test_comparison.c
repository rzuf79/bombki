#include <assert.h>
#include <stddef.h>
#include <string.h>

#include "bombki/game.h"
#include "bombki/parser.h"
#include "items.h"

typedef struct {
    char text[4096];
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

static GameAction execute(GameState *state, Capture *capture, const char *text)
{
    Command command = parser_parse(text);
    GameOutput output = {capture_write, capture};

    return game_execute(state, &command, output);
}

static void resolve(
    GameState *state,
    Capture *capture,
    const char *target,
    bool used_scroll
)
{
    GameOutput output = {capture_write, capture};

    game_resolve_comparison_target(state, target, used_scroll, output);
}

static void test_training(void)
{
    GameState state;
    Capture capture = {{0}, 0};

    game_initialize(&state);
    state.wisdom = 13;
    assert(execute(&state, &capture, "CWICZ POROWNANIE") == GAME_ACTION_NONE);
    assert(strcmp(capture.text,
        "CWICZYSZ POROWNYWANIE - PRAWDOPODOBIENSTWO JEST TERAZ 30% MASZ 9 PRAKTYK\n"
    ) == 0);
    assert(state.comparison_skill == 30);
    assert(state.practices == 9);
    assert(state.turn == 1);

    memset(&capture, 0, sizeof(capture));
    state.comparison_skill = 90;
    assert(execute(&state, &capture, "CWICZ POROWNANIE") == GAME_ACTION_NONE);
    assert(capture.length == 0);
    assert(state.practices == 9);
    assert(state.turn == 1);
}

static void test_direct_command(void)
{
    GameState state;
    Capture capture = {{0}, 0};

    game_initialize(&state);
    state.comparison_skill = 23;
    state.random_state = 0u;
    assert(execute(&state, &capture, "POROWNAJ") == GAME_ACTION_NONE);
    assert(strcmp(capture.text,
        "POPELNILES PEWNE BLEDY I NIE UDALO SIE WYKONAC CZARU\n"
    ) == 0);
    assert(state.mana == 95);
    assert(state.turn == 1);

    game_initialize(&state);
    memset(&capture, 0, sizeof(capture));
    state.comparison_skill = 100;
    state.level = 22;
    state.strength = 13;
    state.dexterity = 7;
    state.random_state = 0u;
    assert(execute(&state, &capture, "POROWNAJ")
        == GAME_ACTION_COMPARISON_TARGET);
    assert(strcmp(capture.text, "KOGO CHCESZ ZE SOBA POROWNAC?\n") == 0);
    assert(state.mana == 100);
    assert(state.turn == 0);

    memset(&capture, 0, sizeof(capture));
    resolve(&state, &capture, "mini-barman\n", false);
    assert(strcmp(capture.text,
        "JESTES ZNACZNIE SILNIEJSZY !!!(ALE GLUPSZY)\n"
        "UWAZAJ DOSTANIESZ MALO KUNSZTU !!!\n"
    ) == 0);
    assert(state.mana == 90);
    assert(state.turn == 1);
}

static void test_scroll_and_automatic_learning(void)
{
    GameState state;
    Capture capture = {{0}, 0};

    game_initialize(&state);
    state.item_quantities[ITEM_COMPARISON_SCROLL] = 1;
    assert(execute(&state, &capture, "UZYJ SCROLL POROWNYWANIE")
        == GAME_ACTION_COMPARISON_SCROLL_TARGET);
    assert(strcmp(capture.text, "KOGO CHCESZ ZE SOBA POROWNAC?\n") == 0);

    memset(&capture, 0, sizeof(capture));
    resolve(&state, &capture, "bakteria\n", true);
    assert(strcmp(capture.text, "BAKTERIA MA MAGIC RESISTANCE\n") == 0);
    assert(state.mana == 95);
    assert(state.item_quantities[ITEM_COMPARISON_SCROLL] == 0);
    assert(state.turn == 1);

    game_initialize(&state);
    memset(&capture, 0, sizeof(capture));
    state.random_state = 1975u;
    state.item_quantities[ITEM_COMPARISON_SCROLL] = 1;
    assert(execute(&state, &capture, "UZYJ SCROLL POROWNYWANIE")
        == GAME_ACTION_COMPARISON_SCROLL_TARGET);
    memset(&capture, 0, sizeof(capture));
    resolve(&state, &capture, "NIEMA", true);
    assert(strcmp(capture.text,
        "***************** UCZYSZ SIE ZDOLNOSCI POROWNYWANIE *****************\n"
    ) == 0);
    assert(state.comparison_skill == 1);
    assert(state.experience == 5);

    game_initialize(&state);
    memset(&capture, 0, sizeof(capture));
    state.mana = 9;
    state.item_quantities[ITEM_COMPARISON_SCROLL] = 1;
    assert(execute(&state, &capture, "UZYJ SCROLL POROWNYWANIE")
        == GAME_ACTION_NONE);
    assert(capture.length == 0);
    assert(state.mana == 0);
    assert(state.item_quantities[ITEM_COMPARISON_SCROLL] == 0);
    assert(state.turn == 1);
}

static void assert_advice(int score, const char *target, const char *expected)
{
    GameState state;
    Capture capture = {{0}, 0};

    game_initialize(&state);
    state.dexterity = 7;
    state.level = score - state.strength;
    state.random_state = 1u;
    resolve(&state, &capture, target, false);
    assert(strcmp(capture.text, expected) == 0);
}

static void test_advice_groups_and_boundaries(void)
{
    assert_advice(15, "DZIK",
        "NICZEGO NIE MOGE ZAGWARANTOWAC ..... MACIE PODOBNE PARAMETRY\n");
    assert_advice(15, "SLON",
        "TAK  TAK MAMA KUPI BERECIK GLOWKA W PORZADKU ? \n");
    assert_advice(26, "GLADIATOR",
        "TO BEDZIE TAK PROSTE JAK ZABICIE DZIECKA TOPOREM !!!\n");
    assert_advice(21, "TAKSOWKARZ", "");
    assert_advice(36, "ROZA",
        "JESTES SILNIEJSZY STAD WNIOSEK ZE SOBIE PORADZISZ\n"
        "P.S - JESTES DUZO DUZO SILNIEJSZY ZABIJ BEZ OGRODEK!!!\n");
    assert_advice(35, "LIROY", "SPROOBÓJ A MOŻE WYGRAC SIE UDA......\n");
    assert_advice(40, "POKRZYWA",
        "JEST PEWNE PRAWDOPODOBIENSTWO WYGRANIA TEGO STARCIA\n");
    assert_advice(15, "JAMNIK",
        "JASNE ZE MOZESZ GO ZABIC ZABIJ !!! ZABIJ . TEN PARSZYWY PIES NIE MA RACJI BYTU\n"
    );
}

int main(void)
{
    test_training();
    test_direct_command();
    test_scroll_and_automatic_learning();
    test_advice_groups_and_boundaries();
    return 0;
}
