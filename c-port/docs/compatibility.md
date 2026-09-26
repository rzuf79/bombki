# Compatibility notes

## Technical priority

For technical decisions, the rewrite prioritizes cross-platform compatibility
and portability over exact reproduction of the DOS/Turbo Pascal implementation.
Player-visible wording, command behavior, state transitions, and data
compatibility remain the accuracy targets. Compiler structure, memory layout,
terminal control, timing, and other implementation details may be replaced with
simpler portable designs when doing so does not compromise those targets or a
documented intentional difference.

## Verified artifact facts

- `BOMBKI.EXE` is a 141,264-byte 16-bit MS-DOS MZ executable.
- `MONSTRA.TPU`, `PRZEDM.TPU`, and `SWIAT.TPU` use the `TPUQ` Turbo/Borland
  Pascal 7 unit format.
- Their retained source maps account for 2,073 source lines and approximately
  52.6 KiB of user-unit machine code.
- The original source filenames are `MONSTRA.PAS`, `PRZEDM.PAS`, and
  `SWIAT.PAS`.
- Their retained metadata contains 47 named procedures. Every one is associated
  with its unit, code block, and source-line range in the generated evidence.
- Static references identify 668 physical short-string literals in the three
  TPU files and 1,303 in the executable. Raw CP852 bytes, UTF-8 decodings, and
  artifact offsets are retained for all 1,971 records.
- Seven string payloads in `PRZEDM.TPU` are absent from the unit version linked
  into `BOMBKI.EXE`. The evidence reports preserve this artifact-version skew.
- `PLIKI.TPU` is line-oriented game state, not a compiled Pascal unit.
- Polish text in `CZYTAJ.TXT` is encoded using DOS code page 852.
- In the original game, `EXIT` lists exits. It does not terminate the process.
- `PAMIETAJ` saves and `WLACZ POSTAC` loads directly; the portable game has no
  subconscious (`MODE`) gate.

As a user-approved startup extension, the portable opening checks for
`bombki.sav`: when one exists it offers `WLACZ POSTAC` before character
creation, and an interactive game prompt displays current and maximum HP.

The DOS dispatcher also retains the direction abbreviations `PN`, `PD`, `W`,
`Z`, `G`, and `D`, plus `E` for `EXIT` and `M` for `MODE`. The portable parser
accepts the non-conflicting Polish direction abbreviations. At the user's request,
`n`, `s`, `w`, `e`, `u`, and `d` follow conventional terminal directions, so
`w` means west and `e` means east; `WSCHOD` and `EXIT` remain unambiguous.
The portable game omits the original command-state switch: all gameplay commands
are available together, and the school posters explain those direct mechanics.

## Compatibility layers

1. **Parser:** accepted commands, whitespace, case conversion, and routing.
2. **World:** descriptions, exits, room-local commands, actors, and encounters.
3. **State:** player statistics, inventory, monsters, quests, and world flags.
4. **Mechanics:** combat probabilities, training, shops, drops, and progression.
5. **Persistence:** safe native saves and loading older native versions.
6. **Presentation:** original wording and color where known, plain text always
   available.

## Intentional timing difference

The rewrite is entirely turn based. It does not reproduce real-time timers,
input deadlines, automatic idle-time attacks, countdowns, animated delays, or
paced text. Waiting at any prompt has no effect on game state or random state.
Combat consequences are resolved as discrete player/enemy rounds initiated by
a complete input line. After `ZABIJ`, an empty line continues the fight and the
available combat choices are shown before every prompt. The opening screen
pauses only for explicit input.

This removes wall-clock behavior only. Original wording, capitalization,
punctuation, command results, formulas, and player/enemy action order remain
compatibility targets where they can be recovered from the retained static
artifacts. No original-runtime comparison environment is required. See
[`turn-based-design.md`](turn-based-design.md) for the engine-level rules.

## Recovered room routing

Room transitions are decoded from assignments to the original `GDZIE`
location variable. Exit labels are retained as display text, but are never used
to guess a destination.

This distinction fixed several earlier bad mappings:

- original room 5 is the six-way `MUD SZKOLA (2)` orientation room;
- rooms 6, 7, 8, and 10 are four separate cramped rooms, returning to room 5
  by east, south, north, and up respectively;
- room 9 connects room 5 to the cage hall in room 11;
- `UL.SKLEPIKOWA` is two rooms, 21 and 22, rather than one combined room;
- `ULICA DLUGA` is two rooms, 30 and 31; room 31, not room 30, connects to
  `DOLINA ROZRYWEK` room 60;
- `BLUSZCZ` consists of rooms 77 through 82, and the forest is room 83;
- the arena entrance is room 32 and the arena movement grid is rooms 33
  through 57;
- the concert and stage branch is rooms 61 through 72;
- the road branch is rooms 100 through 103.

The original also advertises a few exits which its command dispatch does not
provide. At room 100, east is a production notice and west is blocked until
the quest condition is met. At rooms 101 through 103, some displayed forest
directions have no usable room handler; room 101's north branch assigns the
otherwise unhandled value 104. The portable game leaves those directions
blocked instead of inventing destinations. The living-door west exit remains
blocked while the recovered living-door state says that the door is alive and
opens to the elf's house after that state is cleared. Room 18's immediate
teleport back to room 1 is represented as one atomic turn while retaining its
four original output lines.

Room descriptions also use the recovered location variables for roaming arena,
city, concert, stage, and plant encounters, the five cage monsters, and the five
room objects. The five cage deaths persist when ordinary encounters regenerate.
Ordinary roaming encounters are placed again, while the living door and old elf
return to their initial states. A complete new-game world reset additionally
restores the cage monsters and clears room objects and the quest-controlled road
passage.

## Text-fidelity rule

Original player-facing wording, grammar, punctuation, spacing, capitalization,
humor, and apparently accidental characters must not be modernized, clarified,
or silently completed. Unambiguous spelling mistakes may be fixed, but every
change must be recorded below. Text recovered from CP852 may be losslessly
transcoded to UTF-8. If text has not been recovered, the port must show an
explicit `[PORT: ...]` marker instead of invented prose that could be mistaken
for the original. The standing rule is also recorded in
[`text-fidelity.md`](text-fidelity.md).

### Recorded spelling corrections

| Artifact location | Recovered | Displayed |
|---|---|---|
| `SWIAT.TPU:0x0cc9` | `SO TO` | `SA TO` |
| `SWIAT.TPU` (every displayed occurrence) | `POLODNIE` | `POLUDNIE` |
| `SWIAT.TPU:0x149b` | `KOMEDY` | `KOMENDY` |
| `SWIAT.TPU:0x1555` | `UBRONIA` | `UBRANIA` |
| `SWIAT.TPU:0x1555` | `ODLORZ` | `ODLOZ` |
| `BOMBKI.EXE:0x0a722` | `KOMĘDY` | `KOMENDY` |
| `BOMBKI.EXE` (every displayed occurrence) | `POLODNIE` | `POLUDNIE` |
| `PRZEDM.TPU` (every displayed occurrence) | `POLODNIE` | `POLUDNIE` |
| `SWIAT.TPU:0x0e20` | `ę NA PLAKACIE PISZE:` | `NA PLAKACIE PISZE:` |
| `BOMBKI.EXE:0x0a70d` | `ę NA PLAKACIE PISZE:` | `NA PLAKACIE PISZE:` |
| `SWIAT.TPU:0x0147e` | `ę NA AFISZU BYNAJMNIEJ PISZE` | `NA AFISZU BYNAJMNIEJ PISZE` |

### User-approved communication updates

The user approved replacing the stale `MODE`/`UNMODE` and subconscious-state
instructions, plus the underground poster's dormant-ability list. The portable
posters and `POMOC` now describe only direct, implemented mechanics in the
game's established all-caps tone. Recovered text outside those communications
remains unchanged.

## Recovered player setup

The startup prompts and six race names are retained in `BOMBKI.EXE` at
`0x066e6`–`0x06787`. The race-selection assignments at
`BOMBKI.EXE:0x06a24`–`0x06b9d` yield these initial values:

| Race | Strength | Dexterity | Wisdom | Mana | Coins |
|---|---:|---:|---:|---:|---:|
| `CZLOWIEK` | 10/15 | 10/15 | 10/15 | 100 | 0 |
| `OLBRZYM` | 13/20 | 13/20 | 5/7 | 70 | 0 |
| `NIMFA` | 10/15 | 13/20 | 7/11 | 100 | 0 |
| `POL-ELF` | 6/10 | 16/24 | 8/12 | 80 | 30 |
| `UFOK` | 9/13 | 9/14 | 13/20 | 150 | 0 |
| `CZAROMIL` | 6/9 | 7/11 | 16/25 | 250 | 0 |

Statistic pairs are current/maximum. Common initialization sets `ENERGIA` to
50, `PRA` to 10, and `POZIOM` to 1; experience and other zero-initialized
values remain zero.
The rewrite currently represents the initial energy value as both current and
maximum energy. That portable cap is an implementation detail to be refined if
later recovered progression rules require it.

## Status key

- `verified`: observed in the original executable or retained TPU metadata;
- `inferred`: strongly implied by strings/control flow but not yet exercised;
- `provisional`: supplied by the rewrite so the program remains playable;
- `missing`: not implemented.

## Initial slice

| Area | Status | Notes |
|---|---|---|
| Starting room | verified | Text and north transition recovered from `SWIAT.TPU`. |
| Central room | verified | Description and five `GDZIE` assignments recovered. |
| MUD school | verified | Rooms 4–17 are separate again and use recovered transitions. |
| Training room | verified | Description and west transition recovered from `BOMBKI.EXE`. |
| City branches | verified | Static movement for rooms 20–32, 60–88, and 100–103 is decoded from `GDZIE` assignments. |
| Arena | verified | Entrance and rooms 33–57 use the recovered directional grid. |
| Underground training | verified | Room 3 and its up transition are recovered. |
| Player setup | verified | Original prompts, six races, and recovered initial statistics are implemented. |
| Parser vocabulary | intentional difference | Supported command words and argument forms are recognized without switching command state. Unsupported mechanics still show explicit port markers where applicable. |
| Parser normalization | intentional extension | Accepts extra whitespace, mixed case, and `n/s/w/e/u/d`. |
| Native save format | provisional | Version 16 omits the old command-state flag; versions 1–15 still import and ignore it. |

## Recovered inventory and carrying limits

The executable identifies 22 item types displayed by the inventory command,
plus a backpack which participates in carried-item state but is not printed by
that original listing. Five items use a world location when not carried: the
old sword, small shield, bloody heart, school diploma, and pipe. The portable
state represents every carried item with an ordinary nonnegative quantity
instead of preserving the original program's negative-multiple-of-ten storage
convention. Singleton inventory lines retain the original layout. As a
user-approved countable-item extension, `JA` shows a stack's positive quantity
in round parentheses after its item name; its other text and ordering follow
the retained executable, including the swapped strength/wisdom labels.

Carrying capacity is recomputed from current dexterity:

| Dexterity | Capacity |
|---:|---:|
| 10 or less | 10 |
| 11–12 | 11 |
| 13–15 | 12 |
| 16–18 | 13 |
| 19–20 | 14 |
| 21–24 | 15 |
| 25 or more | 16 |

Possessing a backpack adds four to that capacity. The backpack itself still
counts as one carried item. The original does not reject items above the limit;
after a successful turn it reports the excess and removes ten energy per excess
item. The rewrite applies that rule at the end of successful turn-consuming
actions, preserving the recovered messages exactly while remaining entirely
turn based.

The recovered item-action routines normally fail silently when the requested
item is absent or cannot be equipped. The five location-valued items can be
taken only from their current room and are dropped into the player's current
room. Taking the diploma raises maximum energy by five until it is dropped;
taking the pipe raises current wisdom by one when it is below its maximum, and
dropping the pipe removes one wisdom. As a user-approved extension, rejected
drop and sale attempts state why they fail. An equipped singleton sword or
shield must be put away before it can be dropped, but a stacked spare can be
dropped without unequipping the retained copy.

The recovered consumable effects are five energy for the bloody heart; 8, 12,
16, 20, 26, and 34 energy for the doughnut, cake, dry ration, roll, bread, and
weka; 20 energy for bigos; ten energy and ten mana for beer; and 30 mana for the
small mana bottle. Recovery is capped at the corresponding maximum. The
transport pill retains its three wisdom-dependent result branches but omits
the DOS presentation delay. The return scroll consumes itself, removes 15
energy, and moves the player to original room 20. The comparison scroll invokes
its interactive target prompt, applies advice from hard-coded target-name
groups and a player score, costs ten mana, and consumes one scroll. It does not
inspect or guess a room opponent.

As in the executable, attempts to discard the named foods produce the original
refusal. Dropping the bloody heart first places it in the room and then also
prints that refusal. `UZYJ KASETA` prints the cassette description without an
ownership check; this original quirk is retained.

The four ordinary stores retain their recovered `LISTA` output. Purchases are
available only in the store advertising the item. The bakery sells its six
foods; the armory sells the old sword and small shield; the general store sells
the pipe, clothes, cassette, and spiked suit; and the magic store sells the
small mana bottle, lucky leaf, transport pill, and comparison scroll. Only
items with recovered resale commands can be sold. An equipped singleton cannot
be sold, but a stacked spare can be sold without unequipping the retained copy.

Two executable price oddities are preserved. A small mana bottle is accepted
when the player has 15 coins although the displayed price and deduction are 20.
The lucky leaf is advertised as 820 coins and that is the affordability check,
but the executable deducts 830. Acquiring the pipe adds one current wisdom;
acquiring the cassette adds five maximum energy and one current dexterity; and
acquiring the leaf adds 40 maximum mana. Resale reverses those modifiers. The
original's absent-item resale branches can corrupt its signed item counters;
the portable nonnegative inventory instead rejects every absent-item sale.

Duncan's quest-gated black-market list, forged pass, and backpack are
implemented. Staruch's resource-driven quest consumes four wekas and 200 coins,
grants beer, a return scroll, and 50 kunszt, then teleports the player to the
strongest school cage. Its exact three-weka dead zone and post-reward dismissal
are retained.

The recovered unique-loot routines use these actual random branches:

| Loot | Eligible defeated enemy | Successful rolls |
|---|---|---:|
| spiked suit | `TAKSOWKARZ`, `SPRZEDAWCA`, `GORYL`, `OCHRONIARZ`, `TRENER` | 0–25 of 0–999 |
| transport pill | `PEDAL`, `GLADIATOR`, `WOJOWNIK`, `POKRZYWA` | 0–42 of 0–999 |
| Liroy cassette | `PERKUSISTA`, `GITARZYSTA`, `LIROY`, `ORGANISTA` | 0–1 of 0–99 |
| lucky leaf | `POKRZYWA` | 0–5 of 0–99 |
| comparison scroll | `POKRZYWA` | 0–9 of 0–99 |

The output's advertised percentages are retained even where they disagree with
those branches: the suit says 2.5% but has 26 successful values, and the leaf
says 4% but has six. `POKRZYWA` attempts leaf, pill, and scroll in that order
using three separate rolls. The D.J uses one shared 0–99 roll: below 25 yields a
dry ration, and below three yields both that ration and a cassette with the
separate recovered 3% message. Loot resolution applies no extra turn because it
will be part of the atomic combat turn.

## Current turn implementation

The native game state contains a 64-bit logical turn counter. Successful
movement advances it. Inspection,
status, help, invalid commands, failed movement, save requests, and quit do not.
Every supported command verb now has an explicit turn policy; later mechanical
commands will advance the counter only when their action succeeds.

The counter, RNG state, selected race, current and maximum statistics, energy,
mana, money, experience, practices, actor and room-object locations, and world
flags, all carried-item quantities, equipped-item identities, and an optional
active-opponent snapshot, level, kick configuration, flee skill, and
flee-energy threshold, comparison skill, parry skill, cooking skill, return
skill, logical sleep hours, Duncan's quest byte and black-market unlock, and the
Quest Master type and kill counter are serialized in native save format version
15. Versions 1–14 remain readable;
absent newer fields receive their portable defaults. None of the formats
contains elapsed-time gameplay state.

Selecting a present actor with `ZABIJ` now rolls that actor's recovered energy,
strength, and dexterity once. Repeating the selection retains the same values;
victory, death, escape, and monster regeneration clear them. The initial
`ZABIJ`, then an empty line or another `ZABIJ`, each resolve one atomic basic
combat round and consume one logical turn: both
dexterity-dependent dodge checks run first, the enemy attacks, the player
attacks, and victory rewards are resolved before the prompt returns. The
original `Random(strength)` damage ranges, message tiers, overlapping dodge
branches, and the small shield's inclusive 0-through-10 defense roll are
retained. A surviving fight stays in its combat input loop; no wall-clock delay
or automatic follow-up round is used. Movement and ordinary world actions are
blocked until the fight ends. Status, abilities, save, load, and quit remain
available but are not included in the brief combat-action prompt.

Enemy fireball and poison processing occurs at the same recovered point after
physical defense and before the player's attack. Each charged spell has its
original 10% cast chance; poison then damages the player once per successful
enemy-hit round while its duration remains. Ordinary enemies have no spell
charges; the Quest Master has twenty fireballs and ten poison casts.

When a surviving enemy reduces the player to zero energy, the recovered death
sequence now restores maximum energy, applies
`KUNSZT - 250 + Random(50) - 5 * POZIOM`, returns to original room 20 (the city
centre), and regenerates ordinary encounters. The old extra `ReadLn` pause is
discarded. Active easy quests reset to 50 remaining; medium and hard quests
reset to 200.

Base-stat training is limited to the training room and retains the original
practice costs and maximum-stat gates. `POTRAWKI` training and its automatic
post-victory `BIGOS` production and zero-roll learning path are also connected.

Defeating an opponent while alive awards the recovered kunszt value from the
energy, strength, and dexterity comparison formula. Deductions for the
opponent's maximum energy and the player's parry and kick skills are retained.
Level advancement is checked after a successful logical turn and preserves the
recovered thresholds, costs, practice and resource-cap gains, special level-12
maximum-stat changes, and original display quirks. It has no elapsed-time
dependency.

`CWICZ UCIEKAC` uses the recovered stat, practice, and 85-point gates plus the
original skill-growth formula. Outside combat, `ZWIEJ` retains its original
threshold prompt and configures the energy value below which escape is
attempted after a normal round. During combat, `ZWIEJ` is also an explicit
round choice: the enemy attacks, the player gives up the normal weapon hit,
and escape is attempted without checking that threshold. Success uses the
recovered combined energy/strength/dexterity score, costs 20 kunszt, leaves the
enemy in its room, and closes the active fight. Failed attempts retain the
fight. Neither path has a clock or background activity.

`CWICZ PAROWANIE` uses the recovered strength, dexterity, practice, and
90-point gates. During an enemy hit, automatic parrying runs after the small
shield. Its inclusive `Random(140) <= PAR` test reduces remaining damage to
zero below three points, by two below ten points, or by three otherwise. A
successful zero roll can raise the skill and award five kunszt. The exact
leading spaces and wording of its output are retained.

`CWICZ POWROT` uses the recovered strength, practice, and 90-point gates.
Direct `POWROT` uses the inclusive skill check and the original three portal
outcomes: city for 15 mana, failure for five mana, or a random original room
for ten mana. Mana is clamped at zero to keep portable state valid. Original
room numbers are translated to native IDs; unrepresented dispatcher gaps fall
back to the starting room instead of creating invalid native state.

`ZDOLNOSCI` displays the six stored skills under their recovered stat gates.
The underground poster also preserves every independent gate and exact line.
Its additional advertised direct and automatic abilities have no executable
handler, state, or combat branch, so those command words are silent no-ops.

`KTO` follows `PRZEDM.KTO`: it lists only the recovered arena roster from
`KORNIK` through `TRENER` that shares the current room, in that order. `SCAN`
retains its original taunt. Other unmatched command forms remain silent as in
the retained command handlers. `POMOC` and `HELP` retain the port's command
guide, and blocked movement or non-combat actions during a fight retain their
port feedback text.

`SPIJ` is the recovered healing path. One explicit command represents one
logical sleep hour, adds ten energy, subtracts 20 kunszt, and consumes one turn.
Repeating it continues the same sleep. Any other input wakes the player, uses
the two separate `Random(2 * hours)` rolls, applies the greater-than-four and
greater-than-eight-hour strength bonuses, clamps energy to its maximum, and
then processes that input. The DOS delay and keyboard polling are absent.

Quest Master's easy, medium, and hard quests use their recovered purchase
prices, monster-kill counters, Liroy bonus, death reset, turn-in items, and
awards. Killing him or buying Duncan's forged document grants the same pass;
the western junction route tests present pass quantity and closes again if the
last pass is destroyed. The medium reward reduces maximum energy by five;
the port keeps its maximum at least one to avoid invalid portable state.
The living door's `NEASY` battle opens access to Staruch, whose `SLABO` battle
causes the recovered disappearance and level penalty. The retained road ends
at original room 103's impassable river; no separate winning state or credits
were recovered, so the port does not invent one. Exact quest text and rules
are recorded in `evidence/recovered/pseudocode/QUEST_MASTER.md` and
`evidence/recovered/pseudocode/STARUCH.md`.

## Next recovery milestones

The complete milestone checklist, including finished foundation work, is in
[`todo.md`](todo.md).

The reproducible evidence set and its extraction limits are described in
[`../evidence/README.md`](../evidence/README.md).
