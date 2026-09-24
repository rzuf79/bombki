# Enemy FIREBALL and POISON — compact recovered pseudocode

Status: verified from `PRZEDM.TPU` procedure `WALKA` and the Quest Master
combat setup in `SWIAT.TPU`. This is a behavior reference, not replacement
wording.

Detailed evidence:

- [`WALKA`, original lines 801–825](../PRZEDM.WALKA.md)
- [`POKOJ100`, original lines 433–439](../SWIAT.POKOJ100.md)

The following runs after an enemy physical hit, including shield and parry,
and before the player's attack. An enemy-hit dodge skips the whole block.

```text
if FIREBALL > 0 and Random(100) < 10:
    damage := Random(20)
    print "PRZECIWNIK PUSZCZA FIREBALLA W TWYM KIERUNKU - TRACISZ "
    print damage
    print_line "% ENERGII"
    ENERGIA := ENERGIA - damage
    FIREBALL := FIREBALL - 1

if POISON > 0 and Random(100) < 10:
    print_line "PRZECIWNIK RZUCA CZAR \"POISON\" "
    POISON := POISON - 1
    ILEPOI := ILEPOI + 10

if ILEPOI > 0:
    damage := Random(5)
    print "JESTES ZATRUTY - TRACISZ "
    print damage
    print_line "% ENERGI"
    ENERGIA := ENERGIA - damage
    ILEPOI := ILEPOI - 1
```

`FIREBALL` and `POISON` are charges belonging to the current opponent;
`ILEPOI` is the player's continuing poison duration. The recovered Quest
Master setup assigns 20 fireballs, 10 poison casts, strength 10, dexterity 26,
and energy 188. That actor belongs to a later world-content milestone, so the
combat engine supports these values now while current enemy profiles keep zero
charges.
