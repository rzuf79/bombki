#include "items.h"

#include <string.h>

/*
 * Command names and inventory text are copied from BOMBKI.EXE. Preserve their
 * wording, capitalization, punctuation, spacing, grammar, and oddities.
 */
static const ItemDefinition items[] = {
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
    {ITEM_LIROY_CASSETTE, "KASETA", NULL, "KASETA LIROYA : L - JAK LIROY ",
     ITEM_STORAGE_QUANTITY, true},
    {ITEM_TRANSPORT_PILL, "PIGULKA", "PIGULKA TRANSPORTUJACA",
     "PIGULKA TRANSPORTUJACA (M:G) ", ITEM_STORAGE_QUANTITY, true},
    {ITEM_QUEST_PASS, "PRZEPUSTKA", "DOKUMENT",
     "PRZEPUSTKA WLASNORECZNIE PODPISANA PRZEZ QUEST-MASTERA ",
     ITEM_STORAGE_QUANTITY, true},
    {ITEM_COMPARISON_SCROLL, "SCROLL POROWNYWANIE", NULL,
     "SCROLL Z CZAREM : POROWNYWANIE ", ITEM_STORAGE_QUANTITY, true},
    {ITEM_RETURN_SCROLL, "SCROLL POWROT", NULL,
     "SCROLL Z CZAREM : POWROT ", ITEM_STORAGE_QUANTITY, true},
    {ITEM_BACKPACK, "PLECAK", NULL, NULL, ITEM_STORAGE_CAPACITY_UPGRADE, false}
};

_Static_assert(sizeof(items) / sizeof(items[0]) == ITEM_COUNT,
               "item table must contain every ItemId");

size_t item_count(void)
{
    return sizeof(items) / sizeof(items[0]);
}

const ItemDefinition *item_at(size_t index)
{
    if (index >= item_count()) {
        return NULL;
    }
    return &items[index];
}

const ItemDefinition *item_find(const char *command_name)
{
    size_t index;

    if (command_name == NULL) {
        return NULL;
    }
    for (index = 0; index < item_count(); ++index) {
        if (strcmp(command_name, items[index].command_name) == 0
            || (items[index].alternate_command_name != NULL
                && strcmp(command_name, items[index].alternate_command_name) == 0)) {
            return &items[index];
        }
    }
    return NULL;
}
