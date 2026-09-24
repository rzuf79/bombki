# POTRAWKI — compact recovered pseudocode

Status: verified from the retained executable's training dispatcher and
`PRZEDM.TPU` procedure `WALKA`. This is a behavior reference, not replacement
wording.

Detailed evidence:

- [training dispatcher path](../BOMBKI.POTRAWKI.md)
- [`WALKA`, original lines 884–893](../PRZEDM.WALKA.md)

```text
on "CWICZ POTRAWKI":
    if SIL > 18 and POTRAWKI < 90 and PRA > 0:
        POTRAWKI := POTRAWKI + SIL + 1
        PRA := PRA - 1
        print "CWICZYSZ POTRAWKI - PRAWDOPODOBIENSTWO JEST TERAZ "
        print POTRAWKI
        print "% MASZ "
        print PRA
        print_line " PRAKTYK"

after defeating an enemy, if POTRAWKI > 0:
    FUKS := Random(100)
    if POTRAWKI > FUKS:
        print_line "ROBISZ SOBIE PYSZNY PYSZNY BIGOS Z KAPUSTA Z WROGA"
        add one BIGOS to inventory
        if FUKS < 1 and POTRAWKI < 100:
            print_line "UCZYSZ SIE ZDOLNOSCI POTRAWKI !!! "
            POTRAWKI := POTRAWKI + 1
            KUNSZT := KUNSZT + 10
```

The original stored ordinary item quantities as negative multiples of ten.
The portable state represents the recovered `BIGOS := BIGOS - 10` and carried
item-count increment as one ordinary nonnegative `BIGOS` quantity.
