# Remaining skills and sleep — compact recovered pseudocode

Status: verified from the retained `BOMBKI.EXE` dispatcher. This is a behavior
reference, not replacement wording.

Detailed executable regions:

- skill poster: file offsets `0x07685`–`0x07ab5`
- return training: file offsets `0x07c01`–`0x07c8d`
- sleep: file offsets `0x141ce`–`0x14372`
- direct return: file offsets `0x144a3`–`0x145b9`
- ability display: file offsets `0x146b9`–`0x14846`

## Return training

```text
on "CWICZ POWROT":
    if SIL > 17 and POWROT < 90 and PRA > 0:
        POWROT := POWROT + (2 * SIL) - 3
        PRA := PRA - 1
        print "CWICZYSZ POWRACANIE - PRAWDOPODOBIENSTWO JEST TERAZ "
        print POWROT
        print "% MASZ "
        print PRA
        print_line " PRAKTYK"
    otherwise:
        do nothing and print nothing
```

## Direct return

```text
on "POWROT":
    if POWROT <= 0:
        do nothing
    else:
        FUKS := Random(100)

        if FUKS <= POWROT:
            print_line "OTWIERASZ MAGICZNY PORTAL KTORY PRZENOSI CIE DO MIASTA"
            MANA := MANA - 15
            GDZIE := 20

        if FUKS > POWROT and FUKS < POWROT + 30:
            print_line "NIE UDAJE CI SIE OTWORZYC MAGICZNEGO PORTALU"
            MANA := MANA - 5

        if FUKS > POWROT + 29:
            print_line "OTWIERASZ MAGICZNY PORTAL KTORY JEDNAK PRZENOSI CIE DO INNEGO MIEJSCA"
            MANA := MANA - 10
            GDZIE := Random(100) + 1
```

The portable game clamps mana at zero, as it already does for the recovered
kick path, so native state remains valid. Original `GDZIE` values are translated
to native room IDs; unrepresented dispatcher gaps fall back to the starting
room rather than leaving the portable game in an invalid room.

## `ZDOLNOSCI`

Each test is independent and each displayed percentage is the stored skill:

```text
if SIL > 10 and MAD > 11: "KOPANIE       - " + KOP + "%"
if SIL > 10 and ZRE > 10: "UCIEKANIE     - " + UCIEKANIE + "%"
if SIL > 15 and ZRE > 11: "PAROWANIE     - " + PAR + "%"
if SIL > 11:              "POROWNYWANIE  - " + POR + "%"
if SIL > 18:              "POTRAWKI      - " + POTRAWKI + "%"
if SIL > 19:              "POWROT        - " + POWROT + "%"
```

## Sleep

The DOS command repeats a five-second loop until a keyboard event. Each loop:

```text
hours := hours + 1
print "SPISZ JUZ " + hours + " GODZIN"
KUNSZT := KUNSZT - 20
ENERGIA := ENERGIA + 10
```

When the player wakes:

```text
print "PO OBUDZENIU STWIERDZILES ZE ZYSKALES " + 10 * hours
print " ENERGI I STRACILES " + (20 * hours - Random(2 * hours))
print_line " KUNSZTU"
KUNSZT := KUNSZT + Random(2 * hours)  // separate roll

if hours > 4:
    print "DLUGI SEN DODATKOWO POZWOLIL CI ODPOCZAC : ZYSKALES "
    print SIL
    print_line "ENERGI"
    ENERGIA := ENERGIA + SIL

if hours > 8:
    print "PELNOWARTOSCIOWY SEN SPOWODOWAL SUPER ZYSK : "
    print 2 * SIL
    print_line "ENERGI"
    ENERGIA := ENERGIA + 2 * SIL

ENERGIA := min(ENERGIA, MAXE)
```

For the timer-free port, each `SPIJ` command performs one loop/hour and one
logical turn. Another `SPIJ` continues the same sleep; any other input wakes the
player, prints and applies the recovered wake result, then processes that input.
No wall-clock delay or input deadline remains.

## Skill poster and dormant advertised commands

The underground poster prints the exact recovered skill names using independent
stat gates. It advertises `RECE`, `UZDROW`, `OSLEP`, `SZAL`, `SIATKA`, `CIOS W`,
`ROZPAL`, `SPEED`, and `PIECZ`, plus several automatic abilities. The retained
executable has no other reference to those direct-command strings, no state for
them, and no handler for them. They therefore remain silent no-ops rather than
receiving invented mechanics or port-only player-facing text.
