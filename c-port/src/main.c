#include <stdbool.h>
#include <errno.h>
#include <limits.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "bombki/game.h"
#include "bombki/parser.h"
#include "bombki/persistence.h"
#include "terminal.h"

#define INPUT_CAPACITY 256
#define ERROR_CAPACITY 256
#define SAVE_PATH "bombki.sav"

static bool plain_output_requested(int argc, char **argv)
{
    int index;

    for (index = 1; index < argc; ++index) {
        if (strcmp(argv[index], "--no-color") == 0) {
            return true;
        }
    }

    return false;
}

static bool configure_player(Terminal *terminal, GameState *state, char *input)
{
    Race race;

    terminal_write(terminal, "KORZYSTAJ Z DUZYCH LITER !!!!!!!!!!!!!!!!!\n");
    do {
        terminal_write(
            terminal,
            "NAPISZ SWA RASE : OLBRZYM , NIMFA , UFOK , CZAROMIL , CZLOWIEK , POL-ELF\n"
        );
        if (!terminal_read_line(terminal, input, INPUT_CAPACITY)) {
            return false;
        }
    } while (!game_parse_race(input, &race));

    do {
        terminal_write(terminal, "PODAJE SWE IMIE (I TAK MNIE TO NIE OBCHODZI)\n");
        if (!terminal_read_line(terminal, input, INPUT_CAPACITY)) {
            return false;
        }
    } while (!game_configure_player(state, input, race));

    terminal_write(
        terminal,
        "WITAJ W MUD-ZIE INTERAKTYWNIEJ FORMIE ROZRYWKI\n"
        "MUD JEST TO BARDZO SKOMPLIKOWANA GRA INTERNETOWA\n"
        "TEN PROGRAM NIE JEST IDENTYCZNY JAK MUD TYLE ZE NIE GRA W TO 1000 OSOB\n"
        "DZIEKI TEMU PROGRAMOWI NAUCZYSZ SIE GRAC W PRAWDZIWEGO MUDA\n"
        "ALE MAM NADZIEJE ZE ROZRYWKA TA BEDZIE DLA CIEBIE NOWYM WYZWANIEM\n"
        "W CZASIE GRY BEDZIESZ POZNAWAL CORAZ TO NOWE KOMENDY\n"
        "ALE JAK NARAZIE TYLKO KILKA Z NIECH\n"
        "KOMENDA EXIT PODAJE WSZYSTKIE AKTUALNIE DOSTEPNE WYJSCIA\n"
        "PORUSZASZ SIE ZA POMOCA KOMEND POLNOC POLUDNIE WSCHOD ZACHOD GORA DOL\n"
        "ABY SIE PATRZEC UZYJ KOMENDY PATRZ RAZEM Z RZECZA KTORA CHCESZ OBEJRZECZ\n"
    );
    return true;
}

static bool parse_integer_line(const char *text, int *value)
{
    char *end;
    long parsed;

    errno = 0;
    parsed = strtol(text, &end, 10);
    if (errno != 0 || end == text) {
        return false;
    }
    while (*end == ' ' || *end == '\t' || *end == '\r' || *end == '\n') {
        ++end;
    }
    if (*end != '\0' || parsed < INT_MIN || parsed > INT_MAX) {
        return false;
    }
    *value = (int)parsed;
    return true;
}

int main(int argc, char **argv)
{
    Terminal terminal;
    GameState state;
    GameOutput output;
    char input[INPUT_CAPACITY];
    char error[ERROR_CAPACITY];
    bool running = true;

    terminal_initialize(&terminal, plain_output_requested(argc, argv));
    output.write = terminal_write;
    output.context = &terminal;

    terminal_write_banner(&terminal);
    if (!terminal_read_line(&terminal, input, sizeof(input))) {
        return 0;
    }
    game_initialize(&state);
    if (!configure_player(&terminal, &state, input)) {
        return 0;
    }
    game_describe_current_room(&state, output);

    while (running && terminal_read_line(&terminal, input, sizeof(input))) {
        Command command = parser_parse(input);
        GameAction action = game_execute(&state, &command, output);

        switch (action) {
        case GAME_ACTION_SAVE:
            if (persistence_save(SAVE_PATH, &state, error, sizeof(error))) {
                terminal_write(&terminal, "ALL RIGHT !!! GRA ZAPISANA! ;)\n");
            } else {
                fprintf(stderr, "Nie mozna zapisac gry: %s\n", error);
            }
            break;
        case GAME_ACTION_LOAD:
            if (persistence_load(SAVE_PATH, &state, error, sizeof(error))) {
                terminal_write(&terminal, "POSTAC WLACZONA.\n");
                game_describe_current_room(&state, output);
            } else {
                fprintf(stderr, "Nie mozna wczytac gry: %s\n", error);
            }
            break;
        case GAME_ACTION_FLEE_THRESHOLD: {
            int threshold;

            if (!terminal_read_line(&terminal, input, sizeof(input))) {
                running = false;
            } else if (parse_integer_line(input, &threshold)) {
                game_set_flee_energy_threshold(&state, threshold);
            }
            break;
        }
        case GAME_ACTION_KICK_THRESHOLDS: {
            int energy_threshold;
            int mana_threshold;

            if (!terminal_read_line(&terminal, input, sizeof(input))) {
                running = false;
                break;
            }
            if (!parse_integer_line(input, &energy_threshold)) {
                break;
            }
            terminal_write(
                &terminal,
                "2)DO JAKIECH ILOSCI MANA CHCESZ KOPAC\n"
            );
            if (!terminal_read_line(&terminal, input, sizeof(input))) {
                running = false;
            } else if (parse_integer_line(input, &mana_threshold)) {
                game_set_kick_thresholds(
                    &state,
                    energy_threshold,
                    mana_threshold
                );
            }
            break;
        }
        case GAME_ACTION_COMPARISON_TARGET:
        case GAME_ACTION_COMPARISON_SCROLL_TARGET:
            if (!terminal_read_line(&terminal, input, sizeof(input))) {
                running = false;
            } else {
                game_resolve_comparison_target(
                    &state,
                    input,
                    action == GAME_ACTION_COMPARISON_SCROLL_TARGET,
                    output
                );
            }
            break;
        case GAME_ACTION_CAVE_RESPONSE:
            if (!terminal_read_line(&terminal, input, sizeof(input))) {
                running = false;
            } else {
                game_resolve_cave_response(&state, input, output);
            }
            break;
        case GAME_ACTION_QUIT:
            running = false;
            break;
        case GAME_ACTION_NONE:
            break;
        }
    }

    terminal_write(&terminal, "DO ZOBACZENIA.\n");
    return 0;
}
