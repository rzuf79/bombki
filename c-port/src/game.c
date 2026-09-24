#include "bombki/game.h"

#include <ctype.h>
#include <limits.h>
#include <stdarg.h>
#include <stdio.h>
#include <string.h>

#include "enemies.h"
#include "items.h"
#include "world.h"

typedef struct {
    int strength;
    int maximum_strength;
    int dexterity;
    int maximum_dexterity;
    int wisdom;
    int maximum_wisdom;
    int maximum_mana;
    int starting_coins;
} RaceProfile;

static const char *const race_names[RACE_COUNT] = {
    "CZLOWIEK", "OLBRZYM", "NIMFA", "POL-ELF", "UFOK", "CZAROMIL"
};

static const char level_marker[] =
    "\002\002\002\002\002\002\002"
    "\002\002\002\002\002\002\002";

/* Values recovered from the race-selection assignments in BOMBKI.EXE. */
static const RaceProfile race_profiles[RACE_COUNT] = {
    {10, 15, 10, 15, 10, 15, 100, 0},
    {13, 20, 13, 20, 5, 7, 70, 0},
    {10, 15, 13, 20, 7, 11, 100, 0},
    {6, 10, 16, 24, 8, 12, 80, 30},
    {9, 13, 9, 14, 13, 20, 150, 0},
    {6, 9, 7, 11, 16, 25, 250, 0}
};

static const int street_spawn_rooms[] = {
    ROOM_CITY_THRESHOLD,
    ROOM_SHOP_STREET,
    ROOM_SHOP_STREET_NORTH,
    ROOM_BAKERY,
    ROOM_ARMORY,
    ROOM_GENERAL_STORE
};

static const int concert_spawn_rooms[] = {
    ROOM_CONCERT_HALL,
    ROOM_CROWD_SOUTH,
    ROOM_CROWD_NORTH,
    ROOM_CROWD_CENTRE,
    ROOM_CROWD_SOUTHEAST,
    ROOM_CROWD_NORTHEAST,
    ROOM_BEER_HALL,
    ROOM_STAGE_ENTRANCE
};

static const int stage_spawn_rooms[] = {
    ROOM_STAGE,
    ROOM_STAGE_CENTRE,
    ROOM_STAGE_END
};

static const int plant_spawn_rooms[] = {
    ROOM_BRUSZCZ,
    ROOM_BRUSZCZ_EAST,
    ROOM_BRUSZCZ_WEST,
    ROOM_BRUSZCZ_SOUTH,
    ROOM_BRUSZCZ_SOUTH_WEST,
    ROOM_BRUSZCZ_SOUTH_EAST,
    ROOM_FOREST,
    ROOM_FOREST_WEST
};

_Static_assert(WORLD_ACTOR_COUNT <= BOMBKI_WORLD_ACTOR_SLOTS,
               "GameState needs a slot for every world actor");
_Static_assert(WORLD_OBJECT_COUNT == BOMBKI_WORLD_OBJECT_SLOTS,
               "GameState needs a slot for every room object");
_Static_assert(ITEM_COUNT == BOMBKI_ITEM_SLOTS,
               "GameState needs a quantity for every item");
_Static_assert((int)ITEM_OLD_SWORD == (int)WORLD_OBJECT_OLD_SWORD
               && (int)ITEM_SMALL_SHIELD == (int)WORLD_OBJECT_SMALL_SHIELD
               && (int)ITEM_BLOODY_HEART == (int)WORLD_OBJECT_BLOODY_HEART
               && (int)ITEM_SCHOOL_DIPLOMA == (int)WORLD_OBJECT_SCHOOL_DIPLOMA
               && (int)ITEM_PIPE == (int)WORLD_OBJECT_PIPE,
               "world objects and their item quantities must share IDs");

static void emit(GameOutput output, const char *text)
{
    if (output.write != NULL) {
        output.write(output.context, text);
    }
}

static void emit_formatted(GameOutput output, const char *format, ...)
{
    char buffer[2048];
    va_list arguments;

    va_start(arguments, format);
    (void)vsnprintf(buffer, sizeof(buffer), format, arguments);
    va_end(arguments);
    emit(output, buffer);
}

static uint32_t next_random(GameState *state)
{
    state->random_state = state->random_state * UINT32_C(1664525)
        + UINT32_C(1013904223);
    return state->random_state;
}

static size_t random_below(GameState *state, size_t limit)
{
    return limit == 0 ? 0 : (size_t)(next_random(state) % (uint32_t)limit);
}

static int roll_enemy_stat(GameState *state, EnemyStatRange range)
{
    size_t possibilities = (size_t)(range.maximum - range.minimum) + 1;

    if (possibilities == 1) {
        return range.minimum;
    }
    return range.minimum + (int)random_below(state, possibilities);
}

void game_clear_active_opponent(GameState *state)
{
    if (state == NULL) {
        return;
    }
    state->active_opponent_actor = BOMBKI_NO_ACTOR;
    state->active_opponent_energy = 0;
    state->active_opponent_maximum_energy = 0;
    state->active_opponent_strength = 0;
    state->active_opponent_dexterity = 0;
    state->active_opponent_fireballs = 0;
    state->active_opponent_poison_casts = 0;
}

bool game_select_opponent(GameState *state, const char *target)
{
    size_t index;

    if (state == NULL || target == NULL || target[0] == '\0') {
        return false;
    }

    for (index = 0; index < world_actor_count(); ++index) {
        const WorldActor *actor = world_actor_at(index);
        const EnemyProfile *profile;

        if (actor == NULL
            || state->world_actor_rooms[index] != state->room_id
            || strcmp(actor->name, target) != 0) {
            continue;
        }
        if (state->active_opponent_actor == (int)actor->id) {
            return true;
        }

        profile = enemy_profile_find(enemy_profile_for_world_actor(actor->id));
        if (profile == NULL) {
            return false;
        }

        state->active_opponent_actor = (int)actor->id;
        state->active_opponent_energy = roll_enemy_stat(state, profile->energy);
        state->active_opponent_maximum_energy = state->active_opponent_energy;
        /* This is the assignment order used by the recovered procedures. */
        state->active_opponent_dexterity = roll_enemy_stat(
            state,
            profile->dexterity
        );
        state->active_opponent_strength = roll_enemy_stat(
            state,
            profile->strength
        );
        state->active_opponent_fireballs = profile->fireball_charges;
        state->active_opponent_poison_casts = profile->poison_charges;
        return true;
    }

    return false;
}

static void place_actor(
    GameState *state,
    WorldActorId actor,
    const int *rooms,
    size_t room_count
)
{
    state->world_actor_rooms[actor] = rooms[random_below(state, room_count)];
}

void game_regenerate_encounters(GameState *state)
{
    WorldActorId actor;

    if (state == NULL) {
        return;
    }

    game_clear_active_opponent(state);

    for (actor = WORLD_ACTOR_KORNIK; actor <= WORLD_ACTOR_TRENER; ++actor) {
        state->world_actor_rooms[actor] = ROOM_ARENA_33
            + (int)random_below(state, 25);
    }
    for (actor = WORLD_ACTOR_JAMNIK; actor <= WORLD_ACTOR_PIESEK; ++actor) {
        place_actor(
            state,
            actor,
            street_spawn_rooms,
            sizeof(street_spawn_rooms) / sizeof(street_spawn_rooms[0])
        );
    }
    for (actor = WORLD_ACTOR_TAKSOWKARZ; actor <= WORLD_ACTOR_ZEBRAK; ++actor) {
        place_actor(
            state,
            actor,
            street_spawn_rooms,
            sizeof(street_spawn_rooms) / sizeof(street_spawn_rooms[0])
        );
    }
    for (actor = WORLD_ACTOR_GITARZYSTA; actor <= WORLD_ACTOR_LIROY; ++actor) {
        place_actor(
            state,
            actor,
            stage_spawn_rooms,
            sizeof(stage_spawn_rooms) / sizeof(stage_spawn_rooms[0])
        );
    }
    for (actor = WORLD_ACTOR_DZIECKO; actor <= WORLD_ACTOR_CZLOWIEK; ++actor) {
        place_actor(state, actor, concert_spawn_rooms, 7);
    }
    for (actor = WORLD_ACTOR_POLICJANT; actor <= WORLD_ACTOR_GORYL; ++actor) {
        place_actor(
            state,
            actor,
            concert_spawn_rooms,
            sizeof(concert_spawn_rooms) / sizeof(concert_spawn_rooms[0])
        );
    }
    place_actor(state, WORLD_ACTOR_DZIADEK, concert_spawn_rooms, 7);
    place_actor(state, WORLD_ACTOR_REPORTER, concert_spawn_rooms, 6);

    for (actor = WORLD_ACTOR_SZCZAW; actor <= WORLD_ACTOR_ROZA; ++actor) {
        place_actor(state, actor, plant_spawn_rooms, 7);
    }
    place_actor(state, WORLD_ACTOR_JEZYNA, plant_spawn_rooms, 8);
    place_actor(state, WORLD_ACTOR_OSET, plant_spawn_rooms, 7);
    place_actor(state, WORLD_ACTOR_AGREST, plant_spawn_rooms, 8);
    place_actor(state, WORLD_ACTOR_MALINA, plant_spawn_rooms, 7);
    place_actor(state, WORLD_ACTOR_TRAWA, plant_spawn_rooms, 8);
    place_actor(state, WORLD_ACTOR_DUNCAN, plant_spawn_rooms, 8);
    state->world_actor_rooms[WORLD_ACTOR_STARUCH] = ROOM_ELF_HOUSE;
    state->world_actor_rooms[WORLD_ACTOR_QUEST_MASTER] = ROOM_JUNCTION;
    state->world_actor_rooms[WORLD_ACTOR_LIVING_DOOR] = ROOM_LIVING_DOOR;

    state->living_door_alive = true;
    state->old_elf_present = true;
}

void game_reset_world(GameState *state)
{
    size_t index;

    if (state == NULL) {
        return;
    }

    for (index = 0; index < BOMBKI_WORLD_ACTOR_SLOTS; ++index) {
        state->world_actor_rooms[index] = BOMBKI_ROOM_NOWHERE;
    }
    for (index = 0; index < BOMBKI_WORLD_OBJECT_SLOTS; ++index) {
        state->world_object_rooms[index] = BOMBKI_ROOM_NOWHERE;
    }
    state->quest_passage_open = false;
    game_regenerate_encounters(state);
    state->world_actor_rooms[WORLD_ACTOR_CAGE_WEAK] = ROOM_CAGE_WEAK;
    state->world_actor_rooms[WORLD_ACTOR_CAGE_DEXTEROUS] = ROOM_CAGE_DEXTEROUS;
    state->world_actor_rooms[WORLD_ACTOR_CAGE_RESISTANT] = ROOM_CAGE_RESISTANT;
    state->world_actor_rooms[WORLD_ACTOR_CAGE_STRONG] = ROOM_CAGE_STRONG;
    state->world_actor_rooms[WORLD_ACTOR_CAGE_ALL] = ROOM_CAGE_ALL;
}

static void describe_exits(const GameState *state, GameOutput output)
{
    const Room *room = world_find_room(state->room_id);

    if (room == NULL) {
        emit(output, "BLAD: NIEZNANY POKOJ.\n");
        return;
    }

    if (state->room_id == ROOM_JUNCTION
        && state->item_quantities[ITEM_QUEST_PASS] > 0) {
        emit(output,
            "DOSTEPNE WYJSCIA:\n"
            "POLUDNIE-UL.SKLEPIKOWA\n"
            "WSCHOD-DROGA O KTOREJ MOZESZ POMAZYC ( BO JEST W PRODUKCJI !!! )\n"
            "ZACHOD-DROGA");
    } else if (state->room_id == ROOM_LIVING_DOOR
        && !state->living_door_alive) {
        emit(output,
            "DOSTEPNE WYJSCIA:\n"
            "WSCHOD-PODEJRZANE KRZAKI\n"
            "ZACHOD-WEJSCIE DO DOMKU");
    } else {
        emit(output, room->exits_text);
    }
    emit(output, "\n");
}

void game_initialize(GameState *state)
{
    if (state == NULL) {
        return;
    }

    memset(state, 0, sizeof(*state));
    state->room_id = ROOM_START;
    state->random_state = 1u;
    state->active_opponent_actor = BOMBKI_NO_ACTOR;
    state->equipped_weapon = BOMBKI_NO_ITEM;
    state->equipped_shield = BOMBKI_NO_ITEM;
    state->equipped_clothing = BOMBKI_NO_ITEM;
    (void)game_configure_player(state, "WEDROWIEC", RACE_CZLOWIEK);
    state->maximum_energy = 50;
    state->energy = state->maximum_energy;
    state->practices = 10;
    state->level = 1;
    game_reset_world(state);
}

const char *game_race_name(Race race)
{
    if (race < 0 || race >= RACE_COUNT) {
        return "?";
    }
    return race_names[race];
}

bool game_parse_race(const char *text, Race *race)
{
    char normalized[32];
    size_t read_index = 0;
    size_t write_index = 0;
    Race candidate;

    if (text == NULL || race == NULL) {
        return false;
    }
    while (text[read_index] != '\0' && isspace((unsigned char)text[read_index])) {
        ++read_index;
    }
    while (text[read_index] != '\0' && write_index + 1 < sizeof(normalized)) {
        unsigned char character = (unsigned char)text[read_index++];
        if (character == '\r' || character == '\n') {
            break;
        }
        normalized[write_index++] = (char)toupper(character);
    }
    while (write_index > 0 && isspace((unsigned char)normalized[write_index - 1])) {
        --write_index;
    }
    normalized[write_index] = '\0';
    for (candidate = RACE_CZLOWIEK; candidate < RACE_COUNT; ++candidate) {
        if (strcmp(normalized, race_names[candidate]) == 0) {
            *race = candidate;
            return true;
        }
    }
    return false;
}

bool game_configure_player(GameState *state, const char *name, Race race)
{
    const RaceProfile *profile;
    size_t length;

    if (state == NULL || name == NULL || race < 0 || race >= RACE_COUNT) {
        return false;
    }
    length = strcspn(name, "\r\n");
    if (length == 0 || length >= sizeof(state->player_name)) {
        return false;
    }
    profile = &race_profiles[race];
    memcpy(state->player_name, name, length);
    state->player_name[length] = '\0';
    state->race = race;
    state->strength = profile->strength;
    state->maximum_strength = profile->maximum_strength;
    state->dexterity = profile->dexterity;
    state->maximum_dexterity = profile->maximum_dexterity;
    state->wisdom = profile->wisdom;
    state->maximum_wisdom = profile->maximum_wisdom;
    state->maximum_mana = profile->maximum_mana;
    state->mana = profile->maximum_mana;
    state->coins = profile->starting_coins;
    return true;
}

bool game_state_is_valid(const GameState *state)
{
    size_t index;

    if (state == NULL
        || world_find_room(state->room_id) == NULL
        || state->player_name[0] == '\0') {
        return false;
    }

    if (!(state->race >= 0
        && state->race < RACE_COUNT
        && state->maximum_strength > 0
        && state->dexterity >= 0
        && (int64_t)state->dexterity
            <= (int64_t)state->maximum_dexterity
                + state->item_quantities[ITEM_LIROY_CASSETTE]
        && state->maximum_dexterity > 0
        && state->maximum_wisdom >= state->wisdom
        && state->maximum_wisdom > 0
        && state->maximum_energy > 0
        && state->energy >= 0
        && state->maximum_mana >= 0
        && state->mana >= 0
        && state->mana <= state->maximum_mana
        && state->level >= 0
        && state->kick_skill >= 0
        && state->flee_skill >= 0
        && state->comparison_skill >= 0
        && state->parry_skill >= 0
        && state->cooking_skill >= 0
        && state->return_skill >= 0
        && state->sleep_hours >= 0
        && state->duncan_quest >= 0
        && state->duncan_quest <= 255
        && state->quest_type >= 0
        && state->quest_type <= 3)) {
        return false;
    }

    for (index = 0; index < BOMBKI_WORLD_ACTOR_SLOTS; ++index) {
        if (state->world_actor_rooms[index] != BOMBKI_ROOM_NOWHERE
            && world_find_room(state->world_actor_rooms[index]) == NULL) {
            return false;
        }
    }
    for (index = 0; index < BOMBKI_WORLD_OBJECT_SLOTS; ++index) {
        if (state->world_object_rooms[index] != BOMBKI_ROOM_NOWHERE
            && world_find_room(state->world_object_rooms[index]) == NULL) {
            return false;
        }
    }
    for (index = 0; index < BOMBKI_ITEM_SLOTS; ++index) {
        if (state->item_quantities[index] < 0
            || (index <= ITEM_PIPE && state->item_quantities[index] > 1)) {
            return false;
        }
    }

    if (!((state->equipped_weapon == BOMBKI_NO_ITEM
            || state->equipped_weapon == ITEM_OLD_SWORD)
        && (state->equipped_shield == BOMBKI_NO_ITEM
            || state->equipped_shield == ITEM_SMALL_SHIELD)
        && (state->equipped_clothing == BOMBKI_NO_ITEM
            || state->equipped_clothing == ITEM_CLOTHES
            || state->equipped_clothing == ITEM_SPIKED_SUIT))) {
        return false;
    }
    if ((state->equipped_weapon != BOMBKI_NO_ITEM
            && state->item_quantities[state->equipped_weapon] == 0)
        || (state->equipped_shield != BOMBKI_NO_ITEM
            && state->item_quantities[state->equipped_shield] == 0)
        || (state->equipped_clothing != BOMBKI_NO_ITEM
            && state->item_quantities[state->equipped_clothing] == 0)) {
        return false;
    }

    if (state->active_opponent_actor == BOMBKI_NO_ACTOR) {
        if (state->active_opponent_energy != 0
            || state->active_opponent_maximum_energy != 0
            || state->active_opponent_strength != 0
            || state->active_opponent_dexterity != 0
            || state->active_opponent_fireballs != 0
            || state->active_opponent_poison_casts != 0) {
            return false;
        }
    } else {
        const EnemyProfile *profile;

        if (state->active_opponent_actor < 0
            || state->active_opponent_actor >= WORLD_ACTOR_COUNT
            || state->world_actor_rooms[state->active_opponent_actor]
                != state->room_id) {
            return false;
        }
        profile = enemy_profile_find(enemy_profile_for_world_actor(
            (WorldActorId)state->active_opponent_actor
        ));
        if (profile == NULL
            || state->active_opponent_maximum_energy < profile->energy.minimum
            || state->active_opponent_maximum_energy > profile->energy.maximum
            || state->active_opponent_energy < 0
            || state->active_opponent_energy
                > state->active_opponent_maximum_energy
            || state->active_opponent_strength < profile->strength.minimum
            || state->active_opponent_strength > profile->strength.maximum
            || state->active_opponent_dexterity < profile->dexterity.minimum
            || state->active_opponent_dexterity > profile->dexterity.maximum
            || state->active_opponent_fireballs < 0
            || state->active_opponent_poison_casts < 0) {
            return false;
        }
    }

    if (state->poison_turns < 0) {
        return false;
    }

    return true;
}

size_t game_carried_item_count(const GameState *state)
{
    size_t count = 0;
    size_t index;

    if (state == NULL) {
        return 0;
    }
    for (index = 0; index < BOMBKI_ITEM_SLOTS; ++index) {
        size_t quantity = state->item_quantities[index] > 0
            ? (size_t)state->item_quantities[index]
            : 0;

        if (SIZE_MAX - count < quantity) {
            return SIZE_MAX;
        }
        count += quantity;
    }
    return count;
}

int game_carrying_capacity(const GameState *state)
{
    int capacity;

    if (state == NULL) {
        return 0;
    }
    if (state->dexterity <= 10) {
        capacity = 10;
    } else if (state->dexterity <= 12) {
        capacity = 11;
    } else if (state->dexterity <= 15) {
        capacity = 12;
    } else if (state->dexterity <= 18) {
        capacity = 13;
    } else if (state->dexterity <= 20) {
        capacity = 14;
    } else if (state->dexterity <= 24) {
        capacity = 15;
    } else {
        capacity = 16;
    }
    if (state->item_quantities[ITEM_BACKPACK] > 0) {
        capacity += 4;
    }
    return capacity;
}

size_t game_overburden_amount(const GameState *state)
{
    size_t carried = game_carried_item_count(state);
    int capacity = game_carrying_capacity(state);

    return carried > (size_t)capacity ? carried - (size_t)capacity : 0;
}

static void add_clamped(int *value, int64_t amount)
{
    int64_t result = (int64_t)*value + amount;

    if (result > INT_MAX) {
        *value = INT_MAX;
    } else if (result < INT_MIN) {
        *value = INT_MIN;
    } else {
        *value = (int)result;
    }
}

static int64_t level_threshold(int level)
{
    if (level == 1) {
        return 700;
    }
    if (level == 2) {
        return 725;
    }
    if (level == 3) {
        return 730;
    }
    if (level <= 8) {
        return 735 + (int64_t)level;
    }
    return 735 + 2 * (int64_t)level;
}

static int64_t level_cost(int level)
{
    if (level == 1) {
        return 725;
    }
    if (level == 2) {
        return 730;
    }
    if (level == 3) {
        return 735;
    }
    if (level <= 8) {
        return 735 + (int64_t)level;
    }
    return 735 + 2 * (int64_t)level;
}

static void improve_level_twelve_maxima(GameState *state, GameOutput output)
{
    if (state->wisdom >= state->maximum_wisdom) {
        add_clamped(&state->maximum_wisdom, 3);
    }
    if (state->dexterity >= state->maximum_dexterity) {
        add_clamped(&state->maximum_dexterity, 3);
    }
    if (state->strength >= state->maximum_strength) {
        add_clamped(&state->maximum_strength, 3);
    }
    if (state->wisdom < state->maximum_wisdom) {
        add_clamped(&state->maximum_wisdom, 2);
    }
    if (state->dexterity < state->maximum_dexterity) {
        add_clamped(&state->maximum_dexterity, 2);
    }
    if (state->strength < state->maximum_strength) {
        add_clamped(&state->maximum_strength, 2);
    }
    if (state->maximum_strength > state->maximum_wisdom
        && state->maximum_strength > state->maximum_dexterity) {
        add_clamped(&state->maximum_strength, 3);
    }
    if (state->maximum_wisdom > state->maximum_strength
        && state->maximum_wisdom > state->maximum_dexterity) {
        add_clamped(&state->maximum_wisdom, 3);
    }
    if (state->maximum_dexterity > state->maximum_wisdom
        && state->maximum_dexterity > state->maximum_strength) {
        add_clamped(&state->maximum_dexterity, 3);
    }
    if (state->maximum_dexterity == state->maximum_wisdom
        && state->maximum_wisdom == state->maximum_strength) {
        add_clamped(&state->maximum_dexterity, 1);
        add_clamped(&state->maximum_strength, 1);
        add_clamped(&state->maximum_wisdom, 1);
    }
    if (state->maximum_dexterity > state->maximum_strength
        && state->maximum_dexterity == state->maximum_wisdom) {
        add_clamped(&state->maximum_wisdom, 2);
        add_clamped(&state->maximum_dexterity, 1);
    }

    emit_formatted(output, "%s MASZ TERAZ %d MAXYMALNIE SILY %s\n",
        level_marker, state->maximum_wisdom, level_marker);
    emit_formatted(output, "%s MASZ TERAZ %d MAXYMALNIE ZRECZNOSCI %s\n",
        level_marker, state->maximum_dexterity, level_marker);
    emit_formatted(output, "%s MASZ TERAZ %d MAXYMALNIE MADROSCI %s\n",
        level_marker, state->maximum_strength, level_marker);
}

static void try_level_up(GameState *state, GameOutput output)
{
    int index;
    int practice_gain;
    int energy_gain;
    int mana_gain;

    if (state->level == INT_MAX
        || (int64_t)state->experience < level_threshold(state->level)) {
        return;
    }

    for (index = 0; index < 4; ++index) {
        emit(output,
            "<<<<<<<<<=+=+=+!!!#####ZDOBYLES LEVEL#####!!!+=+=+=<<<<<<<<<<<<<\n"
        );
    }
    add_clamped(&state->experience, -level_cost(state->level));

    if (state->strength < 11) {
        practice_gain = 3;
    } else if (state->strength < 16) {
        practice_gain = 4;
    } else if (state->strength < 23) {
        practice_gain = 5;
    } else {
        practice_gain = 6;
    }
    add_clamped(&state->practices, practice_gain);
    emit_formatted(output,
        "<<<<<<<<<<<<ZYSKALES %d PRAKTYK >>>>>>>>>>>>>>>\n",
        state->practices
    );

    energy_gain = state->dexterity > 12 ? 11 : 10;
    if (state->dexterity > 16) {
        ++energy_gain;
    }
    if (state->dexterity > 21) {
        ++energy_gain;
    }
    if (state->dexterity > 26 && state->wisdom > 20) {
        ++energy_gain;
    }
    add_clamped(&state->maximum_energy, energy_gain);
    emit_formatted(output,
        "<<<<<<<<<<<<ZYSKALES %d MAXIMUM ENERGI >>>>>>>>>>>>>\n",
        state->maximum_energy
    );

    mana_gain = state->strength > INT_MAX - 2
        ? INT_MAX
        : state->strength + 2;
    add_clamped(&state->maximum_mana, mana_gain);
    emit_formatted(output,
        "<<<<<<<<<<<<<<ZYSKALES %dMANY >>>>>>>>>>>>>>>>>\n",
        mana_gain
    );

    ++state->level;
    if (state->level == 12) {
        emit(output,
            "HURRRA TO JUZ DWUNASTY POZIOM , CZAS PODWYZSZYC MAXYMALNE PARAMETRY\n"
        );
        improve_level_twelve_maxima(state, output);
    }
}

static void advance_turn(GameState *state, GameOutput output)
{
    size_t excess;

    ++state->turn;
    excess = game_overburden_amount(state);
    if (excess > 0) {
        emit_formatted(output,
            "JESTES OBLADOWANY !!! MASZ O %zu ZA DUZO\n",
            excess
        );
        if (excess > SIZE_MAX / 10) {
            emit_formatted(output, "TRACISZ %zu%% ENERGI\n", SIZE_MAX);
            state->energy = 0;
        } else {
            size_t energy_loss = excess * 10;

            emit_formatted(output, "TRACISZ %zu%% ENERGI\n", energy_loss);
            if (energy_loss >= (size_t)state->energy) {
                state->energy = 0;
            } else {
                state->energy -= (int)energy_loss;
            }
        }
    }
    try_level_up(state, output);
}

CommandTurnPolicy game_command_turn_policy(CommandVerb verb)
{
    switch (verb) {
    case COMMAND_MOVE:
    case COMMAND_TAKE:
    case COMMAND_DROP:
    case COMMAND_DESTROY:
    case COMMAND_USE:
    case COMMAND_UNEQUIP:
    case COMMAND_ATTACK:
    case COMMAND_TALK:
    case COMMAND_BUY:
    case COMMAND_SELL:
    case COMMAND_PRACTICE:
    case COMMAND_TRAIN:
    case COMMAND_COMPARE:
    case COMMAND_RETURN:
    case COMMAND_SLEEP:
        return TURN_ON_SUCCESS;
    default:
        return TURN_NEVER;
    }
}

void game_describe_current_room(const GameState *state, GameOutput output)
{
    const Room *room;
    size_t index;
    WorldActorId cage_actor = WORLD_ACTOR_COUNT;

    if (state == NULL) {
        return;
    }

    room = world_find_room(state->room_id);
    if (room == NULL) {
        emit(output, "BLAD: NIEZNANY POKOJ.\n");
        return;
    }

    emit(output, "\n");
    emit(output, room->description);

    if (state->room_id == ROOM_LIVING_DOOR && state->living_door_alive) {
        emit(output,
            "\nDRZWI WYCIAGAJA SWE DREWNIANE RECE W TWYM KIERUNKU MOWIAC : NIE WPUSZCZE"
        );
    } else if (state->room_id == ROOM_ELF_HOUSE) {
        emit(output, state->old_elf_present
            ? "\nW ROGU ZAUWAZASZ MALEGO WYGLODZONEGO ELFIEGO STARUCHA"
            : "\nWIDZISZ TU TYLKO PLASZCZ PO STARUCHU KTORY ZNIKNA W PRZESTRZEN");
    }

    switch (state->room_id) {
    case ROOM_CAGE_WEAK:
        cage_actor = WORLD_ACTOR_CAGE_WEAK;
        break;
    case ROOM_CAGE_DEXTEROUS:
        cage_actor = WORLD_ACTOR_CAGE_DEXTEROUS;
        break;
    case ROOM_CAGE_RESISTANT:
        cage_actor = WORLD_ACTOR_CAGE_RESISTANT;
        break;
    case ROOM_CAGE_STRONG:
        cage_actor = WORLD_ACTOR_CAGE_STRONG;
        break;
    case ROOM_CAGE_ALL:
        cage_actor = WORLD_ACTOR_CAGE_ALL;
        break;
    default:
        break;
    }

    for (index = 0; index < world_actor_count(); ++index) {
        const WorldActor *actor = world_actor_at(index);

        if (actor != NULL
            && actor->id != WORLD_ACTOR_POKRZYWA
            && actor->id != WORLD_ACTOR_STARUCH
            && actor->id != WORLD_ACTOR_QUEST_MASTER
            && actor->id != WORLD_ACTOR_LIVING_DOOR
            && state->world_actor_rooms[index] == state->room_id) {
            emit(output, "\n");
            emit(output, actor->description);
        }
    }
    if (cage_actor != WORLD_ACTOR_COUNT
        && state->world_actor_rooms[cage_actor] != state->room_id) {
        emit(output, cage_actor == WORLD_ACTOR_CAGE_DEXTEROUS
            ? "\nPAROJACE WNETRZNOSCI POTWORA SMIERDZA DOSYC MOCNO"
            : "\nPAROJACE WNETRZNOSCI POTWORA SA ROZWLECZONE DOOKOLA");
    }

    for (index = 0; index < world_object_count(); ++index) {
        const WorldObject *object = world_object_at(index);

        if (object != NULL && state->world_object_rooms[index] == state->room_id) {
            emit(output, "\n");
            emit(output, object->description);
        }
    }
    emit(output, "\n");
}

static void describe_skill_poster(const GameState *state, GameOutput output)
{
    emit(output,
        "NA PLAKACIE PISZE:\n"
        "MOZESZ CWICZYC UZYWAJAC KOMENDY CWICZ RAZEM Z \n"
    );
    if (state->strength < 11) {
        emit(output, "Z NICZYM BO MASZ ZA MALA MADROSC\n");
    }
    if (state->strength > 10 && state->wisdom > 11) {
        emit(output, "KOPAC - KOMENDA:KOP \n");
    }
    if (state->strength > 10 && state->dexterity > 10) {
        emit(output, "UCIEKAC - KOMENDA : ZWIEJ \n");
    }
    if (state->strength > 15 && state->dexterity > 11) {
        emit(output, "PAROWANIE - SAMOCZYNNIE \n");
    }
    if (state->strength > 11) {
        emit(output, "POROWNANIE-KOMEDA POROWNAJ\n");
    }
    if (state->strength > 18) {
        emit(output, "POTRAWKI-SAMOCZYNNIE , PO WALCE\n");
    }
    if (state->strength > 17) {
        emit(output, "POWROT-KOMEDA POWROT\n");
    }
    if (state->dexterity > 20) {
        emit(output, "ZRECZNE RECE - KOMENDA : RECE\n");
    }
    if (state->wisdom > 20 && state->dexterity > 10) {
        emit(output, "KRZEPA : SAMOCZYNNIE\n");
    }
    if (state->strength > 19 && state->dexterity > 10 && state->wisdom > 10) {
        emit(output, "TARGOWANIE SIE : SAMOCZYNNIE\n");
    }
    if (state->wisdom > 25 && state->strength > 12) {
        emit(output, "WIROWANIE - SAMOCZYNNIE \n");
    }
    if (state->wisdom > 29 && state->strength > 14) {
        emit(output, "FATALITY - SAMOCZYNNIE \n");
    }
    if (state->dexterity > 22) {
        emit(output, "COMBO - SAMOCZYNNIE \n");
    }
    if (state->dexterity > 28) {
        emit(output, "SUPER COMBO - SAMOCZYNNIE \n");
    }
    if (state->strength > 22) {
        emit(output, "TRUCIZNA - SAMOCZYNNIE\n");
    }
    if (state->strength > 23) {
        emit(output, "UZDRAWIANIE - KOMENDA UZDROW\n");
    }
    if (state->dexterity > 24 && state->strength > 14 && state->wisdom > 14) {
        emit(output, "MOCNY SEN - SAMOCZYNNIE \n");
    }
    if (state->strength > 24) {
        emit(output, "OSLEPIANIE  - KOMEDA OSLEP \n");
    }
    if (state->strength > 26) {
        emit(output, "NEKROMANCJA - SAMOCZYNNIE \n");
    }
    if (state->wisdom > 12 && state->strength > 19 && state->dexterity > 12) {
        emit(output, "SZAL - KOMEDNA SZAL\n");
    }
    if (state->dexterity > 22 && state->strength > 16) {
        emit(output, "SIATKA - KOMENDA SIATKA\n");
    }
    if (state->dexterity > 30) {
        emit(output, "CIOS W PLECY - KOMENDA CIOS W (COS)\n");
    }
    if (state->strength > 29) {
        emit(output, "ROZPALANIE OGNISKA - KOMENDA ROZPAL\n");
    }
    if (state->strength > 19) {
        emit(output, "HIPER SPEED - KOMENDA SPEED\n");
    }
    if (state->strength > 23 && state->dexterity > 12) {
        emit(output, "PIECZENIE - KOMENDA PIECZ\n");
    }
    emit(output,
        "W STANIE PODSWIADOMOSCI KOMEDA ZDOLNOSCI SPRAWDZI TWE ZDOLNOSCI\n"
    );
}

static void look_at(GameState *state, const char *target, GameOutput output)
{
    const Room *room = world_find_room(state->room_id);

    if (target[0] == '\0') {
        game_describe_current_room(state, output);
        return;
    }

    if (strcmp(target, "PRZEPUSTKA") == 0) {
        if (state->item_quantities[ITEM_QUEST_PASS] > 0) {
            emit(output,
                "|========================|\n"
                "| Niniejszym zaswiadczam |\n"
                "|  Iz osoba posiadajaca  |\n"
                "|      Ten dokument      |\n"
                "|   Ukonczyla pozytywnie |\n"
                "| Jeden z moich questów  |\n"
                "|========================|\n"
            );
        }
        return;
    }

    if (state->room_id == ROOM_UNDERGROUND
        && strcmp(target, "PLAKAT") == 0) {
        describe_skill_poster(state, output);
        return;
    }

    if (room != NULL && room->look_target != NULL
        && strcmp(target, room->look_target) == 0) {
        emit_formatted(output, "%s\n", room->look_text);
        return;
    }
    if (state->room_id == ROOM_BRUSZCZ_SOUTH
        && strcmp(target, "STUDNIA") == 0) {
        int coins_found = (int)random_below(state, 3) + 1;

        emit_formatted(output,
            "ZAGLADASZ DO SRODKA STUDNI,COS TAM JEST,WYCIĄGASZ %d MONET!\n",
            coins_found
        );
        state->coins += coins_found;
        if (random_below(state, 100) < 10) {
            emit(output,
                "JAK SMIESZ PODBIERAC MOJE SWIETOSCI , GIN CHAMIE , GIN\n"
                "ODDAWAJ MOJE PIENIADZE !!!\n"
            );
            state->energy -= 40;
            if (state->energy < 0) {
                state->energy = 0;
            }
            state->coins -= 100;
            if (state->coins < 0) {
                state->coins = 0;
            }
        }
        return;
    }
    if (room != NULL && room->look_target_2 != NULL
        && strcmp(target, room->look_target_2) == 0) {
        emit_formatted(output, "%s\n", room->look_text_2);
        return;
    }
}

typedef enum {
    ITEM_ACTION_FAILED = 0,
    ITEM_ACTION_SUCCEEDED,
    ITEM_ACTION_DEFERRED
} ItemActionResult;

static bool is_protected_food(ItemId item)
{
    switch (item) {
    case ITEM_BLOODY_HEART:
    case ITEM_DOUGHNUT:
    case ITEM_CAKE:
    case ITEM_DRY_RATION:
    case ITEM_ROLL:
    case ITEM_BREAD:
    case ITEM_WEKA:
    case ITEM_BIGOS:
        return true;
    default:
        return false;
    }
}

static ItemActionResult take_item(
    GameState *state,
    const char *argument,
    GameOutput output
)
{
    static const char *const messages[WORLD_OBJECT_COUNT] = {
        "PODNOSISZ STARY ZARDZEWIALY MIECZ I MASZ JAROWE ZE GO POSIADASZ\n",
        "PODNOSISZ MALA TARCZA (JEST OKRAGLA)\n",
        "PODNOSISZ ZAKRWAWIONE SERCE (BLEEEE)\n",
        "PODNOSISZ DYPLOM MUD SZKOLY , I CZUJESZ PRZEPLYWAJACA PRZEZ CIEBIE MOC\n",
        "PODNOSISZ FAJKE \n"
    };
    const ItemDefinition *item = item_find(argument);
    size_t index;

    if (item == NULL || item->storage != ITEM_STORAGE_WORLD_LOCATION) {
        return ITEM_ACTION_FAILED;
    }
    index = (size_t)item->id;
    if (state->world_object_rooms[index] != state->room_id) {
        return ITEM_ACTION_FAILED;
    }

    emit(output, messages[index]);
    state->world_object_rooms[index] = BOMBKI_ROOM_NOWHERE;
    state->item_quantities[index] = 1;
    if (item->id == ITEM_SCHOOL_DIPLOMA) {
        state->maximum_energy += 5;
    } else if (item->id == ITEM_PIPE && state->wisdom < state->maximum_wisdom) {
        ++state->wisdom;
    }
    return ITEM_ACTION_SUCCEEDED;
}

static ItemActionResult drop_item(
    GameState *state,
    const char *argument,
    GameOutput output
)
{
    static const char *const messages[WORLD_OBJECT_COUNT] = {
        "ODRZUCASZ STARY ZARDZEWIALY MIECZ I MASZ JAROWE ZE GO NIE POSIADASZ\n",
        "ODRZUCASZ MALA ZWYKLA TARCZE \n",
        "ODRZUCASZ ZAKRWAWIONE SERCE \n",
        "ODRZUCASZ DYPLOM MUD SZKOLY , I PRZESTAJESZ CZUC PRZEPLYWAJACA PRZEZ CIEBIE MOC\n",
        "WYRZUCASZ FAJKE \n"
    };
    const ItemDefinition *item = item_find(argument);
    ItemActionResult result = ITEM_ACTION_FAILED;

    if (item == NULL) {
        return ITEM_ACTION_FAILED;
    }
    if (item->storage == ITEM_STORAGE_WORLD_LOCATION
        && state->item_quantities[item->id] > 0
        && !(item->id == ITEM_OLD_SWORD
            && state->equipped_weapon == ITEM_OLD_SWORD)
        && !(item->id == ITEM_SMALL_SHIELD
            && state->equipped_shield == ITEM_SMALL_SHIELD)) {
        emit(output, messages[item->id]);
        state->item_quantities[item->id] = 0;
        state->world_object_rooms[item->id] = state->room_id;
        if (item->id == ITEM_SCHOOL_DIPLOMA) {
            state->maximum_energy -= 5;
        } else if (item->id == ITEM_PIPE) {
            --state->wisdom;
        }
        result = ITEM_ACTION_SUCCEEDED;
    }
    if (is_protected_food(item->id)) {
        emit(output,
            "JAK SMIESZ WYRZUCAC JEDZENIE!!! WSTYD MI ZA CIEBIE !!! NIE POZWOLE !!!\n"
        );
    }
    return result;
}

static void restore_energy(GameState *state, int amount)
{
    state->energy += amount;
    if (state->energy > state->maximum_energy) {
        state->energy = state->maximum_energy;
    }
}

static void restore_mana(GameState *state, int amount)
{
    state->mana += amount;
    if (state->mana > state->maximum_mana) {
        state->mana = state->maximum_mana;
    }
}

static void consume_item(GameState *state, ItemId item)
{
    --state->item_quantities[item];
}

static ItemActionResult use_item(
    GameState *state,
    const char *argument,
    GameOutput output
)
{
    const ItemDefinition *definition = item_find(argument);
    ItemId item;

    if (definition == NULL) {
        return ITEM_ACTION_FAILED;
    }
    item = definition->id;

    switch (item) {
    case ITEM_OLD_SWORD:
        if (state->item_quantities[item] == 0
            || state->equipped_weapon != BOMBKI_NO_ITEM) {
            return ITEM_ACTION_FAILED;
        }
        emit(output, "UZYWASZ STAREGO ZARDZEWIALEGO MIECZA JAKO BRONI\n");
        state->equipped_weapon = item;
        ++state->strength;
        return ITEM_ACTION_SUCCEEDED;
    case ITEM_SMALL_SHIELD:
        if (state->item_quantities[item] == 0
            || state->equipped_shield != BOMBKI_NO_ITEM) {
            return ITEM_ACTION_FAILED;
        }
        emit(output, "UZYWASZ MALEJ TARCZY JAKO TARCZY\n");
        state->equipped_shield = item;
        return ITEM_ACTION_SUCCEEDED;
    case ITEM_BLOODY_HEART:
        if (state->item_quantities[item] == 0) {
            return ITEM_ACTION_FAILED;
        }
        consume_item(state, item);
        emit(output, "ZJADASZ ZAKRWAWIONE SERCE I ODZYSKUJESZ 5% ENERGII\n");
        restore_energy(state, 5);
        return ITEM_ACTION_SUCCEEDED;
    case ITEM_SCHOOL_DIPLOMA:
        if (state->item_quantities[item] == 0) {
            return ITEM_ACTION_FAILED;
        }
        emit(output,
            "PATRZYSZ SIE NA DYPLOM:\n"
            "--------------------------------------\n"
            "|         DYPLOM MUD SZKOLY          |\n"
            "|                                    |\n"
            "|                                    |\n"
            "|                                    |\n"
            "|  BRAWO! BEZ WIEKSZYCH PROBLEMOW    |\n"
            "|  PRZEBRNALES PRZEZ MUD SZKOLE      |\n"
            "|  W NAGRODE ZA DUZA AKTYWNOSC       |\n"
            "|  DAJE CI OTO TEN DYPLOM MUD SZKOLY |\n"
            "|____________________________________|\n"
        );
        return ITEM_ACTION_SUCCEEDED;
    case ITEM_PIPE:
        if (state->item_quantities[item] == 0) {
            return ITEM_ACTION_FAILED;
        }
        emit(output, "ZAPALASZ FAJECZKE I PYKASZ Z ZADOWOLENIEM\n");
        return ITEM_ACTION_SUCCEEDED;
    case ITEM_DOUGHNUT:
        if (state->item_quantities[item] == 0) {
            return ITEM_ACTION_FAILED;
        }
        consume_item(state, item);
        emit(output, "ZJADASZ PACZKA I TYJESZ 1 KILO (DOSTAJESZ 8%ENERGII)\n");
        restore_energy(state, 8);
        return ITEM_ACTION_SUCCEEDED;
    case ITEM_CAKE:
        if (state->item_quantities[item] == 0) {
            return ITEM_ACTION_FAILED;
        }
        consume_item(state, item);
        emit(output, "ZJADASZ CIASTKO I TYJESZ 2 KILO (DOSTAJESZ 12% ENERGII)\n");
        restore_energy(state, 12);
        return ITEM_ACTION_SUCCEEDED;
    case ITEM_DRY_RATION:
        if (state->item_quantities[item] == 0) {
            return ITEM_ACTION_FAILED;
        }
        consume_item(state, item);
        emit(output,
            "ZJADASZ SUCHA RACJE I CHUDNIESZ 3 KILO (DOSTAJESZ 16% ENERGII)\n"
        );
        restore_energy(state, 16);
        return ITEM_ACTION_SUCCEEDED;
    case ITEM_ROLL:
        if (state->item_quantities[item] == 0) {
            return ITEM_ACTION_FAILED;
        }
        consume_item(state, item);
        emit(output, "ZJADASZ BULKE I STWIERDZASZ ZE ZYSKALES 20%\n");
        restore_energy(state, 20);
        return ITEM_ACTION_SUCCEEDED;
    case ITEM_BREAD:
        if (state->item_quantities[item] == 0) {
            return ITEM_ACTION_FAILED;
        }
        consume_item(state, item);
        emit(output, "ZJADASZ DUZY CIEPLY CHLEB I JESTES PELEN (ZYSKUJESZ 26%)\n");
        restore_energy(state, 26);
        return ITEM_ACTION_SUCCEEDED;
    case ITEM_WEKA:
        if (state->item_quantities[item] == 0) {
            return ITEM_ACTION_FAILED;
        }
        consume_item(state, item);
        emit(output, "ZJADASZ DLUGASNA WEKE I TYJAC 15 KILO ZYSKUJESZ 34%\n");
        restore_energy(state, 34);
        return ITEM_ACTION_SUCCEEDED;
    case ITEM_BIGOS:
        if (state->item_quantities[item] == 0) {
            return ITEM_ACTION_FAILED;
        }
        consume_item(state, item);
        emit(output, "ZJADASZ BIGOS Z WROGA I ODZYSKUJESZ 20% ENERGI\n");
        restore_energy(state, 20);
        return ITEM_ACTION_SUCCEEDED;
    case ITEM_BEER:
        if (state->item_quantities[item] == 0) {
            return ITEM_ACTION_FAILED;
        }
        consume_item(state, item);
        emit(output,
            "GDY POCZULES AMBROZJE W USTACH ODZYSKALES 10 MANY ZAS GDY GO WYPILES 10% E.\n"
        );
        restore_mana(state, 10);
        restore_energy(state, 10);
        return ITEM_ACTION_SUCCEEDED;
    case ITEM_CLOTHES:
        if (state->item_quantities[item] == 0
            || state->equipped_clothing != BOMBKI_NO_ITEM) {
            return ITEM_ACTION_FAILED;
        }
        emit(output, "NAKLADASZ KOMPLET UBRAN FIRMY \"SYF\"\n");
        state->equipped_clothing = item;
        return ITEM_ACTION_SUCCEEDED;
    case ITEM_SPIKED_SUIT:
        if (state->item_quantities[item] == 0
            || state->equipped_clothing != BOMBKI_NO_ITEM) {
            return ITEM_ACTION_FAILED;
        }
        emit(output,
            "NAKLADASZ GARNITUR Z KOLCAMI NA SWE (NIE)WYSPORTOWANE CIALO\n"
        );
        state->equipped_clothing = item;
        return ITEM_ACTION_SUCCEEDED;
    case ITEM_SMALL_MANA_BOTTLE:
        if (state->item_quantities[item] == 0) {
            return ITEM_ACTION_FAILED;
        }
        consume_item(state, item);
        emit(output, "WYPIJASZ MALA BUTELKE MANY I ODZYSKUJESZ 30 MANY\n");
        restore_mana(state, 30);
        return ITEM_ACTION_SUCCEEDED;
    case ITEM_LUCKY_LEAF:
        if (state->item_quantities[item] == 0) {
            return ITEM_ACTION_FAILED;
        }
        emit(output, "LISTEK JEST TYPU SMIEC MAX PRZEDMIOTOW + 3 \n");
        return ITEM_ACTION_SUCCEEDED;
    case ITEM_LIROY_CASSETTE:
        emit(output, "TEN PRZEMIOT JEST TYPU : SMIEC . S.Z -8 MAXE +5 ZRE +1 \n");
        return ITEM_ACTION_SUCCEEDED;
    case ITEM_TRANSPORT_PILL:
        if (state->item_quantities[item] == 0) {
            return ITEM_ACTION_FAILED;
        }
        consume_item(state, item);
        emit(output,
            "WSZYSTKO ZACZYNA WIROWAC , POTEM NAGLY BLYSK I ZNAJDUJESZ SIE W PRZESZLOSCI\n"
        );
        if (state->wisdom < 10) {
            emit(output,
                "BRAK OBYCIA W POSLUGIWANIU SIE MAGICZNYMI PRZEDMIOTAMI SPRAWIL ZE \n"
                "ZNACZNIE OPADLES Z SIL I STALES SIE BARDZO ZMECZONY\n"
            );
            --state->maximum_energy;
            state->energy = 1;
            state->experience -= 50;
        } else if (state->wisdom < 16) {
            emit(output,
                "MASZ PEWNE OBYCIE W MAGICZNYCH PRZEDMIOTACH ALE MIMO WSZYSTKO\n"
                "OPADLES Z SIL I STALES SIE ZMECZONY\n"
            );
            state->energy -= 40;
            if (state->energy < 1) {
                state->energy = 1;
            }
            state->experience -= 30;
        } else {
            emit(output,
                "ZNASZ SIE NA TEGO TYPU PRZEDMIOTACH , WYSZEDLES Z TEGO BEZ SZWANKU\n"
            );
        }
        return ITEM_ACTION_SUCCEEDED;
    case ITEM_QUEST_PASS:
        return ITEM_ACTION_FAILED;
    case ITEM_COMPARISON_SCROLL:
        return state->item_quantities[item] > 0
            ? ITEM_ACTION_DEFERRED
            : ITEM_ACTION_FAILED;
    case ITEM_RETURN_SCROLL:
        if (state->item_quantities[item] == 0) {
            return ITEM_ACTION_FAILED;
        }
        consume_item(state, item);
        (void)random_below(state, 1);
        emit(output, "OTWIERASZ MAGICZNY PORTAL KTORY PRZENOSI CIE DO MIASTA\n");
        state->energy -= 15;
        if (state->energy < 0) {
            state->energy = 0;
        }
        game_clear_active_opponent(state);
        state->room_id = ROOM_CITY_THRESHOLD;
        return ITEM_ACTION_SUCCEEDED;
    case ITEM_BACKPACK:
    case ITEM_COUNT:
        return ITEM_ACTION_FAILED;
    }
    return ITEM_ACTION_FAILED;
}

static ItemActionResult unequip_item(
    GameState *state,
    const char *argument,
    GameOutput output
)
{
    const ItemDefinition *definition = item_find(argument);

    if (definition == NULL) {
        return ITEM_ACTION_FAILED;
    }
    switch (definition->id) {
    case ITEM_OLD_SWORD:
        if (state->equipped_weapon != ITEM_OLD_SWORD) {
            return ITEM_ACTION_FAILED;
        }
        emit(output,
            "CHOWASZ STARY ZARDZEWIALY MIECZ I NIE UZYWASZ GO JAKO BRONI\n"
        );
        state->equipped_weapon = BOMBKI_NO_ITEM;
        --state->strength;
        return ITEM_ACTION_SUCCEEDED;
    case ITEM_SMALL_SHIELD:
        if (state->equipped_shield != ITEM_SMALL_SHIELD) {
            return ITEM_ACTION_FAILED;
        }
        emit(output, "JUZ NIE UZYWASZ MALEJ TARCZY JAKO TARCZY\n");
        state->equipped_shield = BOMBKI_NO_ITEM;
        return ITEM_ACTION_SUCCEEDED;
    case ITEM_CLOTHES:
        if (state->equipped_clothing != ITEM_CLOTHES) {
            return ITEM_ACTION_FAILED;
        }
        emit(output, "ZDEJMUJESZ KOMPLET UBRAN FIRMY \"SYF\"\n");
        state->equipped_clothing = BOMBKI_NO_ITEM;
        return ITEM_ACTION_SUCCEEDED;
    case ITEM_SPIKED_SUIT:
        if (state->equipped_clothing != ITEM_SPIKED_SUIT) {
            return ITEM_ACTION_FAILED;
        }
        emit(output,
            "ZDEJMUJESZ GARNITUR Z KOLCAMI ZE SWEGO (NIE)WYSPORTOWANEGO CIALA\n"
        );
        state->equipped_clothing = BOMBKI_NO_ITEM;
        return ITEM_ACTION_SUCCEEDED;
    default:
        return ITEM_ACTION_FAILED;
    }
}

static ItemActionResult destroy_item(
    GameState *state,
    const char *argument,
    GameOutput output
)
{
    const ItemDefinition *definition = item_find(argument);

    if (definition == NULL || definition->id != ITEM_QUEST_PASS
        || state->item_quantities[ITEM_QUEST_PASS] == 0) {
        return ITEM_ACTION_FAILED;
    }
    emit(output, "GRRRRRRRRR .... GLUPIA PRZEPUSTKA\n");
    consume_item(state, ITEM_QUEST_PASS);
    state->quest_passage_open =
        state->item_quantities[ITEM_QUEST_PASS] > 0;
    return ITEM_ACTION_SUCCEEDED;
}

typedef struct {
    int room_id;
    ItemId item_id;
    int minimum_coins;
    int price;
    int resale_value;
    bool unique_stock;
    const char *purchase_text;
    const char *resale_text;
} ShopOffer;

/* Prices, messages, and the leaf's 820/830 discrepancy are recovered from
 * BOMBKI.EXE. Do not normalize the player-visible strings. */
static const ShopOffer shop_offers[] = {
    {ROOM_BAKERY, ITEM_DOUGHNUT, 8, 8, 0, false,
     "KUPUJESZ PACZEK ZA 8 MONET\n", NULL},
    {ROOM_BAKERY, ITEM_CAKE, 12, 12, 0, false,
     "KUPUJESZ CIASTKO ZA 12 MONET\n", NULL},
    {ROOM_BAKERY, ITEM_DRY_RATION, 15, 15, 0, false,
     "KUPUJESZ SUCHA RACJE ZA 15 MONET\n", NULL},
    {ROOM_BAKERY, ITEM_ROLL, 19, 19, 0, false,
     "KUPUJESZ BULKE ZA 19 MONET\n", NULL},
    {ROOM_BAKERY, ITEM_BREAD, 24, 24, 0, false,
     "KUPUJESZ CHLEB ZA 24 MONET\n", NULL},
    {ROOM_BAKERY, ITEM_WEKA, 29, 29, 0, false,
     "KUPUJESZ WEKE ZA 29 MONET\n", NULL},
    {ROOM_ARMORY, ITEM_OLD_SWORD, 70, 70, 30, true,
     "KUPUJESZ ZWYKLY MALY !STARY! MIECZYK ZA 70 MONET\n",
     "SPRZEDAWCA MOWI CI : WYPCHAJ SIE Z TYM MIECZEM\n"
     "ALBO DOBRA KUPIE GO OD CIEBIE ZA 30 MONET\n"},
    {ROOM_ARMORY, ITEM_SMALL_SHIELD, 15, 15, 8, true,
     "KUPUJESZ !MALA! TARCZA ZA 15 MONET\n",
     "TA TARCZA JEST BAJER,FRAJER KUPIE JA OD CIEBIE ZA 8 MONET\n"},
    {ROOM_GENERAL_STORE, ITEM_PIPE, 480, 480, 120, true,
     "KUPUJESZ FAJKE ZA 480 MONET\n",
     "SPRZEDAJESZ FAJKE ZA 120 MONET\n"},
    {ROOM_GENERAL_STORE, ITEM_CLOTHES, 35, 35, 15, true,
     "KUPUJESZ !KOMPLET! UBRAN FIRMY \"SYF\" ZA 35 MONET\n",
     "SPRZEDAJESZ !KOMPLET! UBRAN FIRMY \"SYF\" ZA 15 MONET\n"},
    {ROOM_GENERAL_STORE, ITEM_LIROY_CASSETTE, 1999, 1999, 1000, false,
     "KUPUJESZ KASETE LIROYA - L JAK LIROY ZA 1999 MONET\n",
     "SPRZEDAJESZ KASETE LIROYA - L JAK LIROY ZA 1000 MONET\n"},
    {ROOM_GENERAL_STORE, ITEM_SPIKED_SUIT, 1000, 1000, 500, false,
     "KUPUJESZ GARNITUR Z KOLCAMI ZA JEDYNE 1000 $\n",
     "SPRZEDAJESZ GARNITUR Z KOLCAMI ZA JEDYNE 500 $\n"},
    {ROOM_MAGIC_STORE, ITEM_SMALL_MANA_BOTTLE, 15, 20, 0, false,
     "KUPUJESZ MALA BUTELKA MANY ZA 20 MONET ( AHHHH TA INFLACJA ) \n",
     NULL},
    {ROOM_MAGIC_STORE, ITEM_LUCKY_LEAF, 820, 830, 400, false,
     "KUPUJESZ LISTEK KTORY PRZYNOSCI SZCZESCIE ZA 820 KESZU\n",
     "SPRZEDAJESZ LISTEK ZA 400 !!! CIESZ SIE\n"},
    {ROOM_MAGIC_STORE, ITEM_TRANSPORT_PILL, 235, 235, 170, false,
     "KUPUJESZ PIGULKE TRANSPORTUJACA ZA 235 MONET\n",
     "SPRZEDAWCA KUPUJE OD CIEBIE PIGULKE ZA 170 MONET\n"},
    {ROOM_MAGIC_STORE, ITEM_COMPARISON_SCROLL, 40, 40, 18, false,
     "SPRZEDAWCA SPRZEDAJE CI SCROLL ZA 40 MONET\n",
     "SPRZEDAWCA KUPUJE OD CIEBIE SCROLL ZA NEDZNE 18 MONET\n"}
};

static const ShopOffer *find_shop_offer(int room_id, ItemId item_id)
{
    size_t index;

    for (index = 0; index < sizeof(shop_offers) / sizeof(shop_offers[0]); ++index) {
        if (shop_offers[index].room_id == room_id
            && shop_offers[index].item_id == item_id) {
            return &shop_offers[index];
        }
    }
    return NULL;
}

static bool unique_item_is_in_stock(const GameState *state, ItemId item_id)
{
    if (state->item_quantities[item_id] != 0) {
        return false;
    }
    if (item_id <= ITEM_PIPE
        && state->world_object_rooms[item_id] != BOMBKI_ROOM_NOWHERE) {
        return false;
    }
    return true;
}

static void apply_carried_item_effect(GameState *state, ItemId item_id, int sign)
{
    switch (item_id) {
    case ITEM_PIPE:
        if (sign > 0 && state->wisdom < state->maximum_wisdom) {
            ++state->wisdom;
        } else if (sign < 0 && state->wisdom > 0) {
            --state->wisdom;
        }
        break;
    case ITEM_LIROY_CASSETTE:
        state->maximum_energy += sign * 5;
        state->dexterity += sign;
        if (state->energy > state->maximum_energy) {
            state->energy = state->maximum_energy;
        }
        break;
    case ITEM_LUCKY_LEAF:
        state->maximum_mana += sign * 40;
        if (state->mana > state->maximum_mana) {
            state->mana = state->maximum_mana;
        }
        break;
    default:
        break;
    }
}

typedef enum {
    UNIQUE_DROP_SPIKED_SUIT = 0,
    UNIQUE_DROP_TRANSPORT_PILL,
    UNIQUE_DROP_LIROY_CASSETTE,
    UNIQUE_DROP_LUCKY_LEAF,
    UNIQUE_DROP_COMPARISON_SCROLL
} UniqueDrop;

static bool try_unique_drop(
    GameState *state,
    UniqueDrop drop,
    GameOutput output
)
{
    ItemId item_id;
    size_t roll_limit;
    size_t successful_rolls;
    const char *text;

    switch (drop) {
    case UNIQUE_DROP_SPIKED_SUIT:
        item_id = ITEM_SPIKED_SUIT;
        roll_limit = 1000;
        successful_rolls = 26;
        text =
            "ZYSKUJESZ GARNITUR !!!! Z CIALA WROGA !!!!\n"
            "PRZEDMIOT UNIQE !!! 2.5% !!! \n";
        break;
    case UNIQUE_DROP_TRANSPORT_PILL:
        item_id = ITEM_TRANSPORT_PILL;
        roll_limit = 1000;
        successful_rolls = 43;
        text =
            "HMMM , A TO CO ? , TOZ TO !!! PIGULKA TRANSPORTUJACA !!! PROSTO Z CIALA WROGA\n";
        break;
    case UNIQUE_DROP_LIROY_CASSETTE:
        item_id = ITEM_LIROY_CASSETTE;
        roll_limit = 100;
        successful_rolls = 2;
        text =
            "WYCIAGASZ KASETE LIROYA Z CIALA BIEDNEGO CZLOWIEKA\n"
            "!!! PRZEDMIOT UNIQE 2% !!!\n";
        break;
    case UNIQUE_DROP_LUCKY_LEAF:
        item_id = ITEM_LUCKY_LEAF;
        roll_limit = 100;
        successful_rolls = 6;
        text =
            "WYCIAGASZ LISTEK SZCZESCIA Z CIALA WROGIEJ TOBIE POSTACI\n"
            "!!! PRZEDMIOT UNIQE 4% !!!\n";
        break;
    case UNIQUE_DROP_COMPARISON_SCROLL:
        item_id = ITEM_COMPARISON_SCROLL;
        roll_limit = 100;
        successful_rolls = 10;
        text =
            "WYCIAGASZ SCROLL POROWNANIA Z WROGIEJ TOBIE POSTACI\n";
        break;
    default:
        return false;
    }

    if (random_below(state, roll_limit) >= successful_rolls) {
        return false;
    }
    ++state->item_quantities[item_id];
    apply_carried_item_effect(state, item_id, 1);
    emit(output, text);
    return true;
}

size_t game_resolve_enemy_loot(
    GameState *state,
    GameLootSource source,
    GameOutput output
)
{
    size_t acquired = 0;

    if (state == NULL || source < 0 || source >= GAME_LOOT_SOURCE_COUNT) {
        return 0;
    }

    switch (source) {
    case GAME_LOOT_TAKSOWKARZ:
    case GAME_LOOT_SPRZEDAWCA:
    case GAME_LOOT_GORYL:
    case GAME_LOOT_OCHRONIARZ:
    case GAME_LOOT_TRENER:
        acquired += try_unique_drop(
            state, UNIQUE_DROP_SPIKED_SUIT, output
        );
        break;
    case GAME_LOOT_PEDAL:
    case GAME_LOOT_GLADIATOR:
    case GAME_LOOT_WOJOWNIK:
        acquired += try_unique_drop(
            state, UNIQUE_DROP_TRANSPORT_PILL, output
        );
        break;
    case GAME_LOOT_POKRZYWA:
        acquired += try_unique_drop(state, UNIQUE_DROP_LUCKY_LEAF, output);
        acquired += try_unique_drop(
            state, UNIQUE_DROP_TRANSPORT_PILL, output
        );
        acquired += try_unique_drop(
            state, UNIQUE_DROP_COMPARISON_SCROLL, output
        );
        break;
    case GAME_LOOT_PERKUSISTA:
    case GAME_LOOT_GITARZYSTA:
    case GAME_LOOT_LIROY:
    case GAME_LOOT_ORGANISTA:
        acquired += try_unique_drop(
            state, UNIQUE_DROP_LIROY_CASSETTE, output
        );
        break;
    case GAME_LOOT_DJ: {
        size_t roll = random_below(state, 100);

        if (roll < 25) {
            ++state->item_quantities[ITEM_DRY_RATION];
            emit(output, "WYCIAGASZ SUCHA RACJA Z CIALA D.J-a\n");
            ++acquired;
        }
        if (roll < 3) {
            ++state->item_quantities[ITEM_LIROY_CASSETTE];
            apply_carried_item_effect(state, ITEM_LIROY_CASSETTE, 1);
            emit(output,
                "WYCIAGASZ KASETE LIROYA Z CIALA D.J-a\n"
                "!!! PRZEDMIOT UNIQE 3% !!!\n"
            );
            ++acquired;
        }
        break;
    }
    case GAME_LOOT_SOURCE_COUNT:
        break;
    }
    return acquired;
}

static bool loot_source_for_actor(
    WorldActorId actor,
    GameLootSource *source
)
{
    switch (actor) {
    case WORLD_ACTOR_TAKSOWKARZ:
        *source = GAME_LOOT_TAKSOWKARZ;
        return true;
    case WORLD_ACTOR_SPRZEDAWCA_PRECELKOW:
        *source = GAME_LOOT_SPRZEDAWCA;
        return true;
    case WORLD_ACTOR_GORYL:
        *source = GAME_LOOT_GORYL;
        return true;
    case WORLD_ACTOR_OCHRONIARZ:
        *source = GAME_LOOT_OCHRONIARZ;
        return true;
    case WORLD_ACTOR_TRENER:
        *source = GAME_LOOT_TRENER;
        return true;
    case WORLD_ACTOR_GLADIATOR:
        *source = GAME_LOOT_GLADIATOR;
        return true;
    case WORLD_ACTOR_WOJOWNIK:
        *source = GAME_LOOT_WOJOWNIK;
        return true;
    case WORLD_ACTOR_POKRZYWA:
        *source = GAME_LOOT_POKRZYWA;
        return true;
    case WORLD_ACTOR_PERKUSISTA:
        *source = GAME_LOOT_PERKUSISTA;
        return true;
    case WORLD_ACTOR_GITARZYSTA:
        *source = GAME_LOOT_GITARZYSTA;
        return true;
    case WORLD_ACTOR_LIROY:
        *source = GAME_LOOT_LIROY;
        return true;
    case WORLD_ACTOR_ORGANISTA:
        *source = GAME_LOOT_ORGANISTA;
        return true;
    default:
        return false;
    }
}

static bool recovered_world_drop_is_available(
    const GameState *state,
    ItemId item
)
{
    return state->item_quantities[item] == 0
        && state->world_object_rooms[item] == BOMBKI_ROOM_NOWHERE;
}

static bool reward_roll_succeeds(
    GameState *state,
    EnemyDropChance chance
)
{
    return chance.roll_limit > 0
        && random_below(state, (size_t)chance.roll_limit)
            < (size_t)chance.successful_rolls;
}

static void place_recovered_world_drop(
    GameState *state,
    ItemId item,
    EnemyDropChance chance,
    const char *message,
    GameOutput output
)
{
    if (!recovered_world_drop_is_available(state, item)
        || !reward_roll_succeeds(state, chance)) {
        return;
    }

    state->world_object_rooms[item] = state->room_id;
    emit(output, message);
}

static void resolve_ordinary_enemy_rewards(
    GameState *state,
    const EnemyRewardProfile *rewards,
    GameOutput output
)
{
    int coins = roll_enemy_stat(state, rewards->coins);

    if (state->coins <= INT_MAX - coins) {
        state->coins += coins;
    } else {
        state->coins = INT_MAX;
    }

    switch (rewards->kind) {
    case ENEMY_REWARD_STANDARD:
        emit_formatted(output, "WYCIAGASZ %d MONET Z CIALA\n", coins);
        if (recovered_world_drop_is_available(state, ITEM_BLOODY_HEART)
            && reward_roll_succeeds(state, rewards->bloody_heart)) {
            state->item_quantities[ITEM_BLOODY_HEART] = 1;
            emit(output, "WYCIAGASZ SERCE Z CIALA TRUPA\n");
        }
        break;
    case ENEMY_REWARD_DOG:
        emit_formatted(output, "WYCIAGASZ %d MONET Z CIALA PSA\n", coins);
        place_recovered_world_drop(
            state,
            ITEM_BLOODY_HEART,
            rewards->bloody_heart,
            "WYCIAGASZ ZAKRWAWIONE SERCE Z CIALA PSA\n",
            output
        );
        break;
    case ENEMY_REWARD_CAGE:
        emit_formatted(output, "WYCIAGASZ %d MONET Z CIALA POTWORA\n", coins);
        place_recovered_world_drop(
            state,
            ITEM_OLD_SWORD,
            rewards->old_sword,
            "WYCIAGASZ STARY ZARDZEWIALY MIECZ Z CIALA POTWORA\n",
            output
        );
        place_recovered_world_drop(
            state,
            ITEM_SMALL_SHIELD,
            rewards->small_shield,
            "WYCIAGASZ ZWYKLA MALA TARCZA Z CIALA POTWORA\n",
            output
        );
        place_recovered_world_drop(
            state,
            ITEM_BLOODY_HEART,
            rewards->bloody_heart,
            "WYCIAGASZ ZAKRWAWIONE SERCE Z CIALA POTWORA\n",
            output
        );
        break;
    case ENEMY_REWARD_NONE:
        break;
    }
}

static int recovered_combat_chance(const GameState *state);

static void resolve_victory_kunszt(GameState *state, GameOutput output)
{
    int reward = recovered_combat_chance(state);

    if (state->active_opponent_maximum_energy > 75) {
        reward -= 2;
    }
    if (state->active_opponent_maximum_energy > 115) {
        reward -= 3;
    }
    if (state->parry_skill > 50) {
        reward -= 2;
    }
    if (state->parry_skill > 75) {
        reward -= 2;
    }
    if (state->parry_skill > 95) {
        --reward;
    }
    if (state->kick_skill > 50) {
        reward -= 5;
    }
    if (state->kick_skill > 95) {
        reward -= 2;
    }
    if (reward < 0) {
        reward = 0;
    }

    emit_formatted(output,
        "ZABILES GO ! ZYSKUJESZ ZA TO %d KUNSZTU \n",
        reward
    );
    add_clamped(&state->experience, reward);
}

static void try_cook_defeated_enemy(GameState *state, GameOutput output)
{
    size_t roll;

    if (state->cooking_skill <= 0) {
        return;
    }

    roll = random_below(state, 100);
    if ((size_t)state->cooking_skill <= roll) {
        return;
    }

    emit(output, "ROBISZ SOBIE PYSZNY PYSZNY BIGOS Z KAPUSTA Z WROGA\n");
    if (state->item_quantities[ITEM_BIGOS] < INT_MAX) {
        ++state->item_quantities[ITEM_BIGOS];
    }

    if (roll < 1 && state->cooking_skill < 100) {
        emit(output, "UCZYSZ SIE ZDOLNOSCI POTRAWKI !!! \n");
        ++state->cooking_skill;
        state->experience = state->experience > INT_MAX - 10
            ? INT_MAX
            : state->experience + 10;
    }
}

static void resolve_staruch_consequence(GameState *state, GameOutput output)
{
    state->old_elf_present = false;
    state->world_actor_rooms[WORLD_ACTOR_STARUCH] = BOMBKI_ROOM_NOWHERE;
    emit(output,
        "HMMM UBRANIE JEST , ALE CIALO GDZIES ZNIKNELO , WTEM SLYSZYSZ GLOS :\n"
        "--- TO BYL TWOJ BLAD --- , DOSTAJESZ OCMIENIA LECZ NIE WIESZ CO TO BYLO\n"
    );
    state->level = state->level > 0 ? state->level - 1 : 255;
}

bool game_resolve_active_opponent_victory(
    GameState *state,
    GameOutput output
)
{
    WorldActorId actor;
    const EnemyProfile *profile;
    GameLootSource loot_source;

    if (state == NULL
        || state->active_opponent_actor < 0
        || state->active_opponent_actor >= WORLD_ACTOR_COUNT
        || state->active_opponent_energy != 0) {
        return false;
    }

    actor = (WorldActorId)state->active_opponent_actor;
    if (state->world_actor_rooms[actor] != state->room_id) {
        return false;
    }
    profile = enemy_profile_find(enemy_profile_for_world_actor(actor));
    if (profile == NULL) {
        return false;
    }

    if (state->energy > 0) {
        resolve_victory_kunszt(state, output);
    }
    resolve_ordinary_enemy_rewards(state, &profile->rewards, output);
    if (state->energy > 0) {
        try_cook_defeated_enemy(state, output);
    }
    state->world_actor_rooms[actor] = BOMBKI_ROOM_NOWHERE;
    if (loot_source_for_actor(actor, &loot_source)) {
        (void)game_resolve_enemy_loot(state, loot_source, output);
    }
    if (state->quest_type > 0) {
        add_clamped(&state->quest_progress, -1);
    }
    if (actor == WORLD_ACTOR_LIROY && state->quest_type > 1) {
        add_clamped(&state->quest_progress, -150);
    }
    if (actor == WORLD_ACTOR_POKRZYWA && state->duncan_quest != 0) {
        state->duncan_quest = (state->duncan_quest - 50) & 0xff;
    }
    if (actor == WORLD_ACTOR_POKRZYWA && state->energy > 0) {
        emit(output,
            "UFFF,TO BYLA PRZYGODA,WOKOL GROMADZILY SIE SETKI MLECZOW - NIE MIALBYS SZANS\n"
        );
        state->room_id = ROOM_CAVE_ENTRANCE;
    }
    if (actor == WORLD_ACTOR_QUEST_MASTER) {
        if (state->item_quantities[ITEM_QUEST_PASS] < INT_MAX) {
            ++state->item_quantities[ITEM_QUEST_PASS];
        }
        state->quest_passage_open = true;
        state->world_actor_rooms[WORLD_ACTOR_QUEST_MASTER] = ROOM_JUNCTION;
    }
    if (actor == WORLD_ACTOR_LIVING_DOOR) {
        state->living_door_alive = false;
    }
    if (actor == WORLD_ACTOR_STARUCH && state->energy > 0) {
        resolve_staruch_consequence(state, output);
    }
    game_clear_active_opponent(state);
    return true;
}

static size_t recovered_dodge_roll(
    GameState *state,
    int dexterity_difference,
    bool advantaged_dodger
)
{
    size_t roll = 0;

    if (dexterity_difference > 30) {
        roll = random_below(state, advantaged_dodger ? 12 : 60);
    }
    if (dexterity_difference > 27 && dexterity_difference < 31) {
        roll = random_below(state, advantaged_dodger ? 13 : 58);
    }
    if (dexterity_difference > 24 && dexterity_difference < 28) {
        roll = random_below(state, advantaged_dodger ? 14 : 56);
    }
    if (dexterity_difference > 20 && dexterity_difference < 31) {
        roll = random_below(state, advantaged_dodger ? 15 : 54);
    }
    if (dexterity_difference > 18 && dexterity_difference < 21) {
        roll = random_below(state, advantaged_dodger ? 16 : 52);
    }
    if (dexterity_difference > 16 && dexterity_difference < 19) {
        roll = random_below(state, advantaged_dodger ? 17 : 51);
    }
    if (dexterity_difference > 12 && dexterity_difference < 17) {
        roll = random_below(state, advantaged_dodger ? 18 : 48);
    }
    if (dexterity_difference > 9 && dexterity_difference < 13) {
        roll = random_below(state, advantaged_dodger ? 19 : 46);
    }
    if (dexterity_difference > 6 && dexterity_difference < 10) {
        roll = random_below(state, advantaged_dodger ? 20 : 42);
    }
    if (dexterity_difference > 4 && dexterity_difference < 7) {
        roll = random_below(state, advantaged_dodger ? 21 : 40);
    }
    if (dexterity_difference > 2 && dexterity_difference < 5) {
        roll = random_below(state, advantaged_dodger ? 22 : 38);
    }
    if (dexterity_difference < 3) {
        roll = random_below(state, advantaged_dodger ? 23 : 35);
    }
    return roll;
}

static int recovered_combat_chance(const GameState *state)
{
    int chance = 0;
    int64_t difference;

    difference = (int64_t)state->maximum_energy
        - state->active_opponent_maximum_energy;
    if (difference > 0) {
        if (difference < 4) {
            chance += 10;
        }
        if (difference > 2 && difference < 7) {
            chance += 9;
        }
        if (difference > 6 && difference < 10) {
            chance += 8;
        }
        if (difference > 9 && difference < 13) {
            chance += 7;
        }
        if (difference > 12 && difference < 16) {
            chance += 6;
        }
        if (difference > 15 && difference < 19) {
            chance += 5;
        }
        if (difference > 18 && difference < 22) {
            chance += 4;
        }
        if (difference > 21 && difference < 25) {
            chance += 3;
        }
        if (difference > 24 && difference < 28) {
            chance += 2;
        }
        if (difference > 27 && difference < 31) {
            chance += 1;
        }
    } else if (difference < 0) {
        difference = -difference;
        if (difference == 2) {
            chance += 12;
        }
        if (difference == 4) {
            chance += 13;
        }
        if (difference == 6) {
            chance += 14;
        }
        if (difference == 8) {
            chance += 15;
        }
        if (difference == 10) {
            chance += 16;
        }
        if (difference == 12) {
            chance += 17;
        }
        if (difference == 14) {
            chance += 18;
        }
        if (difference == 16) {
            chance += 19;
        }
        if (difference == 18) {
            chance += 20;
        }
        if (difference > 20) {
            chance += 21;
        }
    } else {
        chance += 11;
    }

    difference = (int64_t)state->strength - state->active_opponent_strength;
    if (difference > 0) {
        if (difference >= 1 && difference <= 8) {
            chance += 11 - (int)difference;
        } else if (difference == 9) {
            chance += 2;
        } else if (difference == 10) {
            chance += 1;
        }
    } else if (difference < 0) {
        difference = -difference;
        if (difference >= 1 && difference <= 9) {
            chance += 11 + (int)difference;
        } else if (difference > 9) {
            chance += 21;
        }
    } else {
        chance += 11;
    }

    difference = (int64_t)state->dexterity
        - state->active_opponent_dexterity;
    if (difference > 0) {
        if (difference <= 20) {
            chance += 11 - (int)((difference + 1) / 2);
        }
    } else if (difference < 0) {
        difference = -difference;
        if (difference <= 20) {
            chance += 11 + (int)((difference + 1) / 2);
        }
    } else {
        chance += 11;
    }

    return chance;
}

static bool try_automatic_flee(GameState *state, GameOutput output)
{
    int chance;

    if (state->flee_skill <= 0
        || state->energy >= state->flee_energy_threshold) {
        return false;
    }

    chance = recovered_combat_chance(state);
    if (chance <= 14) {
        return false;
    }
    chance -= 15;
    if ((int)random_below(state, 100) > chance) {
        emit(output, "NIE UDALO CI SIE UCIEC !!!! WALCZYSZ DALEJ !!! \n");
        return false;
    }

    emit(output, "WSTYD !!! UCIEKLES Z POLA BITWY TRACISZ 20 KUNSZTU\n");
    if (state->experience < INT_MIN + 20) {
        state->experience = INT_MIN;
    } else {
        state->experience -= 20;
    }
    game_clear_active_opponent(state);
    return true;
}

void game_set_flee_energy_threshold(GameState *state, int threshold)
{
    if (state != NULL) {
        state->flee_energy_threshold = threshold;
    }
}

void game_set_kick_thresholds(
    GameState *state,
    int energy_threshold,
    int mana_threshold
)
{
    if (state != NULL) {
        state->kick_energy_threshold = energy_threshold;
        state->kick_mana_threshold = mana_threshold;
    }
}

static void spend_mana(GameState *state, int amount)
{
    state->mana = amount >= state->mana ? 0 : state->mana - amount;
}

static void try_automatic_kick(GameState *state, GameOutput output)
{
    int damage;
    int mana_cost;

    if (state->kick_skill <= 0
        || state->mana <= state->kick_mana_threshold
        || state->energy >= state->kick_energy_threshold) {
        return;
    }

    if ((int64_t)state->kick_skill - 10
        >= (int64_t)random_below(state, 100)) {
        damage = (int)random_below(state, (size_t)state->level)
            + (int)random_below(state, 10);
        emit_formatted(output,
            "TWOJ SUPER KOP ZABIERA %d%% ENERGI\n",
            damage
        );
        mana_cost = (int)random_below(state, 3) + 3;
        spend_mana(state, mana_cost);
        state->active_opponent_energy =
            damage >= state->active_opponent_energy
                ? 0
                : state->active_opponent_energy - damage;
    } else {
        emit(output, "TWOJ SUPER KOP CHYBIA PRZECIWNIKA \n");
    }

    mana_cost = (int)random_below(state, 2) + 2;
    spend_mana(state, mana_cost);
}

static void describe_enemy_damage(int damage, GameOutput output)
{
    if (damage < 6) {
        emit_formatted(output,
            "PRZECIWNIK CIE TYLKO DRASNA I TRACISZ %d%% ENERGII\n",
            damage
        );
    } else if (damage < 21) {
        emit_formatted(output, "DOSTALES I TRACISZ %d%% ENERGII\n", damage);
    } else if (damage < 51) {
        emit_formatted(output,
            "PRZECIWNIK !MASAKRUJE! CIEBIE I TRACISZ AZ %d%% ENERGII\n",
            damage
        );
    } else {
        emit_formatted(output,
            "PRZECIWNIK !!!WYPRUWA FLAKI!!! Z CIEBIE I TRACISZ !!! %d%% ENERGII\n",
            damage
        );
    }
}

static void describe_player_damage(int damage, GameOutput output)
{
    if (damage < 6) {
        emit_formatted(output,
            "MASZ PECHA : LEKKO POPCHNALES GO I STRACIL TYLKO %d%% ENERGII\n",
            damage
        );
    } else if (damage < 21) {
        emit_formatted(output, "DOSTAL I STRACIL %d%% ENERGII\n", damage);
    } else if (damage < 51) {
        emit_formatted(output,
            " !MASAKRUJESZ! PRZECIWNIKA I TRACI ON AZ %d%% ENERGII\n",
            damage
        );
    } else {
        emit_formatted(output,
            " !!!WYPRUWASZ FLAKI!!! Z PRZECIWNIKA I TRACI ON  !!!! %d%% ENERGII\n",
            damage
        );
    }
}

static int apply_small_shield(
    GameState *state,
    int damage,
    GameOutput output
)
{
    if (state->equipped_shield != ITEM_SMALL_SHIELD
        || random_below(state, 100) > 10) {
        return damage;
    }

    if (damage > 0) {
        --damage;
    }
    emit_formatted(output, "OSLONILES SIE ! TRACISZ %d ENERGII\n", damage);
    return damage;
}

static int apply_automatic_parry(
    GameState *state,
    int damage,
    GameOutput output
)
{
    int luck;

    if (state->parry_skill <= 0 || damage <= 0) {
        return damage;
    }

    luck = (int)random_below(state, 140);
    if (luck > state->parry_skill) {
        return damage;
    }

    if (damage < 3) {
        emit(output,
            "            <<<<<ODPAROWUJESZ ATAK PRZECIWNIKA !!! TRACISZ 0% ENERGI\n"
        );
        damage = 0;
    }
    if (damage > 2 && damage < 10) {
        damage -= 2;
        emit_formatted(output,
            "            <<<<<ODPAROWUJESZ ATAK PRZECIWNIKA !!! TRACISZ %d%% ENERGI\n",
            damage
        );
    }
    if (damage > 9) {
        damage -= 3;
        emit_formatted(output,
            "            <<<<<ODPAROWUJESZ ATAK PRZECIWNIKA !!! TRACISZ %d%% ENERGI\n",
            damage
        );
    }

    if (luck < 1 && state->parry_skill < 100) {
        emit(output,
            "*************** UCZYSZ SIE ZDOLNOSCI PAROWANIE !!!!! ***************\n"
        );
        ++state->parry_skill;
        state->experience = state->experience > INT_MAX - 5
            ? INT_MAX
            : state->experience + 5;
    }
    return damage;
}

static void apply_enemy_magic(GameState *state, GameOutput output)
{
    int damage;

    if (state->active_opponent_fireballs > 0
        && random_below(state, 100) < 10) {
        damage = (int)random_below(state, 20);
        emit_formatted(output,
            "PRZECIWNIK PUSZCZA FIREBALLA W TWYM KIERUNKU - TRACISZ %d%% ENERGII\n",
            damage
        );
        state->energy = damage >= state->energy ? 0 : state->energy - damage;
        --state->active_opponent_fireballs;
    }

    if (state->active_opponent_poison_casts > 0
        && random_below(state, 100) < 10) {
        emit(output, "PRZECIWNIK RZUCA CZAR \"POISON\" \n");
        --state->active_opponent_poison_casts;
        state->poison_turns = state->poison_turns > INT_MAX - 10
            ? INT_MAX
            : state->poison_turns + 10;
    }

    if (state->poison_turns > 0) {
        damage = (int)random_below(state, 5);
        emit_formatted(output,
            "JESTES ZATRUTY - TRACISZ %d%% ENERGI\n",
            damage
        );
        state->energy = damage >= state->energy ? 0 : state->energy - damage;
        --state->poison_turns;
    }
}

static void resolve_player_death(GameState *state, GameOutput output)
{
    int64_t adjusted_experience;

    emit(output,
        "AJAJAJAJ TWOJA GLOWA NAWALA JAK TESCIOWA!!!\n"
        "NIC NA TO NIE PORADZE , TRZEBA BYLO SIE STARAC\n"
        "NAGLE REFLEKSJA - DO JASNEJ CENZURY JAK SIE WALCZYLO TYM MIECZEM?\n"
        "NIESTETY WRAZ ZE SMIERCIA TRACISZ KUNSZT ADEKWATNIE DO TWOJEGO LEVELKA\n"
        "POJAWISZ SIE W CENTRUM MIASTA ..... POWODZENIA\n"
        "P.S : AHA POTWORY SIE ODREGENEROWALY\n"
    );

    state->energy = state->maximum_energy;
    adjusted_experience = (int64_t)state->experience
        - 250
        + (int)random_below(state, 50)
        - 5 * (int64_t)state->level;
    if (adjusted_experience < INT_MIN) {
        state->experience = INT_MIN;
    } else if (adjusted_experience > INT_MAX) {
        state->experience = INT_MAX;
    } else {
        state->experience = (int)adjusted_experience;
    }
    if (state->quest_type == 1) {
        state->quest_progress = 50;
    } else if (state->quest_type > 1) {
        state->quest_progress = 200;
    }
    state->room_id = ROOM_CITY_THRESHOLD;
    game_regenerate_encounters(state);
}

static bool resolve_basic_combat_round(
    GameState *state,
    const char *target,
    GameOutput output
)
{
    WorldActorId opponent;
    bool player_dodged = false;
    bool opponent_dodged = false;
    int difference;
    int damage;

    if (state->energy <= 0 || !game_select_opponent(state, target)) {
        return false;
    }
    opponent = (WorldActorId)state->active_opponent_actor;

    emit_formatted(output,
        "WALCZYSZ - <<<<TWOJ WROG MA %d%%>>>><<<< A TY MASZ %d%% ENERGII>>>>>\n",
        state->active_opponent_energy,
        state->energy
    );

    difference = state->dexterity - state->active_opponent_dexterity;
    if (difference > 0) {
        player_dodged = recovered_dodge_roll(state, difference, true) < 10;
        if (player_dodged) {
            emit(output,
                "UNIKASZ CIOSU WROGA TWEGO I SMIEJESZ SIE Z JEGO NIEPORADNOSCI\n"
            );
        }
        opponent_dodged = recovered_dodge_roll(state, difference, false) < 10;
        if (opponent_dodged) {
            emit(output, "PRZECIWNIK UNIKA TWOJEGO LAMERSKIEGO ATAKU\n");
        }
    } else if (difference < 0) {
        difference = -difference;
        opponent_dodged = recovered_dodge_roll(state, difference, true) < 10;
        if (opponent_dodged) {
            emit(output, "PRZECIWNIK Z GRACJA UNIKA TWEGO CIOSU\n");
        }
        player_dodged = recovered_dodge_roll(state, difference, false) < 10;
        if (player_dodged) {
            emit(output, "BEZ PARDONU OMIJASZ CIOS TWOJEGO PRZECIWNIKA\n");
        }
    }

    if (!player_dodged) {
        damage = (int)random_below(
            state,
            state->active_opponent_strength > 0
                ? (size_t)state->active_opponent_strength
                : 0
        );
        describe_enemy_damage(damage, output);
        damage = apply_small_shield(state, damage, output);
        damage = apply_automatic_parry(state, damage, output);
        state->energy = damage >= state->energy ? 0 : state->energy - damage;
        apply_enemy_magic(state, output);
    }

    if (!opponent_dodged) {
        damage = (int)random_below(
            state,
            state->strength > 0 ? (size_t)state->strength : 0
        );
        describe_player_damage(damage, output);
        state->active_opponent_energy =
            damage >= state->active_opponent_energy
                ? 0
                : state->active_opponent_energy - damage;
    }

    try_automatic_kick(state, output);
    if (try_automatic_flee(state, output)) {
        if (opponent == WORLD_ACTOR_STARUCH) {
            resolve_staruch_consequence(state, output);
        }
        return true;
    }
    (void)game_resolve_active_opponent_victory(state, output);
    if (state->energy == 0) {
        emit(output, "!!!!!!!!!!!ZOSTALES ZABITY!!!!!!!!!!!!\n");
        resolve_player_death(state, output);
        if (opponent == WORLD_ACTOR_STARUCH) {
            resolve_staruch_consequence(state, output);
        }
    }
    return true;
}

static bool practice_fleeing(GameState *state, GameOutput output)
{
    int64_t improved;

    if (state->strength <= 10
        || state->dexterity <= 10
        || state->practices <= 0
        || state->flee_skill >= 85) {
        emit(output,
            "ALBO MASZ ZA DOBRZE WYTRENOWANE ALBO ZA MALO PRAKTYK\n"
        );
        return false;
    }

    improved = (int64_t)state->flee_skill
        + state->strength
        + state->dexterity
        - 5;
    state->flee_skill = improved > INT_MAX ? INT_MAX : (int)improved;
    --state->practices;
    emit_formatted(output,
        "CWICZYSZ UCIEKANIE - PRAWDOPODOBIENSTWO JEST TERAZ %d%% MASZ %d PRAKTYK\n",
        state->flee_skill,
        state->practices
    );
    return true;
}

static bool practice_kicking(GameState *state, GameOutput output)
{
    int64_t improved;

    if (state->strength <= 10
        || state->dexterity <= 11
        || state->practices <= 0) {
        return false;
    }

    improved = (int64_t)state->kick_skill + state->strength;
    state->kick_skill = improved > INT_MAX ? INT_MAX : (int)improved;
    --state->practices;
    emit_formatted(output,
        "CWICZYSZ KOPANIE - PRAWDOPODOBIENSTWO JEST TERAZ %d%% MASZ %d PRAKTYK\n",
        state->kick_skill,
        state->practices
    );
    return true;
}

static bool practice_comparison(GameState *state, GameOutput output)
{
    int64_t improved;

    if (state->strength <= 11
        || state->comparison_skill >= 90
        || state->practices <= 0) {
        return false;
    }

    improved = (int64_t)state->comparison_skill
        + 3 * (int64_t)state->strength
        - 9;
    state->comparison_skill = improved > INT_MAX ? INT_MAX : (int)improved;
    --state->practices;
    emit_formatted(output,
        "CWICZYSZ POROWNYWANIE - PRAWDOPODOBIENSTWO JEST TERAZ %d%% MASZ %d PRAKTYK\n",
        state->comparison_skill,
        state->practices
    );
    return true;
}

static bool practice_parrying(GameState *state, GameOutput output)
{
    int64_t improved;

    if (state->strength <= 15
        || state->dexterity <= 11
        || state->parry_skill >= 90
        || state->practices <= 0) {
        return false;
    }

    improved = (int64_t)state->parry_skill
        + state->strength
        + state->dexterity
        - 14;
    state->parry_skill = improved > INT_MAX ? INT_MAX : (int)improved;
    --state->practices;
    emit_formatted(output,
        "CWICZYSZ PAROWANIE - PRAWDOPODOBIENSTWO JEST TERAZ %d%% MASZ %d PRAKTYK\n",
        state->parry_skill,
        state->practices
    );
    return true;
}

static bool practice_cooking(GameState *state, GameOutput output)
{
    int64_t improved;

    if (state->strength <= 18
        || state->cooking_skill >= 90
        || state->practices <= 0) {
        return false;
    }

    improved = (int64_t)state->cooking_skill + state->strength + 1;
    state->cooking_skill = improved > INT_MAX ? INT_MAX : (int)improved;
    --state->practices;
    emit_formatted(output,
        "CWICZYSZ POTRAWKI - PRAWDOPODOBIENSTWO JEST TERAZ %d%% MASZ %d PRAKTYK\n",
        state->cooking_skill,
        state->practices
    );
    return true;
}

static bool practice_returning(GameState *state, GameOutput output)
{
    int64_t improved;

    if (state->strength <= 17
        || state->return_skill >= 90
        || state->practices <= 0) {
        return false;
    }

    improved = (int64_t)state->return_skill
        + 2 * (int64_t)state->strength
        - 3;
    state->return_skill = improved > INT_MAX ? INT_MAX : (int)improved;
    --state->practices;
    emit_formatted(output,
        "CWICZYSZ POWRACANIE - PRAWDOPODOBIENSTWO JEST TERAZ %d%% MASZ %d PRAKTYK\n",
        state->return_skill,
        state->practices
    );
    return true;
}

static int native_room_for_original_location(int original_room)
{
    if (original_room >= 33 && original_room <= 57) {
        return ROOM_ARENA_33 + original_room - 33;
    }

    switch (original_room) {
    case 1: return ROOM_CENTRAL;
    case 2: return ROOM_TRAINING;
    case 3: return ROOM_UNDERGROUND;
    case 4: return ROOM_SCHOOL;
    case 5: return ROOM_SCHOOL_TWO;
    case 6: return ROOM_SCHOOL_WEST_ROOM;
    case 7: return ROOM_SCHOOL_NORTH_ROOM;
    case 8: return ROOM_SCHOOL_SOUTH_ROOM;
    case 9: return ROOM_SCHOOL_UP_ROOM;
    case 10: return ROOM_SCHOOL_DOWN_ROOM;
    case 11: return ROOM_CAGE_HALL;
    case 12: return ROOM_CAGE_WEAK;
    case 13: return ROOM_CAGE_DEXTEROUS;
    case 14: return ROOM_CAGE_RESISTANT;
    case 15: return ROOM_CAGE_STRONG;
    case 16: return ROOM_CAGE_ALL;
    case 17: return ROOM_TELEPORT;
    case 18: return ROOM_TELEPORT_EFFECT;
    case 20: return ROOM_CITY_THRESHOLD;
    case 21: return ROOM_SHOP_STREET;
    case 22: return ROOM_SHOP_STREET_NORTH;
    case 23: return ROOM_BAKERY;
    case 24: return ROOM_ARMORY;
    case 25: return ROOM_DARK_STREET;
    case 28: return ROOM_GENERAL_STORE;
    case 29: return ROOM_MAGIC_STORE;
    case 30: return ROOM_LONG_STREET;
    case 31: return ROOM_LONG_STREET_WEST;
    case 32: return ROOM_ARENA_ENTRANCE;
    case 60: return ROOM_ENTERTAINMENT_VALLEY;
    case 61: return ROOM_CONCERT_HALL;
    case 62: return ROOM_CROWD_SOUTH;
    case 63: return ROOM_CROWD_NORTH;
    case 64: return ROOM_CROWD_CENTRE;
    case 65: return ROOM_CROWD_SOUTHEAST;
    case 66: return ROOM_CROWD_NORTHEAST;
    case 67: return ROOM_BEER_HALL;
    case 68: return ROOM_STAGE_ENTRANCE;
    case 69: return ROOM_STAGE_BACK;
    case 70: return ROOM_STAGE;
    case 71: return ROOM_STAGE_CENTRE;
    case 72: return ROOM_STAGE_END;
    case 75: return ROOM_BAR;
    case 77: return ROOM_BRUSZCZ;
    case 78: return ROOM_BRUSZCZ_EAST;
    case 79: return ROOM_BRUSZCZ_WEST;
    case 80: return ROOM_BRUSZCZ_SOUTH;
    case 81: return ROOM_BRUSZCZ_SOUTH_WEST;
    case 82: return ROOM_BRUSZCZ_SOUTH_EAST;
    case 83: return ROOM_FOREST;
    case 84: return ROOM_FOREST_WEST;
    case 85: return ROOM_LIVING_DOOR;
    case 86: return ROOM_ELF_HOUSE;
    case 87: return ROOM_CAVE_ENTRANCE;
    case 88: return ROOM_CAVE;
    case 100: return ROOM_JUNCTION;
    default: return ROOM_START;
    }
}

static bool resolve_return(GameState *state, GameOutput output)
{
    int roll;

    if (state->return_skill <= 0) {
        return false;
    }

    roll = (int)random_below(state, 100);
    if (roll <= state->return_skill) {
        emit(output,
            "OTWIERASZ MAGICZNY PORTAL KTORY PRZENOSI CIE DO MIASTA\n"
        );
        spend_mana(state, 15);
        state->room_id = ROOM_CITY_THRESHOLD;
        game_clear_active_opponent(state);
    } else if ((int64_t)roll < (int64_t)state->return_skill + 30) {
        emit(output, "NIE UDAJE CI SIE OTWORZYC MAGICZNEGO PORTALU\n");
        spend_mana(state, 5);
    } else {
        int original_room = (int)random_below(state, 100) + 1;

        emit(output,
            "OTWIERASZ MAGICZNY PORTAL KTORY JEDNAK PRZENOSI CIE DO INNEGO MIEJSCA\n"
        );
        spend_mana(state, 10);
        state->room_id = native_room_for_original_location(original_room);
        game_clear_active_opponent(state);
    }
    return true;
}

static void describe_abilities(const GameState *state, GameOutput output)
{
    if (state->strength > 10 && state->wisdom > 11) {
        emit_formatted(output, "KOPANIE       - %d%%\n", state->kick_skill);
    }
    if (state->strength > 10 && state->dexterity > 10) {
        emit_formatted(output, "UCIEKANIE     - %d%%\n", state->flee_skill);
    }
    if (state->strength > 15 && state->dexterity > 11) {
        emit_formatted(output, "PAROWANIE     - %d%%\n", state->parry_skill);
    }
    if (state->strength > 11) {
        emit_formatted(output,
            "POROWNYWANIE  - %d%%\n",
            state->comparison_skill
        );
    }
    if (state->strength > 18) {
        emit_formatted(output, "POTRAWKI      - %d%%\n", state->cooking_skill);
    }
    if (state->strength > 19) {
        emit_formatted(output, "POWROT        - %d%%\n", state->return_skill);
    }
}

static void continue_sleep(GameState *state, GameOutput output)
{
    if (state->sleep_hours < INT_MAX) {
        ++state->sleep_hours;
    }
    emit_formatted(output, "SPISZ JUZ %d GODZIN\n", state->sleep_hours);
    add_clamped(&state->experience, -20);
    add_clamped(&state->energy, 10);
    advance_turn(state, output);
}

static void wake_from_sleep(GameState *state, GameOutput output)
{
    int hours = state->sleep_hours;
    size_t random_limit;
    int64_t displayed_loss;

    if (hours <= 0) {
        return;
    }

    random_limit = (size_t)hours * 2;
    displayed_loss = 20 * (int64_t)hours
        - (int64_t)random_below(state, random_limit);
    emit_formatted(output,
        "PO OBUDZENIU STWIERDZILES ZE ZYSKALES %lld ENERGI I STRACILES %lld KUNSZTU\n",
        (long long)(10 * (int64_t)hours),
        (long long)displayed_loss
    );
    add_clamped(
        &state->experience,
        (int64_t)random_below(state, random_limit)
    );

    if (hours > 4) {
        emit_formatted(output,
            "DLUGI SEN DODATKOWO POZWOLIL CI ODPOCZAC : ZYSKALES %dENERGI\n",
            state->strength
        );
        add_clamped(&state->energy, state->strength);
    }
    if (hours > 8) {
        emit_formatted(output,
            "PELNOWARTOSCIOWY SEN SPOWODOWAL SUPER ZYSK : %lldENERGI\n",
            (long long)(2 * (int64_t)state->strength)
        );
        add_clamped(&state->energy, 2 * (int64_t)state->strength);
    }
    if (state->energy > state->maximum_energy) {
        state->energy = state->maximum_energy;
    }
    state->sleep_hours = 0;
}

static bool train_attribute(GameState *state, const char *attribute,
    GameOutput output)
{
    if (state->room_id != ROOM_TRAINING) {
        return false;
    }
    if (attribute[0] == '\0') {
        emit(output, "CO CHCESZ TRENOWAC?\n");
        return false;
    }
    if (strcmp(attribute, "SILA") == 0
        && state->practices > 2
        && state->strength < state->maximum_strength) {
        ++state->strength;
        state->practices -= 3;
        emit_formatted(output,
            "TRENUJESZ SILE I MASZ %d SILY I ZOSTALO CI %d PRAKTYK\n",
            state->strength,
            state->practices
        );
        return true;
    }
    if (strcmp(attribute, "ZRECZNOSC") == 0
        && state->practices > 1
        && state->dexterity < state->maximum_dexterity) {
        ++state->dexterity;
        state->practices -= 2;
        emit_formatted(output,
            "TRENUJESZ ZRECZNOSC I MASZ %d ZRECZNOSCI I ZOSTALO CI %d PRAKTYK\n",
            state->dexterity,
            state->practices
        );
        return true;
    }
    if (strcmp(attribute, "MADROSC") == 0
        && state->practices > 2
        && state->wisdom < state->maximum_wisdom) {
        ++state->wisdom;
        state->practices -= 3;
        emit_formatted(output,
            "TRENUJESZ MADROSC I MASZ %d MADROSCI I ZOSTALO CI %d PRAKTYK\n",
            state->wisdom,
            state->practices
        );
        return true;
    }
    return false;
}

static void normalize_comparison_target(
    const char *input,
    char *output,
    size_t capacity
)
{
    size_t read_index = 0;
    size_t write_index = 0;
    bool pending_space = false;

    if (capacity == 0) {
        return;
    }
    while (input != NULL && input[read_index] != '\0') {
        unsigned char character = (unsigned char)input[read_index++];

        if (isspace(character)) {
            if (write_index > 0) {
                pending_space = true;
            }
            continue;
        }
        if (pending_space && write_index + 1 < capacity) {
            output[write_index++] = ' ';
        }
        pending_space = false;
        if (write_index + 1 < capacity) {
            output[write_index++] = (char)toupper(character);
        }
    }
    output[write_index] = '\0';
}

static bool comparison_target_is(
    const char *target,
    const char *const *names,
    size_t count
)
{
    size_t index;

    for (index = 0; index < count; ++index) {
        if (strcmp(target, names[index]) == 0) {
            return true;
        }
    }
    return false;
}

static int comparison_score(const GameState *state)
{
    int64_t score = (int64_t)state->level + state->strength;

    if (state->dexterity >= 8 && state->dexterity <= 21) {
        score += state->dexterity / 2;
    }
    if (state->parry_skill > 75) {
        ++score;
    }
    if (state->parry_skill > 50) {
        ++score;
    }
    if (state->kick_skill > 10) {
        score += 2;
    }
    if (state->kick_skill > 70) {
        score += 2;
    }
    if (score > INT_MAX) {
        return INT_MAX;
    }
    if (score < INT_MIN) {
        return INT_MIN;
    }
    return (int)score;
}

static void emit_comparison_advice(
    const GameState *state,
    const char *target,
    int score,
    GameOutput output
)
{
    static const char *const small_targets[] = {
        "DZIK", "SZCZUR", "LIS", "KUROPATWA", "ZAJAC", "WILCZUR",
        "ORZEL", "SARNA", "DZIECKO", "DZIADEK"
    };
    static const char *const animal_targets[] = {
        "SLON", "LEW", "ZYRAFA", "WIELBLAD", "STRUS", "BOA", "WILK",
        "BIZON", "PANTERA", "WARIAT", "SLUCHACZ", "FAN", "CZLOWIEK",
        "REPORTER"
    };
    static const char *const fighter_targets[] = {
        "GLADIATOR", "WOJOWNIK", "TRENER", "POLICJANT", "GORYL",
        "OCHRONIARZ"
    };
    static const char *const club_targets[] = {
        "MINI-BARMAN", "GRUBAS", "D.J"
    };
    static const char *const simple_targets[] = {
        "TAKSOWKARZ", "SPRZEDAWCA", "GITARZYSTA", "PERKUSISTA",
        "ORGANISTA", "ZEBRAK", "PIJAK", "ZAMIATACZ", "SZCZAW",
        "STOKROTKA", "KONICZYNKA", "MLECZ", "DMUCHAWIEC"
    };
    static const char *const plant_targets[] = {
        "PEDAL", "PARA", "MACIEK", "ROZA", "MALINA", "TRAWA", "AGREST",
        "JEZYNA"
    };
    static const char *const dog_targets[] = {
        "SPANIEL", "OWCZAREK", "PIESEK", "JAMNIK", "PUDEL"
    };

    if (comparison_target_is(target, small_targets,
            sizeof(small_targets) / sizeof(small_targets[0]))) {
        if (score < 16) {
            emit(output,
                "NICZEGO NIE MOGE ZAGWARANTOWAC ..... MACIE PODOBNE PARAMETRY\n"
            );
        }
        if (state->strength > 15 && state->strength < 19) {
            emit(output,
                "PRZECIWNIK GODNY TWEJ DUMY , RACZEJ NIE POGRASZ\n"
            );
        }
        if (state->strength > 18) {
            emit(output,
                "WSTYD MI ZA CIEBIE ... JESZCZE TU JESTES ! NA CO CZEKASZ ? KILLUJ\n"
            );
        }
    }
    if (comparison_target_is(target, animal_targets,
            sizeof(animal_targets) / sizeof(animal_targets[0]))) {
        if (score < 16) {
            emit(output, "TAK  TAK MAMA KUPI BERECIK GLOWKA W PORZADKU ? \n");
        }
        if (state->strength > 15 && state->strength < 21) {
            emit(output, " NA TWOIM MIEJSCU BYM SIE NIE ZAPUSZCZAL \n");
        }
        if (state->strength > 20 && state->strength < 23) {
            emit(output,
                " RYZYK FIZYK - TAK NA 50% - WALKA NA SMIERC I ZYCIE\n"
            );
        }
        if (state->strength > 22) {
            emit(output, "SPOX KILLUJ BEZ UPRZEDZEN\n");
        }
    }
    if (comparison_target_is(target, fighter_targets,
            sizeof(fighter_targets) / sizeof(fighter_targets[0]))) {
        if (score < 15) {
            emit(output,
                "HA HA NIE NA SERJO . DAJ SE W ZYLE OKI? TO DOWCIP? HA HA HA\n"
            );
        }
        if (score > 14 && score < 18) {
            emit(output, "POMARZ SOBIE WARIACIE . MOZE CI SIE PRZYSNI\n");
        }
        if (score > 17 && score < 23) {
            emit(output, "POWIEM  BEZ OGRODEK-TO GLUPI POMYSL\n");
        }
        if (score > 22 && score < 26) {
            emit(output, "TO DOSC RYZYKOWNE ZE TAK POWIEM\n");
        }
        if (score > 25) {
            emit(output,
                "TO BEDZIE TAK PROSTE JAK ZABICIE DZIECKA TOPOREM !!!\n"
            );
        }
    }
    if (comparison_target_is(target, club_targets,
            sizeof(club_targets) / sizeof(club_targets[0]))) {
        if (score < 24) {
            emit(output, "SMIERC PODZIEKUJE CI ZA TWOJ DAR (ALE ZGAPIAM)\n");
        }
        if (score > 23 && score < 26) {
            emit(output, "NIE UDAWAJ BISTY-BOYS PRZEGRASZ NA 99%\n");
        }
        if (score > 25 && score < 29) {
            emit(output, "PERFEKCYJNY MECZ NA SMIERC I ZYCIE !!!\n");
        }
        if (score > 28) {
            emit(output, "JESTES ZNACZNIE SILNIEJSZY !!!(ALE GLUPSZY)\n");
        }
        if (score > 34) {
            emit(output, "UWAZAJ DOSTANIESZ MALO KUNSZTU !!!\n");
        }
    }
    if (comparison_target_is(target, simple_targets,
            sizeof(simple_targets) / sizeof(simple_targets[0]))) {
        if (score < 21) {
            emit(output, "NIE\n");
        }
        if (score > 21 && score < 28) {
            emit(output, "RACZEJ NIE , CHOC MOZNA ZARYZYKOWAC(NIE POLECAM)\n");
        }
        if (score > 27) {
            emit(output, "TAK\n");
        }
    }
    if (comparison_target_is(target, plant_targets,
            sizeof(plant_targets) / sizeof(plant_targets[0]))) {
        if (score < 20) {
            emit(output,
                "WIERZ MI ALE TO NAPRAWDE WIERZ MI ZE NIE MASZ SZANS\n"
            );
        }
        if (score > 19 && score < 26) {
            emit(output, "RACZEJ NIE WYGRASZ WIEC LEPIEJ NIE ATAKUJ\n");
        }
        if (score > 25 && score < 30) {
            emit(output,
                "JESTESCIE SOBIE ROWNI (NAPRAWDE !!!) - WIEC 50% SZANS\n"
            );
        }
        if (score > 29) {
            emit(output,
                "JESTES SILNIEJSZY STAD WNIOSEK ZE SOBIE PORADZISZ\n"
            );
        }
        if (score > 35) {
            emit(output,
                "P.S - JESTES DUZO DUZO SILNIEJSZY ZABIJ BEZ OGRODEK!!!\n"
            );
        }
    }
    if (strcmp(target, "LIROY") == 0) {
        if (score < 28) {
            emit(output,
                "HAHAHAHAHAHAHAHAHAHHAHOHOHOHHOHOHOHOHOHOHOHOAHAHAHAHAHAHAH\n"
            );
        }
        if (score > 27 && score < 33) {
            emit(output, "HIHIHIHIHIHIHIHHEHEHEHE :))))))\n");
        }
        if (score > 32 && score < 44) {
            emit(output, "SPROOBÓJ A MOŻE WYGRAC SIE UDA......\n");
        }
        if (score > 43 && score < 48) {
            emit(output,
                "NIE PRZEJMUJ SIE JEGO MORDĄ JESTES SILNIEJSZY I BASTA\n"
            );
        }
        if (score > 47) {
            emit(output,
                "UWAZAJ ... NA CHLAPIACE MOZGI FLAKI PRZECIWNIKA\n"
            );
        }
    }
    if (strcmp(target, "POKRZYWA") == 0) {
        if (score < 40) {
            emit(output, "NIE MASZ NAJMNIEJSZYCH SZANS\n");
        }
        if (score > 39) {
            emit(output,
                "JEST PEWNE PRAWDOPODOBIENSTWO WYGRANIA TEGO STARCIA\n"
            );
        }
    }
    if (comparison_target_is(target, dog_targets,
            sizeof(dog_targets) / sizeof(dog_targets[0]))) {
        emit(output,
            "JASNE ZE MOZESZ GO ZABIC ZABIJ !!! ZABIJ . TEN PARSZYWY PIES NIE MA RACJI BYTU\n"
        );
    }
}

void game_resolve_comparison_target(
    GameState *state,
    const char *target,
    bool used_scroll,
    GameOutput output
)
{
    char normalized[BOMBKI_ARGUMENT_CAPACITY];
    int luck;

    if (state == NULL || target == NULL
        || (used_scroll
            && state->item_quantities[ITEM_COMPARISON_SCROLL] <= 0)) {
        return;
    }

    luck = (int)random_below(state, 100);
    normalize_comparison_target(target, normalized, sizeof(normalized));
    emit_comparison_advice(
        state,
        normalized,
        comparison_score(state),
        output
    );

    if (luck < 3 && state->comparison_skill < 100) {
        emit(output,
            "***************** UCZYSZ SIE ZDOLNOSCI POROWNYWANIE *****************\n"
        );
        ++state->comparison_skill;
        state->experience = state->experience > INT_MAX - 5
            ? INT_MAX
            : state->experience + 5;
    }
    if (strcmp(normalized, "BAKTERIA") == 0) {
        emit(output, "BAKTERIA MA MAGIC RESISTANCE\n");
        state->mana = state->mana > INT_MAX - 5
            ? INT_MAX
            : state->mana + 5;
    }

    spend_mana(state, 10);
    if (used_scroll) {
        consume_item(state, ITEM_COMPARISON_SCROLL);
    }
    advance_turn(state, output);
}

static GameAction begin_comparison(
    GameState *state,
    bool used_scroll,
    GameOutput output
)
{
    if (used_scroll) {
        if (state->item_quantities[ITEM_COMPARISON_SCROLL] <= 0) {
            return GAME_ACTION_NONE;
        }
    } else {
        if (state->comparison_skill <= 0) {
            return GAME_ACTION_NONE;
        }
        if ((int64_t)state->comparison_skill
            <= (int64_t)random_below(state, 100)) {
            emit(output,
                "POPELNILES PEWNE BLEDY I NIE UDALO SIE WYKONAC CZARU\n"
            );
            spend_mana(state, 5);
            advance_turn(state, output);
            return GAME_ACTION_NONE;
        }
    }

    if (state->mana <= 9) {
        spend_mana(state, 10);
        if (used_scroll) {
            consume_item(state, ITEM_COMPARISON_SCROLL);
        }
        advance_turn(state, output);
        return GAME_ACTION_NONE;
    }

    emit(output, "KOGO CHCESZ ZE SOBA POROWNAC?\n");
    return used_scroll
        ? GAME_ACTION_COMPARISON_SCROLL_TARGET
        : GAME_ACTION_COMPARISON_TARGET;
}

static ItemActionResult buy_shop_item(
    GameState *state,
    const char *argument,
    GameOutput output
)
{
    const ItemDefinition *definition = item_find(argument);
    const ShopOffer *offer;
    ItemActionResult duncan_result;

    if (state->room_id == ROOM_JUNCTION) {
        int price = 0;
        int quest_type = 0;
        int quest_progress = 0;
        const char *text = NULL;

        if (strcmp(argument, "LATWY QUEST") == 0) {
            price = 200;
            quest_type = 1;
            quest_progress = 75;
            text = "ZABIJ 75 POTWOROW\n";
        } else if (strcmp(argument, "PRZECIETNY QUEST") == 0) {
            price = 100;
            quest_type = 2;
            quest_progress = 200;
            text = "ZABIJ 50 POTWOROW W TYM LIROYA I DAJ MI DYPLOM MUD SZKOLY\n";
        } else if (strcmp(argument, "TRUDNY QUEST") == 0) {
            price = 50;
            quest_type = 3;
            quest_progress = 200;
            text = "ZABIJ 50 POTWOROW W TYM LIROYA I DAJ MI FAJKE I POSWIEC 1 PRAKTYKE\n";
        }
        if (quest_type != 0) {
            if (state->coins < price) {
                return ITEM_ACTION_FAILED;
            }
            emit(output, text);
            state->quest_type = quest_type;
            state->quest_progress = quest_progress;
            state->coins -= price;
            return ITEM_ACTION_SUCCEEDED;
        }
    }
    if (definition == NULL) {
        return ITEM_ACTION_FAILED;
    }
    duncan_result = ITEM_ACTION_FAILED;
    if (state->duncan_black_market_unlocked
        && definition->id == ITEM_QUEST_PASS
        && state->coins >= 400
        && state->item_quantities[ITEM_QUEST_PASS] < INT_MAX) {
        state->coins -= 400;
        ++state->item_quantities[ITEM_QUEST_PASS];
        state->quest_passage_open = true;
        emit(output,
            "OTO PODROBIONA PRZEPUSTKA HE , HE NAWET QUEST-MASTER SIE NIE POKAPUJE\n"
        );
        duncan_result = ITEM_ACTION_SUCCEEDED;
    } else if (state->duncan_black_market_unlocked
        && definition->id == ITEM_BACKPACK
        && state->world_actor_rooms[WORLD_ACTOR_DUNCAN] == state->room_id
        && state->coins >= 4800
        && state->item_quantities[ITEM_BACKPACK] < INT_MAX) {
        state->coins -= 4800;
        ++state->item_quantities[ITEM_BACKPACK];
        emit(output, "HE HE HE MILO SIE Z TOBA ROBI INTERESY\n");
        duncan_result = ITEM_ACTION_SUCCEEDED;
    }
    if (duncan_result == ITEM_ACTION_SUCCEEDED) {
        return duncan_result;
    }
    offer = find_shop_offer(state->room_id, definition->id);
    if (offer == NULL || state->coins < offer->minimum_coins
        || (offer->unique_stock
            && !unique_item_is_in_stock(state, offer->item_id))) {
        return ITEM_ACTION_FAILED;
    }

    state->coins -= offer->price;
    ++state->item_quantities[offer->item_id];
    if (offer->item_id <= ITEM_PIPE) {
        state->world_object_rooms[offer->item_id] = BOMBKI_ROOM_NOWHERE;
    }
    apply_carried_item_effect(state, offer->item_id, 1);
    emit(output, offer->purchase_text);
    return ITEM_ACTION_SUCCEEDED;
}

static bool talk_to_duncan(GameState *state, GameOutput output)
{
    if (state->world_actor_rooms[WORLD_ACTOR_DUNCAN] != state->room_id) {
        return false;
    }

    if (state->duncan_quest == 0) {
        emit(output,
            "UCH A COZ TO ZA STRASZNA ROSLINA - PRZELAKL SIE DUNCAN WIDZAC CIEBIE\n"
            "AAA TO JAKIS WAL A NIE ROSLINA , MOWI PO CHWILI,JAK CI SIE NUDZI TO \n"
            "MOZESZ POMOC MI WYRYWAC CHWASTY , SZCZEGOLNIA ZABOJCZA DLA MOICH MARCHEWECZEK\n"
            "JEST TA WREDNA POKRZYWA , SZKODA ZE TAK JAK INNE POTWORY SIE ODREGENEROWUJE\n"
            "ALE JAK JA ZABIJESZ , POWIEDZMY ... 4 RAZY TO MOZE DA SOBIE SPOKOJ\n"
            "CO CI DAM W ZAMIAN ? TROCHE KUNSZTU , A MOJ STARY PRACUJE NA CZARNYM RYNKU\n"
        );
        state->duncan_quest = 75;
    }
    if (state->duncan_quest != 0) {
        emit(output,
            "TO CO ZABIJESZ TE ROSLINY CZY BEDZIEMY TU STAC JAK OSTATNIE LOSIE?\n"
        );
    }
    if (state->duncan_quest == 131) {
        emit(output,
            "DZIEKI DZIEKI , TO BYLA DOBRA ROBOTA , OD TERAZ MOZESZ PISAC PRZY MNIE :\n"
            "SECRET LISTA , TO MOZE AKURAT BEDE COS MIAL NA ZBYCIU , ADIOS\n"
            "--------- ZDOBYLES 125 KUNSZTU ------------------------\n"
        );
        state->duncan_quest = 0;
        state->duncan_black_market_unlocked = true;
        add_clamped(&state->experience, 125);
    }
    return true;
}

static bool talk_to_old_elf(GameState *state, GameOutput output)
{
    if (state->room_id != ROOM_ELF_HOUSE) {
        return false;
    }

    if (state->item_quantities[ITEM_WEKA] < 3
        && state->coins < 200
        && state->item_quantities[ITEM_RETURN_SCROLL] == 0) {
        emit(output,
            "STARUCH MOWI CI : HEJ KTO TY JESTES CZY ZE MAGICZNE DRZWI NIE POWSTRZYMALY CIE?\n"
            "MUSISZ BYC NIEZLYM WOJOWNIKIEM ,SPOXOLANDIA, GLODNY JESTEM PRZYNIES MI 4 WEKI \n"
            "ORAZ OKOLO 200 KASY , A DAM CI TAKIE NUMERY O JAKICH CI SIE NIE SNILO....\n"
        );
    }

    if (state->item_quantities[ITEM_WEKA] >= 4 && state->coins >= 200) {
        emit(output,
            "STARUCH MOWI CI : OOO JAKA PIEKNA WEKA ... MNIAM I DRUGA TRZECIA I CZWARTA\n"
            "TO BYLO DOBRE ZARCIE !!! , DAWAJ KASE , PIENIADZE !!! , CO SIE TAK GAPISZ?\n"
            "WYNOCHA STAD !!! MRAMMMARAMMARAMAAMMARAM BUM !! -T-E-L-E-P-O-R-T-Y\n"
            "WYGLADA ZE ZROBIL CIE W BUCA , A MOZE JEDNAK NIE , CO TO ? , SCROLL POWROTU\n"
            "I PIWSKO NA OSLODZENIE ZYCIA , NO TRUDNO PRZYNAJMNIEJ CZEGOS SIE NAUCZYLES\n"
        );
        state->item_quantities[ITEM_WEKA] -= 4;
        state->coins -= 200;
        if (state->item_quantities[ITEM_BEER] < INT_MAX) {
            ++state->item_quantities[ITEM_BEER];
        }
        if (state->item_quantities[ITEM_RETURN_SCROLL] < INT_MAX) {
            ++state->item_quantities[ITEM_RETURN_SCROLL];
        }
        add_clamped(&state->experience, 50);
        state->room_id = ROOM_CITY_THRESHOLD;
    }

    if (state->item_quantities[ITEM_RETURN_SCROLL] > 0) {
        emit(output, "AAAA SPADAJ STAD BO CI KOSCI POLAMIE\n");
        state->room_id = ROOM_CAGE_ALL;
    }
    return true;
}

static void list_duncan_market(const GameState *state, GameOutput output)
{
    if (!state->duncan_black_market_unlocked
        || state->world_actor_rooms[WORLD_ACTOR_DUNCAN] != state->room_id) {
        return;
    }
    emit(output,
        "OTO CO AKTUALNIE MAM DO ZAOFEROWANIA : PAMIETAJ U MNIE TYLKO KUPUJEMY\n"
        "MARCHEWKA Z SADU DUNCANA   : 7000\n"
        "PRZEPUSTKA QUEST-MASTERA   :  400\n"
        "PLECAK                     : 4800\n"
    );
}

void game_resolve_cave_response(
    GameState *state,
    const char *response,
    GameOutput output
)
{
    (void)response;
    if (state == NULL || state->room_id != ROOM_CAVE) {
        return;
    }

    emit(output, "NO TO GIN!!!\n");
    state->world_actor_rooms[WORLD_ACTOR_POKRZYWA] = ROOM_CAVE;
    (void)game_select_opponent(state, "POKRZYWA");
}

static ItemActionResult sell_shop_item(
    GameState *state,
    const char *argument,
    GameOutput output
)
{
    const ItemDefinition *definition = item_find(argument);
    const ShopOffer *offer;

    if (state->room_id == ROOM_JUNCTION
        && strcmp(argument, "QUEST") == 0
        && state->quest_progress < 1) {
        int reward = 0;

        if (state->quest_type == 1) {
            reward = 100;
        } else if (state->quest_type == 2
            && state->item_quantities[ITEM_SCHOOL_DIPLOMA] > 0) {
            reward = 250;
        } else if (state->quest_type == 3
            && state->item_quantities[ITEM_PIPE] > 0
            && state->practices > 0) {
            reward = 425;
        }
        if (reward != 0) {
            emit(output,
                "AAAAA BARDZO MI MILO ZE UDALO CI SIE WYKONAC TEN QUEST\n"
            );
            emit_formatted(output,
                " ------ OTRZYMUJESZ %d KUNSZTU -----\n",
                reward
            );
            add_clamped(&state->experience, reward);
            if (state->quest_type == 2) {
                state->item_quantities[ITEM_SCHOOL_DIPLOMA] = 0;
                state->maximum_energy -= 5;
                if (state->maximum_energy < 1) {
                    state->maximum_energy = 1;
                }
            } else if (state->quest_type == 3) {
                apply_carried_item_effect(state, ITEM_PIPE, -1);
                state->item_quantities[ITEM_PIPE] = 0;
                --state->practices;
            }
            state->quest_type = 0;
            state->quest_progress = 0;
            if (state->item_quantities[ITEM_QUEST_PASS] < INT_MAX) {
                ++state->item_quantities[ITEM_QUEST_PASS];
            }
            state->quest_passage_open = true;
            return ITEM_ACTION_SUCCEEDED;
        }
    }

    if (definition == NULL) {
        return ITEM_ACTION_FAILED;
    }
    offer = find_shop_offer(state->room_id, definition->id);
    if (offer == NULL || offer->resale_text == NULL
        || state->item_quantities[offer->item_id] == 0
        || state->equipped_weapon == (int)offer->item_id
        || state->equipped_shield == (int)offer->item_id
        || state->equipped_clothing == (int)offer->item_id) {
        return ITEM_ACTION_FAILED;
    }

    emit(output, offer->resale_text);
    state->coins += offer->resale_value;
    --state->item_quantities[offer->item_id];
    apply_carried_item_effect(state, offer->item_id, -1);
    return ITEM_ACTION_SUCCEEDED;
}

static void list_shop(const GameState *state, GameOutput output)
{
    switch (state->room_id) {
    case ROOM_JUNCTION:
        emit(output,
            "LATWY QUEST      - 200\n"
            "PRZECIETNY QUEST - 100\n"
            "TRUDNY QUEST     - 50\n"
            "KOMEDA - SPRZEDAJ QUEST - OZNACZA IZ QUEST ZOSTAL WYKONANY\n"
        );
        break;
    case ROOM_BAKERY:
        emit(output,
            "NAZWA         CENA\n"
            "PACZEK     :   8  \n"
            "CIASTKO    :   12 \n"
            "SUCHA RACJA:   15 \n"
            "BULKA      :   19 \n"
            "CHLEB      :   24 \n"
            "WEKA       :   29 \n"
        );
        break;
    case ROOM_ARMORY:
        emit(output, "NAZWA         CENA\n");
        if (unique_item_is_in_stock(state, ITEM_OLD_SWORD)) {
            emit(output, "!STARY! MIECZ           :   70  10%-50%\n");
        }
        if (unique_item_is_in_stock(state, ITEM_SMALL_SHIELD)) {
            emit(output, "!MALA! TARCZA           :   15  10%-50%\n");
        }
        emit(output, "DLUGI MIECZ GLADIATORA  : 3200  2%\n");
        break;
    case ROOM_GENERAL_STORE:
        emit(output, "NAZWA                        CENA\n");
        if (unique_item_is_in_stock(state, ITEM_PIPE)) {
            emit(output, "FAJKA                      :  480\n");
        }
        if (unique_item_is_in_stock(state, ITEM_CLOTHES)) {
            emit(output, "!KOMPLET! UBRAN FIRMY \"SYF\":   35 \n");
        }
        emit(output,
            "!KASETA! LIROYA            : 1999 4%\n"
            "GARNITUR Z KOLCAMI(3)      : 1000 2,5%\n"
        );
        break;
    case ROOM_MAGIC_STORE:
        emit(output,
            "NAZWA                  CENA\n"
            "MALA BUTELKA MANY       :   20\n"
            "SREDNIA BUTELKA MANY    :   40\n"
            "SPORA BUTELKA MANY      :   80\n"
            "LISTEK SZCZESCIA        :  820 3%\n"
            "PIERSCIONEK ZARECZYNOWY : 1800 N/A\n"
            "PIGULKA TRANSPORTUJACA  :  235 \n"
            "SCROLL POROWNYWANIE     :   40 \n"
        );
        break;
    default:
        break;
    }
}

static bool move_player(GameState *state, Direction direction, GameOutput output)
{
    const Room *room = world_find_room(state->room_id);
    const RoomExit *exit = world_find_exit(room, direction);
    const Room *destination;
    int destination_id = BOMBKI_ROOM_NOWHERE;

    if (exit != NULL) {
        destination_id = exit->destination;
    } else if (state->room_id == ROOM_JUNCTION
        && direction == DIRECTION_WEST) {
        if (state->item_quantities[ITEM_QUEST_PASS] > 0) {
            destination_id = ROOM_ROAD;
        } else {
            emit(output,
                "QUEST-MASTER MOWI CI : BARDZO MI PRZYKRO ALE MUSISZ MIEC PRZEPUSTKE\n"
            );
            return false;
        }
    } else if (state->room_id == ROOM_LIVING_DOOR
        && direction == DIRECTION_WEST) {
        if (state->living_door_alive) {
            emit(output,
                "SPROBOJ OMINAC TE MEGA-PRZYPAKOWANE DRZWI KTORYCH BY SIE HE-MAN NIE POWSTYDZIL\n"
            );
            return false;
        }
        destination_id = ROOM_ELF_HOUSE;
    }

    if (destination_id == BOMBKI_ROOM_NOWHERE) {
        emit(output, "NIE MOZESZ ISC W TYM KIERUNKU.\n");
        return false;
    }

    game_clear_active_opponent(state);
    state->room_id = destination_id;
    game_describe_current_room(state, output);
    destination = world_find_room(state->room_id);
    if (destination != NULL && destination->redirects_on_arrival) {
        state->room_id = destination->arrival_destination;
        game_describe_current_room(state, output);
    }
    return true;
}

static void describe_status(const GameState *state, GameOutput output)
{
    static const ItemId inventory_order[] = {
        ITEM_OLD_SWORD, ITEM_SMALL_SHIELD, ITEM_BLOODY_HEART,
        ITEM_SCHOOL_DIPLOMA, ITEM_DOUGHNUT, ITEM_CAKE, ITEM_DRY_RATION,
        ITEM_ROLL, ITEM_BREAD, ITEM_WEKA, ITEM_BIGOS, ITEM_BEER,
        ITEM_PIPE, ITEM_CLOTHES, ITEM_SPIKED_SUIT, ITEM_SMALL_MANA_BOTTLE,
        ITEM_LUCKY_LEAF, ITEM_LIROY_CASSETTE, ITEM_TRANSPORT_PILL,
        ITEM_QUEST_PASS, ITEM_COMPARISON_SCROLL, ITEM_RETURN_SCROLL
    };
    static const char *const level_lines[] = {
        "JESTES NA PIERWSZYM LEVELU A DO NASTEPNEGO BRAKUJE CI ",
        "JESTES NA DRUGIM LEVELU A DO NASTEPNEGO BRAKUJE CI ",
        "JESTES NA TRZECIM LEVELU A DO NASTEPNEGO BRAKUJE CI ",
        "JESTES NA CZWARTYM LEVELU A DO NASTEPNEGO BRAKUJE CI ",
        "JESTES NA PIATYM LEVELU A DO NASTEPNEGO BRAKUJE CI ",
        "JESTES NA SZÓSTYM LEVELU A DO NASTEPNEGO BRAKUJE CI ",
        "JESTES NA SIODMYM LEVELU A DO NASTEPNEGO BRAKUJE CI ",
        "JESTES NA OSMYM LEVELU A DO NASTEPNEGO BRAKUJE CI ",
        "JESTES NA DZIEWIATYM LEVELU A DO NASTEPNEGO BRAKUJE CI ",
        "JESTES NA DZIESIATYM LEVELU A DO NASTEPNEGO BRAKUJE CI ",
        "JESTES NA JEDENASTYM LEVELU A DO NASTEPNEGO BRAKUJE CI ",
        "JESTES NA DWUNASTYM LEVELU A DO NASTEPNEGO BRAKUJE CI ",
        "JESTES NA TRZYNASTYM LEVELU A DO NASTEPNEGO BRAKUJE CI "
    };
    size_t index;
    int protection = 0;
    int luck = 0;

    emit(output, "NOSISZ ZE SOBA:\n");
    for (index = 0; index < sizeof(inventory_order) / sizeof(inventory_order[0]);
         ++index) {
        ItemId id = inventory_order[index];
        const ItemDefinition *item = item_at((size_t)id);

        if (state->item_quantities[id] <= 0) {
            continue;
        }
        if (id <= ITEM_SCHOOL_DIPLOMA) {
            emit_formatted(output, "%s\n", item->inventory_text);
        } else {
            emit_formatted(output, "%s%10lld\n", item->inventory_text,
                -10LL * state->item_quantities[id]);
        }
    }
    emit_formatted(output, "W SUMIE MASZ %zu/%d PRZEDMIOTOW\n",
        game_carried_item_count(state), game_carrying_capacity(state));

    if (state->equipped_weapon == BOMBKI_NO_ITEM) {
        emit(output, "BIJESZ SIE NA PIESCI\n");
    } else {
        luck += 3;
    }
    if (state->equipped_shield == BOMBKI_NO_ITEM) {
        emit(output, "NIE MASZ ZADNEJ OCHRONY\n");
    } else {
        protection += 25;
    }
    if (state->equipped_clothing == BOMBKI_NO_ITEM) {
        emit(output, "JESTES NAGI !!!!!!!!\n");
    } else if (state->equipped_clothing == ITEM_CLOTHES) {
        emit(output, "MASZ NA SOBIE KOMPLET UBRAN FIRMY \"SYF\"\n");
        protection += 7;
    } else {
        emit(output, "MASZ NA SOBIE GRANITUR Z KOLCAMI \n");
        protection += 20;
        luck += 15;
    }
    if (state->equipped_shield == ITEM_SMALL_SHIELD) {
        emit(output, "TWOJA OCHRONA JEST MALA TARCZA\n");
    }
    if (state->equipped_weapon == ITEM_OLD_SWORD) {
        emit(output, "JAKO BRONI UZYWASZ STAREGO MIECZA\n");
    }
    emit_formatted(output, "MASZ %d MONET I %d PRAKTYK\n",
        state->coins, state->practices);

    if (state->level >= 1) {
        const char *line = state->level <= 13
            ? level_lines[state->level - 1]
            : "JESTES NA BARDZO WYSOKIM LEVELU A DO NASTEPNEGO BRAKUJE CI TYLKO";
        emit_formatted(output, "%s%lld%s\n", line,
            (long long)(level_threshold(state->level) - state->experience),
            state->level == 3 ? "KUNSZTU" : " KUNSZTU");
    }
    emit_formatted(output,
        "TWOJE PARAMETRY : SILA - %d/%d ZRECZNOSC - %d/%d MADROSC - %d/%d\n",
        state->wisdom, state->maximum_wisdom,
        state->dexterity, state->maximum_dexterity,
        state->strength, state->maximum_strength);
    emit_formatted(output, "S.Z-%d                    FUKSROLL-%d\n",
        protection, luck);
    emit_formatted(output, "MASZ %d/%d MANY\n", state->mana, state->maximum_mana);
    emit_formatted(output, "MASZ %d/%d ENERGII\n",
        state->energy, state->maximum_energy);
    if (state->quest_type == 1) {
        emit_formatted(output,
            "TWOJ AKTUALNY QUEST - ZABIC MUSISZ JESZCZE %d POTWOROW\n",
            state->quest_progress
        );
    } else if (state->quest_type > 1) {
        emit_formatted(output,
            "TWOJ AKTUALNY QUEST - ZABIC MUSISZ JESZCZE %lld POTWOROW\n",
            (long long)state->quest_progress - 150
        );
    }
    if (state->duncan_quest != 0) {
        emit(output, "NIE ZAPOMNIALES O POKRZYWIE W SADACH DUNCANA???\n");
    }
}

GameAction game_execute(GameState *state, const Command *command, GameOutput output)
{
    if (state == NULL || command == NULL) {
        return GAME_ACTION_NONE;
    }

    if (state->sleep_hours > 0 && command->verb != COMMAND_SLEEP) {
        wake_from_sleep(state, output);
    }

    if (parser_command_requires_argument(command->verb)
        && command->argument[0] == '\0') {
        emit_formatted(
            output,
            "[PORT: KOMENDA %s WYMAGA ARGUMENTU]\n",
            parser_command_name(command->verb)
        );
        return GAME_ACTION_NONE;
    }
    switch (command->verb) {
    case COMMAND_EMPTY:
        break;
    case COMMAND_MOVE:
        if (move_player(state, command->direction, output)) {
            advance_turn(state, output);
            if (state->room_id == ROOM_CAVE) {
                emit(output, "TAK lub NIE >");
                return GAME_ACTION_CAVE_RESPONSE;
            }
        }
        break;
    case COMMAND_LOOK:
        look_at(state, command->argument, output);
        break;
    case COMMAND_EXITS:
        describe_exits(state, output);
        break;
    case COMMAND_STATUS:
        describe_status(state, output);
        break;
    case COMMAND_SAVE:
        return GAME_ACTION_SAVE;
    case COMMAND_LOAD:
        return GAME_ACTION_LOAD;
    case COMMAND_TAKE:
        if (take_item(state, command->argument, output) == ITEM_ACTION_SUCCEEDED) {
            advance_turn(state, output);
        }
        break;
    case COMMAND_DROP:
        if (drop_item(state, command->argument, output) == ITEM_ACTION_SUCCEEDED) {
            advance_turn(state, output);
        }
        break;
    case COMMAND_DESTROY:
        if (destroy_item(state, command->argument, output)
            == ITEM_ACTION_SUCCEEDED) {
            advance_turn(state, output);
        }
        break;
    case COMMAND_USE: {
        ItemActionResult result = use_item(state, command->argument, output);

        if (result == ITEM_ACTION_SUCCEEDED) {
            advance_turn(state, output);
        } else if (result == ITEM_ACTION_DEFERRED) {
            return begin_comparison(state, true, output);
        }
        break;
    }
    case COMMAND_UNEQUIP:
        if (unequip_item(state, command->argument, output)
            == ITEM_ACTION_SUCCEEDED) {
            advance_turn(state, output);
        }
        break;
    case COMMAND_BUY:
        if (buy_shop_item(state, command->argument, output)
            == ITEM_ACTION_SUCCEEDED) {
            advance_turn(state, output);
        }
        break;
    case COMMAND_TALK:
        if (strcmp(command->argument, "DUNCAN") == 0) {
            if (talk_to_duncan(state, output)) {
                advance_turn(state, output);
            }
        } else if (strcmp(command->argument, "STARUCH") == 0) {
            if (talk_to_old_elf(state, output)) {
                advance_turn(state, output);
            }
        }
        break;
    case COMMAND_SELL:
        if (sell_shop_item(state, command->argument, output)
            == ITEM_ACTION_SUCCEEDED) {
            advance_turn(state, output);
        }
        break;
    case COMMAND_SHOP_LIST:
        list_shop(state, output);
        break;
    case COMMAND_PRACTICE:
        if (strcmp(command->argument, "KOPAC") == 0
            && practice_kicking(state, output)) {
            advance_turn(state, output);
        } else if (strcmp(command->argument, "UCIEKAC") == 0
            && practice_fleeing(state, output)) {
            advance_turn(state, output);
        } else if (strcmp(command->argument, "POROWNANIE") == 0
            && practice_comparison(state, output)) {
            advance_turn(state, output);
        } else if (strcmp(command->argument, "PAROWANIE") == 0
            && practice_parrying(state, output)) {
            advance_turn(state, output);
        } else if (strcmp(command->argument, "POTRAWKI") == 0
            && practice_cooking(state, output)) {
            advance_turn(state, output);
        } else if (strcmp(command->argument, "POWROT") == 0
            && practice_returning(state, output)) {
            advance_turn(state, output);
        } else if (strcmp(command->argument, "KOPAC") != 0
            && strcmp(command->argument, "UCIEKAC") != 0
            && strcmp(command->argument, "POROWNANIE") != 0
            && strcmp(command->argument, "PAROWANIE") != 0
            && strcmp(command->argument, "POTRAWKI") != 0
            && strcmp(command->argument, "POWROT") != 0) {
            emit_formatted(
                output,
                "[PORT: KOMENDA %s BEDZIE ZAIMPLEMENTOWANA W POZNIEJSZYM ETAPIE]\n",
                parser_command_name(command->verb)
            );
        }
        break;
    case COMMAND_ATTACK:
        if (resolve_basic_combat_round(state, command->argument, output)) {
            advance_turn(state, output);
        }
        break;
    case COMMAND_FLEE:
        if (state->flee_skill > 0) {
            emit(output, "PONIZEJ ILU ENERGII CHCESZ UCIEKAC?\n");
            return GAME_ACTION_FLEE_THRESHOLD;
        }
        break;
    case COMMAND_KICK:
        if (state->kick_skill > 0) {
            emit(output,
                "ZADAM CI PARE PYTAN:\n"
                "1)PONIZEJ JAKIEJ ENERGI CHCESZ ZACZAC KOPAC\n"
            );
            return GAME_ACTION_KICK_THRESHOLDS;
        }
        break;
    case COMMAND_COMPARE:
        return begin_comparison(state, false, output);
    case COMMAND_RETURN:
        if (resolve_return(state, output)) {
            advance_turn(state, output);
        }
        break;
    case COMMAND_TRAIN:
        if (train_attribute(state, command->argument, output)) {
            advance_turn(state, output);
        }
        break;
    case COMMAND_ABILITIES:
        describe_abilities(state, output);
        break;
    case COMMAND_SLEEP:
        continue_sleep(state, output);
        break;
    case COMMAND_SECRET_LIST:
        list_duncan_market(state, output);
        break;
    case COMMAND_HANDS:
    case COMMAND_HEAL:
    case COMMAND_BLIND:
    case COMMAND_RAGE:
    case COMMAND_NET:
    case COMMAND_BACKSTAB:
    case COMMAND_CAMPFIRE:
    case COMMAND_SPEED:
    case COMMAND_COOK:
        break;
    case COMMAND_SCAN:
        emit(output, "FUNKCJA BEDZIE DOSTEPNA ZA DWA LATA , I TAK ZGINIESZ , I TAK :) \n");
        break;
    case COMMAND_WHO:
        emit_formatted(
            output,
            "[PORT: KOMENDA %s BEDZIE ZAIMPLEMENTOWANA W POZNIEJSZYM ETAPIE]\n",
            parser_command_name(command->verb)
        );
        break;
    case COMMAND_HELP:
        emit(output,
            "KOMENDY: PATRZ, EXIT, POLNOC, POLUDNIE, WSCHOD, ZACHOD, GORA, DOL,\n"
            "         N, S, W, E, U, D, JA, PAMIETAJ, WLACZ POSTAC, KONIEC.\n");
        break;
    case COMMAND_QUIT:
        return GAME_ACTION_QUIT;
    case COMMAND_UNKNOWN:
        emit(output, "NIE ROZUMIEM TEJ KOMENDY.\n");
        break;
    }

    return GAME_ACTION_NONE;
}
