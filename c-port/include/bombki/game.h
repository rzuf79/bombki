#ifndef BOMBKI_GAME_H
#define BOMBKI_GAME_H

#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>

#include "bombki/parser.h"

#define BOMBKI_PLAYER_NAME_CAPACITY 32
#define BOMBKI_WORLD_ACTOR_SLOTS 80
#define BOMBKI_WORLD_OBJECT_SLOTS 5
#define BOMBKI_ITEM_SLOTS 23
#define BOMBKI_ROOM_NOWHERE (-1)
#define BOMBKI_NO_ACTOR (-1)
#define BOMBKI_NO_ITEM (-1)

typedef enum {
    RACE_CZLOWIEK = 0,
    RACE_OLBRZYM,
    RACE_NIMFA,
    RACE_POL_ELF,
    RACE_UFOK,
    RACE_CZAROMIL,
    RACE_COUNT
} Race;

typedef struct {
    int room_id;
    uint64_t turn;
    uint32_t random_state;
    char player_name[BOMBKI_PLAYER_NAME_CAPACITY];
    Race race;
    int strength;
    int maximum_strength;
    int dexterity;
    int maximum_dexterity;
    int wisdom;
    int maximum_wisdom;
    int energy;
    int maximum_energy;
    int mana;
    int maximum_mana;
    int coins;
    int experience;
    int practices;
    int level;
    int kick_skill;
    int kick_mana_threshold;
    int kick_energy_threshold;
    int flee_skill;
    int flee_energy_threshold;
    int comparison_skill;
    int parry_skill;
    int cooking_skill;
    int return_skill;
    int sleep_hours;
    int duncan_quest;
    bool duncan_black_market_unlocked;
    int quest_type;
    int quest_progress;
    int world_actor_rooms[BOMBKI_WORLD_ACTOR_SLOTS];
    int world_object_rooms[BOMBKI_WORLD_OBJECT_SLOTS];
    int item_quantities[BOMBKI_ITEM_SLOTS];
    int equipped_weapon;
    int equipped_shield;
    int equipped_clothing;
    int active_opponent_actor;
    int active_opponent_energy;
    int active_opponent_maximum_energy;
    int active_opponent_strength;
    int active_opponent_dexterity;
    int active_opponent_fireballs;
    int active_opponent_poison_casts;
    int poison_turns;
    bool quest_passage_open;
    bool living_door_alive;
    bool old_elf_present;
} GameState;

typedef void (*GameWriteFunction)(void *context, const char *text);

typedef struct {
    GameWriteFunction write;
    void *context;
} GameOutput;

typedef enum {
    GAME_ACTION_NONE = 0,
    GAME_ACTION_SAVE,
    GAME_ACTION_LOAD,
    GAME_ACTION_KICK_THRESHOLDS,
    GAME_ACTION_FLEE_THRESHOLD,
    GAME_ACTION_COMPARISON_TARGET,
    GAME_ACTION_COMPARISON_SCROLL_TARGET,
    GAME_ACTION_CAVE_RESPONSE,
    GAME_ACTION_QUIT
} GameAction;

typedef enum {
    TURN_NEVER = 0,
    TURN_ON_SUCCESS
} CommandTurnPolicy;

typedef enum {
    GAME_LOOT_TAKSOWKARZ = 0,
    GAME_LOOT_SPRZEDAWCA,
    GAME_LOOT_GORYL,
    GAME_LOOT_OCHRONIARZ,
    GAME_LOOT_TRENER,
    GAME_LOOT_PEDAL,
    GAME_LOOT_GLADIATOR,
    GAME_LOOT_WOJOWNIK,
    GAME_LOOT_POKRZYWA,
    GAME_LOOT_PERKUSISTA,
    GAME_LOOT_GITARZYSTA,
    GAME_LOOT_LIROY,
    GAME_LOOT_ORGANISTA,
    GAME_LOOT_DJ,
    GAME_LOOT_SOURCE_COUNT
} GameLootSource;

void game_initialize(GameState *state);
void game_reset_world(GameState *state);
void game_regenerate_encounters(GameState *state);
bool game_select_opponent(GameState *state, const char *target);
void game_clear_active_opponent(GameState *state);
bool game_configure_player(GameState *state, const char *name, Race race);
bool game_parse_race(const char *text, Race *race);
const char *game_race_name(Race race);
bool game_state_is_valid(const GameState *state);
size_t game_carried_item_count(const GameState *state);
int game_carrying_capacity(const GameState *state);
size_t game_overburden_amount(const GameState *state);
size_t game_resolve_enemy_loot(
    GameState *state,
    GameLootSource source,
    GameOutput output
);
bool game_resolve_active_opponent_victory(
    GameState *state,
    GameOutput output
);
void game_set_flee_energy_threshold(GameState *state, int threshold);
void game_set_kick_thresholds(
    GameState *state,
    int energy_threshold,
    int mana_threshold
);
void game_resolve_comparison_target(
    GameState *state,
    const char *target,
    bool used_scroll,
    GameOutput output
);
void game_resolve_cave_response(
    GameState *state,
    const char *response,
    GameOutput output
);
CommandTurnPolicy game_command_turn_policy(CommandVerb verb);
void game_describe_current_room(const GameState *state, GameOutput output);
GameAction game_execute(GameState *state, const Command *command, GameOutput output);

#endif
