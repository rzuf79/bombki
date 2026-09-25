# C-PORT vs ORIGINAL — discrepancy report (human-readable)

Audit date: 2026-09-24. Source of truth: the original x86-16 disassembly
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
|---|---|---|---|
| A | CWICZ training formulas | PORT-DEVIATION | major |
| B | Flee (ZWIEJ) resolve + cost | PORT-DEVIATION | moderate |
| C | Max-stat field offsets | DOSSIER-ERROR | minor |
| D | Save-file format | PORT-DEVIATION | moderate |
| E | Forsa / Madrosc wealth scaling | PORT-DEVIATION | moderate |
| F | Quest turn-in side effects | PORT-DEVIATION | moderate |
| G | Arena "3 LEVEL" placard | (no gate either side) | minor |
| H | Room-number flavour nits | ORIGINAL clarifications | minor |
| I | Monster kill rewards (PACZEK / SERCE) | RESOLVED (fix/mrowka-paczek-drop) | major |
| J | Item storage: countable quantities vs bool sentinels | PORT-DEVIATION (deliberate) | major |

---

## A. CWICZ training formulas (major, port deviation)

### What the ORIGINAL does

The six `CWICZ <skill>` commands live in the training block img
0x27D5..0x2B73. ALL SIX key their gates **and** their formulas on
**MadroscCur [0x18C]** (and, for two of them, ZrecznoscCur [0x190]). Each
`CWICZ` costs exactly **1 PRAKTYK [0x194]** (`dec [0x194]` each time). Gates
and formulas, straight from the disasm:

| cmd | strcmp @img | gates (all must pass) | improvement | cap |
|---|---|---|---|---|
| CWICZ KOPAC    | 0x27DA | MAD>0xA && **SIL>0xB** && PRAKTYK>0 | KOPANIE [0x1C8] += MAD | — (no cap in block) |
| CWICZ UCIEKAC  | 0x2863 | MAD>0xA && ZRE>0xA && sk<85 && PRAKTYK>0 | UCIEKANIE [0x1CE] += MAD+ZRE−5 | 0x55 (85) |
| CWICZ POWROT   | 0x2921 | MAD>0x11 && sk<90 && PRAKTYK>0 | POWRACANIE [0x78] += **2·MAD−3** | 0x5A (90) |
| CWICZ PAROWANIE| 0x29B2 | MAD>0xF && ZRE>0xB && sk<90 && PRAKTYK>0 | PAROWANIE [0x1C6] += MAD+ZRE−14 | 0x5A (90) |
| CWICZ POROWNANIE | 0x2A4F | MAD>0xB && sk<90 && PRAKTYK>0 | POROWNYWANIE [0x25D] += **3·MAD−9** | 0x5A (90) |
| CWICZ POTRAWKI | 0x2AEC | MAD>0x12 && sk<90 && PRAKTYK>0 | POTRAWKI/Talent [0x258] += MAD+1 | 0x5A (90) |

Evidence bytes: POWROT is `mov ax,[0x18c]; shl ax,1; add ax,[0x78]; sub ax,3`
(0x2945..0x294E) — the "2·" comes from the real `shl`. POROWNANIE is
`3·MAD` via `shl + add` then `sub 9` stored to a byte (0x2A76..0x2A8A).

### What the PORT does (game.c 2543..2679)

The port implements all six handlers and wires the full `CWICZ` menu
(`practice_*` calls at game.c 3925-3942). Each keys gates **and** formulas on
**strength** instead of wisdom:

| port fn | port gates | port improvement | cap |
|---|---|---|---|
| practice_kicking  (2571) | strength>10 && **dexterity>11** | kick += strength | — |
| practice_fleeing  (2543) | strength>10 && dexterity>10 | flee += strength+dexterity−5 | 85 |
| practice_returning(2661) | strength>17 | return += 2·strength−3 | 90 |
| practice_parrying (2615) | strength>15 && dexterity>11 | parry += strength+dexterity−14 | 90 |
| practice_comparison(2592) | strength>11 | comparison += 3·strength−9 | 90 |
| practice_cooking  (2640) | strength>18 | cooking += strength+1 | 90 |

### Comments

- The **single systematic deviation** is `MadroscCur → strength`. Formulas,
  caps and most gate numbers are otherwise faithful (even the subtle `−5`,
  `−14`, `−9` constants match).
- Watch the two oddballs: original KOPAC gates `SIL>0xB` but the port gates
  `dexterity>11` there; original KOPAC has **no cap** and the port agrees.
- The skill poster/`ZDOLNOSCI` printers in the port (game.c 894-919, 2783-2806)
  also advertise abilities off `strength`, duplicating the same swap.
- Gameplay impact: a low-wisdom/high-strength character overtakes the original
  training curve (cheaper thresholds, bigger gains), and vice versa.
- **Correction of the earlier register:** the previous `INTEGRATED-FIELD-MAP.md`
  entry A claimed the port "drops CWICZ UCIEKANIE and KOPANIE (panel lists 4,
  not 6)" — stale; the current port has all six. It also listed POWROT as
  `+MAD` (real: `+2·MAD−3`) and omitted the `−5` of UCIEKAC — both fixed above.

---

## B. Flee / ZWIEJ mechanics (moderate)

### ORIGINAL (img 0x17F55..0x1800B)

Attempt **drains 2-3 Mana before anything else** (`Mana −= Random(2)+2`).
Run only when all three true: `Uciekanie [0x1CE] > 0`, `Energy < [0x1D0]`
(flee threshold), `ManaCur > 14`. Commit: `Mana −= 15`, then **success iff
`Random(100) <= Uciekanie`** → `FleeFlag [0x1D2] = 1` and `KUNSZT [0x1D4]
−= 20` with the "WSTYD !!! UCIEKLES Z POLA BITWY..." text (img 0x17FCD).

### PORT (try_flee, game.c 2167-2197)

Gates `flee_skill > 0 && (forced || energy < flee_energy_threshold)` — matches
the original gate shape. But:

- success roll = `random_below(100) > recovered_combat_chance(state) − 15`
  → the dice use the **generic dex-based combat chance**, not the
  **Uciekanie skill**;
- **no mana cost** at all (no 2-3 attempt drain, no 15 commit);
- applies the 20 KUNSZT loss and exit-on-success correctly.

### Comments

Half-faithful. The "costs 15 Mana" reading in older notes was incomplete but
not wrong — the original really does cost mana three times over (attempt drain,
commit, plus a mana>14 prerequisite). The port keeps the KUNSZT penalty but
replaces the entire mana economy with a dex roll. Whenever the docs cite a
"three-step mana flee", that is the original truth.

---

## C. Max-stat field offsets (dossier error, port untouched)

### ORIGINAL

Char-select init img 0x1748..0x18B9 writes the maxima in this order:
**0x196 = MadroscMax, 0x198 = SilaMax, 0x19A = ZrecznoscMax**.

### The error

The recovered "LEVELING" dossier swapped them (`MAXSIL=0x196`,
`MAXMAD=0x198`, `MAXZRE=0x19A`). Anyone using the dossier to decode the
original save layout would mislabel three fields. The port has its own
`maximum_strength/dexterity/wisdom` fields and is not affected.

### Comments

Fields should be corrected in the dossier; the save-field map
(`INTEGRATED-FIELD-MAP.md` field table) already has them right.

---

## D. Save-file format (moderate)

### ORIGINAL

`PLIKI.TPU`-style text file, **unlabelled flat sequence** — 80 numeric lines
+ the player name, in the exact `save()` write order (WriteLn scalar, emission
table in `disasm\procs\SAVE-FIELD-MAP.txt`). Inverse transforms live in
`wczytaj()` (img 0x7D80..0x85FF).

### PORT (persistence.c)

Self-describing `key=value` lines under a versioned header
(`SAVE_HEADER_V16`, fields like `room=`, `coins=`, `flee_skill=`...,
persistence.c 43-105), with import tolerating v1-15.

### Comments

**Not byte-compatible** — an original save cannot be fed to the port or vice
versa. The port schema is strictly a superset/invention for portability. This
is a deliberate port decision, but it means any "ported save" is a re-serialised
profile, never the original file.

---

## E. Forsa / wealth scaling (moderate)

### ORIGINAL

On load, `wczytaj()` re-scales the persisted 32-bit wealth longint
[0x21A:0x21C] with **`Forsa := Forsa div MadroscCur`** (img 0x7FA4..0x7FBB;
the `shl/shrd/idiv` fast-path + 16-bit restoring division = TP7 RTL `@LDiv`
at 0x1C71:0x7FA). The sign-in summary in `save()` prints the **product**
`Forsa × Madrosc` (img 0x2E0F..0x2E22, RTL `@LMul` 0x1C71:0x7BD). So an
original save's displayed wealth is `raw ÷ wisdom` at load time.

### PORT

Stores/loads a plain integer `coins` with no wisdom scaling. The port would
need `coins = frac(coins / wisdom)` on load (and `coins * wisdom` in any
display) to reproduce the original economy.

### Comments

Wealth behaves differently: the original effectively taxes your coins by your
current wisdom on every load, and the "sign-in" line shows the inflated
product. The port keeps raw coins — friendlier, but not faithful. (This is the
same "Forsa div Madrosc" item already logged in README §17.)

---

## F. Quest turn-in side effects (moderate)

### ORIGINAL (img 0x1276B..0x127C4 region)

| type | reward | side effects |
|---|---|---|
| 1 | KUNSZT +100 | pass granted (longint [0x21E:0x220] −=10), **LoadCapacity [0x182] +1** |
| 2 | KUNSZT +250 | pass granted, consumes Dyplom, **EnergyMax −5** |
| 3 | KUNSZT +425 | pass granted, consumes Fajka, **PRAKTYK −1**, **LoadCapacity [0x182] −1**, **MadroscCur −1** (removes the pipe's carried +1 wisdom) |

### PORT (sell_shop_item "QUEST", game.c 3471-3513)

Matches the rewards, pass grant (ITEM_QUEST_PASS++), Dyplom consumption,
`maximum_energy −= 5` (type 2), `practices −−` and the wisdom mirror
`apply_carried_item_effect(PIPE, -1)` (type 3). **Omitted: the LoadCapacity
±1 bumps** for types 1 and 3.

### Comments

The port already exercises the subtlest effect (wisdom −1 via the pipe's
carried bonus). Only backpack capacity (LoadCapacity [0x182]) is left
un-affected; minor unless the player is relying on the type-1 bonus to lift
overburden.

---

## G. Arena "3 LEVEL" placard (no gate)

Arena grids advertise "3 LEVEL" prose. There is no actual level gate on arena
operations in the original or the port — flavour text only. No action.

---

## H. Room-number flavour nits (minor)

- 83 is a BLUSZCZ / PIERDUT-trees room; 84 is the overgrown-krzaki route to
  the domek/grota — the earlier doc blurbs said a plain "forest". The map
  (`RECONSTRUCTED\WORLD-MAP.md`) now reflects the real connectivity.
- The concert district is 67 piwiarnia / 68 estrada / 69-72 scena (LIROY near
  73), not a homogeneous "61-72". World map updated.

---

## I. Monster kill rewards — PACZEK wired as SERCE (major)

### What the ORIGINAL does

Every kill launcher pays **coins** (`Random(N)` -> Forsa longint [0x21A:0x21C],
"WYCIAGASZ N MONET Z CIALA"). On top of the coins exactly two item drops exist:

1. **PACZEK — only `ZABIJ MROWKA`** (SLABO launcher tail, img 0x138B9..0x1390D):
   gated by the command strcmp "ZABIJ MROWKA", then `Random(10) < 7` (70%) and
   `[0x1A0] != -10` (you don't already carry one) -> prints
   "WYCIAGASZ PACZEK Z CIALA MROWKI", sets `[0x1A0] = 0xFFF6 (-10)`, and
   `LoadCapacity [0x182] += 1`. **No heart on the Mrowka.**
2. **SERCE — every other launcher** (MNIEJSLABO 0x13947, SREDNIO 0x13A60,
   TRUDNO 0x13B82, VEASY..BTRUDNO, and the dog/street launcher 0x12A16):
   only while `[0x186] == 0` (you have never owned the one-and-only heart),
   then `Random(20) < K` (verified: K=5 MNIEJSLABO @0x139E3, K=7 SREDNIO
   @0x13B05 = 35%), and `[0x186] != -10` -> "WYCIAGASZ SERCE Z CIALA TRUPA",
   `[0x186] = 0xFFF6`, `LoadCapacity += 1`.

Chances by tier (disasm-verified operands): MNIEJSLABO `R(20)<5` (25%),
SREDNIO `R(20)<7` (35%), TRUDNO 35%, BTRUDNO 25%, VEASY/EASY/NEASY `R(20)<4`
(20%), dogs 25%.

Storage model: heart and paczek are **sentinel single slots** — 0xFFF6 (-10) =
carrying, 0 = consumed. Eating PACZEK does `[0x1A0] += 0xA` and
`LoadCapacity -= 1` (img 0x19095..0x190A2); pickup prints the item only when
the slot is exactly -10. You hold at most one paczek and one heart.

### What the PORT does (enemies.c 9-43, game.c 1805-1820)

- **RESOLVED** (`fix/mrowka-paczek-drop` / `688a4d4`): SLABO `bloody_heart` is
  now `{0,0}` (no heart) and `resolve_ordinary_enemy_rewards` special-cases
  `WORLD_ACTOR_MROWKA` to a 70% `R(10)<7` PACZEK drop ("WYCIAGASZ PACZEK Z
  CIALA MROWKI") that increments ITEM_DOUGHNUT. Every other SLABO kill now pays
  coins `R(3)=0..2` only.
- Heart chances for the other tiers stay faithful ({5,20},{7,20},{4,20},
  {5,20}). The original's "never owned / already carrying" give-once gates are
  gone by the countable-items policy (see J below).
- **Omitted: `LoadCapacity` bumps** on heart/paczek acquisition (and the -1 on
  eating) — deliberate, see J.

### Comments

Status: RESOLVED for the PACZEK/SERCE mis-attribution. Storage is now uniformly
countable (§J): ITEM_DOUGHNUT and ITEM_BLOODY_HEART are stackable quantities and
no give-once gate remains for any monster drop.

**Shared-launcher note (verified):** PRZEDM_SLABO (img 0x13839) is the fight
used by ALL weak monsters — the arena-pen dispatcher routes
`ZABIJ KORNIK/MUCHA/SLIMAK/ZUK/KARALUCH/MROWKA/PAJAK` to the same
`call 0x13839` (0x19CBB..0x19DE8) and the Staruch cage fight also calls it
(0x0D712). Yet the paczek branch is gated on the typed command
(`strcmp(cmd,"ZABIJ MROWKA")` @ 0x138BE), so the item is STRICTLY Mrowka-only:
every other SLABO kill pays just coins `R(3)=0..2`. The port therefore errs for
ALL SLABO actors: it rolls `{7,10}` as a heart for KORNIK/MUCHA/BAKTERIA/SLIMAK/
ZUK/KARALUCH/PAJAK/STARUCH too, where the original drops nothing edible at all.

---

## J. Item storage: countable quantities, not bool sentinels (major, deliberate)

### What the ORIGINAL does

World-location items are byte slots holding `0xFFF6` (-10 = carrying) or `0`
(consumed). Gates treat the slot like a bool "owned or not": monster drops
require `!= -10` (the heart additionally that `[0x186]` never left the -10
state), and `LoadCapacity [0x182]` is +/-1 on pick-up/drop of each sentinel
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
- `LoadCapacity` bumps (+1 heart/paczek, -1 eating) remain unimplemented —
  capacity is dex-derived in the port (game.c `game_carrying_capacity`).

### Why / how to audit

The pascal `-10` sentinel is an x86-16 memory/UI shortcut, not a design
constraint the port wants to reproduce; the project chose a uniform, predictable
inventory model. Do **not** re-flag quantity-stacking or lack of the give-once
gates as a PORT-DEVIATION bug; this section is the standing record of the intent.

---

## Confirmed 1:1 (checked, no deviation)

- Arena N/S/E/W edge table (cells 33-57, entrance 17/32) + "EXIT" texts.
- Quest-master prices/counters and type rewards (200/100/50; counts
  75/200/200; rewards 100/250/425).
- Death penalty: `KUNSZT −= 250 − Random(50) + 5·Level` (img 0x37DC..0x3811).
- TRENUJ costs 3/2/3 PRAKTYK with gates >2/>1/>2.
- Monster stat tiers and loot rolls in the fight launchers.
- Food / mana percentages (PACZEK +8 ... WEKA +34, beer +10E/+10M,
  small mana bottle +30, capped at max).
- POROWNANIE oracle formula components (Sila + Zrecznosc-tier + PAR/KOP
  bonuses).

---

## Source anchors (quick reference)

| item | original | port |
|---|---|---|
| CWICZ training | annotated-BOMBKI.asm img 0x27D5..0x2B73 | game.c 2543-2679, 3925-3942 |
| flee | img 0x17F55..0x1800B | game.c 2167-2197 (try_flee) |
| max-stat init | img 0x1748..0x18B9 | — |
| save | SAVE-FIELD-MAP.txt / wczytaj img 0x7D80 | persistence.c 43-105 |
| forsza scaling | img 0x7FA4..0x7FBB, 0x2E0F..0x2E22 | game.c coins ops |
| quest turn-in | img 0x1276B..0x127C4 | game.c 3471-3513 |
| kill rewards | launchers img 0x13839..0x14016 (tails) | enemies.c 9-43 + game.c 1802-1862 |