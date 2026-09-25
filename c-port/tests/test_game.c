#include <assert.h>
#include <stddef.h>
#include <stdio.h>
#include <string.h>

#include "bombki/game.h"
#include "bombki/parser.h"
#include "items.h"
#include "world.h"

typedef struct {
    char text[16384];
    size_t length;
} Capture;

static void capture_write(void *context, const char *text)
{
    Capture *capture = context;
    size_t available = sizeof(capture->text) - capture->length - 1;
    size_t length = strlen(text);

    if (length > available) {
        length = available;
    }
    memcpy(capture->text + capture->length, text, length);
    capture->length += length;
    capture->text[capture->length] = '\0';
}

static void clear_capture(Capture *capture)
{
    capture->length = 0;
    capture->text[0] = '\0';
}

static void clear_world_contents(GameState *state)
{
    size_t index;

    for (index = 0; index < BOMBKI_WORLD_ACTOR_SLOTS; ++index) {
        state->world_actor_rooms[index] = BOMBKI_ROOM_NOWHERE;
    }
    for (index = 0; index < BOMBKI_WORLD_OBJECT_SLOTS; ++index) {
        state->world_object_rooms[index] = BOMBKI_ROOM_NOWHERE;
    }
}

static void test_status_sheet(void)
{
    GameState state;
    Capture capture = {{0}, 0};
    GameOutput output = {capture_write, &capture};
    Command command = parser_parse("JA");

    game_initialize(&state);
    (void)game_execute(&state, &command, output);
    assert(strcmp(capture.text,
        "NOSISZ ZE SOBA:\n"
        "W SUMIE MASZ 0/10 PRZEDMIOTOW\n"
        "BIJESZ SIE NA PIESCI\n"
        "NIE MASZ ZADNEJ OCHRONY\n"
        "JESTES NAGI !!!!!!!!\n"
        "MASZ 0 MONET I 10 PRAKTYK\n"
        "JESTES NA PIERWSZYM LEVELU A DO NASTEPNEGO BRAKUJE CI 700 KUNSZTU\n"
        "TWOJE PARAMETRY : SILA - 10/15 ZRECZNOSC - 10/15 MADROSC - 10/15\n"
        "S.Z-0                    FUKSROLL-0\n"
        "MASZ 100/100 MANY\n"
        "MASZ 50/50 ENERGII\n") == 0);

    state.item_quantities[ITEM_OLD_SWORD] = 1;
    state.item_quantities[ITEM_SMALL_SHIELD] = 1;
    state.item_quantities[ITEM_CAKE] = 2;
    state.item_quantities[ITEM_PIPE] = 1;
    state.item_quantities[ITEM_SPIKED_SUIT] = 1;
    state.item_quantities[ITEM_BACKPACK] = 1;
    state.equipped_weapon = ITEM_OLD_SWORD;
    state.equipped_shield = ITEM_SMALL_SHIELD;
    state.equipped_clothing = ITEM_SPIKED_SUIT;
    state.strength = 13;
    state.maximum_strength = 20;
    state.dexterity = 16;
    state.maximum_dexterity = 20;
    state.wisdom = 11;
    state.maximum_wisdom = 15;
    state.energy = 40;
    state.mana = 80;
    state.coins = 37;
    state.practices = 4;
    state.level = 3;
    state.experience = 30;
    state.quest_type = 2;
    state.quest_progress = 197;
    state.duncan_quest = 25;
    clear_capture(&capture);
    (void)game_execute(&state, &command, output);
    assert(strcmp(capture.text,
        "NOSISZ ZE SOBA:\n"
        "STARY ZARDZEWIALY MIECZ\n"
        "OKRAGLA MALA TARCZA\n"
        "SMACZNE CIASTKO " "       -20\n"
        "CIEZKA FAJKA OD DZIADA MROZA" "       -10\n"
        "GARNITUR Z KOLCAMI" "       -10\n"
        "W SUMIE MASZ 7/17 PRZEDMIOTOW\n"
        "MASZ NA SOBIE GRANITUR Z KOLCAMI \n"
        "TWOJA OCHRONA JEST MALA TARCZA\n"
        "JAKO BRONI UZYWASZ STAREGO MIECZA\n"
        "MASZ 37 MONET I 4 PRAKTYK\n"
        "JESTES NA TRZECIM LEVELU A DO NASTEPNEGO BRAKUJE CI 700KUNSZTU\n"
        "TWOJE PARAMETRY : SILA - 13/20 ZRECZNOSC - 16/20 MADROSC - 11/15\n"
        "S.Z-45                    FUKSROLL-18\n"
        "MASZ 80/100 MANY\n"
        "MASZ 40/50 ENERGII\n"
        "TWOJ AKTUALNY QUEST - ZABIC MUSISZ JESZCZE 47 POTWOROW\n"
        "NIE ZAPOMNIALES O POKRZYWIE W SADACH DUNCANA???\n") == 0);
}

int main(void)
{
    GameState state;
    Capture capture = {{0}, 0};
    GameOutput output = {capture_write, &capture};
    Command command;
    GameAction action;

    test_status_sheet();
    game_initialize(&state);
    assert(game_state_is_valid(&state));
    assert(state.room_id == 0);
    assert(state.turn == 0);

    command = parser_parse("n");
    action = game_execute(&state, &command, output);
    assert(action == GAME_ACTION_NONE);
    assert(state.room_id == ROOM_CENTRAL);
    assert(state.turn == 1);
    assert(strcmp(capture.text,
        "\nJESTES W OKROGLYM SALONIE WYPELNIONYM WITRAZAMI \n"
        "W POWIETRZU UNOSZA SIE ZAPACHY I SA TO ZAPACHY OK\n"
        "NO A POZA TYM NA SCIANIE JEST!!! PLAKAT!!!!\n"
        "NAPISZ PATRZ PLAKAT ABY GO ODCZYTAĆ \n") == 0);

    clear_capture(&capture);
    command = parser_parse("EXIT");
    (void)game_execute(&state, &command, output);
    assert(state.turn == 1);
    assert(strcmp(capture.text,
        "DOSTEPNE WYJSCIA:\n"
        "POLUDNIE-TAM GDZIE ZACZYNASZ GRE\n"
        "POLNOC-MIASTO\n"
        "WSCHOD-POKOJ TRENINGOWY 1\n"
        "ZACHOD-MUD SZKOLA\n"
        "DOL-PODDZIEMNY POKOJ TRENINGOWY(2)\n") == 0);

    clear_capture(&capture);
    command = parser_parse("PATRZ PLAKAT");
    (void)game_execute(&state, &command, output);
    assert(strcmp(capture.text,
        "NA PLAKACIE PISZE:\n"
        "JEŻELI CHCESZ TRENOWAC UDAJ SIE DO POKOJU TRENINGOWEGO\n"
        "JEŻELI CHCESZ NAUCZYC SIE NOWYCH KOMEND IDZ DO MUD SZKOLY\n"
        "DOPIERO POTEM IDZ DO MIASTA \n"
        "A OTO TAJNE KOMENDY :\n"
        " MODE - WPROWADZENIE W STAN PODSWIADOMOSCI\n"
        " UNMODE - POWROT DO POPRZEDNIEGO STANU\n"
        "W CZASIE POBYTU W STANIE PODSWIADOMOSCI DZIALA WIELE KOMEND MIN:\n"
        " JA - WSZYSTKO O TOBIE , BIERZ , UZYJ , ZDEJMIJ , ODRZUC I INNE \n"
        " PONADTO WIELE KOMEND TRZEBA ODKRYC NP:ZMIEN KOLOR , ZMIEN TLO \n"
        " UWAGA Z OSTATNIEJ CHWILI : KOMENDA SPIJ W STANIE PODSWIADOMOSCI!\n") == 0);

    clear_capture(&capture);
    command = parser_parse("PAMIETAJ");
    action = game_execute(&state, &command, output);
    assert(action == GAME_ACTION_SAVE);
    assert(state.turn == 1);
    assert(capture.text[0] == '\0');
    clear_capture(&capture);
    command = parser_parse("SCAN");
    action = game_execute(&state, &command, output);
    assert(action == GAME_ACTION_NONE);
    assert(state.turn == 1);
    assert(strcmp(capture.text,
        "FUNKCJA BEDZIE DOSTEPNA ZA DWA LATA , I TAK ZGINIESZ , I TAK :) \n") == 0);
    clear_capture(&capture);
    command = parser_parse("POMOC");
    (void)game_execute(&state, &command, output);
    assert(strcmp(capture.text,
        "KOMENDY: PATRZ, EXIT, POLNOC, POLUDNIE, WSCHOD, ZACHOD, GORA, DOL,\n"
        "         N, S, W, E, U, D, JA, PAMIETAJ, WLACZ POSTAC, KONIEC.\n") == 0);
    clear_capture(&capture);
    command = parser_parse("NIEZNANA KOMENDA");
    (void)game_execute(&state, &command, output);
    assert(capture.length == 0);
    command = parser_parse("u");
    (void)game_execute(&state, &command, output);
    assert(strcmp(capture.text, "NIE MOZESZ ISC W TYM KIERUNKU.\n") == 0);

    game_initialize(&state);
    state.room_id = ROOM_TELEPORT;
    clear_capture(&capture);
    command = parser_parse("d");
    action = game_execute(&state, &command, output);
    assert(action == GAME_ACTION_NONE);
    assert(state.room_id == ROOM_CENTRAL);
    assert(strstr(capture.text,
        "T***E***L***E***P***O***R***T***O***W***A***L***E***S***** *****S***I***E!")
        != NULL);

    game_initialize(&state);
    command = parser_parse("n");
    (void)game_execute(&state, &command, output);
    command = parser_parse("w");
    (void)game_execute(&state, &command, output);
    command = parser_parse("w");
    (void)game_execute(&state, &command, output);
    assert(state.room_id == ROOM_SCHOOL_TWO);
    clear_capture(&capture);
    command = parser_parse("EXIT");
    (void)game_execute(&state, &command, output);
    assert(strcmp(capture.text,
        "DOSTEPNE WYJSCIA:\n"
        "WSCHOD-MUD SZKOLA\n"
        "ZACHOD-POKOJ\n"
        "POLNOC-POKOJ\n"
        "POLUDNIE-POKOJ\n"
        "GORA-POKOJ\n"
        "DOL-POKOJ\n") == 0);
    clear_capture(&capture);
    command = parser_parse("n");
    (void)game_execute(&state, &command, output);
    assert(state.room_id == ROOM_SCHOOL_NORTH_ROOM);
    command = parser_parse("s");
    (void)game_execute(&state, &command, output);
    assert(state.room_id == ROOM_SCHOOL_TWO);

    game_initialize(&state);
    state.world_actor_rooms[WORLD_ACTOR_CAGE_WEAK] = BOMBKI_ROOM_NOWHERE;
    state.world_object_rooms[WORLD_OBJECT_PIPE] = ROOM_START;
    state.living_door_alive = false;
    state.old_elf_present = false;
    game_regenerate_encounters(&state);
    assert(state.world_actor_rooms[WORLD_ACTOR_KORNIK] >= ROOM_ARENA_33);
    assert(state.world_actor_rooms[WORLD_ACTOR_KORNIK] <= ROOM_ARENA_57);
    assert(state.world_actor_rooms[WORLD_ACTOR_CAGE_WEAK] == BOMBKI_ROOM_NOWHERE);
    assert(state.world_object_rooms[WORLD_OBJECT_PIPE] == ROOM_START);
    assert(state.living_door_alive);
    assert(state.old_elf_present);

    game_reset_world(&state);
    assert(state.world_actor_rooms[WORLD_ACTOR_CAGE_WEAK] == ROOM_CAGE_WEAK);
    assert(state.world_actor_rooms[WORLD_ACTOR_CAGE_DEXTEROUS]
        == ROOM_CAGE_DEXTEROUS);
    assert(state.world_actor_rooms[WORLD_ACTOR_CAGE_RESISTANT]
        == ROOM_CAGE_RESISTANT);
    assert(state.world_actor_rooms[WORLD_ACTOR_CAGE_STRONG] == ROOM_CAGE_STRONG);
    assert(state.world_actor_rooms[WORLD_ACTOR_CAGE_ALL] == ROOM_CAGE_ALL);
    assert(state.world_object_rooms[WORLD_OBJECT_PIPE] == BOMBKI_ROOM_NOWHERE);
    assert(!state.quest_passage_open);

    clear_world_contents(&state);
    state.room_id = ROOM_ARENA_33;
    state.world_actor_rooms[WORLD_ACTOR_KORNIK] = ROOM_ARENA_33;
    state.world_object_rooms[WORLD_OBJECT_OLD_SWORD] = ROOM_ARENA_33;
    clear_capture(&capture);
    game_describe_current_room(&state, output);
    assert(strstr(capture.text,
        "KORNIK SZUKA JAKIEGOS DRZEWA ABY COS PRZEKASIC") != NULL);
    assert(strstr(capture.text,
        "W TWYM POKOJU LEZY !STARY! ZARDZEWIALY MIECZ") != NULL);

    state.world_actor_rooms[WORLD_ACTOR_MUCHA] = ROOM_ARENA_33;
    clear_capture(&capture);
    command = parser_parse("KTO");
    (void)game_execute(&state, &command, output);
    assert(strcmp(capture.text,
        "KORNIK SZUKA JAKIEGOS DRZEWA ABY COS PRZEKASIC\n"
        "MUCHA BZYKA SOBIE TO TU TO TAM\n") == 0);

    state.room_id = ROOM_SHOP_STREET;
    state.world_actor_rooms[WORLD_ACTOR_JAMNIK] = ROOM_SHOP_STREET;
    clear_capture(&capture);
    command = parser_parse("KTO");
    (void)game_execute(&state, &command, output);
    assert(capture.length == 0);

    clear_capture(&capture);
    command = parser_parse("CWICZ RECE");
    (void)game_execute(&state, &command, output);
    assert(capture.length == 0);
    command = parser_parse("KUP");
    (void)game_execute(&state, &command, output);
    assert(capture.length == 0);

    clear_world_contents(&state);
    state.room_id = ROOM_CAGE_WEAK;
    state.world_actor_rooms[WORLD_ACTOR_CAGE_WEAK] = ROOM_CAGE_WEAK;
    clear_capture(&capture);
    game_describe_current_room(&state, output);
    assert(strstr(capture.text,
        "POTWOR - CIENIAS STOI NA 1 NODZE POD SCIANA") != NULL);
    state.world_actor_rooms[WORLD_ACTOR_CAGE_WEAK] = BOMBKI_ROOM_NOWHERE;
    clear_capture(&capture);
    game_describe_current_room(&state, output);
    assert(strstr(capture.text,
        "PAROJACE WNETRZNOSCI POTWORA SA ROZWLECZONE DOOKOLA") != NULL);

    state.room_id = ROOM_CAGE_DEXTEROUS;
    clear_capture(&capture);
    game_describe_current_room(&state, output);
    assert(strstr(capture.text,
        "PAROJACE WNETRZNOSCI POTWORA SMIERDZA DOSYC MOCNO") != NULL);

    state.room_id = ROOM_LIVING_DOOR;
    state.living_door_alive = true;
    clear_capture(&capture);
    game_describe_current_room(&state, output);
    assert(strstr(capture.text,
        "DRZWI WYCIAGAJA SWE DREWNIANE RECE W TWYM KIERUNKU MOWIAC : NIE WPUSZCZE")
        != NULL);
    clear_capture(&capture);
    command = parser_parse("w");
    (void)game_execute(&state, &command, output);
    assert(state.room_id == ROOM_LIVING_DOOR);
    assert(strcmp(capture.text,
        "SPROBOJ OMINAC TE MEGA-PRZYPAKOWANE DRZWI KTORYCH BY SIE HE-MAN NIE POWSTYDZIL\n") == 0);

    state.world_actor_rooms[WORLD_ACTOR_LIVING_DOOR] = ROOM_LIVING_DOOR;
    assert(game_select_opponent(&state, "DRZWI"));
    assert(state.active_opponent_energy >= 130);
    assert(state.active_opponent_energy <= 149);
    state.active_opponent_energy = 0;
    clear_capture(&capture);
    assert(game_resolve_active_opponent_victory(&state, output));
    assert(!state.living_door_alive);
    assert(state.world_actor_rooms[WORLD_ACTOR_LIVING_DOOR]
        == BOMBKI_ROOM_NOWHERE);
    clear_capture(&capture);
    command = parser_parse("EXIT");
    (void)game_execute(&state, &command, output);
    assert(strcmp(capture.text,
        "DOSTEPNE WYJSCIA:\n"
        "WSCHOD-PODEJRZANE KRZAKI\n"
        "ZACHOD-WEJSCIE DO DOMKU\n") == 0);
    clear_capture(&capture);
    command = parser_parse("w");
    (void)game_execute(&state, &command, output);
    assert(state.room_id == ROOM_ELF_HOUSE);

    state.old_elf_present = false;
    clear_capture(&capture);
    game_describe_current_room(&state, output);
    assert(strstr(capture.text,
        "WIDZISZ TU TYLKO PLASZCZ PO STARUCHU KTORY ZNIKNA W PRZESTRZEN")
        != NULL);

    state.room_id = ROOM_JUNCTION;
    state.quest_passage_open = false;
    clear_capture(&capture);
    command = parser_parse("w");
    (void)game_execute(&state, &command, output);
    assert(state.room_id == ROOM_JUNCTION);
    assert(strcmp(capture.text,
        "QUEST-MASTER MOWI CI : BARDZO MI PRZYKRO ALE MUSISZ MIEC PRZEPUSTKE\n"
    ) == 0);
    state.item_quantities[ITEM_QUEST_PASS] = 1;
    state.quest_passage_open = true;
    clear_capture(&capture);
    command = parser_parse("EXIT");
    (void)game_execute(&state, &command, output);
    assert(strstr(capture.text, "ZACHOD-DROGA") != NULL);
    clear_capture(&capture);
    command = parser_parse("w");
    (void)game_execute(&state, &command, output);
    assert(state.room_id == ROOM_ROAD);
    clear_capture(&capture);
    command = parser_parse("w");
    (void)game_execute(&state, &command, output);
    assert(state.room_id == ROOM_STONY_ROAD);
    clear_capture(&capture);
    command = parser_parse("w");
    (void)game_execute(&state, &command, output);
    assert(state.room_id == ROOM_ROAD_END);
    assert(strstr(capture.text,
        "UPS DROGA SIE KONCZY NA TEJ NIEPRZEPASTNEJ RZECE O DALSZEJ PODROZY NIE MA MOWY"
    ) != NULL);

    state.room_id = ROOM_ARMORY;
    clear_capture(&capture);
    command = parser_parse("PATRZ POSTER");
    (void)game_execute(&state, &command, output);
    assert(strcmp(capture.text,
        "OKAZJA !!! PRZY ZAKUPIE GARNITURU KOMPLET UBRAN GRATIS !!!(ZART)\n")
        == 0);
    clear_capture(&capture);
    command = parser_parse("PATRZ COS");
    (void)game_execute(&state, &command, output);
    assert(capture.length == 0);

    state.room_id = ROOM_BRUSZCZ_SOUTH;
    state.random_state = 1u;
    state.coins = 0;
    clear_capture(&capture);
    command = parser_parse("PATRZ STUDNIA");
    (void)game_execute(&state, &command, output);
    assert(strcmp(capture.text,
        "ZAGLADASZ DO SRODKA STUDNI,COS TAM JEST,WYCIĄGASZ 1 MONET!\n") == 0);
    assert(state.coins == 1);

    clear_world_contents(&state);
    for (size_t index = 0; index < world_room_count(); ++index) {
        const Room *room = world_room_at(index);
        const char *targets[2] = {room->look_target, room->look_target_2};

        state.room_id = room->id;
        clear_capture(&capture);
        game_describe_current_room(&state, output);
        assert(capture.length > 0);
        assert(strstr(capture.text, "[PORT:") == NULL);

        for (size_t target_index = 0; target_index < 2; ++target_index) {
            char input[128];

            if (targets[target_index] == NULL) {
                continue;
            }
            assert(snprintf(input, sizeof(input), "PATRZ %s",
                targets[target_index]) > 0);
            command = parser_parse(input);
            clear_capture(&capture);
            (void)game_execute(&state, &command, output);
            assert(capture.length > 0);
            assert(strstr(capture.text, "[PORT:") == NULL);
        }
    }

    return 0;
}
