# C-PORT vs ORIGINAL — discrepancy report (human-readable)

Source of truth: the original x86-16 disassembly
(`RECONSTRUCTED\disasm\annotated-BOMBKI.asm`), cross-checked against the TP7
save/load reconstructions. The "port" is `..\..\c-port\` relative to this file
(e.g. `src\game.c`, `src\persistence.c`), and the disasm is
`RECONSTRUCTED\disasm\annotated-BOMBKI.asm` under `pascal-decomp\`. Every
formula below was re-derived from the raw instructions in this pass (not taken
from earlier notes).

Verdict vocabulary:

- `ORIGINAL` — this is how the original game works; the port should match it.
- `PORT-DEVIATION` — the port behaves measurably differently from the original.
- `DOSSIER-ERROR` — a helper dossier/doc misstates the ORIGINAL (the port is
  usually innocent here).

Severity: `major` = changes gameplay balance/flow; `moderate` = correct-ish but
different inputs/values; `minor` = cosmetic/faithfulness only.

## Summary matrix

| # | topic | verdict | severity |
|---|---|---|
| D | Save-file format (incl. Forsa net-worth encoding) | PORT-DEVIATION (deliberate) | moderate |
| E | Quest turn-in side effects | PORT-DEVIATION (deliberate) | moderate |
| F | Item storage: countable quantities vs bool sentinels | PORT-DEVIATION (deliberate) | major |
| I | Kaseta unique-drop carrying penalty | PORT-DEVIATION | major |
| J | High-tier ordinary-reward energy gate | PORT-DEVIATION | moderate |
| K | Coin-reward overflow behavior | PORT-DEVIATION | minor |
| L | WALKAPIES rewards after fleeing | PORT-DEVIATION | moderate |
| M | Stage-fight result handling and Liroy bonus | PORT-DEVIATION | major |
| N | Non-stage kill callers roll unique drops unconditionally | PORT-DEVIATION | moderate |
| O | FIGHTBLUSZCZ: market gate + plant kill clears | PORT-DEVIATION | moderate |
| P | POROWNANIE basic/street advice band off-by-one (score==22) | PORT-DEVIATION | minor |
| Q | Command abbreviations (KOMENDY): 'W'→west, 'E'→east, 'M'/'E'→MODE/EXIT lost, N/S/U added | PORT-DEVIATION | moderate |
| R | PIERDOLY colour commands (ZMIEN KOLOR / ZMIEN TLO) not ported | PORT-DEVIATION | minor |
| S | Small-shield block (TARCZA): mutable PRO/ILOSC vs fixed 10%/1pt | PORT-DEVIATION | moderate |
| T | Monster regeneration (POTWORY): numeric state model + re-roll guards vs room-placement spawns | PORT-DEVIATION (deliberate) | moderate |
| U | Item use (UZYWANIE): stat side-effects (PRO/CIALO/ILOSC/FUKSROLL) folded into equipped_clothing; pill's POTWORY re-roll missing | PORT-DEVIATION | minor |

---

## D. Save-file format (moderate)

### ORIGINAL

`PLIKI.TPU`-style text file, **unlabelled flat sequence** — 80 numeric lines
+ the player name, in the exact `save()` write order (WriteLn scalar, emission
table in `disasm\procs\SAVE-FIELD-MAP.txt`). Inverse transforms live in
`wczytaj()` (img 0x7D80..0x85FF). Most fields are stored through an
inverse-encoded raw form (Energy as `(E+0x28)<<2`, Level `+0x17`, Zrec `+0x0C`,
Sila `−0x18`...). `Forsa` [0x21A:0x21C] is the biggest of these: the file holds
the **net-worth product `coins × MadroscCur`** (`@LMul 0x1C71:0x7BD`, save img
0x2E0F..0x2E25 — the same value echoed on the save screen), and `wczytaj()`
re-derives the wallet as `raw div MadroscCur` (`@LDiv 0x1C71:0x7FA`, img
0x7FA4..0x7FBB). The runtime wallet is always plain pocket coins; the factor
never enters gameplay.

### PORT (persistence.c)

Self-describing `key=value` lines under a versioned header
(`SAVE_HEADER_V16`, fields like `room=`, `coins=`, `flee_skill=`...,
persistence.c 43-105), with import tolerating v1-15.

### Comments

**Not byte-compatible** — an original save cannot be fed to the port or vice
versa. The port schema is strictly a superset/invention for portability. This
is a deliberate port decision, but it means any "ported save" is a re-serialised
profile, never the original file.

The Forsa `× wisdom` factor is a **within-format encoding, not an economy
scaling**: costs, loot and quest turn-ins read only the in-memory pocket coins
`[0x21A:0x21C]`, so no payable is affected. The port therefore persists the
runtime `coins` directly — the same value the original keeps in memory — and
only the original's save-screen "net worth" number differs (it shows the gross
product). This supersedes the earlier "Forsa / wealth scaling" item.

---

## E. Quest turn-in side effects (moderate)

### ORIGINAL (img 0x1276B..0x127C4 region)

| type | reward | side effects |
|---|---|---|
| 1 | KUNSZT +100 | pass granted (longint [0x21E:0x220] −=10), **PRZED [0x182] +1** |
| 2 | KUNSZT +250 | pass granted, consumes Dyplom, **EnergyMax −5** |
| 3 | KUNSZT +425 | pass granted, consumes Fajka, **PRAKTYK −1**, **PRZED [0x182] −1**, **MadroscCur −1** (removes the pipe's carried +1 wisdom) |

### PORT (sell_shop_item "QUEST", game.c 3471-3513)

Matches the rewards, pass grant (ITEM_QUEST_PASS++), Dyplom consumption,
`maximum_energy −= 5` (type 2), `practices −−` and the wisdom mirror
`apply_carried_item_effect(PIPE, -1)` (type 3). **Omitted: the PRZED
±1 bumps** for types 1 and 3.

### Comments

**Non-actionable.** The `PRZED [0x182]` ±1 bumps are carried-item
*counter* bookkeeping, not a stat effect: `[0x182]` (`PRZED`, `INTEGRATED-FIELD-MAP.md`
0x45 / 0x321) is ±1 on **every** sentinel-slot acquisition/consume — type 1
+1 tracks granting the Przepustka pass, type 3 −1 tracks consuming the Fajka.
The real capacity ceiling is `MaxLoad [0x1C2]`, which these quests never touch.
Under the port's countable-items design (§F) there is no sentinel slot or
`[0x182]` counter to keep, and capacity is dex-derived — reproducing the ±1
would be meaningless. Recorded so a future audit does not re-flag it.

---

## F. Item storage: countable quantities, not bool sentinels (major, deliberate)

### What the ORIGINAL does

World-location items are byte slots holding `0xFFF6` (-10 = carrying) or `0`
(consumed). Gates treat the slot like a bool "owned or not": monster drops
require `!= -10` (the heart additionally that `[0x186]` never left the -10
state), and `PRZED [0x182]` is +/-1 on pick-up/drop of each sentinel
item. You effectively can never own two hearts or two paczki — a repeat drop
prints nothing.

### What the PORT does (decision 2026-09-25, game.c)

By explicit project decision, **all items are countable quantities, not bools**:

- Gaining an item always **increments** its count (`take_item` and every reward
  drop); no "you may only have 1 before giving it" gate exists anywhere.
  Removed in the abstract: `recovered_world_drop_is_available`, the monster
  give-once checks (heart/paczek), and the teleport-diploma ownership clause
  (the "all five cages dead" trigger is kept). `take_item`/reward writes use
  clamped `++` instead of `= 1`.
- `game_state_is_valid` no longer caps world-location items at 1.
- Consequence: hearts and paczki stack; each successful drop prints its message
  and raises the count (test 02 `test_standard_heart_rewards_stack`,
  `test_mrowka_drops_paczek_again_when_carrying`).
- The original heart routines call `Random(20)` only while `SERCE = 0`; the
  port rolls on every eligible non-Mrowka ordinary reward. Mrowka similarly
  rolls before its original `PACZEK <> -10` check. Countable repeats therefore
  also change subsequent RNG consumption, not just inventory quantities.
- `PRZED` bumps (+1 heart/paczek, -1 eating) remain unimplemented —
  capacity is dex-derived in the port (game.c `game_carrying_capacity`).

### Why / how to audit

The pascal `-10` sentinel is an x86-16 memory/UI shortcut, not a design
constraint the port wants to reproduce; the project chose a uniform, predictable
inventory model. Do **not** re-flag quantity-stacking or lack of the give-once
gates as a PORT-DEVIATION bug; this section is the standing record of the intent.

---

## I. Kaseta unique-drop carrying penalty (major)

### ORIGINAL (`PRZEDM.KASETAZYSK`, img 0x15908..0x1598F)

On `Random(100) < 2` while `MIECHO <> 10000`, the drop grants Kaseta and applies
`MAXE += 5`, `PRO -= 8`, `PRZED += 1`, and `ZRE += 1`. TPU symbols and the EXE
bind `PRO` to the carrying ceiling at 0x1C2; the item's own description also
states `S.Z -8 MAXE +5 ZRE +1`.

### PORT (`try_unique_drop`, `apply_carried_item_effect`)

The port increments the Kaseta quantity and applies maximum-energy +5 and
dexterity +1, but does not apply the `PRO -= 8` carrying-ceiling penalty. Its
carrying ceiling is recomputed from dexterity, so the +1 can leave capacity
unchanged or increase it instead. The generic drop helper also has no equivalent
of the original `MIECHO <> 10000` guard. Most callers are combat-loot paths
where the guard never fires, so this is largely latent — but it *is* reachable:
on a simultaneous knockout the port resolves loot before checking player death
(`game_resolve_active_opponent_victory` runs its loot block at game.c 1941-1944,
*then* the death handler at 2505-2508), so Kaseta/Listek/Scroll can be granted
on a turn where the original sets context 10000 and suppresses the drop.
`PRZED += 1` is not separately actionable because carried count is derived from
quantities under the deliberate item model in section F.

---

## J. High-tier ordinary-reward energy gate (moderate)

### ORIGINAL (`PRZEDM.VEASY/EASY/NEASY`)

After `WALKA`, these three procedures grant coins and attempt the Serce drop only
when both `PASZOL = 0` and `ENERGIA > 0`. SLABO/MNIEJSLABO/SREDNIO/TRUDNO/
BTRUDNO require only `PASZOL = 0`.

### PORT (`game_resolve_active_opponent_victory`, game.c 1934-1939)

Kunszt and cooking are gated by `state->energy > 0`, but
`resolve_ordinary_enemy_rewards` is called unconditionally. If victory reaches
this path with nonpositive player energy, VEASY/EASY/NEASY still grant coins and
roll their ordinary item reward, unlike the original. (In the original the
`ENERGIA > 0` gate and the `MIECHO = 10000` knockout context are distinct
safeguards; the port's omission of both is logged together with the loot
ordering under entries I/L/M/N.)

---

## K. Coin-reward overflow behavior (minor)

The original difficulty procedures add the 16-bit roll directly to signed
Longint `FORSA`. The port checks `INT_MAX - coins` and saturates at `INT_MAX`
(`game.c` 1767-1773). This differs only at the extreme upper bound but is not
the original arithmetic behavior.

---

## L. WALKAPIES rewards after fleeing (moderate)

### ORIGINAL (`PRZEDM.WALKAPIES`, img 0x12A16..0x12AC9)

`WALKAPIES` calls `WALKA` and then, without checking `PASZOL`, always rolls and
grants `Random(15)` coins. If `SERCE = 0`, it also makes the 25% heart roll and
sets `SERCE := MIECHO`, placing the heart in the current room. A successful flee
therefore still reaches the dog reward code. The dog's room anchor (its kill-flag
presence) is likewise removed unconditionally, and on the street maps the three
`SPANIEL`/`PUDEL` speech lines play after the fight even when the player fled.

### PORT (`game_resolve_active_opponent_victory` / `try_flee`)

Dog rewards are represented accurately by `ENEMY_REWARD_DOG`, but are emitted
only by the victory resolver after the opponent reaches zero energy (game.c
1941-1944). Fleeing does not grant the original dog coins or attempt the heart
drop, does not clear the dog anchor, and skips the SPANIEL/PUDEL speech that the
original still shows after a successful flee (`try_flee`, game.c 2145-2166).

---

## M. Stage-fight result handling and Liroy bonus (major)

Original `FIGHTSCENA` clears PERKUSISTA/GITARZYSTA/ORGANISTA and calls
`KASETAZYSK` immediately after `VEASY`, without checking its result. LIROY alone
requires `MIECHO<>10000`, `ENERGIA>0`, and `PASZOL=0`; success prints
`GRATULACJE !!! ZABILES LIROYA DOSTAJESZ ZA DARMO 30 KASY`, adds 30 coins,
rolls Kaseta, optionally subtracts 150 quest progress, and clears LIROY. So on a
simultaneous knockout the musicians still have their flags cleared and the 30
bonus is refused the same way — the original's defeat path sets context 10000,
which the Liroy gate and the Kaseta/Listek/Scroll guard both honour.

### PORT (game.c 1654-1660, 1941-1957)

The port runs stage cleanup and cassette loot through the generic victory
resolver, which fires **only when the opponent reached zero energy**. That is
*not* "confirmed victory" — the resolver runs before the player-death check
(game.c 2505-2508), so a simultaneous knockout is exactly where the two games
diverge:

- Liroy's bonus (30 coins, cassette roll, `-150` quest) requires the opponent KO
  in the port too, but the port's resolver does not reproduce the `ENERGIA > 0`
  gate, so bonus/cassette eligibility is decided by loot ordering rather than by
  the context value the original uses.
- Musicians: on a same-turn KO the port clears the actor in the resolver and may
  run the cassette roll (game.c 1941-1944) before the death handler, where the
  original set context 10000 first and suppressed it.

The port does not reproduce the exact `GRATULACJE` line either way (the 30 coins
and quest step only apply on a clean Liroy KO).

---

## N. Non-stage kill callers roll unique drops unconditionally (moderate)

### ORIGINAL

KillDispatch and the room handlers push several non-stage callers through the
same fight-early/drop-late shape as WALKAPIES/FIGHTSCENA: the drop routine is
called right after `WALKA` with no result check. Affected non-stage callers:

- `TAKSOWKARZ` / `SPRZEDAWCA` → `VEASY` + `GARNITURZYSK`
- `PEDAL` / `MACIEK` → `PIGULKAZYSK`
- `D.J` (cassette block, arena 'E' 0x67E) → Kaseta roll

On a knockout these are the same triple: the wake-up caller still reaches the
drop code, and only the drop's own `MIECHO <> 10000` guard (context 10000)
suppresses Kaseta/Listek/Scroll; the Garnitur/Pigulka rolls have no such guard.

### PORT (game.c 1934-1957)

`game_resolve_active_opponent_victory` fires only when the opponent reached zero
energy, so these non-stage kills behave like the stage calls in entry M: a
same-turn knockout decides eligibility by loot-ordering, not by the original's
context-driven guard. Non-entity kill paths (D.J cassette, MINI-BARMAN/GRUBAS
arena) are handled separately; the D.J cassette grant is `game.c 1527-1533`.
Reachability of the omitted `MIECHO <> 10000` guard is shared with entry I.

---

## O. FIGHTBLUSZCZ: market gate + plant kill clears (moderate)

### ORIGINAL

`FIGHTBLUSZCZ` (PRZEDM.PAS:1463-1558, TPU 0x0522..0x0A2F) handles Duncan's
roadside stand and the garden. Black market:

- `SECRET LISTA` lists the menu whenever `DUNCAN = MIECHO` (Duncan present) —
  the price list is visible even before the pokrzywa quest is finished.
- `KUP DOKUMENT` has **no** Duncan-location test at all: the only gate is
  `FORSA > 399` (Longint compare). It applies the owned-sentinel
  `PRZEPUSTKA := PRZEPUSTKA - 10`, `FORSA := FORSA - 400`, `PRZED + 1`.
- `KUP PLECAK` requires Duncan present **and** `FORSA > 4799`
  (0x12bf); `PLECAK := PLECAK - 10` (byte), `FORSA := FORSA - 4800`,
  `PRZED + 1`.
- `ROZMAWIAJ DUNCAN` (Duncan present): offer when `DUNQ = 0` (six lines then
  `DUNQ := 75`), reminder when `DUNQ <> 0`, completion when `DUNQ = -125`
  (comparison byte 0x83 — DUNQ is Shortint): two more lines, `DUNQ := 0`,
  `KUNSZT := KUNSZT + 125`.

Garden kills are resolved in-procedure with the difficulty procs, not a shared
KO-only resolver:

- SZCZAW / KONICZYNKA / MLECZ / DMUCHAWIEC → `VEASY`, cleared
  **unconditionally** (even if the fight was lost — cleared regardless of
  `ENERGIA`).
- STOKROTKA → `VEASY`, cleared only `if ENERGIA > 0`.
- ROZA / OSET / MALINA / AGREST / JEZYNA → `EASY`, cleared only
  `if ENERGIA > 0`.
- TRAWA → one `WriteLn`, then `TRUDNO` up to **four times** while
  `ENERGIA > 0` (each round gated on `ENERGIA > 0`), then
  `if (ENERGIA > 0) and (PASZOL = 0)` → the UFF rest line. TRAWA is never
  cleared (endless lawn).

### PORT (game.c 1941, 3286-3308, 3327-3360, 3405-3417; enemies.c 106-116)

- The market menu and both purchase branches are all gated behind
  `duncan_black_market_unlocked`, which is set only on quest completion in
  `talk_to_duncan`. The original allowed listing and buying before the quest
  was done (SECRET LISTA needed only Duncan present; KUP DOKUMENT needed only
  FORSA), so the market is unavailable in the port until the 4-pokrzywa quest
  is finished.
- The DUNQ quest itself is otherwise 1:1: offer/DUNQ=75, reminder, completion
  at `duncan_quest == 131` (== -125 signed), +125 exp, DUNQ=0; the −50
  decrement per pokrzywa kill is game.c 1958-1959. Pass ownership is adapted
  to an item quantity + `quest_passage` flag (entry F family).
- Plants are cleared only by the KO resolver (`active_opponent_energy == 0`,
  game.c 1941). The unconditional clears of SZCZAW/KONICZYNKA/MLECZ/
  DMUCHAWIEC and the `ENERGIA > 0` semantics of the remaining five are lost —
  the port clears a plant exactly when the fight is won.
- TRAWA is a single `ENEMY_PROFILE_TRUDNO` fight (enemies.c 116): no
  repeat-while-alive loop, no UFF rest line, and it is cleared on KO whereas
  the original never clears it.

---

## P. POROWNANIE basic/street advice band off-by-one (minor)

### ORIGINAL

`POROWNANIE` (PRZEDM.PAS:385-472, TPU 0x0816..0x12E9) prints a three-band
verdict for the street targets (TAKSOWKARZ / SPRZEDAWCA / GITARZYSTA /
PERKUSISTA / ORGANISTA / ZEBRAK / PIJAK / ZAMIATACZ / SZCZAW / STOKROTKA /
KONICZYNKA / MLECZ / DMUCHAWIEC):

- `'NIE'` when `OGOL < 21`
- `'RACZEJ NIE , CHOC MOZNA ZARYZYKOWAC(NIE POLECAM)'` when
  `22 < OGOL < 28` (band 23..27; OGOL 21 and 22 print nothing)
- `'TAK'` when `OGOL > 27`

The score itself is 1:1 (register's confirmed bullet): `OGOL := POZIOM + SIL`
plus `ZRE` tiers (8/9→+4 ... 20/21→+10, exactly `ZRE div 2` for 8..21),
`PAR > 75/50 → +1/+1`, `KOP > 10/70 → +2/+2`.

### PORT (game.c 3072-3083)

Same strings and first/last thresholds, but the middle band is
`score > 21 && score < 28` — off by one: score 22 prints 'RACZEJ NIE...' in
the port where the original printed nothing. All other advice bands (small,
animals, fighters, club, plants, LIROY incl. Polish diacritics, POKRZYWA,
dogs) and the BAKTERIA +5 MANA / learn gate (`FUKS < 3 and POR < 100` →
`'***************** UCZYSZ SIE ZDOLNOSCI POROWNYWANIE *****************'`,
`POR + 1`, `KUNSZT + 5`) are 1:1.

---

## Q. Command abbreviations (KOMENDY) (moderate)

### ORIGINAL (`PRZEDM.KOMENDY`, PRZEDM.PAS:1560-1570, TPU 0x0043..0x016F)

`KOMENDY` runs before dispatch and expands abbreviation commands:

`PN`→`POLNOC`, `PD`→`POLODNIE`, `W`→`WSCHOD`, `Z`→`ZACHOD`, `G`→`GORA`,
`D`→`DOL`, `E`→`EXIT`, `M`→`MODE`.

The letters are Polish, not English compass points: `W` is the natural
abbreviation of *wschód* (east) and `Z` of *zachód* (west). `E` expands to the
`EXIT` command (the "show available exits" list, not quitting) and `M` to
`MODE` (display mode). There are no `N`/`S`/`U` abbreviations and no
`POLUDNIE` spelling.

### PORT (parser.c `parse_direction` 42-68)

`PN`/`PD`/`G`/`D` match, and the full words `POLODNIE` (and additionally
`POLUDNIE`) are recognised. Deviations:

- `W` is mapped to `DIRECTION_WEST` (ZACHOD), while the original `W` means
  east (`WSCHOD`).
- `E` is mapped to `DIRECTION_EAST`, while the original `E` expands to the
  `EXIT` (exits-list) command.
- `N`, `S`, `U` are accepted as extra aliases the original does not have.
- `M`/`MODE` is `COMMAND_UNKNOWN` (test_parser.c:81 asserts `"MODE"` →
  unknown); the `M` abbreviation has no port equivalent.
- `EXIT` itself is the exits-list command in both games (parser.c:156,
  COMMAND_EXITS), so only the `E` abbreviation's target differs.

No test asserts the single-letter directions, so the `W`/`E` remap is
untested and looks like an incidental English-porting artifact rather than a
deliberate design choice.

---

## R. PIERDOLY colour commands not ported (minor)

### ORIGINAL (`PRZEDM.PIERDOLY`, PRZEDM.PAS:1111-1122, TPU 0x003B..0x00E1)

Two cosmetic commands on `wpisz`, no validation:

- `ZMIEN KOLOR` → prints `PODAJ LICZBE KOLORU`, `ReadLn(FUKS)`,
  `TextColor(FUKS)` (Crt, low byte only).
- `ZMIEN TLO` → prints `PODAJ LICZBE TLA`, `ReadLn(FUKS)`,
  `TextBackground(FUKS)` (Crt.entry_0x0070).

CRT clamps the accepted values to the 16 foreground / 8 background palette.

### PORT

No equivalent. The port has no terminal-colour framework; both commands fall
through to the unrecognised-command path. Cosmetic only.

---

## S. Small-shield block (TARCZA) (moderate)

### ORIGINAL (`PRZEDM.TARCZA`, PRZEDM.PAS:601-608, TPU 0x0022..0x0090)

Block event rolled inside the fight flow:

- `FUKS := Random(100)`; the block succeeds when `FUKS <= PRO`;
- `WPYSK := WPYSK - ILOSC` (sword-hit component reduced by the shield's
  absorb), clamped at 0;
- prints `'OSLONILES SIE ! TRACISZ ', WPYSK, ' ENERGII'`.

`PRO` and `ILOSC` are mutable, accumulating combat stats — e.g. the armour
suit (GARNITUR, PRZEDM.UZYWANIE img 0x0F2C..0x0F39) raises `ILOSC +1`,
`PRO +10`, `FUKSROLL +15` — so the block chance and absorption grow with
equipment rather than being fixed.

### PORT (`apply_small_shield`, game.c 2274-2290)

Same verbatim message with the reduced damage, but the block chance is the
constant `random_below(state, 100) > 10` (10%) and the reduction is always one
point (`--damage`), gated only on `equipped_shield == ITEM_SMALL_SHIELD`. The
accumulating `PRO`/`ILOSC` mechanic (shared with the armour suit) is not
modelled.

---

## T. Monster regeneration model (POTWORY) (moderate)

### ORIGINAL (`PRZEDM.POTWORY`, PRZEDM.PAS:70-164, TPU 0x0000..0x05D8)

Assigns a numeric *state* value to every arena/world monster and re-rolls them
in tiers behind retry-until guards (`repeat ... until`):

- arena bugs/animals `BAKTERIA`..`KUROPATWA`, forest animals `SARNA`..`MUCHA`,
  big animals `SLON`..`PANTERA`, gladiators `GLADIATOR`..`TRENER`:
  `Random(38) + 20`, retried until every member is `> 32` (so 33..57);
- dogs `MONSTRA.JAMNIK`..`PUDEL` and street townies `MONSTRA.TAKSOWKARZ`..
  `ZEBRAK`: `Random(7) + 20` (20..26), guard `> 19`;
- concert crowd `DZIECKO`..`CZLOWIEK` (byte): `Random(7|8) + 60`, guard `> 60`;
  police `POLICJANT`..`REPORTER` (byte): `Random(7|8|9) + 60`, guard `> 60`
  (61..67);
- band `GITARZYSTA`..`LIROY`: `Random(3) + 70` (70..73), no guard;
- fixed townsfolk: `MONSTRA.MINIBARMAN := 67`, `GRUBAS := 67`, `DJ := 69`,
  `PEDAL`/`PARA`/`MACIEK := 76`, `DRZWI := 1`, `STARUCH := 1`;
- plants `SZCZAW`..`TRAWA` + `DUNCAN`: `Random(8) + 77` (77..84), retried until
  the eight main plants are `< 84` (`AGREST`/`JEZYNA`/`TRAWA`/`DUNCAN` are not
  in the guard).

The retry guards exist to keep each tier's spread above a floor so monsters are
uniformly "alive" after regeneration.

### PORT (`game_regenerate_encounters`, game.c 227-294)

The same actor groups are re-spawned on regeneration, but as room placements
instead of numeric states: the arena crowd `KORNIK`..`TRENER` goes to
`ROOM_ARENA_33 + random(25)`; dogs and townies to `street_spawn_rooms`; concert
crowd and police to `concert_spawn_rooms`; plants to `plant_spawn_rooms`. The
fixed townsfolk map to fixed rooms/booleans: `STARUCH` → `ROOM_ELF_HOUSE` with
`old_elf_present`, the living door (`DRZWI`) → `ROOM_LIVING_DOOR` with
`living_door_alive`. The numeric state-value model and its anti-clumping
re-roll guards have no port analog. Deliberate architectural difference
(room+actor model); gameplay effect: the original draws the whole crowd from
one flat pool in a single region, the port scatters each group over its own
room list.

---

## U. Item-use stat effects and pill re-roll (UZYWANIE) (minor)

### ORIGINAL (`PRZEDM.UZYWANIE`, PRZEDM.PAS:965-1108, TPU 0x00D8, bytes
0x07C6-0x10E7)

The use-item dispatcher on `wpisz`:

- `UZYJ FAJKA` (pipe, `FAJKA = -10`): message only — the pipe is not consumed.
- `UZYJ SERCE` (`SERCE = -10`): `SERCE := 0`, message, `ENERGIA + 5` capped to
  `MONSTRA.MAXE`, `PRZED - 1`.
- `UZYJ DYPLOM` (`DYPLOM = -10`): prints the 10-line diploma box (it has three
  consecutive blank rows between the title and `>BRAWO!`).
- food `PACZEK`/`CIASTKO`/`SUCHA`/`BULKA`/`CHLEB`/`WEKA` (gate `X <= -10`):
  `PRZED - 1`, `X := X + 10`, message, energy `+8/+12/+16/+20/+26/+34` capped
  to MAXE. `MBUTELKA`: `MANA + 30` capped to MAXMANA. `BIGOS`: +20%.
- `ZNISZCZ PRZEPUSTKA` (`PRZEPUSTKA < -1`, Longint): message, `PRZEPUSTKA + 10`,
  `PRZED + 1`. `PATRZ PRZEPUSTKA`: 7-line pass box (diacritic `questów`).
- `UZYJ KASETA`: info message, no gate. `UZYJ LISTEK`: info message (`X <= -10`).
- `UZYJ KOMPLET` (`KOMPLET <= -10 and JAKIEUB = ''`): `PRO + 7`, `CIALO := 1`,
  `JAKIEUB := 'SYF'`; `ODLORZ KOMPLET` (`JAKIEUB = 'SYF'`) reverses.
- `UZYJ GARNITUR` (same gate): `CIALO := 1`, `ILOSC + 1`, `PRO + 10`,
  `FUKSROLL + 15`, `JAKIEUB := 'GARNITUR'`; `ODLORZ GARNITUR` reverses.
- `UZYJ PIGULKA` (`PIGULKA <= -10`): message, `PIGULKA + 10`, then a full
  `POTWORY` re-roll (time travel = new monster layout), then `MAD` tiers:
  `< 10` → `MAXE - 1`, `ENERGIA := 1`, `KUNSZT - 50`; `> 9 and < 16` →
  `ENERGIA - 40` clamped to `>= 1`, `KUNSZT - 30`; `> 15` → no penalty.

### PORT (`use_item` game.c ~1140-1336, `unequip_item` 1364-1412,
`destroy_item` 1414-1431)

All messages, the food/heart/bottle effect table, and the pipe (kept on use)
are 1:1 (`restore_energy`/`restore_mana` cap exactly like MAXE/MAXMANA). The
`MAD < 10` penalty matches the port's `wisdom < 10` branch exactly
(`maximum_energy - 1`, `energy = 1`, `experience - 50`). Differences:

- The transport pill consumes and prints but never calls
  `game_regenerate_encounters` (that runs on init and on death only) — the
  original's `POTWORY` re-roll after going to the past is missing.
- Wearing SYF/GARNITUR sets the port's `state->equipped_clothing` and relies on
  the item definitions' armour values; the original's mutable
  `PRO`/`CIALO`/`ILOSC`/`FUKSROLL` stats (including `FUKSROLL + 15` for the
  spiked suit) have no analog — same family of deviation as the small-shield
  block (entry S).
- `ZNISZCZ PRZEPUSTKA`: the original bumps `PRZED + 1` (its carried-count
  model); the port decrements the pass quantity and recomputes
  `quest_passage_open`. `PATRZ PRZEPUSTKA` is not part of the port's use
  dispatcher (the pass's use action returns failed; viewing is handled
  elsewhere).
- The port adds `ITEM_BEER` (an extra consumable not present in the original
  UZYWANIE branch list).

---

## Confirmed 1:1 (checked, no deviation)

- Arena N/S/E/W edge table (cells 33-57, entrance 17/32) + "EXIT" texts.
- Quest-master prices/counters and type rewards (200/100/50; counts
  75/200/200; rewards 100/250/425).
- Death penalty: `KUNSZT −= 250 − Random(50) + 5·Level` (img 0x37DC..0x3811).
- Death sequence (PRZEDM.SMIERC, PRZEDM.PAS:192-208, TPU 0x0141..0x0277):
  six verbatim lines, `ENERGIA := MAXE`, `KUNSZT −= 250 − Random(50) +
  5·POZIOM`, quest progress 50/200 on type 1/>1, `POTWORY` regeneration and
  city respawn — matches `resolve_player_death` (game.c 2377-2409) 1:1 (the
  port's experience arithmetic is the same expression in 64-bit). The original
  also does `MIECHO := 20`, sets `wpisz := 'PAMIETAJ'`, saves, and pauses on
  `ReadLn` — flow details the port folds into its own death/save handling.
- BLUSZCZ plant flavour: all 12 plant/Duncan lines verbatim (incl. trailing
  spaces in the STOKROTKA and JEZYNA texts), relocated to the actor-description
  LOOK table (world.c 1275-1298) exactly like ULSKLEPIKOWA.
- KTO arena-crowd list: all 28 crowd lines verbatim (incl. `"POMYLONE MISIE"`
  inner quotes and the trailing spaces on BOA/WOJOWNIK) in the actor-description
  table (world.c 1160-1230) — same relocation as BLUSZCZ.
- BRANIE take/drop handler: all 10 messages and side-effects match
  `take_item`/`drop_item` (game.c 1036-1114) 1:1 — DYPLOM `MAXE ±5`, FAJKA
  `MAD +1` (gated `< MAXMAD`) / `-1`, `-10` carried sentinel vs `MIECHO2`
  pickup gate. The port's countable-quantity storage (entry F) replaces
  `PRZED` bookkeeping and the sentinel values, and it additionally refuses to
  drop an equipped OLD SWORD / SMALL SHIELD.
- UZYWANIE use-item dispatcher: every message is verbatim (incl. the trailing
  space after `SPRAWIL ZE `, the `SMIEC . S.Z -8 MAXE +5 ZRE +1 `/`LISTEK JEST
  TYPU SMIEC MAX PRZEDMIOTOW + 3 ` lines and the `questów` diacritic); the
  food/heart/bottle effect table (energy/mana bumps with MAXE/MAXMANA caps) and
  the three MAD skill tiers on the transport pill match `use_item`/`destroy_item`
  (game.c 1140-1431) exactly.
- TRENUJ costs 3/2/3 PRAKTYK with gates >2/>1/>2.
- Monster stat tiers and loot rolls in the fight launchers.
- Food / mana percentages (PACZEK +8 ... WEKA +34, beer +10E/+10M,
  small mana bottle +30, capped at max).
- POROWNANIE oracle formula components (Sila + Zrecznosc-tier + PAR/KOP
  bonuses); advice-branch thresholds 1:1 except the basic/street middle band —
  see entry P.
- Flee (ZWIEJ): three-step mana economy (attempt `MANA −= Random(2)+2`, gate
  `MANA > 14`, commit `MANA −= 15`) and success exactly `Random(100) <=
  Uciekanie` with KUNSZT −= 20 (img 0x17F55..0x1800B).
- Arena "3 LEVEL" placard is flavour only: no level gate on attacking in the
  original or the port. Every `POZIOM [0x25C]` read is display (`JESTES NA
  N-tym LEVELU`), the level-up routine, or kick damage.
- Concert district numbering matches: 61-66 crowd, 67 piwiarnia, 68 estrada,
  69-72 scena, LIROY near 73 (port `original_room()`, game.c 2693-2706); 83
  PIERDUT-trees side-west is ROOM_FOREST, 84 the overgrown krzaki route to
  domek/grota (game.c 2713-2714, world.c 592/609). No port deviation **in the
  numbering**. The crowd *spawn set* differs slightly: original DZIECKO uses
  `Random(7)+0x3C` re-rolling `≤0x3C` → rooms 61-66 (6 candidates, never 67);
  the port's `concert_spawn_rooms[]` (game.c 51-60) has 8 entries and DZIECKO
  may land in `ROOM_BEER_HALL` (67, piwiarnia) as a 7th candidate. Minor, so it
  is logged in the anchors row, not as a numbered deviation.

---

## Source anchors (quick reference)

| item | original | port |
|---|---|---|
| flee | img 0x17F55..0x1800B | game.c 2145-2173 (try_flee) |
| save | SAVE-FIELD-MAP.txt / wczytaj img 0x7D80; f18 Forsa raw=coins×wisdom (@LMul img 0x2E0F..0x2E25, @LDiv img 0x7FA4..0x7FBB) | persistence.c 43-105 |
| quest turn-in | img 0x1276B..0x127C4 | game.c 3471-3513 |
| Kaseta drop | PRZEDM.KASETAZYSK / img 0x15908..0x1598F | game.c 1527-1533, 1580-1586, 1607-1612 |
| difficulty rewards | PRZEDM.SLABO..BTRUDNO / img 0x13839..0x140FF | enemies.c 9-25; game.c 1760-1792, 1909-1940 |
| dog rewards | PRZEDM.WALKAPIES / img 0x12A16..0x12AC9 | enemies.c 31-32; game.c 1794-1802 (dog anchors), 1941-1957; try_flee 2145-2166 |
| stage fights | PRZEDM.FIGHTSCENA / img 0x1AF97..0x1B094 | game.c 1654-1660, 1934-1957, 2505-2508 |
| Duncan market/quest | PRZEDM.FIGHTBLUSZCZ / TPU 0x0522..0x0A2F (img ≈ 0x1B5B7..0x1BAC3) | game.c 1941, 1958-1959, 3286-3308, 3327-3360, 3405-3417 |
| concert crowd spawn | Room @ img 0x12E54..0x12EC0 (`Random(7)+0x3C`, re-roll ≤0x3C → 61-66) | game.c 51-60, 265-277 |
| comparison oracle | PRZEDM.POROWNANIE / TPU 0x0816..0x12E9 (source 385-472) | game.c 2933-2959 (comparison_score), 2961-3149 (advice), 3151-3237 (resolve/begin) |
| street/dog flavour | PRZEDM.ULSKLEPIKOWA / TPU 0x0070 (source 475-487) | world.c 1227-1246 (actor descriptions) |
| training | PRZEDM.TRAIN / TPU 0x0010 (source 166-189) | game.c 2835-2875 (train_attribute) |
| cmd abbreviations | PRZEDM.KOMENDY / TPU 0x0043..0x016F (source 1560-1570) | parser.c 42-68 (parse_direction) |
| small-shield block | PRZEDM.TARCZA / TPU 0x0022..0x0090 (source 601-608) | game.c 2274-2290 (apply_small_shield) |
| death sequence | PRZEDM.SMIERC / TPU 0x0141..0x0277 (source 192-208) | game.c 2377-2409 (resolve_player_death) |
| plant flavour | PRZEDM.BLUSZCZ / TPU 0x02E3..0x04AC (source 210-223) | world.c 1275-1298 (actor descriptions) |
| colour commands | PRZEDM.PIERDOLY / TPU 0x003B..0x00E1 (source 1111-1122) | none (not ported) |
| crowd list | PRZEDM.KTO / TPU 0x0523..0x093B (source 569-598) | world.c 1160-1230 (actor descriptions) |
| take/drop 5 items | PRZEDM.BRANIE / TPU 0x023F..0x0508 (source 908-963) | game.c 1036-1114 (take_item/drop_item) |
| monster regeneration | PRZEDM.POTWORY / TPU 0x0000..0x05D8 (source 70-164) | game.c 227-294 (game_regenerate_encounters) |
| use-item dispatcher | PRZEDM.UZYWANIE / TPU 0x00D8 (source 965-1108) | game.c 1140-1431 (use_item/unequip_item/destroy_item) |
| armour and shield mitigation | PRZEDM.UZYWANIE 0x0e3d..0x0eaf and 0x0f26..0x0f42; PRZEDM.TARCZA 0x0030..0x0054; PRZEDM.WALKA 0x112a | game.c 2305-2320, 2507-2508, 3739-3757 |
