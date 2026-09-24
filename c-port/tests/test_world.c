#include <assert.h>
#include <stddef.h>
#include <string.h>

#include "world.h"

static void assert_route(int source, Direction direction, int destination)
{
    const RoomExit *exit = world_find_exit(world_find_room(source), direction);

    assert(exit != NULL);
    assert(exit->destination == destination);
}

static void assert_no_route(int source, Direction direction)
{
    assert(world_find_exit(world_find_room(source), direction) == NULL);
}

static void assert_optional_route(int source, Direction direction, int destination)
{
    if (destination < 0) {
        assert_no_route(source, direction);
    } else {
        assert_route(source, direction, destination);
    }
}

int main(void)
{
    bool reachable[ROOM_TELEPORT_EFFECT + 1] = {false};
    size_t room_index;

    for (room_index = 0; room_index < world_room_count(); ++room_index) {
        const Room *room = world_room_at(room_index);
        size_t other_index;
        size_t exit_index;

        assert(room != NULL);
        assert(room->name != NULL);
        assert(room->description != NULL);
        assert(room->exits_text != NULL);
        assert(strstr(room->description, "[PORT:") == NULL);
        assert(strstr(room->exits_text, "[PORT:") == NULL);
        if (room->look_text != NULL) {
            assert(strstr(room->look_text, "[PORT:") == NULL);
        }
        if (room->look_text_2 != NULL) {
            assert(strstr(room->look_text_2, "[PORT:") == NULL);
        }
        assert(room->exit_count <= BOMBKI_MAX_EXITS);
        if (room->redirects_on_arrival) {
            assert(world_find_room(room->arrival_destination) != NULL);
        }
        for (other_index = room_index + 1; other_index < world_room_count(); ++other_index) {
            assert(room->id != world_room_at(other_index)->id);
        }
        for (exit_index = 0; exit_index < room->exit_count; ++exit_index) {
            size_t other_exit;

            assert(world_find_room(room->exits[exit_index].destination) != NULL);
            for (other_exit = exit_index + 1; other_exit < room->exit_count; ++other_exit) {
                assert(room->exits[exit_index].direction != room->exits[other_exit].direction);
            }
        }
    }
    assert(world_room_at(world_room_count()) == NULL);

    assert(world_actor_count() == WORLD_ACTOR_COUNT);
    for (room_index = 0; room_index < world_actor_count(); ++room_index) {
        const WorldActor *actor = world_actor_at(room_index);

        assert(actor != NULL);
        assert(actor->id == (WorldActorId)room_index);
        assert(actor->name != NULL && actor->name[0] != '\0');
        assert(actor->description != NULL && actor->description[0] != '\0');
        assert(strstr(actor->description, "[PORT:") == NULL);
    }
    assert(world_actor_at(world_actor_count()) == NULL);

    assert(world_object_count() == WORLD_OBJECT_COUNT);
    for (room_index = 0; room_index < world_object_count(); ++room_index) {
        const WorldObject *object = world_object_at(room_index);

        assert(object != NULL);
        assert(object->id == (WorldObjectId)room_index);
        assert(object->name != NULL && object->name[0] != '\0');
        assert(object->description != NULL && object->description[0] != '\0');
        assert(strstr(object->description, "[PORT:") == NULL);
    }
    assert(world_object_at(world_object_count()) == NULL);

    reachable[ROOM_START] = true;
    for (;;) {
        bool changed = false;

        for (room_index = 0; room_index < world_room_count(); ++room_index) {
            const Room *room = world_room_at(room_index);
            size_t exit_index;

            if (!reachable[room->id]) {
                continue;
            }
            for (exit_index = 0; exit_index < room->exit_count; ++exit_index) {
                int destination = room->exits[exit_index].destination;

                if (!reachable[destination]) {
                    reachable[destination] = true;
                    changed = true;
                }
            }
        }
        if (!changed) {
            break;
        }
    }
    for (room_index = 0; room_index < world_room_count(); ++room_index) {
        int id = world_room_at(room_index)->id;

        if (id != ROOM_ROAD && id != ROOM_STONY_ROAD && id != ROOM_ROAD_END
            && id != ROOM_ELF_HOUSE) {
            assert(reachable[id]);
        }
    }

    /* SWIAT.PAS rooms 4-11: these were previously collapsed and miswired. */
    assert_route(ROOM_SCHOOL, DIRECTION_WEST, ROOM_SCHOOL_TWO);
    assert_route(ROOM_SCHOOL_TWO, DIRECTION_EAST, ROOM_SCHOOL);
    assert_route(ROOM_SCHOOL_TWO, DIRECTION_WEST, ROOM_SCHOOL_WEST_ROOM);
    assert_route(ROOM_SCHOOL_TWO, DIRECTION_NORTH, ROOM_SCHOOL_NORTH_ROOM);
    assert_route(ROOM_SCHOOL_TWO, DIRECTION_SOUTH, ROOM_SCHOOL_SOUTH_ROOM);
    assert_route(ROOM_SCHOOL_TWO, DIRECTION_UP, ROOM_SCHOOL_UP_ROOM);
    assert_route(ROOM_SCHOOL_TWO, DIRECTION_DOWN, ROOM_SCHOOL_DOWN_ROOM);
    assert_route(ROOM_SCHOOL_WEST_ROOM, DIRECTION_EAST, ROOM_SCHOOL_TWO);
    assert_route(ROOM_SCHOOL_NORTH_ROOM, DIRECTION_SOUTH, ROOM_SCHOOL_TWO);
    assert_route(ROOM_SCHOOL_SOUTH_ROOM, DIRECTION_NORTH, ROOM_SCHOOL_TWO);
    assert_route(ROOM_SCHOOL_DOWN_ROOM, DIRECTION_UP, ROOM_SCHOOL_TWO);
    assert_route(ROOM_SCHOOL_UP_ROOM, DIRECTION_DOWN, ROOM_SCHOOL_TWO);
    assert_route(ROOM_SCHOOL_UP_ROOM, DIRECTION_UP, ROOM_CAGE_HALL);
    assert_route(ROOM_TELEPORT, DIRECTION_DOWN, ROOM_TELEPORT_EFFECT);

    /* City location numbers 20-32 and 60-72 recovered from BOMBKI.EXE. */
    assert_route(ROOM_CITY_THRESHOLD, DIRECTION_NORTH, ROOM_SHOP_STREET);
    assert_route(ROOM_SHOP_STREET, DIRECTION_NORTH, ROOM_SHOP_STREET_NORTH);
    assert_route(ROOM_SHOP_STREET_NORTH, DIRECTION_SOUTH, ROOM_SHOP_STREET);
    assert_route(ROOM_SHOP_STREET_NORTH, DIRECTION_NORTH, ROOM_JUNCTION);
    assert_route(ROOM_LONG_STREET, DIRECTION_WEST, ROOM_LONG_STREET_WEST);
    assert_route(ROOM_LONG_STREET_WEST, DIRECTION_EAST, ROOM_LONG_STREET);
    assert_route(ROOM_LONG_STREET_WEST, DIRECTION_NORTH, ROOM_ENTERTAINMENT_VALLEY);
    assert_route(ROOM_ENTERTAINMENT_VALLEY, DIRECTION_SOUTH, ROOM_LONG_STREET_WEST);
    assert_route(ROOM_ENTERTAINMENT_VALLEY, DIRECTION_EAST, ROOM_CONCERT_HALL);
    assert_route(ROOM_CONCERT_HALL, DIRECTION_WEST, ROOM_ENTERTAINMENT_VALLEY);
    assert_route(ROOM_CONCERT_HALL, DIRECTION_NORTH, ROOM_CROWD_NORTH);
    assert_route(ROOM_CONCERT_HALL, DIRECTION_SOUTH, ROOM_CROWD_SOUTH);
    assert_route(ROOM_CONCERT_HALL, DIRECTION_EAST, ROOM_CROWD_CENTRE);
    assert_route(ROOM_CROWD_SOUTH, DIRECTION_NORTH, ROOM_CONCERT_HALL);
    assert_route(ROOM_CROWD_SOUTH, DIRECTION_EAST, ROOM_CROWD_SOUTHEAST);
    assert_route(ROOM_CROWD_NORTH, DIRECTION_SOUTH, ROOM_CONCERT_HALL);
    assert_route(ROOM_CROWD_NORTH, DIRECTION_EAST, ROOM_CROWD_NORTHEAST);
    assert_route(ROOM_CROWD_NORTH, DIRECTION_NORTH, ROOM_BEER_HALL);
    assert_route(ROOM_CROWD_CENTRE, DIRECTION_WEST, ROOM_CONCERT_HALL);
    assert_route(ROOM_CROWD_CENTRE, DIRECTION_NORTH, ROOM_CROWD_NORTHEAST);
    assert_route(ROOM_CROWD_CENTRE, DIRECTION_SOUTH, ROOM_CROWD_SOUTHEAST);
    assert_route(ROOM_BEER_HALL, DIRECTION_SOUTH, ROOM_CROWD_NORTH);
    assert_route(ROOM_BEER_HALL, DIRECTION_EAST, ROOM_STAGE_ENTRANCE);
    assert_route(ROOM_STAGE_ENTRANCE, DIRECTION_WEST, ROOM_BEER_HALL);
    assert_route(ROOM_STAGE_ENTRANCE, DIRECTION_EAST, ROOM_STAGE_BACK);
    assert_route(ROOM_STAGE_BACK, DIRECTION_WEST, ROOM_STAGE_ENTRANCE);
    assert_route(ROOM_STAGE_BACK, DIRECTION_SOUTH, ROOM_STAGE);
    assert_route(ROOM_STAGE, DIRECTION_NORTH, ROOM_STAGE_BACK);
    assert_route(ROOM_STAGE, DIRECTION_SOUTH, ROOM_STAGE_CENTRE);
    assert_route(ROOM_STAGE_CENTRE, DIRECTION_NORTH, ROOM_STAGE);
    assert_route(ROOM_STAGE_CENTRE, DIRECTION_SOUTH, ROOM_STAGE_END);
    assert_route(ROOM_STAGE_END, DIRECTION_NORTH, ROOM_STAGE_CENTRE);
    assert_route(ROOM_ARENA_ENTRANCE, DIRECTION_NORTH, ROOM_ARENA_33);
    assert_route(ROOM_ARENA_33, DIRECTION_SOUTH, ROOM_ARENA_ENTRANCE);

    /* BLUSZCZ rooms 75-88: no merged descriptions and no invented links. */
    assert_route(ROOM_DARK_STREET, DIRECTION_SOUTH, ROOM_BRUSZCZ);
    assert_route(ROOM_BRUSZCZ, DIRECTION_NORTH, ROOM_DARK_STREET);
    assert_route(ROOM_BRUSZCZ, DIRECTION_EAST, ROOM_BRUSZCZ_EAST);
    assert_route(ROOM_BRUSZCZ, DIRECTION_WEST, ROOM_BRUSZCZ_WEST);
    assert_route(ROOM_BRUSZCZ, DIRECTION_SOUTH, ROOM_BRUSZCZ_SOUTH);
    assert_route(ROOM_BRUSZCZ_EAST, DIRECTION_WEST, ROOM_BRUSZCZ);
    assert_route(ROOM_BRUSZCZ_WEST, DIRECTION_EAST, ROOM_BRUSZCZ);
    assert_route(ROOM_BRUSZCZ_SOUTH, DIRECTION_WEST, ROOM_BRUSZCZ_SOUTH_WEST);
    assert_route(ROOM_BRUSZCZ_SOUTH, DIRECTION_EAST, ROOM_BRUSZCZ_SOUTH_EAST);
    assert_route(ROOM_BRUSZCZ_SOUTH_WEST, DIRECTION_EAST, ROOM_BRUSZCZ_SOUTH);
    assert_route(ROOM_BRUSZCZ_SOUTH_EAST, DIRECTION_WEST, ROOM_BRUSZCZ_SOUTH);
    assert_route(ROOM_BRUSZCZ_SOUTH, DIRECTION_SOUTH, ROOM_FOREST);
    assert_route(ROOM_FOREST, DIRECTION_NORTH, ROOM_BRUSZCZ_SOUTH);
    assert_route(ROOM_FOREST, DIRECTION_WEST, ROOM_FOREST_WEST);
    assert_route(ROOM_FOREST_WEST, DIRECTION_EAST, ROOM_FOREST);
    assert_route(ROOM_FOREST_WEST, DIRECTION_WEST, ROOM_LIVING_DOOR);
    assert_route(ROOM_FOREST_WEST, DIRECTION_SOUTH, ROOM_CAVE_ENTRANCE);
    assert_route(ROOM_LIVING_DOOR, DIRECTION_EAST, ROOM_FOREST_WEST);
    assert_no_route(ROOM_LIVING_DOOR, DIRECTION_WEST);
    assert_route(ROOM_CAVE_ENTRANCE, DIRECTION_NORTH, ROOM_FOREST_WEST);
    assert_route(ROOM_CAVE_ENTRANCE, DIRECTION_SOUTH, ROOM_CAVE);
    assert_route(ROOM_CAVE, DIRECTION_NORTH, ROOM_CAVE_ENTRANCE);
    assert_no_route(ROOM_CAVE, DIRECTION_SOUTH);
    assert(strcmp(world_find_room(ROOM_CAVE)->exits_text,
        "DOSTEPNE WYJSCIA:\nPOLNOC-WEJSCIE DO GROTY") == 0);

    /* Road rooms 100-103. The original has no handlers for its listed forest exits. */
    assert_route(ROOM_JUNCTION, DIRECTION_SOUTH, ROOM_SHOP_STREET_NORTH);
    assert_no_route(ROOM_JUNCTION, DIRECTION_EAST);
    assert_no_route(ROOM_JUNCTION, DIRECTION_WEST);
    assert_route(ROOM_ROAD, DIRECTION_EAST, ROOM_JUNCTION);
    assert_route(ROOM_ROAD, DIRECTION_WEST, ROOM_STONY_ROAD);
    assert_no_route(ROOM_ROAD, DIRECTION_NORTH);
    assert_no_route(ROOM_ROAD, DIRECTION_SOUTH);
    assert_route(ROOM_STONY_ROAD, DIRECTION_EAST, ROOM_ROAD);
    assert_route(ROOM_STONY_ROAD, DIRECTION_WEST, ROOM_ROAD_END);
    assert_route(ROOM_ROAD_END, DIRECTION_EAST, ROOM_STONY_ROAD);

    {
        static const struct {
            int room;
            int south;
            int north;
            int east;
            int west;
        } arena[] = {
            {ROOM_ARENA_33, ROOM_ARENA_ENTRANCE, ROOM_ARENA_34, ROOM_ARENA_35, ROOM_ARENA_36},
            {ROOM_ARENA_34, ROOM_ARENA_33, ROOM_ARENA_37, ROOM_ARENA_38, ROOM_ARENA_39},
            {ROOM_ARENA_35, -1, ROOM_ARENA_38, ROOM_ARENA_40, ROOM_ARENA_33},
            {ROOM_ARENA_36, -1, ROOM_ARENA_39, ROOM_ARENA_33, ROOM_ARENA_41},
            {ROOM_ARENA_37, ROOM_ARENA_34, ROOM_ARENA_42, ROOM_ARENA_43, ROOM_ARENA_44},
            {ROOM_ARENA_38, ROOM_ARENA_35, ROOM_ARENA_43, ROOM_ARENA_45, ROOM_ARENA_34},
            {ROOM_ARENA_39, ROOM_ARENA_36, ROOM_ARENA_44, ROOM_ARENA_34, ROOM_ARENA_46},
            {ROOM_ARENA_40, -1, ROOM_ARENA_45, -1, ROOM_ARENA_35},
            {ROOM_ARENA_41, -1, ROOM_ARENA_46, ROOM_ARENA_36, -1},
            {ROOM_ARENA_42, ROOM_ARENA_37, ROOM_ARENA_47, ROOM_ARENA_48, ROOM_ARENA_49},
            {ROOM_ARENA_43, ROOM_ARENA_38, ROOM_ARENA_48, ROOM_ARENA_50, ROOM_ARENA_37},
            {ROOM_ARENA_44, ROOM_ARENA_39, ROOM_ARENA_49, ROOM_ARENA_37, ROOM_ARENA_51},
            {ROOM_ARENA_45, ROOM_ARENA_40, ROOM_ARENA_50, -1, ROOM_ARENA_38},
            {ROOM_ARENA_46, ROOM_ARENA_41, ROOM_ARENA_51, ROOM_ARENA_39, -1},
            {ROOM_ARENA_47, ROOM_ARENA_42, -1, ROOM_ARENA_52, ROOM_ARENA_53},
            {ROOM_ARENA_48, ROOM_ARENA_43, ROOM_ARENA_52, ROOM_ARENA_54, ROOM_ARENA_42},
            {ROOM_ARENA_49, ROOM_ARENA_44, ROOM_ARENA_53, ROOM_ARENA_42, ROOM_ARENA_55},
            {ROOM_ARENA_50, ROOM_ARENA_45, ROOM_ARENA_54, -1, ROOM_ARENA_43},
            {ROOM_ARENA_51, ROOM_ARENA_46, ROOM_ARENA_55, ROOM_ARENA_44, -1},
            {ROOM_ARENA_52, ROOM_ARENA_48, -1, ROOM_ARENA_56, ROOM_ARENA_47},
            {ROOM_ARENA_53, ROOM_ARENA_49, -1, ROOM_ARENA_47, ROOM_ARENA_57},
            {ROOM_ARENA_54, ROOM_ARENA_50, ROOM_ARENA_56, -1, ROOM_ARENA_48},
            {ROOM_ARENA_55, ROOM_ARENA_51, ROOM_ARENA_57, ROOM_ARENA_49, -1},
            {ROOM_ARENA_56, ROOM_ARENA_54, -1, -1, ROOM_ARENA_52},
            {ROOM_ARENA_57, ROOM_ARENA_55, -1, ROOM_ARENA_53, -1}
        };
        size_t index;

        for (index = 0; index < sizeof(arena) / sizeof(arena[0]); ++index) {
            assert_optional_route(arena[index].room, DIRECTION_SOUTH, arena[index].south);
            assert_optional_route(arena[index].room, DIRECTION_NORTH, arena[index].north);
            assert_optional_route(arena[index].room, DIRECTION_EAST, arena[index].east);
            assert_optional_route(arena[index].room, DIRECTION_WEST, arena[index].west);
        }
    }

    return 0;
}
