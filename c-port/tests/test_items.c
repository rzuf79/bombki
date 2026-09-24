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

static void assert_capacity(GameState *state, int dexterity, int expected)
{
    state->dexterity = dexterity;
    assert(game_carrying_capacity(state) == expected);
}

int main(void)
{
    static const ItemDefinition expected_items[] = {
        {ITEM_OLD_SWORD, "STARY", NULL, "STARY ZARDZEWIALY MIECZ",
         ITEM_STORAGE_WORLD_LOCATION, true},
        {ITEM_SMALL_SHIELD, "MALA", NULL, "OKRAGLA MALA TARCZA",
         ITEM_STORAGE_WORLD_LOCATION, true},
        {ITEM_BLOODY_HEART, "SERCE", NULL, "ZAKRWAWIONE SERCE",
         ITEM_STORAGE_WORLD_LOCATION, true},
        {ITEM_SCHOOL_DIPLOMA, "DYPLOM", NULL, "DYPLOM MUD SZKOLY",
         ITEM_STORAGE_WORLD_LOCATION, true},
        {ITEM_PIPE, "FAJKA", NULL, "CIEZKA FAJKA OD DZIADA MROZA",
         ITEM_STORAGE_WORLD_LOCATION, true},
        {ITEM_DOUGHNUT, "PACZEK", NULL, "SMACZNY POLANY LIKIEREM PACZEK",
         ITEM_STORAGE_QUANTITY, true},
        {ITEM_CAKE, "CIASTKO", NULL, "SMACZNE CIASTKO ",
         ITEM_STORAGE_QUANTITY, true},
        {ITEM_DRY_RATION, "SUCHA RACJA", NULL, "TWARDA SUCHA RACJE",
         ITEM_STORAGE_QUANTITY, true},
        {ITEM_ROLL, "BULKA", NULL, "OKRAGLA PACHNACA BULKA",
         ITEM_STORAGE_QUANTITY, true},
        {ITEM_BREAD, "CHLEB", NULL, "DUZY CIEPLY CHLEB",
         ITEM_STORAGE_QUANTITY, true},
        {ITEM_WEKA, "WEKA", NULL, "DLUGA I SMACZNA WEKE",
         ITEM_STORAGE_QUANTITY, true},
        {ITEM_BIGOS, "BIGOS", NULL, "PYSZNY BIGOS Z KAPUSTA Z WROGA",
         ITEM_STORAGE_QUANTITY, true},
        {ITEM_BEER, "PIWO", NULL, "OZEWIAJACE PIWSKO Z KONKRETNYM KLIMATEM",
         ITEM_STORAGE_QUANTITY, true},
        {ITEM_CLOTHES, "KOMPLET", NULL, "KOMPLET UBRAN FIRMY \"SYF\"",
         ITEM_STORAGE_QUANTITY, true},
        {ITEM_SPIKED_SUIT, "GARNITUR", NULL, "GARNITUR Z KOLCAMI",
         ITEM_STORAGE_QUANTITY, true},
        {ITEM_SMALL_MANA_BOTTLE, "MALA BUTELKA MANY", NULL,
         "MALA BUTELKE MANY", ITEM_STORAGE_QUANTITY, true},
        {ITEM_LUCKY_LEAF, "LISTEK", NULL, "DELIKATNY CHOC SZORSTKI LISTEK",
         ITEM_STORAGE_QUANTITY, true},
        {ITEM_LIROY_CASSETTE, "KASETA", NULL,
         "KASETA LIROYA : L - JAK LIROY ", ITEM_STORAGE_QUANTITY, true},
        {ITEM_TRANSPORT_PILL, "PIGULKA", "PIGULKA TRANSPORTUJACA",
         "PIGULKA TRANSPORTUJACA (M:G) ", ITEM_STORAGE_QUANTITY, true},
        {ITEM_QUEST_PASS, "PRZEPUSTKA", "DOKUMENT",
         "PRZEPUSTKA WLASNORECZNIE PODPISANA PRZEZ QUEST-MASTERA ",
         ITEM_STORAGE_QUANTITY, true},
        {ITEM_COMPARISON_SCROLL, "SCROLL POROWNYWANIE", NULL,
         "SCROLL Z CZAREM : POROWNYWANIE ", ITEM_STORAGE_QUANTITY, true},
        {ITEM_RETURN_SCROLL, "SCROLL POWROT", NULL,
         "SCROLL Z CZAREM : POWROT ", ITEM_STORAGE_QUANTITY, true},
        {ITEM_BACKPACK, "PLECAK", NULL, NULL, ITEM_STORAGE_CAPACITY_UPGRADE,
         false}
    };
    static const struct {
        int dexterity;
        int capacity;
    } boundaries[] = {
        {10, 10}, {11, 11}, {12, 11}, {13, 12}, {15, 12}, {16, 13},
        {18, 13}, {19, 14}, {20, 14}, {21, 15}, {24, 15}, {25, 16}
    };
    GameState state;
    size_t index;

    assert(item_count() == ITEM_COUNT);
    assert(sizeof(expected_items) / sizeof(expected_items[0]) == ITEM_COUNT);
    for (index = 0; index < item_count(); ++index) {
        const ItemDefinition *item = item_at(index);
        const ItemDefinition *expected = &expected_items[index];

        assert(item != NULL);
        assert(item->id == expected->id);
        assert(strcmp(item->command_name, expected->command_name) == 0);
        assert(item->storage == expected->storage);
        assert(item->shown_in_inventory == expected->shown_in_inventory);
        if (expected->alternate_command_name == NULL) {
            assert(item->alternate_command_name == NULL);
        } else {
            assert(strcmp(item->alternate_command_name,
                expected->alternate_command_name) == 0);
        }
        if (expected->inventory_text == NULL) {
            assert(item->inventory_text == NULL);
        } else {
            assert(strcmp(item->inventory_text, expected->inventory_text) == 0);
        }
        assert(item_find(item->command_name) == item);
    }
    assert(item_at(ITEM_COUNT) == NULL);
    assert(item_find(NULL) == NULL);
    assert(item_find("NIE MA TAKIEGO PRZEDMIOTU") == NULL);
    assert(item_find("PIGULKA TRANSPORTUJACA")->id == ITEM_TRANSPORT_PILL);
    assert(item_find("DOKUMENT")->id == ITEM_QUEST_PASS);

    game_initialize(&state);
    for (index = 0; index < sizeof(boundaries) / sizeof(boundaries[0]); ++index) {
        assert_capacity(&state, boundaries[index].dexterity, boundaries[index].capacity);
    }
    state.dexterity = 10;
    state.item_quantities[ITEM_BACKPACK] = 1;
    assert(game_carrying_capacity(&state) == 14);
    state.item_quantities[ITEM_DOUGHNUT] = 7;
    state.item_quantities[ITEM_CAKE] = 4;
    assert(game_carried_item_count(&state) == 12);
    assert(game_overburden_amount(&state) == 0);
    state.item_quantities[ITEM_DRY_RATION] = 3;
    assert(game_carried_item_count(&state) == 15);
    assert(game_overburden_amount(&state) == 1);
    assert(game_state_is_valid(&state));
    state.item_quantities[ITEM_DRY_RATION] = -1;
    assert(!game_state_is_valid(&state));

    {
        Capture capture = {{0}, 0};
        GameOutput output = {capture_write, &capture};
        Command command;

        game_initialize(&state);
        state.item_quantities[ITEM_DOUGHNUT] = 11;
        command = parser_parse("n");
        (void)game_execute(&state, &command, output);
        assert(state.turn == 1);
        assert(state.energy == 40);
        assert(strstr(capture.text,
            "JESTES OBLADOWANY !!! MASZ O 1 ZA DUZO\n"
            "TRACISZ 10% ENERGI\n") != NULL);
    }

    return 0;
}
