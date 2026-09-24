#include "bombki/persistence.h"

#include <errno.h>
#include <inttypes.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "world.h"

#define SAVE_HEADER_V1 "BOMBKI_PORT 1"
#define SAVE_HEADER_V2 "BOMBKI_PORT 2"
#define SAVE_HEADER_V3 "BOMBKI_PORT 3"
#define SAVE_HEADER_V4 "BOMBKI_PORT 4"
#define SAVE_HEADER_V5 "BOMBKI_PORT 5"
#define SAVE_HEADER_V6 "BOMBKI_PORT 6"
#define SAVE_HEADER_V7 "BOMBKI_PORT 7"
#define SAVE_HEADER_V8 "BOMBKI_PORT 8"
#define SAVE_HEADER_V9 "BOMBKI_PORT 9"
#define SAVE_HEADER_V10 "BOMBKI_PORT 10"
#define SAVE_HEADER_V11 "BOMBKI_PORT 11"
#define SAVE_HEADER_V12 "BOMBKI_PORT 12"
#define SAVE_HEADER_V13 "BOMBKI_PORT 13"
#define SAVE_HEADER_V14 "BOMBKI_PORT 14"
#define SAVE_HEADER_V15 "BOMBKI_PORT 15"
#define SAVE_HEADER_V16 "BOMBKI_PORT 16"
#define SAVE_LINE_CAPACITY 256

static void set_error(char *error, size_t capacity, const char *message)
{
    if (error == NULL || capacity == 0) {
        return;
    }

    (void)snprintf(error, capacity, "%s", message);
}

static bool write_state(FILE *file, const GameState *state)
{
    size_t index;

    if (!(fprintf(file, "%s\n", SAVE_HEADER_V16) >= 0
        && fprintf(file, "room=%d\n", state->room_id) >= 0
        && fprintf(file, "turn=%" PRIu64 "\n", state->turn) >= 0
        && fprintf(file, "random_state=%u\n", state->random_state) >= 0
        && fprintf(file, "name=%s\n", state->player_name) >= 0
        && fprintf(file, "race=%d\n", (int)state->race) >= 0
        && fprintf(file, "strength=%d\n", state->strength) >= 0
        && fprintf(file, "maximum_strength=%d\n", state->maximum_strength) >= 0
        && fprintf(file, "dexterity=%d\n", state->dexterity) >= 0
        && fprintf(file, "maximum_dexterity=%d\n", state->maximum_dexterity) >= 0
        && fprintf(file, "wisdom=%d\n", state->wisdom) >= 0
        && fprintf(file, "maximum_wisdom=%d\n", state->maximum_wisdom) >= 0
        && fprintf(file, "energy=%d\n", state->energy) >= 0
        && fprintf(file, "maximum_energy=%d\n", state->maximum_energy) >= 0
        && fprintf(file, "mana=%d\n", state->mana) >= 0
        && fprintf(file, "maximum_mana=%d\n", state->maximum_mana) >= 0
        && fprintf(file, "coins=%d\n", state->coins) >= 0
        && fprintf(file, "experience=%d\n", state->experience) >= 0
        && fprintf(file, "practices=%d\n", state->practices) >= 0
        && fprintf(file, "level=%d\n", state->level) >= 0
        && fprintf(file, "kick_skill=%d\n", state->kick_skill) >= 0
        && fprintf(file, "kick_mana_threshold=%d\n",
            state->kick_mana_threshold) >= 0
        && fprintf(file, "kick_energy_threshold=%d\n",
            state->kick_energy_threshold) >= 0
        && fprintf(file, "flee_skill=%d\n", state->flee_skill) >= 0
        && fprintf(file, "flee_energy_threshold=%d\n",
            state->flee_energy_threshold) >= 0
        && fprintf(file, "comparison_skill=%d\n",
            state->comparison_skill) >= 0
        && fprintf(file, "parry_skill=%d\n", state->parry_skill) >= 0
        && fprintf(file, "cooking_skill=%d\n", state->cooking_skill) >= 0
        && fprintf(file, "return_skill=%d\n", state->return_skill) >= 0
        && fprintf(file, "sleep_hours=%d\n", state->sleep_hours) >= 0
        && fprintf(file, "duncan_quest=%d\n", state->duncan_quest) >= 0
        && fprintf(file, "duncan_black_market_unlocked=%d\n",
            state->duncan_black_market_unlocked ? 1 : 0) >= 0
        && fprintf(file, "quest_type=%d\n", state->quest_type) >= 0
        && fprintf(file, "quest_progress=%d\n", state->quest_progress) >= 0
        && fprintf(file, "equipped_weapon=%d\n", state->equipped_weapon) >= 0
        && fprintf(file, "equipped_shield=%d\n", state->equipped_shield) >= 0
        && fprintf(file, "equipped_clothing=%d\n", state->equipped_clothing) >= 0
        && fprintf(file, "active_opponent_actor=%d\n",
            state->active_opponent_actor) >= 0
        && fprintf(file, "active_opponent_energy=%d\n",
            state->active_opponent_energy) >= 0
        && fprintf(file, "active_opponent_maximum_energy=%d\n",
            state->active_opponent_maximum_energy) >= 0
        && fprintf(file, "active_opponent_strength=%d\n",
            state->active_opponent_strength) >= 0
        && fprintf(file, "active_opponent_dexterity=%d\n",
            state->active_opponent_dexterity) >= 0
        && fprintf(file, "active_opponent_fireballs=%d\n",
            state->active_opponent_fireballs) >= 0
        && fprintf(file, "active_opponent_poison_casts=%d\n",
            state->active_opponent_poison_casts) >= 0
        && fprintf(file, "poison_turns=%d\n", state->poison_turns) >= 0
        && fprintf(file, "quest_passage_open=%d\n",
            state->quest_passage_open ? 1 : 0) >= 0
        && fprintf(file, "living_door_alive=%d\n",
            state->living_door_alive ? 1 : 0) >= 0
        && fprintf(file, "old_elf_present=%d\n",
            state->old_elf_present ? 1 : 0) >= 0)) {
        return false;
    }

    for (index = 0; index < BOMBKI_WORLD_ACTOR_SLOTS; ++index) {
        if (fprintf(file, "actor_%zu=%d\n", index,
                state->world_actor_rooms[index]) < 0) {
            return false;
        }
    }
    for (index = 0; index < BOMBKI_WORLD_OBJECT_SLOTS; ++index) {
        if (fprintf(file, "object_%zu=%d\n", index,
                state->world_object_rooms[index]) < 0) {
            return false;
        }
    }
    for (index = 0; index < BOMBKI_ITEM_SLOTS; ++index) {
        if (fprintf(file, "item_%zu=%d\n", index,
                state->item_quantities[index]) < 0) {
            return false;
        }
    }
    return true;
}

bool persistence_save(
    const char *path,
    const GameState *state,
    char *error,
    size_t error_capacity
)
{
    FILE *file;

    if (path == NULL || state == NULL || !game_state_is_valid(state)) {
        set_error(error, error_capacity, "invalid game state");
        return false;
    }

    file = fopen(path, "w");
    if (file == NULL) {
        set_error(error, error_capacity, strerror(errno));
        return false;
    }

    if (!write_state(file, state) || fclose(file) != 0) {
        set_error(error, error_capacity, "could not finish writing save file");
        return false;
    }

    return true;
}

static bool parse_integer(const char *text, int *value)
{
    char *end;
    long parsed;

    errno = 0;
    parsed = strtol(text, &end, 10);
    if (errno != 0 || end == text || (*end != '\0' && *end != '\n' && *end != '\r')) {
        return false;
    }

    *value = (int)parsed;
    return (long)*value == parsed;
}

static bool parse_uint64(const char *text, uint64_t *value)
{
    char *end;
    uintmax_t parsed;

    errno = 0;
    parsed = strtoumax(text, &end, 10);
    if (text[0] == '-' || errno != 0 || end == text || *end != '\0'
        || parsed > UINT64_MAX) {
        return false;
    }

    *value = (uint64_t)parsed;
    return true;
}

static void trim_line_ending(char *text)
{
    size_t length = strlen(text);

    while (length > 0 && (text[length - 1] == '\n' || text[length - 1] == '\r')) {
        text[--length] = '\0';
    }
}

bool persistence_load(
    const char *path,
    GameState *state,
    char *error,
    size_t error_capacity
)
{
    FILE *file;
    char line[SAVE_LINE_CAPACITY];
    GameState candidate;
    uint64_t fields = 0;
    unsigned world_fields = 0;
    bool actor_fields[BOMBKI_WORLD_ACTOR_SLOTS] = {false};
    bool object_fields[BOMBKI_WORLD_OBJECT_SLOTS] = {false};
    bool item_fields[BOMBKI_ITEM_SLOTS] = {false};
    size_t actor_field_count = 0;
    size_t object_field_count = 0;
    size_t item_field_count = 0;
    unsigned version;

    if (path == NULL || state == NULL) {
        set_error(error, error_capacity, "invalid load request");
        return false;
    }

    file = fopen(path, "r");
    if (file == NULL) {
        set_error(error, error_capacity, strerror(errno));
        return false;
    }

    if (fgets(line, sizeof(line), file) == NULL) {
        (void)fclose(file);
        set_error(error, error_capacity, "empty save file");
        return false;
    }
    trim_line_ending(line);
    if (strcmp(line, SAVE_HEADER_V16) == 0) {
        version = 16;
    } else if (strcmp(line, SAVE_HEADER_V15) == 0) {
        version = 15;
    } else if (strcmp(line, SAVE_HEADER_V14) == 0) {
        version = 14;
    } else if (strcmp(line, SAVE_HEADER_V13) == 0) {
        version = 13;
    } else if (strcmp(line, SAVE_HEADER_V12) == 0) {
        version = 12;
    } else if (strcmp(line, SAVE_HEADER_V11) == 0) {
        version = 11;
    } else if (strcmp(line, SAVE_HEADER_V10) == 0) {
        version = 10;
    } else if (strcmp(line, SAVE_HEADER_V9) == 0) {
        version = 9;
    } else if (strcmp(line, SAVE_HEADER_V8) == 0) {
        version = 8;
    } else if (strcmp(line, SAVE_HEADER_V7) == 0) {
        version = 7;
    } else if (strcmp(line, SAVE_HEADER_V6) == 0) {
        version = 6;
    } else if (strcmp(line, SAVE_HEADER_V5) == 0) {
        version = 5;
    } else if (strcmp(line, SAVE_HEADER_V4) == 0) {
        version = 4;
    } else if (strcmp(line, SAVE_HEADER_V3) == 0) {
        version = 3;
    } else if (strcmp(line, SAVE_HEADER_V2) == 0) {
        version = 2;
    } else if (strcmp(line, SAVE_HEADER_V1) == 0) {
        version = 1;
    } else {
        (void)fclose(file);
        set_error(error, error_capacity, "unsupported save format");
        return false;
    }

    game_initialize(&candidate);
    while (fgets(line, sizeof(line), file) != NULL) {
        int value;
        trim_line_ending(line);

        if (strncmp(line, "room=", 5) == 0 && parse_integer(line + 5, &candidate.room_id)) {
            fields |= 1u << 0;
        } else if (strncmp(line, "subconscious=", 13) == 0
            && parse_integer(line + 13, &value)) {
            fields |= 1u << 1;
        } else if (strncmp(line, "random_state=", 13) == 0) {
            char *end;
            unsigned long parsed = strtoul(line + 13, &end, 10);
            if (*end == '\0') {
                candidate.random_state = (uint32_t)parsed;
                fields |= 1u << 2;
            }
        } else if (strncmp(line, "turn=", 5) == 0
            && parse_uint64(line + 5, &candidate.turn)) {
            fields |= 1u << 14;
        } else if (strncmp(line, "name=", 5) == 0) {
            (void)strncpy(candidate.player_name, line + 5, sizeof(candidate.player_name) - 1);
            candidate.player_name[sizeof(candidate.player_name) - 1] = '\0';
            fields |= 1u << 3;
        } else if (strncmp(line, "race=", 5) == 0
            && parse_integer(line + 5, &value)) {
            candidate.race = (Race)value;
            fields |= 1u << 15;
        } else if (strncmp(line, "strength=", 9) == 0
            && parse_integer(line + 9, &candidate.strength)) {
            fields |= 1u << 4;
        } else if (strncmp(line, "maximum_strength=", 17) == 0
            && parse_integer(line + 17, &candidate.maximum_strength)) {
            fields |= 1u << 16;
        } else if (strncmp(line, "dexterity=", 10) == 0
            && parse_integer(line + 10, &candidate.dexterity)) {
            fields |= 1u << 5;
        } else if (strncmp(line, "maximum_dexterity=", 18) == 0
            && parse_integer(line + 18, &candidate.maximum_dexterity)) {
            fields |= 1u << 17;
        } else if (strncmp(line, "wisdom=", 7) == 0
            && parse_integer(line + 7, &candidate.wisdom)) {
            fields |= 1u << 6;
        } else if (strncmp(line, "maximum_wisdom=", 15) == 0
            && parse_integer(line + 15, &candidate.maximum_wisdom)) {
            fields |= 1u << 18;
        } else if (strncmp(line, "energy=", 7) == 0
            && parse_integer(line + 7, &candidate.energy)) {
            fields |= 1u << 7;
        } else if (strncmp(line, "maximum_energy=", 15) == 0
            && parse_integer(line + 15, &candidate.maximum_energy)) {
            fields |= 1u << 8;
        } else if (strncmp(line, "mana=", 5) == 0
            && parse_integer(line + 5, &candidate.mana)) {
            fields |= 1u << 9;
        } else if (strncmp(line, "maximum_mana=", 13) == 0
            && parse_integer(line + 13, &candidate.maximum_mana)) {
            fields |= 1u << 10;
        } else if (strncmp(line, "coins=", 6) == 0
            && parse_integer(line + 6, &candidate.coins)) {
            fields |= 1u << 11;
        } else if (strncmp(line, "experience=", 11) == 0
            && parse_integer(line + 11, &candidate.experience)) {
            fields |= 1u << 12;
        } else if (strncmp(line, "practices=", 10) == 0
            && parse_integer(line + 10, &candidate.practices)) {
            fields |= 1u << 13;
        } else if (strncmp(line, "level=", 6) == 0
            && parse_integer(line + 6, &candidate.level)) {
            fields |= UINT64_C(1) << 29;
        } else if (strncmp(line, "kick_skill=", 11) == 0
            && parse_integer(line + 11, &candidate.kick_skill)) {
            fields |= UINT64_C(1) << 30;
        } else if (strncmp(line, "kick_mana_threshold=", 20) == 0
            && parse_integer(line + 20, &candidate.kick_mana_threshold)) {
            fields |= UINT64_C(1) << 31;
        } else if (strncmp(line, "kick_energy_threshold=", 22) == 0
            && parse_integer(line + 22, &candidate.kick_energy_threshold)) {
            fields |= UINT64_C(1) << 32;
        } else if (strncmp(line, "flee_skill=", 11) == 0
            && parse_integer(line + 11, &candidate.flee_skill)) {
            fields |= 1u << 27;
        } else if (strncmp(line, "flee_energy_threshold=", 22) == 0
            && parse_integer(line + 22, &candidate.flee_energy_threshold)) {
            fields |= 1u << 28;
        } else if (strncmp(line, "comparison_skill=", 17) == 0
            && parse_integer(line + 17, &candidate.comparison_skill)) {
            fields |= UINT64_C(1) << 33;
        } else if (strncmp(line, "parry_skill=", 12) == 0
            && parse_integer(line + 12, &candidate.parry_skill)) {
            fields |= UINT64_C(1) << 34;
        } else if (strncmp(line, "cooking_skill=", 14) == 0
            && parse_integer(line + 14, &candidate.cooking_skill)) {
            fields |= UINT64_C(1) << 38;
        } else if (strncmp(line, "return_skill=", 13) == 0
            && parse_integer(line + 13, &candidate.return_skill)) {
            fields |= UINT64_C(1) << 39;
        } else if (strncmp(line, "sleep_hours=", 12) == 0
            && parse_integer(line + 12, &candidate.sleep_hours)) {
            fields |= UINT64_C(1) << 40;
        } else if (strncmp(line, "duncan_quest=", 13) == 0
            && parse_integer(line + 13, &candidate.duncan_quest)) {
            fields |= UINT64_C(1) << 41;
        } else if (strncmp(line, "duncan_black_market_unlocked=", 29) == 0
            && parse_integer(line + 29, &value)
            && (value == 0 || value == 1)) {
            candidate.duncan_black_market_unlocked = value != 0;
            fields |= UINT64_C(1) << 42;
        } else if (strncmp(line, "quest_type=", 11) == 0
            && parse_integer(line + 11, &candidate.quest_type)) {
            fields |= UINT64_C(1) << 43;
        } else if (strncmp(line, "quest_progress=", 15) == 0
            && parse_integer(line + 15, &candidate.quest_progress)) {
            fields |= UINT64_C(1) << 44;
        } else if (strncmp(line, "equipped_weapon=", 16) == 0
            && parse_integer(line + 16, &candidate.equipped_weapon)) {
            fields |= 1u << 19;
        } else if (strncmp(line, "equipped_shield=", 16) == 0
            && parse_integer(line + 16, &candidate.equipped_shield)) {
            fields |= 1u << 20;
        } else if (strncmp(line, "equipped_clothing=", 18) == 0
            && parse_integer(line + 18, &candidate.equipped_clothing)) {
            fields |= 1u << 21;
        } else if (strncmp(line, "active_opponent_actor=", 22) == 0
            && parse_integer(line + 22, &candidate.active_opponent_actor)) {
            fields |= 1u << 22;
        } else if (strncmp(line, "active_opponent_energy=", 23) == 0
            && parse_integer(line + 23, &candidate.active_opponent_energy)) {
            fields |= 1u << 23;
        } else if (strncmp(line, "active_opponent_maximum_energy=", 31) == 0
            && parse_integer(line + 31,
                &candidate.active_opponent_maximum_energy)) {
            fields |= 1u << 24;
        } else if (strncmp(line, "active_opponent_strength=", 25) == 0
            && parse_integer(line + 25, &candidate.active_opponent_strength)) {
            fields |= 1u << 25;
        } else if (strncmp(line, "active_opponent_dexterity=", 26) == 0
            && parse_integer(line + 26,
                &candidate.active_opponent_dexterity)) {
            fields |= 1u << 26;
        } else if (strncmp(line, "active_opponent_fireballs=", 26) == 0
            && parse_integer(line + 26,
                &candidate.active_opponent_fireballs)) {
            fields |= UINT64_C(1) << 35;
        } else if (strncmp(line, "active_opponent_poison_casts=", 29) == 0
            && parse_integer(line + 29,
                &candidate.active_opponent_poison_casts)) {
            fields |= UINT64_C(1) << 36;
        } else if (strncmp(line, "poison_turns=", 13) == 0
            && parse_integer(line + 13, &candidate.poison_turns)) {
            fields |= UINT64_C(1) << 37;
        } else if (strncmp(line, "quest_passage_open=", 19) == 0
            && parse_integer(line + 19, &value)
            && (value == 0 || value == 1)) {
            candidate.quest_passage_open = value != 0;
            world_fields |= 1u << 0;
        } else if (strncmp(line, "living_door_alive=", 18) == 0
            && parse_integer(line + 18, &value)
            && (value == 0 || value == 1)) {
            candidate.living_door_alive = value != 0;
            world_fields |= 1u << 1;
        } else if (strncmp(line, "old_elf_present=", 16) == 0
            && parse_integer(line + 16, &value)
            && (value == 0 || value == 1)) {
            candidate.old_elf_present = value != 0;
            world_fields |= 1u << 2;
        } else {
            unsigned index;
            char trailing;

            if (sscanf(line, "actor_%u=%d%c", &index, &value, &trailing) == 2
                && index < BOMBKI_WORLD_ACTOR_SLOTS) {
                candidate.world_actor_rooms[index] = value;
                if (!actor_fields[index]) {
                    actor_fields[index] = true;
                    ++actor_field_count;
                }
            } else if (sscanf(line, "object_%u=%d%c", &index, &value,
                    &trailing) == 2
                && index < BOMBKI_WORLD_OBJECT_SLOTS) {
                candidate.world_object_rooms[index] = value;
                if (!object_fields[index]) {
                    object_fields[index] = true;
                    ++object_field_count;
                }
            } else if (sscanf(line, "item_%u=%d%c", &index, &value,
                    &trailing) == 2
                && index < BOMBKI_ITEM_SLOTS) {
                candidate.item_quantities[index] = value;
                if (!item_fields[index]) {
                    item_fields[index] = true;
                    ++item_field_count;
                }
            }
        }
    }

    if (fclose(file) != 0) {
        set_error(error, error_capacity, "could not finish reading save file");
        return false;
    }

    if (version <= 14) {
        candidate.world_actor_rooms[WORLD_ACTOR_STARUCH] =
            candidate.old_elf_present ? ROOM_ELF_HOUSE : BOMBKI_ROOM_NOWHERE;
        candidate.world_actor_rooms[WORLD_ACTOR_QUEST_MASTER] = ROOM_JUNCTION;
        candidate.world_actor_rooms[WORLD_ACTOR_LIVING_DOOR] =
            candidate.living_door_alive
                ? ROOM_LIVING_DOOR
                : BOMBKI_ROOM_NOWHERE;
    }

    if ((version == 1 && fields != (1u << 14) - 1)
        || (version == 2 && fields != (1u << 15) - 1)
        || (version == 3 && fields != (1u << 19) - 1)
        || (version == 4 && (fields != (1u << 19) - 1
            || world_fields != (1u << 3) - 1
            || actor_field_count != BOMBKI_WORLD_ACTOR_SLOTS
            || object_field_count != BOMBKI_WORLD_OBJECT_SLOTS))
        || (version == 5 && (fields != (1u << 19) - 1
            || world_fields != (1u << 3) - 1
            || actor_field_count != BOMBKI_WORLD_ACTOR_SLOTS
            || object_field_count != BOMBKI_WORLD_OBJECT_SLOTS
            || item_field_count != BOMBKI_ITEM_SLOTS))
        || (version == 6 && (fields != (1u << 22) - 1
            || world_fields != (1u << 3) - 1
            || actor_field_count != BOMBKI_WORLD_ACTOR_SLOTS
            || object_field_count != BOMBKI_WORLD_OBJECT_SLOTS
            || item_field_count != BOMBKI_ITEM_SLOTS))
        || (version == 7 && (fields != (1u << 27) - 1
            || world_fields != (1u << 3) - 1
            || actor_field_count != BOMBKI_WORLD_ACTOR_SLOTS
            || object_field_count != BOMBKI_WORLD_OBJECT_SLOTS
            || item_field_count != BOMBKI_ITEM_SLOTS))
        || (version == 8 && (fields != (1u << 29) - 1
            || world_fields != (1u << 3) - 1
            || actor_field_count != BOMBKI_WORLD_ACTOR_SLOTS
            || object_field_count != BOMBKI_WORLD_OBJECT_SLOTS
            || item_field_count != BOMBKI_ITEM_SLOTS))
        || (version == 9 && (fields != (UINT64_C(1) << 33) - 1
            || world_fields != (1u << 3) - 1
            || actor_field_count != BOMBKI_WORLD_ACTOR_SLOTS
            || object_field_count != BOMBKI_WORLD_OBJECT_SLOTS
            || item_field_count != BOMBKI_ITEM_SLOTS))
        || (version == 10 && (fields != (UINT64_C(1) << 35) - 1
            || world_fields != (1u << 3) - 1
            || actor_field_count != BOMBKI_WORLD_ACTOR_SLOTS
            || object_field_count != BOMBKI_WORLD_OBJECT_SLOTS
            || item_field_count != BOMBKI_ITEM_SLOTS))
        || (version == 11 && (fields != (UINT64_C(1) << 38) - 1
            || world_fields != (1u << 3) - 1
            || actor_field_count != BOMBKI_WORLD_ACTOR_SLOTS
            || object_field_count != BOMBKI_WORLD_OBJECT_SLOTS
            || item_field_count != BOMBKI_ITEM_SLOTS))
        || (version == 12 && (fields != (UINT64_C(1) << 39) - 1
            || world_fields != (1u << 3) - 1
            || actor_field_count != BOMBKI_WORLD_ACTOR_SLOTS
            || object_field_count != BOMBKI_WORLD_OBJECT_SLOTS
            || item_field_count != BOMBKI_ITEM_SLOTS))
        || (version == 13 && (fields != (UINT64_C(1) << 41) - 1
            || world_fields != (1u << 3) - 1
            || actor_field_count != BOMBKI_WORLD_ACTOR_SLOTS
            || object_field_count != BOMBKI_WORLD_OBJECT_SLOTS
            || item_field_count != BOMBKI_ITEM_SLOTS))
        || (version == 14 && (fields != (UINT64_C(1) << 43) - 1
            || world_fields != (1u << 3) - 1
            || actor_field_count != BOMBKI_WORLD_ACTOR_SLOTS
            || object_field_count != BOMBKI_WORLD_OBJECT_SLOTS
            || item_field_count != BOMBKI_ITEM_SLOTS))
        || (version == 15 && (fields != (UINT64_C(1) << 45) - 1
            || world_fields != (1u << 3) - 1
            || actor_field_count != BOMBKI_WORLD_ACTOR_SLOTS
            || object_field_count != BOMBKI_WORLD_OBJECT_SLOTS
            || item_field_count != BOMBKI_ITEM_SLOTS))
        || (version == 16 && (fields != (((UINT64_C(1) << 45) - 1)
                & ~(UINT64_C(1) << 1))
            || world_fields != (1u << 3) - 1
            || actor_field_count != BOMBKI_WORLD_ACTOR_SLOTS
            || object_field_count != BOMBKI_WORLD_OBJECT_SLOTS
            || item_field_count != BOMBKI_ITEM_SLOTS))
        || !game_state_is_valid(&candidate)) {
        set_error(error, error_capacity, "save file is incomplete or invalid");
        return false;
    }

    *state = candidate;
    return true;
}
