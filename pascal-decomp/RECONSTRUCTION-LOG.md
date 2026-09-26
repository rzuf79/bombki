# BOMBKI - reverse-engineering reconstruction log
### MONSTRA / SWIAT / PRZEDM (Turbo Pascal 7, x86-16 real-mode, Polish DOS)

Game: **BONDBI** / BOMBKI — turn-based adventure, Mateusz Pawluczuk (Kraków).
Files: `BOMBKI.EXE` (MZ real-mode, 120 048 B image, base img `0052E0`,
entry `0000:B0CF`, 5295 MZ relocs / 239 in-image cells), `MONSTRA.TPU`,
`SWIAT.TPU`, `PRZEDM.TPU` (TP7 TPUQ units), `PLIKI.TPU` (text save).

---

## 1. Deliverable — `RECONSTRUCTED\`
| file | content |
|---|---|
| `MONSTRA.PAS` | unit interface skeleton — 21 Integer globals (`MAXE`…`SILNY`+`WSTEP`), `procedure WSTEP`; body stubs by TPU entry codes |
| `SWIAT.PAS` | `POKOJ0..POKOJ100, POKOJE` + room vars; 13 proc stubs |
| `PRZEDM.PAS` | fullest — 167 globals, 35 entries: `BRANIE, UZYWANIE, TARCZA, WALKA, MINIARENA, KTO, MODE, SLABO..BARUDNO, PRZEDM/BOMBKI text` ; Integer/Text/string typing resolved |
| `BOMBKI.PAS` | main skeleton with `uses crt,swiat,przedm,monstra,dos,system` |
| `..\RECONSTRUCTION-LOG.md` | this log + save-format spec |
| `analysis-results\disasm\*.asm` | code-body disassembly reports (see §3) |

Interfaces are **verified byte-accurate** against `analysis-results\tpu_reports\*.interface.pas`
(0 leftover foreign `System.ofsXXXX` references; all far pointers resolved to
`System`/`CRT`/unit-local, plus `string`=System.ofs00BA seed).

Port status (2026-09-26): the portable port (`c-port/`) was cross-checked
against this reconstruction and now develops separately; it is NOT a reference
for the PAS deliverable, which is grounded in the EXE/TPU evidence only
(`analysis-results\disasm\*.asm`, `INTEGRATED-FIELD-MAP.md`, per-proc reconstructions).

## 2. Save format (PLIKI.TPU = text, CRLF)
Plain-text save, cp437-safe, CRLF line endings — *not* a TPU. First bytes of
the real save: `1000\r\n24\r\n-100\r\n0\r\n-10\r\n-100\r\n0\r\n99\r\n380...
10000\r\n21JA\r\n-15...`. Integer stats are stored one-per-line; narrative
text afterwards; `plik: Text` write with `WriteLn`. Doc: `RECONSTRUCTION-LOG.md` §"Save".

## 3. DISASM phase — result (verified, with evidence)

Three independent x86-16 experiments against BOMBKI.EXE (reproducible):

1. **RAW slide** of MONSTRA(1195B)/SWIAT(13303B)/PRZEDM(38118B) TPU code
   blobs over the image: even *masked* (all 4 reloc-cell bytes wildcarded on
   both sides), every window saturates at **65 non-cell mismatches** — the
   TPU code bodies are NOT a byte-slice of the final linked EXE. The TPUs in
   this tree are a different build snapshot of the source than what produced
   BOMBKI.EXE (interfaces & save layout carry over; bodies do not slide).

2. **Entry sweep** (`0000:B0CF`): the loader's entry IP lands on a Pascal
   string-const, `"NOSISZ ZE SOBA:"` (0F-length prefix), not on code — so
   BOMBKI.EXE entry is not a plain linear code start; the real main is
   elsewhere, and a linear disasm from entry-ofs alone is not meaningful.

3. **Reloc histogram** (the usable map): stored far-pointer paragraphs
   cluster at **0E42 (52 refs: game code seg)** and **05DD (35 refs: data
   seg)** — these are the two paragraphs the game body really lives in.
   `analysis-results\disasm\hits.txt` lists top slide windows; the two
   paragraphs above are the anchor for a future capstone2 pass.

Packaging tooling is in `analysis-tools\` (`tpuq.py` TPUQ parser, `tplsplit.py` TPL→TPU,
`pack.py` assemble, `lindis.py` x86-16 disasm harness + capstone 5.0.7).


## DISASM phase (BOMBKI.EXE) - DONE

Two listing artifacts were produced with capstone(x86/16, cs be16):
  analysis-results\disasm\BOMBKI-body.asm   27 320 129 B  (game code body,
      every procedure headered as "; ===== proc para:ofs (cell@imgXXXX) =====";
      far operands resolve loader-fixed from the image, so they match the
      standalone paragraph addresses used in the TPU interface reports above)
  analysis-results\disasm\entry.asm            54 961 B  (MZ entry init region)

Key data recovered this phase:
  - 3 game-unit code bodies were SEARCHED by masked-slide over the image:
    no window drops below 65 non-reloc-cell mismatches => the TPU snapshots
    and the final EXE are DIFFERENT BUILD GENERATIONS of the source; the
    unit INTERFACES and save-format are faithful, the byte-exact bodies are
    not recoverable by TPU->EXE slide. (registry histogram of loader-fixed
    far cells: two hot paragraphs 0E42 x52 and 05DD x35 = SWIAT + PRZEDM
    bodies; entry cell B0CF holds a length-14 Pascal string-const
    "NOSISZ ZE SOBA:", confirming entry is the TP7 runtime string region,
    not linear code.)
  - The IMAGE was then disassembled recursive-descent from every loader-fixed
    far-cell (610 cells => ~35 unique stored paragraphs), producing the body
    listing anchored at those real code targets.
  Cutting here is deliberate: the deliverable "asm + interface + save-format"
  is complete; reimplementing the unit bodies as TP7 source is a separate
  authoring task on top of the (preserved) interface skeletons.

## 2026-09-24 -- DGROUP anchors VERIFIED (no guesswork)
Empirical scan of TP7 global-access idioms (C7 06 / 89 06 / 3B 06 / A1 / ...)
over the whole image yields a contiguous sparse table of Integer slots:

  PRZEDM  [017E .. 01AA]  23 words  --  MMIECZ(017E) WEKA(01AA)
  MONSTRA [01AC .. 01D4]  21 words  --  MAXE(01AC)  SILNY(01D4)
  hot     [01D6]          menu/choice var (BODY-B writes 'E','F','G','H')
  table   [01D8 .. 0218]  32 words  ReadLn-fed table (3 refs each)

Proven by the constant-init that TP emits as C7 06 <disp> <imm>:
  OWCZAREK(01B0) gets 188/200 (HP), PIESEK(01B6) 2/5/10,
  TAKSOWKARZ(01B8) 1/3/16/26 -- classic MONSTRA monster-stat setup.

Both recovered game proc bodies (BODY-A para 0E42:9A57, BODY-B para 05DD:1C71)
have their in-code memory operands annotated to these names in
BOMBKI-body-annot.pas / BODIES.PAS.


## DGROUP correction (empirical, proven pairs)
BODY-A/BODY-B write the monster-stat band in DESCENDING order:
  0180=MIECHO  0182=KUNSZT  0184=PASZOL  0186=WIMP  0188=ZWIEJ    (proven by C7 06 imm + -10 guards)
  0192=ILOSC   019C..019E = Longint (FORSA/PRZEPUSTKA band, printed as Longint)
  (earlier linear guess 017E..01AA = first-23-vars is superseded; the stat band is reversed.)


## 2026-09-24 (2): string-resolved proc identity
BODY-B (para 05DD:1C71, abs 07A41) is a STAGE/DIALOGUE routine (not WSTEP):
  cs:679E 'POLODNIE-SRODEK SCENY'
  cs:67B4 'LUDZIE SIE NA CIEBIE GAPIA, JESTES NA SRODKU SCENY !!! KTOS CI MOWI:'
  cs:67FA 'HEY MAN IT,S COOL YEAH! . A TY NA TO: JE JE KUP KUL....'
  cs:6874 'DALEJ PISAC NIE MA O CZYM WIEC MOZESZ MI NASKOCZYC'
  cs:06A2 '...FUKSROLL- MANY E'  (item menu)
=> likely PRZEDM.SCENA/TLUM (bandleader dialogue with LUDZIE crowd).
DGROUP 0x1D6 = scene command var; 0x19C longint band = CIALO/FORSA/PRZEPUSTKA cluster.


## 2026-09-24 (3): the 0x1D8..0x218 table
32 halfword slots (0x40 B). Access pattern: sentinel init {cmp (slot),-1} /\n{cmp (slot),-0xA} and {mov (slot),1} => a 32-entry progress/result flag array,nnot a 28-monster list (roster is N=28, offsets don't align). BODY-A uses it for\nfight-result slots; see BOMBKI-body.pas at abs 0x19C01, 0x19207..0x19800.\nMonster roster (PRZEDM, 28): KORNIK..TRENER -- three import vars at 0x1B4/0x1B6 band nare the active-fighter (WROGSIL/WROGZRE/SZANSA) working state.\n

## 2026-09-24 (4): 0x1D8..0x218 -- final typing (evidence-limited)
Band = 32 x 2-byte slots. Code shows BOTH array (stride-2, sentinels -1/-10/1)
AND scalar uses: {0x212}:=Random(15); {0x21A/0x21C} Longint accumulator;
{0x1DE/0x1E0} sorted-cmp slots. Verdict: a result/progress workspace shared
by room(+fight)-outcome flags, NOT strictly a 32-array and NOT a 100-room map
(0x100 room data lives elsewhere; cf. SWIAT.PAS POKOJE). See seg129D slice
(real init at 129D:12A1) + BOMBKI-body.pas abs 19207/19C01.  Open item: exact
name per slot -- solvable by pairing save()/wczytaj() WriteLn order.


## 2026-09-24 (5): save()=DGROUP serialization -> SUPERSEDED by (6)
Preliminary read of PLIKI.TPU (thought 81 fields); field numbering/guesses here
are WRONG (off-by-one + interpretation) and are replaced by the decoded save():
see section (6) + SAVE-FIELD-MAP.txt which maps all 80 fields 1:1 to DGROUP
slots + encoding expressions from the actual save() write sequence.
Developer side-finding stands: author box path /Users/zrfu/... (Linux/macOS).

## 2026-09-24 (6): save() proc decoded - SAVE-FIELD-MAP.txt (80 fields = file 1:1)
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
cs-const path string '/Users/zrfu/gry/BOMBKI/PRZEDM.TPU' (field 15; dev box remnant,
author 'zrfu' built on Linux/macOS). File = 80 numeric lines + name.
Full table: RECONSTRUCTED\disasm\procs\SAVE-FIELD-MAP.txt

## 2026-09-24 (7): Load-side readback reconstruction integrated - corrections
A second, independent load-side reconstruction (PLIKI.TPU readback +
PlayerState.pas record + 616 string-compare call-sites, 380 resolved;
CurrentContext/PreviousRoomContext + MODE/UNMODE + one shared combat engine
SWIAT:0x46 + per-monster room trackers at 0x668,+6/ea) was integrated with the
save-side map (WCZYTANIE-LoadEngine-reconstructed.pas). Its address map and my
save-side map agree field-for-field; transforms are exact inverses. Names were
cross-validated against the character-sheet display routine (0x11ba-0x1405),
the level-up routine (0x8990-0x8ba0), and PRZEDM addr-adjacency strings.
RHETRO-CORRECTIONS to my earlier DGROUP naming:

  OLD (INCORRECT)              CORRECT
  0x180 = MIECHO (stat)        0x180 = PreviousRoomContext (raw 10000 = room id)
  0x182 = KUNSZT (4)           0x182 = PRZED, carried-item count (±1 per pick-up/
                                drop and talent event); the "JESTES OBLADOWANY"
                                gate compares it to the capacity field, see §(9).
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
0x257 = PIGULKA (saved byte, drop-count shortint); the 0x74 "POTRAWKI chance"
name is a separate CWICZ field, not a count - ambiguity resolved. Full merged
record incl. byte-flag cluster 0x255..0x262 and TPlayerMisc (0x664=EnergiaMax,
0x668+ monster trackers): INTEGRATED-FIELD-MAP.md. WSTEP-
reconstructed.pas's "proven MONSTRA band" header is RETRACTED (see (8)).

## 2026-09-24 (8): KUNSZT = 0x1D4; death penalty decoded (level-based)
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

## 2026-09-24 (9): combat engine fully decoded — WALKA-CombatEngine-reconstructed.pas
EXE proc **paragraph 0x129D:0x44A6 = img 0x16E76..0x181C6** (old "BODY-A
0E42:9A57" was a wrong paragraph; img offsets authoritative — 0E42*16+9A57 =
17E77 is mid-round, not the head). Complete game flow decoded:

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
  `[0x21A:0x21C]` (=1424, f18). `0x194` ("Money" per load-side) is separate
  (used by training costs); relationship open until a nonzero-money save.
- **0x182 = PRZED**, the carried-item count (±1 per sentinel pick-up/drop and
  talent events); the overburden "JESTES OBLADOWANY" gate compares it to the
  carrying-capacity field. (The stat bumped by outfits +7 SYF/+10 GARNITUR and
  Kaseta's PRO −8 is MaxLoad/PRO [0x1C2].) 0x1B2 = combat margin/reward scratch.
- Doc: `INTEGRATED-FIELD-MAP.md` §"Combat engine"; reconstruction:
  `RECONSTRUCTED\WALKA-CombatEngine-reconstructed.pas` (Pascal body with
  offsets, string ids, launcher table, formulas).

## 2026-09-24 (10): wczytaj() load engine + trening + level gates decoded
`RECONSTRUCTED\WCZYTANIE-LoadEngine-reconstructed.pas` (full readback body):

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
- **trening block img 0x2396..0x2B73** (before save()): each training command
  (strcmp on ds:0x564 at cs:0x221D/0x2286/0x22C8/0x230C/0x2354) costs
  **1× PRAKTYK [0x194]`** and raises one skill, printed as a percent:
  - Uciekanie[0x1CE] += Madrosc+Zrecznosc-5   (cap 0x55)
  - Powracanie[0x78] += 2*Madrosc-3           (needs Madrosc>17, cap 0x5A)
  - Parowanie[0x1C6] += Madrosc+Zrecznosc-14  (needs Madrosc>15 & Zrec>11, cap 0x5A)
  - [0x25D] += 3*Madrosc-9                     (needs Madrosc>11, byte, cap 0x5A)
  - Talent[0x258] += Madrosc+1                 (needs Madrosc>18, cap 0x5A)
- **Level-up proc img 0x872E..0x8BA2**: lvl1 700, lvl2 725 (0x2D5), lvl3 730
  (0x2DA), lvl4-8 735+POZIOM, lvl9+ 735+2*POZIOM. Body at 0x87A2; 0x8BA2 is the
  common epilogue (pop bp; retf), not a level-up entry. Porter costs 725/730/735,
  +POZIOM (4-8), +2*POZIOM (9+) per LEVELING.md (c-port evidence).
- save() itself (img 0x2BA1..0x356E) re-verified: writes f1..f80 with the
  WriteLn/WriteLongint helpers; f18 emitted via `0x7BD` from
  `[0x21A]:[0x21C]`.

## 2026-09-24 (11): Room proc + garden + training + kill-drop layer decoded
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
  Serce). Full tiers in §(13) and INTEGRATED-FIELD-MAP.md §"Kill router".
- **PorownajDispatch @ 0x1491B..0x153E8** = the 67-entry fight/compare ladder
  (cmd strcmp 0x14A5F..0x153BB): animals, people, plants, dogs, BAKTERIA —
  grouped by a `[0x686]` skill threshold (Zrecznosc==0x13+9 / 0x14,0x15+10;
  Parowanie>0x4B/+1,>0x32/+1; Kopanie>0xA/+2,+2; gate ≥0x10). Full vocabulary
  table in INTEGRATED-FIELD-MAP.md §"Room command vocabulary". The doc's earlier
  "compare params" note was wrong — the prompt string is the fight-menu header.
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
- Listing regenerated with all symbols; **INTEGRATED-FIELD-MAP.md** updated
  (§ Room / Training / Kill drops / command-vocabulary + field rows for
  GardenSpot*, Plant*, GardenAnimal*, 0x261 room marker).

## 2026-09-24 (12): POROWNAC oracle, full drop family, city-square quest/boss layer

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
- Symbols renamed: BossWin 0x159E4/0x15A91 → DropListek/DropScroll; FIELDS
  0x686 "PowerLevel", 0x25D "SkillPorownywanie", 0x230 already present.
  annotate.py PROCS duplicate key (0x1586E BossWin) removed. Listing regenerated;
  **INTEGRATED-FIELD-MAP.md** updated (§ Kill drops / City square dispatch rows).

## 2026-09-24 (13): KillDispatch router + fight launcher tiers (+ monster tiers)

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
  (HP 90-99/100-119/130-149/
  72-74, Dex 14-15/16/20/13-14, Dmg 17-18/18-19/19-20/16-17; loot
  10..64/30..59/20..64/15..64).
- **Special encounters call drops directly**: "MIESA LUDZKIEGO... MOZGI"
  seduction fight (HP 200/Dex 15/Dmg 18, wounds 20/10) → on win LISTEKZYSK +
  PIGULKAZYSK + SCROLLPORZYSK, and `[0x262]`(QuestPhase) -= 0x32 while non-zero.
- KillDispatch `call`s confirmed from rooms (0x6A20, 0x6BF1, 0x6D67, 0x6F10,
  0x709D, 0x71F7, 0x73B3, 0x7647...) alongside "ZABIJ MINI-BARMAN", "ZABIJ
  GRUBAS", "ZABIJ D.J", "ZABIJ POTWOR", "ZABIJ PEDAL/PARA/MACIEK", "ZABIJ
  DRZWI", "ZABIJ STARUCH" strings.
- PROC labels fixed: 0x1394A ZabijTrup + 0x13A63 ZabijMlodyPotwor legacy
  duplicates removed; ZabijPotwor 0x13CA9..0x1401B renamed with stat descs.
  Listing regenerated; INTEGRATED-FIELD-MAP.md gets the full router/launcher
  tables + "ZabijTrup:lcall 0x129D:0x44A6" reconciliation with Walka.

## 2026-09-24 (14): Item subsystem decoded (BIERZ/ODRZUC/UZYJ + outfits + time travel)

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
- annotate.py: FIELDS 0x17E/0x184/0x188/0x1C2/0x1C4/0x218 renamed (StaryMiecz,
  MalaTarcza, DyplomMudSzkoly, MaxLoad, OutfitZrecznoscBonus, OutfitEquipped);
  PROCS ItemPickupDropDispatch/ItemUseDispatch/ColorChangeDispatch added.
  Listing regenerated; INTEGRATED-FIELD-MAP.md §"Item subsystem" added.

## 2026-09-24 (15): Room-level ZABIJ handlers + launcher entry-point fixes + Kaseta decode

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
  ZabijPotwor1..4 = 0x13CA4/0x13DD0/0x13EF3/0x14016 (annotate keys corrected —
  they were 1..5 bytes past the prologue). Escalation chains confirmed from
  caller offsets: 0xE69=Mrowka, 0x1400=Potwor2, 0x1523=Potwor3, 0x1646=Potwor4.
- INTEGRATED-FIELD-MAP.md: new table §"Room-level ZABIJ handlers".

## 2026-09-24 (16): Ground-truth cross-check vs retained TPU units + portable port

- Cross-checked against the retained TPU units + portable port under `c-port/`
  (docs/compatibility.md fact register, evidence/recovered/*.md TPU dossiers,
  evidence/generated/*.tsv|.md|.json symbol/proc tables, src/*).
- **Launcher procs ARE the PRZEDM difficulty procedures** (matched via stat
  comparison + PRZEDM dossiers): 0x13839 SLABO (drop = **PACZEK** [0x1A0]
  `R(10)<7`, not Serce — `enemies.c` "bloody_heart" label retracted),
  0x13947 MNIEJSLABO, 0x13A60 SREDNIO, 0x13B82 TRUDNO, 0x13CA4 VEASY,
  0x13DD0 EASY, 0x13EF3 NEASY, 0x14016 BTRUDNO (was ZabijPotwor1..4),
  0x12A16 WALKAPIES. annotate.py PROCS renamed accordingly; listing
  regenerated (old Zabij* references → 0; "ZabijSilny 2" = leftover comments).
- **Profile numbers corrected**: prior Potwor1..4 "Dex/Dmg maxima 17-26/
  18-31/19-32" were misreads; true = VEASY/EASY/NEASY/BTRUDNO rows.
- **Mana bottle corrected**: gate `[0x192]==-10`, `[0x182]--`, `[0x192]+=0xA`
  (0x192 = Item_ButelkaMany **count**), **ManaCur [0x1AC] += 30** cap ManaMax
  [0x1AE] — my earlier "Mana at 0x192" was wrong.
- TPU Pascal symbols bound to EXE offsets: FORSA [0x21A:0x21C], PRZED [0x182],
  WROGEN/WROGSIL/WROGZRE [0x1B0]/[0x1B6]/[0x1B8], CZY [0x19E], PASZOL [0x1D2],
  MANA/MAXMANA [0x1AC]/[0x1AE], POZIOM [0x25C], POR [0x25D], KOP/KOPM/KOPHP
  [0x1C8]/[0x1CA]/[0x1CC], ZWIEJ [0x1CE], JAKIEUB/ABRON/ATAR = worn-id buffer.
- Unique-loot ladder + KillDispatch actor→profile table + stacks room-procs
  (SWIAT POKOJ0/5/11/30/60/75/83/100/…) added; stores/price oddities, race
  init, save schema (PLIKI.TPU flat ReadLn text dump), parser vocab recorded.
- Open-items updated: `[0x17E]` post-kill event RESOLVED = StaryMiecz drop
  ladder gate; skill gates confirmed saved fields (f56/57/59); 0x257 is
  PIGULKA (not POTRAWKI), while FORSA-vs-0x194 money was still open here.

## 2026-09-24 (17): Arena grid command box (img 0x19C90..0x1AF1E) + money split

- Located the "0x19C00 region": it is the **arena grid shared dispatcher**,
  contexts 0x20..0x39 (0x20 entrance, 0x21..0x39 = cells). Commands: MODE,
  **ZABIJ <28 beasts/NPCs>** (KORNIK..PANTERA by tier SLABO/MNIEJSLABO/SREDNIO;
  GLADIATOR/WOJOWNIK +PIGULKAZYSK, TRENER +GARNITURZYSK; pens = the old
  "GardenSpot_01DA..0x210" words), **EXIT**, **WYJSCIE**, and the N/E/S/W grid
  moves guarded by **ArenaMoveLatch [0x214]** / **ArenaSouthLatch [0x1D8]**.
  Full 26-cell N/E/S/W edge table recovered (EXIT text matches maps) and added
  to INTEGRATED-FIELD-MAP.md §"Arena grid command box". **Cross-verified 1:1
  against c-port world.c arena room table** (rooms 33-57 = contexts 0x21..0x39,
  entrance 32 = 0x20): every edge + EXIT text variant agrees.
- **Forsa load math pinned**: wczytaj does `Forsa := Forsa div MadroscCur`
  (img 0x7FA4..0x7FBB via TP7 RTL @LDiv 0x1C71:0x7FA); sign-in block in save()
  prints Forsa x Madrosc (img 0x2E0F..0x2E22, @LMul 0x1C71:0x7BD). Earlier
  "+= Madrosc" guess was wrong; c-port omits the rescale (port deviation).
- annotate.py: GardenSpot_01DA..0x210 renamed to Beast<name>, 0x214→
  ArenaMoveLatch, 0x1D8→ArenaSouthLatch; listing regenerated.
- **Money split resolved**: 0x194 = saved **PRAKTYK** counter ("CWICZYSZ
  KOPANIE ... MASZ <n> PRAKTYK"; school "ZYSKALES <n> PRAKTYK" 3-6 by wisdom
  tier; CWICZ lessons cost 1); FORSA [0x21A:0x21C] = coins/monety (loot,
  DAWAJ KASE, shop/BAZAR gates). c-port carries both `coins` + `practices`.
  annotate.py 0x194→PRAKTYK, 0x21A/0x21C→ForsaLo/ForsaHi.

## 2026-09-24 (18): c-port vs disasm discrepancy audit

Cross-checked the recovered c-port dossiers against the original disasm.
Full machine-verified register now lives in C-PORT-DISCREPANCIES.md (it was
added as the "c-port discrepancy register" inside INTEGRATED-FIELD-MAP.md and
moved out when that file was made discrepancy-free). Highlights:
- **Flee**: original = Mana drain Random(2)+2, gates, Mana-15, then success iff
  Random(100)<=Uciekanie -> FleeFlag=1 **+ 20 KUNSZT** (string @img 0x17FCD).
  Port uses dex-score chance and no mana cost.
- **Max-stats**: 0x196=MadroscMax / 0x198=SilaMax / 0x19A=ZrecznoscMax proven by
  char-select init 0x1748..0x18B9; LEVELING dossier had them swapped.
- **Save format**: original = unlabelled flat ReadLn sequence; port = labeled
  key=value lines (not byte-compatible).
- **Quest turn-in**: original adds PRZED[0x182] +-1 (type 1/3) plus a
  MadroscCur-1 step (type 3 "remove pipe's wisdom bonus" — the port *does*
  mirror that one via `apply_carried_item_effect(PIPE,-1)`, but omits the
  PRZED bumps).
- Confirmed 1:1 instead: arena edges, quest prices/counters/rewards, death
  penalty, TRENUJ 3/2/3, monster tiers, food/mana percentages, POROWNANIE
  formula.

## 2026-09-25 (19): PRZEDM MODE/SCENA/TLUM reconstructed

- `PRZEDM.PAS` now contains source-equivalent bodies for `MODE` (TPU source
  543..546; EXE img 0x15AE4..0x15AFB), `SCENA` (548..553; EXE img
  0x15BCF..0x15C6E), and `TLUM` (555..566; EXE img 0x15E37..0x15FBE).
- `[0x226..0x22C]` are confirmed as GITARZYSTA/PERKUSISTA/ORGANISTA/LIROY
  room positions, not garden spots: `Room` assigns each `Random(3)+70`,
  `SCENA` prints by equality with `MIECHO`, and `FIGHTSCENA` tests/clears the
  same fields for the four `ZABIJ` commands. (Crowd NPCs seed separately:
  DZIECKO `[0x24C]` = `Random(7)+0x3C` re-rolling `≤0x3C`, so rooms **61-66** —
  the port adds `ROOM_BEER_HALL`/67 as a reachable 7th candidate.)
- The C port preserves the 14 actor strings and random placement categories.
  It has no direct `MODE` state: commands operate directly, while the
  original helper saves `MIECHO` to `MIECHO2` and enters context 1000.

## 2026-09-25 (20): PRZEDM unique-drop family reconstructed

- `PRZEDM.PAS` now contains source-equivalent bodies for `GARNITURZYSK`,
  `PIGULKAZYSK`, `KASETAZYSK`, `LISTEKZYSK`, and `SCROLLPORZYSK` from TPU
  source lines 490..540 and EXE img 0x157B9..0x15AE3.
- Exact roll comparisons are preserved, including the displayed-rate quirks:
  Garnitur is `<=25` of `Random(1000)`, Pigulka is `<=42`, Kaseta is `<2` of
  `Random(100)`, Listek is `<6` while its text says 4%, and Scroll is `<10`.
- TPU symbols resolve byte 0x257 as `PIGULKA` and byte 0x25B as `LISTEK`,
  replacing stale semantic guesses in the annotation map.
- The C port preserves the rolls, text, grants, Kaseta `MAXE +5`/`ZRE +1`, and
  Listek `MAXMANA +40`. It omits Kaseta's original `PRO -8` carrying-ceiling
  penalty. Its generic helper also does not model the `MIECHO <> 10000` guard on
  Kaseta/Listek/Scroll. That guard is *reachable* on a simultaneous knockout:
  the port resolves loot (game.c 1941-1944) before the player-death check
  (game.c 2505-2508), so the drops can fire on the death turn where the original
  sets context 10000 and suppresses them (register entries 4 and 9).

## 2026-09-25 (21): PRZEDM difficulty procedures reconstructed

- `PRZEDM.PAS` now contains source-equivalent bodies for `SLABO`,
  `MNIEJSLABO`, `SREDNIO`, `TRUDNO`, `VEASY`, `EASY`, `NEASY`, and `BTRUDNO`
  from TPU source lines 225..383 and EXE img 0x13839..0x140FF.
- The reconstruction preserves stat and coin rolls, `PASZOL` reward gates,
  `ENERGIA > 0` gates unique to VEASY/EASY/NEASY, exact loot strings, the
  MROWKA-only Paczek path, and the original nested Serce checks and RNG order.
- `enemies.c` agrees with every stat, coin, and drop range. The countable-item
  port deliberately differs in Paczek/Serce ownership and RNG consumption
  (register entry 3). It also grants ordinary VEASY/EASY/NEASY rewards without
  the original `ENERGIA > 0` condition (entry 5) and saturates coin addition
  rather than using the original signed Longint arithmetic (entry 6).
- Stale disassembly annotations were corrected: VEASY/EASY/NEASY damage rolls
  use `Random(2)`, and 0x13B87 is inside `TRUDNO`, not a second procedure.

## 2026-09-25 (22): PRZEDM WALKAPIES reconstructed

- `PRZEDM.PAS` now contains the source-equivalent `WALKAPIES` body from TPU
  source lines 54..67 and EXE img 0x12A16..0x12AC9.
- It sets enemy HP/Dex/Dmg to 10/10/5, calls `WALKA`, then unconditionally
  grants `Random(15)` coins. If `SERCE = 0`, it rolls 25% and stores `MIECHO`
  in `SERCE`, placing the heart in the current room rather than carrying it.
- The C port matches the stats, ranges, strings, and room placement on victory.
  On a flee it skips the original's still-run coin reward and heart drop, does
  not clear the dog's room anchor, and omits the SPANIEL/PUDEL speech that the
  original shows after a successful flee (register entry 7).

## 2026-09-25 (23): PRZEDM FIGHTSCENA reconstructed

- `FIGHTSCENA` is reconstructed from TPU source lines 1435..1461 and EXE img
  0x1AF97..0x1B094, preserving command order and result-gate asymmetry.
- PERKUSISTA/GITARZYSTA/ORGANISTA are cleared and call `KASETAZYSK` after
  `VEASY` regardless of fight result. LIROY uses `NEASY` and requires
  `MIECHO<>10000`, `ENERGIA>0`, and `PASZOL=0` before its exact message, 30
  coins, cassette roll, optional `QUESTWYK-=150`, and actor clear.
- The C port preserves profiles, cassette eligibility, and Liroy quest progress,
  but omits his message/30 coins and gates all stage cleanup/drop on the generic
  victory resolver. Because that resolver (game.c 1941-1944) runs before the
  death handler (game.c 2505-2508), a simultaneous knockout can grant the bonus
  or clear musicians on the death turn where the original's context 10000 would
  suppress them — the "clean victory" phrasing previously used was misleading
  (discrepancy entry 8).

## 2026-09-26 (24): non-stage kill callers + KO-turn loot ordering audited

- KillDispatch/room code pushes **non-stage** drop callers through the same
  fight→drop shape as WALKAPIES/FIGHTSCENA: `TAKSOWKARZ`/`SPRZEDAWCA` →
  `VEASY`+`GARNITURZYSK`, `PEDAL`/`MACIEK` → `PIGULKAZYSK`, `D.J` (arena 'E')
  → cassette. The port only grants these via the zero-energy victory resolver
  (register entry 9).
- Re-derivation confirms the original's `MIECHO <> 10000` guard is **reachable**
  in the port: loot runs before the death handler on a same-turn KO, so the
  context-10000 suppression the original applies can be bypassed (entries 4/9,
  game.c 1941-1944 vs 2505-2508).
- Crowd spawn-set clarification: DZIECKO seeds rooms 61-66
  (`Random(7)+0x3C`, re-roll ≤ `0x3C`); the port's `concert_spawn_rooms[]`
  (game.c 51-60) can place it in 67/`ROOM_BEER_HALL` — numbered register only,
  not a deviation row.

## 2026-09-26 (25): PRZEDM FIGHTBLUSZCZ reconstructed (Duncan market/quest)

- Added the source-equivalent `FIGHTBLUSZCZ` body (PRZEDM.PAS, after
  `FIGHTSCENA`; anchors 1463-1558, TPU 0x0522..0x0A2F): `ZABIJ DUNCAN` →
  EASY + clear when `WROGEN < 1`; `SECRET LISTA` (Duncan present) prints the
  price list; `KUP DOKUMENT` (`FORSA > 399`, **no** Duncan test) applies the
  −10 owned-sentinel to the pass, `FORSA −= 400`, `PRZED += 1`; `KUP PLECAK`
  (Duncan present, `FORSA > 4799`) −10 sentinel, `FORSA −= 4800`,
  `PRZED += 1`; `ROZMAWIAJ DUNCAN` offer/reminder/completion (`DUNQ = 0` →
  offer + `DUNQ := 75`; completion at `DUNQ = -125` (Shortint; byte 0x83) →
  `DUNQ := 0`, `KUNSZT += 125`); garden kills VEASY/EASY with the `ENERGIA >
  0` clear semantics; `ZABIJ TRAWA` = up to 4× `TRUDNO` while `ENERGIA > 0`,
  then the UFF rest line gated on `(ENERGIA > 0) and (PASZOL = 0)`.
- Registered (entry 10): the port gates SECRET LISTA/KUP DOKUMENT/KUP PLECAK
  behind `duncan_black_market_unlocked` (quest completion), whereas the
  original only needed FORSA (KUP DOKUMENT, no Duncan test) or Duncan present
  (SECRET LISTA, KUP PLECAK); plants clear only on KO in the port, while the
  original cleared SZCZAW/KONICZYNKA/MLECZ/DMUCHAWIEC unconditionally after
  `VEASY` (the other five gated on `ENERGIA > 0`, TRAWA never cleared); TRAWA
  is a single TRUDNO fight in the port instead of the repeat-while-alive loop
  (enemies.c 116). The DUNQ quest itself is 1:1 (offer at 75, completion at
  `duncan_quest == 131`, −50 per pokrzywa kill via game.c 1958-1959).

## 2026-09-26 (26): PRZEDM ULSKLEPIKOWA + POROWNANIE + TRAIN reconstructed

- Added the source-equivalent bodies for the three remaining procedures
  (after `FIGHTBLUSZCZ`):
  - `ULSKLEPIKOWA` (source 475-487, TPU 0x0070): 10 × `if MONSTRA.X = MIECHO
    then WriteLn(...)` street/dog descriptions — the strings match the port's
    world.c actor descriptions verbatim (world.c 1227-1246).
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
    gates `PRA > 2/1/2` and costs 3/2/3 — mirrors the port's `train_attribute`
    (confirmed 1:1, game.c 2835-2875).
- Registered (entry 11): the port's basic/street advice middle band is
  `score > 21 && score < 28` (game.c 3077) — off by one vs the original band
  `22 < OGOL < 28`; score 22 prints 'RACZEJ NIE...' in the port where the
  original printed nothing. The oracle formula itself is 1:1 (the port's
  `ZRE div 2` reproduces all seven tier bumps).

## 2026-09-26 (27): PRZEDM save/TARCZA/PIERDOLY/KOMENDY/BLUSZCZ + SMIERC reconstructed

- Added five interface-proc bodies (after `TRAIN`) plus the implementation-local
  `SMIERC` right after `implementation` (mirrors its early original placement,
  source 192-208 — it is a near `ret` helper that `WALKA`-family bodies call):
  - `save` (source 1573-1574, TPU 0x0108): empty stub — pure prologue/epilogue;
    the real persistence lives in the main program (see the save anchor).
  - `TARCZA` (source 601-608, TPU 0x0022..0x0090): `FUKS := Random(100)`; block
    when `FUKS <= PRO`; `WPYSK := WPYSK - ILOSC` clamped at 0; verbatim
    `'OSLONILES SIE ! TRACISZ ', WPYSK, ' ENERGII'`.
  - `PIERDOLY` (source 1111-1122, TPU 0x003B..0x00E1): `ZMIEN KOLOR`/`ZMIEN TLO`
    prompts + `TextColor`/`TextBackground` on `FUKS`.
  - `KOMENDY` (source 1560-1570, TPU 0x0043..0x016F): abbreviation expander
    `PN/PD/W/Z/G/D/E/M` → `POLNOC/POLODNIE/WSCHOD/ZACHOD/GORA/DOL/EXIT/MODE`.
  - `BLUSZCZ` (source 210-223, TPU 0x02E3..0x04AC): 12 × `if X = MIECHO then
    WriteLn(...)` plant/Duncan flavour lines.
  - `SMIERC` (source 192-208, TPU 0x0141..0x0277): six verbatim death lines,
    quest progress 50/200 (`QUEST`=1/>1), `ENERGIA := MONSTRA.MAXE`,
    `KUNSZT -= 250 - Random(50) + 5*POZIOM`, `MIECHO := 20`, `POTWORY`,
    `wpisz := 'PAMIETAJ'`, `save`, `ReadLn`.
- Registered (entries 12, 13, 14): port `parse_direction` (parser.c 42-68) maps
  `W`→west and `E`→east, but the original `W` = *wschód* (east) and
  `E` = the EXIT exits-list command; `M`/`MODE` is unknown in the port and
  N/S/U plus `POLUDNIE` were added (untested single letters). PIERDOLY colour
  commands have no port equivalent. Small-shield block is fixed 10%/1pt in
  `apply_small_shield` (game.c 2274-2290) vs the original's mutable `PRO`/
  `ILOSC` (armour suit adds +10/+1, PRZEDM.UZYWANIE img 0x0F2C..0x0F39).
- Confirmed 1:1: SMIERC ↔ `resolve_player_death` (game.c 2377-2409) and the
  BLUSZCZ plant lines ↔ world.c actor descriptions (1275-1298, incl. trailing
  spaces on STOKROTKA/JEZYNA).

## 2026-09-26 (28): PRZEDM POTWORY/KTO/BRANIE reconstructed

- Added three more interface-proc bodies at the marker (after `TRAIN`):
  - `POTWORY` (source 70-164, TPU 0x0000..0x05D8): monster-state regeneration.
    Tiered `Random` draws with `repeat-until` anti-clumping guards: arena
    bugs/animals, forest animals, big animals and gladiators `Random(38)+20`
    all `> 32`; dogs and street townies `Random(7)+20` (`> 19`); concert crowd
    and police (byte vars) `Random(7|8|9)+60` (`> 60`); band `Random(3)+70`;
    fixed townsfolk `MINIBARMAN 67`, `GRUBAS 67`, `DJ 69`, `PEDAL/PARA/MACIEK
    76`, `DRZWI 1`, `STARUCH 1`; plants `Random(8)+77` retried until the eight
    main plants `< 84` (AGREST/JEZYNA/TRAWA/DUNCAN unguarded). No strings.
  - `KTO` (source 569-598, TPU 0x0523..0x093B): 28 × `if X = MIECHO then
    WriteLn(...)` arena-crowd lines — all verbatim in world.c's actor-
    description table (1160-1230, incl. `"POMYLONE MISIE"` and the BOA/
    WOJOWNIK trailing spaces); same relocation as BLUSZCZ.
  - `BRANIE` (source 908-963, TPU 0x023F..0x0508): `BIERZ/ODRZUC` for the five
    sentinel items. Pickup gate `X = MIECHO2`, drop gate `X = -10`; `PRZED +1/-1`;
    DYPLOM/FAJKA side-effects `MAXE +5/-5`, `MAD +1` (gated `< MAXMAD`)/`-1`.
    All 10 messages and side-effects match `take_item`/`drop_item` (game.c
    1036-1114); the countable-quantity storage, missing `PRZED` counter and the
    equipped-weapon/shield drop guard are entry 3 territory.
- Registered (entry 15): `game_regenerate_encounters` (game.c 227-294) re-spawns
  the same actor groups but as room placements (arena crowd →
  `ROOM_ARENA_33 + random(25)`, streets/concert/plant pools, fixed
  STARUCH/LIVING_DOOR rooms + `old_elf_present`/`living_door_alive`); the
  original's numeric state model with retry-until floors has no port analog —
  deliberate architectural difference (moderate).
- Confirmed 1:1: POTWORY's fixed townsfolk map onto the port's fixed
  rooms/booleans (DRZWI ↔ living door, STARUCH ↔ elf house); KTO and BLUSZCZ
  are the same relocated-description pattern.

## 2026-09-26 (29): PRZEDM UZYWANIE reconstructed

- Added the `UZYWANIE` body at the marker (source 965-1108, TPU 0x00D8): the
  use-item dispatcher on `wpisz`. `UZYJ FAJKA` (kept, not consumed), `UZYJ
  SERCE` (`SERCE := 0`, energy +5 capped, `PRZED - 1`), `UZYJ DYPLOM` (10-line
  box with three blank rows), food PACZEK/CIASTKO/SUCHA/BULKA/CHLEB/WEKA
  (`PRZED - 1`, +10 to the -10 quantity sentinel, energy +8/12/16/20/26/34
  capped to MAXE), MBUTELKA (mana +30 capped to MAXMANA), BIGOS (+20%),
  ZNISZCZ/PATRZ PRZEPUSTKA (Longint gate `< -1`; the 7-line pass box keeps the
  `questów` diacritic; ZNISZCZ bumps `PRZED + 1`), KASETA and LISTEK info
  lines (verbatim, incl. trailing spaces), KOMPLET "SYF" (`PRO + 7`,
  `CIALO := 1`, `JAKIEUB := 'SYF'`; ODLORZ reverses), GARNITUR (`CIALO := 1`,
  `ILOSC + 1`, `PRO + 10`, `FUKSROLL + 15`; ODLORZ reverses), PIGULKA (consume,
  full `POTWORY` re-roll, then MAD tiers `<10` → MAXE−1/ENERGIA:=1/KUNSZT−50,
  `10..15` → ENERGIA−40 clamp≥1/KUNSZT−30, `>15` → none).
- Cross-checked against `use_item`/`unequip_item`/`destroy_item` (game.c
  1140-1431): all messages and the food/heart/bottle effect table are verbatim
  and 1:1 (`restore_energy`/`restore_mana` cap like MAXE/MAXMANA; pipe kept).
- Registered (entry 16): the transport pill omits the original's `POTWORY`
  re-roll (the port only regenerates encounters on init/death); SYF/GARNITUR
  side-stats fold into `equipped_clothing` + item definitions (PRO/CIALO/
  ILOSC/FUKSROLL have no analog — same family as entry 14); ZNISZCZ PRZEPUSTKA
  uses the quantity model (consume + `quest_passage_open`) instead of
  `PRZED + 1`; the port adds ITEM_BEER. MAD-penalty tiers match 1:1.

## 2026-09-26 (30): PRZEDM WALKA reconstructed

- Added the `WALKA` body at the marker (source 611-905, TPU 0x04EC): the
  generic combat round used by every fight launcher. One-time stat-margin
  `MINIKUNSZT` prologue (`MONSTRA.MAXE`/`SIL`/`ZRE` vs `WROGEN`/`WROGSIL`/
  `WROGZRE`: up +10..+1, equal +11, down +12..+21 — chains decoded from raw
  `jne`/band jumps), then the `repeat ... until (ENERGIA < 1) or (WROGEN < 1)
  or (PASZOL = 1)` loop: `ON/TY := 0` + the `WALCZYSZ - <<<<...` header; twin
  dodge tables (`Random(12..23)`/`Random(35..60)`, `FUKS < 10` flags) in both
  `ZRE` directions with the four verbatim dodge lines; enemy strike
  `WPYSK := Random(WROGSIL)` with the four tier lines
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
  `MONSTRA.MAXE` (`>75 → −2`, `>115 → −3`), PAR (`>50/75/95 → −2/−2/−1`), KOP
  (`>50/95 → −5/−2`), floor 0, `ZABILES GO ! ZYSKUJESZ ZA TO ' , MINIKUNSZT ,
  ' KUNSZTU '`, `KUNSZT += MINIKUNSZT`, `FIREBALL/POISON := 0`,
  `QUESTWYK − 1`, the POTRAWKI bigos + learn block (`POTRAWKI > FUKS` →
  `BIGOS −= 10`, `PRZED + 1`, learn `(FUKS<1) and (POTRAWKI<100)`); death
  block `ENERGIA < 1` → `!!!!!!!!!!!ZOSTALES ZABITY!!!!!!!!!!!!`,
  `Delay(3000)`, `MIECHO := 10000`, and the unconditional `MINIKUNSZT := 0`.
- Cross-checked against `resolve_victory_kunszt` (game.c 1835-1869),
  `try_cook_defeated_enemy` (1871-1896), `recovered_dodge_roll`
  (1984-2029), `recovered_combat_chance` (2031-2141), `try_flee`
  (2145-2170), `try_kick` (2196-2228), the damage-tier describers
  (2230-2272), `apply_automatic_parry` (2292-2340) and
  `resolve_basic_combat_round` (2417-2508): dodge tables, both damage tier
  sets (verbatim strings), parry bands, magic, KOP, flee, reward/POTRAWKI
  and the KO ordering are 1:1.
- Registered (entry 17): `recovered_combat_chance` reproduces the margin
  prologue 1:1, but `resolve_victory_kunszt` never adds the original's
  per-round `MINIKUNSZT + 1` accrual, and the parry-learn `+5` is granted
  immediately as experience instead of banked into the `ZABILES GO !`
  reward (withheld on death in the original). The two kill-reward reductions
  compare `active_opponent_maximum_energy > 75/115` instead of the player's
  own `MONSTRA.MAXE` — the original nearly always applies them. The
  FUKSROLL heavy-blow re-roll has no port analog (player strike is a single
  `random_below(state, strength)`) — same mutable-stat family as entries
  S/U.

## 2026-09-26 (31): PRZEDM MINIARENA reconstructed (final interface body)

- Added the `MINIARENA` body at the marker (source 1124-1433, TPU 0x00E8,
  bytes 0x0299..0x1689), completing every interface procedure: the arena's
  self-contained command loop is now reconstructed. Gate `MIECHO` cells
  33-57 → `ARENA := 1` + the `JESTES NA ARENIE I CZUJESZ POTRZEBE
  ZABIJANIA` line + a one-shot `KTO` crowd list; then the
  `repeat write(ENERGIA, '%.', KUNSZT, '>') ReadLn(wpisz) KOMENDY MODE
  [fights] EXIT WYJSCIE [moves] STOP := 0 until (ARENA = 0) or
  (MIECHO = 1000)` loop — chains all decoded from the raw cmp/je pairs.
- 30 `ZABIJ X` fighters (BAKTERIA..TRENER), each gated on the creature's
  room anchor and dispatched to the reconstructed difficulty procs
  (SLABO/MNIEJSLABO/SREDNIO/TRUDNO); the four `PASZOL = 0`-gated drops
  (SLIMAK/KORNIK/MUCHA/ZUK) keep the creature alive when the player fled,
  and the TRUDNO trio (GLADIATOR/WOJOWNIK/TRENER) also trigger the
  PIGULKAZYSK / GARNITURZYSK give-aways.
- `EXIT` prints the per-cell exit menu — all ten variants
  (DOSTEPNE WYJSCIA / DOSTEPNE WYJSCIE / MOZESZ WYJSC NA : /
  MOZESZ ISC NA :); `WYJSCIE` jumps straight out of the loop; the four
  direction blocks (POLODNIE/POLNOC/WSCHOD/ZACHOD) remap every arena cell
  33-57 — including the 33→32 entrance edge, the `ARENA := 1` blocked
  edges, and the POLNOC/WSCHOD/ZACHOD `STOP`-flag chains decoded from raw.
- Cross-checked 1:1 against the port: all 25 cells × 4 directions match
  the world.c arena grid (entrance 32, asserted by test_world.c 243-268),
  all ten exit-list variants match world.c 718-939, the tier dispatch
  matches the enemies.c profiles, and the GLADIATOR/WOJOWNIK/TRENER
  give-aways match game.c 1555-1685. Registered deviations (entry 18, all
  minor): the `%.` status prompt and the one-shot arena `KTO` list are not
  printed by the port's CLI, the `WYJSCIE` leave word is not ported, and
  arena drops clear only on kill (the original also clears most creatures
  when the player fled).
- This was the last pending interface body — no prose bodies remain at
  the marker.

