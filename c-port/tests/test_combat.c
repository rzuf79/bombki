#include <assert.h>
#include <stddef.h>
#include <stdio.h>
#include <string.h>

#include "bombki/game.h"
#include "bombki/parser.h"
#include "items.h"
#include "world.h"

typedef struct {
    char text[2048];
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

static GameAction execute_action(
    GameState *state,
    Capture *capture,
    const char *input
)
{
    Command command = parser_parse(input);
    GameOutput output = {capture_write, capture};

    return game_execute(state, &command, output);
}

static void execute(GameState *state, Capture *capture, const char *input)
{
    assert(execute_action(state, capture, input) == GAME_ACTION_NONE);
}

static void prepare_enemy(
    GameState *state,
    WorldActorId actor,
    int room
)
{
    game_initialize(state);
    state->room_id = room;
    state->world_actor_rooms[actor] = room;
}

static void test_equal_dexterity_exchanges_both_hits(void)
{
    GameState state;
    Capture capture = {{0}, 0};

    prepare_enemy(&state, WORLD_ACTOR_CAGE_WEAK, ROOM_CAGE_WEAK);
    state.dexterity = 3;
    state.random_state = 2u;

    execute(&state, &capture, "ZABIJ POTWOR");

    assert(strcmp(capture.text,
        "WALCZYSZ - <<<<TWOJ WROG MA 20%>>>><<<< A TY MASZ 50% ENERGII>>>>>\n"
        "PRZECIWNIK CIE TYLKO DRASNA I TRACISZ 2% ENERGII\n"
        "MASZ PECHA : LEKKO POPCHNALES GO I STRACIL TYLKO 2% ENERGII\n"
    ) == 0);
    assert(state.energy == 48);
    assert(state.active_opponent_energy == 18);
    assert(state.active_opponent_actor == WORLD_ACTOR_CAGE_WEAK);
    assert(state.turn == 1);
    assert(game_state_is_valid(&state));

}

static void test_dodge_rolls_skip_both_attacks(void)
{
    GameState state;
    Capture capture = {{0}, 0};

    prepare_enemy(&state, WORLD_ACTOR_KORNIK, ROOM_ARENA_33);
    state.random_state = 8u;

    execute(&state, &capture, "ZABIJ KORNIK");

    assert(strcmp(capture.text,
        "WALCZYSZ - <<<<TWOJ WROG MA 1%>>>><<<< A TY MASZ 50% ENERGII>>>>>\n"
        "UNIKASZ CIOSU WROGA TWEGO I SMIEJESZ SIE Z JEGO NIEPORADNOSCI\n"
        "PRZECIWNIK UNIKA TWOJEGO LAMERSKIEGO ATAKU\n"
    ) == 0);
    assert(state.energy == 50);
    assert(state.active_opponent_energy == 1);
    assert(state.turn == 1);
    assert(game_state_is_valid(&state));
}

static void test_small_shield_uses_recovered_defense_roll(void)
{
    GameState state;
    Capture capture = {{0}, 0};

    prepare_enemy(&state, WORLD_ACTOR_CAGE_WEAK, ROOM_CAGE_WEAK);
    state.dexterity = 3;
    state.item_quantities[ITEM_SMALL_SHIELD] = 1;
    state.equipped_shield = ITEM_SMALL_SHIELD;
    state.random_state = 287u;

    execute(&state, &capture, "ZABIJ POTWOR");

    assert(strcmp(capture.text,
        "WALCZYSZ - <<<<TWOJ WROG MA 20%>>>><<<< A TY MASZ 50% ENERGII>>>>>\n"
        "PRZECIWNIK CIE TYLKO DRASNA I TRACISZ 2% ENERGII\n"
        "OSLONILES SIE ! TRACISZ 1 ENERGII\n"
        "MASZ PECHA : LEKKO POPCHNALES GO I STRACIL TYLKO 4% ENERGII\n"
    ) == 0);
    assert(state.energy == 49);
    assert(state.active_opponent_energy == 16);
    assert(state.turn == 1);
    assert(game_state_is_valid(&state));
}

static void test_victory_finishes_the_same_atomic_turn(void)
{
    GameState state;
    Capture capture = {{0}, 0};

    prepare_enemy(&state, WORLD_ACTOR_KORNIK, ROOM_ARENA_33);
    state.dexterity = 1;
    state.strength = 2;
    state.item_quantities[ITEM_BLOODY_HEART] = 1;
    state.random_state = 1u;

    execute(&state, &capture, "ZABIJ KORNIK");

    assert(strcmp(capture.text,
        "WALCZYSZ - <<<<TWOJ WROG MA 1%>>>><<<< A TY MASZ 50% ENERGII>>>>>\n"
        "PRZECIWNIK CIE TYLKO DRASNA I TRACISZ 0% ENERGII\n"
        "MASZ PECHA : LEKKO POPCHNALES GO I STRACIL TYLKO 1% ENERGII\n"
        "ZABILES GO ! ZYSKUJESZ ZA TO 22 KUNSZTU \n"
        "WYCIAGASZ 2 MONET Z CIALA\n"
    ) == 0);
    assert(state.coins == 2);
    assert(state.experience == 22);
    assert(state.world_actor_rooms[WORLD_ACTOR_KORNIK] == BOMBKI_ROOM_NOWHERE);
    assert(state.active_opponent_actor == BOMBKI_NO_ACTOR);
    assert(state.turn == 1);
    assert(game_state_is_valid(&state));
}

static void test_death_stops_the_current_combat(void)
{
    GameState state;
    Capture capture = {{0}, 0};

    prepare_enemy(&state, WORLD_ACTOR_CAGE_WEAK, ROOM_CAGE_WEAK);
    state.dexterity = 3;
    state.strength = 1;
    state.energy = 1;
    state.quest_type = 2;
    state.quest_progress = 37;
    state.random_state = 0u;

    execute(&state, &capture, "ZABIJ POTWOR");

    assert(strcmp(capture.text,
        "WALCZYSZ - <<<<TWOJ WROG MA 20%>>>><<<< A TY MASZ 1% ENERGII>>>>>\n"
        "PRZECIWNIK CIE TYLKO DRASNA I TRACISZ 1% ENERGII\n"
        "MASZ PECHA : LEKKO POPCHNALES GO I STRACIL TYLKO 0% ENERGII\n"
        "!!!!!!!!!!!ZOSTALES ZABITY!!!!!!!!!!!!\n"
        "AJAJAJAJ TWOJA GLOWA NAWALA JAK TESCIOWA!!!\n"
        "NIC NA TO NIE PORADZE , TRZEBA BYLO SIE STARAC\n"
        "NAGLE REFLEKSJA - DO JASNEJ CENZURY JAK SIE WALCZYLO TYM MIECZEM?\n"
        "NIESTETY WRAZ ZE SMIERCIA TRACISZ KUNSZT ADEKWATNIE DO TWOJEGO LEVELKA\n"
        "POJAWISZ SIE W CENTRUM MIASTA ..... POWODZENIA\n"
        "P.S : AHA POTWORY SIE ODREGENEROWALY\n"
    ) == 0);
    assert(state.energy == state.maximum_energy);
    assert(state.experience == -208);
    assert(state.room_id == ROOM_CITY_THRESHOLD);
    assert(state.active_opponent_actor == BOMBKI_NO_ACTOR);
    assert(state.world_actor_rooms[WORLD_ACTOR_CAGE_WEAK] == ROOM_CAGE_WEAK);
    assert(state.quest_progress == 200);
    assert(state.turn == 1);
    assert(game_state_is_valid(&state));

    prepare_enemy(&state, WORLD_ACTOR_CAGE_WEAK, ROOM_CAGE_WEAK);
    state.dexterity = 3;
    state.strength = 1;
    state.energy = 1;
    state.quest_type = 1;
    state.quest_progress = 4;
    state.random_state = 0u;
    memset(&capture, 0, sizeof(capture));
    execute(&state, &capture, "ZABIJ POTWOR");
    assert(state.quest_progress == 50);
}

static void test_milestone_six_fixed_opponents(void)
{
    GameState state;
    Capture capture = {{0}, 0};
    GameOutput output = {capture_write, &capture};

    game_initialize(&state);
    state.room_id = ROOM_JUNCTION;
    assert(game_select_opponent(&state, "QUEST-MASTER"));
    assert(state.active_opponent_energy == 188);
    assert(state.active_opponent_strength == 10);
    assert(state.active_opponent_dexterity == 26);
    assert(state.active_opponent_fireballs == 20);
    assert(state.active_opponent_poison_casts == 10);
    state.active_opponent_energy = 0;
    assert(game_resolve_active_opponent_victory(&state, output));
    assert(state.item_quantities[ITEM_QUEST_PASS] == 1);
    assert(state.quest_passage_open);
    assert(state.world_actor_rooms[WORLD_ACTOR_QUEST_MASTER] == ROOM_JUNCTION);

    game_initialize(&state);
    state.room_id = ROOM_ELF_HOUSE;
    state.level = 3;
    assert(game_select_opponent(&state, "STARUCH"));
    assert(state.active_opponent_energy == 1);
    assert(state.active_opponent_strength == 2);
    assert(state.active_opponent_dexterity == 1);
    state.active_opponent_energy = 0;
    memset(&capture, 0, sizeof(capture));
    assert(game_resolve_active_opponent_victory(&state, output));
    assert(strstr(capture.text,
        "HMMM UBRANIE JEST , ALE CIALO GDZIES ZNIKNELO , WTEM SLYSZYSZ GLOS :\n"
        "--- TO BYL TWOJ BLAD --- , DOSTAJESZ OCMIENIA LECZ NIE WIESZ CO TO BYLO\n"
    ) != NULL);
    assert(!state.old_elf_present);
    assert(state.world_actor_rooms[WORLD_ACTOR_STARUCH] == BOMBKI_ROOM_NOWHERE);
    assert(state.level == 2);
    assert(game_state_is_valid(&state));
}

static void test_simultaneous_victory_resolves_before_death(void)
{
    GameState state;
    Capture capture = {{0}, 0};
    const char *reward;
    const char *death;

    prepare_enemy(&state, WORLD_ACTOR_CAGE_WEAK, ROOM_CAGE_WEAK);
    state.dexterity = 3;
    state.strength = 3;
    state.energy = 1;
    state.random_state = 0u;
    assert(game_select_opponent(&state, "POTWOR"));
    state.active_opponent_energy = 1;

    execute(&state, &capture, "ZABIJ POTWOR");

    reward = strstr(capture.text, "WYCIAGASZ ");
    death = strstr(capture.text, "!!!!!!!!!!!ZOSTALES ZABITY!!!!!!!!!!!!\n");
    assert(reward != NULL);
    assert(death != NULL);
    assert(reward < death);
    assert(state.world_actor_rooms[WORLD_ACTOR_CAGE_WEAK]
        == BOMBKI_ROOM_NOWHERE);
    assert(state.energy == state.maximum_energy);
    assert(state.room_id == ROOM_CITY_THRESHOLD);
    assert(game_state_is_valid(&state));
}

static void test_invalid_target_is_silent_and_non_consuming(void)
{
    GameState state;
    Capture capture = {{0}, 0};
    uint32_t random_state;

    game_initialize(&state);
    random_state = state.random_state;
    execute(&state, &capture, "ZABIJ NIEMA");

    assert(capture.length == 0);
    assert(state.turn == 0);
    assert(state.random_state == random_state);
    assert(state.active_opponent_actor == BOMBKI_NO_ACTOR);
}

static void test_flee_practice_and_threshold_prompt(void)
{
    GameState state;
    Capture capture = {{0}, 0};

    game_initialize(&state);
    state.wisdom = 13;
    state.dexterity = 13;

    execute(&state, &capture, "CWICZ UCIEKAC");
    assert(strcmp(capture.text,
        "CWICZYSZ UCIEKANIE - PRAWDOPODOBIENSTWO JEST TERAZ 21% MASZ 9 PRAKTYK\n"
    ) == 0);
    assert(state.flee_skill == 21);
    assert(state.practices == 9);
    assert(state.turn == 1);

    memset(&capture, 0, sizeof(capture));
    assert(execute_action(&state, &capture, "ZWIEJ")
        == GAME_ACTION_FLEE_THRESHOLD);
    assert(strcmp(capture.text,
        "PONIZEJ ILU ENERGII CHCESZ UCIEKAC?\n"
    ) == 0);
    assert(state.turn == 1);

    game_set_flee_energy_threshold(&state, 37);
    assert(state.flee_energy_threshold == 37);

    state.flee_skill = 85;
    memset(&capture, 0, sizeof(capture));
    execute(&state, &capture, "CWICZ UCIEKAC");
    assert(strcmp(capture.text,
        "ALBO MASZ ZA DOBRZE WYTRENOWANE ALBO ZA MALO PRAKTYK\n"
    ) == 0);
    assert(state.turn == 1);
}

static void test_kick_practice_and_threshold_prompt(void)
{
    GameState state;
    Capture capture = {{0}, 0};

    game_initialize(&state);
    state.strength = 13;
    state.dexterity = 13;
    state.wisdom = 13;

    execute(&state, &capture, "CWICZ KOPAC");
    assert(strcmp(capture.text,
        "CWICZYSZ KOPANIE - PRAWDOPODOBIENSTWO JEST TERAZ 13% MASZ 9 PRAKTYK\n"
    ) == 0);
    assert(state.kick_skill == 13);
    assert(state.practices == 9);
    assert(state.turn == 1);

    memset(&capture, 0, sizeof(capture));
    assert(execute_action(&state, &capture, "KOP")
        == GAME_ACTION_KICK_THRESHOLDS);
    assert(strcmp(capture.text,
        "ZADAM CI PARE PYTAN:\n"
        "1)PONIZEJ JAKIEJ ENERGI CHCESZ ZACZAC KOPAC\n"
    ) == 0);
    assert(state.turn == 1);

    game_set_kick_thresholds(&state, 37, 8);
    assert(state.kick_energy_threshold == 37);
    assert(state.kick_mana_threshold == 8);

    state.wisdom = 10;
    memset(&capture, 0, sizeof(capture));
    execute(&state, &capture, "CWICZ KOPAC");
    assert(capture.length == 0);
    assert(state.turn == 1);
}

static void test_successful_automatic_kick(void)
{
    GameState state;
    Capture capture = {{0}, 0};

    prepare_enemy(&state, WORLD_ACTOR_CAGE_WEAK, ROOM_CAGE_WEAK);
    state.strength = 13;
    state.dexterity = 3;
    state.level = 7;
    state.kick_skill = 100;
    state.kick_energy_threshold = 60;
    state.kick_mana_threshold = 0;
    state.random_state = 1u;

    execute(&state, &capture, "ZABIJ POTWOR");

    assert(strcmp(capture.text,
        "WALCZYSZ - <<<<TWOJ WROG MA 20%>>>><<<< A TY MASZ 50% ENERGII>>>>>\n"
        "PRZECIWNIK CIE TYLKO DRASNA I TRACISZ 0% ENERGII\n"
        "DOSTAL I STRACIL 7% ENERGII\n"
        "TWOJ SUPER KOP ZABIERA 8% ENERGI\n"
    ) == 0);
    assert(state.energy == 50);
    assert(state.mana == 94);
    assert(state.active_opponent_energy == 5);
    assert(state.turn == 1);
    assert(game_state_is_valid(&state));
}

static void test_failed_automatic_kick(void)
{
    GameState state;
    Capture capture = {{0}, 0};

    prepare_enemy(&state, WORLD_ACTOR_CAGE_WEAK, ROOM_CAGE_WEAK);
    state.strength = 13;
    state.dexterity = 3;
    state.level = 7;
    state.kick_skill = 100;
    state.kick_energy_threshold = 60;
    state.kick_mana_threshold = 0;
    state.random_state = 0u;

    execute(&state, &capture, "ZABIJ POTWOR");

    assert(strcmp(capture.text,
        "WALCZYSZ - <<<<TWOJ WROG MA 20%>>>><<<< A TY MASZ 50% ENERGII>>>>>\n"
        "PRZECIWNIK CIE TYLKO DRASNA I TRACISZ 1% ENERGII\n"
        "MASZ PECHA : LEKKO POPCHNALES GO I STRACIL TYLKO 2% ENERGII\n"
        "TWOJ SUPER KOP CHYBIA PRZECIWNIKA \n"
    ) == 0);
    assert(state.energy == 49);
    assert(state.mana == 98);
    assert(state.active_opponent_energy == 18);
    assert(state.turn == 1);
    assert(game_state_is_valid(&state));
}

static void test_successful_automatic_flee(void)
{
    GameState state;
    Capture capture = {{0}, 0};

    prepare_enemy(&state, WORLD_ACTOR_CAGE_WEAK, ROOM_CAGE_WEAK);
    state.dexterity = 3;
    state.flee_skill = 21;
    state.flee_energy_threshold = 60;
    state.random_state = 4u;

    execute(&state, &capture, "ZABIJ POTWOR");

    assert(strcmp(capture.text,
        "WALCZYSZ - <<<<TWOJ WROG MA 20%>>>><<<< A TY MASZ 50% ENERGII>>>>>\n"
        "PRZECIWNIK CIE TYLKO DRASNA I TRACISZ 0% ENERGII\n"
        "MASZ PECHA : LEKKO POPCHNALES GO I STRACIL TYLKO 2% ENERGII\n"
        "WSTYD !!! UCIEKLES Z POLA BITWY TRACISZ 20 KUNSZTU\n"
    ) == 0);
    assert(state.energy == 50);
    assert(state.mana == 82);
    assert(state.experience == -20);
    assert(state.active_opponent_actor == BOMBKI_NO_ACTOR);
    assert(state.world_actor_rooms[WORLD_ACTOR_CAGE_WEAK] == ROOM_CAGE_WEAK);
    assert(state.turn == 1);
    assert(game_state_is_valid(&state));
}

static void test_failed_automatic_flee(void)
{
    GameState state;
    Capture capture = {{0}, 0};

    prepare_enemy(&state, WORLD_ACTOR_CAGE_WEAK, ROOM_CAGE_WEAK);
    state.dexterity = 3;
    state.flee_skill = 21;
    state.flee_energy_threshold = 60;
    state.random_state = 0u;

    execute(&state, &capture, "ZABIJ POTWOR");

    assert(strcmp(capture.text,
        "WALCZYSZ - <<<<TWOJ WROG MA 20%>>>><<<< A TY MASZ 50% ENERGII>>>>>\n"
        "PRZECIWNIK CIE TYLKO DRASNA I TRACISZ 1% ENERGII\n"
        "MASZ PECHA : LEKKO POPCHNALES GO I STRACIL TYLKO 2% ENERGII\n"
        "NIE UDALO CI SIE UCIEC !!!! WALCZYSZ DALEJ !!! \n"
    ) == 0);
    assert(state.energy == 49);
    assert(state.mana == 82);
    assert(state.experience == 0);
    assert(state.active_opponent_actor == WORLD_ACTOR_CAGE_WEAK);
    assert(state.active_opponent_energy == 18);
    assert(state.turn == 1);
    assert(game_state_is_valid(&state));
}

static void test_flee_low_mana_blocked_silently(void)
{
    GameState state;
    Capture capture = {{0}, 0};

    prepare_enemy(&state, WORLD_ACTOR_CAGE_WEAK, ROOM_CAGE_WEAK);
    state.dexterity = 3;
    state.flee_skill = 20;
    state.mana = 15;
    state.maximum_mana = 15;
    state.random_state = 1u;
    assert(game_select_opponent(&state, "POTWOR"));

    memset(&capture, 0, sizeof(capture));
    execute(&state, &capture, "ZWIEJ");

    assert(strcmp(capture.text,
        "WALCZYSZ - <<<<TWOJ WROG MA 20%>>>><<<< A TY MASZ 50% ENERGII>>>>>\n"
        "PRZECIWNIK CIE TYLKO DRASNA I TRACISZ 0% ENERGII\n"
    ) == 0);
    assert(state.mana == 12);
    assert(game_combat_is_active(&state));
    assert(state.active_opponent_energy == 20);
    assert(state.turn == 1);
    assert(game_state_is_valid(&state));
}

static void test_combat_loop_options_and_empty_round(void)
{
    GameState state;
    Capture capture = {{0}, 0};
    GameOutput output = {capture_write, &capture};

    prepare_enemy(&state, WORLD_ACTOR_CAGE_WEAK, ROOM_CAGE_WEAK);
    state.dexterity = 3;
    state.strength = 1;
    state.kick_skill = 20;
    state.flee_skill = 20;
    state.random_state = 2u;

    execute(&state, &capture, "ZABIJ POTWOR");
    assert(game_combat_is_active(&state));
    assert(state.turn == 1);

    memset(&capture, 0, sizeof(capture));
    game_describe_combat_options(&state, output);
    assert(strcmp(capture.text,
        "OPCJE WALKI: ENTER/ZABIJ | KOP | ZWIEJ\n"
    ) == 0);

    state.kick_skill = 0;
    state.flee_skill = 0;
    memset(&capture, 0, sizeof(capture));
    game_describe_combat_options(&state, output);
    assert(strcmp(capture.text, "OPCJE WALKI: ENTER/ZABIJ\n") == 0);

    memset(&capture, 0, sizeof(capture));
    execute(&state, &capture, "");
    assert(strncmp(capture.text, "WALCZYSZ - ", 11) == 0);
    assert(state.turn == 2);
}

static void test_combat_loop_kick_and_flee_choices(void)
{
    GameState state;
    Capture capture = {{0}, 0};

    prepare_enemy(&state, WORLD_ACTOR_CAGE_WEAK, ROOM_CAGE_WEAK);
    state.dexterity = 3;
    state.kick_skill = 100;
    state.random_state = 0u;
    assert(game_select_opponent(&state, "POTWOR"));

    execute(&state, &capture, "KOP");
    assert(strstr(capture.text, "TWOJ SUPER KOP ZABIERA 4% ENERGI\n") != NULL);
    assert(strstr(capture.text, "MASZ PECHA") == NULL);
    assert(state.active_opponent_energy == 16);
    assert(state.turn == 1);

    prepare_enemy(&state, WORLD_ACTOR_CAGE_WEAK, ROOM_CAGE_WEAK);
    state.dexterity = 3;
    state.flee_skill = 20;
    state.random_state = 28u;
    assert(game_select_opponent(&state, "POTWOR"));
    memset(&capture, 0, sizeof(capture));

    execute(&state, &capture, "ZWIEJ");
    assert(strstr(capture.text,
        "WSTYD !!! UCIEKLES Z POLA BITWY TRACISZ 20 KUNSZTU\n"
    ) != NULL);
    assert(!game_combat_is_active(&state));
    assert(state.mana == 83);
    assert(state.experience == -20);
    assert(state.turn == 1);
}

static void test_parry_practice(void)
{
    GameState state;
    Capture capture = {{0}, 0};

    game_initialize(&state);
    state.wisdom = 16;
    state.maximum_wisdom = 16;
    state.dexterity = 12;

    execute(&state, &capture, "CWICZ PAROWANIE");
    assert(strcmp(capture.text,
        "CWICZYSZ PAROWANIE - PRAWDOPODOBIENSTWO JEST TERAZ 14% MASZ 9 PRAKTYK\n"
    ) == 0);
    assert(state.parry_skill == 14);
    assert(state.practices == 9);
    assert(state.turn == 1);

    state.parry_skill = 90;
    memset(&capture, 0, sizeof(capture));
    execute(&state, &capture, "CWICZ PAROWANIE");
    assert(capture.length == 0);
    assert(state.practices == 9);
    assert(state.turn == 1);
}

static void test_automatic_parry_and_learning(void)
{
    GameState state;
    Capture capture = {{0}, 0};

    prepare_enemy(&state, WORLD_ACTOR_CAGE_STRONG, ROOM_CAGE_STRONG);
    state.dexterity = 3;
    state.strength = 1;
    state.parry_skill = 50;
    state.random_state = 7186u;

    execute(&state, &capture, "ZABIJ POTWOR");

    assert(strcmp(capture.text,
        "WALCZYSZ - <<<<TWOJ WROG MA 20%>>>><<<< A TY MASZ 50% ENERGII>>>>>\n"
        "PRZECIWNIK CIE TYLKO DRASNA I TRACISZ 5% ENERGII\n"
        "            <<<<<ODPAROWUJESZ ATAK PRZECIWNIKA !!! TRACISZ 3% ENERGI\n"
        "*************** UCZYSZ SIE ZDOLNOSCI PAROWANIE !!!!! ***************\n"
        "MASZ PECHA : LEKKO POPCHNALES GO I STRACIL TYLKO 0% ENERGII\n"
    ) == 0);
    assert(state.energy == 47);
    assert(state.parry_skill == 51);
    assert(state.experience == 5);
    assert(state.turn == 1);
    assert(game_state_is_valid(&state));
}

static void test_automatic_parry_damage_ranges(void)
{
    GameState state;
    Capture capture = {{0}, 0};

    prepare_enemy(&state, WORLD_ACTOR_CAGE_STRONG, ROOM_CAGE_STRONG);
    state.dexterity = 3;
    state.strength = 1;
    state.parry_skill = 100;
    state.random_state = 1973u;

    execute(&state, &capture, "ZABIJ POTWOR");
    assert(strcmp(capture.text,
        "WALCZYSZ - <<<<TWOJ WROG MA 20%>>>><<<< A TY MASZ 50% ENERGII>>>>>\n"
        "PRZECIWNIK CIE TYLKO DRASNA I TRACISZ 2% ENERGII\n"
        "            <<<<<ODPAROWUJESZ ATAK PRZECIWNIKA !!! TRACISZ 0% ENERGI\n"
        "MASZ PECHA : LEKKO POPCHNALES GO I STRACIL TYLKO 0% ENERGII\n"
    ) == 0);
    assert(state.energy == 50);
    assert(state.parry_skill == 100);
    assert(game_state_is_valid(&state));

    prepare_enemy(&state, WORLD_ACTOR_LIROY, ROOM_STAGE);
    memset(&capture, 0, sizeof(capture));
    state.dexterity = 20;
    state.maximum_dexterity = 20;
    state.strength = 1;
    state.parry_skill = 100;
    state.random_state = 3u;

    execute(&state, &capture, "ZABIJ LIROY");
    assert(strcmp(capture.text,
        "WALCZYSZ - <<<<TWOJ WROG MA 148%>>>><<<< A TY MASZ 50% ENERGII>>>>>\n"
        "DOSTALES I TRACISZ 16% ENERGII\n"
        "            <<<<<ODPAROWUJESZ ATAK PRZECIWNIKA !!! TRACISZ 13% ENERGI\n"
        "MASZ PECHA : LEKKO POPCHNALES GO I STRACIL TYLKO 0% ENERGII\n"
    ) == 0);
    assert(state.energy == 37);
    assert(game_state_is_valid(&state));
}

static void test_enemy_fireball_and_poison(void)
{
    GameState state;
    Capture capture = {{0}, 0};

    prepare_enemy(&state, WORLD_ACTOR_CAGE_STRONG, ROOM_CAGE_STRONG);
    state.dexterity = 3;
    state.strength = 1;
    assert(game_select_opponent(&state, "POTWOR"));
    state.active_opponent_fireballs = 20;
    state.active_opponent_poison_casts = 10;
    state.random_state = 158u;

    execute(&state, &capture, "ZABIJ POTWOR");

    assert(strcmp(capture.text,
        "WALCZYSZ - <<<<TWOJ WROG MA 20%>>>><<<< A TY MASZ 50% ENERGII>>>>>\n"
        "PRZECIWNIK CIE TYLKO DRASNA I TRACISZ 3% ENERGII\n"
        "PRZECIWNIK PUSZCZA FIREBALLA W TWYM KIERUNKU - TRACISZ 19% ENERGII\n"
        "PRZECIWNIK RZUCA CZAR \"POISON\" \n"
        "JESTES ZATRUTY - TRACISZ 0% ENERGI\n"
        "MASZ PECHA : LEKKO POPCHNALES GO I STRACIL TYLKO 0% ENERGII\n"
    ) == 0);
    assert(state.energy == 28);
    assert(state.active_opponent_fireballs == 19);
    assert(state.active_opponent_poison_casts == 9);
    assert(state.poison_turns == 9);
    assert(state.turn == 1);
    assert(game_state_is_valid(&state));
}

static void test_ongoing_poison_damage(void)
{
    GameState state;
    Capture capture = {{0}, 0};

    prepare_enemy(&state, WORLD_ACTOR_CAGE_STRONG, ROOM_CAGE_STRONG);
    state.dexterity = 3;
    state.strength = 1;
    assert(game_select_opponent(&state, "POTWOR"));
    state.poison_turns = 2;
    state.random_state = 2015u;

    execute(&state, &capture, "ZABIJ POTWOR");

    assert(strcmp(capture.text,
        "WALCZYSZ - <<<<TWOJ WROG MA 20%>>>><<<< A TY MASZ 50% ENERGII>>>>>\n"
        "PRZECIWNIK CIE TYLKO DRASNA I TRACISZ 2% ENERGII\n"
        "JESTES ZATRUTY - TRACISZ 4% ENERGI\n"
        "MASZ PECHA : LEKKO POPCHNALES GO I STRACIL TYLKO 0% ENERGII\n"
    ) == 0);
    assert(state.energy == 44);
    assert(state.poison_turns == 1);
    assert(state.turn == 1);
    assert(game_state_is_valid(&state));
}

static void test_attribute_training(void)
{
    GameState state;
    Capture capture = {{0}, 0};

    game_initialize(&state);
    state.room_id = ROOM_TRAINING;

    execute(&state, &capture, "TRENUJ");
    assert(strcmp(capture.text, "CO CHCESZ TRENOWAC?\n") == 0);
    assert(state.turn == 0);

    memset(&capture, 0, sizeof(capture));
    execute(&state, &capture, "TRENUJ SILA");
    assert(strcmp(capture.text,
        "TRENUJESZ SILE I MASZ 11 SILY I ZOSTALO CI 7 PRAKTYK\n"
    ) == 0);

    memset(&capture, 0, sizeof(capture));
    execute(&state, &capture, "TRENUJ ZRECZNOSC");
    assert(strcmp(capture.text,
        "TRENUJESZ ZRECZNOSC I MASZ 11 ZRECZNOSCI I ZOSTALO CI 5 PRAKTYK\n"
    ) == 0);

    memset(&capture, 0, sizeof(capture));
    execute(&state, &capture, "TRENUJ MADROSC");
    assert(strcmp(capture.text,
        "TRENUJESZ MADROSC I MASZ 11 MADROSCI I ZOSTALO CI 2 PRAKTYK\n"
    ) == 0);
    assert(state.turn == 3);
    assert(game_state_is_valid(&state));
}

static void test_cooking_practice_and_automatic_learning(void)
{
    GameState state;
    Capture capture = {{0}, 0};
    GameOutput output = {capture_write, &capture};

    game_initialize(&state);
    state.wisdom = 19;
    state.maximum_wisdom = 20;

    execute(&state, &capture, "CWICZ POTRAWKI");
    assert(strcmp(capture.text,
        "CWICZYSZ POTRAWKI - PRAWDOPODOBIENSTWO JEST TERAZ 20% MASZ 9 PRAKTYK\n"
    ) == 0);
    assert(state.cooking_skill == 20);
    assert(state.turn == 1);

    prepare_enemy(&state, WORLD_ACTOR_KORNIK, ROOM_ARENA_33);
    assert(game_select_opponent(&state, "KORNIK"));
    state.item_quantities[ITEM_BLOODY_HEART] = 1;
    state.active_opponent_energy = 0;
    state.cooking_skill = 99;
    state.random_state = 26u;
    memset(&capture, 0, sizeof(capture));

    assert(game_resolve_active_opponent_victory(&state, output));
    assert(strcmp(capture.text,
        "ZABILES GO ! ZYSKUJESZ ZA TO 9 KUNSZTU \n"
        "WYCIAGASZ 2 MONET Z CIALA\n"
        "ROBISZ SOBIE PYSZNY PYSZNY BIGOS Z KAPUSTA Z WROGA\n"
        "UCZYSZ SIE ZDOLNOSCI POTRAWKI !!! \n"
    ) == 0);
    assert(state.item_quantities[ITEM_BIGOS] == 1);
    assert(state.cooking_skill == 100);
    assert(state.experience == 19);
    assert(game_state_is_valid(&state));
}

static void test_return_training_and_spell_outcomes(void)
{
    GameState state;
    Capture capture = {{0}, 0};

    game_initialize(&state);
    state.wisdom = 18;
    state.maximum_wisdom = 30;
    state.practices = 2;
    execute(&state, &capture, "CWICZ POWROT");
    assert(strcmp(capture.text,
        "CWICZYSZ POWRACANIE - PRAWDOPODOBIENSTWO JEST TERAZ 33% MASZ 1 PRAKTYK\n"
    ) == 0);
    assert(state.return_skill == 33);
    assert(state.turn == 1);

    game_initialize(&state);
    state.room_id = ROOM_ARENA_33;
    state.return_skill = 30;
    state.mana = 50;
    state.random_state = 0u;
    memset(&capture, 0, sizeof(capture));
    execute(&state, &capture, "POWROT");
    assert(strcmp(capture.text,
        "OTWIERASZ MAGICZNY PORTAL KTORY PRZENOSI CIE DO MIASTA\n"
    ) == 0);
    assert(state.room_id == ROOM_CITY_THRESHOLD);
    assert(state.mana == 35);
    assert(state.turn == 1);

    game_initialize(&state);
    state.room_id = ROOM_ARENA_33;
    state.return_skill = 20;
    state.mana = 50;
    state.random_state = 1u;
    memset(&capture, 0, sizeof(capture));
    execute(&state, &capture, "POWROT");
    assert(strcmp(capture.text,
        "NIE UDAJE CI SIE OTWORZYC MAGICZNEGO PORTALU\n"
    ) == 0);
    assert(state.room_id == ROOM_ARENA_33);
    assert(state.mana == 45);

    game_initialize(&state);
    state.room_id = ROOM_ARENA_33;
    state.return_skill = 20;
    state.mana = 50;
    state.random_state = 3u;
    memset(&capture, 0, sizeof(capture));
    execute(&state, &capture, "POWROT");
    assert(strcmp(capture.text,
        "OTWIERASZ MAGICZNY PORTAL KTORY JEDNAK PRZENOSI CIE DO INNEGO MIEJSCA\n"
    ) == 0);
    assert(state.room_id == ROOM_BRUSZCZ_EAST);
    assert(state.mana == 40);
    assert(game_state_is_valid(&state));

    {
        const struct {
            unsigned random_state;
            int room_id;
        } cage_locations[] = {
            {438u, ROOM_CAGE_STRONG},
            {47u, ROOM_CAGE_DEXTEROUS},
            {4560u, ROOM_CAGE_RESISTANT}
        };
        size_t index;

        for (index = 0; index < sizeof(cage_locations) / sizeof(cage_locations[0]);
             ++index) {
            game_initialize(&state);
            state.room_id = ROOM_ARENA_33;
            state.return_skill = 1;
            state.random_state = cage_locations[index].random_state;
            memset(&capture, 0, sizeof(capture));
            execute(&state, &capture, "POWROT");
            assert(state.room_id == cage_locations[index].room_id);
        }
    }
}

static void test_ability_display_and_skill_poster(void)
{
    GameState state;
    Capture capture = {{0}, 0};

    game_initialize(&state);
    state.strength = 20;
    state.maximum_strength = 31;
    state.dexterity = 16;
    state.maximum_dexterity = 31;
    state.wisdom = 12;
    state.maximum_wisdom = 31;
    state.kick_skill = 11;
    state.flee_skill = 22;
    state.parry_skill = 33;
    state.comparison_skill = 44;
    state.cooking_skill = 55;
    state.return_skill = 66;
    execute(&state, &capture, "ZDOLNOSCI");
    assert(strcmp(capture.text,
        "KOPANIE       - 11%\n"
        "UCIEKANIE     - 22%\n"
        "PAROWANIE     - 33%\n"
        "POROWNYWANIE  - 44%\n"
        "POTRAWKI      - 55%\n"
        "POWROT        - 66%\n"
    ) == 0);
    assert(state.turn == 0);

    state.room_id = ROOM_UNDERGROUND;
    state.strength = 31;
    state.dexterity = 31;
    state.wisdom = 31;
    memset(&capture, 0, sizeof(capture));
    execute(&state, &capture, "PATRZ PLAKAT");
    assert(strcmp(capture.text,
        "NA PLAKACIE PISZE:\n"
        "CWICZ KOPAC , UCIEKAC , PAROWANIE , POROWNANIE , POTRAWKI LUB POWROT\n"
        "JAK MASZ PRAKTYKI I DOBRA GLOWE TO BEDZIESZ KOZAK\n"
        "KOPAC - KOMENDA:KOP \n"
        "UCIEKAC - KOMENDA : ZWIEJ \n"
        "PAROWANIE I POTRAWKI - SAMOCZYNNIE \n"
        "POROWNANIE-KOMEDA POROWNAJ\n"
        "POWROT-KOMEDA POWROT\n"
        "KOMENDA ZDOLNOSCI SPRAWDZI TWE ZDOLNOSCI\n"
    ) == 0);
}

static void test_logical_sleep_and_recovered_wake_rolls(void)
{
    GameState state;
    Capture capture = {{0}, 0};
    int hour;

    game_initialize(&state);
    state.energy = 20;
    state.experience = 100;
    state.random_state = 1u;
    execute(&state, &capture, "SPIJ");
    assert(strcmp(capture.text, "SPISZ JUZ 1 GODZIN\n") == 0);
    assert(state.sleep_hours == 1);
    assert(state.energy == 30);
    assert(state.experience == 80);
    assert(state.turn == 1);

    memset(&capture, 0, sizeof(capture));
    execute(&state, &capture, "");
    assert(strcmp(capture.text,
        "PO OBUDZENIU STWIERDZILES ZE ZYSKALES 10 ENERGI I STRACILES 20 KUNSZTU\n"
    ) == 0);
    assert(state.sleep_hours == 0);
    assert(state.experience == 81);
    assert(state.turn == 1);

    game_initialize(&state);
    state.energy = 0;
    state.maximum_energy = 200;
    state.experience = 0;
    state.random_state = 1u;
    for (hour = 0; hour < 9; ++hour) {
        memset(&capture, 0, sizeof(capture));
        execute(&state, &capture, "SPIJ");
    }
    memset(&capture, 0, sizeof(capture));
    execute(&state, &capture, "");
    assert(strcmp(capture.text,
        "PO OBUDZENIU STWIERDZILES ZE ZYSKALES 90 ENERGI I STRACILES 180 KUNSZTU\n"
        "DLUGI SEN DODATKOWO POZWOLIL CI ODPOCZAC : ZYSKALES 10ENERGI\n"
        "PELNOWARTOSCIOWY SEN SPOWODOWAL SUPER ZYSK : 20ENERGI\n"
    ) == 0);
    assert(state.energy == 120);
    assert(state.experience == -165);
    assert(state.sleep_hours == 0);
    assert(state.turn == 9);
}

static void test_dormant_poster_commands_are_silent(void)
{
    static const char *const commands[] = {
        "RECE", "UZDROW", "OSLEP", "SZAL", "SIATKA", "CIOS W PLECY",
        "ROZPAL", "SPEED", "PIECZ COS"
    };
    GameState state;
    Capture capture = {{0}, 0};
    size_t index;

    game_initialize(&state);
    for (index = 0; index < sizeof(commands) / sizeof(commands[0]); ++index) {
        memset(&capture, 0, sizeof(capture));
        execute(&state, &capture, commands[index]);
        assert(capture.length == 0);
        assert(state.turn == 0);
    }
}

static void test_victory_kunszt_deductions(void)
{
    GameState state;
    Capture capture = {{0}, 0};
    GameOutput output = {capture_write, &capture};

    prepare_enemy(&state, WORLD_ACTOR_CAGE_ALL, ROOM_CAGE_ALL);
    assert(game_select_opponent(&state, "POTWOR"));
    state.active_opponent_energy = 0;
    state.active_opponent_maximum_energy = 120;
    state.parry_skill = 100;
    state.kick_skill = 100;

    assert(game_resolve_active_opponent_victory(&state, output));
    assert(strncmp(capture.text,
        "ZABILES GO ! ZYSKUJESZ ZA TO 27 KUNSZTU \n",
        strlen("ZABILES GO ! ZYSKUJESZ ZA TO 27 KUNSZTU \n")
    ) == 0);
    assert(state.experience == 27);
    assert(game_state_is_valid(&state));
}

static void test_level_advancement(void)
{
    GameState state;
    Capture capture = {{0}, 0};
    const char *level_output;

    game_initialize(&state);
    state.experience = 700;
    execute(&state, &capture, "N");

    level_output = strstr(capture.text,
        "<<<<<<<<<=+=+=+!!!#####ZDOBYLES LEVEL#####!!!+=+=+=<<<<<<<<<<<<<\n"
    );
    assert(level_output != NULL);
    assert(strcmp(level_output,
        "<<<<<<<<<=+=+=+!!!#####ZDOBYLES LEVEL#####!!!+=+=+=<<<<<<<<<<<<<\n"
        "<<<<<<<<<=+=+=+!!!#####ZDOBYLES LEVEL#####!!!+=+=+=<<<<<<<<<<<<<\n"
        "<<<<<<<<<=+=+=+!!!#####ZDOBYLES LEVEL#####!!!+=+=+=<<<<<<<<<<<<<\n"
        "<<<<<<<<<=+=+=+!!!#####ZDOBYLES LEVEL#####!!!+=+=+=<<<<<<<<<<<<<\n"
        "<<<<<<<<<<<<ZYSKALES 13 PRAKTYK >>>>>>>>>>>>>>>\n"
        "<<<<<<<<<<<<ZYSKALES 60 MAXIMUM ENERGI >>>>>>>>>>>>>\n"
        "<<<<<<<<<<<<<<ZYSKALES 12MANY >>>>>>>>>>>>>>>>>\n"
    ) == 0);
    assert(state.level == 2);
    assert(state.experience == -25);
    assert(state.practices == 13);
    assert(state.maximum_energy == 60);
    assert(state.maximum_mana == 112);
    assert(game_state_is_valid(&state));
}

static void test_level_twelve_maximum_statistics(void)
{
    static const char marker[] =
        "\002\002\002\002\002\002\002"
        "\002\002\002\002\002\002\002";
    GameState state;
    Capture capture = {{0}, 0};
    char expected[512];

    game_initialize(&state);
    state.level = 11;
    state.experience = 757;
    execute(&state, &capture, "N");

    assert(state.level == 12);
    assert(state.experience == 0);
    assert(state.maximum_strength == 18);
    assert(state.maximum_dexterity == 18);
    assert(state.maximum_wisdom == 18);
    (void)snprintf(expected, sizeof(expected),
        "HURRRA TO JUZ DWUNASTY POZIOM , CZAS PODWYZSZYC MAXYMALNE PARAMETRY\n"
        "%s MASZ TERAZ 18 MAXYMALNIE SILY %s\n"
        "%s MASZ TERAZ 18 MAXYMALNIE ZRECZNOSCI %s\n"
        "%s MASZ TERAZ 18 MAXYMALNIE MADROSCI %s\n",
        marker, marker, marker, marker, marker, marker
    );
    assert(strstr(capture.text, expected) != NULL);
    assert(game_state_is_valid(&state));
}

int main(void)
{
    test_equal_dexterity_exchanges_both_hits();
    test_dodge_rolls_skip_both_attacks();
    test_small_shield_uses_recovered_defense_roll();
    test_victory_finishes_the_same_atomic_turn();
    test_death_stops_the_current_combat();
    test_simultaneous_victory_resolves_before_death();
    test_milestone_six_fixed_opponents();
    test_invalid_target_is_silent_and_non_consuming();
    test_kick_practice_and_threshold_prompt();
    test_successful_automatic_kick();
    test_failed_automatic_kick();
    test_flee_practice_and_threshold_prompt();
    test_successful_automatic_flee();
    test_failed_automatic_flee();
    test_flee_low_mana_blocked_silently();
    test_combat_loop_options_and_empty_round();
    test_combat_loop_kick_and_flee_choices();
    test_parry_practice();
    test_automatic_parry_and_learning();
    test_automatic_parry_damage_ranges();
    test_enemy_fireball_and_poison();
    test_ongoing_poison_damage();
    test_attribute_training();
    test_cooking_practice_and_automatic_learning();
    test_return_training_and_spell_outcomes();
    test_ability_display_and_skill_poster();
    test_logical_sleep_and_recovered_wake_rolls();
    test_dormant_poster_commands_are_silent();
    test_victory_kunszt_deductions();
    test_level_advancement();
    test_level_twelve_maximum_statistics();
    return 0;
}
