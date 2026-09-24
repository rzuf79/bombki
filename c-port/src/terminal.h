#ifndef BOMBKI_TERMINAL_H
#define BOMBKI_TERMINAL_H

#include <stdbool.h>
#include <stddef.h>

typedef struct {
    bool use_color;
} Terminal;

void terminal_initialize(Terminal *terminal, bool force_plain);
void terminal_write(void *context, const char *text);
void terminal_write_banner(const Terminal *terminal);
bool terminal_read_line(const Terminal *terminal, char *buffer, size_t capacity);

#endif
