#include <assert.h>
#include <stddef.h>
#include <string.h>

#include "bombki/game.h"
#include "bombki/parser.h"
#include "items.h"
#include "world.h"

typedef struct {
    char text[4096];
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

static GameAction execute(GameState *state, Capture *capture, const char *input)
{
    Command command = parser_parse(input);
    GameOutput output = {capture_write, capture};

    return game_execute(state, &command, output);
}

static void test_bakery(void)
{
    GameState state;
    Capture capture = {{0}, 0};

    game_initialize(&state);
    state.room_id = ROOM_BAKERY;
    execute(&state, &capture, "LISTA");
    assert(strcmp(capture.text,
        "NAZWA         CENA\n"
        "PACZEK     :   8  \n"
        "CIASTKO    :   12 \n"
        "SUCHA RACJA:   15 \n"
        "BULKA      :   19 \n"
        "CHLEB      :   24 \n"
        "WEKA       :   29 \n") == 0);
    assert(state.turn == 0);

    state.coins = 29;
    clear_capture(&capture);
    execute(&state, &capture, "KUP WEKA");
    assert(strcmp(capture.text, "KUPUJESZ WEKE ZA 29 MONET\n") == 0);
    assert(state.coins == 0);
    assert(state.item_quantities[ITEM_WEKA] == 1);
    assert(state.turn == 1);

    clear_capture(&capture);
    execute(&state, &capture, "KUP PACZEK");
    assert(capture.text[0] == '\0');
    assert(state.turn == 1);
}

static void test_armory(void)
{
    GameState state;
    Capture capture = {{0}, 0};

    game_initialize(&state);
    state.room_id = ROOM_ARMORY;
    state.coins = 70;
    execute(&state, &capture, "KUP STARY");
    assert(strcmp(capture.text,
        "KUPUJESZ ZWYKLY MALY !STARY! MIECZYK ZA 70 MONET\n") == 0);
    assert(state.item_quantities[ITEM_OLD_SWORD] == 1);
    assert(state.coins == 0);

    clear_capture(&capture);
    execute(&state, &capture, "LISTA");
    assert(strcmp(capture.text,
        "NAZWA         CENA\n"
        "!MALA! TARCZA           :   15  10%-50%\n"
        "DLUGI MIECZ GLADIATORA  : 3200  2%\n") == 0);

    clear_capture(&capture);
    execute(&state, &capture, "SPRZEDAJ STARY");
    assert(strcmp(capture.text,
        "SPRZEDAWCA MOWI CI : WYPCHAJ SIE Z TYM MIECZEM\n"
        "ALBO DOBRA KUPIE GO OD CIEBIE ZA 30 MONET\n") == 0);
    assert(state.item_quantities[ITEM_OLD_SWORD] == 0);
    assert(state.coins == 30);

    state.item_quantities[ITEM_SMALL_SHIELD] = 1;
    state.equipped_shield = ITEM_SMALL_SHIELD;
    clear_capture(&capture);
    execute(&state, &capture, "SPRZEDAJ MALA");
    assert(capture.text[0] == '\0');
    assert(state.item_quantities[ITEM_SMALL_SHIELD] == 1);
}

static void test_general_store(void)
{
    GameState state;
    Capture capture = {{0}, 0};

    game_initialize(&state);
    state.room_id = ROOM_GENERAL_STORE;
    state.coins = 2479;
    execute(&state, &capture, "KUP FAJKA");
    assert(strcmp(capture.text, "KUPUJESZ FAJKE ZA 480 MONET\n") == 0);
    assert(state.wisdom == 11);
    assert(state.item_quantities[ITEM_PIPE] == 1);

    clear_capture(&capture);
    execute(&state, &capture, "KUP KASETA");
    assert(strcmp(capture.text,
        "KUPUJESZ KASETE LIROYA - L JAK LIROY ZA 1999 MONET\n") == 0);
    assert(state.coins == 0);
    assert(state.maximum_energy == 55);
    assert(state.dexterity == 11);

    clear_capture(&capture);
    execute(&state, &capture, "SPRZEDAJ KASETA");
    assert(strcmp(capture.text,
        "SPRZEDAJESZ KASETE LIROYA - L JAK LIROY ZA 1000 MONET\n") == 0);
    assert(state.maximum_energy == 50);
    assert(state.dexterity == 10);
    assert(state.coins == 1000);

    clear_capture(&capture);
    execute(&state, &capture, "SPRZEDAJ FAJKA");
    assert(strcmp(capture.text, "SPRZEDAJESZ FAJKE ZA 120 MONET\n") == 0);
    assert(state.wisdom == 10);
    assert(state.coins == 1120);
}

static void test_magic_store(void)
{
    GameState state;
    Capture capture = {{0}, 0};

    game_initialize(&state);
    state.room_id = ROOM_MAGIC_STORE;
    execute(&state, &capture, "LISTA");
    assert(strcmp(capture.text,
        "NAZWA                  CENA\n"
        "MALA BUTELKA MANY       :   20\n"
        "SREDNIA BUTELKA MANY    :   40\n"
        "SPORA BUTELKA MANY      :   80\n"
        "LISTEK SZCZESCIA        :  820 3%\n"
        "PIERSCIONEK ZARECZYNOWY : 1800 N/A\n"
        "PIGULKA TRANSPORTUJACA  :  235 \n"
        "SCROLL POROWNYWANIE     :   40 \n") == 0);

    state.coins = 820;
    clear_capture(&capture);
    execute(&state, &capture, "KUP LISTEK");
    assert(strcmp(capture.text,
        "KUPUJESZ LISTEK KTORY PRZYNOSCI SZCZESCIE ZA 820 KESZU\n") == 0);
    assert(state.coins == -10);
    assert(state.maximum_mana == 140);
    assert(state.item_quantities[ITEM_LUCKY_LEAF] == 1);

    clear_capture(&capture);
    execute(&state, &capture, "SPRZEDAJ LISTEK");
    assert(strcmp(capture.text,
        "SPRZEDAJESZ LISTEK ZA 400 !!! CIESZ SIE\n") == 0);
    assert(state.coins == 390);
    assert(state.maximum_mana == 100);

    state.coins = 40;
    clear_capture(&capture);
    execute(&state, &capture, "KUP SCROLL POROWNYWANIE");
    assert(strcmp(capture.text,
        "SPRZEDAWCA SPRZEDAJE CI SCROLL ZA 40 MONET\n") == 0);
    clear_capture(&capture);
    execute(&state, &capture, "SPRZEDAJ SCROLL POROWNYWANIE");
    assert(strcmp(capture.text,
        "SPRZEDAWCA KUPUJE OD CIEBIE SCROLL ZA NEDZNE 18 MONET\n") == 0);
    assert(state.coins == 18);
}

static void test_wrong_room_is_silent(void)
{
    GameState state;
    Capture capture = {{0}, 0};

    game_initialize(&state);
    state.coins = 10000;
    execute(&state, &capture, "KUP PACZEK");
    execute(&state, &capture, "SPRZEDAJ STARY");
    execute(&state, &capture, "LISTA");
    assert(capture.text[0] == '\0');
    assert(state.turn == 0);
}

static void test_duncan_quest_and_black_market(void)
{
    static const int quest_states[] = {25, 231, 181, 131};
    GameState state;
    Capture capture = {{0}, 0};
    GameOutput output = {capture_write, &capture};
    int experience_before;
    size_t index;

    game_initialize(&state);
    state.room_id = ROOM_BRUSZCZ_EAST;
    state.world_actor_rooms[WORLD_ACTOR_DUNCAN] = state.room_id;

    execute(&state, &capture, "SECRET LISTA");
    execute(&state, &capture, "KUP DOKUMENT");
    assert(capture.text[0] == '\0');

    execute(&state, &capture, "ROZMAWIAJ DUNCAN");
    assert(strcmp(capture.text,
        "UCH A COZ TO ZA STRASZNA ROSLINA - PRZELAKL SIE DUNCAN WIDZAC CIEBIE\n"
        "AAA TO JAKIS WAL A NIE ROSLINA , MOWI PO CHWILI,JAK CI SIE NUDZI TO \n"
        "MOZESZ POMOC MI WYRYWAC CHWASTY , SZCZEGOLNIA ZABOJCZA DLA MOICH MARCHEWECZEK\n"
        "JEST TA WREDNA POKRZYWA , SZKODA ZE TAK JAK INNE POTWORY SIE ODREGENEROWUJE\n"
        "ALE JAK JA ZABIJESZ , POWIEDZMY ... 4 RAZY TO MOZE DA SOBIE SPOKOJ\n"
        "CO CI DAM W ZAMIAN ? TROCHE KUNSZTU , A MOJ STARY PRACUJE NA CZARNYM RYNKU\n"
        "TO CO ZABIJESZ TE ROSLINY CZY BEDZIEMY TU STAC JAK OSTATNIE LOSIE?\n") == 0);
    assert(state.duncan_quest == 75);

    clear_capture(&capture);
    clear_capture(&capture);
    execute(&state, &capture, "JA");
    assert(strstr(capture.text,
        "NIE ZAPOMNIALES O POKRZYWIE W SADACH DUNCANA???\n"
    ) != NULL);
    clear_capture(&capture);
    state.room_id = ROOM_CAVE_ENTRANCE;
    clear_capture(&capture);
    assert(execute(&state, &capture, "POLUDNIE") == GAME_ACTION_CAVE_RESPONSE);
    assert(capture.length >= strlen("TAK lub NIE >"));
    assert(strcmp(capture.text + capture.length - strlen("TAK lub NIE >"),
        "TAK lub NIE >") == 0);

    clear_capture(&capture);
    game_resolve_cave_response(&state, "TAK", output);
    assert(strcmp(capture.text, "NO TO GIN!!!\n") == 0);
    assert(state.active_opponent_actor == WORLD_ACTOR_POKRZYWA);
    assert(state.active_opponent_energy == 200);
    assert(state.active_opponent_strength == 18);
    assert(state.active_opponent_dexterity == 15);
    assert(state.active_opponent_fireballs == 5);
    assert(state.active_opponent_poison_casts == 1);

    for (index = 0; index < sizeof(quest_states) / sizeof(quest_states[0]); ++index) {
        clear_capture(&capture);
        state.active_opponent_energy = 0;
        assert(game_resolve_active_opponent_victory(&state, output));
        assert(state.duncan_quest == quest_states[index]);
        assert(strstr(capture.text,
            "UFFF,TO BYLA PRZYGODA,WOKOL GROMADZILY SIE SETKI MLECZOW - NIE MIALBYS SZANS\n"
        ) != NULL);
        assert(state.room_id == ROOM_CAVE_ENTRANCE);
        if (index + 1 < sizeof(quest_states) / sizeof(quest_states[0])) {
            clear_capture(&capture);
            assert(execute(&state, &capture, "POLUDNIE")
                == GAME_ACTION_CAVE_RESPONSE);
            clear_capture(&capture);
            game_resolve_cave_response(&state, "NIE", output);
        }
    }

    state.world_actor_rooms[WORLD_ACTOR_DUNCAN] = state.room_id;
    state.level = 12;
    experience_before = state.experience;
    clear_capture(&capture);
    execute(&state, &capture, "ROZMAWIAJ DUNCAN");
    assert(strcmp(capture.text,
        "TO CO ZABIJESZ TE ROSLINY CZY BEDZIEMY TU STAC JAK OSTATNIE LOSIE?\n"
        "DZIEKI DZIEKI , TO BYLA DOBRA ROBOTA , OD TERAZ MOZESZ PISAC PRZY MNIE :\n"
        "SECRET LISTA , TO MOZE AKURAT BEDE COS MIAL NA ZBYCIU , ADIOS\n"
        "--------- ZDOBYLES 125 KUNSZTU ------------------------\n") == 0);
    assert(state.duncan_quest == 0);
    assert(state.duncan_black_market_unlocked);
    assert(state.experience == experience_before + 125);

    clear_capture(&capture);
    execute(&state, &capture, "SECRET LISTA");
    assert(strcmp(capture.text,
        "OTO CO AKTUALNIE MAM DO ZAOFEROWANIA : PAMIETAJ U MNIE TYLKO KUPUJEMY\n"
        "MARCHEWKA Z SADU DUNCANA   : 7000\n"
        "PRZEPUSTKA QUEST-MASTERA   :  400\n"
        "PLECAK                     : 4800\n") == 0);

    state.coins = 5200;
    state.world_actor_rooms[WORLD_ACTOR_DUNCAN] = BOMBKI_ROOM_NOWHERE;
    clear_capture(&capture);
    execute(&state, &capture, "KUP DOKUMENT");
    assert(strcmp(capture.text,
        "OTO PODROBIONA PRZEPUSTKA HE , HE NAWET QUEST-MASTER SIE NIE POKAPUJE\n"
    ) == 0);
    assert(state.item_quantities[ITEM_QUEST_PASS] == 1);
    assert(state.quest_passage_open);

    state.world_actor_rooms[WORLD_ACTOR_DUNCAN] = state.room_id;
    clear_capture(&capture);
    execute(&state, &capture, "KUP PLECAK");
    assert(strcmp(capture.text, "HE HE HE MILO SIE Z TOBA ROBI INTERESY\n") == 0);
    assert(state.coins == 0);
    assert(state.item_quantities[ITEM_BACKPACK] == 1);
}

static void test_old_elf_fetch_quest(void)
{
    GameState state;
    Capture capture = {{0}, 0};

    game_initialize(&state);
    state.room_id = ROOM_ELF_HOUSE;

    execute(&state, &capture, "ROZMAWIAJ STARUCH");
    assert(strcmp(capture.text,
        "STARUCH MOWI CI : HEJ KTO TY JESTES CZY ZE MAGICZNE DRZWI NIE POWSTRZYMALY CIE?\n"
        "MUSISZ BYC NIEZLYM WOJOWNIKIEM ,SPOXOLANDIA, GLODNY JESTEM PRZYNIES MI 4 WEKI \n"
        "ORAZ OKOLO 200 KASY , A DAM CI TAKIE NUMERY O JAKICH CI SIE NIE SNILO....\n"
    ) == 0);

    clear_capture(&capture);
    execute(&state, &capture, "ROZMAWIAJ NIEMA");
    assert(strcmp(capture.text, "NIE MA TU NIKOGO TAKIEGO!\n") == 0);

    state.item_quantities[ITEM_WEKA] = 3;
    state.coins = 199;
    clear_capture(&capture);
    execute(&state, &capture, "ROZMAWIAJ STARUCH");
    assert(capture.text[0] == '\0');

    state.item_quantities[ITEM_WEKA] = 4;
    state.coins = 200;
    clear_capture(&capture);
    execute(&state, &capture, "ROZMAWIAJ STARUCH");
    assert(strcmp(capture.text,
        "STARUCH MOWI CI : OOO JAKA PIEKNA WEKA ... MNIAM I DRUGA TRZECIA I CZWARTA\n"
        "TO BYLO DOBRE ZARCIE !!! , DAWAJ KASE , PIENIADZE !!! , CO SIE TAK GAPISZ?\n"
        "WYNOCHA STAD !!! MRAMMMARAMMARAMAAMMARAM BUM !! -T-E-L-E-P-O-R-T-Y\n"
        "WYGLADA ZE ZROBIL CIE W BUCA , A MOZE JEDNAK NIE , CO TO ? , SCROLL POWROTU\n"
        "I PIWSKO NA OSLODZENIE ZYCIA , NO TRUDNO PRZYNAJMNIEJ CZEGOS SIE NAUCZYLES\n"
        "AAAA SPADAJ STAD BO CI KOSCI POLAMIE\n"
    ) == 0);
    assert(state.item_quantities[ITEM_WEKA] == 0);
    assert(state.item_quantities[ITEM_BEER] == 1);
    assert(state.item_quantities[ITEM_RETURN_SCROLL] == 1);
    assert(state.coins == 0);
    assert(state.experience == 50);
    assert(state.room_id == ROOM_CAGE_ALL);

    state.room_id = ROOM_ELF_HOUSE;
    state.old_elf_present = false;
    clear_capture(&capture);
    execute(&state, &capture, "ROZMAWIAJ STARUCH");
    assert(strcmp(capture.text, "AAAA SPADAJ STAD BO CI KOSCI POLAMIE\n") == 0);
    assert(state.room_id == ROOM_CAGE_ALL);
}

static void test_talk_fallbacks(void)
{
    GameState state;
    Capture capture = {{0}, 0};

    game_initialize(&state);
    state.room_id = ROOM_ARENA_33;
    state.world_actor_rooms[WORLD_ACTOR_KORNIK] = state.room_id;

    execute(&state, &capture, "ROZMAWIAJ KORNIK");
    assert(strcmp(capture.text, "NIE MA CI NIC DO POWIEDZENIA!\n") == 0);
    assert(state.turn == 0);

    clear_capture(&capture);
    execute(&state, &capture, "ROZMAWIAJ DUNCAN");
    assert(strcmp(capture.text, "NIE MA TU NIKOGO TAKIEGO!\n") == 0);
    assert(state.turn == 0);
}

static void test_quest_master_paths(void)
{
    GameState state;
    Capture capture = {{0}, 0};
    GameOutput output = {capture_write, &capture};

    game_initialize(&state);
    state.room_id = ROOM_JUNCTION;
    state.coins = 350;

    execute(&state, &capture, "LISTA");
    assert(strcmp(capture.text,
        "LATWY QUEST      - 200\n"
        "PRZECIETNY QUEST - 100\n"
        "TRUDNY QUEST     - 50\n"
        "KOMEDA - SPRZEDAJ QUEST - OZNACZA IZ QUEST ZOSTAL WYKONANY\n"
    ) == 0);

    clear_capture(&capture);
    execute(&state, &capture, "KUP LATWY QUEST");
    assert(strcmp(capture.text, "ZABIJ 75 POTWOROW\n") == 0);
    assert(state.quest_type == 1);
    assert(state.quest_progress == 75);
    assert(state.coins == 150);
    state.world_actor_rooms[WORLD_ACTOR_KORNIK] = ROOM_JUNCTION;
    assert(game_select_opponent(&state, "KORNIK"));
    state.active_opponent_energy = 0;
    clear_capture(&capture);
    assert(game_resolve_active_opponent_victory(&state, output));
    assert(state.quest_progress == 74);
    state.experience = 0;

    clear_capture(&capture);
    execute(&state, &capture, "KUP LATWY QUEST");
    assert(capture.text[0] == '\0');
    assert(state.quest_progress == 74);

    clear_capture(&capture);
    clear_capture(&capture);
    execute(&state, &capture, "JA");
    assert(strstr(capture.text,
        "TWOJ AKTUALNY QUEST - ZABIC MUSISZ JESZCZE 74 POTWOROW\n"
    ) != NULL);
    clear_capture(&capture);
    state.quest_progress = 0;
    clear_capture(&capture);
    execute(&state, &capture, "SPRZEDAJ QUEST");
    assert(strcmp(capture.text,
        "AAAAA BARDZO MI MILO ZE UDALO CI SIE WYKONAC TEN QUEST\n"
        " ------ OTRZYMUJESZ 100 KUNSZTU -----\n"
    ) == 0);
    assert(state.experience == 100);
    assert(state.item_quantities[ITEM_QUEST_PASS] == 1);
    assert(state.quest_passage_open);

    state.coins = 100;
    clear_capture(&capture);
    execute(&state, &capture, "KUP PRZECIETNY QUEST");
    assert(strcmp(capture.text,
        "ZABIJ 50 POTWOROW W TYM LIROYA I DAJ MI DYPLOM MUD SZKOLY\n"
    ) == 0);
    clear_capture(&capture);
    clear_capture(&capture);
    execute(&state, &capture, "JA");
    assert(strstr(capture.text,
        "TWOJ AKTUALNY QUEST - ZABIC MUSISZ JESZCZE 50 POTWOROW\n"
    ) != NULL);
    clear_capture(&capture);
    state.world_actor_rooms[WORLD_ACTOR_LIROY] = ROOM_JUNCTION;
    assert(game_select_opponent(&state, "LIROY"));
    state.active_opponent_energy = 0;
    clear_capture(&capture);
    assert(game_resolve_active_opponent_victory(&state, output));
    assert(state.quest_progress == 49);

    state.quest_progress = 0;
    clear_capture(&capture);
    execute(&state, &capture, "SPRZEDAJ QUEST");
    assert(capture.text[0] == '\0');
    assert(state.quest_type == 2);
    state.item_quantities[ITEM_SCHOOL_DIPLOMA] = 1;
    clear_capture(&capture);
    execute(&state, &capture, "SPRZEDAJ QUEST");
    assert(strcmp(capture.text,
        "AAAAA BARDZO MI MILO ZE UDALO CI SIE WYKONAC TEN QUEST\n"
        " ------ OTRZYMUJESZ 250 KUNSZTU -----\n"
    ) == 0);
    assert(state.item_quantities[ITEM_SCHOOL_DIPLOMA] == 0);
    assert(state.maximum_energy == 45);

    state.coins = 50;
    clear_capture(&capture);
    execute(&state, &capture, "KUP TRUDNY QUEST");
    assert(strcmp(capture.text,
        "ZABIJ 50 POTWOROW W TYM LIROYA I DAJ MI FAJKE I POSWIEC 1 PRAKTYKE\n"
    ) == 0);
    state.quest_progress = 0;
    state.item_quantities[ITEM_PIPE] = 1;
    state.wisdom = 11;
    state.practices = 0;
    clear_capture(&capture);
    execute(&state, &capture, "SPRZEDAJ QUEST");
    assert(capture.text[0] == '\0');
    assert(state.quest_type == 3);
    state.practices = 2;
    state.experience = -1000;
    clear_capture(&capture);
    execute(&state, &capture, "SPRZEDAJ QUEST");
    assert(strcmp(capture.text,
        "AAAAA BARDZO MI MILO ZE UDALO CI SIE WYKONAC TEN QUEST\n"
        " ------ OTRZYMUJESZ 425 KUNSZTU -----\n"
    ) == 0);
    assert(state.item_quantities[ITEM_PIPE] == 0);
    assert(state.wisdom == 10);
    assert(state.practices == 1);
    assert(state.quest_type == 0);
    assert(state.item_quantities[ITEM_QUEST_PASS] == 3);

    clear_capture(&capture);
    execute(&state, &capture, "ZACHOD");
    assert(state.room_id == ROOM_ROAD);
    assert(game_state_is_valid(&state));
}

int main(void)
{
    test_bakery();
    test_armory();
    test_general_store();
    test_magic_store();
    test_wrong_room_is_silent();
    test_duncan_quest_and_black_market();
    test_old_elf_fetch_quest();
    test_talk_fallbacks();
    test_quest_master_paths();
    return 0;
}
