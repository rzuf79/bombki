#ifndef BOMBKI_ENEMIES_H
#define BOMBKI_ENEMIES_H

#include <stddef.h>

#include "world.h"

typedef enum {
    ENEMY_PROFILE_INVALID = 0,
    ENEMY_PROFILE_SLABO,
    ENEMY_PROFILE_MNIEJSLABO,
    ENEMY_PROFILE_SREDNIO,
    ENEMY_PROFILE_TRUDNO,
    ENEMY_PROFILE_BTRUDNO,
    ENEMY_PROFILE_VEASY,
    ENEMY_PROFILE_EASY,
    ENEMY_PROFILE_NEASY,
    ENEMY_PROFILE_POKRZYWA,
    ENEMY_PROFILE_QUEST_MASTER,
    ENEMY_PROFILE_DOG,
    ENEMY_PROFILE_CAGE_WEAK,
    ENEMY_PROFILE_CAGE_DEXTEROUS,
    ENEMY_PROFILE_CAGE_RESISTANT,
    ENEMY_PROFILE_CAGE_STRONG,
    ENEMY_PROFILE_CAGE_ALL,
    ENEMY_PROFILE_COUNT
} EnemyProfileId;

typedef struct {
    int minimum;
    int maximum;
} EnemyStatRange;

typedef struct {
    int successful_rolls;
    int roll_limit;
} EnemyDropChance;

typedef enum {
    ENEMY_REWARD_STANDARD = 0,
    ENEMY_REWARD_DOG,
    ENEMY_REWARD_CAGE,
    ENEMY_REWARD_NONE
} EnemyRewardKind;

typedef struct {
    EnemyRewardKind kind;
    EnemyStatRange coins;
    EnemyDropChance old_sword;
    EnemyDropChance small_shield;
    EnemyDropChance bloody_heart;
} EnemyRewardProfile;

typedef struct {
    EnemyProfileId id;
    const char *recovered_procedure;
    EnemyStatRange energy;
    EnemyStatRange strength;
    EnemyStatRange dexterity;
    EnemyRewardProfile rewards;
    int fireball_charges;
    int poison_charges;
} EnemyProfile;

size_t enemy_profile_count(void);
const EnemyProfile *enemy_profile_at(size_t index);
const EnemyProfile *enemy_profile_find(EnemyProfileId id);
EnemyProfileId enemy_profile_for_world_actor(WorldActorId actor);

#endif
