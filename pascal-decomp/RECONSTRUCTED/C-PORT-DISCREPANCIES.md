# C-PORT vs ORIGINAL — discrepancy report (human-readable)

Audit date: 2026-09-24. Last cleaned: 2026-09-25 (A CWICZ, C max-stat
dossier, I kill rewards removed — all resolved). Source of truth: the
original x86-16 disassembly
(`RECONSTRUCTED\disasm\annotated-BOMBKI.asm`), cross-checked against the TP7
save/load reconstructions. The "port" is `..\..\c-port\` relative to this file
(e.g. `src\game.c`, `src\persistence.c`), and the disasm is
`RECONSTRUCTED\disasm\annotated-BOMBKI.asm` under `pascal-decomp\`. Every
formula below was re-derived from the raw instructions in this pass (not taken
from earlier notes).

Status notes (2026-09-25): A and C were resolved by the merged
`fix/SIL-vs-MAD-mixup` swap correction; I was resolved on
`fix/mrowka-paczek-drop` (MROWKA-specific PACZEK, SLABO heart roll dropped).

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
| B | Flee (ZWIEJ) resolve + cost | PORT-DEVIATION | moderate |
| D | Save-file format | PORT-DEVIATION (deliberate) | moderate |
| E | Forsa / Madrosc wealth scaling | PORT-DEVIATION (deliberate) | moderate |
| F | Quest turn-in side effects | PORT-DEVIATION | moderate |
| G | Arena "3 LEVEL" placard | (no gate either side) | minor |
| H | Room-number flavour nits | ORIGINAL clarifications | minor |
| J | Item storage: countable quantities vs bool sentinels | PORT-DEVIATION (deliberate) | major |

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
| flee | img 0x17F55..0x1800B | game.c 2167-2197 (try_flee) |
| save | SAVE-FIELD-MAP.txt / wczytaj img 0x7D80 | persistence.c 43-105 |
| forsza scaling | img 0x7FA4..0x7FBB, 0x2E0F..0x2E22 | game.c coins ops |
| quest turn-in | img 0x1276B..0x127C4 | game.c 3471-3513 |
