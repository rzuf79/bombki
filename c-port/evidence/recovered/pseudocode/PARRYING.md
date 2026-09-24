# Parrying mechanic — compact recovered pseudocode

Status: verified from the retained `BOMBKI.EXE` training dispatcher and
`PRZEDM.TPU` procedure `WALKA`. This is a behavior reference, not proposed
replacement wording.

Detailed evidence:

- [training dispatcher path](../BOMBKI.PARRYING.md)
- [`WALKA`, original lines 765–800](../PRZEDM.WALKA.md)
- [small-shield routine](../PRZEDM.TARCZA.md)

## Training

```text
on "CWICZ PAROWANIE":
    if SIL > 15 and ZRE > 11 and PAR < 90 and PRA > 0:
        PAR := PAR + SIL + ZRE - 14
        PRA := PRA - 1
        print "CWICZYSZ PAROWANIE - PRAWDOPODOBIENSTWO JEST TERAZ "
        print PAR
        print "% MASZ "
        print PRA
        print_line " PRAKTYK"
    otherwise:
        do nothing and print nothing
```

## Automatic parry during an enemy hit

The ordinary small-shield routine runs first. Parrying then sees the remaining
enemy damage (`WPYSK`).

```text
if PAR > 0 and WPYSK > 0:
    FUKS := Random(140)
    if FUKS <= PAR:
        if WPYSK < 3:
            print_line "            <<<<<ODPAROWUJESZ ATAK PRZECIWNIKA !!! TRACISZ 0% ENERGI"
            WPYSK := 0

        if WPYSK > 2 and WPYSK < 10:
            WPYSK := WPYSK - 2
            print "            <<<<<ODPAROWUJESZ ATAK PRZECIWNIKA !!! TRACISZ "
            print WPYSK
            print_line "% ENERGI"

        if WPYSK > 9:
            WPYSK := WPYSK - 3
            print "            <<<<<ODPAROWUJESZ ATAK PRZECIWNIKA !!! TRACISZ "
            print WPYSK
            print_line "% ENERGI"

        if FUKS < 1 and PAR < 100:
            print_line "*************** UCZYSZ SIE ZDOLNOSCI PAROWANIE !!!!! ***************"
            PAR := PAR + 1
            KUNSZT := KUNSZT + 5

ENERGIA := ENERGIA - WPYSK
```

The three damage tests are independent in the retained routine, but changing
damage in the first two branches prevents a second branch from applying to the
same hit. A roll of zero both succeeds and triggers automatic learning while
the skill is below 100.
