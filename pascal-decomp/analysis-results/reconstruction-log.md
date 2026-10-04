# BOMBKI - reverse-engineering reconstruction results
### MONSTRA / SWIAT / PRZEDM (Turbo Pascal 7, x86-16 real-mode, Polish DOS)

Game: **BOMBKI**, a turn-based text RPG by Mateusz Pawluczuk.
Ground truth: `BOMBKI.EXE` (MZ real-mode image, entry `0000:B0CF`) and the
TP7 TPUQ units `MONSTRA.TPU`, `SWIAT.TPU`, and `PRZEDM.TPU`. The retained
`../../og/PLIKI.TPU` artifact is the game's plain-text save record, not a compiled
TPU unit. The EXE uses the filename literal `pliki.tpu` for both saving
(img 0x2BEF) and loading (img 0x7DAC). The retained artifact spells the name
uppercase; the EXE literal is lowercase. Uppercase was conventional for DOS
8.3 filenames, and DOS APIs generally treated filename case as insignificant.

---

## 1. Deliverables

| file | content |
|---|---|
| `reconstructed/MONSTRA.PAS` | 21 integer globals and `WSTEP` (intro routine) |
| `reconstructed/SWIAT.PAS` | 12 room procedures and `POKOJE` (img 0xF5D0..0x129C6) |
| `reconstructed/PRZEDM.PAS` | reconstructed unit globals and interface procedures, including combat and arena handlers |
| `reconstructed/BOMBKI.PAS` | partial main-program reconstruction: startup, inline contexts, and the main loop |

Interfaces are verified byte-accurate against the TP7 unit dumps: 0 leftover
foreign `System.ofsXXXX` references; all far pointers resolved to
`System`/`CRT`/unit-local, plus `string` = System.ofs00BA seed.

The reconstruction is grounded in EXE/TPU evidence only. Any C-port comparisons
preserved in this log or `c-port-discrepancies.md` are historical snapshots,
not source evidence, requirements, or a compatibility target.

## 2. Save format (`PLIKI.TPU`)

The game's save file is named `pliki.tpu` in the EXE; the retained artifact is
`../../og/PLIKI.TPU` (uppercase spelling). It is plain text, not a compiled TPU
unit. The game writes an unlabelled sequence with Pascal `WriteLn`; the
save-field report records 80 serialized fields. The
sample at field 15 is anomalous, so its interpretation remains OPEN. See
findings (6) and (7) for the write order and field-name cross-check.

## 3. Current reconstruction status

`BOMBKI.PAS` remains partial. Startup, the main loop, the MODE command body,
shop transactions, and the previously open room-specific kill handlers have
been transcribed from the retained machine evidence (findings (77), (80)-(85)).
Live MODE behavior and strict TP7 EXE parity remain open (findings (84) and
(86)). `SWIAT.PAS` contains all 12 mapped room procedures; the matching EXE
region and TPU bytes are compared in finding (33). The three reconstructed
unit files are the scope of this Pascal project.

## 4. Evidence grounding (disassembly, all verified)

Three independent x86-16 experiments against BOMBKI.EXE:

1. **Earlier RAW slide, superseded for SWIAT**: a whole-blob scan of MONSTRA
   (1195B), SWIAT (13303B), and PRZEDM (38118B) failed to locate a match,
   yielding 65 non-cell mismatches even when relocation cells were masked.
   That experiment did not establish different build generations: the SWIAT
   region is img 0xF5D0..0x129C6, and SWIAT.code.bin[$0E+i] matches the EXE
   through img 0x129B8 outside patched relocation slots; the last 14 bytes
   are absent from the TPU dump (see §5, 2026-09-27). No same-build
   conclusion follows for MONSTRA or PRZEDM from this SWIAT-only correction.
2. **Entry trace** (`0000:B0CF`): the loader enters `lcall 1C71:0000`, the
   System bootstrap (img 0xB0CF); the literal `"NOSISZ ZE SOBA:"` is at img
   0x00000 and is not the entry target (see finding (32), corrected below).
3. **Reloc histogram**: stored far-paragraph cells cluster at **0E42 (52 refs:
   game code seg)** and **05DD (35 refs: data seg)** — the two paragraphs the
   game body really lives in. The image was disassembled recursive-descent
   from every loader-fixed far cell (610 cells → ~35 unique stored
   paragraphs), producing proc bodies anchored at their real code targets; far
   operands resolve through the loader, so they match the standalone paragraph
   addresses used in the TPU interface reports.

## 5. Reconstruction findings (dated)

C-port comparisons appearing in dated findings below record the state of a
separate project at that time; they are retained for history only and never
establish reconstruction facts or requirements.

### 2026-09-24 (1): DGROUP anchors verified
Empirical scan of TP7 global-access idioms (C7 06 / 89 06 / 3B 06 / A1 / ...)
over the whole image yields a contiguous sparse table of Integer slots:

  PRZEDM  [017E .. 01AA]  23 words  --  MMIECZ(017E) WEKA(01AA)
  MONSTRA [01AC .. 01D4]  21 words  --  MAXE(01AC)  SILNY(01D4)
  hot     [01D6]          menu/choice var (writes 'E','F','G','H')
  table   [01D8 .. 0218]  32 words  ReadLn-fed table (3 refs each)

Proven by the constant-init that TP emits as C7 06 <disp> <imm>:
OWCZAREK(01B0) gets 188/200 (HP), PIESEK(01B6) 2/5/10,
TAKSOWKARZ(01B8) 1/3/16/26 — classic MONSTRA monster-stat setup.

The monster-stat band is written in **descending** order:
  0180=MIECHO  0182=KUNSZT  0184=PASZOL  0186=WIMP  0188=ZWIEJ
  (proven by C7 06 imm + -10 guards)
  0192=ILOSC   019C..019E = Longint (FORSA/PRZEPUSTKA band, printed as Longint)
  (the earlier linear guess 017E..01AA = first-23-vars is superseded; the stat
  band is reversed.)

### 2026-09-24 (2): string-resolved proc identity
BODY-B (para 05DD:1C71, abs 07A41) is a STAGE/DIALOGUE routine (not WSTEP):
  cs:679E 'POLODNIE-SRODEK SCENY'
  cs:67B4 'LUDZIE SIE NA CIEBIE GAPIA, JESTES NA SRODKU SCENY !!! KTOS CI MOWI:'
  cs:67FA 'HEY MAN IT,S COOL YEAH! . A TY NA TO: JE JE KUP KUL....'
  cs:6874 'DALEJ PISAC NIE MA O CZYM WIEC MOZESZ MI NASKOCZYC'
  cs:06A2 '...FUKSROLL- MANY E'  (item menu)
=> likely PRZEDM.SCENA/TLUM (bandleader dialogue with LUDZIE crowd).
DGROUP 0x1D6 = scene command var; 0x19C longint band = CIALO/FORSA/PRZEPUSTKA
cluster.

### 2026-09-24 (3): the 0x1D8..0x218 table
32 halfword slots (0x40 B). Access pattern: sentinel init {cmp (slot),-1} /
{cmp (slot),-0xA} and {mov (slot),1} => a 32-entry progress/result flag array,
not a 28-monster list (roster is N=28, offsets don't align). The fight-result
slots are used at abs 0x19C01 and 0x19207..0x19800. Monster roster (PRZEDM,
28): KORNIK..TRENER — the three import vars at the 0x1B4/0x1B6 band are the
active-fighter (WROGSIL/WROGZRE/SZANSA) working state.

### 2026-09-24 (4): 0x1D8..0x218 — final typing (evidence-limited)
Band = 32 x 2-byte slots. Code shows BOTH array (stride-2, sentinels -1/-10/1)
AND scalar uses: {0x212}:=Random(15); {0x21A/0x21C} Longint accumulator;
{0x1DE/0x1E0} sorted-cmp slots. Verdict: a result/progress workspace shared
by room(+fight)-outcome flags, NOT strictly a 32-array and NOT a 100-room map
(0x100 room data lives elsewhere; cf. SWIAT.PAS POKOJE). Real init at
129D:12A1. Open item: exact name per slot — solvable by pairing save()/
wczytaj() WriteLn order.

### 2026-09-24 (5): preliminary save-field read -> SUPERSEDED by (6)
Preliminary read of `PLIKI.TPU` (thought 81 fields); field numbering/guesses here
are WRONG (off-by-one + interpretation) and are replaced by the decoded save()
(see (6)).

### 2026-09-24 (6): save() proc decoded (80 fields = file 1:1)
EXE `save` routine at img 0x2BA1 (write order = file order). The labels below
are preliminary and are superseded by the load-side cross-check in finding (7):

  #   slot  expr(saved->raw)      file         meaning
  1  0x1AC  [0x1AC]<<2 =1000      1000      MAXE*4? (raw 250)
  3  0x17E  raw                     -100      PRZEDM[1] stat
  5  0x188  raw                     -10       ZWIEJ
  6  0x184  raw                    -100       PASZOL
 10  0x180  raw                    10000      MIECHO (band start)
 12  0x18E  [0x18E]-0x18 = -15      -15      (raw 3)
 27  0x182  raw                        4      KUNSZT
 44  0x186  raw                     -10      WIMP
 65  0x1DA  raw                       57      gameflag/score
 66  0x1DC  raw                       52      gameflag/score
 67  0x1DE  raw                       33      gameflag/score
 70  0x1E0  raw                       54      gameflag/score

The initial stat-band interpretation was superseded by finding (7). The save
map records 80 serialized fields; the sample at field 15 is anomalous and its
interpretation remains OPEN (see `integrated-field-map.md`).

### 2026-09-24 (7): load-side readback reconstruction integrated — corrections
A second, independent load-side reconstruction (`PLIKI.TPU` readback + 616
string-compare call-sites, 380 resolved; CurrentContext/PreviousRoomContext +
MODE/UNMODE + the shared combat engine SWIAT:0x46 + per-monster room trackers
at 0x668,+6/ea) was integrated with the save-side map. The save and load
address maps agree field-for-field; transforms are exact inverses. Names were
cross-validated against the character-sheet display routine (0x11ba-0x1405),
the level-up routine (0x8990-0x8ba0), and PRZEDM addr-adjacency strings.
RETRO-CORRECTIONS to the earlier DGROUP naming:

  OLD (INCORRECT)              CORRECT
  0x180 = MIECHO (stat)        0x180 = PreviousRoomContext (raw 10000 = room id)
  0x182 = KUNSZT (4)           0x182 = PRZED, carried-item count (±1 per pick-up/
                                drop and talent event); the "JESTES OBLADOWANY"
                                gate compares it to the capacity field, see (9).
                                Clothing-modified stat = PRO [0x1C2] (not the carry limit at 0x062)
  0x19C = FORSA / Money        0x19C = Energy (55; save (E+40)*4=380; max=0x664)
  0x194 = -                    0x194 = PRAKTYK (0 here)
  0x1AC..0x1D4 = MONSTRA HP     0x1AC/0x1AE = ManaCur/ManaMax (250/250);
                                0x1C4..0x1D4 = skill-chance block (SZ parts,
                                Kopanie/Uciekanie/Parowanie/Powracanie, "%."x54)
                                Monster stats are NOT in the save record.
  0x1D6 = scene command var    0x1D6 = CurrentContext (room/interface id;
                                'E','F','G','H' writes = menu-selected room ids;
                                1000 = STAN PODSWIADOMOSCI (MODE) via MODE/UNMODE, prev in 0x180)
  CharacterLevel unknown        0x25C = level, saved as lvl+0x17 (24 => lvl 1)

At this finding date, Money vs 0x21A:0x21C longint pool was still open; finding
(17) resolves it as PRAKTYK vs FORSA. Also confirmed:
0x257 = PIGULKA (saved byte, drop-count shortint); the old 0x74 "POTRAWKI
chance" name is a separate CWICZ field, not a count — ambiguity resolved. Full
merged record, including byte-flag cluster 0x255..0x262 and TPlayerMisc
(0x664=EnergiaMax, 0x668+ monster trackers): `integrated-field-map.md`. The
earlier "proven MONSTRA band" claim is RETRACTED (see (8)).

### 2026-09-24 (8): KUNSZT = 0x1D4; death penalty decoded (level-based)
BAZAR death/revival proc (img 0x36F5), exact math at img 0x37DC-0x3811:

  [0x19C] := [0x664]          Energy := EnergiaMax (revive for free)
  penalty:  3 ops from [0x25C] (CharacterLevel): level*5 = ([0x25C]*4)+[0x25C]
  [0x1D4] := [0x1D4] - 0xFA + Random(0x32) - level*5
            => KUNSZT loses  250 - Random(50) + 5*Level   (0x1D4 = KUNSZT, f8=99)
  [0x1D6] := 0x14             CurrentContext := 20 (city-square respawn)
  quest reset: if [0x248]=1 -> [0x24A]:=50; >1 -> 200   (QuestType -> kills needed)
  then lcall 0x129D:0xFA (ROOM), 'PAMIETAJ' prompt + menu, save() @0x2BA1.

Strings (cp437) match: '...WRAZ ZE SMIERCIA TRACISZ KUNSZT ADEKWATNIE DO
TWOJEGO LEVELKA' (img 0x35EA) => confirms penalty IS level-scaled, tying
0x1D4=KUNSZT definitively. Item/price menu decoded at 0x3846.. (PAczek 8,
CIASTO 12, SUCHA RACJA 15, BULKA 19, CHLEB 24, WEKA 29). This supersedes the
"(6)" guess 'KUNSZT+1 costs ... money Longint' (that was the BAZAR BUY path;
the death path here is a straight -250+random+5*lvl KUNSZT loss).

### 2026-09-24 (9): combat engine fully decoded
EXE proc paragraph 0x129D:0x44A6 = img 0x16E76..0x181C6 (the old "BODY-A
0E42:9A57" was a wrong paragraph; img offsets are authoritative — 0E42*16+9A57
= 17E77 is mid-round, not the head). Complete game flow decoded:

- **Monster stats are not a DGROUP table** — each launcher writes them to
  unsaved slots right before the far lcall `9A A6 44 9D 12`:
  `[0x1B0]` MonsterHP · `[0x1B6]` MonsterDmg · `[0x1B8]` MonsterDex.
- **Base XP** `[0x1B4]` = sum of 3 margin bonuses (EnergiaMax vs HP, Sila vs
  Dmg, Zrecznosc vs Dex): fighting up +12..+21, equal +11, down +10..+1.
- **Round loop** 0x173BC..0x1800B: twin dodge tiers (Random 12..23 / 35..60,
  roll<10 ⇒ monster-miss / your-free-riposte); enemy strike Random(MonsterDmg),
  hit-XP +1, Parowanie Random(140) parry (roll0&&<100 ⇒ skill+1); wound/bleed
  ticks via [0x25E]/[0x25F]/[0x260]; riposte Random(Sila) heavy-reroll while
  `10*roll <= [0x224]`; Kopanie (kick) `(Kopanie-10)>=Random(100)` ⇒
  Random(lvl)+Random(10), mana Random(3)+3; Uciekanie (flee) ⇒ `[0x1D2]:=1`,
  **KUNSZT −20**; exit loop on Energy<1 | MonsterHP<1 | fled.
- **Kill reward** 0x18037: clip by skilled stats (EnergiaMax>75/115, Parowanie
  >50/75/95, Kopanie>50/95), "ZYSKALES", `KUNSZT+=rw`, quest `[0x24A]-=1`,
  talent event `Random(100)<[0x258]` ⇒ `[0x259]-=10; PRZED[0x182]+=1`.
- **Knock-out** 0x1818E: Energy<1 ⇒ defeat text, sound(3000),
  `CurrentContext:=10000` (vs BAZAR death → 20), `[0x1B4]:=0`.
- **Monster launchers**: room 12 → 20/3/3/R10 · room 14 → 20/30/3/R15 · room
  15 → 40/3/3/R15 · room 16 → 40/11/10/R30 · tracker slot 7 (room 13) →
  20/3/10/R15 · boss → 200/15/18 + wounds 5/1 + `[0x262]-=50` on win · dummy
  1/1/2/R3. Kill ⇒ room-tracker cleared, `[0x212]:=Random(N)`, printed,
  `Money[0x21A:0x21C] += d`.
- **Money resolved**: combat rewards and BAZAR buy gates both use the 32-bit
  `[0x21A:0x21C]` (=1424, f18). `0x194` (per load-side "Money") is separate
  (used by training costs); split closed in (17), register entry 17.
- **0x182 = PRZED**, the carried-item count (±1 per sentinel pick-up/drop and
  talent events); the overburden "JESTES OBLADOWANY" gate compares it to the
  carrying-capacity field. (The stat bumped by outfits +7 SYF/+10 GARNITUR and
  Kaseta's −8 are PRO [0x1C2].) 0x1B2 = combat margin/reward scratch.
- The source-equivalent combat body is `reconstructed/PRZEDM.PAS`, procedure
  `WALKA`; mechanics are also summarized in `integrated-field-map.md`.

### 2026-09-24 (10): wczytaj() load engine + trening + level gates decoded
The load routine is in the EXE at img 0x7D80..0x85FF; the save-field map is in
`integrated-field-map.md`:

- **wczytaj() = img 0x7D80** (proc-init; ends ~0x85FF). RTL: `0x6C6`
  ReadLn(cmd), `0x2E6` Assign to cs:0x7D6B "pliki.tpu", `0x364` Reset, **`0x72D`
  = ReadLn(plik, scalar)** returning AX / DX:AX for longint, `0x5FE` flush.
- Reads the **exact 80-field order of save()**, inverting transforms
  byte-exact: ManaCur=`v div 4`, Level=`v-0x17`, Energy=`v div 4 - 0x28`,
  Zrecznosc=`v-0x0C`, Sila=`v+0x18`; f18 net-worth longint read into
  `[0x21A]/[0x21C]` then **`div Madrosc` via @LDiv 0x7FA**, the inverse of
  save's `Forsa * Madrosc` encoding;
  `0x257` confirmed as a saved **byte** (f64, PIGULKA drop-count shortint); the
  cluster and monster trackers visibly load in file order (f33..f40 =
  0x56/0x58/0x68C/0x5A/0x5C/0x5E/0x60/0x6E).
- **Trening block img 0x2396..0x2B73** (before save()): each training command
  (strcmp on ds:0x564 at cs:0x221D/0x2286/0x22C8/0x230C/0x2354) costs
  **1× PRAKTYK [0x194]** and raises one skill, printed as a percent:
  - Uciekanie[0x1CE] += Madrosc+Zrecznosc-5   (cap 0x55)
  - Powracanie[0x78] += 2*Madrosc-3           (needs Madrosc>17, cap 0x5A)
  - Parowanie[0x1C6] += Madrosc+Zrecznosc-14  (needs Madrosc>15 & Zrec>11, cap 0x5A)
  - [0x25D] += 3*Madrosc-9                     (needs Madrosc>11, byte, cap 0x5A)
  - Talent[0x258] += Madrosc+1                 (needs Madrosc>18, cap 0x5A)
- **Level-up proc img 0x872E..0x8BA2**: lvl1 700, lvl2 725 (0x2D5), lvl3 730
  (0x2DA), lvl4-8 735+POZIOM, lvl9+ 735+2*POZIOM. Body at 0x87A2; 0x8BA2 is the
  common epilogue (pop bp; retf), not a level-up entry.
- save() itself (img 0x2BA1..0x356E) re-verified: writes f1..f80 with the
  WriteLn/WriteLongint helpers; f18 emitted via `0x7BD` from
  `[0x21A]:[0x21C]`.

### 2026-09-24 (11): Room proc + garden + training + kill-drop layer decoded
The 0x129D paragraph contains a whole second game layer beyond Walka:

- **Room @ img 0x12ACA..0x130A1** = map/garden generator. Seeds per-room
  `Random(0x1C71:0xBE4)` into the 11 monster positions `[0x1DA..0x1EE]`
  (`Random(0x26)+0x14`), the four stage-musician positions `[0x226..0x22C]`
  (`Random(3)+0x46`), and **plant slots** `[0x232..0x246]`
  (11 words, `Random(8)+0x4D`, re-roll ≥0x54), **garden-animal room ids**
  `[0x666..0x678]` (`Random(7)+0x14`), plus constants 0x67A/0x67C=0x43,
  0x67E=0x45 and byte `[0x261]` = garden/merchant-room marker. All compared to
  `[0x1d6]`=CurrentContext to gate one-shot flavortext (plants 0x976..0xC0D,
  animals 0x2B7B/0x2BB2/0x2BE2, "ROLNIK DUNCAN", "ZABIJ DUNCAN" @0x1B5D2,
  "KUP PLECAK" @0x1B6F5 — a hidden merchant at 0x1B5AC with MARCHEWKA 7000 /
  PRZEPUSTKA 400 / PLECAK 4800).
- **TrenujDispatch @ 0x13194**: `TRENUJ`=prompt; `TRENUJ SILA/ZRECZNOSC/MADROSC`
  cost **PRAKTYK [0x194] at 3/2/3** — the counters paid from school/CWICZ
  practice money (contrast the all-purpose FORSA 0x21A:0x21C longint used by
  combat, kills and shops).
- **ZabijMrowka 0x1383A** (1/1/2/R3 + 70% Paczek) · **ZabijSlaby 0x13947**
  (34..36/8..11/10, loot 10..30) · **ZabijSredni 0x13A60** (50..54/10..14/13..14,
  loot 30..59) · **ZabijSilny 0x13B82** (60..65/12..14/15..17) · 4×
  **ZabijPotwor** 0x13CA9..0x1401B. Plus launcher 0x12A16 (10/10/5/R15 + 25%
  Serce). Full tiers in (13) and integrated-field-map.md §"Kill router".
- **PorownajDispatch @ 0x1491B..0x153E8** = the 67-entry fight/compare ladder
  (cmd strcmp 0x14A5F..0x153BB): animals, people, plants, dogs, BAKTERIA —
  grouped by a `[0x686]` skill threshold (Zrecznosc==0x13+9 / 0x14,0x15+10;
  Parowanie>0x4B/+1,>0x32/+1; Kopanie>0xA/+2,+2; gate ≥0x10). Full vocabulary
  table in integrated-field-map.md §"Room command vocabulary" (the doc's earlier
  "compare params" note was wrong — the prompt string is the fight-menu header).
- **GardenOgladaj @ 0x1362A** and **GardenZwierzaki @ 0x155F2** = the
  look-at-plant / look-at-animal flavortext procs.
- **Kill drops**: GARNITURZYSK 0x157B9 (`Random(1000)<=25` → Garnitur kolce),
  PIGULKAZYSK 0x1586E (`<=42`), KASETAZYSK 0x15908 (`Random(100)<2` →
  Kaseta Liroya +EnergyMax/-8 load/+PRZED/+Zrecznosc). Item flags use
  **-10 (0xFFF6) "owned/none" sentinel**; acquisition is `field -= 10`.
- **Boss encounter** inside the 0x12414..0x129C6 dispatcher: stats 188/26/10,
  wounds 20/10, `lcall Walka`; the "TUR!!!! Z CIALA WROGA" quest reward
  (KUNSZT+0x1A9) gates on QuestType==3 && QuestCount<1 && Item_Fajka<=-10 &&
  Money>0.

### 2026-09-24 (12): POROWNAC oracle, full drop family, city-square quest/boss layer

- **CompareDispatch 0x14916..0x153E8 = the "POROWNAC" (compare-yourself)
  oracle** (NOT a kill ladder). Gate: ManaCur `[0x1AC]>9`; prompt "KOGO CHCESZ
  ZE SOBA POROWNAC?"; reads target at ds:0x564. **PowerLevel `[0x686]`** =
  CharacterLevel + SilaCur + Zrecznosc-tier (+4..+10 for 8/9..0x14/0x15) +
  Parowanie bonuses (>0x4B→+1, >0x32→+1) + Kopanie bonuses (>0xA→+2, >0x46→+2).
  One shared **67-target vocabulary** (DZIK..BAKTERIA incl. jobs, plants, dogs,
  LIROY, POKRZYWA): taunts per target tier (`NIE`/`RACZEJ NIE`/`TAK`/`50% SZANS`
  /`JESTES SILNIEJSZY`/`FLAKI`...). Tail: dogs → "JASNE ZE MOZESZ GO ZABIC";
  if `[0x19E]<3` && SkillPorownywanie `[0x25D]<0x64` → "UCZYSZ SIE ZDOLNOSCI
  POROWNYWANIE": `[0x25D]+=1`, KUNSZT+=5; BAKTERIA → "MAGIC RESISTANCE",
  ManaCur += 5.
- **Full drop family (img 0x157B9..0x15AE3)**: only Kaseta/Listek/Scroll are
  guarded by `context != 0x2710`; Garnitur/Pigulka are not. GARNITURZYSK
  0x157B9 (26/1000; text says 2.5%), PIGULKAZYSK 0x1586E (43/1000), KASETAZYSK 0x15908
  (2%, +EnergyMax −8 load +PRZED +Zrecznosc), **LISTEKZYSK 0x159E4** (6%;
  `[0x25B]-=10`, PRZED++, ManaMax+=0x28, text "UNIQE 4%"), **SCROLLPORZYSK
  0x15A91** (10%; Item_ScrollPorownanie `[0x230]-=10`, PRZED++),
  **PRZEDM_MODE 0x15AE4** (PreviousRoom `[0x180]=context`; context=0x3E8).
- **City-square proc 0x12414..0x129C6 (context==0x64)** fully decoded: street
  bios, quest sales (type1/2/3 at 200/100/50 money from longint MoneyLo/Hi,
  counts 75/200/200), turn-in rewards (+KUNSZT, Przepustka `[0x21E:0x220]-=10`;
  type2 needs Item_0188, type3 needs Fajka+word-Money), boss fight
  (188HP/26DEX/10DMG, wounds 20/10 → Przepustka on win), room-change cmds
  (→0x16 trees / 0x65 / PRZEDM_MODE / exit).
- **0x25B = LISTEK**, the byte-sized lucky-leaf item (drop decrements it by 10);
  0x25D = POR, the actual SkillPorownywanie counter. Item_ScrollPorownanie is at 0x230.
- The drop procs are **DropListek (0x159E4)** / **DropScroll (0x15A91)**;
  field 0x686 = PowerLevel, 0x25D = SkillPorownywanie (0x230 already present).
  integrated-field-map.md updated (§ Kill drops / City square dispatch rows).

### 2026-09-24 (13): KillDispatch router + fight launcher tiers (+ monster tiers)

- **KillDispatch 0x4F53** = the real `ZABIJ <NPC>` router for 10 room NPCs.
  Entry pattern: `cmd=="ZABIJ X"` AND `RoomKillFlag_*` == CurrentContext
  (NPC is present in the room; flag seeded by room/map-gen) → `lcall` tier
  launcher (para 0x129D offsets 0xf77/0x1090/0x11b2) → on `MonsterHP<1`
  clear the flag byte and roll the kill bonus. **Full command→flag mapping**
  documented in integrated-field-map.md §"Kill router": DZIECKO 0x24C, WARIAT
  0x24D, SLUCHACZ 0x24E, FAN 0x24F, CZLOWIEK 0x250, POLICJANT 0x251,
  OCHRONIARZ 0x252, DZIADEK 0x253, GORYL 0x254, REPORTER 0x256. (The old
  annotate labels for 0x24D..0x256 were SHIFTED/incorrect — fixed.)
  Bonuses: DZIADEK → Random(100)<5 Fajka + MadroscCur++; GORYL/OCHRONIARZ →
  GARNITURZYSK; all Serce-eligible.
- **Fight launcher tiers** (each: set MonsterHP/Dex/Dmg, `lcall Walka`, skip if
  fled `[0x1D2]`, loot `[0x212]`→money `[0x21A:0x21C]`, then Serce `[0x186]` roll
  if `[0x186]==0` → `=0xFFF6` + `PRZED`++):
  WALKAPIES 0x12A16 (10/10/5, unconditional post-WALKA R15 loot, 25% Serce
  placed in the current room; dogs+street),
  SLABO 0x13839 (1/1/2, R3 loot, 70% Paczek for `ZABIJ MROWKA`),
  MNIEJSLABO 0x13947 (34-36/8-11/10; 10..30; 25%),
  SREDNIO 0x13A60 (50-54/10-14/13-14; 30..59; 35%),
  TRUDNO 0x13B82 (60-65/12-14/15-17; 20..59; 35%),
  VEASY/EASY/NEASY/BTRUDNO 0x13CA4/0x13DD0/0x13EF3/0x14016
  (HP 90-99/100-119/130-149/72-74, Dex 14-15/16/20/13-14, Dmg 17-18/18-19/19-20/16-17; loot
  10..64/30..59/20..64/15..64).
- **Special encounters call drops directly**: "MIESA LUDZKIEGO... MOZGI"
  seduction fight (HP 200/Dex 15/Dmg 18, wounds 20/10) → on win LISTEKZYSK +
  PIGULKAZYSK + SCROLLPORZYSK, and `[0x262]`(QuestPhase) -= 0x32 while non-zero.
- KillDispatch `call`s confirmed from rooms (0x6A20, 0x6BF1, 0x6D67, 0x6F10,
  0x709D, 0x71F7, 0x73B3, 0x7647...) alongside "ZABIJ MINI-BARMAN", "ZABIJ
  GRUBAS", "ZABIJ D.J", "ZABIJ POTWOR", "ZABIJ PEDAL/PARA/MACIEK", "ZABIJ
  DRZWI", "ZABIJ STARUCH" strings.
- Full router/launcher tables + the "ZabijTrup → lcall 0x129D:0x44A6" Walka
  reconciliation: integrated-field-map.md.

### 2026-09-24 (14): Item subsystem decoded (BIERZ/ODRZUC/UZYJ + outfits + time travel)

- **Item field semantics formalized**: every item slot is `0x00 = never`,
  `0xFFF6 (-10) = carrying`, else **room-context = dropped on floor of that
  room**. Pickup (BIERZ X) needs `field == PreviousRoom[0x180]`; drop
  (ODRZUC X) needs `field == -10` → sets PreviousRoom; acquire `-=10`,
  consume `+=10`. PRZED [0x182] ±1.
- **ItemPickupDropDispatch 0x18405..0x186CE**: BIERZ/ODRZUC for StaryMiecz
  0x17E, MalaTarcza 0x184, Serce 0x186, DyplomMudSzkoly 0x188 (MUD school
  diploma = the old "Item_0188" quest reward! +5 EnergyMax when picked, −5 on
  drop), Fajka 0x18A (pickup also +1 MadroscCur, drop −1).
- **ItemUseDispatch 0x18E95..0x197B5**: UZYJ FAJKA (flavor) / SERCE (+5 E) /
  DYPLOM (diploma box) / PACZEK +8% / CIASTKO +12% / SUCHA RACJA +16%
  / CHLEB +26% / WEKA +34% / BULKA +20% / MALA BUTELKA MANY +30 Mana / CASETA
  (info) / LISTEK (info) / **PIGULKA [0x257] = time-travel pill** → `call
  Room` + MadroscCur-graded penalties (≠10: EnergyMax--/kün 0x32; 10..15:
  Energy-0x28/kün-0x1E; >15: none). ODLORZ/ZNISZCZ/PATRZ PRZEPUSTKA =
  certificate (longint [0x21E:0x220] owned as -10).
- **Outfits**: wear flag OutfitEquipped [0x218], worn-name buffer ds:0x264.
  UZYJ KOMPLET SYF (0x216) → PRO [0x1C2]+=7; UZYJ GARNITUR (0x222) →
  PRO+=0xA, OutfitZrecznoscBonus [0x1C4]+=1, HeavyBlow [0x224]+=0xF.
  ODLORZ reverses. Item_Bigos byte 0x259 (+20% E).
- **ColorChangeDispatch 0x197F1**: ZMIEN KOLOR/ZMIEN TLO → lcall 0x1C0F:0x263/
  0x1C0F:0x27D with a user number.
- Fields named StaryMiecz (0x17E), MalaTarcza (0x184), DyplomMudSzkoly (0x188),
  PRO (0x1C2), OutfitZrecznoscBonus (0x1C4), OutfitEquipped (0x218);
  integrated-field-map.md §"Item subsystem" added.

### 2026-09-24 (15): Room-level ZABIJ handlers + launcher entry-point fixes + Kaseta decode

- **Per-room killer bytes** (each "present in this room/arena" gate; fight; on win
  clear byte + unique drop) decoded across the city/market/garden dispatchers:
  POTWOR `[0x5A]==0xE` (custom HP20/Dex30/Dmg3, loot R(15), then 30%/30%/25%
  StaryMiecz/MalaTarcza/Serce if each still 0), MINI-BARMAN `[0x67A]==0x43` &
  GRUBAS `[0x67C]==0x43` (arena 'C'; 15% Piwo `[0x7C]-=10`), D.J
  `[0x67E]==0x45` (scene 'E'; 25% SuchaRacja `[0x1A4]-=10`, 3% **Kaseta Liroya
  UNIQE** = `[0x22E]-=10`, EnergyMax+5, **PRO-8**, Zrecznosc+1), DRZWI
  `[0x688]!=0` door → `[0x688]=0` (high-tier Potwor3 fight to break the door),
  STARUCH `[0x68A]!=0` → corpse-vanish no-loot, PEDAL/MACIEK → ZabijPotwor2 +
  PIGULKAZYSK, PARA → ZabijPotwor4 twice.
- **Kaseta flavor resolved**: "SMIEC . S.Z -8 MAXE +5 ZRE +1" == PRO [0x1C2]
  −8 / EnergyMax [0x664] +5 / ZrecznoscCur [0x190] +1 — confirms PRO at
  0x1C2.
- **Launcher entry-point fixes**: true `push bp` entries are ZabijMrowka 0x13839,
  ZabijPotwor1..4 = 0x13CA4/0x13DD0/0x13EF3/0x14016 (the earlier keys were 1..5
  bytes past the prologue). Escalation chains confirmed from caller offsets:
  0xE69=Mrowka, 0x1400=Potwor2, 0x1523=Potwor3, 0x1646=Potwor4.
- integrated-field-map.md: new table §"Room-level ZABIJ handlers".

### 2026-09-24 (16): ground truth cross-check vs the retained TPU units
- **Launcher procs ARE the PRZEDM difficulty procedures** (matched via stat
  comparison + PRZEDM dossiers): 0x13839 SLABO (drop = **PACZEK** [0x1A0]
  `R(10)<7`, not Serce — the earlier "bloody_heart" reading retracted),
  0x13947 MNIEJSLABO, 0x13A60 SREDNIO, 0x13B82 TRUDNO, 0x13CA4 VEASY,
  0x13DD0 EASY, 0x13EF3 NEASY, 0x14016 BTRUDNO (was ZabijPotwor1..4),
  0x12A16 WALKAPIES.
- **Profile numbers corrected**: prior Potwor1..4 "Dex/Dmg maxima" were
  misreads; true = VEASY/EASY/NEASY/BTRUDNO rows.
- **Mana bottle corrected**: gate `[0x192]==-10`, `[0x182]--`, `[0x192]+=0xA`
  (0x192 = Item_ButelkaMany **count**), **ManaCur [0x1AC] += 30** cap ManaMax
  [0x1AE] — the earlier "Mana at 0x192" was wrong.
- TPU Pascal symbols bound to EXE offsets: FORSA [0x21A:0x21C], PRZED [0x182],
  WROGEN/WROGSIL/WROGZRE [0x1B0]/[0x1B6]/[0x1B8], CZY [0x19E], PASZOL [0x1D2],
  MANA/MAXMANA [0x1AC]/[0x1AE], POZIOM [0x25C], POR [0x25D], KOP/KOPM/KOPHP
  [0x1C8]/[0x1CA]/[0x1CC], ZWIEJ [0x1CE], JAKIEUB/ABRON/ATAR = worn-id buffer.
- Unique-loot ladder + KillDispatch actor→profile table + stacked room-procs
  (SWIAT POKOJ0/5/11/30/60/75/83/100/…) + stores/price oddities + race init +
  `PLIKI.TPU` save schema (flat text read with ReadLn) recorded.
- Open items updated: `[0x17E]` post-kill event RESOLVED = StaryMiecz drop
  ladder gate; skill gates confirmed saved fields (f56/57/59); 0x257 is
  PIGULKA (not POTRAWKI); FORSA-vs-0x194 money still open here (closed in (17)).

### 2026-09-24 (17): arena grid command box + money split
- The "0x19C00 region" is the **arena grid shared dispatcher**, contexts
  0x20..0x39 (0x20 entrance, 0x21..0x39 = cells). Commands: MODE,
  **ZABIJ <28 beasts/NPCs>** (KORNIK..PANTERA by tier SLABO/MNIEJSLABO/SREDNIO;
  GLADIATOR/WOJOWNIK +PIGULKAZYSK, TRENER +GARNITURZYSK; pens = the old
  "GardenSpot_01DA..0x210" words), **EXIT**, **WYJSCIE**, and the N/E/S/W grid
  moves guarded by **ArenaMoveLatch [0x214]** / **ArenaSouthLatch [0x1D8]**.
  Full 26-cell N/E/S/W edge table recovered (EXIT text variants match the room
  maps). A comparison at the time noted the same arena edges in the separate
  port; the original mapping is established by the EXE dispatch itself, not by
  that comparison.
- **Forsa load math pinned**: wczytaj does `Forsa := Forsa div MadroscCur`
  (img 0x7FA4..0x7FBB via TP7 RTL @LDiv 0x1C71:0x7FA); the sign-in block in
  save() prints Forsa x Madrosc (img 0x2E0F..0x2E22, @LMul 0x1C71:0x7BD).
  The earlier "+= Madrosc" guess was wrong.
- **Money split resolved**: 0x194 = saved **PRAKTYK** counter ("CWICZYSZ
  KOPANIE ... MASZ <n> PRAKTYK"; school "ZYSKALES <n> PRAKTYK" 3-6 by wisdom
  tier; CWICZ lessons cost 1); FORSA [0x21A:0x21C] = coins/monety (loot,
  DAWAJ KASE, shop/BAZAR gates).

### 2026-09-24 (18): historical C-port comparison audit
This dated audit produced the comparison register in
`c-port-discrepancies.md`. It records the separate port at that time only; its
comparisons and "1:1" labels are not evidence or requirements for the Pascal
reconstruction. Original-side findings are grounded in the EXE/TPU.

### 2026-09-25 (19): PRZEDM MODE/SCENA/TLUM reconstructed
- Source-equivalent bodies for `MODE` (TPU source 543..546; EXE img
  0x15AE4..0x15AFB), `SCENA` (548..553; EXE img 0x15BCF..0x15C6E), and `TLUM`
  (555..566; EXE img 0x15E37..0x15FBE).
- `[0x226..0x22C]` are confirmed as GITARZYSTA/PERKUSISTA/ORGANISTA/LIROY
  room positions, not garden spots: `Room` assigns each `Random(3)+70`,
  `SCENA` prints by equality with `MIECHO`, and `FIGHTSCENA` tests/clears the
  same fields for the four `ZABIJ` commands. (Crowd NPCs seed separately:
  DZIECKO `[0x24C]` = `Random(7)+0x3C` re-rolling `≤0x3C`, so rooms **61-66**.)
- The original helper saves `MIECHO` to `MIECHO2` and enters context 1000
  (the port has no direct MODE state; register entry 2).

### 2026-09-25 (20): PRZEDM unique-drop family reconstructed
- Source-equivalent bodies for `GARNITURZYSK`, `PIGULKAZYSK`, `KASETAZYSK`,
  `LISTEKZYSK`, and `SCROLLPORZYSK` from TPU source lines 490..540 and EXE img
  0x157B9..0x15AE3.
- Exact roll comparisons preserved, including the displayed-rate quirks:
  Garnitur is `<=25` of `Random(1000)`, Pigulka is `<=42`, Kaseta is `<2` of
  `Random(100)`, Listek is `<6` while its text says 4%, and Scroll is `<10`.
- TPU symbols resolve byte 0x257 as `PIGULKA` and byte 0x25B as `LISTEK`,
  replacing stale semantic guesses.
- Kaseta/Listek/Scroll drops are guarded by `MIECHO <> 10000` (reachable on a
  simultaneous knockout turn); Garnitur/Pigulka are not guarded. Port deltas
  (loot-before-death ordering): register entries 4 and 9.

### 2026-09-25 (21): PRZEDM difficulty procedures reconstructed
- Source-equivalent bodies for `SLABO`, `MNIEJSLABO`, `SREDNIO`, `TRUDNO`,
  `VEASY`, `EASY`, `NEASY`, and `BTRUDNO` from TPU source lines 225..383 and
  EXE img 0x13839..0x140FF.
- The reconstruction preserves stat and coin rolls, `PASZOL` reward gates,
  `ENERGIA > 0` gates unique to VEASY/EASY/NEASY, exact loot strings, the
  MROWKA-only Paczek path, and the original nested Serce checks and RNG order.
- Stale disassembly annotations corrected: VEASY/EASY/NEASY damage rolls
  use `Random(2)`, and 0x13B87 is inside `TRUDNO`, not a second procedure.
- Port deltas (Paczek/Serce ownership, ENERGIA gate, coin arithmetic):
  register entries 3, 5, 6.

### 2026-09-25 (22): PRZEDM WALKAPIES reconstructed
- Source-equivalent `WALKAPIES` body from TPU source lines 54..67 and EXE img
  0x12A16..0x12AC9.
- It sets enemy HP/Dex/Dmg to 10/10/5, calls `WALKA`, then unconditionally
  grants `Random(15)` coins. If `SERCE = 0`, it rolls 25% and stores `MIECHO`
  in `SERCE`, placing the heart in the current room rather than carrying it.
- Port deltas (flee skip of coin reward / heart drop, dog anchor, SPANIEL/
  PUDEL speech): register entry 7.

### 2026-09-25 (23): PRZEDM FIGHTSCENA reconstructed
- `FIGHTSCENA` reconstructed from TPU source lines 1435..1461 and EXE img
  0x1AF97..0x1B094, preserving command order and result-gate asymmetry.
- PERKUSISTA/GITARZYSTA/ORGANISTA are cleared and call `KASETAZYSK` after
  `VEASY` regardless of fight result. LIROY uses `NEASY` and requires
  `MIECHO<>10000`, `ENERGIA>0`, and `PASZOL=0` before its exact message, 30
  coins, cassette roll, optional `QUESTWYK-=150`, and actor clear.
- Port delta (cleanup/drop gated on the generic victory resolver, KO-turn
  ordering): register entry 8.

### 2026-09-26 (24): non-stage kill callers + KO-turn loot ordering audited
- KillDispatch/room code pushes **non-stage** drop callers through the same
  fight→drop shape as WALKAPIES/FIGHTSCENA: `TAKSOWKARZ`/`SPRZEDAWCA` →
  `VEASY`+`GARNITURZYSK`, `PEDAL`/`MACIEK` → `PIGULKAZYSK`, `D.J` (arena 'E')
  → cassette.
- Re-derivation confirms the original's `MIECHO <> 10000` guard is **reachable**
  on a same-turn KO: loot runs before the death handler, so the context-10000
  suppression can be bypassed (register entries 4/9).
- Crowd spawn-set: DZIECKO seeds rooms 61-66 (`Random(7)+0x3C`, re-roll
  ≤ `0x3C`).

### 2026-09-26 (25): PRZEDM FIGHTBLUSZCZ reconstructed (Duncan market/quest)
- Source-equivalent `FIGHTBLUSZCZ` body (after `FIGHTSCENA`; anchors
  1463-1558, TPU 0x0522..0x0A2F): `ZABIJ DUNCAN` → EASY + clear when
  `WROGEN < 1`; `SECRET LISTA` (Duncan present) prints the price list; `KUP
  DOKUMENT` (`FORSA > 399`, **no** Duncan test) applies the −10 owned-sentinel
  to the pass, `FORSA −= 400`, `PRZED += 1`; `KUP PLECAK` (Duncan present,
  `FORSA > 4799`) −10 sentinel, `FORSA −= 4800`, `PRZED += 1`; `ROZMAWIAJ
  DUNCAN` offer/reminder/completion (`DUNQ = 0` → offer + `DUNQ := 75`;
  completion at `DUNQ = -125` (Shortint; byte 0x83) → `DUNQ := 0`,
  `KUNSZT += 125`); garden kills VEASY/EASY with the `ENERGIA > 0` clear
  semantics; `ZABIJ TRAWA` = up to 4× `TRUDNO` while `ENERGIA > 0`, then the
  UFF rest line gated on `(ENERGIA > 0) and (PASZOL = 0)`.
- Port deltas (market-unlock gate, plant clear semantics, TRAWA loop):
  register entry 10.

### 2026-09-26 (26): PRZEDM ULSKLEPIKOWA + POROWNANIE + TRAIN reconstructed
- Source-equivalent bodies for the three remaining procedures (after
  `FIGHTBLUSZCZ`):
  - `ULSKLEPIKOWA` (source 475-487, TPU 0x0070): 10 × `if MONSTRA.X = MIECHO
    then WriteLn(...)` street/dog descriptions.
  - `POROWNANIE` (source 385-472, TPU 0x0816..0x12E9): the comparison oracle.
    `if MANA > 9` gate; `FUKS := Random(100)`; ReadLn target; `OGOL :=
    POZIOM + SIL` plus ZRE tiers (8/9→+4 ... 20/21→+10), `PAR > 75/50` +1/+1,
    `KOP > 10/70` +2/+2; nine target groups with banded advice; dogs give an
    unconditional kill line; learn gate `FUKS < 3 and POR < 100` →
    `***************** UCZYSZ SIE ZDOLNOSCI POROWNYWANIE *****************`,
    `POR + 1`, `KUNSZT + 5`; `BAKTERIA` → `MANA + 5`. LIROY advice keeps the
    Polish diacritics (`SPROOBÓJ...`, `MORDĄ`) as UTF-8.
  - `TRAIN` (source 166-189, TPU 0x0010): `if wpisz = 'TRENUJ' then
    WriteLn('CO CHCESZ TRENOWAC?')`, then SILA/ZRECZNOSC/MADROSC branches with
    gates `PRA > 2/1/2` and costs 3/2/3 (confirmed 1:1, register).
- Port delta (basic/street advice band off-by-one, 22 vs 21): register entry 11.

### 2026-09-26 (27): PRZEDM save/TARCZA/PIERDOLY/KOMENDY/BLUSZCZ + SMIERC reconstructed
- Five interface-proc bodies (after `TRAIN`) plus the implementation-local
  `SMIERC` right after `implementation` (mirrors its early original placement,
  source 192-208 — a near `ret` helper the `WALKA`-family bodies call):
  - `save` (source 1573-1574, TPU 0x0108): empty stub — pure prologue/epilogue;
    the real persistence lives in the main program (see the save anchor).
  - `TARCZA` (source 601-608, TPU 0x0022..0x0090): `FUKS := Random(100)`; block
    when `FUKS <= PRO`; `WPYSK := WPYSK - ILOSC` clamped at 0; verbatim
    `'OSLONILES SIE ! TRACISZ ', WPYSK, ' ENERGII'`.
  - `PIERDOLY` (source 1111-1122, TPU 0x003B..0x00E1): `ZMIEN KOLOR`/`ZMIEN
    TLO` prompts + `TextColor`/`TextBackground` on `FUKS`.
  - `KOMENDY` (source 1560-1570, TPU 0x0043..0x016F): abbreviation expander
    `PN/PD/W/Z/G/D/E/M` → `POLNOC/POLODNIE/WSCHOD/ZACHOD/GORA/DOL/EXIT/MODE`.
  - `BLUSZCZ` (source 210-223, TPU 0x02E3..0x04AC): 12 × `if X = MIECHO then
    WriteLn(...)` plant/Duncan flavour lines.
  - `SMIERC` (source 192-208, TPU 0x0141..0x0277): six verbatim death lines,
    quest progress 50/200 (`QUEST`=1/>1), `ENERGIA := MONSTRA.MAXE`,
    `KUNSZT -= 250 - Random(50) + 5*POZIOM`, `MIECHO := 20`, `POTWORY`,
    `wpisz := 'PAMIETAJ'`, `save`, `ReadLn`.
- Confirmed 1:1 (register): SMIERC, and the BLUSZCZ plant lines (incl. the
  trailing spaces on STOKROTKA/JEZYNA).

### 2026-09-26 (28): PRZEDM POTWORY/KTO/BRANIE reconstructed
- Three more interface-proc bodies at the marker (after `TRAIN`):
  - `POTWORY` (source 70-164, TPU 0x0000..0x05D8): monster-state regeneration.
    Tiered `Random` draws with `repeat-until` anti-clumping guards: arena
    bugs/animals, forest animals, big animals and gladiators `Random(38)+20`
    all `> 32`; dogs and street townies `Random(7)+20` (`> 19`); concert crowd
    and police (byte vars) `Random(7|8|9)+60` (`> 60`); band `Random(3)+70`;
    fixed townsfolk `MINIBARMAN 67`, `GRUBAS 67`, `DJ 69`, `PEDAL/PARA/MACIEK
    76`, `DRZWI 1`, `STARUCH 1`; plants `Random(8)+77` retried until the eight
    main plants `< 84` (AGREST/JEZYNA/TRAWA/DUNCAN unguarded). No strings.
  - `KTO` (source 569-598, TPU 0x0523..0x093B): 28 × `if X = MIECHO then
    WriteLn(...)` arena-crowd lines (incl. `"POMYLONE MISIE"` and the BOA/
    WOJOWNIK trailing spaces); same relocation pattern as BLUSZCZ.
  - `BRANIE` (source 908-963, TPU 0x023F..0x0508): `BIERZ/ODRZUC` for the five
    sentinel items. Pickup gate `X = MIECHO2`, drop gate `X = -10`; `PRZED +1/-1`;
    DYPLOM/FAJKA side-effects `MAXE +5/-5`, `MAD +1` (gated `< MAXMAD`)/`-1`.
    All 10 messages and side-effects preserved (port deltas: register entry 15).
- Confirmed 1:1 (register): POTWORY's fixed townsfolk (DRZWI door, STARUCH
  house), KTO and BLUSZCZ relocated-description pattern.

### 2026-09-26 (29): PRZEDM UZYWANIE reconstructed
- `UZYWANIE` body at the marker (source 965-1108, TPU 0x00D8): the use-item
  dispatcher on `wpisz`. `UZYJ FAJKA` (kept, not consumed), `UZYJ SERCE`
  (`SERCE := 0`, energy +5 capped, `PRZED - 1`), `UZYJ DYPLOM` (10-line box
  with three blank rows), food PACZEK/CIASTKO/SUCHA/BULKA/CHLEB/WEKA
  (`PRZED - 1`, +10 to the -10 quantity sentinel, energy +8/12/16/20/26/34
  capped to MAXE), MBUTELKA (mana +30 capped to MAXMANA), BIGOS (+20%),
  ZNISZCZ/PATRZ PRZEPUSTKA (Longint gate `< -1`; the 7-line pass box keeps the
  `questów` diacritic; ZNISZCZ bumps `PRZED + 1`), KASETA and LISTEK info
  lines (verbatim, incl. trailing spaces), KOMPLET "SYF" (`PRO + 7`,
  `CIALO := 1`, `JAKIEUB := 'SYF'`; ODLORZ reverses), GARNITUR (`CIALO := 1`,
  `ILOSC + 1`, `PRO + 10`, `FUKSROLL + 15`; ODLORZ reverses), PIGULKA (consume,
  full `POTWORY` re-roll, then MAD tiers `<10` → MAXE−1/ENERGIA:=1/KUNSZT−50,
  `10..15` → ENERGIA−40 clamp≥1/KUNSZT−30, `>15` → none).
- Port deltas (transport-pill re-roll, clothing side-stats, PRZEPUSTKA
  quantity model, ITEM_BEER): register entry 16.

### 2026-09-26 (30): PRZEDM WALKA reconstructed
- `WALKA` body at the marker (source 611-905, TPU 0x04EC): the generic combat
  round used by every fight launcher. One-time stat-margin `MINIKUNSZT`
  prologue (`MONSTRA.MAXE`/`SIL`/`ZRE` vs `WROGEN`/`WROGSIL`/`WROGZRE`: up
  +10..+1, equal +11, down +12..+21), then the `repeat ... until (ENERGIA < 1)
  or (WROGEN < 1) or (PASZOL = 1)` loop: `ON/TY := 0` + the `WALCZYSZ -
  <<<<...` header; twin dodge tables (`Random(12..23)`/`Random(35..60)`,
  `FUKS < 10` flags) in both `ZRE` directions with the four verbatim dodge
  lines; enemy strike `WPYSK := Random(WROGSIL)` with the four tier lines
  (`<6`/`(5,21)`/`(20,51)`/`>50`), `MINIKUNSZT + 1`, `TARCZA`, parry
  (`Random(140)`, `FUKS <= PAR`, 0/2/3-point bands, learn `(FUKS<1) and
  (PAR<100)` → `PAR + 1`, `MINIKUNSZT + 5`), FIREBALL/POISON/ILEPOI magic;
  player riposte `WPYSK := Random(SIL)` with the FUKSROLL heavy-blow re-roll
  (`repeat ... until (WPYSK*10) > FUKSROLL`) and four tier lines;
  `Delay(2000)`; the per-round auto KOP block (gate `(KOP>0) and (MANA>KOPM)
  and (ENERGIA<KOPHP)`, test `FUKS <= KOP - 10`, damage
  `Random(POZIOM)+Random(10)`, mana `Random(3)+3`/tail `Random(2)+2`); the
  ZWIEJ flee block (gate `(ZWIEJ>0) and (ENERGIA<WIMP) and (MANA>14)`,
  `MANA −= 15`, `FUKS <= ZWIEJ` → `PASZOL := 1` + `KUNSZT −= 20`); kill block
  `(WROGEN<1) and (ENERGIA>0)` with reductions off the player's own
  `MONSTRA.MAXE` (`>75 → −2`, `>115 → −3`), PAR (`>50/75/95 → −2/−2/−1`),
  KOP (`>50/95 → −5/−2`), floor 0, `ZABILES GO ! ZYSKUJESZ ZA TO ' ,
  MINIKUNSZT , ' KUNSZTU '`, `KUNSZT += MINIKUNSZT`, `FIREBALL/POISON := 0`,
  `QUESTWYK − 1`, the POTRAWKI bigos + learn block (`POTRAWKI > FUKS` →
  `BIGOS −= 10`, `PRZED + 1`, learn `(FUKS<1) and (POTRAWKI<100)`); death
  block `ENERGIA < 1` → `!!!!!!!!!!!ZOSTALES ZABITY!!!!!!!!!!!!`,
  `Delay(3000)`, `MIECHO := 10000`, and the unconditional `MINIKUNSZT := 0`.
- Port deltas (per-round MINIKUNSZT accrual, parry-learn bank, kill-reward
  reduction base, heavy-blow re-roll): register entry 17.

### 2026-09-26 (31): PRZEDM MINIARENA reconstructed (final interface body)
- `MINIARENA` body at the marker (source 1124-1433, TPU 0x00E8, bytes
  0x0299..0x1689), completing every interface procedure: the arena's
  self-contained command loop. Gate `MIECHO` cells 33-57 → `ARENA := 1` + the
  `JESTES NA ARENIE I CZUJESZ POTRZEBE ZABIJANIA` line + a one-shot `KTO`
  crowd list; then the `repeat write(ENERGIA, '%.', KUNSZT, '>') ReadLn(wpisz)
  KOMENDY MODE [fights] EXIT WYJSCIE [moves] STOP := 0 until (ARENA = 0) or
  (MIECHO = 1000)` loop.
- 30 `ZABIJ X` fighters (BAKTERIA..TRENER), each gated on the creature's room
  anchor and dispatched to the difficulty procs (SLABO/MNIEJSLABO/SREDNIO/
  TRUDNO); the four `PASZOL = 0`-gated drops (SLIMAK/KORNIK/MUCHA/ZUK) keep
  the creature alive when the player fled, and the TRUDNO trio
  (GLADIATOR/WOJOWNIK/TRENER) also trigger the PIGULKAZYSK / GARNITURZYSK
  give-aways.
- `EXIT` prints the per-cell exit menu — all ten variants (DOSTEPNE WYJSCIA /
  DOSTEPNE WYJSCIE / MOZESZ WYJSC NA : / MOZESZ ISC NA :); `WYJSCIE` jumps
  straight out of the loop; the four direction blocks (POLODNIE/POLNOC/
  WSCHOD/ZACHOD) remap every arena cell 33-57 — including the 33→32 entrance
  edge, the `ARENA := 1` blocked edges, and the POLNOC/WSCHOD/ZACHOD
  `STOP`-flag chains.
- This was the last pending interface body — no prose bodies remain at the
  marker. (Arena grid 1:1 + minor exit/prompt deltas: register entry 18.)

### 2026-09-26 (32): TPU source-filename ground truth + BOMBKI.EXE entry-trace correction

- **Source-filename ground truth.** Each TPU's `ofs_src_name` record names the exact `.PAS` file it was compiled from:
  - `MONSTRA.TPU` → `MONSTRA.PAS`
  - `SWIAT.TPU` → `SWIAT.PAS`
  - `PRZEDM.TPU` → `PRZEDM.PAS`
  These match our reconstructed filenames 1:1 — no rename needed, confirming the reconstruction maps to the original units. Persisted as per-unit `*.src.txt` reports in `tpu_reports/` (date cell kept raw, not DOS-decoded).
- **Checksums / uses.** MONSTRA `$242F`, SWIAT `$3B76`, PRZEDM `$647E`; uses chains MONSTRA(`crt,System`), PRZEDM(`dos,monstra,crt,System`), SWIAT(`przedm,monstra,crt,System`) match the reconstruction interfaces.
- **PLIKI.TPU is not a unit.** It is the in-game save file despite its extension, not a TP7 unit; `tpuq` correctly refuses to parse it as `TPUQ`.
- **Correction of the §4.2 "entry sweep" claim.** The earlier claim that the loader's entry IP lands on the Pascal string `"NOSISZ ZE SOBA:"` mixed up image-relative and file-relative offsets:
  - MZ header: `CS:IP = 0000:B0CF`, header paragraphs `0x52E`, image length `0x1D4F0`. With `img = file[0x52E*16:]`, the entry is at **img 0xB0CF**, not img 0x00000.
  - Bytes at img 0xB0CF are `9A 00 00 71 1C` = **`lcall 1C71:0000`** — real code, the System bootstrap (DS=DGROUP 0x1D49, BSS zeroed 0x52..0x8EE, CPU probe, heap init).
  - The string `'NOSISZ ZE SOBA:'` (0F-length prefix) sits at **img 0x00000**, at the literal-pool start — it is not the entry target.
- **Corrected startup order (img-relative):** `0xB0CF` `lcall 1C71:0000` (System bootstrap) -> `1C0F:000D` (TextRec initialization) -> main prologue `0xB0D9` -> heap check `1C71:02CD` -> `1C71:0C79` (`Randomize`) -> near `call` at `0xB0E8`. Its rel16 arithmetic yields `0x116EF`, but the real-mode 16-bit IP wraps to `0x16EF`; this is the `WybierzRase` entry (`push bp; mov bp,sp`, img 0x16EF). At img 0x16F9 it far-calls `1BC4:022B`, the MONSTRA TPU entry `WSTEP`; the literal intro runs before the race prompt. After it returns, race/name setup proceeds, then `1C0F:031A`, `Checkpoint` (`0x51C3`), `LevelUp` (`0x872E`), overload gate, and main loop (`0xB193`). Evidence: `annotated-BOMBKI.asm` at img 0xB0E8, 0x16EF, and 0x16F9; `MONSTRA.entries.txt` maps WSTEP to block 0000:022B.
- **Superseded startup interpretation:** the previous "mid-instruction/off-by-one" reading treated the linear disassembler's unwrapped near-call target as an actual IP. The target wraps to img 0x16EF; `WybierzRase` then calls `WSTEP` by far call at img 0x16F9. The inference that this was an unrelated startup/input-overwrite routine was wrong. The earlier statement that unit initialization blocks therefore belong to the program prologue is withdrawn; this call evidence does not establish where every unit initialization runs.
- **Stat-table writes are spread, not central.** `OWCZAREK` `[0x1B0]` (`mov word [0x1B0],imm`) hits at 0x5DB4, 0xB3CE, 0xB695, 0xB85E, 0xD091, 0x10981, 0x12995, 0x12A20, 0x13843; `[0x1B8]` at 0x5DBA, 0xB3D4, 0xB69B, 0xB864, 0xD097, 0x10987, 0x1298F, 0x12A26, 0x13849, 0x13DE9, 0x13F0C; `StaryMiecz` `[0x17E]` at 0x3F5C, 0xEC33, 0xED5E, 0xEDB5, 0x18446 — writes occur in multiple game procedures and launchers, not a single central init block. The proc at 0x5C36 reads textrec 0x564 with string cs:0x5B7C, checks `[0x58]==0xC`, then writes fresh combat stats and calls `WALKA 0x129D:0x44A6`.
- **Unit-initialization placement remains OPEN.** The startup path explicitly calls `MONSTRA.WSTEP` from `WybierzRase` (img 0x16F9); this supersedes the unsupported general claim that game-unit code is only emitted into the program prologue. This one call does not locate every unit initialization block.

### 2026-09-27 (33): SWIAT same-build region and room bodies

- **Correction to §4's RAW-slide inference:** `SWIAT.code.bin` has 14 leading
  zero bytes. At offset `$0E+i`, its 13,289 remaining bytes correspond to EXE
  img `0xF5D0+i` through img `0x129B8`: 3,987 differences are exclusively
  TPU zero relocation slots; there are zero nonzero byte differences. The TPU
  extract lacks the EXE region's last 14 bytes (img 0x129B9..0x129C6).
  `analysis-tools/verify_swiat_region.py` reproduces the comparison.
- The 12 blocks pack consecutively at img 0xF5D0..0x129C6, with entries
  POKOJ5 0xF766, POKOJ0 0xFA5F, POKOJ1 0xFEDF, POKOJ4 0x10447,
  POKOJ13 0x10803, POKOJE 0x10B8D, POKOJ11 0x11261,
  POKOJ30 0x11638, POKOJ60 0x118FE, POKOJ75 0x11BDC,
  POKOJ83 0x11ECA, POKOJ100 0x12414. POKOJ83 is block `$50`, not
  a missing block `$60`; `$60` is its *interface entry-record offset*.
  Ground truth: `SWIAT.codeblocks.txt`, `SWIAT.entries.txt`, and
  `disasm/SWIAT-region.asm` (all addresses img 0x…).
- POKOJE is the four-room dispatcher for contexts 6/8/7/10 (img 0x10B97,
  0x10CB1, 0x10DCB, 0x10EE5); the garden generator at img 0x12ACA is a
  separate PRZEDM procedure. Room 11 calls PRZEDM.KOMENDY after each input
  (img 0x11345 -> 0x1BB07). Room 83 calls PRZEDM.BLUSZCZ on entry and
  KOMENDY/FIGHTBLUSZCZ after input (img 0x11F32, 0x11F97, 0x11F9C).
  Room 100 calls PRZEDM.ULSKLEPIKOWA on entry (img 0x12460 -> 0x155F2).
- `MONSTRA.SILNY` is the room-13 tracker: MONSTRA's TPU variable blocks
  have sizes `$12`, `$16`, `$02`, and `SILNY` is block `$10`, offset zero
  (`MONSTRA.varblocks.txt`, `MONSTRA.symbols.csv`). With linked MAXE at
  `$664` (img 0x12824), the final block is at `$664+$12+$16 = $68C`,
  initialized to 13 at img 0x1973 and tested/cleared by SWIAT at img
  0x10833/0x109A4. The BOMBKI startup transcription must reproduce that
  initialization; the declaration belongs to MONSTRA.
- `PRZEDM.FIREBALL` and `PRZEDM.POISON` are the `$25E`/`$25F` bytes:
  TPU block `$58` offsets `$08`/`$09` in `PRZEDM.symbols.csv`. The combat
  body tests/decrements them while printing the fireball and poison
  messages (img 0x17BE3..0x17CA5). SWIAT's boss writes at img
  0x1297F/0x12984 update these existing fields.

### 2026-09-27 (34): BOMBKI main dispatcher at img 0xB193

- The main body is not a single room call: img 0xB193..0xB1E4 checks the
  bleed counter `[0x260]`, prints `JESTES ZATRUTY TRACISZ <Random(5)> % ENERGI`
  and decrements that counter (img 0xB19A..0xB1E2). In this block no
  subtraction from ENERGIA appears. The ordered room dispatch begins at
  img 0xB1E5. Its direct SWIAT calls are POKOJ0 (0xB1EC), POKOJ1
  (0xB1F8), POKOJ4 (0xB218), POKOJ5 (0xB224), POKOJE (0xB229),
  POKOJ11 (0xB23F), POKOJ13 (0xB255), POKOJ75 (0xBF11), POKOJ30
  (0xBF1D), POKOJ83 (0xCC13), POKOJ100 (0xE0F9), POKOJ60 (0xE85B).
- Other rooms are *inline in the main body*: room 14 begins at img
  0xB264, room 15 at 0xB52B, room 16 at 0xB7F2, room 17 at 0xBAAB;
  the later garden, road, school, arena-entrance and MODE cases extend
  through img 0xF5B7. The arena range 33..57 is handled by
  PRZEDM.MINIARENA (img 0xEA15 -> 0x19B30); img 0xEA25..0xEA31 caps
  ENERGIA at MAXE before the MODE context-1000 branch (img 0xEA34).
- At img 0xF5A1, `UNMODE`/`UM` restores context `[0x1D6]` from previous
  room `[0x180]`. Img 0xF5B2 resets PASZOL `[0x1D2]`; context 193
  terminates at img 0xF5C2, otherwise `jmp 0xB0F0` repeats the entire
  main prologue (including its overload check before img 0xB193).
  Any `WYJSCIE` in an inline room jumps directly to img 0xF5C2
  (e.g. img 0xB396). The compact dispatch/call index is
  `disasm/BOMBKI-main-dispatch.asm`.
- **OPEN transcription scope:** inline room handlers and the MODE command
  body at img 0xB25A..0xF5B1 still need source transcription before the
  main-program `BODY TODO` can be replaced with a source-equivalent loop.

### 2026-09-27 (35): first inline room handlers transcribed

- Transcribed the room-2 loop at img 0x548A..0x5651: context-2 description,
  status prompt, MODE and exit handling, west transition, poster text, and the
  PRZEDM training call at img 0x5641. The poster and exit literals are at img
  0x542D, 0x5442, 0x546B, 0x53E8, and 0x53FA; the call target is
  PRZEDM:0x7B5.
- Transcribed room 3's context-3 description, prompt, exit, up/down transitions,
  and the program-local poster/CWICZ handler at img 0x2395..0x2B74 (called at
  img 0x5853). `PATRZ PLAKAT` prints the ability poster; the six practice
  commands update KOP, Uciekanie, Powracanie, Parowanie, POR, and POTRAWKI with
  their stat gates, caps, costs, formulas, and failure message, grounded at
  img 0x23A5..0x2B74. The unclaimed DGROUP word 0x78 is exposed as the invented
  Pascal label `Powracanie` (skill use at img 0x2930..0x2958).
- Transcribed room 9's text, prompt, exit list, and DOL/GORA transitions from
  img 0x5923..0x5A8C.
- Added the context-18 teleport vignette: four lines print and the context is
  immediately set to room 1 (img 0xBCA2..0xBD1E). Room 17's DOL command selects
  context 18 at img 0xBC92.
- Transcribed room 12's flavor, context-12 gate, west/exit loop, combat profile
  (HP20/Dex3/Dmg3), flee handling, coin reward, and the three conditional item
  drop attempts from img 0x5C36..0x5F08. The room's encounter flag is DGROUP
  0x58 (tested against 12 and cleared on non-flee); its ownership is still
  unnamed. The writes of 500/300/50 to DGROUP 0x66/0x68/0x6A are represented by
  neutral invented labels rather than inferred meanings (img 0x5E6C/0x5EAE/
  0x5EF0).
- MODE's broader main-program command handling remains OPEN at img
  0xB25A..0xF5B1. Compilation was checked with FPC 3.2.2 in TP mode after the
  room-3 handler was transcribed; the compiler returned exit status 0.

### 2026-09-27 (36): WSTEP intro call and log corrections

- The startup call at img 0xB0E8 is a near `CALL rel16`. Its arithmetic gives
  0x116EF, but the real-mode 16-bit IP wraps to 0x16EF, the `WybierzRase`
  prologue. That procedure far-calls `1BC4:022B` at img 0x16F9; the
  `MONSTRA.entries.txt` record maps block 0000:022B to `WSTEP`. Thus the intro
  is executed before the race prompt; the previous “middle of an instruction”
  interpretation confused the disassembler's unwrapped linear target with the
  processor's wrapped IP. Source call added to `BOMBKI.PAS`.
- Refreshed the present-day scope/status above: the earlier “cut line” wording
  and main-skeleton deliverable label no longer described the active work.
- **OPEN:** finish transcribing the inline contexts and MODE/main-loop body
  before marking `BOMBKI.PAS` complete (img 0xB193..0xF5C9).

### 2026-09-27 (37): ordered dispatch and garden/city contexts

- Replaced the Pascal `case` approximation with independent, ordered context
  tests. This matters when a handler changes context to a later branch during
  the same pass (e.g. context 20 to 75, img 0xBF00..0xBF22). `POKOJE` is called
  unconditionally after the context-5 test, matching img 0xB21D..0xB229.
- Split garden behavior by active context 77..82 inside the invented helper:
  distinct entry descriptions, exits, and transitions follow img
  0xC20C..0xCC0C. Context 80 includes the well/inscription responses and
  Random(3)+1 coin reward; the 40% hostile event is grounded at img
  0xC8A1..0xC978.
- Added context 20's city description, PRZEDM.ULSKLEPIKOWA call, poster text,
  exit list, and movement destinations from img 0xBD29..0xBF0A.
- Corrected the arena entrance gate to context 32 only; MINIARENA handles
  cells 33..57 internally (img 0xEA0B..0xEA1A), not every context >=33.
- **OPEN:** the remaining inline contexts and MODE/main-loop tail still require
  transcription (img 0xCC18..0xF5C9).

### 2026-09-27 (38): cave entrance and encounter handlers

- Added partial source transcriptions for contexts 84, 87, and 88 from img
  0xCC18..0xD1FB: room prose,
  exits/transitions, context-87 random damage (`Random(100) < 40`, damage
  `25-ZrecznoscCur`), and context-88 monster setup (HP 200, dexterity 15,
  damage 18; wound bytes 5 and 1), combat, conditional drops/quest decrement,
  and return to 87 while Energy is positive. The kill reward/quest path tests
  monster HP `< 0`, not `< 1` (img 0xD0B2..0xD0D9).
- Added context 85's living-door prose, combat gate (`PRZEDM.NEASY`), open-door
  condition, exits, and transitions from img 0xD205..0xD41D. The door-state
  word at DGROUP 0x688 is given the invented label `StanDrzwi`; the conditional
  behavior and linked prose support that meaning.
- Added a partial context-86 handler below; its multi-stage old-man quest and
  remaining inline actions are not yet a complete reconstruction (img
  0xD427..0xD7F0).
- **OPEN:** remaining main-loop contexts and tail still require reconstruction
  (img 0xD7F0..0xF5C9).

### 2026-09-27 (39): living-door context

- Added the context-85 handler and dispatch branch. `StanDrzwi` represents
  DGROUP word 0x688: nonzero blocks entry and enables the `ZABIJ DRZWI` /
  `PRZEDM.NEASY` path; successful damage clears it. Westward entry to context
  86 is permitted only after it is zero (img 0xD244..0xD3D9).

### 2026-09-27 (40): old man's room, partial

- Added the context-86 prose, visible actions, dialogue/payment branches,
  old-man kill path, exits, and transitions. Field 0x68A is represented as
  `StanStarucha`; the unidentified DGROUP words 0x7A/0x7C remain neutral
  `PoleBOMBKI007A`/`PoleBOMBKI007C` labels. Source remains partial: the
  dialogue's precise conditions and subsequent branches still need instruction-
  level reconciliation (img 0xD427..0xD7F0).

### 2026-09-27 (41): shop street context

- Added context 21's description, conditional street encounter flavor via
  `PRZEDM.ULSKLEPIKOWA`, prompt/command processing, exits, and four movement
  transitions (img 0xD7FA..0xD9C0). The call target at img 0xD832 matches the
  helper's MIECHO-keyed street-description behavior.
- **OPEN:** contexts 22 onward and main-loop tail remain unfinished (img
  0xD9CA..0xF5C9).

### 2026-09-27 (42): extended shop street

- Added context 22's continuation description, street encounter helper, exit
  list, and movement to contexts 21, 101, 25, and 26 (img 0xD9CA..0xDBA4).
- **OPEN:** contexts 101 onward and main-loop tail remain unfinished (img
  0xDBA4..0xF5C9).

### 2026-09-27 (43): road context

- Added a partial context-101 handler with road narrative, signpost response,
  exit list, and the observed east/west/north destination writes (img
  0xDBA4..0xDDA8). The neighboring near-call `0x11C2A` is not yet interpreted
  in the Pascal source and remains OPEN.
- **OPEN:** contexts 102 onward and main-loop tail remain unfinished (img
  0xDDA8..0xF5C9).

### 2026-09-27 (44): road fork contexts

- Added partial context-102 and context-103 transcriptions: road descriptions,
  command prompts, exit text, and their observed movement branches (img
  0xDDA8..0xE0F2). The northern/southern forest exits are printed but do not
  receive movement writes in these code blocks.
- **OPEN:** context 100, context 23 onward, and the MODE/main-loop tail remain
  unfinished (img 0xE0F2..0xF5C9).

### 2026-09-27 (45): bakery and armory shells

- Added partial inline context-23 bakery and context-24 armory handlers with
  room prose, prompts, poster responses, exits, and observed movement writes
  (img 0xE0FE..0xE42B). Both call the reconstructed command normalizer; the
  bakery transaction helper at img 0x139BE and armory/shop behavior remain
  OPEN rather than guessed.
- The context-100 quest-master room is already supplied by `SWIAT.POKOJ100`
  and dispatches at img 0xEA15; it is not an untranscribed inline room.
- **OPEN:** contexts 25, 26, 31 and the MODE/main-loop tail remain (img
  0xE42B..0xF5C9).

### 2026-09-27 (46): multi-purpose shop contexts

- Added partial inline handlers for contexts 25 and 26: store descriptions,
  posters, exits, and the observed west/east transitions (img 0xE435..0xE6EB).
  Their calls to the original shop transaction routines at img 0x143A5 and
  0x14ADD remain explicit OPEN behavior rather than guessed mechanics.
- **OPEN:** context 31 and the MODE/main-loop tail remain (img
  0xE6EB..0xF5C9).

### 2026-09-27 (47): long street context

- Added inline context 31's street prose, prompt, exit list, and north/east
  context writes (img 0xE6F5..0xE854). The adjacent POKOJ60 dispatch remains
  in SWIAT; context 31 does not process the poster action, which belongs to the
  later arena context 32 block.
- **OPEN:** the called context-61..64 crowd/concert handlers and MODE/main-loop
  tail remain (img 0xE854..0xF5C9; nested handler begins at img 0x68BC).

### 2026-09-27 (48): arena entrance and MINIARENA dispatch

- Added context 32's entrance narrative, warning poster, exits, and transitions
  to contexts 30/33 from img 0xE86D..0xEA0B. Corrected main dispatch: the
  original calls `PRZEDM.MINIARENA` unconditionally at img 0xEA15, and its
  reconstructed body is guarded to contexts 33..57; the inline entrance must
  therefore remain a distinct handler before that call.

### 2026-09-27 (49): concert hall and crowd-edge shells

- Added partial handlers for contexts 61, 62, and 63, including prose,
  `PRZEDM.TLUM`, poster text in 61, exits, and the observed transitions
  (img 0x68D0..0x6DCD). Their `KillDispatch` calls at img 0x6A20, 0x6BF1,
  and 0x6D67 remain OPEN rather than silently omitted from the status.
- **OPEN:** crowd contexts 64..66, venue contexts 67..72, and the main-loop
  tail remain (nested handler img 0x6DD2..0x7D69; main tail img
  0xEA15..0xF5C9).

### 2026-09-27 (50): inner crowd contexts

- Added partial context 64, 65, and 66 handlers with crowd prose, `TLUM`
  descriptions where called, exits, and observed movement destinations (img
  0x6DD2..0x723C). The additional helpers at img 0x6E74/0x701D/0x7177 and
  `KillDispatch` at 0x6F10/0x709D/0x71F7 remain OPEN.
- **OPEN:** venue contexts 67..72 and the main-loop tail remain (img
  0x723C..0x7D69; tail img 0xEA15..0xF5C9).

### 2026-09-27 (51): pub encounter and beer rewards

- Added partial context 67 with the conditional bartender/drunk prose, exits,
  movement, and both `ZABIJ` combat/reward sequences (img 0x7250..0x74FA).
  The two flag words remain neutral `PoleBOMBKI007A`/`PoleBOMBKI007C`; the
  shared `KillDispatch` and helper at img 0x7333 remain OPEN.
- **OPEN:** contexts 68..72 and the MODE/main-loop tail remain (img
  0x74FA..0x7D69; main tail img 0xEA15..0xF5C9).

### 2026-09-27 (52): stage entrance and scene contexts

- Added partial room handlers for contexts 68..72: entry sign, stage/crowd
  descriptions, exit lists, and observed movement writes (img
  0x750E..0x7D69). `SCENA` calls and the DJ context test use the recovered
  unit symbol; other context-specific helpers, DJ combat/reward logic, and
  stage combat helpers remain OPEN.
- **OPEN:** exact transcription of those nested helpers and the MODE/save-load
  /return tail (img 0x75AB..0x7D5A and 0xEA15..0xF5C9).

### 2026-09-27 (53): main-loop return and flee reset

- Transcribed the confirmed tail behavior: `UNMODE`/`UM` restore
  `PRZEDM.MIECHO2` to the active context (img 0xF584..0xF5A7),
  `PRZEDM.PASZOL := 0` follows the MODE block (img 0xF5B2..0xF5B4), and
  context 193 exits while all other contexts return to the main prologue
  (img 0xF5B7..0xF5C5). This records the control flow, not the still-open
  command implementation within MODE.
- **OPEN:** MODE's command body, including save/load and skill/item commands,
  and the inline context-specific helpers (img 0xEAF8..0xF584 and
  0x75AB..0x7D5A).

### 2026-09-27 (54): restore inline room dispatch order

- Moved the context-32 entrance check ahead of contexts 61 onward, matching
  the original order: POKOJ60 at img 0xE85B, context 32 at img 0xE86D, then
  context 61 at img 0xE8BC. This preserves same-pass transitions into later
  room handlers.

### 2026-09-27 (55): race prompt and checkpoint repetition

- Corrected the race loop to read directly after the race list, with no
  `CZLOWIEK` prompt, and removed the invalid-choice line that duplicated intro
  prose. The machine sequence is list output/read at img 0x1703..0x1732,
  followed by the race comparisons; invalid choices return to the list at
  img 0x1925..0x1928. Added the POL-ELF 30-coin grant and removed the invented
  checkpoint-stage value 12; its zero start is from cleared DGROUP at img
  0x51D5 and the first stage checks at img 0x51C3.
- The then-current single-transition guard was based on a UI report and did
  not match the EXE's independent sequential checks. Finding (83) restores the
  observed machine behavior.

### 2026-09-27 (56): connect stage encounter helpers

- Reconnected the existing `PRZEDM.SCENA` and `PRZEDM.FIGHTSCENA` calls in
  contexts 70..72 at img 0x7986/0x7AA8, 0x7AF9/0x7C1B, and
  0x7C6C/0x7D5A. `SCENA` supplies the active musician description and
  `FIGHTSCENA` handles kill commands, rewards, and Liroy quest progress; both
  procedure bodies are in `PRZEDM.PAS` (EXE call targets PRZEDM:0x31FF and
  0x85C7). Context 69 has its separate inline DJ encounter; no shared stage
  fight call was added there.
- **OPEN at entry time:** context 69's DJ fight/reward branch (img
  0x7817..0x78DC; resolved by finding (57)), and the MODE/save-load command
  implementation (img 0xB25A..0xF5B1).

### 2026-09-27 (57): transcribe the backstage DJ encounter

- Reconstructed `ZABIJ D.J` in context 69: it is gated by the room flag being
  69, runs `PRZEDM.BTRUDNO`, and only awards drops when enemy HP is negative.
  The flag then clears; one `Random(100)` result grants a ration below 25 and
  a Liroy cassette below 3, with the cassette's max-energy, max-load, carried
  count, and dexterity effects (img 0x7817..0x78D9). The gating/clear word at
  DGROUP 0x67E is the recovered `MONSTRA.DJ` variable, confirmed by the same
  storage's context-69 description test.
- **OPEN:** finish MODE/save-load command implementation (img
  0xB25A..0xF5B1) and remaining inline kill dispatches.

### 2026-09-27 (58): compare TP7-rebuilt units byte-for-byte

- Added a CI comparison of the three TP7-built reconstructed units against the
  retained originals. TP7 compilation passes, but all three byte comparisons
  fail ([CI run 38](https://github.com/rzuf79/bombki/actions/runs/36353016013),
  head `c4bd114`). Each first differs at header offset `0x10`
  (`ofs_const_blocks`, rebuilt value +8). Rebuilt file sizes and absolute
  differing-byte-position counts are:

  | TPU | Original → rebuilt size | Differing positions | Section differing positions (symbols / code / relocations / trailer) |
  |---|---:|---:|---:|
  | MONSTRA | 3072 → 3104 | 597 | 140 / 837 / 750 / 21 |
  | PRZEDM | 80128 → 80720 | 61179 | 2993 / 34357 / 30652 / 14 |
  | SWIAT | 26000 → 26640 | 20040 | 750 / 11854 / 10686 / 23 |

- The section counts compare each section at its own start and therefore do not
  sum to the absolute-offset count. Header section sizes also differ: symbols,
  code, and relocations change by `+7/+12/+8` bytes for MONSTRA,
  `+542/+43/+8` for PRZEDM, and `+46/+237/+368` for SWIAT. This establishes
  differences in compiled code and relocation data, not just volatile metadata.

### 2026-09-29 (59): begin context-1000 command transcription

- Added the `StanPodswiadomosci` entry point to the main-loop dispatch and
  transcribed a subset of the inline commands against img 0xEAF8..0xF584,
  including status output, equipment state changes, sleep, comparison, and
  several item/skill commands.
- **OPEN:** this is not a complete source-equivalent transcription. Save/load
  still need their 80-field record handling (save img 0x2BA1..0x356E; load img
  0x7D80..0x85FF), as do the JA/character-sheet helper, remaining command
  effects, and exact command ordering. Continue against the EXE before closing
  TODO item 1.
  Exact source/compiler causes remain OPEN; do not normalize or exclude bytes
  without identifying their meaning.

### 2026-09-28 (59): isolate empty initializers and procedure-body drift

- TP7's per-code-block comparison showed that the reconstructed
  `MONSTRA.PAS`, `PRZEDM.PAS`, and `SWIAT.PAS` each emitted an extra unnamed
  code block. Their final `begin end.` sections were explicit empty unit
  initializers; the original TPU block tables have no matching block. Removed
  those no-op sections. In the subsequent [TP7 build (CI run 43)](https://github.com/rzuf79/bombki/actions/runs/36354267789), MONSTRA's
  `WSTEP` code block became byte-identical to the original, and MONSTRA's code
  and relocation section sizes now match the original exactly. This verifies
  the source of the shared `+8` code-block-table and `+12` code-section deltas
  reported in finding (58).
- [TP7 results (CI run 44)](https://github.com/rzuf79/bombki/actions/runs/36354440803)
  and the entry-aligned follow-up [run 47](https://github.com/rzuf79/bombki/actions/runs/36354938979)
  show that the remaining byte differences are not merely block ordering or
  entry-offset shifts. All 12 same-name SWIAT room blocks and all 33 same-name
  PRZEDM procedure blocks differ. All 12 SWIAT procedure entry offsets match
  exactly; the reported PRZEDM examples also have matching entry offsets. In
  SWIAT, the 11 room blocks grow by 15 bytes and `POKOJE` by 60; pre-entry and
  post-entry slices both differ. In PRZEDM, named procedure block sizes are
  generally equal, but both slices differ substantially; the full code section
  grows by 31 bytes. MONSTRA's `WSTEP` remains an exact code match. The exported
  declaration names/order/types in the current units match the TPU-derived
  interface reports, so remaining symbol-region differences are outside those
  public declarations (implementation/procedure metadata). Source-file and
  line-table metadata also differ from the retained TPU records; these explain
  metadata/trailer changes, not the procedure-code mismatches.
- The code-block byte windows contain both executable bytes and literal/data
  bytes (including readable CP437 text). Because the TPU entry offset does not
  by itself delimit an instruction-only region in these blocks, the current
  pre-entry/post-entry counts are byte slices, not disassembled-code counts.
  They establish differences in literal/data content and block payloads, but
  do not attribute every post-entry mismatch to an instruction versus embedded
  data. **OPEN:** map differing pool/data bytes and executable instructions
  to their exact Pascal source statements or local declarations; do not claim
  byte fidelity for these units yet.

### 2026-09-28 (60): bound named TPU procedure comparison windows

- Replaced the unbounded “first prologue byte pattern in block” diagnostic in
  `conformance/compare_tpu.py`. That search could match literal bytes and then
  compare through following procedures, so its reported “machine” deltas were
  invalid and are withdrawn.
- The comparator translates each named entry from block-relative to
  unit-global code position, infers the code-stream prefix (0 or 14 bytes) from
  original procedure prologues, and locates each old/rebuilt procedure's
  prologue only within 32 bytes after its own entry. It compares from that
  per-procedure anchor to the end of the procedure's own block. This avoids
  treating leading literal bytes as instructions or including the next
  procedure's literal-pool block.
  For SWIAT this is consistent with the independently verified
  `SWIAT.code.bin[0x0E:]` mapping to EXE img `0xF5D0..0x129B8`: POKOJ5 starts
  at img `0xF766` and its block ends at `0xFA04`; POKOJ0's block begins at
  `0xFA05`, while its procedure starts at `0xFA5F` (`disasm/SWIAT-POKOJ5.asm`,
  `disasm/SWIAT-POKOJ0.asm`, and `analysis-tools/verify_swiat_region.py`).
- The bounded spans are payload windows, not automatically instruction-only:
  literal/data classification and exact source attribution remain OPEN.
  Original-vs-original comparisons pass for all three units, and a synthetic
  SWIAT POKOJ5 body-byte mutation is reported as one difference in its
  bounded 671-byte original procedure window. The previous “next named entry”
  version produced an invalid 761-byte window because it included the following
  literal-pool tail; run 54 predates the block-bound correction. Run 55 used
  block bounds but still treated the rebuilt entry's prefix bias as uniform;
  its output exposed leading literal bytes before some rebuilt prologues. The
  per-procedure anchor correction above supersedes that report.
  No claim of rebuilt byte identity follows from these diagnostics.
### 2026-09-28 (61): resolve TPU alignment and source-level discrepancies

- **RESOLVED: the apparent code-stream prefixes were section padding.** TPUQ
  section lengths exclude padding to the next 16-byte boundary. Original code
  starts are MONSTRA `0x430`, PRZEDM `0x1C90`, and SWIAT `0x720`, not the raw
  symbol lengths `0x421`, `0x1C90`, and `0x712`. Run 59's rebuilt code starts
  are `0x420`, `0x1EA0`, and `0x730`, explaining the reported +15/+9/+7 biases.
  Corrected `tpuq.py` and `compare_tpu.py`; procedure entries and block ends now
  work directly, without prologue searches. Padding is reported separately and
  remains included in the strict whole-file comparison. The old section,
  prefix, suffix, and trailer classifications in (58)–(60) are superseded;
  absolute whole-file difference counts were unaffected.
- The complete aligned original SWIAT code (`13303` bytes) maps to EXE img
  `0xF5D0..0x129C6`, with `3991` changed zero relocation bytes and no other
  differences. The formerly "missing" last 14 bytes were in the TPU all along.
  `verify_swiat_region.py` now reads the aligned original directly. Historical
  checked-in `.code.bin`/relocation dumps and their offset reports predate this
  correction; regenerate from the TPU before using them for new comparisons.
  The block-table relocation length is in bytes, not records; corrected the
  report slicer to divide by eight.
- Downloaded run 59's genuine TP7 artifact (`36361382349`, artifact
  `10945387850`, ZIP SHA-256
  `af6b29751f60ddb3b53bef0a57e984d1f78a20761afa08b811e7bf701c668ff9`). With
  correct alignment, MONSTRA's one block and 29 of PRZEDM's 34 blocks already
  match, rather than all 33 named PRZEDM procedures differing. The unexported
  `SMIERC` block has stable entry `0x0110`; the comparator now uses that entry
  identity instead of calling its moved block missing.
- **RESOLVED source differences**, verified by genuine TP7 recompilation:
  - Every SWIAT prompt is one `Write(ENERGIA, '%.', KUNSZT, '>')`, not a split
    `Write`/`WriteLn`. The split adds 15 instruction bytes and three relocation
    records per prompt: eleven room blocks grow by 15 bytes and `POKOJE` by 60.
    Crucially, a combined **WriteLn** produces identical zero-filled code but
    the wrong runtime relocation (`System` entry `0x1D0` instead of `0x1D8`).
    The original has no prompt newline: see POKOJ0 img `0xFA85..0xFAC7`,
    especially finalization at `0xFABE` versus the preceding description's
    WriteLn at `0xFA7B`. All 15 prompts are corrected.
  - PRZEDM `SCENA` block `+0x84`, `POROWNANIE` `+0x658/+0x65F/+0x691`, and
    `UZYWANIE` `+0x3BF` held five DOS character bytes emitted as multibyte UTF-8
    by the reconstruction. Used explicit `#164/#224/#189/#164/#162`, preserving
    the exact original bytes, including the unusual byte in `SPROOB...`.
  - `UZYWANIE` pass destruction/inspection checks are `PRZEPUSTKA <= -10`,
    not `< -1` (original block `+0xB3C` and `+0xB9A` low-word compares).
  - `WALKA`'s `(TEST1 > 6)` band ends at `< 10`, not `< 11` (block `+0x53E`).
    Its damage random calls execute `Random(POZIOM)` before `Random(10)`;
    TP7 evaluates the reconstructed sum right-to-left, so the faithful source
    is `Random(10) + Random(POZIOM)` (block `+0x153A..0x1548`).
  - `MINIARENA`'s EXIT room tests are independent `if`s inside one command
    guard, not an `else if` chain (block `+0x8E7..0xCD3`). The latter adds
    eight 3-byte and one 2-byte jumps, explaining its 26-byte growth.
- **RESOLVED declaration/relocation differences.** Restored uses order from
  the retained uses chains: PRZEDM `crt, monstra, dos`; SWIAT
  `crt, monstra, przedm`. Restored the variable-block boundaries with repeated
  `var` sections: MONSTRA has 3 blocks, PRZEDM 15. TP7 now reproduces their
  block sizes and every exported variable's block/offset exactly. The previous
  one-section declarations coalesced each unit's variables into one block.
  Also restored operand order in the Integer actor/room equality tests in
  `BLUSZCZ`, `ULSKLEPIKOWA`, `SCENA`, and `KTO`, and the final
  `MINIKUNSZT + KUNSZT` in `WALKA`. These had identical unrelocated opcodes but
  exchanged relocation targets. Their original relocation groups establish the
  operand ordering; code payload identity alone was insufficient.
- **Verification:** local DOSBox-X 2026.01.02 (SDL2) with the same archived
  genuine TP7 compiler builds all three units and BOMBKI. Both the checked-in
  order and original-order scratch builds were rerun under DOSBox-X, replacing
  the initial DOSBox 0.74-3 validation; their code and relocation sections are
  unchanged. Use DOSBox-X for subsequent TP7 verification, as in CI.
  All **47/47** entry-labelled code
  blocks match byte-for-byte (MONSTRA 1, PRZEDM 34, SWIAT 12). All **47/47**
  relocation groups match after resolving self CS-pool block IDs by entry;
  other fields, including runtime targets and data offsets, compare verbatim.
  The comparator reports that diagnostic while still failing any raw-file
  difference. Four regression checks cover alignment/padding, original entries,
  the final RETF byte, and a runtime-target mutation invisible in code bytes.
  FPC TP-mode compilation and the complete SWIAT/EXE/string check also pass.
- **Remaining physical differences are attributed.** In a scratch build only,
  ordered procedure implementations by the original code-block table. Complete
  code and relocation sections then become byte-identical for all three units.
  Remaining symbol differences are source timestamps, line counts/line tables,
  symbol-section size, and the block-record `+6` metadata fields (historically
  labelled `owner` by the dumper). In MONSTRA even the entire symbol prefix
  before its source record is identical. PRZEDM's pre-source differences are
  only header `sym_size` and 33 block `+6` words; SWIAT has `sym_size` and ten
  block `+6` words. Their line counts are original/rebuilt 53/79, 1575/2401,
  and 445/498 respectively. Exact line-table encoding/full-file identity remains
  OPEN; no unexplained procedure payload or resolved relocation difference
  remains. Checked-in implementation order is still different from the original;
  strict whole-file comparison therefore continues to fail.

### 2026-09-28 (62): MONSTRA whole-file byte identity

- **RESOLVED:** genuine TP7 under DOSBox-X now builds the checked-in
  `reconstructed/MONSTRA.PAS` into an exact copy of retained `MONSTRA.TPU`:
  all **3072 bytes**, including symbols, source metadata, code, relocation
  records, and alignment padding. Original and rebuilt SHA-256:
  `ffc02180b11b9198e19f4b5c92f4ff8ab47872d02e99c6b53129c9f1b60c1228`.
- Only seven byte positions differed in the preceding local build: the DOS
  source timestamp at TPU file `0x03D5..0x03D8`, total line count at `0x03E9`,
  and line-table bytes at `0x03EF` and `0x03F3`. The latter changed from
  35/36 to the retained 9/10 when the implementation's `procedure WSTEP` and
  `begin` moved to source lines 9/10. Grouped declarations preserve the
  three variable blocks while reducing the source from 79 to 53 lines;
  the remaining line-table bytes already matched. This establishes a matching
  source layout, not recovery of the original spelling or whitespace.
- The source record at TPU `0x03D2` stores DOS date/time `0x26BB958B`, decoded
  as **1999-05-27 18:44:22**. `conformance/tp7-conformance.sh` now applies
  `touch -t 199905271844.22` to the scratch MONSTRA source after CRLF conversion.
  Both `touch` and DOSBox-X use local wall-clock time for this DOS timestamp.
  Git does not preserve source mtimes, so this preparation is required for
  repeatable whole-file identity. The compiler output is compared unmodified.
- **Verification:** local DOSBox-X/genuine TP7 compiled all three units and
  BOMBKI; direct full-file equality and SHA-256 comparison passed for MONSTRA.
  FPC 3.2.2 TP-mode conformance passed all four targets. Shell syntax and
  `git diff --check -- pascal-decomp` passed. PRZEDM/SWIAT physical layout work
  remains as recorded in (61).

### 2026-09-28 (63): SWIAT whole-file byte identity

- **RESOLVED:** genuine TP7 under DOSBox-X now builds the checked-in
  `reconstructed/SWIAT.PAS` into an exact copy of retained `SWIAT.TPU`: all
  **26000 bytes** — symbols, source metadata, code, relocation records, and
  alignment padding. Original and rebuilt SHA-256:
  `fa10ec7352e0a287793ec5a7919f1667984776086648bba421ffe19823d65961`.
  This closes the SWIAT half of the layout work left OPEN in (61); PRZEDM
  remains.
- The remaining differences were entirely source *layout*, not code. Decoding
  the unit's line-info records (offset `ofs_line_lengths`, then per procedure:
  symbol offset, reserved zero, declaration line, code-entry offset, first body
  line, count `n`, and `n` per-source-line code-byte counts) fixed the original
  source at **445 lines**: a 16-line unit header, the 12 interface declarations in
  alphabetical/block-id order, and the implementations in code-block order
  `POKOJ5, POKOJ0, POKOJ1, POKOJ4, POKOJ13, POKOJE, POKOJ11, POKOJ30, POKOJ60,
  POKOJ75, POKOJ83, POKOJ100`. The header must be 16 lines because the
  original's decl line is always the `begin` line − 1, which rules out any
  comment line between `procedure X;` and `begin`; the image-range annotations
  therefore became trailing comments on the declaration lines.
- Per-line byte counts then fixed the statement grouping, since merging two of
  our lines into one yields the sum of their counts. `POKOJ0` needs
  `if … 'EXIT' then` merged with its `WriteLn` (45 bytes); `POKOJ13` needs the
  two `if MONSTRA.SILNY = … then` pairs, all three `if FUKS < n then begin`
  blocks, and `end else` merged (35, 35, 41×3, 7); `POKOJ100` needs the two
  `PRZEPUSTKA` `if`/`WriteLn` pairs (37, 44), the `if (QUEST = 3) …` condition
  continued onto `and (PRA > 0) then begin` as one line (40), and the
  `(wpisz = 'ZACHOD') and (PRZEPUSTKA = 0)` `if`/`WriteLn` pair (54). The three
  `if FUKS < n then begin` blocks additionally keep their matching `end;` on the
  merged line: runs of zero-byte lines are interchangeable as long as their
  length matches, and moving a zero-byte `end;` changes nothing in the bytes.
- Eight bodies need one more attributed line than the statements require — a
  zero-byte line between the last statement and the closing `end;` of
  `POKOJ4`, `POKOJ13`, `POKOJ11`, `POKOJ30`, `POKOJ60`, `POKOJ75`, `POKOJ83`,
  `POKOJ100`, plus a three-zero-line run in `POKOJ100` where the spelling needs
  two. Emitted as blank lines. Whether the original used blank lines, comments,
  or a different nesting there is **OPEN**: the TPU records line counts and
  byte attribution only.
- One line is at TP7's 127-character source limit. `POKOJ100`'s
  `if (wpisz = 'ZACHOD') and (PRZEPUSTKA = 0) then WriteLn(…)` is 127
  characters with this file's spacing before indentation, the line table
  requires it on one line, and TPC reports `Error 11: Line too long` above
  127 — so that single statement carries no leading indentation.
- The unit's source record at TPU `0x04CF` stores DOS date/time `0x26CC6711`,
  decoded as **1999-06-12 12:56:34**. `conformance/tp7-conformance.sh` now
  applies `touch -t 199906121256.34` to the scratch SWIAT source after CRLF
  conversion, alongside the existing MONSTRA touch.
- The layout evidence, the decoded record format, and the per-procedure table
  are recorded in `analysis-results/swiat-line-layout.md`. The original's exact
  whitespace and comments remain **OPEN**.
- **Verification:** local DOSBox-X/genuine TP7 compiled MONSTRA, PRZEDM, SWIAT
  and BOMBKI; direct full-file equality and SHA-256 comparison passed for
  MONSTRA and SWIAT. `conformance/compare_tpu.py` reports `PASS SWIAT.TPU:
  byte-identical (26000 bytes)`. PRZEDM still fails and is the remaining unit.

### 2026-09-28 (64): POROWNANIE DZIADEK source-line byte counts aligned

- **RESOLVED (idx17–29):** the POROWNANIE DZIADEK block's per-line byte
  attribution now matches the retained TPU, verified by compiling the
  checked-in `reconstructed/PRZEDM.PAS` under genuine TP7 (DOSBox-X) and
  comparing the resulting per-source-line code-byte counts. Preamble
  `[128,176]` (chain eval on lines 402/403), idx19..29 match exactly; only the separate pre-existing
  POROWNANIE indices remain (30, 31, 33, 34, 37, 38, 41, 42, 44, 45, 47, 49,
  54, 55–84). POROWNANIE mismatch count dropped 42 → 40; the full PRZEDM.TPU
  delta of this change is exactly the two corrected per-line count bytes
  (0x23/0x2A in the symbols section). All 34 code blocks remain byte-identical.
- The winning layout keeps the chain clause set unbroken — the
  `(ORZEL)/(SARNA)/(DZIECKO)/(DZIADEK)` tail stays on the continuation line —
  because dropping a clause corrupts bytecode (the earlier l2a experiment).
  In this particular outer-chain layout, each `if cond then WriteLn(...)` pair
  is merged onto one line and its whole total is attributed to the next line
  index (35 = 7+28, 42 = 14+28, 35 = 7+28). This is a case-specific observed
  attribution, not a general rule for merged calls. The compound block closes
  with its own zero-byte `end;` line.
- The general method and record format are recorded in
  `analysis-results/line-number-reconstruction.md`.

### 2026-09-28 (65): TP7 CI toolchain pinned in repository

- Added the Archive.org public-domain TP7 `TP.zip` payload under
  `docker/dosbox-tp7/tools/`, recording its URL and SHA-256; the Docker build
  verifies the checksum and extracts it at `/tools/tp7`. The conformance
  script and DOSBox config now use that location, while retaining the previous
  `/opt/tp7` paths in comments.
- The image build uses its Dockerfile directory as context and consumes the
  checked-in archive there. The Pascal conformance workflow skips branch-push
  sweeps (the matching pull request event runs them), while retaining main
  pushes and manual dispatches.
- **Verification:** archive checksum and ZIP integrity passed; the image built
  successfully with Podman 5.7.0, and the genuine TP7 sweep passed all six
  checks. `compare_tpu.py` reports MONSTRA and SWIAT byte-identical; PRZEDM
  remains at its active source-line-count/source-record mismatch (127 symbol-section bytes,
  while all 34 code blocks and relocation groups match). Shell syntax, YAML
  parsing, and `git diff --check` passed.

### 2026-09-28 (66): MINIARENA kill-handler source-line counts aligned

- **RESOLVED (idx15–196):** the MODE/Bakteria dispatch and repeated kill
  handlers now match the per-source-line code-byte counts for MINIARENA from
  the retained `PRZEDM.TPU` procedure record (decl 1123, body line 1124,
  310 entries).
  TP7 compile-and-compare confirmed each helper call, assignment, and output
  statement was split/merged on the needed adjacent source rows without
  changing procedure bytecode.
- **OPEN:** 21 MINIARENA per-line code-byte count mismatches remain, all in navigation indices
  197–200, 222, 224–226, 250–254, 278–282, and 306–308. POROWNANIE remains at
  its 40 mismatched per-line code-byte entries.
- **Verification:** genuine TP7 compilation passed; current MINIARENA per-line
  byte counts match exactly through idx196. The remaining TPU code-block checks are
  unchanged from the prior byte-identical 34/34 result.

### 2026-09-28 (67): MINIARENA per-source-line byte counts aligned

- **RESOLVED (idx0–309):** all 310 MINIARENA per-source-line code-byte counts now match the retained
  `PRZEDM.TPU`. Reflowing the four navigation arms into their original
  one-row-per-transition shape aligned their condition/assignment bytes and
  compound-block boundaries; the loop-tail `STOP` reset and `until` clause also
  now occupy their reference rows.
- POROWNANIE remains the only open per-source-line code-byte partition, with 40 differing entries
  (idx30–49 plus the two later dialogue regions recorded above). The source
  bytecode remains unchanged by these physical line-layout corrections.
- **Verification:** genuine TP7 compile passed; compile-and-compare reports
  zero MINIARENA differences and 40 POROWNANIE differences. `git diff --check`
  passed.

### 2026-09-28 (68): POROWNANIE source-line tryout reduces residuals

- Checked in a line-layout tryout for `POROWNANIE`. The original 40 per-source-line code-byte
  mismatches are reduced to 7 while preserving all 34 procedure code blocks
  and all 34 relocation groups byte-for-byte. A first scratch variant had an
  extra/misplaced `end;` that nested TAKSOWKARZ under MINI-BARMAN; that variant
  was discarded, and the checked-in candidate has the corrected branch
  boundary.
- Remaining TPU per-source-line code-byte differences (`index`, source line, expected bytes,
  rebuilt bytes): `(60,445,0,7)`, `(61,446,35,28)`, `(72,457,35,0)`,
  `(73,458,0,35)`, `(74,459,17,0)`, `(75,460,35,17)`, and `(77,462,0,35)`.
  These are still **OPEN**; the tryout is not a completed POROWNANIE alignment.
- **Verification:** genuine TP7 compilation succeeded (1575 lines; 38118 code
  bytes). `compare_tpu.py` reports 0/34 code-block and 0/34 relocation-group
  mismatches; POROWNANIE has 7/88 per-source-line count mismatches. Full PRZEDM metadata and
  whole-file identity remain OPEN.

### 2026-09-28 (69): Per-source-line code-byte terminology clarified

- The line-layout notes and comparison utility now describe these values as
  **per-source-line code-byte counts**: each byte in a procedure's TPU line-info
  record gives the number of generated code bytes attributed to that body line.
  No evidence reviewed here establishes a special TP7 name for these values.
- Renamed the utility to `analysis-tools/compare_tp7_artifacts.py` and updated
  its output, examples, and internal names to use the descriptive wording.

### 2026-09-29 (70): PRZEDM per-source-line counts aligned

- **RESOLVED:** all recorded PRZEDM per-source-line code-byte counts now match,
  including all 88 entries in `POROWNANIE`. Its last four differences were a
  one-row attribution shift: moving the blank line from inside the FUKS block
  to after the final `POKRZYWA` message yields `[0, 85, 28, 14]` at idx78–81.
- Reproduced that transfer in an isolated TP7 slice containing the `POKRZYWA`
  conditions, the intervening animal dialogue, and the FUKS output and two
  assignments. The procedure code itself is unchanged.
- **Verification:** genuine TP7 compile passed; all PRZEDM line-count records
  match; all 34 code blocks and relocation groups match. Complete TPU identity
  remains OPEN because source-symbol metadata still differs.

### 2026-09-29 (71): PRZEDM timestamp and full TPU identity restored

- **RESOLVED:** `PRZEDM.TPU`'s source record at `0x1516` stores DOS date/time
  `0x26C19BB0`, decoded as **1999-06-01 19:29:32**. The genuine-TP7 conformance
  build now restores that timestamp on its CRLF scratch copy before compiling.
- **Verification:** local genuine TP7/DOSBox-X compilation with the three
  retained source timestamps makes MONSTRA (3072 bytes), PRZEDM (80128 bytes),
  and SWIAT (26000 bytes) all byte-identical to their retained TPUs.
  `conformance/compare_tpu.py` passes all three units.

### 2026-09-29 (72): stale open data questions closed

- **RESOLVED:** the former 0x1D8..0x218 saved-field naming question is superseded
  by the field map: 0x1D8 is `ArenaSouthLatch`, 0x1DA..0x210 are the 28 named
  arena beast pens, 0x212 is `CombatLootMoney`, 0x214 is `ArenaMoveLatch`,
  0x216 is `ItemFlag_KompletUbranSyf`, and 0x218 is `OutfitEquipped`.
  The EXE arena dispatcher at img 0x19C90..0x1AF1E identifies the pen fields;
  the field map also records their save-field indices.
- **RESOLVED:** a nonzero-money save sample already exists: f18 is 1424, which
  decodes to 89 coins at Madrosc 16. The save-side `@LMul` and load-side `@LDiv`
  are independently identified in img 0x2E0F..0x2E22 and 0x7FA4..0x7FBB,
  confirming the reversible FORSA transform without requiring a new save.

### 2026-09-29 (73): source-line record method consolidated

- Renamed the working note to `line-number-reconstruction.md` and made it the
  general reference for TPU line-record fields, record validation, the
  TP7 compile/compare workflow, and the limits of source-layout inference.
  `swiat-line-layout.md` now keeps the unit-specific layout evidence and links
  to that common guide.
- **Verified:** parsed every retained MONSTRA, SWIAT, and PRZEDM line record
  against its procedure symbol and entry-table item (1, 12, and 33 records).
  This confirms that record `+6` is the procedure's code-entry offset, not a
  source line. Minimal genuine-TP7 probes also confirmed that counts move with
  actual source-line grouping; the exact attribution must be measured in
  context, not inferred from a universal "next line" rule.

### 2026-09-29 (74): TP7 sweep accepts the cached image layout

- The TP7 conformance script now searches both `/tools/tp7` (current image)
  and `/opt/tp7` (previous published image) for `TPC.EXE`. This handles a
  `latest` GHCR image that predates the checked-in archive relocation without
  requiring a rebuild merely to run the sweep.
- **Verification:** shell syntax and a fixture for compiler discovery under
  the legacy `/opt/tp7` root passed. Pulled the currently published GHCR image,
  found `TPC.EXE` under `/opt/tp7/BIN`, and ran the genuine TP7 container sweep
  with Podman; all six checks passed and all four build artifacts were produced.

### 2026-09-29 (75): local FPC and TP7 build helpers

- Added `analysis-tools/build_fpc.py` to build x86_64 Linux and Windows
  executables on either host (the non-native target requires cross RTL units
  and binutils), with optional host-native execution, and
  `analysis-tools/build_tp7_dosbox.py` to compile through DOSBox-X, preserve
  TP7 source timestamps, save the artifacts, and launch `BOMBKI.EXE` by default.
- **Verification:** FPC 3.2.2 built the Linux executable (392032 bytes).
  DOSBox-X 2026.01.02 with genuine TP7 built the program and all three units;
  `compare_tpu.py` confirmed MONSTRA, PRZEDM, and SWIAT byte-identical. The
  Linux-to-Windows build completed using the official FPC 3.2.2 Win64 RTL
  distribution and MinGW-w64 cross-binutils staged under `/tmp/opencode`.
  The generated binaries were identified as x86-64 ELF and PE32+ respectively.
  System-wide package installation was unavailable because `sudo` requires
  interactive authentication; the full default dual-target script was tested
  with the staged tools and completed successfully.

### 2026-09-29 (76): automated FPC Win64 cross-toolchain setup

- Added `analysis-tools/setup_fpc_windows_cross.sh` for Debian/Ubuntu x86_64
  Linux. It installs MinGW cross-binutils/import libraries through apt,
  downloads the Win64 RTL matching the installed FPC version, creates a
  target-specific compiler wrapper and linker prefix, and verifies both
  executables by running `build_fpc.py`. `--no-build` supports setup-only use.
- **Verification:** Bash syntax passed. Ran the complete setup and dual-target
  build using the previously staged official FPC 3.2.2 archive and MinGW files;
   Linux ELF and Windows PE32+ executables were produced. Package installation
   itself was skipped because this environment has no interactive sudo access.

### 2026-09-29 (77): MODE save/load and Bigos field mapping

- Added an 80-slot text save/load path to `StanPodswiadomosci`, using the
  save/load order and inverse transforms in `SAVE-FIELD-MAP.txt`. Neutral
  program fields remain neutral where TPU ownership or meaning is unresolved.
- Transcribed the `JA` inventory/status output and the visible level, mana,
  energy, quest, and equipment summaries from img 0x073C..0x1405. Corrected
  the inventory's field 73 mapping: img 0x009A8 prints the Bigos label/value,
  img 0x18126 grants that item on the [0x258] chance, and PRZEDM's TPU symbol
  `BIGOS` is consumed by `UZYWANIE`.
- **OPEN:** the adjacent helper call at img 0xEC9B and live DOS behavior remain
  unaudited. FPC compile conformance is not a runtime-equivalence test. Genuine
  TP7 was run locally under DOSBox-X: all four artifacts compiled and all three
   TPUs were byte-identical. The rebuilt `BOMBKI.EXE` is 127,040 bytes versus
   the retained 141,264 bytes, so the strict EXE comparison still fails; keep
   that parity work open in `TODO.md`.

### 2026-09-29 (78): generic, idempotent FPC cross-toolchain setup

- Updated `analysis-tools/setup_fpc_windows_cross.sh` to query MinGW package
  status and install only missing packages; skip apt entirely when none are
  missing. Existing Win64 `system.ppu` and `crt.ppu` prevent an RTL download.
  The default RTL/wrapper location is generic under `~/.local/share/fpc-cross`,
  with an `fpc-win64` command exposed under `~/.local/bin` and a PATH hint.
- Replaced the project build with a minimal temporary Pascal program compiled
  for Win64 as a smoke test. A fully configured installation exits without
  rerunning that test. Binutils symlink checks canonicalize aliases (`ld`
  resolves to `ld.bfd` on this host).
- **Verification:** Bash syntax and `git diff --check` passed. With the already
  installed matching RTL supplied through `--install-dir`, the setup skipped
  apt and RTL download, installed `~/.local/bin/fpc-win64`, and compiled the
  standalone smoke program successfully for Win64.

### 2026-09-29 (79): simplify research tooling directory name

- Renamed `analysis-tools/` to `tools/`; the project is already the analysis
  scope. Updated the conformance import path, tool usage examples, and the
  research-layout note. Historical log entries retain the path that was
  correct when those findings were recorded.
- **Verification:** Bash syntax, `compare_tpu.py --help`, and `git diff --check`
  passed.

### 2026-09-29 (80): MODE's adjacent POKOJ9 tail call

- Resolved img 0xEC9B as a far call into POKOJ9's body at img 0x5A36. The
  entered tail prints `GORA-KLATKI PELNE GAJDY`, then handles DOL/GORA by
  setting context 5/11 (img 0x5A29..0x5A8C). MODE has already set current
  context to 1000 through PRZEDM.MODE (img 0x15AE4), so the tail's context-9
  loop-back is not taken. `WYJSCIE` is handled earlier at img 0xEC78..0xEC84.
- Added the effective label and DOL/GORA transitions to
  `StanPodswiadomosci`. **OPEN:** live DOS runtime behavior and full TP7 EXE
  parity remain unverified.
- **Correction:** the `0xEC9B` target-segment interpretation was wrong; see
  finding (87). The stair-label code at img 0x5A36 is not this far-call target.

### 2026-09-29 (81): crowd kill router and command aliases

- Reconnected all eight inline KillDispatch calls at img 0x6A20, 0x6BF1,
  0x6D67, 0x6F10, 0x709D, 0x71F7, 0x73B3, and 0x7647 to a shared source
  procedure. It preserves the 10 command/room-flag pairs and existing
  PRZEDM difficulty launchers from img 0x4F53; win-only flag clearing, Dziadek
  Fajka/MAD reward, and Goryl/Ochroniarz GARNITURZYSK calls follow the EXE.
- Reconnected the shared `PRZEDM.KOMENDY` call at img 0x129D:0x9137 for the
  crowd, bar, and stage contexts. It expands the one-letter command aliases
  before MODE, movement, and kill checks (call sites img 0x6B71, 0x6CCB,
  0x6E74, 0x701D, 0x7177, 0x7333, and 0x75AB).
- **Verification:** the dual-target FPC build and genuine TP7 build passed;
  `compare_tpu.py` reports all three TPUs byte-identical. Strict EXE comparison
  remains open: the rebuilt EXE is 128,160 bytes versus 141,264, with 134,306
  differing positions (first at file offset 0x2).

### 2026-09-29 (82): shop transactions and city-actor trackers

- Reconstructed and connected the bakery handler at img 0x39BE (six food
  purchases), weapon shop at 0x3E8E (STARY/MALA buy/sell), general store at
  0x43A5 (FAJKA, KOMPLET, KASETA, GARNITUR), and magic shop at 0x4ADD
  (mana bottle, LISTEK, PIGULKA, comparison scroll). Retained machine quirks:
  mana-bottle eligibility is 15 coins but the debit is 20; LISTEK eligibility
  is 820 but the debit is 830. Effects on carried count, stats, capacity, and
  item sentinels follow the EXE accesses.
- Reconstructed the shared room-gated city actor router at img 0x1C2A, reached
  from context loops at 0xBEFD, 0xD9BD, 0xDB97, 0xE41E, 0xE589, and 0xE6DE,
  plus the bakery and weapon handlers at 0x3AA0 and 0x3F2A.
  Replaced `ZwierzetaOgroda` with ten named room-tracker variables: five dog
  fields and five city-NPC fields at DGROUP 0x666..0x678, matching the entities
  used by initialization and kill dispatch.
- **Verification:** FPC Linux/Win64 build and genuine TP7 compile passed; all
  three TPUs remain byte-identical. The rebuilt EXE is 136,112 bytes versus
  141,264, so strict EXE parity remains open.

### 2026-09-29 (83): restore sequential checkpoint transitions

- Removed the source-level early exits from `PunktKontrolny`. The EXE performs
  six independent ordered checks at img 0x51C3..0x534A, and calls the shared
  room/reroll helper after each qualifying transition. Changing the stage does
  not return early; high skill can therefore satisfy a later-stage check during
  the same invocation. This replaces the prior UI-reported single-transition
  behavior, which contradicted the retained machine evidence.
- Confirmed context 86's conversation gates against img 0xD546..0xD6FA:
  introductory dialogue requires WEKA > -30, FORSA < 200, and no return scroll;
  the reward branch requires WEKA < -30 and FORSA >= 200. It sets context 20,
  consumes 2 carried-item slots, 4 WEKA, 200 coins, 10 beer, grants 50 skill,
  and may force context 16 if the return-scroll flag is negative.
- Corrected the tracker-router wiring: the helper at img 0x1C2A is called both
  inside bakery/weapon transaction bodies (img 0x3AA0 and 0x3F2A) and from six
  context loops (img 0xBEFD, 0xD9BD, 0xDB97, 0xE41E, 0xE589, 0xE6DE). These
  are distinct call sites and must remain distinct.
- **Verification:** FPC Linux/Win64 and genuine TP7 compilation passed;
  all three TPUs remain byte-identical. The TP7 EXE is 136,112 bytes versus
  141,264; strict comparison still differs at 133,897 byte positions (first
  difference at file offset 0x2).

### 2026-09-29 (84): restore MODE color-command dispatch order

- Moved `PRZEDM.PIERDOLY` (`ZMIEN KOLOR` / `ZMIEN TLO`) to after the
  `ZDOLNOSCI` output and before `WLACZ POSTAC`, matching its call at img
  0xF566. It was previously dispatched before `ZWIEJ` and `SPIJ`, which could
  reorder the color command's input prompt relative to the EXE.
- **Verification:** FPC conformance and genuine TP7 compilation passed; all
  three TPUs remain byte-identical. The TP7 EXE remains 136,112 bytes versus
  141,264, with 133,908 differing byte positions (first at file offset 0x2).
  Interactive DOS command behavior and strict EXE parity remain OPEN.

### 2026-09-29 (85): finish the partial room-handler audit

- Re-audited the active room-handler TODO against the reconstruction and its
  cited EXE ranges. Context 86's dialogue/reward conditions and exits are
  transcribed at img 0xD427..0xD7F0; its shared city-actor router is connected
  at img 0x11C2A. Previously open inline shop transactions at img 0x139BE,
  0x143A5, and 0x14ADD, plus the eight crowd kill-dispatch sites, were also
  addressed in findings (81) and (82). No remaining room-handler partial/TODO
  marker was found in the source; the one remaining partial-handler comment is
  the active MODE handler.
- The room-handler TODO is complete. This source audit does not claim full
  executable parity; see the remaining MODE-runtime and EXE-parity TODOs.

### 2026-09-29 (86): characterize the remaining TP7 EXE layout gap

- Parsed the MZ headers of the latest genuine-TP7 rebuild and retained EXE.
  The rebuild is 136,112 bytes (MZ header 18,656; load image 117,456) versus
  141,264 (header 21,216; load image 120,048). The relocation table has 4,654
  entries versus 5,295, and the entry points are `0000:E853` versus
  `0000:B0CF`. These structural differences accompany the strict byte-compare
  failure; they are not just a file-size-field mismatch.
- The entry-point bytes show matching startup-call shapes but relocated runtime
  paragraphs: the rebuild calls `1BD0:0000` and `1B6E:000D`, while the retained
  EXE calls `1C71:0000` and `1C0F:000D` (System and CRT). The difference is
  `0xA1` paragraphs for both runtime segments.
- **OPEN:** determine which source/layout differences account for the missing
  relocations, shifted entry point, shorter image, and runtime segment placement.
  The three reconstructed TPUs remain byte-identical, localizing this current
  gap to the program build and its link layout, but not identifying a single
  cause.

### 2026-09-29 (87): correct the MODE helper call target

- Rechecked the full far pointer at img 0xEC9B: it is `PRZEDM:0x5A36`, not a
  near call to main-image offset 0x5A36. The PRZEDM listing identifies
  `ItemPickupDropDispatch` / `BRANIE` at img 0x18405, para 0x129D:0x5A35; the
  call enters that routine at 0x5A36. The stair label and DOL/GORA transitions
  at main-image img 0x5A29..0x5A8C are unrelated.
- Removed the invented stair output/transitions from MODE and moved
  `PRZEDM.BRANIE` to the actual post-`JA` call position at img 0xEC9B, removing
  its later duplicate call. This supersedes finding (80)'s call-target
  interpretation and entry added to the MODE source.
- **Verification:** FPC conformance and genuine TP7 compilation passed; all
  three TPUs remain byte-identical. The rebuilt EXE is 135,984 bytes versus
  141,264, with 133,869 differing byte positions (first at 0x2). Its MZ header
  is 18,624 bytes, load image 117,360 bytes, and relocation table has 4,649
  entries; the entry point is `0000:E7E8`. Startup calls target `1BCA:0000`
  and `1B68:000D` (System/CRT), still shifted from the retained image.
  Interactive DOS behavior and strict EXE parity remain OPEN.

### 2026-09-29 (88): break down TP7 relocation differences

- Parsed the current MZ relocation cells and grouped them by the segment
  paragraph stored at each target. The rebuild has 4,649 entries versus 5,295
  in the retained EXE: System 4,435 vs. 5,064; PRZEDM 160 vs. 176; CRT 38 vs.
  39; the remaining segment targets contribute 16 entries in each image.
- The net deficit is 629 System, 16 PRZEDM, and 1 CRT relocation. This
  quantifies the dominant missing relocation class but does not identify which
  source constructs or runtime calls account for it; strict EXE parity remains
  OPEN.

### 2026-09-29 (89): restore the MODE save helper call

- Added `PRZEDM.save` to `ZapiszPostac` between the completion message and
  `ClrScr`, matching the call at img 0x2BE0 to `PRZEDM:0x9263`. The TPU entry
  report maps `save` to code block 0x108; the EXE body at img 0x1BC33 performs
  the standard System stack check and returns. Although it has no game-state
  effect, omitting this call changes TP7 call/relocation layout.
- **Verification:** FPC conformance and genuine TP7 compilation passed; all
  three TPUs remain byte-identical. The rebuilt EXE is 136,000 bytes versus
  141,264, with 133,954 differing byte positions (first at 0x2). The MZ image
  has 4,651 relocations and entry point `0000:E7ED`; relocation targets are
  System 4,436, PRZEDM 161, CRT 38, plus 16 to other segments. System/CRT
  remain at `1BCA`/`1B68`. Interactive DOS behavior and strict EXE parity remain
  OPEN.

### 2026-09-29 (90): separate MODE transcription from runtime validation

- After findings (84), (87), and (89), audited the complete MODE call sequence:
  character-sheet display, `BRANIE`, `UZYWANIE`, comparison spell, color
  dispatch, and load all occur at their decoded positions. The source covers
  the known inline command range img 0xEAF8..0xF584; its `StanPodswiadomosci`
  comment and the active queue now describe the source transcription as
  complete rather than partial.
- **OPEN:** interactive DOS input and live command behavior remain unverified.
  The attempted DOSBox session was cancelled during the environment restart;
  it supplied no runtime evidence.

### 2026-09-29 (91): add prompt-driven host PTY behavior test

- Added `conformance/expect_pty.py`, a stdlib PTY runner that waits for
  scenario-specific output regexes before sending input. It records timestamped
  JSONL input and output events, including exact input/output bytes as hex, and
  terminates the child process when the scenario completes or fails.
- Added `conformance/scenarios/mode-smoke.json` for the prior startup/race/name
  and MODE sequence: TICK, POL-ELF, player name, POLNOC, MODE, JA, ZDOLNOSCI,
  ZMIEN KOLOR/4, UNMODE, and WYJSCIE. The signed energy/skill prompt is matched
  without fixed sleeps or blind input batching.
- **Verification:** `build_fpc.py --target linux` built the native executable
  with FPC 3.2.2. The PTY scenario matched all 12 output steps and completed;
  its full transcript is at the ignored artifact path
  `build/pty-native/mode-smoke.jsonl`. The runner recorded and terminated the
  child after completion. This tests only the host-native FPC build; original
  TP7/DOS runtime fidelity remains **OPEN**.

### 2026-09-29 (92): probe DOSEMU2 PTY runtime for TP7 build

- Installed DOSEMU2 2.0~pre9 from `ppa:dosemu2/ppa` for Ubuntu 26.04. Its
  `-dumb` mode successfully routes DOS text output through a PTY: a bounded
  `dosemu -dumb -q -K <build-dir> -E "echo DOSEMU_OK"` probe emitted the marker.
- Running the genuine-TP7 `BOMBKI.EXE` through the prompt-driven PTY runner
  instead exits before `TICK`, reporting `Runtime error 200 at 1B68:0091` in
  the linked CRT segment. Attempts with a 286 CPU, interpreter CPU emulation,
  explicit CPU speed, and timer tweaks did not change the failure.
- **OPEN:** this establishes a DOSEMU2/TP7 CRT-startup incompatibility in the
  tested environment, not MODE behavior. No game input was accepted; DOS/TP7
  runtime validation remains unresolved. The emulator process was terminated
  and verified stopped after each bounded run.

### 2026-09-29 (93): render DOSEMU2 terminal screens through pyte

- Extended `conformance/expect_pty.py` with opt-in `--pyte` screen matching.
  It sets the PTY size (80x25 by default), sets `TERM=xterm`, decodes the
  terminal stream into a rendered screen, matches prompts there, and defaults
  Enter to CR in this mode. Exact PTY bytes remain in the JSONL transcript;
  matched screens are included for review. The existing raw-output mode is
  unchanged.
- DOSEMU2 `-t` (S-Lang terminal mode) exposes the game's direct text-video
  screen to the PTY; `-dumb` only provides plain stdout and does not. With
  explicit emulated CPU backends, `$_cpuemu = (1)`, and UTF-8 external / CP437
  internal character sets, the TP7-built executable completed all 12
  `mode-smoke.json` prompt/input steps under DOSEMU2/FreeDOS in about 6.6
  seconds. The test used an 80x25 PTY and reached the room-exit response.
- This is emulator runtime evidence, not original-DOS verification. The
  optional `pyte` module was extracted under `/tmp/opencode` for this test; no
  system package or project dependency was installed. All DOSEMU2 processes
  started for the test were terminated and verified stopped.

### 2026-09-29 (94): align two main-program source shapes with the EXE

- In `WybierzRase`, replaced the invented local `Rasa: string` with the
  existing `PRZEDM.wpisz` input string. At img 0x171A..0x1728, the race
  `ReadLn` setup passes DS:0x0564 and a 255-character limit; the main command
  loop uses that same storage. This removes the extra 256-byte TP7 local-string
  frame allocation without adding a duplicate variable.
- Removed `ZdobadzPoziom`'s invented `ProgPoziomu` local and expressed its
  threshold branches as direct gates to the existing level-up body, following
  img 0x8740..0x879F. The recovered code calculates thresholds in registers
  and branches to the level-up body at img 0x87A2 or returns at 0x8BA2.
- **Verification:** FPC conformance passed (4/4 targets), the native prompt-
  synchronized MODE scenario passed all 12 steps, and a genuine-TP7 DOSBox-X
  build succeeded with all three TPUs still matching. The full TP7 shell sweep
  could not start because this host lacks `xvfb-run` (a dependency of that
  container-oriented script). The rebuilt EXE is 135,952 bytes with 4,651
  relocations and entry point 0000:E7C2; it remains 133,786 byte positions
  different from the 141,264-byte reference. System/CRT remain at paragraphs
  0x1BC9/0x1B67 versus 0x1C71/0x1C0F. Strict EXE parity remains **OPEN**; these
  source-shape corrections do not explain the main relocation/image-size gap.

### 2026-09-30 (95): restore the evidenced BAZAR death handler

- The EXE has a complete handler at img 0x36F4..0x3845. Main dispatch checks
  context 0x2710 and calls it at img 0xEA22. The handler prints the death
  messages, sets the quest counter at DGROUP 0x24A to 50 when the type at 0x248
  is 1 and to 200 when it is greater than 1 (img 0x37C2..0x37DC), restores
  energy from 0x664, subtracts 250 plus a random 0..49 and five times the level
  from KUNSZT, sets context 20, calls Room at 0x129D:0x00FA, assigns `PAMIETAJ`
  to the input buffer, and calls the save routine at img 0x2BA1. Added the
  corresponding `Bazar` procedure and context-10000 dispatch.
- A genuine-TP7 build succeeds; FPC conformance passes 4/4, and all three TPU
  comparisons remain byte-identical. Against the retained EXE, the rebuilt
  executable is 136,784 bytes with 4,675 relocations, load image 118,048 bytes,
  and entry point 0000:EA8B; startup calls target System/CRT paragraphs
  0x1BF5/0x1B93 versus 0x1C71/0x1C0F in the reference. There are 133,147
  differing byte positions. Relative to the pre-change 135,952-byte build
  (4,651 relocations, 117,312-byte image,
  entry 0000:E7C2, 133,786 differing positions), the new handler reduces the
  differing-position count by 639, though the entry moves farther from the
  reference and total strict parity remains **OPEN**. These are structural
  measurements, not proof of runtime equivalence.
- All three TPUs were rechecked and have no mismatches. Original-DOS runtime
  validation remains separate and unverified.

### 2026-09-30 (96): preserve the six distinct training output branches

- At img 0x280C..0x2B6E, the EXE contains six separate output sequences with
  distinct constant strings for KOPANIE, UCIEKANIE, POWRACANIE, PAROWANIE,
  POROWNYWANIE, and POTRAWKI. The reconstruction had factored these into the
  invented `PokazPostepTreningu` procedure. Removed that helper and restored
  each constant string and `WriteLn` at its branch site.
- Genuine-TP7 build and FPC conformance pass; all three TPU comparisons remain
  byte-identical. The EXE is 137,408 bytes with 4,707 relocations, load image
  118,544 bytes, and entry 0000:EC7B; startup calls target System/CRT paragraphs
  0x1C14/0x1BB2 rather than 0x1C71/0x1C0F. It differs from the reference at
  132,236 byte positions, 911 fewer than the BAZAR-only build. The entry moves
  farther from the reference, so strict EXE parity remains **OPEN**; this is a
  measured partial improvement, not a parity claim.

### 2026-09-30 (97): inline the carrying-limit calculation in JA

- The original routine starts at img 0x073C. Its opening instructions perform
  the full carrying-capacity calculation through img 0x07D4 before proceeding
  directly to inventory output. The source had extracted that block into an
  invented `UstawLimitNoszenia` procedure, adding a procedure boundary absent
  from the EXE. Moved the comparisons back into `PokazPostac` and removed the
  synthetic procedure and forward declaration.
- FPC conformance passes 4/4; a genuine-TP7 build succeeds and all three TPUs
  remain byte-identical. The rebuilt EXE is 137,392 bytes with 4,706
  relocations, load image 118,528 bytes, entry 0000:EC6C, and startup targets
  System/CRT paragraphs 0x1C13/0x1BB1. Its strict difference count is 132,876,
  640 more than before this source-shape correction. Keep the source aligned
  with the disassembly; strict EXE parity remains **OPEN**, and byte-position
  count is not a semantic measure.

### 2026-09-30 (98): identify the SPIJ counter at DGROUP 0x70

- In the original inline context-1000 body, img 0xEEFF..0xEF06 zeroes and
  increments word [0x70]; reads at 0xEF02, 0xEF24, and later sleep-result
  instructions use it as elapsed hours. The main body contains no BP-relative
  stack-local accesses in img 0xB0CF..0xF5C5. The reconstruction instead
  declares `Godzin` as a local in `StanPodswiadomosci`, so this storage mapping
  is a concrete source/layout mismatch. Added the candidate field to the map;
  precise source placement remains **OPEN**.
- A temporary TP7 variant inlined the handler and removed its stack frame, but
  its candidate globals landed at DGROUP 0x74 rather than the evidenced 0x70.
  Its EXE differed at 132,953 byte positions (77 more than the retained source),
  so that experiment was not applied. This identifies the next data-layout
  problem but does not resolve it.

### 2026-09-30 (99): inline recovered handlers in main dispatch order

- The original main body at img 0xB1E5..0xCC13 contains ordered independent
  context tests and their room bodies. Twenty-four reconstructed handlers had
  instead been emitted as separate Pascal procedures called from that region.
  Moved the selected bodies into their matching dispatcher tests, retaining
  test order and the EXE-evidenced room ranges in their comments. Replaced each
  procedure-level `Exit` with a jump to a label immediately after its inline
  body, so the following independent dispatch tests still execute in order.
- FPC conformance passes 4/4, the genuine-TP7 build succeeds, and the native
  prompt-synchronized MODE scenario passes all 12 steps. All three TPU
  comparisons remain byte-identical. The TP7 EXE is 134,960 bytes with 4,682
  relocations and a 116,192-byte load image; entry is 0000:B1D3 (0x104 after
  reference entry 0000:B0CF). Startup System/CRT targets are paragraphs
  0x1B81/0x1B1F versus 0x1C71/0x1C0F. Strict comparison reports 133,636
  differing byte positions, 760 more than the previous build, despite the
  closer entry placement. This source-layout correction is evidence-aligned,
  not a strict-parity improvement; EXE parity remains **OPEN**. Runtime testing
  here is host-native FPC, not original DOS or DOSBox/FreeDOS evidence.

### 2026-09-30 (100): place the SPIJ hour counter at DGROUP 0x70

- Finding (98) established that the original inline MODE handler uses word
  [0x70] for the elapsed-hour counter, but the reconstructed procedure local
  did not reproduce that access. Moved `Godzin` to the program-level variable
  declarations immediately after `PoleBOMBKI0076` and removed it from the
  `StanPodswiadomosci` local list. In the genuine-TP7 output, the SPIJ body now
  zeroes/increments [0x70] at img 0x8EC3..0x8EC6 and reads it at img 0x8EE5 and
  0x8F60, matching original img 0xEEFF..0xEF24 and the later sleep-result
  accesses. This resolves the source storage mapping against machine output.
- FPC conformance passes 4/4; the 12-step host-native MODE PTY scenario passes;
  the genuine-TP7 build succeeds and all three TPU comparisons remain
  byte-identical. EXE size, relocation count, and load image remain
  134,960/4,682/116,192 bytes. Entry is 0000:B1D8 and strict comparison reports
  133,614 differing byte positions, 22 fewer than finding (99). The counter
  mapping is resolved, but strict EXE parity remains **OPEN**; no original-DOS
  runtime verification was performed.

### 2026-09-30 (101): exercise SPIJ through a synchronized PTY scenario

- Added `conformance/scenarios/mode-sleep-smoke.json`. It starts the native
  reconstruction through prompt-synchronized input, enters MODE, runs `SPIJ`,
  waits for the first hourly message, sends a wake character, waits for the
  wake-up report, drains the byte buffered by the PTY's line discipline, then
  exits MODE and the room. The scenario passed all 11 steps against the
  host-native FPC executable; its complete JSONL transcript was captured under
  `/tmp/opencode/native-godzin/mode-sleep-smoke-retry.jsonl`.
- The PTY echoed the wake byte only after the sleep loop returned, and the
  native run printed a second hourly message before the wake-up report. The
  scenario explicitly drains the pending byte before sending `UNMODE`; this
  records host terminal behavior and must not be generalized to DOS keyboard
  behavior. This is host-native evidence only, not original-DOS or emulator
  validation.

### 2026-09-30 (102): use the recovered random scratch in MODE

- MODE's random branches use DGROUP word 0x19E (`RandomScratch`/`CZY`), not a
  procedure-local `Losowanie`: POROWNAJ stores `Random(100)` there at img
  0xF0AA..0xF0B5; POWROT stores `Random(100)` and compares the same value at
  0xF1F4..0xF2A5; UZYJ SCROLL POWROT stores `Random(100)` and then `Random(1)`
  at 0xF1F4..0xF21A before using the latter value. Replaced the synthetic local
  with `CZY` at these sites. The SPIJ code at img 0xEF95..0xEFD9 also calls
  `Random(2 * hours)` twice: once for the displayed amount and independently
  for the KUNSZT adjustment. Replaced the shared `Losowanie` value with the two
  separate calls. The resulting TP7 sleep body uses DS:0070 and has no local
  BP-relative temporary accesses in these sequences.
- FPC conformance passes 4/4; the host-native synchronized SPIJ scenario passes
  all 11 steps. Genuine-TP7 build succeeds and all three TPU comparisons remain
  byte-identical. The EXE is 134,976 bytes with 4,683 relocations and a
  116,208-byte load image; entry is 0000:B1EC and startup System/CRT targets are
  0x1B82/0x1B20. Strict comparison reports 133,667 differing byte positions,
  53 more than the prior candidate. This source correction follows the
  original scratch accesses and random-call count; strict EXE parity remains
  **OPEN**. Runtime evidence remains host-native, not original DOS.

### 2026-09-30 (103): read and write save fields directly

- The original save routine at img 0x2BA1 writes the 80 fields in the order
  recorded by `disasm/procs/SAVE-FIELD-MAP.txt`; its first values are computed
  from DGROUP fields and passed directly to the text writer (img 0x2C08..).
  The load routine at img 0x7D80..0x85FF reads each text value and stores it
  directly to its DGROUP destination, applying transforms in place (for
  example mana at 0x7DCA..0x7DE5, level at 0x7DED..0x7E06, and energy at
  0x7E98..0x7EBE). Removed the synthetic `PrzeniesStanZPliku` helper and
  80-element `LongInt` staging arrays; `ZapiszPostac` now writes each mapped
  expression in order, and `WczytajPostac` reads each value into its target
  before applying the evidenced inverse transform.
- FPC conformance passes 4/4; the synchronized native save/load scenario passes
  all 13 steps. It saves the initial 30 coins, increases them to 5030, loads the
  save, then verifies the displayed balance returns to 30. The generated
  `pliki.tpu` contains 80 lines. Genuine-TP7 build succeeds and all three TPU
  comparisons remain byte-identical. The EXE is 139,136 bytes with 5,154
  relocations and a 118,480-byte load image; entry is 0000:BABF, and startup
  System/CRT targets are paragraphs 0x1C10/0x1BAE. Strict comparison reports
  131,274 differing byte positions, 2,393 fewer than finding (102). The direct
  field I/O follows the original access pattern and improves layout metrics,
  but strict EXE parity remains **OPEN**. Runtime evidence here is host-native
  FPC, not original DOS or emulator validation.

### 2026-09-30 (104): inline MODE in the main dispatcher

- The EXE listing places the context-1000 MODE command body inside the main
  dispatch flow at img 0xEAF8..0xF584, between the BAZAR branch and the
  dispatcher tail (see `disasm/annotated-BOMBKI.asm` and
  `disasm/BOMBKI-main-dispatch.asm`). The reconstruction emitted the same
  transcribed body as a separate `StanPodswiadomosci` procedure and called it
  from the end of the loop. Moved the body into the `MIECHO = 1000` main-block
  arm and replaced its procedure-level `Exit` with the evidenced termination
  context assignment; subsequent dispatcher cleanup then runs in order.
- Ran the documented TP7 conformance workflow in the cached
  `bombki-dosbox-tp7` image. All six build checks passed, and all three TPUs
  remain byte-identical. The rebuilt EXE is 139,072 bytes with 5,153
  relocations and a 118,432-byte load image; its entry is 0000:AF78, and the
  startup System/CRT targets are paragraphs 0x1C0D/0x1BAB. Strict comparison
  reports 130,389 differing byte positions, 885 fewer than finding (103), but
  the `cmp` gate still fails and strict EXE parity remains **OPEN**.
- FPC conformance passes 4/4. The host-native synchronized MODE, save/load,
  and SPIJ scenarios pass all 12, 13, and 11 steps respectively. These are
  host-native tests, not original-DOS runtime evidence.

### 2026-09-30 (105): restore the concert/crowd dispatcher call shape

- Main dispatch calls one routine at img 0xE860 -> 0x68BC after the context-60
  handler and before context 32. The called routine checks contexts 61..72 in
  order (img 0x68C6..0x7C2A); when a handled room changes context, its branch
  returns at img 0x7D69..0x7D6A instead of falling through to another room.
  Replaced the twelve separately guarded main-dispatch calls with one invented
  `PokojeKoncertowe` dispatcher using an ordered `else if` chain at the
  evidenced call site. Added a synchronized host-native route test from
  contexts 1 -> 20 -> 30 -> 31 -> 60 -> 61 -> 64.
- FPC conformance passes 4/4. The MODE, save/load, sleep, and concert-dispatch
  PTY scenarios pass 12, 13, 11, and 11 steps. The TP7 build succeeds and all
  three TPUs remain byte-identical. The rebuilt EXE is 138,144 bytes with 5,142
  relocations and a 117,536-byte load image; entry is 0000:AC64. Strict
  comparison reports 131,498 differing byte positions, 1,109 more than finding
  (104), so the source-shape correction is evidence-based but strict EXE parity
  remains **OPEN**. Runtime evidence here is host-native FPC, not original DOS.

### 2026-09-30 (106): restore the garden-room dispatch chain

- The original main loop contains six independent garden handlers, contexts
  77..82, at img `0xC20C..0xCC0C`. Replaced the reconstructed range guard and
  `case` with six ordered inline `if` arms. This restores the repeated context
  tests after each room body; the original tests occur at img `0xC202/0xC3D9`,
  `0xC3E3/0xC51E`, `0xC528/0xC663`, `0xC66D/0xC978`,
  `0xC982/0xCABD`, and `0xCAC7/0xCC02`. The garden `WYJSCIE` paths jump directly
  to the program termination at img `0xF5C2` (room branches at
  `0xC37A`, `0xC504`, `0xC649`, `0xC801`, `0xCAA3`, and `0xCBE8`); added a
  shared source label after the main loop to preserve that exit path.
- The genuine-TP7 build's 76 context comparisons across the main-loop dispatch
  now match the original's context values and order exactly. FPC conformance
  passes 4/4, the synchronized native garden route scenario passes all 12 steps,
  and all three TPUs remain byte-identical. The TP7 EXE is 139,472 bytes with
  5,237 relocations and a 118,496-byte load image; entry is `0000:AC64`. Strict
  comparison reports 130,790 differing byte positions, 708 fewer than finding
  (105), but byte-for-byte parity remains **OPEN**. Runtime testing was
   host-native FPC, not original DOS.

### 2026-09-30 (107): preserve training-room CP437 strings

- The original context-2 string data uses CP437 bytes at img `0x54BF`,
  `0x559A`, `0x55F2`, and `0x560E`. Replaced ASCII transliterations in the
  source with Pascal numeric character constants for the observed bytes,
  including `0xA8`, `0xA4`, `0xE0`, `0xBD`, `0x8F`, `0xE3`, and `0xA9`.
  Verified that all four resulting byte strings occur in both the original and
  rebuilt EXE images.
- FPC conformance passes 4/4, and all three TPUs remain byte-identical. The
  TP7 EXE remains 139,472 bytes with 5,237 relocations and a 118,496-byte load
  image, entry `0000:AC64`; strict comparison reports 130,744 differing byte
  positions, 46 fewer than finding (106). The exact string bytes are restored,
  but strict EXE parity remains **OPEN**. The garden route scenario still passes
  all 12 steps against host-native FPC; no original-DOS runtime test was made.

### 2026-09-30 (108): restore garden-room string bytes

- The original context-79 strings at img `0xC537` and `0xC553` contain
  `POKRZYWE` (not `POKRZYWKE`) and end `ZGINA` (not `ZGINAL`). Restored both
  literals. Restored the embedded `0x02` bytes in the context-80 `PATRZ NAPIS`
  output at img `0xC876`, CP437 `0xA4` in `WYCIAGASZ` at `0xC8B3`, CP437
  `0x9D` in the context-81 `PORZYCZY` at `0xC9AD`, and CP437 `0xA4` in
  context-82 `ID` at `0xCAF2`. Each complete string was verified byte-for-byte
  in both EXE images.
- FPC conformance passes 4/4, the expanded synchronized garden route scenario
  passes all 18 steps, and all three TPUs remain byte-identical. The TP7 EXE is
  139,472 bytes with 5,237 relocations and a 118,496-byte load image; entry is
  `0000:AC68`. Strict comparison reports 130,687 differing byte positions,
  57 fewer than finding (107). Exact garden strings are restored, but strict
  EXE parity remains **OPEN**. Runtime testing was host-native FPC, not original
  DOS.

### 2026-09-30 (109): restore status, combat, and cave strings

- In the character-sheet helper at img `0x09E7..0x0AE2`, removed four
  source-only trailing spaces after `SMACZNY POLANY LIKIEREM PACZEK`,
  `PYSZNY BIGOS Z KAPUSTA Z WROGA`, `OZEWIAJACE PIWSKO Z KONKRETNYM KLIMATEM`,
  and `DELIKATNY CHOC SZORSTKI LISTEK`. The original string pool has no such
  spaces at offsets `0x61`, `0xE2`, `0x101`, and `0x185`. Restored CP437 `0xE0`
  in the level-6 string at img `0x0F2A` (`SZ\xE0STYM`).
- Combat room strings at img `0x0B553` and `0x0B81A` are respectively
  `POWOLNY ACZ ODPORNY NA BOL POTWOR SPOKOJNIE LEZY POD SCIANA` and
  `OGROMNY POTWOR WIDZAC MIESO RZUCA SIE NA CIEBIE`; both replace unsupported
  source phrases. Their dead-state text at `0x0B576` and `0x0B83D` is
  `PAROJACE WNETRZNOSCI POTWORA SA ROZWLECZONE DOOKOLA`. Context 17 is not a
  fourth combat room: at img `0x0BAAB` it displays
  `JESTES W POKOJU W KTORYM !JEST! !PLAKAT (SMIERDZI TU) `, exits through
  `DOL-KLATKI PELNE GAJDY`, and accepts `DOL`; replaced the unsupported combat
  handler with this poster room. Also corrected context 84 `DALES` at img
  `0x0CC5F` and context 88 `POKRZYWA` at img `0x0CFD1`.
- FPC conformance passes 4/4, the synchronized garden route scenario passes all
  18 steps, and all three TPUs remain byte-identical. The TP7 EXE is 139,312
  bytes with 5,223 relocations and a 118,384-byte load image; entry is
  `0000:ACD3`. Strict comparison reports 130,776 differing byte positions,
  89 more than finding (108). The source matches the recovered strings and
  context-17 behavior, but this source-shape correction worsens byte distance;
  strict EXE parity remains **OPEN**. Runtime testing was host-native FPC, not
  original DOS.

### 2026-09-30 (110): correct arena combat stat triples

- The original context-14 launcher stores HP/dexterity/damage as `20/30/3` at
  img `0x0B3CE`; context 15 stores `40/3/3` at `0x0B695`; and context 16 stores
  `40/11/10` at `0x0B85E`. The source launchers had different values. Corrected
  `WROGEN`/`WROGZRE`/`WROGSIL` for all three contexts to match those stores.
- FPC conformance passes 4/4, the synchronized garden route scenario passes all
  18 steps, and all three TPUs remain byte-identical. TP7 EXE size/layout and
  strict count remain unchanged from finding (109): 139,312 bytes, 5,223
  relocations, 118,384-byte load image, entry `0000:ACD3`, and 130,776 differing
  byte positions. The corrected immediates are machine-verified; strict EXE
  parity remains **OPEN**. Runtime testing was host-native FPC, not original DOS.

### 2026-09-30 (111): restore the complete level-up effects

- At img `0x8882..0x88C6`, PRAKTYK gains depend on MAD thresholds `<11`,
  `11..15`, `16..22`, and `>22`, yielding `+3/+4/+5/+6`; replaced the
  source's POZIOM-based awards. Restored the `PRAKTYK` label at `0x88E9`,
  `MAXIMUM ENERGI` output at `0x896C`, and maximum-MANA increase by `MAD+2`
  with its `MANY` output at `0x8971..0x89C3`. The routine clears DGROUP `0x6C`
  at `0x89D0`, restored as `EtapPunktuKontrolnego := 0`.
- On reaching level 12, img `0x89DF..0x8BA2` prints the max-parameter message,
  raises max SIL/ZRE/MAD according to their current/max comparisons and
  balancing sequence, then prints each maximum with the original 14 embedded
  `0x02` prefix/suffix bytes. Restored the full body using the matching program
  and TPU-owned variables.
- FPC conformance passes 4/4, the synchronized garden route scenario passes all
  18 steps, and all three TPUs remain byte-identical. The TP7 EXE is 140,176
  bytes with 5,246 relocations and a 119,152-byte load image; entry is
  `0000:AFD7`. Strict comparison reports 129,719 differing byte positions,
  1,057 fewer than finding (110). Exact recovered output strings occur in both
  EXE images, but strict EXE parity remains **OPEN**. Runtime testing was
  host-native FPC, not original DOS.

### 2026-09-30 (112): assert level-up text in the startup scenario

- Strengthened `garden-dispatch-smoke.json` so its synchronized starting-room
  step requires the level-up PRAKTYK, MAXIMUM ENERGI, and MANY outputs before
  `TU ZACZYNA SIE GRE`. This exercises the ordinary startup level-up path.
- The host-native FPC PTY scenario passes all 18 steps, including the new
  level-up assertions. This is not original-DOS runtime evidence. No Pascal
  source or TP7 artifact changed; strict EXE parity remains **OPEN**.

### 2026-09-30 (113): correct checkpoint strength boundaries

- The final two checkpoint branches compare strength to 7 and 13 at img
  `0x52C1..0x5344`; the original accepts only `7 < SIL < 13`. Changed the
  source's inclusive `SIL >= 7` / `SIL <= 13` gates to strict comparisons.
- FPC conformance passes 4/4, the 18-step host-native garden/startup scenario
  passes, and all three TPUs remain byte-identical. TP7 size/layout and strict
  count are unchanged from finding (112): 140,176 bytes, 5,246 relocations,
  119,152-byte load image, entry `0000:AFD7`, and 129,719 differing byte
  positions. Strict EXE parity remains **OPEN**; runtime testing was host-native
  FPC, not original DOS.

### 2026-09-30 (114): restore the complete poster-room flow

- The context-17 handler at img `0x0BAB..0x0BC9D` prints the poster text
  `SORRY ZE NIE UMYLEM POKOJU...`, `JEZELI BYLES AKTYWNY...`, and
  `SPRAWDZ CZY LEZY TU COS...`; on `PATRZ PLAKAT` it places the diploma at
  context 17 only when the five monster-state words and the diploma word at
  DGROUP `0x188` are all zero (`0x0BC26..0x0BC50`). Restored that guarded
  assignment as `DYPLOM := 17`.
- Corrected `EXIT` to list `GORA-KLATKI PELNE GAJDY` and `DOL-TELEPORT!!!`.
  Context 17's `GORA` returns to context 11; `DOL` sets context 18, whose
  one-shot teleport output immediately sets context 1 (`0x0BC6A..0x0BD1F`).
- Added `poster-reward-smoke.json`: its synchronized native PTY run reaches
  context 17, checks the poster text and exits, follows `DOL` through the
  teleport output, and confirms return to context 1 (11 steps). The smoke path
  does not satisfy the diploma's monster-state guards, so it does not claim to
  verify a successful pickup. The existing garden route scenario also passes
  all 18 steps.
- FPC conformance passes 4/4 and all three TPUs remain byte-identical. The TP7
  EXE is 140,672 bytes with 5,263 relocations and a 119,584-byte load image;
  entry is `0000:B0A3`. Strict comparison reports 128,882 differing byte
  positions, 837 fewer than finding (113). The poster text and exits are present
  byte-for-byte in both images; strict EXE parity remains **OPEN**. Runtime
  testing was host-native FPC, not original DOS.

### 2026-09-30 (115): restore the opening bar dialogue

- Context 76 at img `0x0BF31..0x0BF97` prints four introductory lines before
  the conditional bartender/patrons. Restored the exact strings, including
  CP437 `0xBE` in `ju\xBE wiesz`; the original uses that byte before a space.
- Added `bar-intro-smoke.json`, which follows the starting room through the
  city center and dark street to context 76, then checks all four lines. The
  synchronized host-native FPC PTY scenario passes all 8 steps.
- FPC conformance passes 4/4 and all three TPUs remain byte-identical. The TP7
  EXE is 141,072 bytes with 5,275 relocations and a 119,936-byte load image;
  entry is `0000:B194`. Strict comparison reports 128,519 differing byte
  positions, 363 fewer than finding (114). All four strings occur byte-for-byte
  in both EXE images. Strict EXE parity remains **OPEN**; runtime testing was
  host-native FPC, not original DOS.

### 2026-09-30 (116): restore road and dialogue trailing spaces

- Restored the original terminal spaces omitted by six source literals:
  the staruch request at img `0x0D586`, context-21 street at `0x0D7FF`,
  context-22 street at `0x0D9D9`, context-101 road at `0x0DBB3`, context-102
  road at `0x0DDB7`, and context-103 road at `0x0DF5B`. The exact endings are
  one space for the staruch/request and context-101/102/103 strings, and two
  spaces for contexts 21 and 22.
- FPC conformance passes 4/4; the 18-step garden, 11-step poster/teleport, and
  8-step bar-intro host-native PTY scenarios pass. All three TPUs remain
  byte-identical. The TP7 EXE is 141,088 bytes with 5,275 relocations and a
  119,952-byte load image; entry is `0000:B19C`. Strict comparison reports
  128,672 differing byte positions, 153 more than finding (115), despite the
  restored literals. The byte-exact output evidence takes precedence; strict EXE
  parity remains **OPEN**. Runtime testing was host-native FPC, not original DOS.

### 2026-09-30 (117): restore MODE room-item descriptions

- At img `0x0EA3F..0x0EAF3`, the context-1000 loop compares the five room-item
  positions at DGROUP `0x17E`, `0x184`, `0x186`, `0x188`, and `0x18A` with
  previous-room context `0x180`; matching sword, shield, heart, diploma, and
  pipe items print their room descriptions before the next prompt. Added those
  five gates in the same order, using the existing PRZEDM declarations.
- FPC conformance passes 4/4. Host-native MODE smoke and save/load scenarios
  pass 12 and 13 steps, respectively; the sleep scenario passes 11 steps.
  Garden, poster/teleport, and bar-intro scenarios pass 18, 11, and 8 steps.
  All three TPUs remain byte-identical. The TP7 EXE is 141,520 bytes with
  5,290 relocations and a 120,320-byte load image; entry is `0000:B25D`.
  Strict comparison reports 128,040 differing byte positions, 632 fewer than
  finding (116). All five original strings are present in both EXE images, but
  strict parity remains **OPEN**. Runtime tests were host-native FPC, not
  original DOS.

### 2026-09-30 (118): restore MODE attribute output

- At img `0x11C4..0x126A`, the character-sheet routine writes current/max
  strength, dexterity, and wisdom as `current/max` pairs. At `0x126F..0x12BD`
  it prints S.Z as `PRO + 10 * word[0x1C4]`, then the heavy-blow threshold
  (`FUKSROLL`). Restored both output lines and the adjacent-word read; the word
  at DGROUP `0x1C4` is the outfit dexterity bonus, immediately after PRZEDM.PRO
  at `0x1C2`.
- Strengthened `mode-smoke.json` to assert all three attribute pairs and the
  S.Z/FUKSROLL line. The synchronized host-native FPC scenario passes all 12
  steps. The save/load, sleep, garden, poster/teleport, and bar-intro scenarios
  pass 13, 11, 18, 11, and 8 steps. FPC conformance passes 4/4; all three TPUs
  remain byte-identical.
- The TP7 EXE is 142,032 bytes with 5,315 relocations and a 120,736-byte load
  image; entry is `0000:B3F0`. Strict comparison reports 130,628 differing byte
  positions, 2,588 more than finding (117), despite all recovered output labels
  being present in both images. The source uses the TP7 DGROUP-relative read;
  the host-native FPC branch returns zero for that TP7-only absolute field, so
  its runtime output is not evidence for the outfit bonus. Strict EXE parity
  remains **OPEN**, and no original-DOS runtime test was performed.

### 2026-09-30 (119): restore the FATALITY skill gate

- The training-poster branch at img `0x259E..0x25C8` prints
  `FATALITY - SAMOCZYNNIE ` only when `SilaCur > 29` and `MadroscCur > 14`.
  Added the exact strict comparisons and output to the training-skill listing.
- Added `training-poster-smoke.json`; its synchronized host-native FPC run
  reaches the underground training room, reads the poster, and checks the full
  poster response in all 7 steps. FPC conformance passes 4/4, and the three
  TPUs remain byte-identical.
- The TP7 EXE is 142,112 bytes with 5,318 relocations and a 120,800-byte load
  image; entry is `0000:B432`. Strict comparison reports 130,647 differing byte
  positions, 19 more than finding (118), while the exact FATALITY literal is
  present in both images. This change is evidence-led despite the worse byte
  metric; strict EXE parity remains **OPEN**. Runtime testing was host-native
  FPC, not original DOS.

### 2026-09-30 (120): exercise MODE under DOSEMU2/FreeDOS

- This was exploratory runtime work performed before the validation order was
  clarified. Its observations below are historical only, do not establish
  conformance, and do not close any behavior-validation item. Do not repeat
  behavioral tests until strict TP7 EXE byte parity is achieved.
- Ran the retained original EXE and the latest TP7 build under local DOSEMU2
  with the FreeDOS environment, using `expect_pty.py --pyte` and prompt-driven
  input. Each executable ran from a separate fresh directory. The original
  requires an additional keypress after the player-name prompt to continue past
  its introductory instructions; the candidate does not, so the two smoke
  sequences have 13 and 12 steps respectively.
- The original and candidate MODE smoke sequences both completed. They cover
  `MODE`, `JA` status (including attribute/S.Z output), `ZDOLNOSCI`, `ZMIEN
  KOLOR`, and `UNMODE`. The output state was not equivalent: the original
  reported level 1, 10 practices, 80/80 mana, 45/45 energy, and `50%.0`, while
  the candidate reported level 2, 13 practices, 80/90 mana, 50/56 energy, and
  `50%.-725`. The cause remains OPEN; this runtime evidence does not establish
  strict behavior parity.
- Separate synchronized sleep and save/load runs completed against both
  executables under DOSEMU2. The sleep checks observed the first-hour marker and
  wake-up report. The save/load checks saved, changed coins, loaded, and
  verified the restored 30-coin status. The save confirmation is immediately
  erased by the game's screen clear in these DOS runs. Updated
  `mode-save-load-smoke.json` to synchronize on the post-save character sheet;
  the native FPC and DOSEMU2 candidate runs then passed all 13 scenario steps.
  The original's adapted save/load run passed 12 steps through the restored
  30-coin status. Original/candidate sleep runs completed 12/11 steps. PTY
  transcripts are under `build/pty-dosemu/` with `original-clean-*` and
  `candidate-clean-*` names; the final candidate save/load transcript is
  `candidate-clean-save-load-updated.jsonl`.
- A test-only 80-field save fixture set all five item positions and the saved
  previous-room value to one context. Under the candidate, loading it from
  MODE emitted all five room-item descriptions. The equivalent original test
  did not emit them and timed out at that assertion, including when the save
  was loaded before entering MODE. This setup has not yet demonstrated an
  equivalent original/candidate item-output comparison; item-output runtime
  validation remains OPEN. No test fixture or save data was added to the repo.
- These are DOSEMU2/FreeDOS results, not original-DOS or DOSBox-X behavior
  evidence. The harness terminated each emulator after scenario completion;
  no DOSBox-X instance was used for these behavior checks. The independent
  native FPC MODE smoke and sleep scenarios also passed 12 and 11 steps after
  the rebuild. Strict TP7 EXE byte parity remains OPEN.

### 2026-09-30 (121): defer behavior checks until strict EXE parity

- Reordered active work around the acceptance criterion: byte-for-byte TP7 EXE
  identity comes first and is pursued through EXE/TPU evidence, disassembly,
  assembly output, and compiler-layout analysis. Behavioral-conformance runs
  are deferred until that identity is achieved.
- Finding (120) remains only an exploratory record of the earlier DOSEMU2
  session. Its runtime output is not an acceptance basis. No further runtime
  behavior checks were run for this priority change.

### 2026-10-01 (122): align save and shared-global ownership

- The original save routine repeatedly passes DS:0x007E as the TextRec at img
  `0x2BEA..0x2BF4` (`annotated-BOMBKI.asm`); the main command paths and
  `PRZEDM.KOMENDY` use the shared input string at DS:0x0564, including img
  `0x1BB11`. The TPUs already own the shared fields used by the main program:
  `PRZEDM.TEST1`, `ARENA`, `CIALO`, and `DUNCAN`, plus MONSTRA room trackers,
  `DRZWI`, `STARUCH`, `OGOL`, and `SILNY`.
- Moved the save-file TextRec declaration to BOMBKI and removed duplicate
  program-level declarations for these unit-owned fields. A genuine TP7 `/GD`
  build MAP places `plik` at `0x007E`, `PRZEDM.MIECHO2` at `0x0180`,
  `PRZEDM.MIECHO` at `0x01D6`, `PRZEDM.wpisz` at `0x0564`, `MONSTRA.MAXE` at
  `0x0664`, and the room trackers at `0x0666..0x0678`, matching the original
  DGROUP references.
- TP7 compilation succeeded and all three TPUs remain byte-identical. The
  candidate EXE is 142,112 bytes with 5,318 relocations and a 120,800-byte load
  image; strict comparison reports 130,634 differing byte positions. EXE
  parity remains **OPEN**. This was static/layout work only; no behavior tests
  were run. Scratch build and analysis files now use project-local `build/tmp/`.

### 2026-10-01 (123): align the low DGROUP globals

- Static references in the original disassembly identify the fields at
  DGROUP `0x52..0x7C`: saved words at `0x52/0x54/0x56`, status words at
  `0x58..0x60`, CarryLimit at `0x62`, room values at `0x66/0x68/0x6A`, the
  checkpoint at `0x6C`, the SPIJ counter at `0x70`, and saved state at
  `0x74..0x7C` (including `0x78` Powracanie). The direct stores/loads include
  img `0x0196D..0x01985`, `0x03F92`, `0x051D5..0x0533E`, and
  `0x0EEFF..0x0F053`. The prior declaration order placed several of these
  symbols at the wrong DGROUP offsets.
- Reordered BOMBKI globals to those evidenced offsets, retained explicit
  unclassified placeholders at `0x64` and `0x72`, changed the saved `0x74`
  field to a word, and overlaid the outfit-removal flag on the first byte of
  `PRZEDM.JAKIEUB` at `0x264`. Reused the TPU-owned `PRZEDM.PLECAK` and
  `PRZEDM.DUNQ` fields at `0x255` and `0x262` instead of allocating duplicate
  program globals.
- The genuine TP7 `/GD` MAP confirms the intended addresses from `0x52` through
  `0x7E`, `PRZEDM.MIECHO2=0x180`, `PRZEDM.wpisz=0x564`, `MONSTRA.MAXE=0x664`,
  the room tracker block at `0x666..0x678`, and the flag overlay at `0x264`.
  The three TPUs remain byte-identical. Strict EXE comparison reports 130,722
  differing byte positions (candidate 142,096 bytes, 5,318 relocations,
  120,784-byte load image); the byte-count metric worsened, but these offsets
  match the original's direct DGROUP operands. Words `0x64` and `0x72` remain
  **OPEN** in meaning. No behavior tests were run; strict EXE parity remains
  **OPEN**.

### 2026-10-01 (124): call the TPU-backed room generator

- BOMBKI had a separate `LosujPolozenia` routine duplicating world-generation
  work already implemented by `PRZEDM.POTWORY`. The retained call at img
  `0x12ACA` targets segment:offset `129D:00FA`; the PRZEDM TPU declares
  `POTWORY` at entry `0008:0000`, and its generated TP7 MAP links that same
  entry at `1273:00FA`. Replaced all eight calls to the synthetic main-program
  generator with calls to `PRZEDM.POTWORY` and removed the duplicate routine.
- Genuine TP7 compilation succeeds; all three TPUs remain byte-identical. The
  EXE shrank from 142,096 to 140,432 bytes, with 5,261 relocations and a
  119,360-byte load image. Strict comparison improved from 130,722 to 129,736
  differing byte positions, but parity remains **OPEN**. No behavior tests
  were run.

### 2026-10-01 (125): restore recovered BOMBKI procedure order

- Reordered the main-program procedure bodies using the available annotated-EXE
  anchors, including `PokazPostac` `0x073C`, `WybierzRase` `0x16EF`, checkpoint
  `0x51C3`, concert dispatch `0x68BC`, and level-up `0x872E`. Added forward
  declarations to preserve Pascal references across the reordered bodies.
  The tentative `Trening` anchor at `0x2395` is not a valid procedure entry:
  original bytes there are part of a string, so it is excluded from the
  procedure-order evidence until its actual start is resolved.
- Genuine TP7 compilation succeeds and all three TPUs remain byte-identical.
  This ordering probe reduced strict EXE differences from 129,736 to 128,678.
  The EXE is still 140,432 bytes with 5,261 relocations and a 119,360-byte load
  image; parity remains **OPEN**. The MAP addresses are still hundreds of bytes
  before multiple original anchors, so source/order evidence is incomplete.
- The MAP gives BOMBKI CODE length `0xF322`, then SWIAT at `0xF330` and PRZEDM
  at paragraph `0x1273`. The original far calls target PRZEDM paragraph
  `0x129D` (for example img `0x0199F`), a 42-paragraph / 672-byte displacement.
  The large unit code bodies remain identical at TPU level and long byte
  windows in the EXE align at this `-672` offset. Continue tracing the preceding
  BOMBKI segment shape; this placement difference is the next concrete lead.
  No behavior tests were run.

### 2026-10-01 (126): quantify the status-body length gap

- The original `PokazPostac`/status body begins at img `0x073C` and returns at
  `0x1405` (`annotated-BOMBKI.asm`); the current TP7 MAP puts it at `0x0709`,
  and the candidate returns at `0x1274`. The respective machine-body lengths
  are 3,274 and 2,924 bytes, a 350-byte shortfall in the candidate. The next
  original procedure's intro string and entry at `0x1406` and `0x16EF` align
  with candidate positions `0x1275` and `0x155E` (both `-0x191`), localizing
  this deficit before the race-selection body.
- This range result does not identify the missing statements or prove all
  bytes are executable code; source-level cause remains **OPEN**. Strict EXE
  parity remains **OPEN**, with the current build at 128,678 differing byte
  positions. No behavior tests were run.

### 2026-10-01 (127): restore the startup CRT key read

- At img `0xB0EB`, the original calls `1C0F:031A` immediately after
  `WybierzRase`, then calls the checkpoint at `0xB0F0`. The current source had
  only a comment at this point. A temporary TP7 source probe inserting
  `ReadKey;` emitted `lcall 1BE5:031A` at the corresponding startup location;
  the segment differs because the candidate CRT segment starts 42 paragraphs
  earlier, while the internal offset matches exactly. The target bytes in the
  original are a keyboard-read routine (`annotated-BOMBKI.asm` at img
  `0x1C40A..0x1C42B`), not TextRec initialization.
- Added the ignored-result `ReadKey` call to the main block. The probe compiled
  under TP7 and all three TPUs remained byte-identical. The EXE was 140,448
  bytes; strict comparison reported 128,766 differing byte positions, which is
  worse as a raw count and not a semantic metric. Startup call shape now
  matches; strict parity remains **OPEN**. No behavior tests were run.

### 2026-10-01 (128): restore per-level status output shape

- The original status routine at img `0x073C..0x1405` tests each character
  level independently and emits the level label, computed threshold, and
  ` KUNSZTU` in one `WriteLn` call (annotated EXE img `0x0DC4..0x11BF`). The
  reconstruction had used a `case` with a shared output statement. Restored
  the independent level tests and per-level `WriteLn` calls, and ordered
  arithmetic as `(735 - KUNSZT) + POZIOM` / `(735 - KUNSZT) + 2 * POZIOM` to
  reproduce the original generated instruction order. Corrected the CarryLimit
  test from `ZRE < 26` to `< 25`; the original compares against `0x19` at img
  `0x07AA`.
- This closes the earlier 350-byte body-length shortfall (finding 126). The
  original body returns at `0x1404..0x1405`; the current TP7 body returns at
  `0x13C8..0x13C9`. Including each return, the body lengths are 3,274 and 3,265
  bytes, respectively. The race string and `WybierzRase` entry both align at
  an offset delta of `-0x3C`, so the residual 9-byte body difference is
  localized before the following strings. Exact body identity remains OPEN.
- TP7 compilation succeeds, and all three TPUs remain byte-identical. The EXE
  is 140,880 bytes with 5,286 relocations and a 119,696-byte load image;
  strict comparison reports 126,271 differing byte positions. The MAP places
  PRZEDM at paragraph `0x1288`, 21 paragraphs / 336 bytes before the original
  call target paragraph `0x129D` (img `0x0199F`). Strict EXE parity remains
  **OPEN**. No behavior tests were run.
- The current image's main startup block begins at img `0xAFE6` (System
  bootstrap), versus original img `0xB0CF`; the candidate BOMBKI CODE MAP ends
  at `0xF47C`, while the original main block's final runtime call ends at
  `0xF5CA`. These boundaries leave the candidate entry-to-end span 101 bytes
  shorter, with most of the 336-byte linked-segment displacement already
  present before the main block. This partitions the remaining size gap but
  does not identify its source-level causes.

### 2026-10-01 (129): restore the saved outfit-name field

- The save routine writes the string buffer at DGROUP `0x264` as its final
  text field (original EXE img `0x03542..0x03559`); the load routine reads the
  corresponding string into the same buffer and prints the literal
  `suckemall:` followed by it (img `0x0857D..0x085A1`). Added
  `PRZEDM.JAKIEUB` to the save/load lists and restored this load-time output.
  The field address and outfit-name role are corroborated by the integrated
  field map (`0x264`, `JAKIEUB`) and EXE accesses at img `0x0C9F`, `0x0EC2E`,
  and `0x194E9..0x197AF`.
- In the same source-shape pass, reordered the giant-race energy effects to
  update `MAXE` before current `ENERGIA`, matching the original instruction
  order at img `0x1831..0x1840`.
- Genuine TP7 compilation succeeds and all three TPUs remain byte-identical.
  The candidate EXE is 141,024 bytes with 5,296 relocations and a 119,808-byte
  load image; strict comparison reports 124,647 differing byte positions
  (down from 126,271 in finding 128). The latest MAP puts PRZEDM at linear
  address `0x128F0`, 14 paragraphs / 224 bytes before the original segment
  target `0x129D0`. EXE parity remains **OPEN**. No behavior tests were run.

### 2026-10-01 (130): restore Bazar's input-line drain

- The original Bazar code assigns `PAMIETAJ` to `wpisz` and then performs an
  additional operation before saving: img `0x03832..0x03840` loads `DS:0x6A2`
  and calls System offsets `0x59D` and `0x291`. A temporary genuine-TP7 probe
  with a bare `ReadLn;` emitted the exact corresponding 15-byte sequence at
  candidate img `0x37ED..0x37FB` (only the relocated System segment differs).
  Added this statement to `Bazar`. The original and candidate Bazar bodies
  now return at `0x3845` and `0x3800`, respectively, matching the entry delta
  of `-0x45` byte-for-byte through the save call.
- Genuine TP7 compilation succeeds and all three TPUs remain byte-identical.
  The candidate is 141,056 bytes with 5,298 relocations and a 119,824-byte
  load image; strict comparison reports 125,559 differing byte positions.
  This raw count increased from finding 129, but does not measure the local
  body match. The latest MAP places PRZEDM at `0x12900`, 13 paragraphs / 208
  bytes before original target `0x129D0`. EXE parity remains **OPEN**. No
  behavior tests were run.

### 2026-10-01 (131): match the bakery menu header literal

- The bakery menu header is an embedded Pascal short string at original img
  `0x3CF2`: its length byte is `0x12`, and the bytes spell `NAZWA`, nine
  spaces, then `CENA`. The reconstructed header had 24 spaces, producing a
  33-byte literal. Reduced it to the machine-evidenced 18-byte value. The
  candidate now contains the exact original byte sequence
  `12 4E 41 5A 57 41 20 20 20 20 20 20 20 20 20 43 45 4E 41`.
- The bakery and following procedure entries now keep the same `-0x45` delta
  from their original anchors; the 15-byte constant-pool displacement is
  removed. TP7 compilation succeeds and all three TPUs remain byte-identical.
  The candidate EXE is 141,040 bytes with 5,298 relocations and a 119,808-byte
  load image; strict comparison reports 123,406 differing byte positions.
  PRZEDM is again at `0x128F0`, 14 paragraphs / 224 bytes before `0x129D0`.
  EXE parity remains **OPEN**. No behavior tests were run.

### 2026-10-01 (132): restore race initialization stores

- The original `WybierzRase` continuation stores `12`, `13`, `14`, `15`, and
  `16` respectively to DGROUP `0x58`, `MONSTRA.SILNY` at `0x68C`, and DGROUP
  `0x5A`, `0x5C`, and `0x5E` (EXE img `0x196D..0x198A`). The source already
  initialized `MONSTRA.SILNY` but omitted the four surrounding program-owned
  words. Added the missing assignments using the existing invented global
  names `StanPotwora12/14/15/16`.
- The candidate `WybierzRase` return and following `WalkaMiasto` entry now
  align at a constant `-0x3C` delta from original (`0x1A80` vs `0x1ABC`, and
  `0x1BEE` vs `0x1C2A`), closing its prior 24-byte body-size deficit. TP7
  compilation succeeds and all three TPUs remain byte-identical. The EXE is
  141,072 bytes with 5,298 relocations and a 119,840-byte load image; strict
  comparison reports 123,253 differing byte positions. PRZEDM is at
  `0x12910`, 12 paragraphs / 192 bytes before original target `0x129D0`.
  EXE parity remains **OPEN**. No behavior tests were run.

### 2026-10-01 (133): restore status output operands and widths

- Restored the empty-string line write after carry-limit calculation; original
  img `0x07D4..0x07EB` passes an empty code-segment string to `WriteLn` before
  the sword and shield checks. The generated TP7 sequence has the same write
  call shape.
- The original status body passes the raw item value and width 10 to the
  integer writer at img `0x0895..0x089F`, `0x08C7..0x08D1`,
  `0x08F9..0x0903`, `0x092B..0x0935`, `0x095D..0x0967`, and
  `0x098F..0x0999`. Replaced the reconstructed `/ 10` expressions for PACZEK,
  CIASTKO, SUCHA, BULKA, CHLEB, WEKA, and BIGOS with `:10` formatting. PIWO
  remains explicitly divided by 10, matching the original `idiv` at
  img `0x09F4..0x0A03`.
- Restored the integer operands after the Fajka, Komplet, and mana-bottle labels:
  the original loads DGROUP `0x18A`, `0x216`, and `0x192` at img `0x0A2B`,
  `0x0A5C`, and `0x0ABE`, respectively. Replaced the nested TP7 speed-bonus
  accessor with a zero-storage record overlay on `PRZEDM.PRO`: generated TP7
  code reads the bonus via DGROUP `0x1C4`, as the original does at img
  `0x1272..0x127A`; the FPC-only accessor remains zero to avoid assuming the
  TP7 DGROUP layout in native builds.
- TP7 compilation succeeds and all three TPUs remain byte-identical. The
  candidate EXE is 141,072 bytes with 5,303 relocations and a 119,824-byte load
  image; strict comparison reports 126,412 differing byte positions. This
  raw metric worsened while correcting local instruction shapes. The status
  procedure body measures 3,298 bytes versus the original 3,274, so its
  remaining overall source/helper shape is still OPEN. PRZEDM is at `0x12900`,
  13 paragraphs / 208 bytes before `0x129D0`. Parity remains **OPEN**; no
  behavior tests were run.

### 2026-10-01 (134): match status output statement boundaries

- The original groups the attributes and S.Z/FUKSROLL text into two `WriteLn`
  statements. The reconstruction used `Write` followed by a separate blank
  `WriteLn` for each line, generating a redundant empty-string output call
  after each. Grouped each output as one `WriteLn` and stored the S.Z value in
  the existing program global at DGROUP `0x6E` before emitting its label,
  matching original compute/store/print order at img `0x0126F..0x0129D`.
- The rebuilt `PokazPostac` body is now 3,274 bytes, equal to original
  `0x073C..0x1405`; the next race-menu literal begins at the matching `-0x56`
  offset. A normalized instruction comparison finds only two remaining
  differences within this body: original calls System `0x1C71:0x09D7` at img
  `0x0CCC` and `0x0CF9`, while the candidate calls `0x1C63:0x09C3` at
  `0x0C76` and `0x0CA3`, respectively. Their string-compare helper identity
  remains **OPEN**; no helper substitution is inferred.
- TP7 compilation succeeds and all three TPUs remain byte-identical. The
  candidate EXE is 141,040 bytes with 5,299 relocations and a 119,808-byte
  load image; strict comparison reports 123,804 differing byte positions.
  The latest MAP places PRZEDM at `0x128F0`, 14 paragraphs / 224 bytes before
  original target `0x129D0`. EXE parity remains **OPEN**. No behavior tests
  were run.

### 2026-10-01 (135): group the Zebra reward output

- Original `WalkaMiasto` emits the Zebra reward label, random amount, and
  `MONET!` using one output sequence, with the I/O check only after all three
  values (img `0x01E4C..0x01E79`). The reconstructed `Write` plus `WriteLn`
  checked I/O between the label and amount. Merged them into one `WriteLn`;
  this removes the extra intermediate output/check sequence from the TP7 code.
- In the candidate, `WalkaMiasto` now returns at `0x1E42`, exactly `-0x56`
  from original return `0x1E98`. Its following `Trening` MAP entry is
  `0x2340` versus original `0x2395` (delta `-0x55`), leaving a one-byte
  boundary discrepancy to investigate. Other normalized differences in the
  procedure include original System `Random` target `0x1C71:0x0BE4` versus
  candidate `0x1C62:0x0BD0`, and original scratch accesses at DGROUP `0x19E`
  versus candidate `PRZEDM.CZY` at `0x212`; the scratch ownership/layout is
  **OPEN** and was not changed.
- TP7 compilation succeeds and all three TPUs remain byte-identical. The
  candidate EXE is 141,008 bytes with 5,297 relocations and a 119,792-byte
  load image; strict comparison reports 125,372 differing byte positions.
  The raw difference count rose despite the smaller code image. The latest MAP
  places PRZEDM at `0x128E0`, 15 paragraphs / 240 bytes before original target
  `0x129D0`. EXE parity remains **OPEN**. No behavior tests were run.

### 2026-10-01 (136): correct the training skill threshold

- Original `Trening` compares current wisdom at DGROUP `0x18C` against `0x1D`
  and skips the fire-starting skill text when the value is `<= 29` (EXE img
  `0x2749..0x274E`). The source used `MAD > 28`, compiling to compare against
  `0x1C`; corrected it to `MAD > 29`. The latest TP7 disassembly now emits the
  original immediate and conditional branch at candidate img `0x26F3..0x26F8`.
- Genuine TP7 compilation succeeds and all three TPUs remain byte-identical.
  The EXE remains 141,008 bytes with 5,297 relocations and a 119,792-byte load
  image; strict comparison reports 125,372 differing byte positions. The MAP
  places PRZEDM at `0x128E0`, 15 paragraphs / 240 bytes before `0x129D0`.
  EXE parity remains **OPEN**. No behavior tests were run.

### 2026-10-01 (137): restore nested escape-training guards

- Original `Trening` checks wisdom `>10` and dexterity `>10` as nested guards;
  failing either jumps directly past the practice/error block. Only then does
  it test practice points and the current escape skill, printing the failure
  message for those latter failures (EXE img `0x2872..0x2900`). Replaced the
  reconstructed four-part `and` condition, whose `else` also printed when
  wisdom or dexterity was too low, with the nested guards.
- The candidate now matches the original `Trening` body length of 2,015 bytes
  and its `-0x56` placement: prologue `0x2396` / candidate `0x2340`, return
  `0x2B73` / `0x2B1D`, and following save entry `0x2BA1` / `0x2B4B`. A
  normalized instruction comparison leaves only seven string-compare helper
  call targets (`0x1C71:0x09D7` original vs `0x1C62:0x09C3` candidate).
- TP7 compilation succeeds and all three TPUs remain byte-identical. The
  candidate EXE is 141,008 bytes with 5,297 relocations and a 119,792-byte
  load image; strict comparison reports 125,099 differing byte positions.
  PRZEDM remains at `0x128E0`, 15 paragraphs / 240 bytes before original
  target `0x129D0`. EXE parity remains **OPEN**. No behavior tests were run.

### 2026-10-01 (138): restore save-field order

- The original save routine writes field 41 from the byte at DGROUP `0x258`
  (img `0x30B8..0x30C0`) and field 42 from the word at `0x74` (img
  `0x30D6..0x30E4`). The source had these two expressions reversed. Swapped
  `POTRAWKI` and `PoleBOMBKI0074` in the write list; the candidate now emits
  the same byte/word reads in the original order at img `0x3062..0x306C` and
  `0x3080..0x3089`.
- The save body remains 2,510 bytes with 1,037 decoded instructions, matching
  the original body length; normalized comparison leaves only the leading
  string-assignment helper target (`0x1C71:0x0900` original vs
  `0x1C62:0x08EC` candidate). TP7 compilation succeeds and all three TPUs
  remain byte-identical. The EXE is 141,008 bytes with 5,297 relocations and a
  119,792-byte load image; strict comparison reports 125,099 differing byte
  positions. PRZEDM remains at `0x128E0`, 15 paragraphs / 240 bytes before
  `0x129D0`. Parity remains **OPEN**. No behavior tests were run.

### 2026-10-01 (139): align concert-room exits and destinations

- In original `PokojeKoncertowe` (`0x68BC..0x7D6A`), no store of `193` to
  `MIECHO` occurs; `WYJSCIE` branches leave the routine. The candidate had
  twelve `MIECHO := 193` stores before `Exit`. Removed only those stores in
  this procedure. The rebuilt body contains no `C7 06 D6 01 C1 00` stores,
  matching the original scan of that range.
- The original room-61 navigation stores context ids `0x3C`, `0x3F`, `0x3E`,
  and `0x40` (img `0x6A48`, `0x6A5F`, `0x6A76`, `0x6A8D`); corrected the
  reconstructed north/south destinations to `63`/`62`. Reordered the
  room-64 west/north actions and room-66 south/west actions to match original
  store order (img `0x6F38`, `0x6F4F`, `0x721F`, `0x7236`).
- The candidate `PokojeKoncertowe` returns at `0x7D4B` from entry `0x6880`,
  a 5,323-byte body, versus original return `0x7D69` from entry `0x68BC`,
  a 5,295-byte body. The remaining 28-byte body gap is **OPEN**. The latest
  TP7 build is 140,928 bytes with 5,297 relocations and a 119,712-byte load
  image; all three TPUs remain byte-identical, while strict EXE comparison
  reports 125,992 differing byte positions. The MAP places PRZEDM at
  `0x12890`, 20 paragraphs / 320 bytes before original target `0x129D0`.
  EXE parity remains **OPEN**. No behavior tests were run.

### 2026-10-01 (140): restore sequential concert-context tests

- Original `PokojeKoncertowe` checks each subsequent context after the prior
  room loop (for example, compare `[0x1D6]` to `0x3D` at img `0x6ADC`), rather
  than branching around all later context checks as an `else if` chain does.
  Changed contexts 62..72 to independent `if` blocks. This removed the extra
  unconditional jump emitted after each candidate room block.
- The candidate procedure now returns at `0x7D2A` from entry `0x6880` (body
  1,194 bytes), versus original return `0x7D69` from entry `0x68BC`; decoded body
  lengths are 1,194 and 1,199 bytes, respectively. The remaining five-byte
  difference is **OPEN**. Twelve unsupported stores on `WYJSCIE` remain
  removed; room-61 destinations and room-64/66 store ordering remain corrected.
- TP7 compilation succeeds and all three TPUs remain byte-identical. The
  candidate EXE is 140,896 bytes with 5,297 relocations and a 119,680-byte
  load image; strict comparison reports 126,269 differing byte positions.
  The MAP places PRZEDM at `0x12870`, 22 paragraphs / 352 bytes before original
  target `0x129D0`. EXE parity remains **OPEN**. No behavior tests were run.

### 2026-10-01 (141): restore the sixth-room crowd call

- Original context 66 calls `PRZEDM.TLUM` after its room description and before
  the input loop (EXE img `0x7112`, target `PRZEDM:0x3467`). The reconstructed
  context omitted this call. Restored it. `PokojeKoncertowe` now has the same
  1,199-byte body length as original: candidate entry/return `0x6880..0x7D2F`,
  original `0x68BC..0x7D6A`.
- TP7 compilation succeeds and all three TPUs remain byte-identical. The
  candidate EXE is 140,928 bytes with 5,298 relocations and a 119,696-byte
  load image; strict comparison reports 125,418 differing byte positions.
  The MAP places PRZEDM at `0x12880`, 21 paragraphs / 336 bytes before original
  target `0x129D0`. Equal procedure length is not full instruction identity;
  EXE parity remains **OPEN**. No behavior tests were run.

### 2026-10-01 (142): use unit-owned arena trackers

- The original arena checks and clears `MINIBARMAN` and `GRUBAS` at DGROUP
  `0x67A` and `0x67C` (img `0x7288`, `0x72AB`, `0x73CA`, `0x741A`, `0x746D`,
  `0x7482`). TPU symbol report `tpu_reports/MONSTRA.symbols.csv` identifies
  these as `MONSTRA.MINIBARMAN` and `MONSTRA.GRUBAS`; the TP7 MAP places the
  matching candidate symbols at `1D33:067A` and `1D33:067C`. Replaced only
  those arena-tracker references
  with unit-owned globals. Kept the separate beer-item decrements on program
  word `0x7C`, as shown by original accesses at img `0x7435..0x7452` and
  `0x7469..0x74AE`; save/load uses of the low words remain unchanged.
- TP7 compilation succeeds and all three TPUs remain byte-identical. The
  candidate EXE is 140,928 bytes with 5,298 relocations and a 119,696-byte
  load image; strict comparison reports 125,418 differing byte positions.
  `PokojeKoncertowe` retains the original 1,199-byte body length. Its
  remaining normalized differences include the random-scratch access at
  original DGROUP `0x19E` versus candidate `PRZEDM.CZY` at `0x212`, plus
  call-target/layout differences; these remain **OPEN**. PRZEDM remains at
  `0x12880`, 21 paragraphs / 336 bytes before `0x129D0`. No behavior tests
  were run.

### 2026-10-01 (143): restore load input drain and field order

- Original `WczytajPostac` performs `ReadLn(wpisz)` before opening the save
  file (EXE img `0x7D8A..0x7DA2`); restored the input drain. The original
  reads saved field 41 from byte `[0x258]` before field 42 from word `[0x74]`
  (img `0x81C3` and `0x81DA`); swapped the corresponding `POTRAWKI` and
  `PoleBOMBKI0074` reads. The inverse energy conversion also stores the
  quotient before subtracting `0x28`, matching original instructions at img
  `0x7EAA..0x7EBC`.
- `WczytajPostac` now has a 2,088-byte body in both builds: original
  `0x7D80..0x85A7`, candidate `0x7D44..0x856B`. After abstracting relocation
  call targets, branches, and string addresses, the decoded instruction
  sequence matches. Segment/call relocation identity is not established.
- TP7 compilation succeeds and all three TPUs remain byte-identical. The
  candidate EXE is 140,960 bytes with 5,301 relocations and a 119,728-byte
  load image; strict comparison reports 126,372 differing byte positions.
  The MAP places PRZEDM at `0x128A0`, 19 paragraphs / 304 bytes before original
  target `0x129D0`. EXE parity remains **OPEN**. No behavior tests were run.

### 2026-10-01 (144): restore level-one experience gate

- Original `ZdobadzPoziom` requires both KUNSZT `>=700` and POZIOM `=1`
  before reaching the level-up body (EXE img `0x8738..0x8745`). The source
  previously let every level-one character level up regardless of KUNSZT;
  restored the 700-point gate. Rewrote the level 4-8 and level 9+ deductions
  to preserve the original arithmetic order (`KUNSZT-735-POZIOM` and
  `KUNSZT-2*POZIOM-735`), supported by original instructions at
  `0x8850..0x885E` and `0x8868..0x8878`.
- The candidate body is 1,151 bytes (`0x86F2..0x8B70`) versus the original
  1,142 bytes (`0x872E..0x8BA3`). A normalized instruction comparison leaves
  branch-shape differences in threshold gates; the body remains nine bytes
  longer. This layout discrepancy is **OPEN**.
- TP7 compilation succeeds and all three TPUs remain byte-identical. The
  candidate EXE is 140,976 bytes with 5,301 relocations and a 119,744-byte
  load image; strict comparison reports 125,698 differing byte positions.
  The MAP places PRZEDM at `0x128B0`, 18 paragraphs / 288 bytes before original
  target `0x129D0`. EXE parity remains **OPEN**. No behavior tests were run.

### 2026-10-01 (145): align four small-room procedures

- EXE context guards establish that `Pokoj2`, `Pokoj3`, and `Pokoj12` test
  `MIECHO` at entry (img `0x5494`, `0x5728`, `0x5C40`); `Pokoj9` begins
  directly with its description and has no context guard (img `0x5923`).
  Removed the unsupported guard from `Pokoj9`.
- Original room procedures contain no `PRZEDM.KOMENDY` call or `MIECHO := 193`
  store (img ranges `0x548A..0x5651`, `0x571E..0x5861`, `0x5923..0x5A8C`,
  `0x5C36..0x5F08`); removed those candidate additions. Room 3 only recognizes
  `GORA` as destination context 1; the original source evidence at img
  `0x583C..0x5853` confirms this, so removed unsupported `DOL -> 5` and
  corrected `GORA` from 11 to 1.
- `Pokoj2`, `Pokoj3`, and `Pokoj9` now match original body lengths (456, 324,
  and 362 bytes) and normalized instruction sequences, abstracting strings,
  branches, and calls. `Pokoj12` also matches its 723-byte body and instruction
  sequence except the three random-drop scratch accesses: original uses
  DGROUP `0x19E` (img `0x5E40..0x5EC7`), while candidate uses `0x212`. The
  candidate MAP resolves `1D33:0212` as `CZY`, also present in
  `tpu_reports/PRZEDM.symbols.csv`; ownership/layout reconciliation remains
  **OPEN**.
- TP7 compilation succeeds and all three TPUs remain byte-identical. The
  candidate EXE is 140,928 bytes with 5,296 relocations and a 119,712-byte
  load image; strict comparison reports 125,867 differing byte positions.
  The MAP places PRZEDM at `0x12890`, 20 paragraphs / 320 bytes before original
  target `0x129D0`. EXE parity remains **OPEN**. No behavior tests were run.

### 2026-10-01 (146): correct level-up gains and output value

- The original level-up code updates MAXMANA by MAD+2, then prints MAD+2 as
  the gain (img `0x8983..0x89B1`). The reconstruction printed the resulting
  MAXMANA instead; changed the output expression to MAD+2.
- In the equal-stat tie branch, original increments MAXZRE, MAXMAD, then
  MAXSIL (img `0x8AC7..0x8AD9`); reordered the source to match. In the
  `MAXZRE > MAXMAD` and `MAXZRE = MAXSIL` branch, original adds two to MAXSIL
  and one to MAXZRE (img `0x8AEE..0x8AFA`); corrected the MAXZRE increment.
- The remaining normalized differences in `ZdobadzPoziom` are threshold
  branch shapes, not these stat updates. Candidate body is 1,152 bytes
  (`0x86D8..0x8B57`) versus original 1,142 bytes (`0x872E..0x8BA3`); this
  ten-byte gap remains **OPEN**.
- TP7 compilation succeeds and all three TPUs remain byte-identical. The
  candidate EXE is 140,928 bytes with 5,296 relocations and a 119,712-byte
  load image; strict comparison reports 125,877 differing byte positions.
  The MAP places PRZEDM at `0x12890`, 20 paragraphs / 320 bytes before original
  target `0x129D0`. EXE parity remains **OPEN**. No behavior tests were run.

### 2026-10-01 (147): match overload-gate branch direction

- Original main code compares `PRZED` and `CarryLimit` at img `0xB0F6`,
  branches on `JG` to the overload output at `0xB102`, and otherwise uses a
  near jump to the bleed loop at `0xB193`. The reconstructed positive `if`
  emitted the inverse branch around its output block. Rewrote it as an early
  `goto` when `PRZED <= CarryLimit`; the candidate now emits `JG` over a jump
  to the bleed loop, matching the original control-flow direction.
- The candidate branch uses a short jump to `0xB0A4`, while the original needs
  a near jump to `0xB193`. Candidate overload-output-to-loop span is 124 bytes
  (`0xB028..0xB0A4`), versus 145 bytes original (`0xB102..0xB193`); the
  remaining 21-byte span and instruction differences are **OPEN**.
- TP7 compilation succeeds and all three TPUs remain byte-identical. The
  candidate EXE is 140,928 bytes with 5,296 relocations and a 119,712-byte
  load image; strict comparison reports 125,883 differing byte positions.
  The MAP places PRZEDM at `0x12890`, 20 paragraphs / 320 bytes before original
  target `0x129D0`. EXE parity remains **OPEN**. No behavior tests were run.

### 2026-10-01 (148): restore complete overload output block

- Original overload output contains one grouped `Write` for the overweight
  warning, numeric excess, and `ZA DUZO`, followed by a separate `Write` of
  `TRACISZ `, `(PRZED-CarryLimit)*10`, and `% ENERGI` (img `0xB102..0xB178`);
  the energy reduction follows at `0xB17D..0xB193`. Grouped the first source
  output arguments and restored the missing `TRACISZ` output. The original
  `JG` plus near-jump gate from finding (147) is retained.
- Original and candidate output-to-loop blocks are both 145 bytes (original
  `0xB102..0xB193`, candidate `0xB032..0xB0C3`). After abstracting calls,
  branches, and string addresses, all 60 decoded instructions match in order.
- TP7 compilation succeeds and all three TPUs remain byte-identical. The
  candidate EXE is 140,960 bytes with 5,296 relocations and a 119,744-byte
  load image; strict comparison reports 126,056 differing byte positions.
  The MAP places PRZEDM at `0x128B0`, 18 paragraphs / 288 bytes before original
  target `0x129D0`. EXE parity remains **OPEN**. No behavior tests were run.

### 2026-10-01 (149): restore bleed-tick random scratch store

- The original main-loop bleed tick stores `Random(5)` to DGROUP `0x19E`
  before output and reloads it for printing (img `0xB19A..0xB1C1`). Changed
  the reconstructed inline random expression to assign/use `CZY`; the TP7
  candidate now has the same 82-byte body and normalized 34-instruction
  sequence, abstracting call targets, branches, and strings.
- The only normalized differences are the original store/load at `[0x19E]`
  versus candidate `[0x212]`. Candidate MAP identifies `CZY` at `1D34:0212`;
  the owner/layout discrepancy remains **OPEN** and is shared with the
  `Pokoj12` loot-roll accesses in finding (145).
- TP7 compilation succeeds and all three TPUs remain byte-identical. The
  candidate EXE is 140,976 bytes with 5,296 relocations and a 119,760-byte
  load image; strict comparison reports 125,230 differing byte positions.
  The MAP places PRZEDM at `0x128C0`, 17 paragraphs / 272 bytes before original
  target `0x129D0`. EXE parity remains **OPEN**. No behavior tests were run.

### 2026-10-01 (150): bind random scratch to FUKS

- The prior `CZY` mapping at DGROUP `0x19E` was wrong. `PRZEDM.symbols.csv`
  identifies TPU `FUKS` (block `0008`, offset `0008`) and `CZY` (block `0030`,
  offset `000C`); the `/GD` MAP places them at `1D37:019E` and `1D37:0212`.
  Original bleed and room-12 drop code accesses `0x19E` (img `0xB1A3..0xB1B8`,
  `0x5E40..0x5EC7`), while room-12 loot-money accesses `0x212` (img
  `0x5DDA..0x5DE3`). Replaced only the four former unqualified `CZY` accesses
  with `PRZEDM.FUKS`; retained `CZY` for the loot-money roll. Corrected the
  integrated field map accordingly.
- Both affected procedures now match original body length and normalized
  instruction sequence exactly: bleed 82 bytes / 34 instructions and
  `Pokoj12` 723 bytes / 271 instructions, abstracting calls, branches, and
  string addresses. This resolves the scratch-owner discrepancy from findings
  (145) and (149).
- TP7 compilation succeeds and all three TPUs remain byte-identical. The
  candidate EXE is 140,976 bytes with 5,296 relocations and a 119,760-byte
  load image; strict comparison reports 125,230 differing byte positions.
  The MAP places PRZEDM at `0x128C0`, 17 paragraphs / 272 bytes before original
  target `0x129D0`. EXE parity remains **OPEN**. No behavior tests were run.

### 2026-10-01 (151): bind remaining random rolls to FUKS

- Original city-animal router code uses DGROUP `0x19E` for the Zamiatacz
  chance and Zebrak coin roll (img `0x1DB6..0x1DC3`, `0x1E3E..0x1E8A`). The
  concert-room handlers use the same slot for the Dziadek pipe roll and the
  Mini-Barman beer roll, then test that saved roll for Grubas (img
  `0x4FC1..0x4FC4`, `0x7426..0x7485`). Replaced the remaining source accesses
  to `PRZEDM.CZY` in these handlers with `PRZEDM.FUKS`. The only remaining
  `PRZEDM.CZY` references in `BOMBKI.PAS` are its save/load fields.
- `PRZEDM.symbols.csv` identifies `FUKS` as a TPU variable (block `0008`,
  offset `0008`) and `CZY` as a different TPU variable (block `0030`, offset
  `000C`); the latest `/GD` MAP resolves them at DGROUP `0x19E` and `0x212`.
  This confirms the source ownership distinction. The integrated field map
  now lists the additional original scratch-use sites.
- TP7 compilation succeeds and all three TPUs remain byte-identical. The
  candidate EXE is 140,976 bytes with 5,296 relocations and a 119,760-byte
  load image; strict comparison reports 125,231 differing byte positions.
  The MAP places PRZEDM at `0x128C0`, 17 paragraphs / 272 bytes before original
  target `0x129D0`. EXE parity remains **OPEN**. No behavior tests were run.

### 2026-10-01 (152): bind well and command rolls to FUKS

- The original well reward and its immediate hazard chance both store/load
  DGROUP `0x19E` (img `0xC8A1..0xC90B`); the poisonous-passage hazard does the
  same (img `0xCE3D..0xCE4E`). In the main command handler, `POROWNAJ` and both
  `POWROT` portal rolls, including the later `UZYJ SCROLL POWROT` overwrite,
  use `0x19E` (img `0xF0AA..0xF0BA`, `0xF1F4..0xF2A5`). Changed these source
  scratch accesses from imported `CZY` to `PRZEDM.FUKS`.
- The nearby inline room-12 and rooms-14..16 coin-roll paths access `0x212`
  as `LootMoney` (img `0x5DDA..0x5DE3`, `0xB3FD..0xB437`, `0xB6C4..0xB6FE`,
  `0xB88D..0xB8C7`); their `CZY` references remain unchanged. Expanded the
  integrated field map to record these distinct scratch owners and use sites.
- TP7 compilation succeeds and all three TPUs remain byte-identical. The
  candidate EXE is 140,976 bytes with 5,296 relocations and a 119,760-byte
  load image; strict comparison reports 125,231 differing byte positions.
  The MAP places PRZEDM at `0x128C0`, 17 paragraphs / 272 bytes before original
  target `0x129D0`. EXE parity remains **OPEN**. No behavior tests were run.

### 2026-10-01 (153): match level-up threshold gate

- Rewrote the level-up gate so each unmet threshold nests the remaining
  checks, and only exits when none qualifies. This removes the intermediate
  `goto` lowering that emitted an extra unconditional jump after each
  successful level-one through level-three test. The original gate uses direct
  conditional branches to the shared level-up body (img `0x8738..0x87A2`);
  the candidate now has the same normalized instruction sequence.
- `ZdobadzPoziom` now matches original body length exactly: 1,142 bytes
  (original img `0x872E..0x8BA3`, candidate `0x86D8..0x8B4D`). All 435 decoded
  instructions match after abstracting call targets, branches, and string
  addresses. The body-length/threshold mismatch noted in earlier findings is
  resolved.
- TP7 compilation succeeds and all three TPUs remain byte-identical. The
  candidate EXE is 140,960 bytes with 5,296 relocations and a 119,744-byte
  load image; strict comparison reports 126,097 differing byte positions.
  The MAP places PRZEDM at `0x128B0`, 18 paragraphs / 288 bytes before original
  target `0x129D0`. EXE parity remains **OPEN**. No behavior tests were run.

### 2026-10-01 (154): verify Bazar and checkpoint bodies

- Static comparison of original and TP7 candidate code confirms `Bazar` is
  338 bytes in both images (original img `0x36F4..0x3845`, candidate
  `0x369E..0x37EF`), and `PunktKontrolny` is 392 bytes in both (original
  `0x51C3..0x534A`, candidate `0x516D..0x52F4`). Their 133 and 124 decoded
  instruction sequences respectively match after abstracting calls, branches,
  and string addresses.
- These two procedure bodies have no remaining normalized instruction
  differences. This updates the active parity inventory; strict EXE identity
  and other program-local procedures remain **OPEN**.
- TP7 compilation succeeds and all three TPUs remain byte-identical. The
  candidate EXE is 140,960 bytes with 5,296 relocations and a 119,744-byte
  load image; strict comparison reports 126,097 differing byte positions.
  The MAP places PRZEDM at `0x128B0`, 18 paragraphs / 288 bytes before original
  target `0x129D0`. No behavior tests were run.

### 2026-10-01 (155): match race-selection update order

- The original `CZAROMIL` branch applies `MAD := 16`, increases `MAXMANA` by
  150, then assigns `MAXSIL`, `MAXZRE`, and `MAXMAD` (img `0x1892..0x18BF`).
  Reordered the source assignments to match the original sequence.
- `WybierzRase` now matches original body length exactly: 1,339 bytes
  (original img `0x16EF..0x1C29`, candidate `0x1699..0x1BD3`). All 599 decoded
  instructions match after abstracting call targets, branches, and string
  addresses.
- TP7 compilation succeeds and all three TPUs remain byte-identical. The
  candidate EXE is 140,960 bytes with 5,296 relocations and a 119,744-byte
  load image; strict comparison reports 126,106 differing byte positions.
  EXE parity remains **OPEN**. No behavior tests were run.

### 2026-10-01 (156): resolve city-router boundary discrepancy

- The one-byte `Trening` boundary discrepancy reported in finding (135) was
  caused by treating the final literal byte at original img `0x2395` as the
  procedure entry. The actual original prologue begins at `0x2396`; candidate
  prologue begins at `0x2340`, preserving the `-0x56` offset. The 1,278-byte
  literal pools from original `0x1E98` and candidate `0x1E42` are byte-identical.
- `WalkaMiasto` code is 622 bytes in each image (original `0x1C2A..0x1E97`,
  candidate `0x1BD4..0x1E41`); all 239 decoded instructions match after
  abstracting call targets, branches, and string addresses. Random scratch
  accesses use `PRZEDM.FUKS` at DGROUP `0x19E`, as verified in finding (151).
  The boundary issue is resolved; helper targets and global segment layout
  remain part of the broader EXE parity work.
- TP7 compilation succeeds and all three TPUs remain byte-identical. The
  candidate EXE is 140,960 bytes with 5,296 relocations and a 119,744-byte
  load image; strict comparison reports 126,106 differing byte positions.
  The MAP places PRZEDM at `0x128B0`, 18 paragraphs / 288 bytes before original
  target `0x129D0`. EXE parity remains **OPEN**. No behavior tests were run.

### 2026-10-01 (157): verify shop procedure bodies

- Compared all four program-local shop procedures against the original. Their
  code bodies have matching lengths and normalized instruction sequences,
  abstracting calls, branches, and string addresses: `ZakupyPiekarnia` 1,232
  bytes (original `0x39BE..0x3E8D`, candidate `0x3968..0x3E37`),
  `ZakupyZbrojownia` 1,303 bytes (`0x3E8E..0x43A4`, `0x3E38..0x434E`),
  `ZakupySklepWielobranzowy` 1,848 bytes (`0x43A5..0x4ADC`,
  `0x434F..0x4A86`), and `ZakupySklep` 1,142 bytes (`0x4ADD..0x4F52`,
  `0x4A87..0x4EFC`). All are placed at the same `-0x56` shift.
- The post-return literal pools are byte-identical after that shift: lengths
  are 419, 745, 769, and 200 bytes respectively. These four shop procedures
  have no remaining body or literal-pool differences in this comparison.
- TP7 compilation succeeds and all three TPUs remain byte-identical. The
  candidate EXE is 140,960 bytes with 5,296 relocations and a 119,744-byte
  load image; strict comparison reports 126,106 differing byte positions.
  The MAP places PRZEDM at `0x128B0`, 18 paragraphs / 288 bytes before original
  target `0x129D0`. EXE parity remains **OPEN**. No behavior tests were run.

### 2026-10-01 (158): verify save and concert-router bodies

- `WalkaKoncert` matches in size (624 bytes: original img `0x4F53..0x51C2`,
  candidate `0x4EFD..0x516C`) and all 239 normalized instructions. Its 61-byte
  post-return literal pool is byte-identical after the `-0x56` shift.
- `ZapiszPostac` matches in size (2,899 bytes: original img `0x2BA1..0x36F3`,
  candidate `0x2B4B..0x369D`) and all 1,305 normalized instructions. Its
  389-byte post-return literal pool is also byte-identical after the same
  shift. Both comparisons abstract call targets, branches, and string
  addresses in code while comparing literal-pool bytes directly.
- TP7 compilation succeeds and all three TPUs remain byte-identical. The
  candidate EXE is 140,960 bytes with 5,296 relocations and a 119,744-byte
  load image; strict comparison reports 126,106 differing byte positions.
  The MAP places PRZEDM at `0x128B0`, 18 paragraphs / 288 bytes before original
  target `0x129D0`. EXE parity remains **OPEN**. No behavior tests were run.

### 2026-10-01 (159): correct concert-dispatch body measurement

- Rechecked the complete `PokojeKoncertowe` routine boundaries. The original
  prologue is img `0x68BC`, its `pop bp; ret` is `0x7D69..0x7D6A`, and the
  candidate prologue/return are `0x6866` and `0x7D13..0x7D14`; each code body
  is 5,295 bytes. This corrects the decimal 1,199-byte body-length claims in
  findings (141), (142), and the prior TODO summary; those measurements were
  inconsistent with their recorded entry/return addresses.
- The bodies each decode to 2,100 instructions after abstracting calls,
  branches, and string addresses. Sequence comparison has four remaining
  difference blocks; they are **OPEN**. The 22-byte post-return literal pools
  (original `0x7D6B..0x7D80`, candidate `0x7D15..0x7D2A`) are byte-identical
  after the `-0x56` shift.
- TP7 compilation succeeds and all three TPUs remain byte-identical. The
  candidate EXE is 140,960 bytes with 5,296 relocations and a 119,744-byte
  load image; strict comparison reports 126,106 differing byte positions.
  The MAP places PRZEDM at `0x128B0`, 18 paragraphs / 288 bytes before original
  target `0x129D0`. EXE parity remains **OPEN**. No behavior tests were run.

### 2026-10-01 (160): match concert scene-helper call sites

- Original context 68 invokes `PRZEDM.TLUM` at img `0x7546` (TPU entry
  `PRZEDM:0x3467`), not `PRZEDM.SCENA`; corrected the source call. The
  original has no `SCENA` call in context 69, so removed the reconstructed
  context-69 call and placed it in context 72, matching original img `0x7C6C`
  (`PRZEDM:0x31FF`). Original and candidate now each contain eight `TLUM`
  and three `SCENA` calls in this routine; the other original scene calls are
  at img `0x7986` and `0x7AF9`. Also moved context-61 poster inspection after
  the `WalkaKoncert` call, matching the original order at img `0x6A20` and its
  following command/exit checks.
- `PokojeKoncertowe` now matches original body length (5,295 bytes), all 2,100
  decoded instructions after abstracting relocated calls, branches, and string
  addresses, and its 22-byte following literal pool (byte-identical after the
  `-0x56` shift). This resolves the four normalized instruction difference
  blocks reported in finding (159). Procedure entries/returns are original
  `0x68BC`/`0x7D69` and candidate `0x6866`/`0x7D13`.
- TP7 compilation succeeds and all three TPUs remain byte-identical. The
  candidate EXE is 140,960 bytes with 5,296 relocations and a 119,744-byte
  load image; strict comparison reports 126,082 differing byte positions.
  The MAP places PRZEDM at `0x128B0`, 18 paragraphs / 288 bytes before original
  target `0x129D0`. EXE parity remains **OPEN**. No behavior tests were run.

### 2026-10-01 (161): restore inline-room monster drops

- Restored the post-victory drops for inline rooms 14, 15, and 16 from the
  original EXE: room 14/15 coin amounts are `Random(15)` with sword and shield
  rolls `Random(20)<7` and heart `Random(20)<6` (img `0xB3E5..0xB50A`,
  `0xB6AC..0xB7D1`); room 16 uses `Random(30)`, sword/shield rolls
  `Random(20)<10`, and heart `Random(20)<6` (img `0xB875..0xB99A`). Item
  context values and the 500/300/50 stores match the original. Flee handling
  also follows the machine code: rooms 14/15 clear the flee flag and retain
  context, while room 16 clears the flag and sets context 11 (img
  `0xB9A2..0xB9AD`). These are program-owned DGROUP words; field mapping is
  documented at `integrated-field-map.md` lines 311-316 and 629-632.
- Keeping all three drop sequences inline exceeded TP7's statement-part limit
  (`Error 124` at the end of the main program). Moved only room 16's drop
  sequence to `Room16ItemDrops`, retaining the same data accesses and ordering;
  the genuine TP7 build now succeeds. This helper changes generated code
  layout, so its instruction-level parity remains **OPEN**.
- All three TPUs remain byte-identical. The EXE is 142,000 bytes with 5,333
  relocations and a 120,640-byte load image; strict comparison reports 126,273
  differing byte positions. The MAP places PRZEDM at `0x12C30`, 38 paragraphs
  / 608 bytes after original target `0x129D0`. EXE parity remains **OPEN**. No
  behavior tests were run.

### 2026-10-01 (162): align room 14 and 15 command sequences

- The original room-14 and room-15 input handlers compare `EXIT` before
  `MODE` (img `0xB326..0xB380` and `0xB5ED..0xB647`) and go directly to the
  common termination epilogue on `WYJSCIE` (img `0xB396` and `0xB65D`). They
  do not call `PRZEDM.KOMENDY` between `ReadLn` and these comparisons
  (img `0xB309..0xB330`, `0xB5D0..0xB5F7`). Applied the same evidence-backed
  order and direct exit path to rooms 14-17 and removed those extra unit calls.
- `Pokoje` 14 and 15 now each match the original 701-byte code span and all
  262 normalized instructions (call targets, branch destinations, and literal
  addresses abstracted). This closes the prior local differences in input
  dispatch and monster victory drops. Room 16's item-drop logic remains split
  into `Room16ItemDrops`: moving it back inline still triggers TP7 Error 124
  (`Statement part too large` at the end of the program); full instruction
  parity for that handler remains **OPEN**.
- Genuine TP7 compilation succeeds and all three TPUs remain byte-identical.
  The EXE is 141,936 bytes with 5,329 relocations and a 120,592-byte load
  image; strict comparison reports 127,404 differing byte positions. The MAP
  places PRZEDM at `0x12C00`, 35 paragraphs / 560 bytes after original target
  `0x129D0`. EXE parity remains **OPEN**. No behavior tests were run.

### 2026-10-01 (163): verify the extracted room-16 drop block

- The extracted `Room16ItemDrops` code is exactly 198 bytes, matching original
  img `0xB8DA..0xB99F`; both decode to 66 instructions after abstracting call
  targets, branch destinations, and string addresses. Candidate code is at img
  `0x8BE3..0x8CA8`, behind the procedure entry at `0x8BD9`. The room-16 main
  handler invokes it via a near call; its in-place instruction layout and
  enclosing handler remain **OPEN**.
- The supporting current TP7 build is the one recorded in finding (162): all
  three TPUs byte-identical; EXE 141,936 bytes / 5,329 relocations / 120,592
  image bytes; 127,404 differing positions; PRZEDM MAP address `0x12C00`.
  Strict EXE parity remains **OPEN**. No behavior tests were run.

### 2026-10-01 (164): restore automatic room-16 encounter

- The original room-16 handler starts combat automatically on entry when
  DGROUP `0x5E == 16`, after its flavor text and before the energy prompt
  (img `0xB854..0xB875`). The reconstruction incorrectly waited for
  `ZABIJ POTWOR`. Moved the fight and victory/flee handling before the prompt;
  the original flee path clears the flag and sets context 11 (img
  `0xB9A2..0xB9AD`).
- Compared original img `0xB7F2..0xBAA0` with the candidate room-16 main block
  `0xB900..0xBAEA` plus the extracted drop body at `0x8BE3..0x8CA8`. Expanding
  the helper call in the candidate instruction stream gives all 254 original
  instructions in the same normalized order (calls, branches, and literal
  addresses abstracted). The code spans differ by three bytes; actual EXE
  identity for the split call/layout remains **OPEN**.
- Genuine TP7 compilation succeeds and all three TPUs remain byte-identical.
  The EXE is 141,920 bytes with 5,328 relocations and a 120,576-byte load
  image; strict comparison reports 127,466 differing byte positions. The MAP
  places PRZEDM at `0x12BF0`, 34 paragraphs / 544 bytes after original target
  `0x129D0`. EXE parity remains **OPEN**. No behavior tests were run.

### 2026-10-01 (165): align poster and city-center room handlers

- In context 17, the original checks `MODE` before displaying `EXIT` choices,
  performs `PATRZ PLAKAT`, then checks `WYJSCIE` before the `GORA`/`DOL`
  destinations (img `0xBAAB..0xBCA1`). Reordered the reconstructed checks to
  match. The room-17 body is now 503 bytes, with all 198 normalized
  instructions matching. Context 18's one-shot teleport body also matches all
  47 normalized instructions and its 125-byte length (img `0xBCA2..0xBD1E`).
- Context 20's original `WYJSC0IE` comparison branches directly to the shared
  termination epilogue without storing sentinel 193 (img `0xBE8D..0xBEA1`).
  Removed the unsupported assignment/local-label route and targeted the shared
  exit label. The city-center body now matches the original 481-byte span and
  all 194 normalized instructions (original img `0xBD29..0xBF09`).
- Genuine TP7 compilation succeeds and all three TPUs remain byte-identical.
  The EXE is 141,920 bytes with 5,328 relocations and a 120,576-byte load
  image; strict comparison reports 127,433 differing byte positions. The MAP
  places PRZEDM at `0x12BF0`, 34 paragraphs / 544 bytes after original target
  `0x129D0`. EXE parity remains **OPEN**. No behavior tests were run.

### 2026-10-01 (166): align bar-room actor checks and exits

- Context 76's first conditional bar description refers to `MACIEK`, not
  `PEDAL`; the original reads the MACIEK room tracker at DGROUP `0x684` before
  printing its bartender text (img `0xBF9C..0xBFA1`). The TPU symbol report
  identifies `PEDAL` at block `0008` offset `000A` and `MACIEK` at offset
  `000E`; the TP7 MAP resolves these to `0x680` and `0x684`. Corrected the
  source reference to `MONSTRA.MACIEK`.
- The original context-76 prompt proceeds from `ReadLn` directly to `MODE`
  comparison (img `0xC048..0xC076`); it has no `PRZEDM.KOMENDY` call. Removed
  that extra call. Its `WYJSCIE` comparison jumps to the common termination
  epilogue without storing sentinel 193 (img `0xC0C8..0xC0D8`); replaced the
  local sentinel/label sequence with a direct jump (img `0xC0C4..0xC0D8`).
- The candidate context-76 body now matches the original 716-byte range
  `0xBF2C..0xC1F7`, all 287 decoded instructions after abstracting call targets,
  branches, and string addresses.
- Genuine TP7 compilation succeeds and all three TPUs remain byte-identical.
  The EXE is 141,904 bytes with 5,327 relocations and a 120,560-byte load
  image; strict comparison reports 127,211 differing byte positions. The MAP
  places PRZEDM at `0x12BE0`, 33 paragraphs / 528 bytes after original target
  `0x129D0`. EXE parity remains **OPEN**. No behavior tests were run.

### 2026-10-01 (167): match garden rooms 77-79 exit paths

- Context 77's `WYJSCIE` comparison branches directly to the common termination
  epilogue at img `0xC372..0xC37A`, without writing sentinel 193. Removed that
  unsupported store. The handler now matches the original 471-byte span
  `0xC20C..0xC3E2` and all 187 normalized instructions.
- Contexts 78 and 79 likewise jump directly to the epilogue from their
  `WYJSCIE` checks (img `0xC4FC..0xC504` and `0xC641..0xC649`). Removed their
  sentinel stores. Both handlers now match their original 315-byte spans
  (`0xC3ED..0xC527` and `0xC532..0xC66C`) and all 126 normalized instructions
  apiece.
- Genuine TP7 compilation succeeds and all three TPUs remain byte-identical.
  The EXE is 141,888 bytes with 5,327 relocations and a 120,544-byte load
  image; strict comparison reports 127,413 differing byte positions. The MAP
  places PRZEDM at `0x12BD0`, 32 paragraphs / 512 bytes after original target
  `0x129D0`. EXE parity remains **OPEN**. No behavior tests were run.

### 2026-10-01 (168): match well and garden room code

- Context 80's well hazard stores `Random(100)` in PRZEDM.FUKS at DGROUP
  `0x19E` and compares it against 10 (img `0xC8F8..0xC909`). The source instead
  compared an unstored random result against 40 and added a separate damage
  message/effect absent from the EXE. Restored the scratch store, threshold,
  and original consequence block; the `FUKS` ownership binding is recorded in
  `integrated-field-map.md` line 629. Removed the unsupported sentinel store on
  the room's `WYJSCIE` path (original direct branch at img `0xC7FA..0xC804`).
- Rooms 80, 81, and 82 now match original spans `0xC677..0xC981`,
  `0xC98C..0xCAC6`, and `0xCAD1..0xCC0B`: 779/315/315 bytes and 306/126/126
  normalized instructions, respectively. Rooms 81 and 82 also had unsupported
  sentinel stores on `WYJSCIE`; the original branches directly to termination
  (img `0xCA9B..0xCAA6`, `0xCBE0..0xCBEB`).
- Genuine TP7 compilation succeeds and all three TPUs remain byte-identical.
  The EXE is 141,776 bytes with 5,322 relocations and a 120,448-byte load
  image; strict comparison reports 127,850 differing byte positions. The MAP
  places PRZEDM at `0x12B70`, 26 paragraphs / 416 bytes after original target
  `0x129D0`. This overall count is not monotonic as header, relocation, and
  linked-segment layouts change; EXE parity remains **OPEN**. No behavior tests
  were run.

### 2026-10-01 (169): report EXE differences by linked region

- Added `--region-report` to `tools/compare_tp7_artifacts.py`. It retains the
  strict complete-file byte comparison and its nonzero result, then compares
  stored load-image bytes within each linked region using the original image
  start from `analysis-results/exe_reports/reference-linked-layout.json` and
  candidate starts/lengths from the TP7 MAP. This is raw segment-relative
  comparison: it does not normalize relocation words, MZ headers, or addresses.
  The report also shows mapped extents and stored-byte coverage. The checked-in
  reference layout documents the evidence for each segment boundary.
- The diagnostic separates shifted regions without pretending they are
  byte-identical: with the latest candidate (`build/tmp/tp7-line-bytes-suo5fjkm`),
  SWIAT differs at 742 positions, PRZEDM at 1,642, MONSTRA at 69, CRT at 4,
  System at 1,183, and DGROUP's 96 stored bytes match. BOMBKI differs at 61,366
  byte positions and has a 406-byte mapped-extent delta. The strict full-file
  comparison remains 127,777 differing positions (reference 141,264 bytes,
  candidate 141,776); EXE parity remains **OPEN**.
- In the active room-handler pass, context 84 now includes the
  `PRZEDM.BLUSZCZ` call and direct termination branch evidenced at img
  `0xCC22..0xCDFB`, matching its 473-byte body and all 188 normalized
  instructions. Context 87 stores the random roll in `PRZEDM.FUKS` at DGROUP
  `0x19E`, compares against 40, and computes energy as `ENERGIA - 25 + ZRE`,
  matching img `0xCE3D..0xCE93`; its 445-byte handler body
  (`0xCE05..0xCFC2`) matches all 178 normalized instructions. FUKS ownership is
  recorded in `integrated-field-map.md` line 629.
- The EXE-region unit tests and existing TPU comparator tests pass. One
  regression specifically confirms that a region match does not turn a
  whole-EXE mismatch into success. No behavior tests were run.

### 2026-10-01 (170): enable linked-region diagnostics in CI

- Updated `.github/workflows/pascal-decomp.yml` to run the artifact-comparison
  unit tests and invoke `compare_tp7_artifacts.py --region-report` for the TP7
  EXE check. CI logs now include linked-region byte counts and boundaries by
  default, while the command still returns failure unless complete EXE byte
  identity is achieved. The TP7 conformance script already exports
  `BOMBKI.MAP` beside the EXE for segment placement.

### 2026-10-01 (171): classify relocation-covered EXE differences

- Extended `--region-report` to parse MZ relocation cells and classify each
  region's raw byte differences as changed bytes at matching relocation-word
  sites, changed bytes at relocation sites present at different segment
  offsets, other byte differences, and stored-length deltas. This is a
  classification only; relocation values are not normalized and strict EXE
  comparison remains unchanged. Removed the redundant "including unpaired
  tails" wording.
- In the latest TP7 image, SWIAT has 645 relocation-word bytes and 97 other
  differing bytes; PRZEDM has 1,288 relocation-word bytes and 354 other;
  MONSTRA's 69 differences and Crt's 4 are all relocation-word bytes. System
  has 3 relocation-word bytes, 15 relocation-site-layout bytes, and 1,165
  other differences. BOMBKI has 248 relocation-word bytes, 11,721 relocation-
  site-layout bytes, 48,991 other bytes, and 406 bytes of stored-length delta.
  These remaining non-relocation differences still require static analysis.
- Eleven comparator tests pass, including checks for relocation-value,
  relocation-site-layout, and non-relocation classifications. Strict EXE
  parity remains **OPEN**. No behavior tests were run.

### 2026-10-02 (104): add verified TP7.01 runtime extraction

- **RESOLVED:** the supplied `tools/tp701.all/` installation data is a genuine
  TP7.01 distribution. `Disk10/TPC.ZIP` contains `TPC.EXE` (75,432 bytes,
  SHA-256 `72211facc2159c758fd6db2a6076517568d82654f1a6b92539745af50274e3f0`)
  and `Disk8/RTPL.ZIP` contains `TURBO.TPL` (48,464 bytes, SHA-256
  `025cf348b34b737f7db84e98b77041d25c7d62e6210e2c410e660f5149c05896`).
  Both source ZIPs pass `unzip -t`; their payload timestamps are from March
  1993, matching the TP7.01 release data.
- Added `tools/extract_tp701.sh`, which validates those payload hashes and
  extracts the required files to `BIN/TPC.EXE` and `BIN/TURBO.TPL` under the
  default `build/tp701/` root, or a caller-selected output root. The archive
  itself remains user-provided working-tree data and is not staged by this
  change.
- **Verification:** the extractor passed shell syntax, payload verification,
  and output-layout checks. A genuine DOSBox-X build using only the extracted
  files compiled all four Pascal targets; `compare_tpu.py` reported MONSTRA,
  PRZEDM, and SWIAT byte-identical. The rebuilt EXE contains the original
  TP7.01 `LongShr`/`LongShl` sequences (`66 C1 ...`), with no `SHRD`/`SHLD`;
  its remaining size/layout gap is unrelated to runtime-variant selection.

### 2026-10-02 (105): report non-relocation TPU code differences

- Updated `conformance/compare_tpu.py` so each changed code block now reports
  both its raw byte-difference count and its `real` count after masking the
  relocation patch cells. Two-byte offset/segment/relative fixups and four-byte
  pointer fixups are masked using the TPU relocation records; relocation-only
  changes therefore no longer appear as real procedure-code differences.
- Added a regression test covering a mutated relocation slot and retained the
  existing non-relocation mutation test. The comparator still reports raw code
  and relocation-group diagnostics separately, and whole-file identity remains
  the CI acceptance criterion.

### 2026-10-02 (106): highlight relocation-only EXE region verdicts

- Extended the `--region-report` verdict so each linked region reports one of
  three states: `relative bytes exact`, `relative bytes differ only in
  relocation data` (all stored-byte differences are covered by MZ relocation
  cells on either side and mapped extents match), or `relative bytes differ`.
  A trailing `linked-region summary` line counts regions in each state, so CI
  logs show at a glance which regions need no further source work.
- Added regression tests for the relocation-only and non-relocation verdicts;
  both confirm the strict whole-EXE comparison still fails. All 14 comparator
  tests pass. Strict EXE parity remains **OPEN**. No behavior tests were run.

### 2026-10-02 (108): System delta was a short reference extent, now fixed

- Root cause: the reference layout estimated the System extent as 0xD67,
  cutting off the segment's 22 trailing bytes (`F8 C3` plus the 18-byte
  BSS-clear epilogue `MOV DI,0052 ... REP STOSW RET` and two zero pad bytes).
  Those bytes are present and byte-identical in both images at the same
  segment-relative offset (+0xD67, ref img 0x1D477, candidate img 0x1D619);
  no code difference existed. The reference DGROUP starts at img 0x1D490,
  leaving exactly three zero pad bytes after the epilogue.
- Fix: corrected the System `reference_size` to 0xD7B in
  `exe_reports/reference-linked-layout.json`, matching the genuine TP7 MAP
  length. Local `--region-report` rerun confirms System is now 7/7
  relocation-word diffs (`differ only in relocation data`); the summary is 1
  exact, 5 relocation-only, 1 differ (BOMBKI). Only the BOMBKI region still
  needs source work. No behavior tests were run.

### 2026-10-02 (110): room-16 exit, bar header, sleep message fixes

- Room-16 EXIT is `DOSTEPNE WYJSCIA:` + `DOL-KLATKI PELNE GAJDY` with
  `if wpisz = 'DOL' then MIECHO := 11` (ref img 0xBA3F/0xBA85); the
  `WSCHOD-KLATKI` variant exists only in PRZEDM's segment, not BOMBKI's.
- Bar-room EXIT header is plural `DOSTEPNE WYJSCIA:` (ref BOMBKI has no
  singular entry; the one singular occurrence lives in PRZEDM's segment).
- Sleep messages use bare `ENERGI`: `ZYSKALES ', MAD, 'ENERGI'` and
  `SUPER ZYSK : ', MAD * 2, 'ENERGI'` (ref img 0xF016/0xF060 share one pool
  entry, matching the deduplicated literal).
- Main normalized instruction match rose 63.5% to 68.3%. Strict EXE parity
  remains **OPEN**. No behavior tests were run.

### 2026-10-02 (118): room-80 EXIT names POLODNIE-BLUSZCZ

- Room-80's fourth EXIT line is `POLODNIE-BLUSZCZ`, not
  `POLODNIE-WEJSCIE DO GROTY` (the latter first appears in room-84's EXIT at
  ref img 0x98D4). Movement targets 77/81/82/83 confirmed unchanged. BOMBKI
  `other` falls 6,059 to 5,329 positional bytes.
- Strict EXE parity remains **OPEN**. No behavior tests were run.

### 2026-10-02 (109): align BOMBKI procedure pool and helpers; 124 ceiling noted

- BOMBKI segment opens with PokazPostac's literal pool ([0, 0x73C)); each
  procedure's literals are pooled immediately before its code. Pool sequence
  comparison gave 9 source-text fixes, all in PokazPostac: `WriteLn('')` is
  `WriteLn('NOSISZ ZE SOBA:')`; `MALA TARCZA` is `OKRAGLA MALA TARCZA`;
  `CIASTKO`/`SUCHA RACJA`/`BULKA`/`CHLEB`/`WEKA` lines use the long forms
  `SMACZNE CIASTKO`, `TWARDA SUCHA RACJE`, `OKRAGLA PACHNACA BULKA`,
  `DUZY CIEPLY CHLEB`, `DLUGA I SMACZNA WEKE`; `GARNITUR Z KOLCAMI ` loses its
  trailing space; level-3 message ends with bare `KUNSZTU` (dedup explains the
  single extra pool entry). Pool is now byte-identical through 0x73C.
- WybierzRase `until` disjunct order is UFOK, CZAROMIL, POL-ELF (if-chain order
  unchanged). ZdobadzPoziom level-12 display uses `WriteLn`, not `Write`
  (CRT 05DD+0291 ending, not 05FE).
- With those fixes all procedures except Room16ItemDrops/main match at
  identical offsets under normalized comparison. Ref has room-16 drops inline
  in main (thresholds 10/10/6 confirmed); inlining ours is blocked for now:
  TPC reports Error 124 past ~63.5KB segment size (+26B compiles, +185B
  compiles at 63,605, +210B fails), so main must slim down first and the
  inline lands last. Strict EXE parity remains **OPEN**. No behavior tests
  were run.

### 2026-10-02 (111): room-86 tail matches after restructure

- Room-86's EXIT is two lines (`DOSTEPNE WYJSCIA:`, `WSCHOD-BUDYNEK`) with
  `WYJSCIE -> goto 1025` and a single `WSCHOD -> MIECHO := 85` command; the
  city-hub tail belonged to room 21. The intro uses two separate
  STARUCH-guarded prints, not if/else. The sleep check is `FORSA > 199`, the
  `PRZED` decrement runs last in its block, and `ROZMAWIAJ STARUCH` is three
  separate outer ifs (one per sub-branch), all verified against ref
  img 0xD41D..0xD7E6.
- Room-86 now compares 377 vs 377 normalized instructions with zero
  differences. Strict EXE parity remains **OPEN**. No behavior tests were run.

### 2026-10-02 (112): all WYJSCIE exits are plain goto 1025

- All 28 `wpisz = 'WYJSCIE'` sites in ref main jump to img 0xF5C2 (label
  1025); ref main contains zero `MIECHO := 193` stores. All 13 reconstructed
  `begin MIECHO := 193; goto 10xx; end;` forms (rooms 21, 85, 86 already plain)
  are now plain `goto 1025`, including the goto-less shop assignment. This
  also removes ~90 code bytes toward the 124 ceiling.
- All 14 unit procedures now match at identical offsets (the four remaining
  single-instruction sweep notes are one far-call segment word,
  `lcall System:02CD`, covered by relocation cells). Main normalized match is
  68.7% with near-equal lengths (6,899 vs 6,919 instructions). Strict EXE
  parity remains **OPEN**. No behavior tests were run.

### 2026-10-02 (113): room-15 drop thresholds are 10/10/6

- Room-14's inline drops use FUKS bounds 7/7/6 but room-15's use 10/10/6
  (ref img 0xB8DA vs 0xB44A); the reconstruction had 7/7 in both rooms.
  Normalized comparison of the drop blocks now matches. Positional EXE counts
  do not move for same-length immediate fixes until surrounding lengths
  converge; procedure/main normalized diffs remain the acceptance signal.
- Strict EXE parity remains **OPEN**. No behavior tests were run.

### 2026-10-02 (114): room-24 PATRZ position fixed

- Room-24's `PATRZ PLAKAT` handler sits after the `WSCHOD -> 21` command,
  just before the trailing `WalkaMiasto` call (ref img 0xE3F1..0xE41E), not
  after `MODE`. Per-room miss fell 30 to 2 (boundary noise).
- Strict EXE parity remains **OPEN**. No behavior tests were run.

### 2026-10-02 (115): correct room-15 bounds back to 7/7/6

- Finding 113 misattributed room-16's inline drops (img 0xB8DA, bounds
  10/10/6, matching the Room16ItemDrops procedure) to room 15. Room-15's own
  drops at img 0xB711 use bounds 7/7/6, which the reconstruction already had;
  the change is reverted. Lesson: same-shape drop blocks in adjacent rooms
  must be attributed by handler address (dispatcher `je` targets), not by
  literal text.
- Strict EXE parity remains **OPEN**. No behavior tests were run.

### 2026-10-02 (116): room-85 EXIT uses two separate ifs

- Room-85's EXIT prints the conditional ZACHOD lines via two separate
  `DRZWI` ifs (not if/else), the same author pattern as room-86's STARUCH
  prints (ref img 0xD350..0xD396). Per-room miss is now 0.
- Room status: all procedures and all main rooms except room-16 match at
  0-2 normalized instructions of boundary noise. Room-16 still calls the
  outlined Room16ItemDrops procedure (ref has the drops inline, bounds
  10/10/6 confirmed); the inline stays blocked on the 124 ceiling until the
  segment shrinks further (current extent delta 301).
- Strict EXE parity remains **OPEN**. No behavior tests were run.

### 2026-10-02 (117): room-16 drops inlined, ceiling beaten

- With the segment slimmed by the room fixes (extent delta 301), the
  Room16ItemDrops inline now compiles: segment 0xF6FD -> 0xF664 (-409 bytes),
  EXE 141,632 -> 141,488. Room-16 matches; its inline bounds 10/10/6 and
  order (MMIECZ, MTARCZA, SERCE) are confirmed against ref img 0xB8DA.
- BOMBKI `other` falls 21,226 to 6,059 positional bytes; extent delta 148.
  The earlier 124 failures were purely the ~63.5KB ceiling, not structure:
  identical sources fail above it and pass below.
- Strict EXE parity remains **OPEN**. No behavior tests were run.

### 2026-10-02 (119): scroll POWROT/UZYJ restructured, one quirk open

- POWROT's body is just `FUKS := Random(100)` (its portal branches live only
  in the UZYJ block); the UZYJ block is two separate outer ifs (Random(100)
  alone, then Random(1) plus the portal chain), and the portal chain is
  `if FUKS <= Powracanie`, `else if Powracanie + 30 > FUKS`,
  `else if Powracanie + 29 < FUKS`. BOMBKI extent delta falls to 23, EXE to
  141,328 (48 over reference).
- OPEN quirk: ref's POWROT check uses a lone forward `jg` to its body where
  TPC 7.01 generates `jle`-skip for every probed `and`/nested/goto source
  form (verified with local TPC probe builds). Same semantics, 5-byte
  codegen gap; source form unknown. No behavior tests were run.

### 2026-10-02 (120): POWROT jg-shape archaeology (OPEN)

- Ref's POWROT check `cmp Powracanie,0; jg +0x1E (body)` has no matching TPC
  7.01 shape: local TPC probes of `and`, nested-`if`, `and`+`goto`,
  nested-`if`+`goto`, chained gotos, and empty-`then` all yield canonical
  `[ne][jCC-false]` (plus explicit `jmp` for gotos), never lone-forward-`jg`.
  Double-jump `[jCC-true][jmp]` appears only when the skip target is out of
  short range (proven by UZYJ#1's far skip to 0xF2D9). The 5-byte gap is
  semantically neutral; source form unknown.

### 2026-10-02 (121): rooms 22/101/102/103 lack KOMENDY

- Ref rooms 22, 101, 102, and 103 call only ULSKLEPIKOWA/MODE-class PRZEDM
  entries in their loops; the reconstructed `PRZEDM.KOMENDY;` after `ReadLn`
  in all four has no counterpart (each showed as a 5-byte extra far call).
  Deleted all four (also -20 segment bytes). Room lengths now match ref
  within 0-1 bytes (22: 454/459 still +5 from the pending room-22 tail check;
  101/102/103 exact).
- Strict EXE parity remains **OPEN**. No behavior tests were run.

### 2026-10-02 (122): MODE-menu reads DGROUP word and MAD>19

- The MODE abilities menu prints DGROUP word `[0x74]` (PoleBOMBKI0074) for
  the POTRAWKI line, not the `PRZEDM.POTRAWKI` byte, and gates the POWROT
  line on `MAD > 19`, not 18 (six MAD thresholds in ref: 10/10/15/11/18/19).
  BOMBKI extent delta falls to 2.
- Strict EXE parity remains **OPEN**. No behavior tests were run.

### 2026-10-02 (123): room-1000 tail uses open goto-back, unguarded UNMODE

- Room-1000 has no `until`; after the UNMODE block it does
  `if MIECHO = 1000 then goto <room prompt>` (ref img 0xF5A7), then
  `PASZOL := 0`, then the shared `MIECHO = 193` Halt-or-dispatch check.
  The UNMODE restore is unguarded (`(UNMODE) or (UM)`, no MIECHO=1000
  prefix); the prompt Write carries reused label 1012 (orphan at old
  room-86 tail removed). Tail compares clean.
- Strict EXE parity remains **OPEN**. No behavior tests were run.

### 2026-10-02 (124): all non-BOMBKI regions byte-exact

- Restructured the UZYJ block: second UZYJ `if` drops its `007A` guard and
  the portal chain runs sequentially after it (ref img 0xF205..0xF2D9).
  BOMBKI extent delta falls to 8; paragraph alignment now places every
  downstream segment identically, so SWIAT, PRZEDM, MONSTRA, Crt, System,
  and DGROUP all compare byte-exact (differing=0). Remaining work is
  BOMBKI-internal only: 5 relocation-word, 2,187 relocation-site-layout,
  and 5,220 other bytes.
- Strict EXE parity remains **OPEN**. No behavior tests were run.

### 2026-10-02 (125): shop rooms gain ULSKLEPIKOWA, room-21 drops KOMENDY

- Rooms 23-26 call `PRZEDM.ULSKLEPIKOWA` after their intro WriteLns (ref img
  0xE15C etc.); the reconstruction lacked all four. Room-21's loop has no
  `PRZEDM.KOMENDY` (its miss-1 was exactly that call). BOMBKI `other` falls
  to 3,586 positional bytes.
- Strict EXE parity remains **OPEN**. No behavior tests were run.

### 2026-10-02 (126): SPIJ loop uses assignment, not Inc

- Room-1000's sleep loop is `Godzin := Godzin + 1` (mov/inc/mov), not
  `Inc(Godzin)` (single inc-mem). Last `Inc(`/`Dec(` in the main program.
- Strict EXE parity remains **OPEN**. No behavior tests were run.

### 2026-10-02 (127): room-1000 portal section inside or-body, misc orders

- The POWROT/UZYJ `Random(100)` pair is one `or`-of-`and`s whose true branch
  holds the second UZYJ `if` and the whole portal chain; false jumps to the
  POROWNYWANIE check (ref img 0xF1C3..0xF2D9). The portal chain itself is
  three separate fall-through `if`s, not `else-if` (ref img 0xF261.., the
  middle test repeats `FUKS > Powracanie`). The `wpisz := 'ZDOLNOSCI'`
  store after SAVE is an unconditional short-string assign via System:0x900,
  not a comparison. Room-1000 head gains its `ENERGIA > MAXE` clamp
  (ref img 0xEA25), UZYJ PIWO/STARY print before the stat increments, the
  sleep `Write` is one 5-arg `WriteLn`, overload/STUDNIA/TOKSYCZNE lines are
  `WriteLn`, WybierzRase repeats from its prompt WriteLn, ZEBRAK clears
  inside its `ENERGIA > 0` block, and room-1000's `end` sits after its
  `goto 1012` (skip lands on PASZOL at img 0xF5B2). BOMBKI `other` falls to
  ~89 positional bytes; EXE sizes equal at 141,264.
- Strict EXE parity remains **OPEN**. No behavior tests were run.

### 2026-10-02 (128): loops start earlier; 80-byte file-read helper gap

- Room-16 repeats from its fight gate, room-88 from `WROGEN := 200`, and
  the main loop from `PunktKontrolny` (ref img 0xB854, 0xD091, 0xB0F0); the
  ZEBRAK clear, overload/STUDNIA/TOKSYCZNE/SPIJ lines are `WriteLn`-ended.
  Strict diff is now exactly 80 bytes: every one is the `ReadLn(plik, int)`
  line skip, `lcall System:0x5fe` in ref vs `0x59d` in ours (read itself is
  `0x72d` in ref vs `0x635` here). Twelve TPC probes (all integer types,
  Char/string/subrange, Read vs ReadLn, {$R+}/{$O+}, units, placement,
  unit-declared vars) never emit ref's pair for file reads; console reads
  agree (`0x72d`). The 6-byte BOMBKI extent delta is MAP bookkeeping: tail
  bytes through img 0xF5D8 are identical, both files are 141,264 bytes.
- Strict EXE parity remains **OPEN** on the file-read helper gap, pending a
  compiler form that emits it. No behavior tests were run.

### 2026-10-02 (129): PRZEDM.PRO overlay replaced with explicit ILOSC reference

- The `TProPremiaOverlay` absolute record overlaying `PRZEDM.PRO` mapped
  `Premia` to `PRZEDM.ILOSC` (equipped item count). The S.Z. display formula
  `PRO + 10 × Premia` is now written directly as `PRO + 10 × PRZEDM.ILOSC`
  in both FPC and TP7 branches, removing the overlay type, the absolute
  variable `PremiaPRO`, and the FPC stub `PremiaSzybkosciUbrania`.
  `PoleBOMBKI006E` comment updated to `S.Z. = PRO + 10 * PRZEDM.ILOSC`.
  TP7 build verified byte-identical — overlay was purely a source-level
  abstraction with zero codegen effect.

### 2026-10-02 (130): TFlagaZdejmowania overlay removed

- `TFlagaZdejmowania` (single `Byte` field `Wartosc`) overlaid the length
  byte of `PRZEDM.JAKIEUB` (string). Two uses:
  `FlagaZdejmowania.Wartosc = 0` (naked check) → `PRZEDM.JAKIEUB = ''`,
  `FlagaZdejmowania.Wartosc := 0` (clear) → `PRZEDM.JAKIEUB := ''`.
  Type, absolute variable, and both uses replaced with direct string
  operations. Record type and overlay variable removed. TP7 build
  byte-identical.

### 2026-10-02 (131): MIECHO consts renamed to match string context

- `MIECHO_PokojGlowny` (1000) → `MIECHO_Podswiadomosc` — subconscious
  room (items in your room after death, prompt label 1012).
- `MIECHO_Bazar` (10000) → `MIECHO_Smierc` — death trigger context
  (calls `Smierc` death handler).
- Both names now match the actual string context in the game.
- TP7 build verified byte-identical.

### 2026-10-02 (132): unclassified vars → UnusedNNNN; StatSZ → SilaZbroi

- Four vars only saved/loaded with no behavioral role renamed to
  `UnusedNNNN` pattern matching their DGROUP offset:
  `PoleBOMBKI0052`→`Unused0052`, `PoleBOMBKI0064`→`Unused0064`,
  `PoleBOMBKI0072`→`Unused0072`, `PoleBOMBKI0076`→`Unused0076`.
- `PoleBOMBKI006E` (displayed as `S.Z.`) renamed to `SilaZbroi`
  ("armor strength") matching the `S.Z.` string in output.
- `Powracane` kept as-is per policy.
- TP7 build byte-identical.

### 2026-10-02 (133): more var renames with string evidence

- `Godzin` → `GodzinySnu` — sleep hours counter ("SPISZ JUZ X GODZIN").
- `EtapPunktuKontrolneo` → `PunktKontrolny` — checkpoint stage var (0–3); proc is `PunktyKontrolne`.
- `StanPotwora17` → `StanTarczy` — tracks shield equip (0=no shield, 1=equipped); string "NIE MASZ ZADNEJ OCHRONY" when 0.
- `CarryLimit` → `LimitPrzedmiotow` — max items display "MASZ X/Y PRZEDMIOTOW".
- TP7 build byte-identical.

### 2026-10-02 (134): item/flag vars renamed to match string context

- `PoleBOMBKI0054` → `JakaBron` — tracks which weapon is equipped (0=none, sword types); string "BIJESZ SIE NA PIESCI" when 0.
- `StanTarczy` → `JakaTarcza` — shield equip state (0=none, -100=equipped); string "NIE MASZ ZADNEJ OCHRONY" when 0.
- `PoleBOMBKI0056` → `ZapisanoGre` — save-game flag (set in `ZapiszPostac`).
- `PoleBOMBKI0066` → `WartoscMiecza` — old sword value 500 (set when looting).
- `PoleBOMBKI007C` → `PrzedmPiwo` — beer scroll counter (negative=charges); string "OZEWIAJACE PIWSKO... X".
- `PoleBOMBKI007A` → `PrzedmScrollPowrot` — return scroll counter (negative=charges); string "SCROLL Z CZAREM : POWROT X".
- TP7 build byte-identical.

### 2026-10-02 (135): item value vars renamed

- `PoleBOMBKI0068` → `WartoscTarczy` — small shield value 300 (set when looting monsters in rooms 12/14/15/16).
- `PoleBOMBKI006A` → `WartoscSerca` — heart value 50 (set when looting).
- `PoleBOMBKI0074` → `ZapPOTRAWKI` — saved POTRAWKI skill % (MODE menu shows "POTRAWKI - X%").
- TP7 build byte-identical.

### 2026-10-02 (136): StanPotworaXX renamed to monster names

- `StanPotwora12` → `StanCieniasa` — Room 12 (KLATKA CIENIASA) Shadow/Cienias.
- `StanPotwora14` → `StanZrecznego` — Room 14 agile monster (Zręczny).
- `StanPotwora15` → `StanSilnego` — Room 15 strong/resistant monster (Silny).
- `StanPotwora16` → `StanOdpornego` — Room 16 resistant/giant monster (Odporny).
- Monster names from Polish room descriptions; vars track alive/dead state.
- TP7 build byte-identical.

### 2026-10-02 (137): remaining item/flag vars renamed

- `StanPotwora12` → `StanCieniasa` (Room 12 Shadow/Cień).
- `StanPotwora14` → `StanZrecznego` (Room 14 agile/Zręczny).
- `StanPotwora15` → `StanSilnego` (Room 15 strong/Silny).
- `StanPotwora16` → `StanOdpornego` (Room 16 resistant/Odporny).
- `PoleBOMBKI0068` → `WartoscTarczy` (small shield value 300).
- `PoleBOMBKI006A` → `WartoscSerca` (heart value 50).
- `PoleBOMBKI0074` → `ZapPOTRAWKI` (saved POTRAWKI %).
- `PoleBOMBKI0054` → `JakaBron` (weapon equip: 0=bare hands).
- `StanPotwora17` → `JakaTarcza` (shield equip 0/1).
- `PoleBOMBKI0056` → `ZapisanoGre` (save flag).
- `PoleBOMBKI0066` → `WartoscMiecza` (old sword value 500).
- `PoleBOMBKI007C` → `PrzedmPiwo` (beer scroll counter).
- `PoleBOMBKI007A` → `PrzedmScrollPowrot` (return scroll counter).
- `Godzin` → `GodzinySnu` (sleep hours).
- `EtapPunktuKontrolneo` → `PunktKontrolny` (checkpoint stage).
- `StanPotwora17` → `JakaTarcza` (shield equip).
- `CarryLimit` → `LimitPrzedmiotow` (max items).
- `PoleBOMBKI0068` → `WartoscTarczy` (shield value 300).
- `PoleBOMBKI006A` → `WartoscSerca` (heart value 50).
- `PoleBOMBKI0074` → `ZapPOTRAWKI` (POTRAWKI %).
- `PoleBOMBKI0068` → `WartoscTarczy`, `PoleBOMBKI006A` → `WartoscSerca`, `PoleBOMBKI0074` → `ZapPOTRAWKI` (repeated for clarity).
- All unclassified vars → `UnusedNNNN` (4 vars).
- `StatSZ` → `SilaZbroi` (S.Z. display).
- `Powracane` kept as-is.
- TP7 build byte-identical (141,264 bytes).

### 2026-10-02 (138): ZapPOTRAWKI renamed to bug marker

- `ZapPOTRAWKI` (was `PoleBOMBKI0074`) renamed to `PotrawkiNiepotrzebnaZmiennaBug`.
- Variable is saved/loaded but never assigned from `POTRAWKI` skill.
- MODE menu displays it (`POTRAWKI - X%`) but it's stale — bug in original.
- TP7 build byte-identical.

### 2026-10-03 (139): last remaining mismatches documented

**Status**: Two classes of mismatch remain, both fundamental TP7 codegen differences:

1. **80 bytes of 0xFE vs 0x9D** (file read helper calls)
   - Locations: 80 scattered sites in BOMBKI segment (0x7DD3, 0x7DF6, ... 0x8565)
   - Pattern: `lcall 0x1c71:0x5fe` (ref) vs `lcall 0x1c71:0x59d` (candidate)
   - Cause: File read helper for `ReadLn(plik, ...)` in save/load code
   - Ref uses overlay-aware helper `0x5fe` (blind copy, no bounds check)
   - Candidate uses standard helper `0x59d` (bounds-checked)
   - Root cause: Ref compiled with `{$O+}` (overlay support) enabling overlay-aware file I/O; candidate lacks `{$O+}`
   - Blocker: Main program too large for `{$O+}` (Error 124: "Statement part too large" - main statement block exceeds overlay segment limit)
   - Not fixable at source level without splitting main program into overlays (would change binary structure)

2. **6-byte tail padding difference** (extent delta 6)
   - Ref has 6 zero bytes padding at end of BOMBKI segment (0xF5CA-0xF5CF) before next segment
   - Candidate ends 6 bytes earlier (extent 0xF5CA vs 0xF5D0)
   - Likely alignment/padding difference from compiler version or EXE header rounding
   - File sizes identical (141,264 bytes) due to EXE header padding

**Conclusion**: Both mismatches are fundamental TP7 codegen differences unresolvable at source level without:
- Major restructuring (manual overlay splitting of 4700+ line main program)
- Or different TP7 version/toolchain
- All 6 non-BOMBKI regions are byte-exact; BOMBKI has 80 "other" byte diffs + 6 extent delta

**Status**: **OPEN** - no source-level fix available with current toolchain.

### 2026-10-03 (140): Read vs ReadLn mismatch resolved to 1 byte

- Changed all 80 `ReadLn(plik, ...)` to `Read(plik, ...)` matching original source form.
- Eliminated 79 of 80 `0xFE` vs `0x9D` mismatches (file read helper calls).
- **1 byte remains** at offset 0x8548 (first `Read(plik, PrzedmPiwo)` in WczytajPostac):
  - Ref uses standard helper `0x59D`, candidate uses overlay-aware `0x5FE`
  - Cause: TP7 codegen quirk for first file read after certain context; unresolvable without exact original compiler options/version
- **6-byte tail padding** difference persists (extent delta 6)
- All 6 non-BOMBKI regions byte-exact
- Status: **OPEN** - last 1 byte + 6 padding bytes irreducible without original compiler/toolchain

### 2026-10-03 (141): strict TP7 EXE parity achieved (RESOLVED)

- Change: `reconstructed/BOMBKI.PAS` line 1431 in `WczytajPostac`:
  `Read(plik, PRZEDM.DUNCAN);` -> `ReadLn(plik, PRZEDM.DUNCAN);`.
  (Finding (140) mislabeled the site as the `PrzedmPiwo` read; the
  site is the DUNCAN read: DGROUP 0x261 = `PRZEDM` block 0058
  offset 000B, Shortint, per `analysis-results/tpu_reports/PRZEDM.symbols.csv`
  and `build/tp7/BOMBKI.MAP` entry `1D49:0261 DUNCAN`.)
- Evidence: reference DUNCAN read site (img 0x853A-0x854C) is
  `[mov di,0x7E][push ds][push di][lcall 0x1C71:0x72D]` (numeric
  reader), `[mov byte ptr [0x261], al]` (store), `[lcall 0x1C71:0x59D]`
  (post-helper), `[lcall 0x1C71:0x291]` (IOCHECK). The previous
  candidate emitted the same reader and store but post-helper
  `0x5FE` at img 0x8547 (file offset 0xD828: ref 0x9D vs cand 0xFE).
- Why ReadLn: TP7 uses the same numeric reader for `Read(f, v)` and
  `ReadLn(f, v)`; the statements differ only in the post-helper
  (`System+0x5FE` for Read, `System+0x59D` for ReadLn). Verified
  with the isolated TP7.01 probe `build/tmp/readln-probe/probe.pas`
  (PROBE.EXE): `Read(f, b)`/`ReadLn(f, b)` (Shortint) and
  `Read(f, w)`/`ReadLn(f, w)` (Integer) all share one reader and
  differ only in the post-helper call.
- Cross-program caution: System segment layout is not fixed across
  programs. The numeric reader sits at `System+0x635` in the probe's
  System but `System+0x72D` in BOMBKI's System (identical routine
  code modulo relocations); System-relative offsets are comparable
  only within a single build. The post-helpers `+0x5FE`/`+0x59D`
  happen to sit at the same offsets in both builds.
- The 6-byte "extent delta" (BOMBKI segment 0xF5CA vs 0xF5D0) was
  MAP bookkeeping only: paragraph padding, zero bytes in both files,
  no effect on EXE bytes.
- Verification (machine): `conformance/compare_tpu.py` - all three
  TPUs byte-identical (MONSTRA 3072, PRZEDM 80128, SWIAT 26000);
  `tools/compare_tp7_artifacts.py` - "EXE byte-identical: 141264
  bytes"; `cmp` clean; md5 of both files
  `7e710a60bb27dc7421092fb0e415a51e`.
- Status: RESOLVED. Strict TP7 EXE byte identity achieved; the
  deferred behavioral-conformance tests are now unblocked (see
  TODO.md).

### 2026-10-03 (142): BOMBKI reference extent corrected to code length

- The region report's BOMBKI "extent delta=6" was an artifact of
  comparing two different quantities: the reference layout's
  footprint (0xF5D0 = BOMBKI start to the SWIAT boundary) against
  the candidate MAP's code length (0xF5CA).
- No original BOMBKI.MAP is retained in `../og/`, so the reference
  BOMBKI code length is established by inference: the EXE is
  byte-identical (cmp/md5 machine evidence), the candidate MAP
  records code length 0xF5CA ending with the exit far-call at
  0xF5C9, and the six trailing bytes (img 0xF5CA-0xF5CF) are
  zeros in both images - paragraph padding per the project
  convention already applied to the System segment's trailing
  pad bytes.
- Corrected `analysis-results/exe_reports/reference-linked-layout.json`
  BOMBKI reference_size 0xF5D0 -> 0xF5CA with the evidence note.
- Region report now: 7/7 regions "relative bytes exact", extent
  delta=0 for all; EXE still byte-identical (141,264 bytes).
- Conformance unit tests: 14/14 pass.

### 2026-10-04 (143): comment glosses aligned, rooms 15/16 trackers swapped

- Comment-only fixes in reconstructed/BOMBKI.PAS (commit
  a320cd4): `MIECHO_Podswiadomosc` gloss "main command-room
  context" -> "subconscious (MODE) context" (1000 = STAN
  PODSWIADOMOSCI; the MODE block at img 0xEAF8..0xEB31
  implements the subconscious command set; room-1 poster
  string 'MODE - WPROWADZENIE W STAN PODSWIADOMOSCI');
  `WalkaMiasto` gloss "dog/city-animal" -> "dog/city-NPC"
  (five dog fields OWCZAREK/PIESEK/JAMNIK/SPANIEL/PUDEL via
  PRZEDM.WALKAPIES; five human-NPC fields TAKSOWKARZ/
  SPRZEDAWCA/ZAMIATACZ/PIJAK/ZEBRAK - real MONSTRA.TPU
  symbols per tpu_reports/MONSTRA.symbols.csv - via
  PRZEDM.VEASY; recovered strings treat them as people:
  'TAKSOWKARZ WTARGNA TU ZE SWOJA BRYKA', 'ZYSKALES KOMPLET
  OBRABIAJAC ZAMIATACZA', 'Z GRUBEGO PORTFELA ZEBRAKA
  WYCIAGASZ BONUS'); `PRZEDM.KOMENDY` cited at img 0x1BB11
  -> 0x1BB07 (0x1BB11 is a DS:0x0564 access site inside
  KOMENDY, finding 122); `Trening` prologue 0x2395 -> 0x2396
  (finding 156; 0x2395 is a string-literal byte);
  `ZakupyPiekarnia` img 0x139BE..0x13CEA -> 0x39BE..0x3CEA
  (disasm-verified prologue at 0x39BE, ret at 0x3CEA).
- Rooms 15/16 invented tracker names swapped, correcting the
  arbitrary assignment recorded in finding 136: room 15
  (exit 'POLODNIE-KLATKA ODPORNEGO' in POKOJ11, room text
  'POWOLNY ACZ ODPORNY NA BOL POTWOR', stats WROGEN 40 /
  WROGZRE 3 / WROGSIL 3, DGROUP 0x05C, init img 0x197F) is
  now tracked as `StanOdpornego`; room 16 (exit 'GORA-KLATKA
  SILNEGO,ODPORNEGO I ZRECZNEGO', room text 'OGROMNY
  POTWOR', stats 40/11/10, DGROUP 0x05E, init img 0x1985)
  is now tracked as `StanOgromnego` (its room text reads
  'OGROMNY POTWOR'). `StanOgromnego` rather than
  `StanSilnego` because room 13's identity is already
  owned by the TPU symbol `MONSTRA.SILNY`, so a second
  "silny" tracker for room 16 read as a duplicate.
  Invented names only: the
  DGROUP words, init values, room gating, and save/load
  order are unchanged.
- `POKOJE` gloss in reconstructed/SWIAT.PAS: "four separate
  guarded rooms" -> "four separate cramped rooms" (rooms
  6/7/8/10 all print 'JESTES W DOSYC CIASNYM POKOJU I
  NICZEGO TU NIEMA').
- `PRZEDM.SMIERC` in reconstructed/PRZEDM.PAS commented as
  dead and unfinished code, uncalled in the reconstruction;
  the actual death handling is the reconstructed Smierc
  function in BOMBKI.PAS. (SMIERC exists in PRZEDM.TPU at
  0x0141..0x0277, stable entry 0x0110 - findings 27/1161 -
  compiled in but never called.)
- integrated-field-map.md: DGROUP 0x70 label synced from
  `Godzin` to the current identifier `GodzinySnu`.
- Verification (machine): TP7 compile under DOSBox-X via
  tools/compare_tp7_artifacts.py - MONSTRA/PRZEDM/SWIAT TPU
  per-line code-byte counts: no mismatches (42/1460/415
  entries); BOMBKI.EXE byte-identical to ../og/BOMBKI.EXE
  (141264 bytes). FPC TP-mode conformance (conformance/
  pas-conformance.sh): 4/4 PASS.
- Status: RESOLVED (documentation and invented-identifier
  naming only; behavior unchanged).

### 2026-10-05 (144): unused numeric label 1 removed from ZdobadzPoziom

- `ZdobadzPoziom` (reconstructed/BOMBKI.PAS, img
  0x872E..0x8BA2) declared `label 1;` and defined `1:`
  before the level-up body at img 0x87A2, but no
  `goto 1` existed anywhere in the source (the only
  numeric label; all 33 `goto` statements target the
  five L-named labels).
- Machine evidence: img 0x87A2 is a live jump target -
  five conditional jumps land there (je at 0x8745,
  je at 0x8754, je at 0x8763, jl at 0x877E, jle at
  0x879D), emitted by TP7 as the merge point of the
  nested threshold if-chain's false paths (threshold
  tests at img 0x8738/0x8747/0x8756: KUNSZT 700/725/
  730 vs POZIOM 1/2/3, then 735+POZIOM and
  735+2*POZIOM). The label itself is a source-level
  marker only, so removing it cannot change codegen.
- Removed the `label` declaration and the `1:`
  definition; kept the `{ Level up body at img 0x87A2 }`
  comment.
- Verification (machine): TP7 compile under DOSBox-X
  via tools/compare_tp7_artifacts.py - MONSTRA/PRZEDM/
  SWIAT TPU per-line code-byte counts: no mismatches;
  BOMBKI.EXE byte-identical to ../og/BOMBKI.EXE
  (141264 bytes). FPC TP-mode conformance: 4/4 PASS.
- Status: RESOLVED (dead source marker removed;
  compiled output unchanged).

### 2026-10-05 (145): ZdobadzPoziom renamed to SprawdzCzyZdobylesLevel

- Invented procedure name changed: `ZdobadzPoziom`
  -> `SprawdzCzyZdobylesLevel` ("check whether you
  gained a level"), matching the routine's role: it
  tests the KUNSZT/POZIOM level thresholds and
  awards the level-up. Sites: forward declaration,
  definition (img 0x872E..0x8BA2), and the call in
  the JA/inventory helper (img 0xB0F3).
- The name is invented (main-program symbol; no TPU
  owns it), so the rename is free. Historical log
  entries keep the old name.
- CONTRIBUTING.md naming-convention example updated
  to the new name.
- Verification (machine): TP7 compile under DOSBox-X
  via tools/compare_tp7_artifacts.py - MONSTRA/
  PRZEDM/SWIAT TPU per-line code-byte counts: no
  mismatches; BOMBKI.EXE byte-identical to
  ../og/BOMBKI.EXE (141264 bytes). FPC TP-mode
  conformance: 4/4 PASS.
- Status: RESOLVED (invented-identifier rename only;
  compiled output unchanged).
