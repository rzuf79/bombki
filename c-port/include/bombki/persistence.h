#ifndef BOMBKI_PERSISTENCE_H
#define BOMBKI_PERSISTENCE_H

#include <stdbool.h>
#include <stddef.h>

#include "bombki/game.h"

bool persistence_save(
    const char *path,
    const GameState *state,
    char *error,
    size_t error_capacity
);

bool persistence_load(
    const char *path,
    GameState *state,
    char *error,
    size_t error_capacity
);

#endif
