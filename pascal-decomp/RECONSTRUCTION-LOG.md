# BOMBKI - reverse-engineering reconstruction results
### MONSTRA / SWIAT / PRZEDM (Turbo Pascal 7, x86-16 real-mode, Polish DOS)

Game: **BONDBI** / BOMBKI — turn-based adventure, Mateusz Pawluczuk (Kraków).
Ground truth: `BOMBKI.EXE` (MZ real-mode, 120 048 B image, base img `0052E0`,
entry `0000:B0CF`, 5295 MZ relocs / 239 in-image cells), `MONSTRA.TPU`,
`SWIAT.TPU`, `PRZEDM.TPU` (TP7 TPUQ units), `PLIKI.TPU` (text save).

---

## 1. Deliverables

| file | content |
|---|---|
| `MONSTRA.PAS` | unit interface skeleton — 21 Integer globals (`MAXE`…`SILNY`+`WSTEP`), `procedure WSTEP`; body stubs by TPU entry codes |
| `SWIAT.PAS` | 12 room bodies, POKOJ0..POKOJ100 and POKOJE (img 0xF5D0..0x129C6) |
| `PRZEDM.PAS` | fullest — 167 globals, 35 entries: `BRANIE, UZYWANIE, TARCZA, WALKA, MINIARENA, KTO, MODE, SLABO..BARUDNO`; Integer/Text/string typing resolved; source-equivalent bodies for the interface procs (see §5) |
| `BOMBKI.PAS` | main skeleton with `uses crt,swiat,przedm,monstra,dos,system` |
| `WALKA-CombatEngine-reconstructed.pas` | full combat-engine body (see entry (9)) |
| `WCZYTANIE-LoadEngine-reconstructed.pas` | full save/load-engine body (see entry (10)) |
| `WSTEP-reconstructed.pas` | WALKA kick+flee block |

Interfaces are verified byte-accurate against the TP7 unit dumps: 0 leftover
foreign `System.ofsXXXX` references; all far pointers resolved to
`System`/`CRT`/unit-local, plus `string` = System.ofs00BA seed.

Port status (2026-09-26): the portable port (`c-port/`) was cross-checked
against this reconstruction and develops separately; it is NOT a reference for
the PAS deliverables, which are grounded in the EXE/TPU evidence only. Port
comparisons live exclusively in `C-PORT-DISCREPANCIES.md` (entries 1..19 +
"Confirmed 1:1"); this file carries original-side results and register
pointers only.

## 2. Save format (PLIKI.TPU = text, CRLF)

Plain-text save, cp437-safe, CRLF line endings — *not* a TPU. First bytes of
the real save: `1000\r\n24\r\n-100\r\n0\r\n-10\r\n-100\r\n0\r\n99\r\n380...
10000\r\n21JA\r\n-15...`. Integer stats are stored one-per-line; narrative
text afterwards; `plik: Text` write with `WriteLn`.

## 3. Scope — cut line

The interface/save-format reconstruction and PRZEDM source bodies preceded the
room transcription. SWIAT's 12 bodies now have a same-build EXE/TPU mapping
(img 0xF5D0..0x129C6; see §5, 2026-09-27), superseding the previous
different-build assumption *for SWIAT*. The remaining `BODY TODO` stubs in
other units are the earlier scoped cut, not implicit reconstruction claims.

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
2. **Entry sweep** (`0000:B0CF`): the loader's entry IP lands on a Pascal
   string-const, `"NOSISZ ZE SOBA:"` (0F-length prefix), not on code — so the
   EXE entry is not a linear code start and the real main is elsewhere.
3. **Reloc histogram**: stored far-paragraph cells cluster at **0E42 (52 refs:
   game code seg)** and **05DD (35 refs: data seg)** — the two paragraphs the
   game body really lives in. The image was disassembled recursive-descent
   from every loader-fixed far cell (610 cells → ~35 unique stored
   paragraphs), producing proc bodies anchored at their real code targets; far
   operands resolve through the loader, so they match the standalone paragraph
   addresses used in the TPU interface reports.

## 5. Reconstruction findings (dated)

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

### 2026-09-24 (5): save()=DGROUP serialization -> SUPERSEDED by (6)
Preliminary read of PLIKI.TPU (thought 81 fields); field numbering/guesses here
are WRONG (off-by-one + interpretation) and are replaced by the decoded save()
(see (6)). Developer side-finding stands: author box path /Users/zrfu/...
(Linux/macOS).

### 2026-09-24 (6): save() proc decoded (80 fields = file 1:1)
PRZEDM.save() = EXE paragraph at img 0x2BA1 (write order = file order):

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

CONFIRMS the descending stat band DGROUP layout (MIECHO>KUNSZT>PASZOL>WIMP>ZWIEJ).
save() also emits a player-name Pascal string (ds:0x264) -> field '21JA' and a
cs-const path string '/Users/zrfu/gry/BOMBKI/PRZEDM.TPU' (field 15; dev box
remnant, author 'zrfu' built on Linux/macOS). File = 80 numeric lines + name.

### 2026-09-24 (7): load-side readback reconstruction integrated — corrections
A second, independent load-side reconstruction (PLIKI.TPU readback + 616
string-compare call-sites, 380 resolved; CurrentContext/PreviousRoomContext +
MODE/UNMODE + the shared combat engine SWIAT:0x46 + per-monster room trackers
at 0x668,+6/ea) was integrated with the save-side map
(`WCZYTANIE-LoadEngine-reconstructed.pas`). Its address map and the save-side
map agree field-for-field; transforms are exact inverses. Names were
cross-validated against the character-sheet display routine (0x11ba-0x1405),
the level-up routine (0x8990-0x8ba0), and PRZEDM addr-adjacency strings.
RETRO-CORRECTIONS to the earlier DGROUP naming:

  OLD (INCORRECT)              CORRECT
  0x180 = MIECHO (stat)        0x180 = PreviousRoomContext (raw 10000 = room id)
  0x182 = KUNSZT (4)           0x182 = PRZED, carried-item count (±1 per pick-up/
                                drop and talent event); the "JESTES OBLADOWANY"
                                gate compares it to the capacity field, see (9).
                                Ceiling stat = MaxLoad/PRO [0x1C2]
  0x19C = FORSA / Money        0x19C = Energy (55; save (E+40)*4=380; max=0x664)
  0x194 = -                    0x194 = Money (0 here)
  0x1AC..0x1D4 = MONSTRA HP     0x1AC/0x1AE = ManaCur/ManaMax (250/250);
                                0x1C4..0x1D4 = skill-chance block (SZ parts,
                                Kopanie/Uciekanie/Parowanie/Powracanie, "%."x54)
                                Monster stats are NOT in the save record.
  0x1D6 = scene command var    0x1D6 = CurrentContext (room/interface id;
                                'E','F','G','H' writes = menu-selected room ids;
                                1000 = STAN PODSWIADOMOSCI (MODE) via MODE/UNMODE, prev in 0x180)
  CharacterLevel unknown        0x25C = level, saved as lvl+0x17 (24 => lvl 1)

Also confirmed: Money vs 0x21A:0x21C longint pool (BAZAR buy gates) still open;
0x257 = PIGULKA (saved byte, drop-count shortint); the old 0x74 "POTRAWKI
chance" name is a separate CWICZ field, not a count — ambiguity resolved. Full
merged record incl. byte-flag cluster 0x255..0x262 and TPlayerMisc
(0x664=EnergiaMax, 0x668+ monster trackers): `INTEGRATED-FIELD-MAP.md`. The
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
  Kaseta's PRO −8 is MaxLoad/PRO [0x1C2].) 0x1B2 = combat margin/reward scratch.
- Full body: `WALKA-CombatEngine-reconstructed.pas`; mechanics also in
  `INTEGRATED-FIELD-MAP.md` §"Combat engine".

### 2026-09-24 (10): wczytaj() load engine + trening + level gates decoded
Full readback body: `WCZYTANIE-LoadEngine-reconstructed.pas`:

- **wczytaj() = img 0x7D80** (proc-init; ends ~0x85FF). RTL: `0x6C6`
  ReadLn(cmd), `0x2E6` Assign to cs:0x7D6B "plik.tpu", `0x364` Reset, **`0x72D`
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
  Serce). Full tiers in (13) and INTEGRATED-FIELD-MAP.md §"Kill router".
- **PorownajDispatch @ 0x1491B..0x153E8** = the 67-entry fight/compare ladder
  (cmd strcmp 0x14A5F..0x153BB): animals, people, plants, dogs, BAKTERIA —
  grouped by a `[0x686]` skill threshold (Zrecznosc==0x13+9 / 0x14,0x15+10;
  Parowanie>0x4B/+1,>0x32/+1; Kopanie>0xA/+2,+2; gate ≥0x10). Full vocabulary
  table in INTEGRATED-FIELD-MAP.md §"Room command vocabulary" (the doc's earlier
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
  INTEGRATED-FIELD-MAP.md updated (§ Kill drops / City square dispatch rows).

### 2026-09-24 (13): KillDispatch router + fight launcher tiers (+ monster tiers)

- **KillDispatch 0x4F53** = the real `ZABIJ <NPC>` router for 10 room NPCs.
  Entry pattern: `cmd=="ZABIJ X"` AND `RoomKillFlag_*` == CurrentContext
  (NPC is present in the room; flag seeded by room/map-gen) → `lcall` tier
  launcher (para 0x129D offsets 0xf77/0x1090/0x11b2) → on `MonsterHP<1`
  clear the flag byte and roll the kill bonus. **Full command→flag mapping**
  documented in INTEGRATED-FIELD-MAP.md §"Kill router": DZIECKO 0x24C, WARIAT
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
  reconciliation: INTEGRATED-FIELD-MAP.md.

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
  UZYJ KOMPLET SYF (0x216) → MaxLoad [0x1C2]+=7; UZYJ GARNITUR (0x222) →
  MaxLoad+=0xA, OutfitZrecznoscBonus [0x1C4]+=1, HeavyBlow [0x224]+=0xF.
  ODLORZ reverses. Item_Bigos byte 0x259 (+20% E).
- **ColorChangeDispatch 0x197F1**: ZMIEN KOLOR/ZMIEN TLO → lcall 0x1C0F:0x263/
  0x1C0F:0x27D with a user number.
- Fields named StaryMiecz (0x17E), MalaTarcza (0x184), DyplomMudSzkoly (0x188),
  MaxLoad (0x1C2), OutfitZrecznoscBonus (0x1C4), OutfitEquipped (0x218);
  INTEGRATED-FIELD-MAP.md §"Item subsystem" added.

### 2026-09-24 (15): Room-level ZABIJ handlers + launcher entry-point fixes + Kaseta decode

- **Per-room killer bytes** (each "present in this room/arena" gate; fight; on win
  clear byte + unique drop) decoded across the city/market/garden dispatchers:
  POTWOR `[0x5A]==0xE` (custom HP20/Dex30/Dmg3, loot R(15), then 30%/30%/25%
  StaryMiecz/MalaTarcza/Serce if each still 0), MINI-BARMAN `[0x67A]==0x43` &
  GRUBAS `[0x67C]==0x43` (arena 'C'; 15% Piwo `[0x7C]-=10`), D.J
  `[0x67E]==0x45` (scene 'E'; 25% SuchaRacja `[0x1A4]-=10`, 3% **Kaseta Liroya
  UNIQE** = `[0x22E]-=10`, EnergyMax+5, **MaxLoad-8**, Zrecznosc+1), DRZWI
  `[0x688]!=0` door → `[0x688]=0` (high-tier Potwor3 fight to break the door),
  STARUCH `[0x68A]!=0` → corpse-vanish no-loot, PEDAL/MACIEK → ZabijPotwor2 +
  PIGULKAZYSK, PARA → ZabijPotwor4 twice.
- **Kaseta flavor resolved**: "SMIEC . S.Z -8 MAXE +5 ZRE +1" == MaxLoad [0x1C2]
  −8 / EnergyMax [0x664] +5 / ZrecznoscCur [0x190] +1 — confirms MaxLoad at
  0x1C2.
- **Launcher entry-point fixes**: true `push bp` entries are ZabijMrowka 0x13839,
  ZabijPotwor1..4 = 0x13CA4/0x13DD0/0x13EF3/0x14016 (the earlier keys were 1..5
  bytes past the prologue). Escalation chains confirmed from caller offsets:
  0xE69=Mrowka, 0x1400=Potwor2, 0x1523=Potwor3, 0x1646=Potwor4.
- INTEGRATED-FIELD-MAP.md: new table §"Room-level ZABIJ handlers".

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
  save schema (PLIKI.TPU flat ReadLn text dump) recorded.
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
  maps). 1:1 with the port's arena room table (rooms 33-57 = contexts
  0x21..0x39, entrance 32 = 0x20) — confirmed in the register.
- **Forsa load math pinned**: wczytaj does `Forsa := Forsa div MadroscCur`
  (img 0x7FA4..0x7FBB via TP7 RTL @LDiv 0x1C71:0x7FA); the sign-in block in
  save() prints Forsa x Madrosc (img 0x2E0F..0x2E22, @LMul 0x1C71:0x7BD).
  The earlier "+= Madrosc" guess was wrong.
- **Money split resolved**: 0x194 = saved **PRAKTYK** counter ("CWICZYSZ
  KOPANIE ... MASZ <n> PRAKTYK"; school "ZYSKALES <n> PRAKTYK" 3-6 by wisdom
  tier; CWICZ lessons cost 1); FORSA [0x21A:0x21C] = coins/monety (loot,
  DAWAJ KASE, shop/BAZAR gates).

### 2026-09-24 (18): c-port vs disasm discrepancy audit
The full machine-verified register lives in `C-PORT-DISCREPANCIES.md` (entries
1..19 + "Confirmed 1:1"); it was added as the "c-port discrepancy register"
inside INTEGRATED-FIELD-MAP.md and moved out when that file was made
discrepancy-free. Confirmed 1:1: arena edges, quest prices/counters/rewards,
death penalty, TRENUJ 3/2/3, monster tiers, food/mana percentages, POROWNANIE
formula.

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
  These match our reconstructed filenames 1:1 — no rename needed, confirming the reconstruction maps to the original units. Persisted as per-unit `*.src.txt` reports in `analysis-results/tpu_reports/` (date cell kept raw, not DOS-decoded).
- **Checksums / uses.** MONSTRA `$242F`, SWIAT `$3B76`, PRZEDM `$647E`; uses chains MONSTRA(`crt,System`), PRZEDM(`dos,monstra,crt,System`), SWIAT(`przedm,monstra,crt,System`) match the reconstruction interfaces.
- **PLIKI.TPU is not a unit.** It is the in-game saved-game text file (a save record), not a TP7 unit; `tpuq` correctly refuses to parse it as `TPUQ`.
- **Correction of the §4.2 "entry sweep" claim.** The earlier claim that the loader's entry IP lands on the Pascal string `"NOSISZ ZE SOBA:"` mixed up image-relative and file-relative offsets:
  - MZ header: `CS:IP = 0000:B0CF`, header paragraphs `0x52E`, image length `0x1D4F0`. With `img = file[0x52E*16:]`, the entry is at **img 0xB0CF**, not img 0x00000.
  - Bytes at img 0xB0CF are `9A 00 00 71 1C` = **`lcall 1C71:0000`** — real code, the System bootstrap (DS=DGROUP 0x1D49, BSS zeroed 0x52..0x8EE, CPU probe, heap init).
  - The string `'NOSISZ ZE SOBA:'` (0F-length prefix) sits at **img 0x00000**, at the literal-pool start — it is not the entry target.
- **Traced startup order (img-relative):** `0xB0CF` `lcall 1C71:0000` (System bootstrap) → `1C0F:000D` (std TextRec init) → main prologue `0xB0D9` (`push bp; mov bp,sp; xor ax,ax`) → `1C71:02CD` (heap check) → `1C71:0C79` (`GetTime` → `Randomize` seed) → `call 0x116EF` → `1C0F:031A` → `call 0x51C3` (`Checkpoint`) → `call 0x872E` (`LevelUp`) → `mov ax,[0x182]` (PRZED) / `cmp [0x62]` (MaxLoad) / `jg` overload-print block → `jmp 0xB193` main loop.
- **Open nuance — first game call.** `call 0x116EF` at img 0xB0E8 (`E8 04 66`) computes target `0x116EF`, which is **byte 2 of the 5-byte `lcall 1C71:09D7`** at img 0x116EE (`9A D7 09 71 1C`) — off-by-one against the linear sweep. The enclosing routine's prologue is at img 0x11638 (`push bp; mov bp,sp; xor ax,ax`); taking img 0x116EE as the start yields the clean stream (`lcall 1C71:0291`; `mov di,0x564`; push/push; `lcall 1C71:09D7`; `jne`; `lcall 129D:3114` `PRZEDM_MODE`). Not blocking — the startup/input-overwrite routine writes textrec 0x564 with strings cs:0x1FEE/0x1FF3/0x1FF8 and calls `PRZEDM_MODE`.
- **Stat-table writes are spread, not central.** `OWCZAREK` `[0x1B0]` (`mov word [0x1B0],imm`) hits at 0x5DB4, 0xB3CE, 0xB695, 0xB85E, 0xD091, 0x10981, 0x12995, 0x12A20, 0x13843; `[0x1B8]` at 0x5DBA, 0xB3D4, 0xB69B, 0xB864, 0xD097, 0x10987, 0x1298F, 0x12A26, 0x13849, 0x13DE9, 0x13F0C; `StaryMiecz` `[0x17E]` at 0x3F5C, 0xEC33, 0xED5E, 0xEDB5, 0x18446 — i.e. stats are written inside many game procs (WSTEP, spawns, LevelUp), not a single central init block. The proc at 0x5C36 reads textrec 0x564 with string cs:0x5B7C, checks `[0x58]==0xC`, then writes fresh MONSTRA stats and calls `WALKA 0x129D:0x44A6`.
- **Unit inits live in the program-body prologue.** The RTL/System zone (paras `0x1C0F..0x1D4F`) never calls game code below `0x1C00`, so unit initialization blocks are emitted into the program-body prologue after the traced head rather than being called from System/CRT.

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
  `analysis-results/disasm/SWIAT-region.asm` (all addresses img 0x…).
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
  `analysis-results/disasm/BOMBKI-main-dispatch.asm`.
- **OPEN transcription scope:** inline room handlers and the MODE command
  body at img 0xB25A..0xF5B1 still need source transcription before the
  main-program `BODY TODO` can be replaced with a source-equivalent loop.

## 6. Open items

- Exact name per 0x1D8..0x218 slot — solvable by pairing save()/wczytaj()
  WriteLn order.
- A nonzero-money save would independently confirm the FORSA [0x21A:0x21C]
  longint-pool math.
