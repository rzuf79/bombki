# Quest Master quests and road gate

Recovered from `SWIAT.TPU` `POKOJ100` source lines 355-444, plus the shared
`PRZEDM.TPU` combat and death procedures. Player-visible text below is copied
exactly from the retained artifacts.

`LISTA` in the junction prints:

```text
LATWY QUEST      - 200
PRZECIETNY QUEST - 100
TRUDNY QUEST     - 50
KOMEDA - SPRZEDAJ QUEST - OZNACZA IZ QUEST ZOSTAL WYKONANY
```

Buying a quest does not require the previous quest slot to be empty, so another
purchase replaces it:

```text
KUP LATWY QUEST       if coins >= 200: quest=1, counter=75, coins-=200
                      print ZABIJ 75 POTWOROW
KUP PRZECIETNY QUEST  if coins >= 100: quest=2, counter=200, coins-=100
                      print ZABIJ 50 POTWOROW W TYM LIROYA I DAJ MI DYPLOM MUD SZKOLY
KUP TRUDNY QUEST      if coins >= 50: quest=3, counter=200, coins-=50
                      print ZABIJ 50 POTWOROW W TYM LIROYA I DAJ MI FAJKE I POSWIEC 1 PRAKTYKE
```

Every ordinary victory decrements an active quest counter once. A Liroy victory
also subtracts 150 for medium and hard quests. Death resets an easy counter to
50 and a medium/hard counter to 200. `JA` displays the easy counter directly;
for medium/hard it displays `counter - 150`.

`SPRZEDAJ QUEST` succeeds only when the counter is below one and the variant's
extra requirements are present. Every success prints:

```text
AAAAA BARDZO MI MILO ZE UDALO CI SIE WYKONAC TEN QUEST
```

The easy reward is 100 kunszt and a pass. The medium reward is 250 kunszt and a
pass, consumes the school diploma, and reduces maximum energy by five. The hard
reward is 425 kunszt and a pass, consumes the pipe and one practice, and removes
the pipe's carried wisdom bonus. Their second lines are respectively:

```text
 ------ OTRZYMUJESZ 100 KUNSZTU -----
 ------ OTRZYMUJESZ 250 KUNSZTU -----
 ------ OTRZYMUJESZ 425 KUNSZTU -----
```

The western junction exit opens while the player owns a pass. Without one, a
westward attempt prints:

```text
QUEST-MASTER MOWI CI : BARDZO MI PRZYKRO ALE MUSISZ MIEC PRZEPUSTKE
```

`ZABIJ QUEST-MASTER` uses fixed energy 188, strength 10, dexterity 26, twenty
fireballs, and ten poison casts. A victory grants a pass.

The road beyond the gate ends in original room 103. The retained artifacts have
no victory flag, winning message, credits, or further route: its terminal text
explicitly says that the road ends at the river and further travel is
impossible. The port therefore treats that reachable room as the recovered
ending instead of inventing a new one.
