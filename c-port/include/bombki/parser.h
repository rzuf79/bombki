#ifndef BOMBKI_PARSER_H
#define BOMBKI_PARSER_H

#include <stdbool.h>
#include <stddef.h>

#define BOMBKI_ARGUMENT_CAPACITY 128

typedef enum {
    DIRECTION_NONE = -1,
    DIRECTION_NORTH = 0,
    DIRECTION_SOUTH,
    DIRECTION_EAST,
    DIRECTION_WEST,
    DIRECTION_UP,
    DIRECTION_DOWN,
    DIRECTION_COUNT
} Direction;

typedef enum {
    COMMAND_EMPTY = 0,
    COMMAND_MOVE,
    COMMAND_LOOK,
    COMMAND_EXITS,
    COMMAND_STATUS,
    COMMAND_SAVE,
    COMMAND_LOAD,
    COMMAND_TAKE,
    COMMAND_DROP,
    COMMAND_DESTROY,
    COMMAND_USE,
    COMMAND_UNEQUIP,
    COMMAND_ATTACK,
    COMMAND_TALK,
    COMMAND_BUY,
    COMMAND_SELL,
    COMMAND_SHOP_LIST,
    COMMAND_PRACTICE,
    COMMAND_TRAIN,
    COMMAND_WHO,
    COMMAND_COMPARE,
    COMMAND_KICK,
    COMMAND_FLEE,
    COMMAND_RETURN,
    COMMAND_HANDS,
    COMMAND_HEAL,
    COMMAND_BLIND,
    COMMAND_RAGE,
    COMMAND_NET,
    COMMAND_BACKSTAB,
    COMMAND_CAMPFIRE,
    COMMAND_SPEED,
    COMMAND_COOK,
    COMMAND_ABILITIES,
    COMMAND_SLEEP,
    COMMAND_SCAN,
    COMMAND_SECRET_LIST,
    COMMAND_HELP,
    COMMAND_QUIT,
    COMMAND_UNKNOWN
} CommandVerb;

typedef struct {
    CommandVerb verb;
    Direction direction;
    char argument[BOMBKI_ARGUMENT_CAPACITY];
} Command;

Command parser_parse(const char *input);
bool parser_command_requires_argument(CommandVerb verb);
const char *parser_command_name(CommandVerb verb);
const char *direction_name(Direction direction);

#endif
