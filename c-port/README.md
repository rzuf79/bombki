# BOMBKI portable rewrite

This is a clean-room, portable rewrite of the 1999 DOS text RPG **BOMBKI**.
The goal is behavioral compatibility, not line-for-line recovery of the lost
Turbo Pascal source.

The original files remain untouched in the parent directory. They are reference
artifacts and are not required to build this project.

## Current status

The project is an immediately playable vertical slice. It currently provides:

- a portable C11 game core;
- the recovered opening, name prompt, six race choices, and initial race stats;
- the complete recovered room graph, room-local descriptions, actors, objects,
  and conditional routes;
- a case-insensitive Polish command parser with `n`, `s`, `w`, `e`, `u`, and
  `d` movement aliases;
- one command state, with no command-state switching;
- the original `EXIT` behavior (show available exits, rather than quit);
- save/load and character commands available alongside exploration commands;
- the recovered 23-item catalogue and dexterity/backpack carrying limits;
- recovered taking, dropping, consumable, equipment, and comparison-scroll
  actions;
- the recovered bakery, armory, general-store, and magic-store catalogues,
  purchase rules, item modifiers, and resale values;
- deterministic combat-integrated unique-loot rules, including the
  recovered mismatches between displayed percentages and actual thresholds;
- recovered enemy-stat ranges and persistent, deterministic active-opponent
  snapshots selected by `ZABIJ`;
- a version 16 native save file, with version 1 through 15 import support;
- optional ANSI presentation with a plain-text fallback;
- timer-free, blocking terminal interaction, with combat and sleep resolved in
  deterministic logical turns;
- focused parser, game-flow, world, item, and persistence tests.

It is **not yet a content-complete or mechanically compatible port**. Values,
room text, and behavior marked provisional will be replaced as they are verified
against the DOS game and its compiled units.

The current work plan and completed milestones are tracked in
[`docs/todo.md`](docs/todo.md).

The compact handoff state and low-token recovery workflow are kept in
[`docs/recovery-notes.md`](docs/recovery-notes.md).

The non-negotiable wording and spelling-correction rule is recorded in
[`docs/text-fidelity.md`](docs/text-fidelity.md).

The reproducible static-evidence inventory for the original artifacts is
documented in [`evidence/README.md`](evidence/README.md). It includes hashes,
TPUQ metadata, procedure/source associations, lossless CP852 and UTF-8 string
views, and categorized candidate inventories.

The rewrite deliberately does not reproduce DOS real-time timers or input
deadlines. The complete turn model and its compatibility boundary are recorded
in [`docs/turn-based-design.md`](docs/turn-based-design.md).

## Build and run

```sh
make
make check
./build/bombki
```

The source-controlled `Makefile` uses only paths relative to this directory, so
the checkout and its build directory can be moved without reconfiguration.

CMake remains available as an alternative:

```sh
cmake --fresh -S . -B build
cmake --build build
ctest --test-dir build --output-on-failure
```

CMake-generated build trees contain absolute source paths and must be refreshed
after moving the checkout; they are excluded from version control.

Python 3.10 or newer is optional. When available, it verifies the generated
evidence reports; it is never required to build, test, or run the C game.

Use `./build/bombki --no-color` to force plain output. Redirected input and
output are plain automatically, which makes scripted use straightforward.

Commands with implemented behavior include:

- `POLNOC`, `POLUDNIE`, `WSCHOD`, `ZACHOD`, `GORA`, `DOL`
- `n`, `s`, `w`, `e`, `u`, `d`
- `IDZ <kierunek>`
- `PATRZ` and `PATRZ <rzecz>`
- `EXIT`
- `JA`
- `PAMIETAJ`, `WLACZ POSTAC`
- `POMOC`
- `KONIEC` (portable-port extension used to leave the program)

All supported gameplay commands work without changing command state. Commands
with no implemented gameplay behavior may remain silent or report a
`[PORT: ...]` marker while their recovered behavior is checked.

The corrected spelling `POLUDNIE` is displayed. The original `POLODNIE` remains
accepted as a parser alias for compatibility.

## Design rules

- For technical implementation choices, compatibility and portability take
  priority over historical implementation accuracy. Reproducing Turbo Pascal,
  DOS memory layouts, timing mechanisms, or terminal tricks is not a goal unless
  required for player-visible behavior or legacy-data compatibility.
- The game core must not depend on a terminal library.
- Preserve original wording, grammar, punctuation, capitalization, humor, and
  oddities. Correct only unambiguous spelling mistakes, and record every such
  correction in `docs/compatibility.md`. Never rewrite text to improve clarity.
  Converting CP852 bytes to UTF-8 is allowed as a lossless encoding change.
- Game commands remain usable with ordinary line-based standard I/O.
- Color and cursor effects are optional presentation, never game logic.
- The game is entirely turn based: waiting for input never changes state, and
  no gameplay or presentation code may depend on a wall-clock timer or delay.
- Random behavior is reproducible from the state saved by the game.
- Recovered facts are recorded in `docs/compatibility.md` before being encoded.
- Focused tests should cover observable state instead of assumptions about how
  the Pascal source was originally written.
