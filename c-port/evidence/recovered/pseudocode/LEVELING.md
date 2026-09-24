# Victory kunszt and leveling — compact recovered pseudocode

Status: verified from `PRZEDM.TPU` procedure `WALKA` and the retained
executable's main leveling region. This is a behavior reference, not
replacement wording.

Detailed evidence:

- [`WALKA`, original lines 612–693 and 870–879](../PRZEDM.WALKA.md)
- [main executable leveling region](../BOMBKI.LEVELING.md)

```text
after defeating an enemy while the player is alive:
    reward := the WALKA energy/strength/dexterity comparison score
    if opponent maximum energy > 75: reward := reward - 2
    if opponent maximum energy > 115: reward := reward - 3
    if PAR > 50: reward := reward - 2
    if PAR > 75: reward := reward - 2
    if PAR > 95: reward := reward - 1
    if KOP > 50: reward := reward - 5
    if KOP > 95: reward := reward - 2
    reward := max(reward, 0)
    print victory reward
    KUNSZT := KUNSZT + reward

level threshold by current POZIOM:
    1: 700
    2: 725
    3: 730
    4..8: 735 + POZIOM
    9+: 735 + 2 * POZIOM

level cost by current POZIOM:
    1: 725
    2: 730
    3: 735
    4..8: 735 + POZIOM
    9+: 735 + 2 * POZIOM

on level advancement:
    print the recovered level banner four times
    subtract the current level cost from KUNSZT
    add 3/4/5/6 practices for SIL < 11 / < 16 / < 23 / otherwise
    add 10 maximum energy, or 11 when ZRE > 12
    add another 1 for each satisfied gate: ZRE > 16, ZRE > 21,
        and ZRE > 26 together with MAD > 20
    add SIL + 2 maximum mana
    POZIOM := POZIOM + 1
```

The level-one threshold/cost mismatch is present in the executable and is
retained. At level 12 the executable adjusts the three maximum attributes,
emits fourteen raw STX bytes around each result, and labels maximum wisdom as
strength and maximum strength as wisdom. Those display quirks are also
retained exactly.
