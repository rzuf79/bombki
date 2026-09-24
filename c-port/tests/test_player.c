#include <assert.h>
#include <string.h>

#include "bombki/game.h"

typedef struct {
    const char *name;
    Race race;
    int strength;
    int maximum_strength;
    int dexterity;
    int maximum_dexterity;
    int wisdom;
    int maximum_wisdom;
    int mana;
    int coins;
} ExpectedRace;

int main(void)
{
    static const ExpectedRace expected[] = {
        {"CZLOWIEK", RACE_CZLOWIEK, 10, 15, 10, 15, 10, 15, 100, 0},
        {"OLBRZYM", RACE_OLBRZYM, 13, 20, 13, 20, 5, 7, 70, 0},
        {"NIMFA", RACE_NIMFA, 10, 15, 13, 20, 7, 11, 100, 0},
        {"POL-ELF", RACE_POL_ELF, 6, 10, 16, 24, 8, 12, 80, 30},
        {"UFOK", RACE_UFOK, 9, 13, 9, 14, 13, 20, 150, 0},
        {"CZAROMIL", RACE_CZAROMIL, 6, 9, 7, 11, 16, 25, 250, 0}
    };
    size_t index;

    for (index = 0; index < sizeof(expected) / sizeof(expected[0]); ++index) {
        GameState state;
        Race parsed;

        game_initialize(&state);
        assert(game_parse_race(expected[index].name, &parsed));
        assert(parsed == expected[index].race);
        assert(game_configure_player(&state, "GRACZ\n", parsed));
        assert(strcmp(state.player_name, "GRACZ") == 0);
        assert(strcmp(game_race_name(state.race), expected[index].name) == 0);
        assert(state.strength == expected[index].strength);
        assert(state.maximum_strength == expected[index].maximum_strength);
        assert(state.dexterity == expected[index].dexterity);
        assert(state.maximum_dexterity == expected[index].maximum_dexterity);
        assert(state.wisdom == expected[index].wisdom);
        assert(state.maximum_wisdom == expected[index].maximum_wisdom);
        assert(state.mana == expected[index].mana);
        assert(state.maximum_mana == expected[index].mana);
        assert(state.coins == expected[index].coins);
        assert(state.energy == 50);
        assert(state.maximum_energy == 50);
        assert(state.experience == 0);
        assert(state.practices == 10);
        assert(game_state_is_valid(&state));
    }

    {
        Race parsed;
        assert(game_parse_race("  pol-elf\r\n", &parsed));
        assert(parsed == RACE_POL_ELF);
        assert(!game_parse_race("ELF", &parsed));
    }

    return 0;
}
