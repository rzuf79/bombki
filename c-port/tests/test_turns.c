#include <assert.h>

#include "bombki/game.h"
#include "bombki/parser.h"

static void discard_output(void *context, const char *text)
{
    (void)context;
    (void)text;
}

static GameAction execute(GameState *state, const char *input)
{
    Command command = parser_parse(input);
    GameOutput output = {discard_output, NULL};

    return game_execute(state, &command, output);
}

int main(void)
{
    GameState state;
    static const char *non_turn_commands[] = {
        "",
        "PATRZ",
        "PATRZ COS",
        "EXIT",
        "JA",
        "PAMIETAJ",
        "WLACZ POSTAC",
        "POMOC",
        "NIEZNANA KOMENDA",
        "e",
        "KONIEC"
    };
    size_t index;

    assert(game_command_turn_policy(COMMAND_LOOK) == TURN_NEVER);
    assert(game_command_turn_policy(COMMAND_EXITS) == TURN_NEVER);
    assert(game_command_turn_policy(COMMAND_STATUS) == TURN_NEVER);
    assert(game_command_turn_policy(COMMAND_HELP) == TURN_NEVER);
    assert(game_command_turn_policy(COMMAND_MOVE) == TURN_ON_SUCCESS);
    assert(game_command_turn_policy(COMMAND_ATTACK) == TURN_ON_SUCCESS);
    assert(game_command_turn_policy(COMMAND_USE) == TURN_ON_SUCCESS);
    assert(game_command_turn_policy(COMMAND_COMPARE) == TURN_ON_SUCCESS);
    assert(game_command_turn_policy(COMMAND_KICK) == TURN_NEVER);
    assert(game_command_turn_policy(COMMAND_FLEE) == TURN_NEVER);

    game_initialize(&state);
    assert(state.turn == 0);

    for (index = 0;
         index < sizeof(non_turn_commands) / sizeof(non_turn_commands[0]);
         ++index) {
        (void)execute(&state, non_turn_commands[index]);
        assert(state.turn == 0);
    }

    assert(execute(&state, "JA") == GAME_ACTION_NONE);
    assert(execute(&state, "PAMIETAJ") == GAME_ACTION_SAVE);
    assert(execute(&state, "WLACZ POSTAC") == GAME_ACTION_LOAD);
    assert(state.turn == 0);

    assert(execute(&state, "n") == GAME_ACTION_NONE);
    assert(state.turn == 1);
    assert(execute(&state, "e") == GAME_ACTION_NONE);
    assert(state.turn == 2);

    return 0;
}
