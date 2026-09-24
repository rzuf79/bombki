# Comparison mechanic — compact recovered pseudocode

Status: verified from the retained `BOMBKI.EXE` dispatcher and
`PRZEDM.TPU` procedure `POROWNANIE`. This is a behavior reference, not proposed
replacement wording.

Detailed evidence:

- [main dispatcher paths](../BOMBKI.COMPARISON.md)
- [`POROWNANIE`, original lines 385–472](../PRZEDM.POROWNANIE.md)

## Training

```text
on "CWICZ POROWNANIE":
    if SIL > 11 and POR < 90 and PRA > 0:
        POR := POR + (3 * SIL) - 9
        PRA := PRA - 1
        print "CWICZYSZ POROWNYWANIE - PRAWDOPODOBIENSTWO JEST TERAZ "
        print POR
        print "% MASZ "
        print PRA
        print_line " PRAKTYK"
    otherwise:
        do nothing and print nothing
```

## Direct command and scroll

```text
on "POROWNAJ":
    if POR <= 0:
        do nothing
    else if POR > Random(100):
        POROWNANIE()
        MANA := MANA - 10
    else:
        print_line "POPELNILES PEWNE BLEDY I NIE UDALO SIE WYKONAC CZARU"
        MANA := MANA - 5

on "UZYJ SCROLL POROWNYWANIE":
    if SCROLLPOR < 0:
        POROWNANIE()
        MANA := MANA - 10
        SCROLLPOR := SCROLLPOR + 10
        carried_item_count := carried_item_count - 1
    otherwise:
        do nothing
```

The direct-command chance and the routine's `FUKS` roll are separate calls to
`Random(100)`. The callers deduct mana even when `POROWNANIE()` returns early
because mana is too low. The scroll path does not require the comparison skill.

## `POROWNANIE()`

```text
if MANA <= 9:
    return

FUKS := Random(100)
print_line "KOGO CHCESZ ZE SOBA POROWNAC?"
read target

OGOL := POZIOM + SIL

if ZRE is 8 or 9:   OGOL := OGOL + 4
if ZRE is 10 or 11: OGOL := OGOL + 5
if ZRE is 12 or 13: OGOL := OGOL + 6
if ZRE is 14 or 15: OGOL := OGOL + 7
if ZRE is 16 or 17: OGOL := OGOL + 8
if ZRE is 18 or 19: OGOL := OGOL + 9
if ZRE is 20 or 21: OGOL := OGOL + 10

if PAR > 75: OGOL := OGOL + 1
if PAR > 50: OGOL := OGOL + 1
if KOP > 10: OGOL := OGOL + 2
if KOP > 70: OGOL := OGOL + 2
```

The tests below are independent in the original routine. Overlapping ranges
can therefore print more than one line.

### `DZIK`, `SZCZUR`, `LIS`, `KUROPATWA`, `ZAJAC`, `WILCZUR`, `ORZEL`, `SARNA`, `DZIECKO`, `DZIADEK`

```text
if OGOL < 16:
    "NICZEGO NIE MOGE ZAGWARANTOWAC ..... MACIE PODOBNE PARAMETRY"
if SIL > 15 and SIL < 19:
    "PRZECIWNIK GODNY TWEJ DUMY , RACZEJ NIE POGRASZ"
if SIL > 18:
    "WSTYD MI ZA CIEBIE ... JESZCZE TU JESTES ! NA CO CZEKASZ ? KILLUJ"
```

### `SLON`, `LEW`, `ZYRAFA`, `WIELBLAD`, `STRUS`, `BOA`, `WILK`, `BIZON`, `PANTERA`, `WARIAT`, `SLUCHACZ`, `FAN`, `CZLOWIEK`, `REPORTER`

```text
if OGOL < 16:
    "TAK  TAK MAMA KUPI BERECIK GLOWKA W PORZADKU ? "
if SIL > 15 and SIL < 21:
    " NA TWOIM MIEJSCU BYM SIE NIE ZAPUSZCZAL "
if SIL > 20 and SIL < 23:
    " RYZYK FIZYK - TAK NA 50% - WALKA NA SMIERC I ZYCIE"
if SIL > 22:
    "SPOX KILLUJ BEZ UPRZEDZEN"
```

### `GLADIATOR`, `WOJOWNIK`, `TRENER`, `POLICJANT`, `GORYL`, `OCHRONIARZ`

```text
if OGOL < 15:
    "HA HA NIE NA SERJO . DAJ SE W ZYLE OKI? TO DOWCIP? HA HA HA"
if OGOL > 14 and OGOL < 18:
    "POMARZ SOBIE WARIACIE . MOZE CI SIE PRZYSNI"
if OGOL > 17 and OGOL < 23:
    "POWIEM  BEZ OGRODEK-TO GLUPI POMYSL"
if OGOL > 22 and OGOL < 26:
    "TO DOSC RYZYKOWNE ZE TAK POWIEM"
if OGOL > 25:
    "TO BEDZIE TAK PROSTE JAK ZABICIE DZIECKA TOPOREM !!!"
```

### `MINI-BARMAN`, `GRUBAS`, `D.J`

```text
if OGOL < 24:
    "SMIERC PODZIEKUJE CI ZA TWOJ DAR (ALE ZGAPIAM)"
if OGOL > 23 and OGOL < 26:
    "NIE UDAWAJ BISTY-BOYS PRZEGRASZ NA 99%"
if OGOL > 25 and OGOL < 29:
    "PERFEKCYJNY MECZ NA SMIERC I ZYCIE !!!"
if OGOL > 28:
    "JESTES ZNACZNIE SILNIEJSZY !!!(ALE GLUPSZY)"
if OGOL > 34:
    "UWAZAJ DOSTANIESZ MALO KUNSZTU !!!"
```

### `TAKSOWKARZ`, `SPRZEDAWCA`, `GITARZYSTA`, `PERKUSISTA`, `ORGANISTA`, `ZEBRAK`, `PIJAK`, `ZAMIATACZ`, `SZCZAW`, `STOKROTKA`, `KONICZYNKA`, `MLECZ`, `DMUCHAWIEC`

```text
if OGOL < 21:
    "NIE"
if OGOL > 21 and OGOL < 28:
    "RACZEJ NIE , CHOC MOZNA ZARYZYKOWAC(NIE POLECAM)"
if OGOL > 27:
    "TAK"
```

`OGOL == 21` produces no advice for this group.

### `PEDAL`, `PARA`, `MACIEK`, `ROZA`, `MALINA`, `TRAWA`, `AGREST`, `JEZYNA`

```text
if OGOL < 20:
    "WIERZ MI ALE TO NAPRAWDE WIERZ MI ZE NIE MASZ SZANS"
if OGOL > 19 and OGOL < 26:
    "RACZEJ NIE WYGRASZ WIEC LEPIEJ NIE ATAKUJ"
if OGOL > 25 and OGOL < 30:
    "JESTESCIE SOBIE ROWNI (NAPRAWDE !!!) - WIEC 50% SZANS"
if OGOL > 29:
    "JESTES SILNIEJSZY STAD WNIOSEK ZE SOBIE PORADZISZ"
if OGOL > 35:
    "P.S - JESTES DUZO DUZO SILNIEJSZY ZABIJ BEZ OGRODEK!!!"
```

### `LIROY`

```text
if OGOL < 28:
    "HAHAHAHAHAHAHAHAHAHHAHOHOHOHHOHOHOHOHOHOHOHOAHAHAHAHAHAHAH"
if OGOL > 27 and OGOL < 33:
    "HIHIHIHIHIHIHIHHEHEHEHE :))))))"
if OGOL > 32 and OGOL < 44:
    "SPROOBÓJ A MOŻE WYGRAC SIE UDA......"
if OGOL > 43 and OGOL < 48:
    "NIE PRZEJMUJ SIE JEGO MORDĄ JESTES SILNIEJSZY I BASTA"
if OGOL > 47:
    "UWAZAJ ... NA CHLAPIACE MOZGI FLAKI PRZECIWNIKA"
```

### `POKRZYWA`

```text
if OGOL < 40:
    "NIE MASZ NAJMNIEJSZYCH SZANS"
if OGOL > 39:
    "JEST PEWNE PRAWDOPODOBIENSTWO WYGRANIA TEGO STARCIA"
```

### `SPANIEL`, `OWCZAREK`, `PIESEK`, `JAMNIK`, `PUDEL`

```text
"JASNE ZE MOZESZ GO ZABIC ZABIJ !!! ZABIJ . TEN PARSZYWY PIES NIE MA RACJI BYTU"
```

## Automatic learning and `BAKTERIA`

These checks run after the target groups, including for an unrecognized target.

```text
if FUKS < 3 and POR < 100:
    print_line "***************** UCZYSZ SIE ZDOLNOSCI POROWNYWANIE *****************"
    POR := POR + 1
    KUNSZT := KUNSZT + 5

if target == "BAKTERIA":
    print_line "BAKTERIA MA MAGIC RESISTANCE"
    MANA := MANA + 5
```
