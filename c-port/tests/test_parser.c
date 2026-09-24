#include <assert.h>
#include <string.h>

#include "bombki/parser.h"

int main(void)
{
    Command command;
    static const char *aliases[] = {"n", "s", "w", "e", "u", "d"};
    static const Direction directions[] = {
        DIRECTION_NORTH,
        DIRECTION_SOUTH,
        DIRECTION_WEST,
        DIRECTION_EAST,
        DIRECTION_UP,
        DIRECTION_DOWN
    };
    size_t index;
    static const struct {
        const char *input;
        CommandVerb verb;
        const char *argument;
    } recovered_commands[] = {
        {"BIERZ DYPLOM", COMMAND_TAKE, "DYPLOM"},
        {"ODRZUC SERCE", COMMAND_DROP, "SERCE"},
        {"ZNISZCZ PRZEPUSTKA", COMMAND_DESTROY, "PRZEPUSTKA"},
        {"UZYJ BIGOS", COMMAND_USE, "BIGOS"},
        {"ODLORZ GARNITUR", COMMAND_UNEQUIP, "GARNITUR"},
        {"ZABIJ SZCZUR", COMMAND_ATTACK, "SZCZUR"},
        {"ROZMAWIAJ DUNCAN", COMMAND_TALK, "DUNCAN"},
        {"KUP PACZEK", COMMAND_BUY, "PACZEK"},
        {"SPRZEDAJ FAJKA", COMMAND_SELL, "FAJKA"},
        {"LISTA", COMMAND_SHOP_LIST, ""},
        {"CWICZ KOPAC", COMMAND_PRACTICE, "KOPAC"},
        {"TRENUJ SILA", COMMAND_TRAIN, "SILA"},
        {"KTO", COMMAND_WHO, ""},
        {"POROWNAJ", COMMAND_COMPARE, ""},
        {"KOP", COMMAND_KICK, ""},
        {"ZWIEJ", COMMAND_FLEE, ""},
        {"POWROT", COMMAND_RETURN, ""},
        {"RECE", COMMAND_HANDS, ""},
        {"UZDROW", COMMAND_HEAL, ""},
        {"OSLEP", COMMAND_BLIND, ""},
        {"SZAL", COMMAND_RAGE, ""},
        {"SIATKA", COMMAND_NET, ""},
        {"CIOS W PLECY", COMMAND_BACKSTAB, "PLECY"},
        {"ROZPAL", COMMAND_CAMPFIRE, ""},
        {"SPEED", COMMAND_SPEED, ""},
        {"PIECZ BIGOS", COMMAND_COOK, "BIGOS"},
        {"ZDOLNOSCI", COMMAND_ABILITIES, ""},
        {"SPIJ", COMMAND_SLEEP, ""},
        {"SCAN", COMMAND_SCAN, ""},
        {"SECRET LISTA", COMMAND_SECRET_LIST, ""}
    };

    command = parser_parse("  polnoc  \n");
    assert(command.verb == COMMAND_MOVE);
    assert(command.direction == DIRECTION_NORTH);

    command = parser_parse("IDZ   poludnie");
    assert(command.verb == COMMAND_MOVE);
    assert(command.direction == DIRECTION_SOUTH);
    assert(strcmp(direction_name(DIRECTION_SOUTH), "POLUDNIE") == 0);

    command = parser_parse("polodnie");
    assert(command.verb == COMMAND_MOVE);
    assert(command.direction == DIRECTION_SOUTH);

    command = parser_parse("pn");
    assert(command.verb == COMMAND_MOVE);
    assert(command.direction == DIRECTION_NORTH);
    command = parser_parse("pd");
    assert(command.verb == COMMAND_MOVE);
    assert(command.direction == DIRECTION_SOUTH);
    command = parser_parse("z");
    assert(command.verb == COMMAND_MOVE);
    assert(command.direction == DIRECTION_WEST);
    command = parser_parse("g");
    assert(command.verb == COMMAND_MOVE);
    assert(command.direction == DIRECTION_UP);
    assert(parser_parse("MODE").verb == COMMAND_UNKNOWN);
    assert(parser_parse("UNMODE").verb == COMMAND_UNKNOWN);
    assert(parser_parse("m").verb == COMMAND_UNKNOWN);
    assert(parser_parse("um").verb == COMMAND_UNKNOWN);

    for (index = 0; index < sizeof(aliases) / sizeof(aliases[0]); ++index) {
        command = parser_parse(aliases[index]);
        assert(command.verb == COMMAND_MOVE);
        assert(command.direction == directions[index]);
    }

    command = parser_parse("patrz    plakat");
    assert(command.verb == COMMAND_LOOK);
    assert(strcmp(command.argument, "PLAKAT") == 0);

    command = parser_parse("EXIT");
    assert(command.verb == COMMAND_EXITS);

    command = parser_parse("wlacz postac");
    assert(command.verb == COMMAND_LOAD);

    command = parser_parse("nieznana komenda");
    assert(command.verb == COMMAND_UNKNOWN);

    command = parser_parse("BIERZ");
    assert(command.verb == COMMAND_TAKE);
    assert(command.argument[0] == '\0');
    assert(parser_command_requires_argument(command.verb));
    assert(!parser_command_requires_argument(COMMAND_TRAIN));

    for (index = 0;
         index < sizeof(recovered_commands) / sizeof(recovered_commands[0]);
         ++index) {
        command = parser_parse(recovered_commands[index].input);
        assert(command.verb == recovered_commands[index].verb);
        assert(strcmp(command.argument, recovered_commands[index].argument) == 0);
        assert(strcmp(parser_command_name(command.verb), "?") != 0);
    }

    return 0;
}
