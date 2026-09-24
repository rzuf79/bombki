#include <assert.h>
#include <stddef.h>
#include <string.h>

#include "enemies.h"

static void assert_range(EnemyStatRange range, int minimum, int maximum)
{
    assert(range.minimum == minimum);
    assert(range.maximum == maximum);
    assert(range.minimum <= range.maximum);
}

static void assert_profile(
    EnemyProfileId id,
    const char *procedure,
    int energy_minimum,
    int energy_maximum,
    int strength_minimum,
    int strength_maximum,
    int dexterity_minimum,
    int dexterity_maximum
)
{
    const EnemyProfile *profile = enemy_profile_find(id);

    assert(profile != NULL);
    assert(profile->id == id);
    assert(strcmp(profile->recovered_procedure, procedure) == 0);
    assert_range(profile->energy, energy_minimum, energy_maximum);
    assert_range(profile->strength, strength_minimum, strength_maximum);
    assert_range(profile->dexterity, dexterity_minimum, dexterity_maximum);
}

static void assert_rewards(
    EnemyProfileId id,
    EnemyRewardKind kind,
    int coin_minimum,
    int coin_maximum,
    int sword_rolls,
    int shield_rolls,
    int heart_rolls,
    int heart_limit
)
{
    const EnemyProfile *profile = enemy_profile_find(id);

    assert(profile != NULL);
    assert(profile->rewards.kind == kind);
    assert_range(profile->rewards.coins, coin_minimum, coin_maximum);
    assert(profile->rewards.old_sword.successful_rolls == sword_rolls);
    assert(profile->rewards.old_sword.roll_limit
        == (sword_rolls == 0 ? 0 : 20));
    assert(profile->rewards.small_shield.successful_rolls == shield_rolls);
    assert(profile->rewards.small_shield.roll_limit
        == (shield_rolls == 0 ? 0 : 20));
    assert(profile->rewards.bloody_heart.successful_rolls == heart_rolls);
    assert(profile->rewards.bloody_heart.roll_limit == heart_limit);
}

int main(void)
{
    size_t index;

    assert(enemy_profile_count() == ENEMY_PROFILE_COUNT - 1);
    assert(enemy_profile_find(ENEMY_PROFILE_INVALID) == NULL);
    assert(enemy_profile_find(ENEMY_PROFILE_COUNT) == NULL);
    assert(enemy_profile_at(enemy_profile_count()) == NULL);

    assert_profile(ENEMY_PROFILE_SLABO, "SLABO", 1, 1, 2, 2, 1, 1);
    assert_profile(ENEMY_PROFILE_MNIEJSLABO, "MNIEJSLABO", 34, 36, 10, 10, 8, 11);
    assert_profile(ENEMY_PROFILE_SREDNIO, "SREDNIO", 50, 54, 13, 14, 10, 14);
    assert_profile(ENEMY_PROFILE_TRUDNO, "TRUDNO", 60, 65, 15, 17, 12, 14);
    assert_profile(ENEMY_PROFILE_BTRUDNO, "BTRUDNO", 72, 74, 16, 17, 13, 14);
    assert_profile(ENEMY_PROFILE_VEASY, "VEASY", 90, 99, 17, 18, 14, 15);
    assert_profile(ENEMY_PROFILE_EASY, "EASY", 100, 119, 18, 19, 16, 16);
    assert_profile(ENEMY_PROFILE_NEASY, "NEASY", 130, 149, 19, 20, 20, 20);
    assert_profile(ENEMY_PROFILE_POKRZYWA, "direct cave assignment",
        200, 200, 18, 18, 15, 15);
    assert_profile(ENEMY_PROFILE_QUEST_MASTER, "direct room assignment",
        188, 188, 10, 10, 26, 26);
    assert_profile(ENEMY_PROFILE_DOG, "WALKAPIES", 10, 10, 5, 5, 10, 10);
    assert_profile(ENEMY_PROFILE_CAGE_WEAK, "direct room assignment", 20, 20, 3, 3, 3, 3);
    assert_profile(ENEMY_PROFILE_CAGE_DEXTEROUS, "direct room assignment", 20, 20, 3, 3, 30, 30);
    assert_profile(ENEMY_PROFILE_CAGE_RESISTANT, "direct room assignment", 40, 40, 3, 3, 3, 3);
    assert_profile(ENEMY_PROFILE_CAGE_STRONG, "direct room assignment", 20, 20, 10, 10, 3, 3);
    assert_profile(ENEMY_PROFILE_CAGE_ALL, "direct room assignment", 40, 40, 10, 10, 11, 11);

    assert_rewards(ENEMY_PROFILE_SLABO, ENEMY_REWARD_STANDARD,
        0, 2, 0, 0, 7, 10);
    assert_rewards(ENEMY_PROFILE_MNIEJSLABO, ENEMY_REWARD_STANDARD,
        10, 30, 0, 0, 5, 20);
    assert_rewards(ENEMY_PROFILE_SREDNIO, ENEMY_REWARD_STANDARD,
        30, 59, 0, 0, 7, 20);
    assert_rewards(ENEMY_PROFILE_TRUDNO, ENEMY_REWARD_STANDARD,
        20, 59, 0, 0, 7, 20);
    assert_rewards(ENEMY_PROFILE_BTRUDNO, ENEMY_REWARD_STANDARD,
        15, 64, 0, 0, 5, 20);
    assert_rewards(ENEMY_PROFILE_VEASY, ENEMY_REWARD_STANDARD,
        10, 64, 0, 0, 4, 20);
    assert_rewards(ENEMY_PROFILE_EASY, ENEMY_REWARD_STANDARD,
        30, 59, 0, 0, 4, 20);
    assert_rewards(ENEMY_PROFILE_NEASY, ENEMY_REWARD_STANDARD,
        20, 64, 0, 0, 4, 20);
    assert_rewards(ENEMY_PROFILE_DOG, ENEMY_REWARD_DOG,
        0, 14, 0, 0, 5, 20);
    assert_rewards(ENEMY_PROFILE_CAGE_WEAK, ENEMY_REWARD_CAGE,
        0, 9, 4, 4, 6, 20);
    assert_rewards(ENEMY_PROFILE_CAGE_DEXTEROUS, ENEMY_REWARD_CAGE,
        0, 14, 7, 7, 6, 20);
    assert_rewards(ENEMY_PROFILE_CAGE_RESISTANT, ENEMY_REWARD_CAGE,
        0, 14, 7, 7, 6, 20);
    assert_rewards(ENEMY_PROFILE_CAGE_STRONG, ENEMY_REWARD_CAGE,
        0, 14, 7, 7, 6, 20);
    assert_rewards(ENEMY_PROFILE_CAGE_ALL, ENEMY_REWARD_CAGE,
        0, 29, 10, 10, 6, 20);

    for (index = 0; index < enemy_profile_count(); ++index) {
        const EnemyProfile *profile = enemy_profile_at(index);

        assert(profile != NULL);
        assert(profile->id == (EnemyProfileId)(index + 1));
    }
    for (index = 0; index < WORLD_ACTOR_COUNT; ++index) {
        assert(enemy_profile_for_world_actor((WorldActorId)index)
            != ENEMY_PROFILE_INVALID);
    }
    assert(enemy_profile_for_world_actor((WorldActorId)-1)
        == ENEMY_PROFILE_INVALID);
    assert(enemy_profile_for_world_actor(WORLD_ACTOR_COUNT)
        == ENEMY_PROFILE_INVALID);

    assert(enemy_profile_for_world_actor(WORLD_ACTOR_KORNIK)
        == ENEMY_PROFILE_SLABO);
    assert(enemy_profile_for_world_actor(WORLD_ACTOR_DZIK)
        == ENEMY_PROFILE_MNIEJSLABO);
    assert(enemy_profile_for_world_actor(WORLD_ACTOR_SLON)
        == ENEMY_PROFILE_SREDNIO);
    assert(enemy_profile_for_world_actor(WORLD_ACTOR_TRENER)
        == ENEMY_PROFILE_TRUDNO);
    assert(enemy_profile_for_world_actor(WORLD_ACTOR_JAMNIK)
        == ENEMY_PROFILE_DOG);
    assert(enemy_profile_for_world_actor(WORLD_ACTOR_ZEBRAK)
        == ENEMY_PROFILE_VEASY);
    assert(enemy_profile_for_world_actor(WORLD_ACTOR_LIROY)
        == ENEMY_PROFILE_NEASY);
    assert(enemy_profile_for_world_actor(WORLD_ACTOR_DZIECKO)
        == ENEMY_PROFILE_MNIEJSLABO);
    assert(enemy_profile_for_world_actor(WORLD_ACTOR_REPORTER)
        == ENEMY_PROFILE_SREDNIO);
    assert(enemy_profile_for_world_actor(WORLD_ACTOR_ROZA)
        == ENEMY_PROFILE_EASY);
    assert(enemy_profile_for_world_actor(WORLD_ACTOR_TRAWA)
        == ENEMY_PROFILE_TRUDNO);
    assert(enemy_profile_for_world_actor(WORLD_ACTOR_CAGE_DEXTEROUS)
        == ENEMY_PROFILE_CAGE_DEXTEROUS);
    assert(enemy_profile_for_world_actor(WORLD_ACTOR_STARUCH)
        == ENEMY_PROFILE_SLABO);
    assert(enemy_profile_for_world_actor(WORLD_ACTOR_QUEST_MASTER)
        == ENEMY_PROFILE_QUEST_MASTER);
    assert(enemy_profile_for_world_actor(WORLD_ACTOR_LIVING_DOOR)
        == ENEMY_PROFILE_NEASY);

    return 0;
}
