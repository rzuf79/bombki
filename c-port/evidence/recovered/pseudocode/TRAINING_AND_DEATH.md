# Attribute training and death — compact recovered pseudocode

Status: verified from `PRZEDM.TPU` procedures `TRAIN` and `SMIERC`. This is a
behavior reference, not replacement wording.

Detailed evidence:

- [`TRAIN`, original lines 166–189](../PRZEDM.TRAIN.md)
- [`SMIERC`, original lines 192–208](../PRZEDM.SMIERC.md)

```text
"TRENUJ":
    print_line "CO CHCESZ TRENOWAC?"

"TRENUJ SILA" when PRA > 2 and SIL < MAXSIL:
    SIL := SIL + 1
    PRA := PRA - 3
    print result

"TRENUJ ZRECZNOSC" when PRA > 1 and ZRE < MAXZRE:
    ZRE := ZRE + 1
    PRA := PRA - 2
    print result

"TRENUJ MADROSC" when PRA > 2 and MAD < MAXMAD:
    MAD := MAD + 1
    PRA := PRA - 3
    print result

on death after the WALKA death announcement:
    print the six SMIERC lines in retained order
    ENERGIA := MAXE
    KUNSZT := KUNSZT - 250 + Random(50) - 5 * POZIOM
    MIECHO := 20
    regenerate monsters
```

The original pause after death is discarded by the project's timer-free,
turn-based policy. Quest-counter adjustments remain coupled to the Milestone 6
quest state.
