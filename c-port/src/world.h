#ifndef BOMBKI_WORLD_H
#define BOMBKI_WORLD_H

#include <stdbool.h>
#include <stddef.h>

#include "bombki/parser.h"

#define BOMBKI_MAX_EXITS 6

/*
 * These are append-only native-save IDs, not the original Pascal GDZIE values.
 * The recovered GDZIE mapping and route rules are documented in
 * docs/compatibility.md and asserted in tests/test_world.c.
 */
enum {
    ROOM_START = 0,
    ROOM_CENTRAL,
    ROOM_SCHOOL,
    ROOM_TRAINING,
    ROOM_CITY_THRESHOLD,
    ROOM_SHOP_STREET,
    ROOM_BAKERY,
    ROOM_ARMORY,
    ROOM_DARK_STREET,
    ROOM_BRUSZCZ,
    ROOM_BAR,
    ROOM_LONG_STREET,
    ROOM_ROAD,
    ROOM_JUNCTION,
    ROOM_STONY_ROAD,
    ROOM_FOREST,
    ROOM_ENTERTAINMENT_VALLEY,
    ROOM_ARENA_ENTRANCE,
    ROOM_UNDERGROUND,
    ROOM_SCHOOL_TWO,
    ROOM_SCHOOL_WEST_ROOM,
    ROOM_SCHOOL_NORTH_ROOM,
    ROOM_SCHOOL_SOUTH_ROOM,
    ROOM_SCHOOL_UP_ROOM,
    ROOM_SCHOOL_DOWN_ROOM,
    ROOM_CAGE_HALL,
    ROOM_CAGE_WEAK,
    ROOM_CAGE_DEXTEROUS,
    ROOM_CAGE_RESISTANT,
    ROOM_CAGE_STRONG,
    ROOM_CAGE_ALL,
    ROOM_TELEPORT,
    ROOM_SHOP_STREET_NORTH,
    ROOM_GENERAL_STORE,
    ROOM_MAGIC_STORE,
    ROOM_LONG_STREET_WEST,
    ROOM_CONCERT_HALL,
    ROOM_CROWD_SOUTH,
    ROOM_CROWD_NORTH,
    ROOM_CROWD_CENTRE,
    ROOM_CROWD_SOUTHEAST,
    ROOM_CROWD_NORTHEAST,
    ROOM_BEER_HALL,
    ROOM_STAGE_ENTRANCE,
    ROOM_STAGE_BACK,
    ROOM_STAGE,
    ROOM_STAGE_CENTRE,
    ROOM_STAGE_END,
    ROOM_BRUSZCZ_EAST,
    ROOM_BRUSZCZ_WEST,
    ROOM_BRUSZCZ_SOUTH,
    ROOM_BRUSZCZ_SOUTH_WEST,
    ROOM_BRUSZCZ_SOUTH_EAST,
    ROOM_FOREST_WEST,
    ROOM_LIVING_DOOR,
    ROOM_ELF_HOUSE,
    ROOM_CAVE_ENTRANCE,
    ROOM_CAVE,
    ROOM_ROAD_END,
    ROOM_ARENA_33,
    ROOM_ARENA_34,
    ROOM_ARENA_35,
    ROOM_ARENA_36,
    ROOM_ARENA_37,
    ROOM_ARENA_38,
    ROOM_ARENA_39,
    ROOM_ARENA_40,
    ROOM_ARENA_41,
    ROOM_ARENA_42,
    ROOM_ARENA_43,
    ROOM_ARENA_44,
    ROOM_ARENA_45,
    ROOM_ARENA_46,
    ROOM_ARENA_47,
    ROOM_ARENA_48,
    ROOM_ARENA_49,
    ROOM_ARENA_50,
    ROOM_ARENA_51,
    ROOM_ARENA_52,
    ROOM_ARENA_53,
    ROOM_ARENA_54,
    ROOM_ARENA_55,
    ROOM_ARENA_56,
    ROOM_ARENA_57,
    ROOM_TELEPORT_EFFECT
};

typedef struct {
    Direction direction;
    int destination;
} RoomExit;

typedef struct {
    int id;
    const char *name;
    const char *description;
    const char *exits_text;
    const char *look_target;
    const char *look_text;
    RoomExit exits[BOMBKI_MAX_EXITS];
    size_t exit_count;
    const char *look_target_2;
    const char *look_text_2;
    bool redirects_on_arrival;
    int arrival_destination;
} Room;

typedef enum {
    WORLD_ACTOR_KORNIK = 0,
    WORLD_ACTOR_MUCHA,
    WORLD_ACTOR_BAKTERIA,
    WORLD_ACTOR_SLIMAK,
    WORLD_ACTOR_ZUK,
    WORLD_ACTOR_KARALUCH,
    WORLD_ACTOR_MROWKA,
    WORLD_ACTOR_PAJAK,
    WORLD_ACTOR_DZIK,
    WORLD_ACTOR_SZCZUR,
    WORLD_ACTOR_LIS,
    WORLD_ACTOR_KUROPATWA,
    WORLD_ACTOR_ZAJAC,
    WORLD_ACTOR_WILCZUR,
    WORLD_ACTOR_ORZEL,
    WORLD_ACTOR_SARNA,
    WORLD_ACTOR_SLON,
    WORLD_ACTOR_LEW,
    WORLD_ACTOR_ZYRAFA,
    WORLD_ACTOR_WIELBLAD,
    WORLD_ACTOR_STRUS,
    WORLD_ACTOR_BOA,
    WORLD_ACTOR_WILK,
    WORLD_ACTOR_BIZON,
    WORLD_ACTOR_PANTERA,
    WORLD_ACTOR_GLADIATOR,
    WORLD_ACTOR_WOJOWNIK,
    WORLD_ACTOR_TRENER,
    WORLD_ACTOR_JAMNIK,
    WORLD_ACTOR_OWCZAREK,
    WORLD_ACTOR_SPANIEL,
    WORLD_ACTOR_PUDEL,
    WORLD_ACTOR_PIESEK,
    WORLD_ACTOR_TAKSOWKARZ,
    WORLD_ACTOR_SPRZEDAWCA_PRECELKOW,
    WORLD_ACTOR_ZAMIATACZ,
    WORLD_ACTOR_PIJAK,
    WORLD_ACTOR_ZEBRAK,
    WORLD_ACTOR_GITARZYSTA,
    WORLD_ACTOR_PERKUSISTA,
    WORLD_ACTOR_ORGANISTA,
    WORLD_ACTOR_LIROY,
    WORLD_ACTOR_DZIECKO,
    WORLD_ACTOR_WARIAT,
    WORLD_ACTOR_SLUCHACZ,
    WORLD_ACTOR_FAN,
    WORLD_ACTOR_CZLOWIEK,
    WORLD_ACTOR_POLICJANT,
    WORLD_ACTOR_OCHRONIARZ,
    WORLD_ACTOR_GORYL,
    WORLD_ACTOR_DZIADEK,
    WORLD_ACTOR_REPORTER,
    WORLD_ACTOR_SZCZAW,
    WORLD_ACTOR_STOKROTKA,
    WORLD_ACTOR_KONICZYNKA,
    WORLD_ACTOR_MLECZ,
    WORLD_ACTOR_DMUCHAWIEC,
    WORLD_ACTOR_ROZA,
    WORLD_ACTOR_JEZYNA,
    WORLD_ACTOR_OSET,
    WORLD_ACTOR_AGREST,
    WORLD_ACTOR_MALINA,
    WORLD_ACTOR_TRAWA,
    WORLD_ACTOR_DUNCAN,
    WORLD_ACTOR_CAGE_WEAK,
    WORLD_ACTOR_CAGE_DEXTEROUS,
    WORLD_ACTOR_CAGE_RESISTANT,
    WORLD_ACTOR_CAGE_STRONG,
    WORLD_ACTOR_CAGE_ALL,
    WORLD_ACTOR_POKRZYWA,
    WORLD_ACTOR_STARUCH,
    WORLD_ACTOR_QUEST_MASTER,
    WORLD_ACTOR_LIVING_DOOR,
    WORLD_ACTOR_COUNT
} WorldActorId;

typedef struct {
    WorldActorId id;
    const char *name;
    const char *description;
} WorldActor;

typedef enum {
    WORLD_OBJECT_OLD_SWORD = 0,
    WORLD_OBJECT_SMALL_SHIELD,
    WORLD_OBJECT_BLOODY_HEART,
    WORLD_OBJECT_SCHOOL_DIPLOMA,
    WORLD_OBJECT_PIPE,
    WORLD_OBJECT_COUNT
} WorldObjectId;

typedef struct {
    WorldObjectId id;
    const char *name;
    const char *description;
} WorldObject;

const Room *world_find_room(int id);
const RoomExit *world_find_exit(const Room *room, Direction direction);
size_t world_room_count(void);
const Room *world_room_at(size_t index);
size_t world_actor_count(void);
const WorldActor *world_actor_at(size_t index);
size_t world_object_count(void);
const WorldObject *world_object_at(size_t index);

#endif
