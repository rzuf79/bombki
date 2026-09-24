#include "bombki/parser.h"

#include <ctype.h>
#include <stdbool.h>
#include <string.h>

#define NORMALIZED_CAPACITY 256

static void normalize(const char *input, char *output, size_t capacity)
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

static Direction parse_direction(const char *text)
{
    if (strcmp(text, "POLNOC") == 0 || strcmp(text, "PN") == 0
        || strcmp(text, "N") == 0) {
        return DIRECTION_NORTH;
    }
    if (strcmp(text, "POLODNIE") == 0 || strcmp(text, "POLUDNIE") == 0
        || strcmp(text, "PD") == 0 || strcmp(text, "S") == 0) {
        return DIRECTION_SOUTH;
    }
    if (strcmp(text, "WSCHOD") == 0 || strcmp(text, "E") == 0) {
        return DIRECTION_EAST;
    }
    if (strcmp(text, "ZACHOD") == 0 || strcmp(text, "Z") == 0
        || strcmp(text, "W") == 0) {
        return DIRECTION_WEST;
    }
    if (strcmp(text, "GORA") == 0 || strcmp(text, "G") == 0
        || strcmp(text, "U") == 0) {
        return DIRECTION_UP;
    }
    if (strcmp(text, "DOL") == 0 || strcmp(text, "D") == 0) {
        return DIRECTION_DOWN;
    }

    return DIRECTION_NONE;
}

static void copy_argument(char *destination, size_t capacity, const char *source)
{
    if (capacity == 0) {
        return;
    }

    strncpy(destination, source, capacity - 1);
    destination[capacity - 1] = '\0';
}

static bool parse_argument_command(
    const char *normalized,
    const char *name,
    CommandVerb verb,
    Command *command
)
{
    size_t length = strlen(name);

    if (strcmp(normalized, name) == 0) {
        command->verb = verb;
        return true;
    }
    if (strncmp(normalized, name, length) == 0 && normalized[length] == ' ') {
        command->verb = verb;
        copy_argument(command->argument, sizeof(command->argument), normalized + length + 1);
        return true;
    }
    return false;
}

Command parser_parse(const char *input)
{
    char normalized[NORMALIZED_CAPACITY];
    Command command = {COMMAND_UNKNOWN, DIRECTION_NONE, ""};
    Direction direction;

    normalize(input, normalized, sizeof(normalized));
    if (normalized[0] == '\0') {
        command.verb = COMMAND_EMPTY;
        return command;
    }

    direction = parse_direction(normalized);
    if (direction != DIRECTION_NONE) {
        command.verb = COMMAND_MOVE;
        command.direction = direction;
        return command;
    }

    if (strncmp(normalized, "IDZ ", 4) == 0) {
        direction = parse_direction(normalized + 4);
        if (direction != DIRECTION_NONE) {
            command.verb = COMMAND_MOVE;
            command.direction = direction;
        }
        return command;
    }

    if (strcmp(normalized, "PATRZ") == 0) {
        command.verb = COMMAND_LOOK;
        return command;
    }
    if (strncmp(normalized, "PATRZ ", 6) == 0) {
        command.verb = COMMAND_LOOK;
        copy_argument(command.argument, sizeof(command.argument), normalized + 6);
        return command;
    }
    if (parse_argument_command(normalized, "BIERZ", COMMAND_TAKE, &command)
        || parse_argument_command(normalized, "ODRZUC", COMMAND_DROP, &command)
        || parse_argument_command(normalized, "ZNISZCZ", COMMAND_DESTROY, &command)
        || parse_argument_command(normalized, "UZYJ", COMMAND_USE, &command)
        || parse_argument_command(normalized, "ODLOZ", COMMAND_UNEQUIP, &command)
        || parse_argument_command(normalized, "ODLORZ", COMMAND_UNEQUIP, &command)
        || parse_argument_command(normalized, "ZDEJMUJ", COMMAND_UNEQUIP, &command)
        || parse_argument_command(normalized, "ZDEJMIJ", COMMAND_UNEQUIP, &command)
        || parse_argument_command(normalized, "ZABIJ", COMMAND_ATTACK, &command)
        || parse_argument_command(normalized, "ROZMAWIAJ", COMMAND_TALK, &command)
        || parse_argument_command(normalized, "KUP", COMMAND_BUY, &command)
        || parse_argument_command(normalized, "SPRZEDAJ", COMMAND_SELL, &command)
        || parse_argument_command(normalized, "CWICZ", COMMAND_PRACTICE, &command)
        || parse_argument_command(normalized, "TRENUJ", COMMAND_TRAIN, &command)
        || parse_argument_command(normalized, "CIOS W", COMMAND_BACKSTAB, &command)
        || parse_argument_command(normalized, "PIECZ", COMMAND_COOK, &command)) {
        return command;
    }
    if (strcmp(normalized, "EXIT") == 0 || strcmp(normalized, "WYJSCIA") == 0) {
        command.verb = COMMAND_EXITS;
    } else if (strcmp(normalized, "JA") == 0) {
        command.verb = COMMAND_STATUS;
    } else if (strcmp(normalized, "PAMIETAJ") == 0) {
        command.verb = COMMAND_SAVE;
    } else if (strcmp(normalized, "WLACZ POSTAC") == 0) {
        command.verb = COMMAND_LOAD;
    } else if (strcmp(normalized, "LISTA") == 0) {
        command.verb = COMMAND_SHOP_LIST;
    } else if (strcmp(normalized, "KTO") == 0) {
        command.verb = COMMAND_WHO;
    } else if (strcmp(normalized, "POROWNAJ") == 0) {
        command.verb = COMMAND_COMPARE;
    } else if (strcmp(normalized, "KOP") == 0) {
        command.verb = COMMAND_KICK;
    } else if (strcmp(normalized, "ZWIEJ") == 0) {
        command.verb = COMMAND_FLEE;
    } else if (strcmp(normalized, "POWROT") == 0) {
        command.verb = COMMAND_RETURN;
    } else if (strcmp(normalized, "RECE") == 0) {
        command.verb = COMMAND_HANDS;
    } else if (strcmp(normalized, "UZDROW") == 0) {
        command.verb = COMMAND_HEAL;
    } else if (strcmp(normalized, "OSLEP") == 0) {
        command.verb = COMMAND_BLIND;
    } else if (strcmp(normalized, "SZAL") == 0) {
        command.verb = COMMAND_RAGE;
    } else if (strcmp(normalized, "SIATKA") == 0) {
        command.verb = COMMAND_NET;
    } else if (strcmp(normalized, "ROZPAL") == 0) {
        command.verb = COMMAND_CAMPFIRE;
    } else if (strcmp(normalized, "SPEED") == 0) {
        command.verb = COMMAND_SPEED;
    } else if (strcmp(normalized, "ZDOLNOSCI") == 0) {
        command.verb = COMMAND_ABILITIES;
    } else if (strcmp(normalized, "SPIJ") == 0) {
        command.verb = COMMAND_SLEEP;
    } else if (strcmp(normalized, "SCAN") == 0) {
        command.verb = COMMAND_SCAN;
    } else if (strcmp(normalized, "SECRET LISTA") == 0) {
        command.verb = COMMAND_SECRET_LIST;
    } else if (strcmp(normalized, "POMOC") == 0 || strcmp(normalized, "HELP") == 0) {
        command.verb = COMMAND_HELP;
    } else if (strcmp(normalized, "KONIEC") == 0 || strcmp(normalized, "QUIT") == 0) {
        command.verb = COMMAND_QUIT;
    }

    return command;
}

bool parser_command_requires_argument(CommandVerb verb)
{
    switch (verb) {
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
    case COMMAND_BACKSTAB:
        return true;
    default:
        return false;
    }
}

const char *parser_command_name(CommandVerb verb)
{
    static const char *const names[] = {
        "", "RUCH", "PATRZ", "EXIT", "JA", "PAMIETAJ",
        "WLACZ POSTAC", "BIERZ", "ODRZUC", "ZNISZCZ", "UZYJ", "ODLOZ", "ZABIJ",
        "ROZMAWIAJ", "KUP", "SPRZEDAJ", "LISTA", "CWICZ", "TRENUJ", "KTO",
        "POROWNAJ", "KOP", "ZWIEJ", "POWROT", "RECE", "UZDROW", "OSLEP",
        "SZAL", "SIATKA", "CIOS W", "ROZPAL", "SPEED", "PIECZ", "ZDOLNOSCI",
        "SPIJ", "SCAN", "SECRET LISTA", "POMOC", "KONIEC", "?"
    };

    _Static_assert(
        sizeof(names) / sizeof(names[0]) == COMMAND_UNKNOWN + 1,
        "command name table must match CommandVerb"
    );

    if (verb < COMMAND_EMPTY || verb > COMMAND_UNKNOWN) {
        return "?";
    }
    return names[verb];
}

const char *direction_name(Direction direction)
{
    static const char *names[DIRECTION_COUNT] = {
        "POLNOC", "POLUDNIE", "WSCHOD", "ZACHOD", "GORA", "DOL"
    };

    if (direction < 0 || direction >= DIRECTION_COUNT) {
        return "?";
    }

    return names[direction];
}
