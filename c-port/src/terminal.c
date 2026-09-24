#include "terminal.h"

#include <stdio.h>
#include <stdlib.h>

#ifdef _WIN32
#include <io.h>
#define is_terminal(stream) _isatty(_fileno(stream))
#else
#include <unistd.h>
#define is_terminal(stream) isatty(fileno(stream))
#endif

void terminal_initialize(Terminal *terminal, bool force_plain)
{
    if (terminal == NULL) {
        return;
    }

    terminal->use_color = !force_plain
        && getenv("NO_COLOR") == NULL
        && is_terminal(stdout);
}

void terminal_write(void *context, const char *text)
{
    (void)context;
    fputs(text, stdout);
}

void terminal_write_banner(const Terminal *terminal)
{
    if (terminal != NULL && terminal->use_color) {
        fputs("\033[1;33m", stdout);
    }
    fputs(
        "         |||||| \n"
        "         ||||||                     M&M=MILY MUD \n"
        "         ||||||     \n"
        " /-----------------------\\       /\\  /\\   | |   \\./  \n"
        "|   /\\           /\\       |     /  \\/  \\  | |__  | \n"
        "|   \\/           \\/       |\n"
        "|        /                |     /\\  /\\   |   |  |-\\ \n"
        "| \\     /___)      /      |    /  \\/  \\  |___|  |_/ \n"
        "|  \\______________/       |\n"
        "|   \\____________/        |\n"
        "\\_________________________/\n"
        "VERSJA CETA 0.86 23.05.99 - LAST MODYFIKACIONEN\n"
        "NACISNIJ DOWOLNY KLAWISZ ABY ROZPOCZAC GRE\n",
        stdout
    );
    if (terminal != NULL && terminal->use_color) {
        fputs("\033[0m", stdout);
    }
}

bool terminal_read_line(const Terminal *terminal, char *buffer, size_t capacity)
{
    bool interactive;

    if (buffer == NULL || capacity == 0) {
        return false;
    }

    interactive = is_terminal(stdin);
    if (interactive) {
        if (terminal != NULL && terminal->use_color) {
            fputs("\033[1;36m> \033[0m", stdout);
        } else {
            fputs("> ", stdout);
        }
        fflush(stdout);
    }

    if (fgets(buffer, (int)capacity, stdin) == NULL) {
        return false;
    }
    if (interactive) {
        fputs("\n", stdout);
    }
    return true;
}
