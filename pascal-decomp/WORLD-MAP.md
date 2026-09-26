# BOMBKI — world map (connectivity from the C-port)

Source: `c-port/src/world.c` rooms[] + `world.h` ids. All 85 rooms (native-save
IDs 0..84). These ids are the **port's native-save ids, not** the original
Pascal GDZIE values (see `docs/compatibility.md`, `tests/test_world.c`).
Arena labels below use the in-game cell numbers (33-57) alongside the native id
(`= 26 + cell`).

Compass: `N` POLNOC · `S` POLUDNIE · `E` WSCHOD · `W` ZACHOD · `U` GORA · `D` DOL.
A connection drawn both ways only where the data is bidirectional.

---

## Region overview

```
                         piwiarnia ─ scena (Liroya)
                              ▲
                        sala koncertowa ◄─ dolina rozrywek ◄─ ulica dluga(W)
                              ▲                                          │
   ciemna ── bar ─ ...        │        ARENA 33..57 (5x5)                 │N
      │                       │              ▲                            │
   BLUSZCZ ─ studnia ─ las    │     [17] WEJSCIE NA ARENE                ▼
      │            │ krzaki   │        ◄── ulica dluga ──► CENTRUM MIASTA ──► ul.sklepikowa ──► rozjazd ─(quest)─droga──► rzeka
      │            ├─ budynek/domek                                        │
      └─ grota (POKRZYWA)     └─ grota(2)   ciemna ◄── ulica dluga         ▼
                                                            [1] salon ◄──► szkola ─► MUD szkola(2) ─► klatki ─► teleport(salon)
                                      [0] start ──► szkola
```

---

## 1. Start / school / cages / teleport  (ids 0-3, 18-31, 84)

```
                       [23] Pokoj 9                        [30] Klatka siln.+odp.+zrec.
                          | U                                           | D
                          ▼ D                                           ▼
 [20] Pokoj 6 <─W─ [19] MUD SZKOLA(2)                     [27] Klatka zrecznego
                      | U             [27]N/ [26]E / [29]W / [28]S      |
                      ▼ D                                                 ▼ up/down ring
                      | U          [25] KLATKI PELNE GAJDY               /
 [24] Pokoj 10 (U→19) ┘        N↑[27] S↓[28] E→[26] W→[29] D→[31]       /
                                        ▲                              /
      [31] TELEPORT ─D─► [84] TELEPORT(efekt) ─── redirect ──► [1] SALON
                                        (arrival = respawn at faculty oval)
 [2] HALA MUD SZKOLY: E→[1]  W→[19]
 [1] OKROGLY SALON: S→[0] N→[4] E→[3] W→[2] D→[18]
 [3] Pokoj treningowy (RAMBO): W→[1]
 [18] Podziemny pokoj treningowy: U→[1]
 [0] Miejsce rozpoczecia gry: N→[2]
```

- `STARUCH` trade teleports to the "strongest" school cage = `[30] CAGE_ALL`.

## 2. City + shops  (ids 4-8, 10-13, 32-34, 6-7)

```
                       [13] ROZJAZD   (QUEST-MASTER — W→[12] gated by PRZEPUSTKA; E blocked "w produkcji")
                             | S
   [34] Sklep magiczny <─W─ [32] UL.SKLEPIKOWA(north) ─E─> [33] Sklep wielobranzowy
                             | S
   [6] PIEKARNIA <─E─ [5] UL.SKLEPIKOWA ─W─> [7] ZBROJOWNIA
                             | S
   [11] ULICA DLUGA <─W─ [4] CENTRUM MIASTA ─E─> [8] ULICA CIEMNA
                             | S
                             ▼
                           [1] salon

 [8] ULICA CIEMNA: N→[10] BAR POD DWOMA PEDALAMI,  S→[9] BLUSZCZ
 [10] BAR: S→[8]
```

Road (beyond the quest gate):

```
 [13] ROZJAZD ─(quest/pass)─> [12] DROGA ─W─> [14] KAMIENISTA DROGA ─W─> [58] DROGA (rzeka — koniec gry)
```

## 3. Ulica dluga → arena → dolina rozrywek → concert  (ids 11,17,16,35,36-47)

```
 [11] ULICA DLUGA: E→[4]  N→[17]  W→[35]
 [35] ULICA DLUGA: E→[11]  N→[16]
 [16] DOLINA ROZRYWEK: S→[35]  E→[36] SALA KONCERTOWA
 [36] SALA: W→[16]  N→[38]  S→[37]  E→[39]
        crowd ring: [38]─E→[41]   [39]─N→[41]  [39]─S→[40]  [37]─E→[40]
 [38] TLUM: N→[42] PIWIARNIA
 [42] PIWIARNIA: E→[43] WEJSCIE NA SCENE ─E→ [44] SCENA (D.J) ─S→ [45] SCENA ─S→ [46] SRODEK SCENY ─S→ [47] SCENA
                 (LIROY on stage ≈ 45-46)
```

## 4. Bluszcz / forest / grota  (ids 9,48-52,15,53-57)

```
 [8] ULICA CIEMNA ─S─> [9] BLUSZCZ: N→[8]  E→[48]Bluszcz  W→[49]Bluszcz  S→[50]Bluszcz (studnia)
 [50] STUDNIA: N→[9]  E→[52]  W→[51]  S→[15] LAS
 [15] LAS (PIERDUT, DUNCAN okolica): N→[50]  W→[53] PODEJRZANE KRZAKI
 [53] KRZAKI: E→[15]  W→[54] BUDYNEK (zywe drzwi)  S→[56] WEJSCIE DO GROTY
 [54] BUDYNEK: E→[53]                 — za drzwiami: [55] DOMEK (E→[54])
 [56] WEJSCIE: N→[53]  S→[57] GROTA — POKRZYWA (boss)
```

## 5. Arena  (cells 33-57 = native ids 59-83; entrance [17])

5 rows x 5 columns; `[17] WEJSCIE NA ARENE` sits directly south of cell 33.
`[33]`: S→17, N→34, E→35, W→36 (the entrance row). All 4 directions from the
center cells; corners/dead-ends lose one direction.

```
              N ▲
  57      53      47      52      56
 55       49      42      48      54
 51       44      37      43      50
 46       39      34      38      45
 41       36      33      35      40
                               entrance [17] below 33
              S ▼   (every south row returns upward: each cell's S is the cell below, etc.)
```

Bidirectional pairs verified from the ARENA_* tables both ways (e.g. `57.S=55 / 55.N=57`,
`33.N=34 / 34.S=33`, `33.E=35`, `33.W=36`, `40.N=45 / 45.S=40`, corners
`56.W=52`, `41.W? none`, `57.E=53`, `53.E=47`, `47.E=52`, `52.E=56`).

---

## Notes

- Player respawn: death → room 20 (city centre, port id `[4]`); teleport effect → `[1]` salon.
- Quest-Master gates the road (west) from `[13]`; the pass (PRZEPUSTKA) opens it.
- Bosses/NPC anchors: POKRZYWA `[57]` grota; LIROY stage `[45]/[46]`; DUNCAN in the
  bluszcz/plants; QUEST-MASTER `[13]`; STARUCH at cage `[30]`; DRZWI living door `[54]`.
- Locked/one-way: `[54]` Z-direction is a living door; `[84]` is an arrival-redirect
  (no free movement); buy/active-quest road `[12]`/`[13]` W gate.