#include <assert.h>
#include <stddef.h>
#include <string.h>

#include "bombki/game.h"
#include "bombki/parser.h"
#include "items.h"
#include "world.h"

typedef struct {
    char text[8192];
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

static void execute(GameState *state, Capture *capture, const char *input)
{
    Command command = parser_parse(input);
    GameOutput output = {capture_write, capture};

    (void)game_execute(state, &command, output);
}

static void test_take_drop_and_equipment(void)
{
    GameState state;
    Capture capture = {{0}, 0};
    int base_energy;
    int base_wisdom;

    game_initialize(&state);
    state.world_object_rooms[WORLD_OBJECT_OLD_SWORD] = state.room_id;
    execute(&state, &capture, "BIERZ STARY");
    assert(strcmp(capture.text,
        "PODNOSISZ STARY ZARDZEWIALY MIECZ I MASZ JAROWE ZE GO POSIADASZ\n")
        == 0);
    assert(state.item_quantities[ITEM_OLD_SWORD] == 1);
    assert(state.world_object_rooms[WORLD_OBJECT_OLD_SWORD]
        == BOMBKI_ROOM_NOWHERE);
    assert(state.turn == 1);

    clear_capture(&capture);
    execute(&state, &capture, "UZYJ STARY");
    assert(strcmp(capture.text,
        "UZYWASZ STAREGO ZARDZEWIALEGO MIECZA JAKO BRONI\n") == 0);
    assert(state.equipped_weapon == ITEM_OLD_SWORD);
    assert(state.strength == 11);
    assert(state.turn == 2);

    clear_capture(&capture);
    execute(&state, &capture, "ODRZUC STARY");
    assert(strcmp(capture.text, "NAJPIERW ODLOZ TO CO MASZ W LAPIE\n") == 0);
    assert(state.turn == 2);

    state.item_quantities[ITEM_OLD_SWORD] = 3;
    clear_capture(&capture);
    execute(&state, &capture, "ODRZUC STARY");
    assert(strcmp(capture.text,
        "ODRZUCASZ JEDEN STARY ZARDZEWIALY MIECZ\n") == 0);
    assert(state.item_quantities[ITEM_OLD_SWORD] == 2);
    assert(state.world_object_rooms[WORLD_OBJECT_OLD_SWORD] == state.room_id);
    assert(state.equipped_weapon == ITEM_OLD_SWORD);
    assert(state.strength == 11);
    assert(state.turn == 3);

    state.world_object_rooms[WORLD_OBJECT_OLD_SWORD] = BOMBKI_ROOM_NOWHERE;
    clear_capture(&capture);
    execute(&state, &capture, "ODLOZ STARY");
    assert(strcmp(capture.text,
        "CHOWASZ STARY ZARDZEWIALY MIECZ I NIE UZYWASZ GO JAKO BRONI\n")
        == 0);
    assert(state.equipped_weapon == BOMBKI_NO_ITEM);
    assert(state.strength == 10);
    assert(state.turn == 4);

    state.item_quantities[ITEM_OLD_SWORD] = 1;
    clear_capture(&capture);
    execute(&state, &capture, "ODRZUC STARY");
    assert(strcmp(capture.text,
        "ODRZUCASZ STARY ZARDZEWIALY MIECZ I MASZ JAROWE ZE GO NIE POSIADASZ\n")
        == 0);
    assert(state.item_quantities[ITEM_OLD_SWORD] == 0);
    assert(state.world_object_rooms[WORLD_OBJECT_OLD_SWORD] == state.room_id);
    assert(state.turn == 5);

    base_energy = state.maximum_energy;
    state.world_object_rooms[WORLD_OBJECT_SCHOOL_DIPLOMA] = state.room_id;
    clear_capture(&capture);
    execute(&state, &capture, "BIERZ DYPLOM");
    assert(strcmp(capture.text,
        "PODNOSISZ DYPLOM MUD SZKOLY , I CZUJESZ PRZEPLYWAJACA PRZEZ CIEBIE MOC\n")
        == 0);
    assert(state.maximum_energy == base_energy + 5);
    clear_capture(&capture);
    execute(&state, &capture, "ODRZUC DYPLOM");
    assert(strcmp(capture.text,
        "ODRZUCASZ DYPLOM MUD SZKOLY , I PRZESTAJESZ CZUC PRZEPLYWAJACA PRZEZ CIEBIE MOC\n")
        == 0);
    assert(state.maximum_energy == base_energy);

    base_wisdom = state.wisdom;
    state.world_object_rooms[WORLD_OBJECT_PIPE] = state.room_id;
    clear_capture(&capture);
    execute(&state, &capture, "BIERZ FAJKA");
    assert(strcmp(capture.text, "PODNOSISZ FAJKE \n") == 0);
    assert(state.wisdom == base_wisdom + 1);
    clear_capture(&capture);
    execute(&state, &capture, "ODRZUC FAJKA");
    assert(strcmp(capture.text, "WYRZUCASZ FAJKE \n") == 0);
    assert(state.wisdom == base_wisdom);

    state.item_quantities[ITEM_BLOODY_HEART] = 1;
    clear_capture(&capture);
    execute(&state, &capture, "ODRZUC SERCE");
    assert(strcmp(capture.text,
        "ODRZUCASZ ZAKRWAWIONE SERCE \n"
        "JAK SMIESZ WYRZUCAC JEDZENIE!!! WSTYD MI ZA CIEBIE !!! NIE POZWOLE !!!\n")
        == 0);
    assert(state.item_quantities[ITEM_BLOODY_HEART] == 0);
    assert(state.world_object_rooms[WORLD_OBJECT_BLOODY_HEART] == state.room_id);

    clear_capture(&capture);
    execute(&state, &capture, "ODRZUC PACZEK");
    assert(strcmp(capture.text,
        "JAK SMIESZ WYRZUCAC JEDZENIE!!! WSTYD MI ZA CIEBIE !!! NIE POZWOLE !!!\n")
        == 0);
}

static void test_consumables(void)
{
    static const struct {
        ItemId item;
        const char *command;
        const char *message;
        int energy;
    } food[] = {
        {ITEM_BLOODY_HEART, "UZYJ SERCE",
         "ZJADASZ ZAKRWAWIONE SERCE I ODZYSKUJESZ 5% ENERGII\n", 6},
        {ITEM_DOUGHNUT, "UZYJ PACZEK",
         "ZJADASZ PACZKA I TYJESZ 1 KILO (DOSTAJESZ 8%ENERGII)\n", 9},
        {ITEM_CAKE, "UZYJ CIASTKO",
         "ZJADASZ CIASTKO I TYJESZ 2 KILO (DOSTAJESZ 12% ENERGII)\n", 13},
        {ITEM_DRY_RATION, "UZYJ SUCHA RACJA",
         "ZJADASZ SUCHA RACJE I CHUDNIESZ 3 KILO (DOSTAJESZ 16% ENERGII)\n", 17},
        {ITEM_ROLL, "UZYJ BULKA",
         "ZJADASZ BULKE I STWIERDZASZ ZE ZYSKALES 20%\n", 21},
        {ITEM_BREAD, "UZYJ CHLEB",
         "ZJADASZ DUZY CIEPLY CHLEB I JESTES PELEN (ZYSKUJESZ 26%)\n", 27},
        {ITEM_WEKA, "UZYJ WEKA",
         "ZJADASZ DLUGASNA WEKE I TYJAC 15 KILO ZYSKUJESZ 34%\n", 35},
        {ITEM_BIGOS, "UZYJ BIGOS",
         "ZJADASZ BIGOS Z WROGA I ODZYSKUJESZ 20% ENERGI\n", 21}
    };
    size_t index;

    for (index = 0; index < sizeof(food) / sizeof(food[0]); ++index) {
        GameState state;
        Capture capture = {{0}, 0};

        game_initialize(&state);
        state.energy = 1;
        state.item_quantities[food[index].item] = 1;
        execute(&state, &capture, food[index].command);
        assert(strcmp(capture.text, food[index].message) == 0);
        assert(state.item_quantities[food[index].item] == 0);
        assert(state.energy == food[index].energy);
        assert(state.turn == 1);
    }

    {
        GameState state;
        Capture capture = {{0}, 0};

        game_initialize(&state);
        state.energy = 1;
        state.mana = 0;
        state.item_quantities[ITEM_BEER] = 1;
        execute(&state, &capture, "UZYJ PIWO");
        assert(strcmp(capture.text,
            "GDY POCZULES AMBROZJE W USTACH ODZYSKALES 10 MANY ZAS GDY GO WYPILES 10% E.\n")
            == 0);
        assert(state.energy == 11);
        assert(state.mana == 10);
        assert(state.item_quantities[ITEM_BEER] == 0);

        clear_capture(&capture);
        state.mana = 0;
        state.item_quantities[ITEM_SMALL_MANA_BOTTLE] = 1;
        execute(&state, &capture, "UZYJ MALA BUTELKA MANY");
        assert(strcmp(capture.text,
            "WYPIJASZ MALA BUTELKE MANY I ODZYSKUJESZ 30 MANY\n") == 0);
        assert(state.mana == 30);
        assert(state.item_quantities[ITEM_SMALL_MANA_BOTTLE] == 0);
    }
}

static void test_information_clothing_and_pass(void)
{
    GameState state;
    Capture capture = {{0}, 0};

    game_initialize(&state);
    state.item_quantities[ITEM_PIPE] = 1;
    execute(&state, &capture, "UZYJ FAJKA");
    assert(strcmp(capture.text,
        "ZAPALASZ FAJECZKE I PYKASZ Z ZADOWOLENIEM\n") == 0);

    clear_capture(&capture);
    execute(&state, &capture, "UZYJ KASETA");
    assert(strcmp(capture.text,
        "TEN PRZEMIOT JEST TYPU : SMIEC . S.Z -8 MAXE +5 ZRE +1 \n") == 0);

    state.item_quantities[ITEM_LUCKY_LEAF] = 1;
    clear_capture(&capture);
    execute(&state, &capture, "UZYJ LISTEK");
    assert(strcmp(capture.text,
        "LISTEK JEST TYPU SMIEC MAX PRZEDMIOTOW + 3 \n") == 0);

    state.item_quantities[ITEM_SPIKED_SUIT] = 1;
    state.item_quantities[ITEM_CLOTHES] = 1;
    clear_capture(&capture);
    execute(&state, &capture, "UZYJ GARNITUR");
    assert(strcmp(capture.text,
        "NAKLADASZ GARNITUR Z KOLCAMI NA SWE (NIE)WYSPORTOWANE CIALO\n")
        == 0);
    assert(state.equipped_clothing == ITEM_SPIKED_SUIT);
    clear_capture(&capture);
    execute(&state, &capture, "UZYJ KOMPLET");
    assert(capture.text[0] == '\0');
    clear_capture(&capture);
    execute(&state, &capture, "ODLORZ GARNITUR");
    assert(strcmp(capture.text,
        "ZDEJMUJESZ GARNITUR Z KOLCAMI ZE SWEGO (NIE)WYSPORTOWANEGO CIALA\n")
        == 0);
    clear_capture(&capture);
    execute(&state, &capture, "UZYJ KOMPLET");
    assert(strcmp(capture.text,
        "NAKLADASZ KOMPLET UBRAN FIRMY \"SYF\"\n") == 0);
    assert(state.equipped_clothing == ITEM_CLOTHES);

    state.item_quantities[ITEM_QUEST_PASS] = 1;
    clear_capture(&capture);
    execute(&state, &capture, "PATRZ PRZEPUSTKA");
    assert(strcmp(capture.text,
        "|========================|\n"
        "| Niniejszym zaswiadczam |\n"
        "|  Iz osoba posiadajaca  |\n"
        "|      Ten dokument      |\n"
        "|   Ukonczyla pozytywnie |\n"
        "| Jeden z moich questów  |\n"
        "|========================|\n") == 0);
    clear_capture(&capture);
    execute(&state, &capture, "ZNISZCZ PRZEPUSTKA");
    assert(strcmp(capture.text, "GRRRRRRRRR .... GLUPIA PRZEPUSTKA\n") == 0);
    assert(state.item_quantities[ITEM_QUEST_PASS] == 0);
    assert(!state.quest_passage_open);
}

static void test_pill_and_return_scroll(void)
{
    GameState state;
    Capture capture = {{0}, 0};

    game_initialize(&state);
    state.wisdom = 9;
    state.item_quantities[ITEM_TRANSPORT_PILL] = 1;
    execute(&state, &capture, "UZYJ PIGULKA");
    assert(strcmp(capture.text,
        "WSZYSTKO ZACZYNA WIROWAC , POTEM NAGLY BLYSK I ZNAJDUJESZ SIE W PRZESZLOSCI\n"
        "BRAK OBYCIA W POSLUGIWANIU SIE MAGICZNYMI PRZEDMIOTAMI SPRAWIL ZE \n"
        "ZNACZNIE OPADLES Z SIL I STALES SIE BARDZO ZMECZONY\n") == 0);
    assert(state.maximum_energy == 49);
    assert(state.energy == 1);
    assert(state.experience == -50);

    game_initialize(&state);
    state.wisdom = 10;
    state.energy = 50;
    state.item_quantities[ITEM_TRANSPORT_PILL] = 1;
    clear_capture(&capture);
    execute(&state, &capture, "UZYJ PIGULKA");
    assert(strcmp(capture.text,
        "WSZYSTKO ZACZYNA WIROWAC , POTEM NAGLY BLYSK I ZNAJDUJESZ SIE W PRZESZLOSCI\n"
        "MASZ PEWNE OBYCIE W MAGICZNYCH PRZEDMIOTACH ALE MIMO WSZYSTKO\n"
        "OPADLES Z SIL I STALES SIE ZMECZONY\n") == 0);
    assert(state.energy == 10);
    assert(state.experience == -30);

    game_initialize(&state);
    state.wisdom = 16;
    state.maximum_wisdom = 16;
    state.item_quantities[ITEM_TRANSPORT_PILL] = 1;
    clear_capture(&capture);
    execute(&state, &capture, "UZYJ PIGULKA");
    assert(strcmp(capture.text,
        "WSZYSTKO ZACZYNA WIROWAC , POTEM NAGLY BLYSK I ZNAJDUJESZ SIE W PRZESZLOSCI\n"
        "ZNASZ SIE NA TEGO TYPU PRZEDMIOTACH , WYSZEDLES Z TEGO BEZ SZWANKU\n")
        == 0);
    assert(state.energy == 50);

    game_initialize(&state);
    state.item_quantities[ITEM_RETURN_SCROLL] = 1;
    clear_capture(&capture);
    execute(&state, &capture, "UZYJ SCROLL POWROT");
    assert(strncmp(capture.text,
        "OTWIERASZ MAGICZNY PORTAL KTORY PRZENOSI CIE DO MIASTA\n",
        strlen("OTWIERASZ MAGICZNY PORTAL KTORY PRZENOSI CIE DO MIASTA\n")) == 0);
    assert(state.room_id == ROOM_CITY_THRESHOLD);
    assert(state.energy == 35);
    assert(state.item_quantities[ITEM_RETURN_SCROLL] == 0);
    assert(state.turn == 1);

    game_initialize(&state);
    state.item_quantities[ITEM_COMPARISON_SCROLL] = 1;
    clear_capture(&capture);
    execute(&state, &capture, "UZYJ SCROLL POROWNYWANIE");
    assert(strcmp(capture.text,
        "KOGO CHCESZ ZE SOBA POROWNAC?\n") == 0);
    assert(state.item_quantities[ITEM_COMPARISON_SCROLL] == 1);
    assert(state.turn == 0);
}

int main(void)
{
    test_take_drop_and_equipment();
    test_consumables();
    test_information_clothing_and_pass();
    test_pill_and_return_scroll();
    return 0;
}
