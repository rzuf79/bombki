#ifndef BOMBKI_ITEMS_H
#define BOMBKI_ITEMS_H

#include <stdbool.h>
#include <stddef.h>

typedef enum {
    ITEM_OLD_SWORD = 0,
    ITEM_SMALL_SHIELD,
    ITEM_BLOODY_HEART,
    ITEM_SCHOOL_DIPLOMA,
    ITEM_PIPE,
    ITEM_DOUGHNUT,
    ITEM_CAKE,
    ITEM_DRY_RATION,
    ITEM_ROLL,
    ITEM_BREAD,
    ITEM_WEKA,
    ITEM_BIGOS,
    ITEM_BEER,
    ITEM_CLOTHES,
    ITEM_SPIKED_SUIT,
    ITEM_SMALL_MANA_BOTTLE,
    ITEM_LUCKY_LEAF,
    ITEM_LIROY_CASSETTE,
    ITEM_TRANSPORT_PILL,
    ITEM_QUEST_PASS,
    ITEM_COMPARISON_SCROLL,
    ITEM_RETURN_SCROLL,
    ITEM_BACKPACK,
    ITEM_COUNT
} ItemId;

typedef enum {
    ITEM_STORAGE_WORLD_LOCATION = 0,
    ITEM_STORAGE_QUANTITY,
    ITEM_STORAGE_CAPACITY_UPGRADE
} ItemStorage;

typedef struct {
    ItemId id;
    const char *command_name;
    const char *alternate_command_name;
    const char *inventory_text;
    ItemStorage storage;
    bool shown_in_inventory;
} ItemDefinition;

size_t item_count(void);
const ItemDefinition *item_at(size_t index);
const ItemDefinition *item_find(const char *command_name);

#endif
