# Duncan and the cave nettle

Recovered from `PRZEDM.FIGHTBLUSZCZ` source lines 1468-1504 and the main
executable cave-room span `0x122ac-0x123e2`.

## Quest state

`ROZMAWIAJ DUNCAN` only acts while Duncan is in the current room.

```text
if DUNQ == 0:
    print the six-line quest offer
    DUNQ = 75
if DUNQ != 0:
    print the one-line reminder
if DUNQ == 131:
    print the completion text
    DUNQ = 0
    KUNSZT += 125
```

The independent tests explain the slightly odd first and final conversations:
the first conversation prints both the offer and reminder, while the final one
prints the reminder before the completion text.

The cave encounter is forced after the `TAK lub NIE >` prompt; the retained
program reads but does not test the answer. It assigns the nettle 200 energy,
18 strength, 15 dexterity, five fireballs, and one poison cast. On a victory,
nonzero `DUNQ` is reduced by 50 as an 8-bit value:

```text
75 -> 25 -> 231 -> 181 -> 131
```

Victory returns the player to the cave entrance, and the nettle regenerates for
a later cave visit. Its three recovered unique loot attempts are lucky leaf,
transport pill, and comparison scroll.

## Black market

Completion unlocks `SECRET LISTA` in the port; this explicit gate follows the
Milestone 6 dependency recorded in `docs/recovery-notes.md`. The retained list
itself also requires Duncan in the current room. It advertises carrot (7000),
forged Quest Master document (400), and backpack (4800), but this recovered
dispatcher has purchase branches only for the document and backpack.

The original document branch has no Duncan-location test. The backpack branch
does require Duncan to be present. Both purchases are silent on failure.

## Exact quest text

```text
UCH A COZ TO ZA STRASZNA ROSLINA - PRZELAKL SIE DUNCAN WIDZAC CIEBIE
AAA TO JAKIS WAL A NIE ROSLINA , MOWI PO CHWILI,JAK CI SIE NUDZI TO 
MOZESZ POMOC MI WYRYWAC CHWASTY , SZCZEGOLNIA ZABOJCZA DLA MOICH MARCHEWECZEK
JEST TA WREDNA POKRZYWA , SZKODA ZE TAK JAK INNE POTWORY SIE ODREGENEROWUJE
ALE JAK JA ZABIJESZ , POWIEDZMY ... 4 RAZY TO MOZE DA SOBIE SPOKOJ
CO CI DAM W ZAMIAN ? TROCHE KUNSZTU , A MOJ STARY PRACUJE NA CZARNYM RYNKU
TO CO ZABIJESZ TE ROSLINY CZY BEDZIEMY TU STAC JAK OSTATNIE LOSIE?
DZIEKI DZIEKI , TO BYLA DOBRA ROBOTA , OD TERAZ MOZESZ PISAC PRZY MNIE :
SECRET LISTA , TO MOZE AKURAT BEDE COS MIAL NA ZBYCIU , ADIOS
--------- ZDOBYLES 125 KUNSZTU ------------------------
```

## Exact cave and market text

```text
TAK lub NIE >
NO TO GIN!!!
UFFF,TO BYLA PRZYGODA,WOKOL GROMADZILY SIE SETKI MLECZOW - NIE MIALBYS SZANS
OTO CO AKTUALNIE MAM DO ZAOFEROWANIA : PAMIETAJ U MNIE TYLKO KUPUJEMY
MARCHEWKA Z SADU DUNCANA   : 7000
PRZEPUSTKA QUEST-MASTERA   :  400
PLECAK                     : 4800
OTO PODROBIONA PRZEPUSTKA HE , HE NAWET QUEST-MASTER SIE NIE POKAPUJE
HE HE HE MILO SIE Z TOBA ROBI INTERESY
```
