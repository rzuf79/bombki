# BOMBKI integrated player-state + save-field map

Two independent reconstructions, now reconciled field-for-field:
- **this repo** (`RECONSTRUCTED\disasm\procs\SAVE-FIELD-MAP.txt`) - SAVE side:
  the EXE's save() proc (img 0x2BA1) writes 80 fields to PLIKI.TPU as text.
- **help-you-need/** - LOAD side: PLIKI.TPU read back by the load routine,
  plus PlayerState.pas (word-strided record 0x52..0x262), which was
  cross-validated against the character-sheet display routine
  (0x11ba-0x1405), the level-up routine (0x8990-0x8ba0), and PRZEDM strings.

Key result: addresses agree field-for-field; transforms are exact inverses;
several names from the single-pass SAVE-side analysis were WRONG and are
corrected here (Energy!=Money, 0x182=PRZED carried count, 0x180=PreviousRoomContext,
0x1AC/0x1AE=ManaCur/ManaMax not monster HP).

## Headers / how the two reads agree

- PLIKI.TPU is a flat sequential text dump of the player record;
  saves write the same 80 fields the loader reads back, in the same order.
- Field transforms are byte-exact inverses (verified for f1, f9, f11, f12, f2).

## The merged record (word fields, base DGROUP 0000)

                 SAVE(mine)          LOAD-theirs        merged meaning
   0x52   f16     0                   0x52               Field_0052
   0x54   f30     1                   0x54               Field_0054
   0x56   f33     1                   0x56               Field_0056
   0x58   f34     0                   0x58               Field_0058
   0x5A   f36     0                   0x5a               Field_005A
   0x5C   f37     0                   0x5c               Field_005C
   0x5E   f38     0                   0x5e               Field_005E
   0x60   f39     1                   0x60               Field_0060
   0x62   f21     10  (=raw)          0x62  "MaxLoad"    MaxLoad
   0x6C   f15     0/Users/zrfu/...    0x6c  CheckpointStage (0..3)
                                        (dev-path is a dev-box artifact baked into
                                        PLIKI.TPU; stage reset to 0 on level-up)
   0x6E   f40     25                  0x6e               Field_006E
   0x74   f42     0                   0x74 "Potrawki"   (chance) (conflict, see below)
   0x76   f43     0                   0x76               Field_0076
   0x78   f72     0                   0x78 "Powracanie"  (chance)
   0x7A   f76     0                   0x7a "ScrollPowrot"(item flag)
   0x7C   f74     0                   0x7c "Piwo"        (item count)
   0x17E  f3     -100                 0x17e              Field_017E
   0x180  f10     10000               0x180 "PreviousRoomContext"
   0x182  f27     4                   0x182 "PRZED"        = carried-item count
                        (pick-up/drop and talent events -> +1; the overburden
                        "JESTES OBLADOWANY" gate compares it to the carrying-
                        capacity field; ceiling stat MaxLoad/PRO [0x1C2], outfits
                        +7 SYF/+10 GARNITUR, Kaseta -8; WAS GIMMICK "KUNSZT(4)")
   0x184  f6     -100                 0x184              Field_0184
0x186  f44    -10                  0x186              Item_Serce (sentinel -10 = none)
0x188  f5     -10                  0x188              Item_DyplomMudSzkoly <- WAS "ZWIEJ(-10)"
    0x18A  f4     0                    0x18a              Item_Fajka (addr-cand "CIEZKA FAJKA")
   0x18C  f13     16                  0x18c              MadroscCur
   0x18E  f12   -15 (+0x18) save     0x18e  0x18e+SilaCur?  "SILA -" label at addr-cand
   0x190  f11    "21JA" (corrupt)    0x190  "ZRECZNOSC -"  ZrecznoscCur
   0x192  f45     0                   0x192              ItemCount_ButelkaMany
   0x194  f14     0                   0x194  "PRAKTYK"   PRAKTYK (practice money)
   0x196  f26     25                  0x196              MadroscMax
   0x198  f24     15                  0x198              SilaMax
   0x19A  f25     11                  0x19a              ZrecznoscMax
   0x19C  f9      55  (raw)          0x19c  "Energy"    Energy  <- WAS MISNAMED FORSA/Money
   0x1A0                                       (0x1a0 = "PACZEK" label only) ItemCount_Paczek?
   0x1A2  f46     0                   0x1a2               ItemCount_Ciastko
   0x1A4  f47     0                   0x1a4               ItemCount_SuchaRacja
   0x1A6  f48     0                   0x1a6               ItemCount_Chleb
   0x1A8  f49     0                   0x1a8               ItemCount_Bulka
   0x1AA  f50     0                   0x1aa               ItemCount_Weka
   0x1AC  f1      250 (<<2=1000)     0x1ac               ManaCur   <- WAS MONSTER-HP "MAXE"
   0x1AE  f23     250                 0x1ae               ManaMax
   0x1B0  (unsaved)    0x1b0               MonsterHP   <- set by combat launchers
                        (20/20/40/40/188/200 per monster; not part of the save)
   0x1B2  f17     2                   0x1b2               combat margin scratch
                        (reward deltas + monster-type base; see WALKA engine)
   0x1B6  (unsaved)                        MonsterDmg  (combat, launcher-set)
   0x1B8  (unsaved)                        MonsterDex  (combat, launcher-set)
   0x1C2  f28     15                  0x1c2               MaxLoad (outfits +7 SYF / +10 GARNITUR)
   0x1C4  f53     1                   0x1c4               OutfitZrecznoscBonus (S.Z part; GARNITUR +1)
   0x1C6  f54     0                   0x1c6               SkillChance_Parowanie
                        (combat: Random(140)<=Parowanie parries; roll==0 && <100 -> +1)
   0x1C8  f55     0                   0x1c8  "KOPANIE"    SkillChance_Kopanie
                        (kick hits iff (Kopanie-10) >= Random(100); dmg
                        Random(level)+Random(10); kills reward clipped at >50/>95)
   0x1CA  f56     0                   0x1ca               Kopanie gate: needs ManaCur > [1CA]
   0x1CC  f57     0                   0x1cc               Kopanie gate: needs Energy < [1CC]
   0x1CE  f58     0                   0x1ce  "UCIEKANIE"  SkillChance_Uciekanie
                        (ZWIEJ, img 0x17F55..0x1800B: every attempt drains
                         Mana -= (Random(2)+2); gates Uciekanie>0 &&
                         Energy<[0x1D0] && ManaCur>14; then ManaCur -= 15;
                         success iff Random(100) <= Uciekanie ->
                         FleeFlag[0x1D2]=1 and KUNSZT[0x1D4] -= 20 with
                         "WSTYD !!! UCIEKLES Z POLA BITWY TRACISZ 20 KUNSZTU"))
   0x1D0  f59     0                   0x1d0               flee gate: needs Energy < [1D0]
   0x1D2  f60     0                   0x1d2               FleeFlag (1 = fled; combat loop exits)
   0x1D4  f8      99                  0x1d4  "%."x54      KUNSZT  <- was Field_01D4
                    CONFIRMED 2026-09-24 by death-penalty decode: it is the
                    skill/experience stat, hit by a LEVEL-BASED loss on death:
                      [0x1D4] -= 250 - Random(50) + 5*[0x25C]  (img 0x3800-0x3811)
                    ("TRACISZ KUNSZT ADEKWATNIE DO TWOJEGO LEVELKA").
                    "%."x54 labels are the adjoint percent display (SZ%/chance).
   0x1D6  (not saved)    0x1d6 = CurrentContext (room/interface id); 1000=COMMON_MODE
   0x1D8  f61     1                   0x1d8               ArenaSouthLatch (1 = arena N/E/W move blocked)
0x1DA  f65     57                  0x1da               BeastKornik pen (ZABIJ -> PRZEDM_SLABO)
0x1DC  f66     52                  0x1dc               BeastMucha pen   (arena; WAS GardenSpot)
0x1DE  f67     33                  0x1de               BeastBakteria pen (0x1DA..0x210 = arena pens)
0x1E0  f70     54                  0x1e0               BeastSlimak pen
   0x212  f19     27                  0x212  "WYCIAGASZ"  CombatLootMoney
                        <- per-kill money reward Random(10/15/30/3) printed here
                        then added to the 0x21A longint (NOT "LastLootedItemId")
   0x216  f62     0                   0x216  "KOMPLET UBRAN FIRMY" ItemFlag_KompletUbranSyf
   0x218  f31     0                   0x218               OutfitEquipped flag (SYF/GARNITUR set 1)
   0x21A  f18     1424 (longint lo)  0x21a               **FORSA / coins (32-bit)** <- CONFIRMED
                        (runtime value = raw div MadroscCur on load; see open items)
   0x21C  (f18 high word)            as combat launchers do [0x21A:0x21C] += Random(reward)
                        after each kill; BAZAR buy gates compare this longint
   0x222  f7      0                   0x222  "GARNITUR Z KOLCAMI" ItemCount_GarniturKolce
   0x224  f29     3                   0x224  "FUKSROLL"   HeavyBlowThreshold
                        <- combat riposte rerolls strike while 10*Strike <= [0x224]
                        (relabelled from "FuksRoll")
0x22E  f63     0                   0x22e  "KASETA LIROYA" ItemFlag_KasetaLiroya
0x230  f75     0                   0x230  "SCROLL POROWNYWANIA" ItemFlag_ScrollPorownanie
                        <- SCROLLPORZYSK acquires `-=10`
    0x248  f68     0                   0x248  "TWأ“J QUEST"  QuestType
    0x24A  f69     0                   0x24a               QuestMonstersRemaining
                        <- CONFIRMED: combat kill does [0x24A]-=1 when [0x248]>0;
                        BAZAR death sets it to 75/200/200 by quest type (city buys)

   undefined at odd 0x1A0: "SMACZNY POLANY LIKIEREM PACZEK" in addr-cands
   (string was consumed as label; the word field may be ItemCount_Paczek unsaved)

   Byte-flag cluster 0x255..0x262 (save f41,f64,f71,f73,f2,f22,f78,f79,f80):
   0x255  f79  0       0x255  Flag_0255
0x257  f64  0       0x257  PIGULKA / transport-pill item  <- CONFIRMED saved BYTE (f64,
                         read back `[0x257]:=ReadLn` in wczytaj 0x83CF); TPU
                         `PIGULKA: Shortint` (gain -=10); 0x74 "Potrawki chance"
                         is the CWICZ skill field, NOT the pill count
   0x258  f41  0       0x258  TalentChance   <- combat: if >0 && Random(100)<[258]
                        => talent-up event `[0x259]-=10; PRZED+=1`  (was "Bigos")
   0x259  f73  0       0x259  TalentPool     <- decremented 10 per talent proc (was "Listek")
0x25B  f71  0       0x25b  LISTEK / lucky-leaf item (byte)
                        <- acquisition decrements it by 10; the distinct
                        compare-skill counter is POR at 0x25D
0x25C  f2   24 (-0x17 → lvl 1)  0x25c CharacterLevel  <- CORRECTED from RaceId
0x25D  f22  0       0x25d  (byte)  SkillPorownywanie (trainable: +=3*Madrosc-9
                        AND 3%-per-POROWNAC learn; cap 0x64)
0x25E  (unsaved)     0x25e  LingeringWound_A  (boss/death sets 5/20; Random(100)<10 ticks)
0x25F  (unsaved)     0x25f  LingeringWound_B  (boss sets 1/10; tick feeds bleed [0x260]+=10)
0x260  (unsaved)     0x260  BleedTurns       (dmg Random(5) per round until 0)
0x261  f80  79      0x261  RoomByte_261  <- garden/merchant-room marker (house/field
                        id Random(8)+0x4D, compared against context to gate the
                        farmer events "ZABIJ DUNCAN" 0x1B5D2, "KUP PLECAK" 0x1B6F5;
                        esp. reached via the SECRET LISTA merchant at img 0x1B5AC)
0x262  f78  0       0x262  QuestPhaseByte    <- boss kill submits [0x262]-=50
                        (was "QuestHintShown"; hp/dmg/parry/kopanie-skillup clip ladder,
                        see WALKA engine kill reward 0x18037)

   Outlying small array (TPlayerMisc, ~1KB below main block):
   0x664  f20  55      0x664  EnergiaMax   <- BAZAR death restores [0x19C]:=[0x664];
                        combat base-XP + kill-reward clip (EnergiaMax > 75/115)
   0x668  (not saved)        MonsterRoomId_Owczarek (first of per-monster trackers, +6 ea)
   0x66E                       ... Piesek ...
   0x686  f32  0       0x686  PowerLevel (compare/porownaj meter: lvl+Sila+Zrec-tier+Par+Kop; recomputed per compare)
   0x68A  f77  1       0x68a  Field_068A
   0x68C  f35  0       0x68c  7th monster tracker -> combat monster (room 13:
                        HP20/Dex3/Dmg10/Random(15)) via the ZABIJ launcher at 0x10981

## Room proc (map generator + garden) — paragraph 0x129D, img 0x12ACA..0x130A1

The `Room` routine is far larger than the "checkpoint" hint implied. (The `retf` at
0x12AC9 ends a preceding monster launcher = **PRZEDM.WALKAPIES**, img 0x12A16: HP 10 / Dex 10 / Dmg 5 /
Random(15) loot + 25% Serce drop into [0x186].) Real map+flavor setup:

- 11 arena/room monster positions `[0x1DA..0x1EE]` (KORNIK through LIS, each
  `Random(0x26)+0x14`). The four words `[0x226..0x22C]` are instead
  GITARZYSTA/PERKUSISTA/ORGANISTA/LIROY stage positions, each initialized with
  `Random(3)+0x46` (rooms 70..72) and consumed by `SCENA`/`FIGHTSCENA`.
- 11 plant slots `[0x232..0x246]` = PlantSzczaw/Stokrotka/Koniczynka/Mlecz/
  Dmuchawiec/Roza/Jezyna/Oset/Agrest/Malina/Trava (`Random(8)+0x4D`, re-roll ≥0x54).
- 7 garden-animal room ids `[0x666..0x678]` (`Random(7)+0x14`); 3 constants
  0x67A=0x43 0x67C=0x43 0x67E=0x45.
- byte `[0x261]` = garden/merchant-room marker (`Random(8)+0x4D`); also the gate
  for farmer/buyer events ("ZABIJ DUNCAN" img 0x1B5D2, "KUP PLECAK" img 0x1B6F5).
- All are compared to `[0x1d6]` = CurrentContext to gate one-shot flavortext
  ("ROLNIK DUNCAN...", plant texts 0x976..0xC0D, animal texts 0x2B7B/0x2BB2/0x2BE2).
- Surrounding dispatcher (img 0x12414..0x129C6) also holds the **boss encounter**
  (HP 188 / Dex 26 / Dmg 10, wounds 20/10, `lcall 0x129d,0x44a6` = Walka) and the
  "TUR!!!! Z CIALA WROGA" quest reward (KUNSZT+0x1A9) gated on QuestType==3 &&
  QuestCount<1 && Item_Fajka<=-10 && PRAKTYK>0.

## Training (img 0x13194) — money pool note

`TRENUJ SILA/ZRECZNOSC/MADROSC` check `[0x194]` (word PRAKTYK, f14): costs **3/2/3**
(needs >2, >1, >2). By contrast BAZAR purchases and combat kill-money use the
0x21A:0x21C longint. See open items.

## Kill drops (img 0x157B9..0x15AE3)

All five drop handlers roll `Random(1000|100)`, print exact loot text, then
grant the item. Only Kaseta, Listek, and Scroll guard against
`context [0x1D6] == 10000`; Garnitur and Pigulka do not. String base for the
loot texts is paragraph 0x17CB (img 0x1AA50..0x1AD7F):

- 0x157B9 GARNITURZYSK: Random(1000)<=25 (26/1000; text says 2.5%) →
  "ZYSKUJESZ GARNITUR !!!!".
- 0x1586E PIGULKAZYSK: Random(1000)<=42 (43/1000) → "A TO CO ? , TOZ TO !!!
  PIGULKA TRANSPORTUJACA !!!".
- 0x15908 KASETAZYSK: Random(100)<2 → "WYCIAGASZ KASETE LIROYA..." (2%;
  +EnergyMax, -8 carrying ceiling, `PRZED` carried count +1, +1 Zrecznosc;
  Item_KasetaLiroya `-=10`).
- 0x159E4 LISTEKZYSK: Random(100)<6 (text says "UNIQE 4%") →
  "WYCIAGASZ LISTEK SZCZESCIA..."; LISTEK `[0x25B]-=10`,
  `PRZED`++, ManaMax+=0x28.
- 0x15A91 SCROLLPORZYSK: Random(100)<10 → "WYCIAGASZ SCROLL POROWNANIA...";
  Item_ScrollPorownanie `[0x230]-=10`, `PRZED`++.
- 0x15AE4 PRZEDM_MODE: PreviousRoom `[0x180]=context`; context=0x3E8
  (the "cmd" helper called from the city square loop).
- Item fields (Paczek/Ciastko/Kaseta/Liroya/Fajka/Serce/ScrollPorownanie) use **-10 (0xFFF6) as their "owned/none" sentinel**; acquisition is `-= 10`.

## Kill router + fight launchers (KillDispatch 0x4F53, para 0x129D)

**KillDispatch 0x4F53** handles `ZABIJ <NPC>` for 10 room NPCs. Each entry is:
`if cmd=="ZABIJ X" and RoomKillFlag_[0x24C..0x256] == context [0x1D6]`
(NPC is present in the current room) → `lcall [tier launcher]` → on
`MonsterHP[0x1B0]<1` (won) clear the flag byte to 0 and roll any kill bonus.

| Command | Flag byte | Tier launcher | Bonus |
|---|---|---|---|
| ZABIJ DZIECKO | 0x24C | PRZEDM_MNIEJSLABO 0x13947 | Serce 25% |
| ZABIJ DZIADEK | 0x253 | PRZEDM_MNIEJSLABO 0x13947 | Random(100)<5 → Fajka from mouth "UNIQE 5%" + MadroscCur++ |
| ZABIJ WARIAT | 0x24D | PRZEDM_SREDNIO 0x13A60 | Serce 35% |
| ZABIJ SLUCHACZ | 0x24E | PRZEDM_SREDNIO 0x13A60 | Serce 35% |
| ZABIJ CZLOWIEK | 0x250 | PRZEDM_SREDNIO 0x13A60 | Serce 35% |
| ZABIJ FAN | 0x24F | PRZEDM_SREDNIO 0x13A60 | Serce 35% |
| ZABIJ REPORTER | 0x256 | PRZEDM_SREDNIO 0x13A60 | Serce 35% |
| ZABIJ POLICJANT | 0x251 | PRZEDM_TRUDNO 0x13B82 | Serce 35% |
| ZABIJ GORYL | 0x254 | PRZEDM_TRUDNO 0x13B82 | DropGarnitur (2.5%) |
| ZABIJ OCHRONIARZ | 0x252 | PRZEDM_TRUDNO 0x13B82 | DropGarnitur (2.5%) |

Fight launchers (all: set stats, `lcall Walka` [0x129D:0x44A6], if
fleeFlag [0x1D2]==0 -> loot `LootMoney` [0x212] = Random(n)+base, print
"WYCIAGASZ <n> MONET Z CIALA", `[0x21A:0x21C] += n`; then **Serce** `[0x186]`
roll: if `[0x186]==0` and Random(20)<drops -> `[0x186]=0xFFF6`, LoadCapacity++):

**CROSS-CHECKED vs retained TPU units (PORT-RECOVERY GROUND TRUTH)**. By matching
stats, the coin range and "WYCIAGASZ PACZEK Z CIALA MROWKI" against the PRZEDM.TPU
dossiers (procedures.tsv, PRZEDM.SLABO.md, enemies.c profiles), the launcher
procs ARE the PRZEDM difficulty procedures SLABO..BTRUDNO/VEASY..NEASY. Pascal
names: `WROGEN/WROGSIL/WROGZRE` = Monster HP/Dmg/Dex; `CZY` = Random-scratch
[0x19E]; `FORSA` = money longint [0x21A:0x21C]; `PRZED` = LoadCounter [0x182];
item sentinel -10 = carried.

| Launcher (img) | PRZEDM proc | Energy | Dmg(SIL) | Dex(ZRE) | Coins | Body drop |
|---|---|---|---|---|---|---|
| 0x13839 (ofs 0xE69) | **SLABO** | 1 | 2 | 1 | R(3) 0..2 | Paczek [0x1A0] `R(10)<7` (70%) |
| 0x13947 (ofs 0xf77) | **MNIEJSLABO** | R(3)+34 | 10 | R(4)+8 | 10..30 | Serce `R(20)<5` (25%) |
| 0x13A60 (ofs 0x1090) | **SREDNIO** | R(5)+50 | R(2)+13 | R(5)+10 | 30..59 | Serce `R(20)<7` (35%) |
| 0x13B82 (ofs 0x11b2) | **TRUDNO** | R(6)+60 | R(3)+15 | R(3)+12 | 20..59 | Serce `R(20)<7` (35%) |
| 0x13CA4 | **VEASY** | 90..99 | 17..18 | 14..15 | 10..64 | Serce `R(20)<4` (20%) |
| 0x13DD0 (ofs 0x1400) | **EASY** | 100..119 | 18..19 | 16 | 30..59 | Serce `R(20)<4` (20%) |
| 0x13EF3 (ofs 0x1523) | **NEASY** | 130..149 | 19..20 | 20 | 20..64 | Serce `R(20)<4` (20%) |
| 0x14016 (ofs 0x1646) | **BTRUDNO** | 72..74 | 16..17 | 13..14 | 15..64 | Serce `R(20)<5` (25%) |
| 0x12A16 (ofs 0x46) | **WALKAPIES** | 10 | 5 | 10 | R(15) 0..14, unconditional after WALKA | Serce `R(20)<5` placed at MIECHO when slot=0 |

The prior "ZabijPotwor1..4" Dex/Dmg maxima in this file were misread (17-26/
18-31/19-32); correct = VEASY/EASY/NEASY/BTRUDNO above. Backbone profiles use
direct assignments in room handlers: **CAGE_DEXTEROUS** HP20/S3/D30 (the
"ZABIJ POTWOR" gate [0x5A]==0xE), CAGE_WEAK 20/3/3, CAGE_RESISTANT 40/3/3,
CAGE_STRONG 20/10/3, CAGE_ALL 40/10/11; POKRZYWA HP200/S18/D15 (5 fireballs +
1 poison) = the "MOZGI" seduction fight concluded below; QUEST-MASTER
HP188/S10/D26 (20 FIREBALL, 10 POISON).

KillDispatch actor -> profile: DZIECKO/DZIADEK = MNIEJSLABO; WARIAT/SLUCHACZ/
FAN/CZLOWIEK/REPORTER = SREDNIO; POLICJANT/OCHRONIARZ/GORYL = TRUDNO.
Street/plants: TAKSOWKARZ/SPRZEDAWCA/ZAMIATACZ/PIJAK/ZEBRAK/GITARZYSTA/
PERKUSISTA/ORGANISTA + SZCZAW..DMUCHAWIEC = VEASY; ROZA/JEZYNA/OSET/AGREST/
MALINA/DUNCAN = EASY; TRAWA = TRUDNO; LIROY + LIVING-DOOR/DRZWI = NEASY;
STARUCH/insects/MROWKA = SLABO.

**Unique-loot ladder (KillDispatch-level; authoritative, corrected)**
advertised %s are printed as-is even where they mismatch the roll:

| Loot | Eligible defeated enemy | Roll |
|---|---|---|
| GARNITUR spiked suit (txt "2.5%") | TAKSOWKARZ, SPRZEDAWCA, GORYL, OCHRONIARZ, TRENER | `Random(1000)<=25` (26 vals) |
| PIGULKA transport pill | PEDAL, GLADIATOR, WOJOWNIK, POKRZYWA | `Random(1000)<=42` (43 vals) |
| KASETA LIROYA ("3%") | PERKUSISTA, GITARZYSTA, LIROY, ORGANISTA + D.J crowd | `Random(100)<2`; D.J shares one roll: `<25` -> SuchaRacja, `<3` -> ration+Kaseta |
| LISTEK SZCZESCIA ("4%") | POKRZYWA | `Random(100)<6` (6 vals) |
| SCROLL POROWNANIA | POKRZYWA | `Random(100)<10` (10 vals) |

`ZABIJ POKRZYWA` attempts Listek -> Pigulka -> Scroll in order (3 separate
rolls). D.J = arena gate [0x67E]==0x45. "UNIQE 3%" message and the 2.5%/4%
mismatches are original text.

Special encounters call the drop procs directly after `Walka` win, e.g. the
"MIESA LUDZKIEGO ... MOZGI" seduction fight (img 0xD091: HP 200/Dex 15/Dmg 18,
woundA=5, woundB=1; win -> LISTEKZYSK + PIGULKAZYSK + SCROLLPORZYSK, then
QuestPhase `[0x262] -= 0x32` if non-zero) -- that fight IS the POKRZYWA
("pokrzywa" = the strongest plant) encounter.

The old "kill ladder" rows in § Room command vocabulary are CompareDispatch
POROWNAC targets, NOT fights; actual kills are KillDispatch + these launchers.

### Room-level ZABIJ handlers (outside KillDispatch — per-room gate bytes)

| Command | Gate byte | Launcher tier | Reward / effect |
|---|---|---|---|
| ZABIJ POTWOR | `[0x5A]==0xE` | custom HP20/Dex30/Dmg3, loot R(15) | if `Random(20)<7` && item==0: StaryMiecz [0x17E]‑=10; same MalaTarcza [0x184]; Serce [0x186] `<6` |
| ZABIJ MINI-BARMAN | `[0x67A]==0x43` (arena 'C') | PRZEDM_BTRUDNO 0x14016 | Energy>0 → clear; `R(100)<15` → Piwo [0x7C]‑=10 |
| ZABIJ GRUBAS | `[0x67C]==0x43` (arena 'C') | PRZEDM_BTRUDNO 0x14016 | clear; `R(100)<15` → Piwo [0x7C]‑=10 |
| ZABIJ D.J | `[0x67E]==0x45` (scene 'E') | PRZEDM_BTRUDNO 0x14016 | clear; `R(100)<0x19` → SuchaRacja [0x1A4]‑=10; `R(100)<3` → **Kaseta Liroya [0x22E]‑=10** +EnergyMax 5, MaxLoad‑=8, Zrecz+1 "UNIQE 3%" |
| ZABIJ DRZWI | `[0x688]!=0` (door) | PRZEDM_NEASY 0x13EF3 | Energy>0 → `[0x688]=0` (door breaks) |
| ZABIJ STARUCH | `[0x68A]!=0` (present) | PRZEDM_SLABO 0x13839 | `[0x68A]=0`; corpse-vanish text (no loot) |
| ZABIJ PEDAL | garden | PRZEDM_EASY 0x13DD0 | PIGULKAZYSK on win |
| ZABIJ PARA | garden | PRZEDM_BTRUDNO 0x14016 ×2 | two consecutive fights |
| ZABIJ MACIEK | garden | PRZEDM_EASY 0x13DD0 | |

Kaseta text ("SMIEC . S.Z -8 MAXE +5 ZRE +1") resolves against MaxLoad
[0x1C2]/EnergyMax [0x664]/ZrecznoscCur [0x190], confirming those fields.

## Item subsystem (ItemPickupDropDispatch 0x18405 / ItemUseDispatch 0x18E95)

**Item field semantics** (uniform across all item slots): value is **0x00 = never
acquired**, **0xFFF6 (-10) = carrying/inventory**, otherwise **a room-context =
the item is lying on the floor of that room**. Acquisition = `field -= 10`,
consumption/drop-restore = `field += 10` (back to 0). Pickup (BIERZ X)
requires `field == PreviousRoom[0x180]`; drop (ODRZUC X) requires `field == -10`
then sets `field = PreviousRoom[0x180]`. PRZED [0x182] ±1 tracks each.

- Slots: 0x17E StaryMiecz, 0x184 MalaTarcza, 0x186 Serce, 0x188
  DyplomMudSzkoly, 0x18A Fajka, 0x216 KompletUbranSyf (SYF), 0x222
  GarniturKolce, 0x22E KasetaLiroya, 0x230 ScrollPorownanie, 0x257 Pigulka
  (byte), 0x259 Bigos (byte, TalentPool), 0x25B ListekSzczescia
  (byte), longint **Przepustka 0x21E:0x220** (owned as -10 longint).
- Food (UZYJ X → consume `field+=10`, PRZED--, Energy += %, cap at
  EnergyMax 0x664): Paczek [0x1A0] +8%, Ciastko [0x1A2] +12%, SuchaRacja
  [0x1A4] +16%, Bulka [0x1A8] +20%, Chleb [0x1A6] +26%, Weka [0x1AA] +34%,
  Bigos (0x259) +20%; PIWO [0x7C] +10 Energy **and** +10 Mana. Attempting to
  ODRZUC any of the foods prints the original refusal.
- UZYJ MALA BUTELKA MANY: gate `[0x192]==-10` (bottle count), `[0x182]--`,
  `[0x192]+=0xA` (consume), "WYPIJASZ MALA BUTELKE MANY I ODZYSKUJESZ 30
  MANY", **ManaCur [0x1AC] += 30** (0x1E) capped at **ManaMax [0x1AE]**.
- UZYJ SERCE: field→0, Energy += 5, PRZED--. UZYJ FAJKA: flavor smoke;
  BIERZ FAJKA when MadroscCur < MadroscMax → MadroscCur++ (dropping removes
  it back), per pipe acquisition rule.
- UZYJ DYPLOM: prints the MUD-school diploma box; carrying DYPLOM [0x188]
  raises **EnergyMax [0x664] by 5** until dropped (drop restores it).
- UZYJ KASETA / UZYJ LISTEK: info text ("SMIEC S.Z -8 MAXE +5 ZRE +1"); the
  original prints the cassette description **without an ownership check**.
- SCROLL POWROT (return scroll): consumes itself, **−15 Energy**, teleports to
  original room 20 (city centre). SCROLL POROWNYWANIE: interactive "KOGO
  CHCESZ ZE SOBA POROWNAC?" prompt, hard-coded target groups + player score
  advice, costs **10 Mana**, consumes the scroll (compare skill Counter
  [0x25D] etc. — the POROWNAC oracle § below).
- **UZYJ PIGULKA** (0x257 time-travel pill, "WSZYSTKO ZACZYNA WIROWAC...
  ZNAJDUJESZ SIE W PRZESZLOSCI"): `call Room (0x12ACA)`, then by MadroscCur:
  <10 → EnergyMax--, Energy=1, KUNSZT-=0x32; 9<x<16 → Energy-=0x28 (min 1),
  KUNSZT-=0x1E; >15 → no penalty ("ZNASZ SIE NA TEGO TYPU PRZEDMIOTACH").
- **Outfits** (wear flag OutfitEquipped 0x218, name written to buffer ds:0x264):
  SYF KOMPLET (0x216) → MaxLoad[0x1C2]+=7; GARNITUR kolce (0x222) →
  MaxLoad+=0xA, OutfitZrecznoscBonus[0x1C4]+=1, HeavyBlow[0x224]+=0xF. ODLORZ X
  (only while matching name in 0x264) reverses all.
- ZNISZCZ PRZEPUSTKA: Przepustka longint += 10 → 0, PRZED++. PATRZ
  PRZEPUSTKA: prints the certificate box.
- ColorChangeDispatch 0x197F1: ZMIEN KOLOR / ZMIEN TLO prompt a number and
  `lcall 0x1C0F:0x263 / 0x1C0F:0x27D`.

## City square dispatch (img 0x12414..0x129C6, context [0x1D6]==0x64)

- Guard: only runs in the downtown square; scene bios (SPANIEL..ZEBRAK street
  characters, strings in paragraph 0x17CB at img 0x1A660..0x1AE00); shows
  Energy [0x19C] and KUNSZT [0x1D4].
- **Quest purchases** (money from longint ForsaLo/Hi `[0x21A:0x21C]`, QuestType
  `[0x248]`, QuestCount `[0x24A]`):
  - buy quest type 1: needs money>199, pays 200 → QuestCount=75.
  - buy quest type 2: needs >99, pays 100 → QuestCount=200.
  - buy quest type 3: needs >49, pays 50 → QuestCount=200.
- **Turn-in dispatcher** (all also reward `[0x21E:0x220] -= 10` = Przepustka):
  - type 1 done (count<1): "ZYSKUJESZ..." KUNSZT+=100, PRZED++.
  - type 2 done && Item_0188 `[0x188]<=-10`: KUNSZT+=0xFA, EnergyMax-=5,
    clear `[0x188]`.
  - type 3 done && Item_Fajka `[0x18A]<=-10` && PRAKTYK `[0x194]>0`:
    "TUR!!!! Z CIALA WROGA !!!!" KUNSZT+=0x1A9, PRZED--, MadroscCur--,
    Fajka += 10, PRAKTYK-=1.
- **Boss fight command** (str @2E31): woundB=10, woundA=20, MonsterDmg[0x1B6]=10,
  MonsterDex[0x1B8]=26, MonsterHP[0x1B0]=188, `lcall Walka`; if MonsterHP<1 →
  Przepustka `[0x21E:0x220]-=10`.
- Room-change commands: "UNIQE..." → exit; one → context=0x16 (trees); one with
  Przepustka owned → context=0x65; `lcall 0x129D:0x3114` (= PRZEDM_MODE) → 0x3E8.
- Loop back to scene display while context still 0x64.

## Room command vocabulary (complete, img 0x13190..0x15400)

67 `strcmp` comparisons (`lcall 0x1c71:0x9d7`, cmd = ds:0x564) in the Room
dispatcher. Target list grouped by the dispatcher window:

- **training** `TRENUJ`/`TRENUJ SILA`/`TRENUJ ZRECZNOSC`/`TRENUJ MADROSC`
  (0x13199..0x132CB → TrenujDispatch 0x13194).
- **ZABIJ MROWKA** (0x138C3 -> PRZEDM_SLABO 0x13839).
- **kill ladder #1 (animals+people)** DZIK SZCZUR LIS KUROPATWA ZAJAC WILCZUR
  ORZEL SARNA DZIECKO DZIADEK (0x14A5F..0x14AFE).
- **kill ladder #2** SLON LEW ZYRAFA WIELBLAD STRUS BOA WILK BIZON PANTERA
  WARIAT SLUCHACZ FAN CZLOWIEK REPORTER (0x14B7F..0x14C6E).
- **kill ladder #3** GLADIATOR WOJOWNIK TRENER POLICJANT GORYL OCHRONIARZ
  MINI-BARMAN GRUBAS D.J (0x14D1C..0x14E6B).
- **kill ladder #4 (jobs/NPCs)** TAKSOWKARZ SPRZEDAWCA GITARZYSTA PERKUSISTA
  ORGANISTA ZEBRAK PIJAK ZAMIATACZ (0x14F3C..0x14FC2) + plants SZCZAW
  STOKROTKA KONICZYNKA MLECZ DMUCHAWIEC PEDAL PARA MACIEK ROZA MALINA
  TRAWA AGREST JEZYNA (0x14FD3..0x1510F).
- **special** LIROY (0x151E0), POKRZYWA (0x152B8), dogs SPANIEL OWCZAREK
  PIESEK JAMNIK PUDEL (0x1530F..0x15353), BAKTERIA (0x153BB).

Ladder mechanics: before the comparisons the dispatcher computes a threshold
**`[0x686]`** from ZrecznoscCur (`==0x13 → +9`, `0x14/0x15 → +10`), Parowanie
(`>0x4B → +1`, `>0x32 → +1`), Kopanie (`>0xA → +2`, `>0x46 → +2`); hits with
`[0x686] >= 0x10` reach a common kill/buy handler at 0x14B05. This is the
"how strong is your opponent" gate for the ZABIJ/OGLADAJ room fights.

### NOTE — this region is the "POROWNAC" (compare-yourself) oracle, not kills

The 67-string dispatcher (0x14916..0x153E8, proc **CompareDispatch**) is the
**POROWNAC command**: with `ManaCur > 9`, it prints "KOGO CHCESZ ZE SOBA
POROWNAC?", reads a target on ds:0x564, computes **PowerLevel `[0x686]` =
CharacterLevel[0x25C] + SilaCur[0x18E] + Zrec-tier (+4..+10 by 8/9..0x14/0x15) +
Parowanie bonuses (+1,+1 at >0x4B/>0x32) + Kopanie bonuses (+2,+2 at >0xA/>0x46)**
and prints a tiered taunt per target (NIE / RACZEJ NIE / TAK / "50% SZANS" /
"JESTES SILNIEJSZY" / FLAKI...). Tail effects:
- dogs hit → "JASNE ZE MOZESZ GO ZABIC"; if `[0x19E]<3` && SkillPorownywanie
  `[0x25D]<0x64` → "UCZYSZ SIE ZDOLNOSCI POROWNYWANIE", `[0x25D]+=1`, KUNSZT+=5.
- BAKTERIA → "BAKTERIA MA MAGIC RESISTANCE", `ManaCur[0x1AC]+=5`.

So the "ZABIJ ladder" framing in earlier notes was wrong: these are comparison
taunts, not attack dispatchers. Actual kills are the separate **ZABIJ X**
commands (ZABIJ MROWKA 0x138C3, ZABIJ DUNCAN 0x1B5D2, ZabijPotwor 0x13B87..,
launchers).

## Arena grid command box (img 0x19C90..0x1AF1E) — FOUND: the "0x19C00 region"

Top-level shared dispatcher (no room-factory), contexts **0x20..0x39** = the
5x5 arena (0x20 = entrance "WEJSCIE NA ARENE"; cells 0x21..0x39 = arena
grid 33..57). Commands (ds:0x564 strcmp):

- **MODE** (0x19C90) → PRZEDM_MODE.
- **ZABIJ <beast>** (0x19CA0..0x1A0D4): each gates `[0x1D6] == beast-pen` then
  calls a difficulty proc and zeroes the pen word on win:

| Pen field | Beast | Proc | Special |
|---|---|---|---|
| [0x1DA] | KORNIK | SLABO | |
| [0x1DC] | MUCHA | SLABO | |
| [0x1DE] | BAKTERIA | SLABO | "BUUUUU! BIEDNA BAKTERIA" |
| [0x1E0] | SLIMAK | SLABO | |
| [0x1E2] | ZUK | SLABO | |
| [0x1E4] | KARALUCH | SLABO | |
| [0x1E6] | MROWKA | SLABO | |
| [0x1E8] | PAJAK | SLABO | |
| [0x1EA] | DZIK | MNIEJSLABO | |
| [0x1EC] | SZCZUR | MNIEJSLABO | |
| [0x1EE] | LIS | MNIEJSLABO | |
| [0x1F0] | KUROPATWA | MNIEJSLABO | |
| [0x1F2] | ZAJAC | MNIEJSLABO | |
| [0x1F4] | WILCZUR | MNIEJSLABO | "WILCZUR PRZY..." text first |
| [0x1F6] | ORZEL | MNIEJSLABO | |
| [0x1F8] | SARNA | MNIEJSLABO | |
| [0x1FA] | SLON | SREDNIO | |
| [0x1FC] | LEW | SREDNIO | |
| [0x1FE] | ZYRAFA | SREDNIO | |
| [0x200] | WIELBLAD | SREDNIO | |
| [0x202] | STRUS | SREDNIO | |
| [0x204] | BOA | SREDNIO | |
| [0x206] | WILK | SREDNIO | |
| [0x208] | BIZON | SREDNIO | |
| [0x20A] | PANTERA | SREDNIO | |
| [0x20C] | GLADIATOR | TRUDNO | PIGULKAZYSK |
| [0x20E] | WOJOWNIK | TRUDNO | PIGULKAZYSK |
| [0x210] | TRENER | TRUDNO | GARNITURZYSK |

  (So the former "GardenSpot_01DA..0x210" labels are ARENA beast pens, not
  garden spots; annotate.py renamed to BeastKornik..ArenaTrener. Beasts with
  fleeFlag==0 extra-clear the pen; WILCZUR has a flavor line first.)
- **EXIT** (0x1A0D9): per-cell printed exit list; **WYJSCIE** (0x1A5C5) →
  leaves the arena (jump 0x1AF1E).
- **POLODNIE / POLNOC / WSCHOD / ZACHOD** (0x1A5D9/0x1A725/0x1A9C1/0x1AC64):
  grid moves. Each move is guarded by **ArenaMoveLatch [0x214]** (`==0` to
  move; `:=1` on any move, then reset `:=0` at 0x1AF07 after all four), and a
  blocked step sets **ArenaSouthLatch [0x1D8]=1** (0x1AF0C: if [0x1D8]==0 the
  "can't go there" text path). Edge table (verified by EXIT text match):

| ctx | N | S | E | W |
|---|---|---|---|---|
| 0x20 | - | - | - | - | (entrance)
| 0x21 | 0x22 | 0x20 | 0x23 | 0x24 |
| 0x22 | 0x25 | 0x21 | 0x26 | 0x27 |
| 0x23 | 0x26 | - | 0x28 | 0x21 |
| 0x24 | 0x27 | - | 0x21 | 0x29 |
| 0x25 | 0x2a | 0x22 | 0x2b | 0x2c |
| 0x26 | 0x2b | 0x23 | 0x2d | 0x22 |
| 0x27 | 0x2c | 0x24 | 0x22 | 0x2e |
| 0x28 | 0x2d | - | - | 0x23 |
| 0x29 | 0x2e | - | 0x24 | - |
| 0x2a | 0x2f | 0x25 | 0x30 | 0x31 |
| 0x2b | 0x30 | 0x26 | 0x32 | 0x25 |
| 0x2c | 0x31 | 0x27 | 0x25 | 0x33 |
| 0x2d | 0x32 | 0x28 | - | 0x26 |
| 0x2e | 0x33 | 0x29 | 0x27 | - |
| 0x2f | - | 0x2a | 0x34 | 0x35 |
| 0x30 | 0x34 | 0x2b | 0x36 | 0x2a |
| 0x31 | 0x35 | 0x2c | 0x2a | 0x37 |
| 0x32 | 0x36 | 0x2d | - | 0x2b |
| 0x33 | 0x37 | 0x2e | 0x2c | - |
| 0x34 | - | 0x30 | 0x38 | 0x2f |
| 0x35 | - | 0x31 | 0x2f | 0x39 |
| 0x36 | 0x38 | 0x32 | - | - |
| 0x37 | 0x39 | 0x33 | 0x31 | - |
| 0x38 | - | 0x36 | - | 0x34 |
| 0x39 | - | 0x37 | 0x35 | - |

  EXIT text groups: `0x22/0x25-27/0x2a-2c` → "DOSTEPNE WYJSCIA:" + the four
  arena directions; others print the matching subset ("MOZESZ WYJSC NA:",
  "MOZESZ ISC NA:", or "DOSTEPNE WYJSCIE:" for 0x38/0x39).

  **VERIFIED 1:1 against c-port world.c ARENA_ROOM table** (rooms 33-57 =
  contexts 0x21..0x39, entrance 32 = 0x20): every N/S/E/W edge and every
  EXIT%text variant matches. The ZOO placard hangs at the entrance: "NIE
  ATAKUJ LUDZI I ZWIERZAT Z ZOO CHYBA ZE MASZ 3 LEVEL (LUB WYZEJ :P))" - the
  beasts below are the zoo pens (gardener's "school" zoo behind the school).
  The "GardenSpot" framing is therefore doubly wrong: these are zoo-beast
  pens, contexts 33-57, moved by POLNOC/WSCHOD/ZACHOD/POLODNIE.

## Corrections to this repo's earlier findings

1. **0x19C is Energy, NOT money.** save(): [0x19C]+0x28 <<2 (380 ⇒ raw 55);
   load: idiv 4, sub 0x28 (380/4-40=55). BAZAR death does [0x19C]:=[0x664] =
   Energy := EnergiaMax. The 0x1AC.. band is Mana, not monster HP.
2. **0x182 = CurrentLoad (4), not KUNSZT.** BAZAR shop "KUNSZT+1" reads were
   actually a CurrentLoad increment; overburden strings are at 0x182
   ("JESTES OBLADOWANY"). Monster stat band hypothesis (MIECHO/KUNSZT/PASZOL/
   WIMP/ZWIEJ at 0x180..0x188) is WRONG as named - those slots are
   PreviousRoomContext/CurrentLoad/unnamed fields.
3. **0x1D6 = CurrentContext** (room/interface id; 1000 = COMMON_MODE, entered
   via MODE/Unmode which save/restore the room in 0x180). BODY-B's writes of
   'E','F','G','H' into 0x1D6 are menu-selected room/context ids, consistent
   with the string-compare command dispatch (no central parser).
4. **0x194 = PRAKTYK, not Money** (0 in this save): the "CWICZYSZ ... MASZ N
   PRAKTYK" strings + school "ZYSKALES N PRAKTYK" rewards prove it is the
   school/CWICZ practice counter (lesson costs 1). FORSA [0x21A:0x21C] = the
   coins/monety longint: combat loot "WYCIAGASZ N MONET", DAWAJ KASE, BAZAR
   buy gates (>= 8/12/15/19), shop prices 1999/4800. The game has two saved
   quantities (port persists `coins` AND `practices`); "Money" in
   PlayerState.pas mislabels 0x194.
5. CharacterLevel = 0x25C, saved as level+0x17 (file shows 24 ⇒ level 1);
   level-up routine is 0x8990-0x8ba0 (see help-you-need PlayerState.pas).
6. **KUNSZT = 0x1D4** (f8=99). Death penalty (BAZAR proc img 0x36F5,
   decoded 0x37DC-0x3811) is **level-based**:
   `[0x1D4] -= 250 - Random(50) - 5*[0x25C]` (level from 0x25C),
   matching the string "NIESTETY WRAZ ZE SMIERCIA TRACISZ KUNSZT
   ADEKWATNIE DO TWOJEGO LEVELKA". Same proc: Energy:=[0x664],
   CurrentContext:=0x14 (respawn at city square), quest counter
   [0x24A] set to 50/200 by QuestType[0x248], then ROOM + save().

## Combat engine (fully decoded 2026-09-24) — `WALKA-CombatEngine-reconstructed.pas`

EXE proc **paragraph 0x129D:0x44A6 = img 0x16E76..0x181C6** (`push bp; mov bp,sp;
lcall 0x1C71:0x2CD` … `pop bp; retf`). The old "BODY-A para 0E42:9A57" labels
were a miscalculated paragraph; img offsets are authoritative (0E42*16+9A57 =
17E77 is mid-body). Entry model:

- Monster stats are **NOT in the save record and NOT a DGROUP table** — each
  launcher writes them into unsaved slots right before the far lcall:
  `[0x1B0]=MonsterHP  [0x1B6]=MonsterDmg  [0x1B8]=MonsterDex`.
- **Base XP** `[0x1B4]` (img 0x16E80..0x173BC) = sum of 3 stat-delta bonuses vs
  the monster's three stats (EnergiaMax vs HP, Sila vs Dmg, Zrecznosc vs Dex).
  Fighting *up* pays +12..+21 per axis, equal pays +11, fighting *down* pays
  +10..+1 (down-low pays ~nothing). Doubling as monster-type base bonus.
- **Rounds** (loop head 0x173BC → 0x1800B):
  - dodge rolls: Zrecznosc-vs-Dex margin drives `Random(12..23)` (roll<10 ⇒
    monster misses) and `Random(35..60)` (roll<10 ⇒ you get a free riposte).
  - enemy strike `Random(MonsterDmg)`; `[0x1B4]+=1` hit XP; Parowanie parries
    when `Random(140) <= Parowanie` (roll==0 && Parowanie<100 ⇒ +1 skill).
  - wounds/bleed: `[0x25E]/[0x25F]` tick on `Random(100)<10`; `[0x260]` bleeds
    `Random(5)`/round.
  - player riposte `Random(Sila)`, heavy-blow reroll while `10*roll <= [0x224]`.
  - Kopanie (kick): gate `Kopanie>0 && ManaCur>[0x1CA] && Energy<[0x1CC]`;
    hit iff `(Kopanie-10) >= Random(100)`, dmg `Random(level)+Random(10)`,
    Mana cost `Random(3)+3` (miss: `Random(2)+2`).
  - Uciekanie (flee): gate `Uciekanie>0 && Energy<[0x1D0] && ManaCur>14`;
    Mana −15; success iff `Random(100)<=Uciekanie` → `[0x1D2]:=1` and
    **KUNSZT −20**.
  - loop back to 0x173BC while `Energy>=1 && MonsterHP>=1 && [0x1D2]=0`.
- **Kill reward** (0x18037): clip `[0x1B4]` (EnergiaMax>75 −2, >115 −3;
  Parowanie>50/75/95 −2/−2/−1; Kopanie>50/95 −5/−2; clamp ≥0), print
  "ZYSKALES", `KUNSZT += rw`, clear wounds, quest kill `[0x24A]-=1`, then the
  talent event (`Random(100) < [0x258]` ⇒ `[0x259]-=10; MaxLoad[0x182]+=1`;
  and `Random(100)==0 && [0x258]<100` ⇒ `[0x258]+=1; KUNSZT+=10`).
- **Knock-out** (0x1818E): if `Energy<1` print defeat, `sound(3000)`,
  **`CurrentContext := 10000`** (contrast BAZAR death → 20). Then `[0x1B4]:=0`,
  return.
- **Launcher/monster table** (img → guard → HP/Dex/Dmg/reward):
  `0x5DB4` room 12 → 20/3/3/R10 · `0x5DC6` room 14 → 20/30/3/R15 ·
  `0xB3CE` room 15 → 40/3/3/R15 · `0xB695` room 16 → 40/11/10/R30 ·
  `0x10981` tracker slot7==13 → 20/3/10/R15 · `0xD091` boss → 200/15/18 +
  wounds 5/1, win ⇒ 0x129D:0x3014/0x2E9E/0x30C1 and `[0x262]-=50` ·
  `0x13843` dummy → 1/1/2/R3 · `0x12A16` launcher → 10/10/5/R15 (+25% Serce into
  [0x186]) · room boss (0x1297F) → 188/26/10 + wounds 20/10. After a kill each launcher clears the room
  tracker, `[0x212]:=Random(N)`, prints it, and `Forsa[0x21A:0x21C] += d`.
  Far-lcall opcode `9A A6 44 9D 12`; same-seg thunk at 0x13843.

## Ground truth (retained TPU units + portable-port recovery, 2026-09-24)

Corroborated against more-help-you-need/bombki/c-port/ + help-you-need/:
docs/compatibility.md (recovered-facts register), evidence/recovered/PRZEDM.*.md
(symbol-aware per-proc listings from MONSTRA/PRZEDM/SWIAT.TPU),
evidence/generated/inventories.md (full TPU symbol hash), c-port
src/{persistence,enemies,items,world,game}.c, docs/{todo,recovery-notes}.md.

### TPU Pascal symbols -> EXE offsets (confirmed bindings)

| Pascal symbol | Meaning | EXE mapping |
|---|---|---|
| FORSA | money longint (coins/monety) | [0x21A:0x21C] |
| PRAKTYK | practice counter (school/CWICZ currency) | [0x194] |
| PRZED | carried-load counter | [0x182] |
| WROGEN / WROGSIL / WROGZRE | enemy HP / dmg / dex | [0x1B0] / [0x1B6] / [0x1B8] |
| CZY | random scratch | [0x19E] (=RandomScratch) |
| PASZOL | fled flag | [0x1D2] |
| MMIECZ, MTARCZA, SERCE, DYPLOM, FAJKA, MBUTELKA | sword/shield/heart/diploma/pipe/mana-bottle | [0x17E]/[0x184]/[0x186]/[0x188]/[0x18A]/[0x192 count] |
| PACZEK, CIASTKO, SUCHA, CHLEB, BULKA, WEKA | six foods | [0x1A0]/[0x1A2]/[0x1A4]/[0x1A6]/[0x1A8]/[0x1AA] |
| MAD, SIL, ZRE | current stats | [0x18C]/[0x18E]/[0x190] |
| MAXMAD, MAXSIL, MAXZRE | max stats | [0x196]/[0x198]/[0x19A] |
| ENERGIA | current energy | [0x19C] |
| MANA, MAXMANA | mana cur/max | [0x1AC]/[0x1AE] |
| KUNSZT | kunszt pool | [0x1D4] |
| PAR | parry skill | [0x1C6] Parowanie |
| KOP, KOPM, KOPHP | kick skill/mana/energy gates | [0x1C8]/[0x1CA]/[0x1CC] |
| ZWIEJ | flee skill | [0x1CE] Uciekanie |
| POZIOM | character level | [0x25C] (saved 1..N; +23 const) |
| POR | comparison skill | [0x25D] SkillPorownywanie |
| JAKIEUB, JAKABRON, JAKATAR | equipped clothing/weapon/shield ids | buffer ds:0x264 + flag [0x218] |
| PLECAK, PIGULKA, BIGOS, LISTEK | backpack/pill/bigos/leaf | backpack capacity-upgrade; pill [0x257]; bigos [0x259]; leaf [0x25B] |
| KORNIK..PANTERA, SZCZAW..TRAWA, DZIECKO..REPORTER, MINIBARMAN, GRUBAS, DJ, PEDAL, PARA, MACIEK, OGOL, DRZWI, STARUCH, SILNY | per-monster "which room" trackers | [0x666..0x678] animals, [0x24C..0x25x] NPCs, [0x67A]/[0x67C]/[0x67E] arena, [0x688]/[0x68A] door/staruch, plants [0x232..0x246] |

### Compatibility-fact register (authoritative; matches/extends disasm)

- **Items/stores**: bakery sells the 6 foods; armory STARY + MALA; general store
  FAJKA, KOMPLET "SYF", KASETA, GARNITUR kolce; magic store MBUTELKA, LISTEK,
  PIGULKA, SCROLL POROWNYWANIE. Only items with resale commands can be sold.
  Price oddities preserved: small mana bottle affordable at 15 coins while
  advertised/deducted 20; lucky leaf advert + check 820 but deducts 830.
- Capacity = dex-derived (10..16) + backpack +4 etc; the stored MaxLoad [0x1C2]
  is what outfits/Kaseta modify (+7 SYF / +0xA GARNITUR / -8 KASETA).
- Consumables: heart +5E; doughnut 8, cake 12, dry ration 16, roll 20, bread 26,
  weka 34 (E capped at EnergyMax); bigos +20E; beer +10E AND +10M; small mana
  bottle +30M cap ManaMax.
- Foods refuse ODRZUC (original refusal retained). UZYJ KASETA prints without an
  ownership check (original quirk). Diploma +5 max energy while carried. Pipe
  +1 current wisdom on take (if below max), -1 on drop. Return scroll: -15E and
  room 20. Comparison scroll: 10 mana + consumes scroll + interactive prompt.
- Death (SMIERC): restore max energy, KUNSZT -250 + Random(50) - 5*lvl, room 20,
  quests reset 50 (easy) / 200 (medium+hard).
- Leveling: thresholds + costs + practice/resource-cap gains; special level-12
  max-stat raise; bright "DWUNASTY POZIOM"; maxes creep faster than currents
  (matches 0x8990..0x8BA0 decode). Level-up zeroes [0x6C] (ExperienceCounter).
- Skills: CWICZ UCIEKAC (85-pt gate) configures ZWIEJ (combat exit -20 KUNSZT,
  combined E/S/Z score); CWICZ PAROWANIE (90-pt, Random(140)<=PAR, damage cut
  0/-2/-3 by strength tier, zero-roll +skill +5 KUNSZT); CWICZ POWROT (90-pt,
  city-15 mana / fail-5 / random-10 mana); CWICZ POTRAWKI -> auto BIGOS after
  victory + zero-roll learning; ZDOLNOSCI lists six skills. SPIJ: +10E -20
  KUNSZT per hour, wakes with Random(2*hours)>4 / >8 strength bonuses, E cap.
- Quest Master easy/medium/hard prices, kill counters, Liroy bonus, death
  resets, turn-in items, awards; medium reward -5 max energy. Duncan black
  market (SECRET LISTA), forged pass, backpack; pass destroyed -> junction
  re-closes. Staruch: resource quest (4 WEKA + 200 coins -> PIWO + SCROLL
  POWROT + 50 KUNSZT + teleport to strongest school cage) OR the SLABO fight ->
  disappearance + level penalty (matches ZABIJ STARUCH row).
- Walka coherence: enemy FIREBALL/POISON resolve after physical defense, before
  the player strike; 10% cast chance per charge (QM 20/10, POKRZYWA 5/1).
  Player death restores max energy first. Kill gate is MonsterHP < 1.
- Room graph (GDZIE): 0-3 start/sub/school/training; 4-17 school (5 = six-way
  MUD SZKOLA (2); 11 = cage hall with six cages; monster rooms 12-16); 20 city
  centre (respawn); 21-22 ULSKLEPIKOWA; 30-31 ULICA DLUGA (31 -> 60); 32 arena
  entrance; 33-57 arena grid; 60 DOLINA ROZRYWEK; 61-72 concert/stage; 77-82
  BLUSZCZ; 83 forest; 100-103 road (100 west gated by quest/pass; 101 north
  unhandled -> 104; 103 blocked river).
- Parser vocab (whole-word literals): POLNOC/POLODNIE/WSCHOD/ZACHOD/GORA/DOL,
  EXIT, PATRZ, MODE (+UNMODE/UM), JA, KTO, BIERZ, ODRZUC, UZYJ, ZABIJ,
  ROZMAWIAJ, KUP, SPRZEDAJ, CWICZ, TRENUJ, PAMIETAJ, WLACZ POSTAC, POROWNAJ,
  LISTA, KOP, ZWIEJ, POWROT, RECE, UZDROW, OSLEP, SZAL, SIATKA, CIOS W,
  ROZPAL, SPEED, PIECZ, ZDOLNOSCI, ZMIEN KOLOR, ZMIEN TLO, SPIJ, CZYSC EKRAN,
  SECRET LISTA, SCAN, ZDEJMUJ, ODLORZ/ODLOZ, DAWAJ EN/KASE/KUNSZT,
  ZABIERAJ KASE, USTAW SZ, SYF, UM.
- Races: CZLOWIEK 10/15 all + 100 mana; OLBRZYM 13/20,13/20,5/7,70; NIMFA
  10/15,13/20,7/11,100; POL-ELF 6/10,16/24,8/12,80+30 coins; UFOK 9/13,9/14,
  13/20,150; CZAROMIL 6/9,7/11,16/25,250. Start ENERGIA 50, PRA 10, POZIOM 1.
- Save (PLIKI.TPU): flat sequential text dump, one value per line via plain
  ReadLn in record order (player record + world trackers); PAMIETAJ/WLACZ
  POSTAC gated to MODE mode. Portable native format v16; imports v1-15.

### c-port discrepancy register (2026-09-24 audit, machine-verified)

Every entry opposed the c-port evidence against the original disasm. Verdicts:
`ORIGINAL` = original game truth; `PORT-DEVIATION` = the port behaves
differently from the disasm; `DOSSIER-ERROR` = a recovered dossier misstates
the original.

- **A. CWICZ formula stat (major)** — `ORIGINAL`: ALL six CWICZ commands key off
  **MadroscCur [0x18C]** (img 0x27D5..0x2B73; each costs 1 PRAKTYK [0x194]):
  - KOPANIE [0x1C8]  + MAD,            gates MAD>0xA(10) && SIL>0xB(11) // no cap
  - UCIEKANIE [0x1CE] + MAD+ZRE-5,     gates MAD>0xA(10) && ZRE>0xA(10),  cap 0x55
  - POWROT [0x78]    + 2*MAD-3,        gate MAD>0x11(17),                 cap 0x5A
                                        (shl/2 then -3; NOT +MAD)
  - PAROWANIE [0x1C6] + MAD+ZRE-14,    gates MAD>0xF(15) && ZRE>0xB(11),  cap 0x5A
  - POROWNYWANIE [0x25D] + 3*MAD-9,    gate MAD>0xB(11),                  cap 0x5A
  - POTRAWKI [0x258] + MAD+1,          gate MAD>0x12(18),                 cap 0x5A
  `PORT-DEVIATION`: game.c has all six `practice_*` (wired at 3925-3942, so the
  earlier "drops UCIEKANIE/KOPANIE" claim was stale) but keys every gate AND
  formula on **strength** instead of wisdom (game.c 2543-2679). Gate nits:
  KOPAC uses dexterity>11 where original used SIL>0xB; all caps/formulas match
  otherwise. Skill poster/ZDOLNOSCI likewise strength-gated (894-919, 2783-2806).
  Full table + comments: `RECONSTRUCTED\C-PORT-DISCREPANCIES.md` entry A.
- **B. Flee (ZWIEJ)** — `ORIGINAL`: attempt drains Mana-(Random(2)+2); gates
  Uciekanie>0 && Energy<[0x1D0] && ManaCur>14; Mana-=15; success iff
  Random(100)<=Uciekanie -> FleeFlag=1 + KUNSZT-=20. `PORT-DEVIATION`:
  game.c `try_flee` gates on `flee_skill>0 && energy<flee_energy_threshold`,
  resolves success by dex-score (chance-15 vs Random(100)), costs only 20
  KUNSZT (no mana). (Doc's old "costs 15 Mana" was incomplete, not wrong.)
- **C. Max-stat offsets** — `ORIGINAL` (char-select init 0x1748..0x18B9):
  0x196=MadroscMax, 0x198=SilaMax, 0x19A=ZrecznoscMax. `DOSSIER-ERROR`: the
  LEVELING extraction swapped them (claimed MAXSIL=[0x196], MAXZRE=[0x19A],
  MAXMAD=[0x198]). Field table above is correct.
- **D. Save file format** — `ORIGINAL`: unlabelled flat sequence, one value per
  line (WCZYTANIE reconstruction). `PORT-DEVIATION`: persistence.c writes
  stable `key=value` lines (coins=, practices=...) — not byte-compatible with
  original save files. "Native v16 / imports v1-15" refers to the port schema.
- **E. Forsa (f18 net-worth encoding; folded into D)** — the save file holds
  `coins × Madrosc` (written via @LMul, echoed on the save screen) and
  `wczytaj()` re-derives the wallet with the matching @LDiv; the pair is a
  reversible field transform, **not** an economy scaling — costs/payables read
  only the runtime wallet. The port persists runtime `coins` directly
  (save-format item D).
- **F. Quest turn-in side effects** — `ORIGINAL`: type1 KUNSZT+100 + pass +
  PRZED[0x182]+1; type2 KUNSZT+250 + pass + consume Dyplom + EnergyMax-5;
  type3 KUNSZT+425 + pass + consume Fajka + PRAKTYK-1 + PRZED-1 +
  Madrosc-1 ("removes the pipe's carried +1 wisdom"). `PORT-DEVIATION`: keeps
  KUNSZT/pass/consumes (and mirrors the Madrosc-1 via `apply_carried_item_effect
  (PIPE,-1)`) but omits the PRZED[0x182] +-1 bumps.
- **G. Arena level placard** — arena grids advertise "3 LEVEL" prose; no actual
  level gate on arena ops in either the original or the port (flavor-only).
- **H. Townhall/room-number nits (low priority)** — 83 is a BLUSZCZ/PIERDUT
  tree room, 84 the overgrown-krzaki route to the domek/grota (doc said plain
  "forest"); the concert district is 67 piwiarnia / 68 estrada / 69-72 scena /
  LIROY ~73 rather than a homogeneous "61-72".
- **I. Monster kill rewards (major)** — `ORIGINAL` (launcher tails img
  0x13839..0x14016): PAY coins `Random(N)`; MROWKA-only drop = **PACZEK**
  `[0x1A0]` when `R(10)<7` && `[0x1A0]!=-10`, then `[0x1A0]=0xFFF6` +
  PRZED[0x182]+1, text "WYCIAGASZ PACZEK Z CIALA MROWKI"; NO heart on
  Mrowka. Every other launcher rolls a one-time **SERCE** `[0x186]` (only if
  `[0x186]==0`) at `R(20)<K` (MNIEJSLABO 25% @0x139E3, SREDNIO 35% @0x13B05,
  etc), `[0x186]=0xFFF6` + PRZED+1. Foods/heart are sentinel slots
  (-10=carrying; eat PACZEK does `[0x1A0]+=0xA`, PRZED-1 @0x19095).
  `PORT-DEVIATION`: enemies.c SLABO carries `bloody_heart={7,10}` (70%) so the
  Mrowka gives a heart instead of a PACZEK; no ZABIJ MROWKA paczek drop at all;
  PRZED bumps omitted; port stores PACZEK as stackable quantity.
  Details: `C-PORT-DISCREPANCIES.md` entry I.
- Confirmed 1:1 (no change): arena N/S/E/W edge table & MINIARENA redistributed
  rooms 33-57; QuestMaster prices/counters/rewards; death penalty formula;
  TRENUJ costs 3/2/3 with gates >2/>1/>2; monster stat tiers; food/mana
  percentages; POROWNANIE formula components (Sila+Zre-tier+PAR/KOP bonuses).

## Open items / conflicts to resolve

- RESOLVED: 0x257 = PIGULKA (saved f64 byte; TPU `PIGULKA: Shortint`; pills are
  gained by drop via `-=10` and used as the time-travel pill). 0x74 = the
  separate "Potrawki" CWICZ-skill chance field, NOT a pill count.
- 0x21A longint vs 0x194 word Money: **RESOLVED — not two cash pools.** Disasm +
  port evidence: FORSA/[0x21A:0x21C] = coins (monety: loot "WYCIAGASZ N MONET",
  DAWAJ KASE, BAZAR/staruch buy gates, shop prices 1999/4800); 0x194 = the
  saved **PRAKTYK counter** (practice money): CWICZ KOPANIE/UCIEKANIE print
  "...MASZ <0x194> PRAKTYK" and debit 1; at school "ZAWSZE... ZYSKALES
  <0x194> PRAKTYK" awards 3-6 by Madrosc tier. The c-port keeps BOTH fields
  (`coins` and `practices`) in its save. PlayerState.pas "Money" mislabels it.
- Skill gates [0x1CA]/[0x1CC]/[0x1D0] (KOPM/KOPHP/ZWIEV-gate): saved fields
  (f56/f57/f59); configured by the CWICZ training posts / a threshold prompt
  (compat: "ZWIEJ retains its original threshold prompt and configures the
  energy value"). Initial values still unlocated.
- RESOLVED: the post-kill `[0x17E]==0 && Random(0x20)` gate that assigns
  `[0x19E]` is the StaryMiecz (MMIECZ) loot-roll seen in the kill/body-drop
  ladder (Random(20)<7 -> acquire if 0x17E==0), not a separate event.
- RESOLVED (machine-level): wczytaj converts the persisted field-18 pool to
  its runtime value with **Forsa := Forsa div Madrosc** — img 0x7FA4..0x7FBB:
  `mov ax,[0x18c] (MadroscCur); cdq; mov cx,ax; mov bx,dx; mov ax,[0x21a];
  mov dx,[0x21c]; lcall 0x1C71:0x7FA` = TP7 RTL **@LDiv** (CPU-detected: the
  486 fast path `shl/shrd eax/ecx/16; idiv ecx` prefixed by `cmp byte [0x4c],2`,
  plus a 16-bit restoring-division fallback); quotient (DX:AX) is stored back
  into [0x21A:0x21C]. So the SAVE file carries the 32-bit **net-worth product
  coins × Madrosc** (reference file: 1424 = 89 × 16) and wczytaj() divides it
  back into the runtime wallet. The sign-in summary block in save() (img
  0x2E0F..0x2E22) computes and displays **Forsa × Madrosc** (`lcall
  0x1C71:0x7BD` = @LMul from the same operands) — the inverse of this @LDiv.
  Reversible field transform, not a scaling; costs/payables use the runtime
  wallet only. The c-port persists the runtime `coins` directly (save-format
  deviation D; PlayerState.pas has no mirror either). RESOLVED — folded into
  discrepancy D.
- Monster HP stats (JAMNIK/OWCZAREK/SPANIEL...) are NOT in the saved record;
  the earlier "MONSTRA band 0x1AC..0x1D4" reading in WSTEP-reconstructed.pas
  must be retracted - those offsets are player stats/skills.
