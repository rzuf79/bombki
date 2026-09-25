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
| 1 | KUNSZT +100 | pass granted (longint [0x21E:0x220] −=10), **LoadCapacity [0x182] +1** |
| 2 | KUNSZT +250 | pass granted, consumes Dyplom, **EnergyMax −5** |
| 3 | KUNSZT +425 | pass granted, consumes Fajka, **PRAKTYK −1**, **LoadCapacity [0x182] −1**, **MadroscCur −1** (removes the pipe's carried +1 wisdom) |

### PORT (sell_shop_item "QUEST", game.c 3471-3513)

Matches the rewards, pass grant (ITEM_QUEST_PASS++), Dyplom consumption,
`maximum_energy −= 5` (type 2), `practices −−` and the wisdom mirror
`apply_carried_item_effect(PIPE, -1)` (type 3). **Omitted: the LoadCapacity
±1 bumps** for types 1 and 3.

### Comments

**Non-actionable.** The `LoadCapacity [0x182]` ±1 bumps are carried-item
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
of the original `MIECHO <> 10000` guard, although current callers are combat-loot
paths. `PRZED += 1` is not separately actionable because carried count is derived
from quantities under the deliberate item model in section F.

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
- Flee (ZWIEJ): three-step mana economy (attempt `MANA −= Random(2)+2`, gate
  `MANA > 14`, commit `MANA −= 15`) and success exactly `Random(100) <=
  Uciekanie` with KUNSZT −= 20 (img 0x17F55..0x1800B).
- Arena "3 LEVEL" placard is flavour only: no level gate on attacking in the
  original or the port. Every `POZIOM [0x25C]` read is display (`JESTES NA
  N-tym LEVELU`), the level-up routine, or kick damage.
- Concert district numbering matches: 61-66 crowd, 67 piwiarnia, 68 estrada,
  69-72 scena, LIROY near 73 (port `original_room()`, game.c 2693-2706); 83
  PIERDUT-trees side-west is ROOM_FOREST, 84 the overgrown krzaki route to
  domek/grota (game.c 2713-2714, world.c 592/609). No port deviation.

---

## Source anchors (quick reference)

| item | original | port |
|---|---|---|
| flee | img 0x17F55..0x1800B | game.c 2145-2173 (try_flee) |
| save | SAVE-FIELD-MAP.txt / wczytaj img 0x7D80; f18 Forsa raw=coins×wisdom (@LMul img 0x2E0F..0x2E25, @LDiv img 0x7FA4..0x7FBB) | persistence.c 43-105 |
| quest turn-in | img 0x1276B..0x127C4 | game.c 3471-3513 |
| Kaseta drop | PRZEDM.KASETAZYSK / img 0x15908..0x1598F | game.c 1527-1533, 1580-1586, 1607-1612 |
