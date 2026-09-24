#include <assert.h>
#include <stdio.h>
#include <string.h>

#include "bombki/game.h"
#include "bombki/persistence.h"
#include "items.h"
#include "world.h"

#define SAVE_PATH "bombki-test-save.tmp"
#define LEGACY_PATH "bombki-test-save-v1.tmp"
#define VERSION_14_PATH "bombki-test-save-v14.tmp"
#define VERSION_15_PATH "bombki-test-save-v15.tmp"

static void write_v1_save(void)
{
    FILE *file = fopen(LEGACY_PATH, "w");

    assert(file != NULL);
    assert(fputs(
        "BOMBKI_PORT 1\n"
        "room=0\n"
        "subconscious=0\n"
        "random_state=1\n"
        "name=WEDROWIEC\n"
        "strength=10\n"
        "dexterity=10\n"
        "wisdom=10\n"
        "energy=100\n"
        "maximum_energy=100\n"
        "mana=25\n"
        "maximum_mana=25\n"
        "coins=0\n"
        "experience=0\n"
        "practices=0\n",
        file
    ) >= 0);
    assert(fclose(file) == 0);
}

static void write_previous_save_from_current(const char *path, int version)
{
    FILE *source = fopen(SAVE_PATH, "r");
    FILE *destination = fopen(path, "w");
    char line[256];

    assert(source != NULL);
    assert(destination != NULL);
    assert(fgets(line, sizeof(line), source) != NULL);
    assert(strcmp(line, "BOMBKI_PORT 16\n") == 0);
    assert(fprintf(destination, "BOMBKI_PORT %d\n", version) >= 0);
    while (fgets(line, sizeof(line), source) != NULL) {
        if (version == 14 && (strncmp(line, "quest_type=", 11) == 0
            || strncmp(line, "quest_progress=", 15) == 0)) {
            continue;
        }
        assert(fputs(line, destination) >= 0);
        if (strncmp(line, "room=", 5) == 0) {
            assert(fputs("subconscious=1\n", destination) >= 0);
        }
    }
    assert(fclose(source) == 0);
    assert(fclose(destination) == 0);
}

int main(void)
{
    GameState state;
    GameState loaded;
    char error[256];

    game_initialize(&state);
    state.turn = 42;
    state.random_state = 123456u;
    assert(game_configure_player(&state, "NIMFA TEST", RACE_NIMFA));
    state.coins = 99;
    state.level = 7;
    state.kick_skill = 46;
    state.kick_mana_threshold = 12;
    state.kick_energy_threshold = 31;
    state.flee_skill = 42;
    state.flee_energy_threshold = 17;
    state.comparison_skill = 64;
    state.parry_skill = 73;
    state.cooking_skill = 58;
    state.return_skill = 81;
    state.sleep_hours = 4;
    state.duncan_quest = 181;
    state.duncan_black_market_unlocked = true;
    state.quest_type = 3;
    state.quest_progress = -7;
    state.quest_passage_open = true;
    state.living_door_alive = false;
    state.old_elf_present = false;
    state.room_id = ROOM_ARENA_57;
    state.world_actor_rooms[WORLD_ACTOR_KORNIK] = ROOM_ARENA_57;
    state.world_actor_rooms[WORLD_ACTOR_CAGE_WEAK] = BOMBKI_ROOM_NOWHERE;
    state.world_object_rooms[WORLD_OBJECT_PIPE] = ROOM_ELF_HOUSE;
    state.item_quantities[ITEM_DOUGHNUT] = 3;
    state.item_quantities[ITEM_BACKPACK] = 1;
    state.item_quantities[ITEM_SPIKED_SUIT] = 1;
    state.equipped_clothing = ITEM_SPIKED_SUIT;
    assert(game_select_opponent(&state, "KORNIK"));
    state.active_opponent_fireballs = 7;
    state.active_opponent_poison_casts = 4;
    state.poison_turns = 6;

    assert(persistence_save(SAVE_PATH, &state, error, sizeof(error)));
    memset(&loaded, 0, sizeof(loaded));
    assert(persistence_load(SAVE_PATH, &loaded, error, sizeof(error)));
    assert(loaded.turn == 42);
    assert(loaded.random_state == 123456u);
    assert(loaded.coins == 99);
    assert(loaded.level == 7);
    assert(loaded.kick_skill == 46);
    assert(loaded.kick_mana_threshold == 12);
    assert(loaded.kick_energy_threshold == 31);
    assert(loaded.flee_skill == 42);
    assert(loaded.flee_energy_threshold == 17);
    assert(loaded.comparison_skill == 64);
    assert(loaded.parry_skill == 73);
    assert(loaded.cooking_skill == 58);
    assert(loaded.return_skill == 81);
    assert(loaded.sleep_hours == 4);
    assert(loaded.duncan_quest == 181);
    assert(loaded.duncan_black_market_unlocked);
    assert(loaded.quest_type == 3);
    assert(loaded.quest_progress == -7);
    assert(loaded.race == RACE_NIMFA);
    assert(loaded.maximum_strength == 15);
    assert(loaded.maximum_dexterity == 20);
    assert(loaded.maximum_wisdom == 11);
    assert(strcmp(loaded.player_name, "NIMFA TEST") == 0);
    assert(loaded.quest_passage_open);
    assert(!loaded.living_door_alive);
    assert(!loaded.old_elf_present);
    assert(loaded.room_id == ROOM_ARENA_57);
    assert(loaded.world_actor_rooms[WORLD_ACTOR_KORNIK] == ROOM_ARENA_57);
    assert(loaded.world_actor_rooms[WORLD_ACTOR_CAGE_WEAK]
        == BOMBKI_ROOM_NOWHERE);
    assert(loaded.world_object_rooms[WORLD_OBJECT_PIPE] == ROOM_ELF_HOUSE);
    assert(loaded.item_quantities[ITEM_DOUGHNUT] == 3);
    assert(loaded.item_quantities[ITEM_BACKPACK] == 1);
    assert(loaded.equipped_weapon == BOMBKI_NO_ITEM);
    assert(loaded.equipped_shield == BOMBKI_NO_ITEM);
    assert(loaded.equipped_clothing == ITEM_SPIKED_SUIT);
    assert(loaded.active_opponent_actor == WORLD_ACTOR_KORNIK);
    assert(loaded.active_opponent_energy == 1);
    assert(loaded.active_opponent_maximum_energy == 1);
    assert(loaded.active_opponent_strength == 2);
    assert(loaded.active_opponent_dexterity == 1);
    assert(loaded.active_opponent_fireballs == 7);
    assert(loaded.active_opponent_poison_casts == 4);
    assert(loaded.poison_turns == 6);

    write_previous_save_from_current(VERSION_15_PATH, 15);
    memset(&loaded, 0, sizeof(loaded));
    assert(persistence_load(VERSION_15_PATH, &loaded, error, sizeof(error)));
    assert(loaded.quest_type == 3);
    assert(loaded.quest_progress == -7);
    assert(remove(VERSION_15_PATH) == 0);

    write_previous_save_from_current(VERSION_14_PATH, 14);
    memset(&loaded, 0, sizeof(loaded));
    assert(persistence_load(VERSION_14_PATH, &loaded, error, sizeof(error)));
    assert(loaded.return_skill == 81);
    assert(loaded.sleep_hours == 4);
    assert(loaded.duncan_quest == 181);
    assert(loaded.duncan_black_market_unlocked);
    assert(loaded.quest_type == 0);
    assert(loaded.quest_progress == 0);
    assert(remove(VERSION_14_PATH) == 0);
    assert(remove(SAVE_PATH) == 0);

    write_v1_save();
    memset(&loaded, 0, sizeof(loaded));
    assert(persistence_load(LEGACY_PATH, &loaded, error, sizeof(error)));
    assert(loaded.turn == 0);
    assert(game_carried_item_count(&loaded) == 0);
    assert(loaded.equipped_weapon == BOMBKI_NO_ITEM);
    assert(loaded.equipped_shield == BOMBKI_NO_ITEM);
    assert(loaded.equipped_clothing == BOMBKI_NO_ITEM);
    assert(loaded.active_opponent_actor == BOMBKI_NO_ACTOR);
    assert(loaded.active_opponent_energy == 0);
    assert(loaded.active_opponent_fireballs == 0);
    assert(loaded.active_opponent_poison_casts == 0);
    assert(loaded.poison_turns == 0);
    assert(loaded.level == 1);
    assert(loaded.kick_skill == 0);
    assert(loaded.kick_mana_threshold == 0);
    assert(loaded.kick_energy_threshold == 0);
    assert(loaded.flee_skill == 0);
    assert(loaded.flee_energy_threshold == 0);
    assert(loaded.comparison_skill == 0);
    assert(loaded.parry_skill == 0);
    assert(loaded.cooking_skill == 0);
    assert(loaded.return_skill == 0);
    assert(loaded.sleep_hours == 0);
    assert(loaded.duncan_quest == 0);
    assert(!loaded.duncan_black_market_unlocked);
    assert(game_state_is_valid(&loaded));
    assert(remove(LEGACY_PATH) == 0);

    return 0;
}
