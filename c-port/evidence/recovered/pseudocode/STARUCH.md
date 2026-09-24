# Staruch fetch quest

Recovered from the main executable span `0x12815-0x129da`. Exact displayed
text below is copied from the retained executable.

`ROZMAWIAJ STARUCH` acts only in the elf house. It does not test the separate
Staruch-presence variable, so the original even allows the dialogue after his
combat branch has removed him. Its checks are independent and run in order:

The route is opened by `ZABIJ DRZWI` in the adjacent building. That branch uses
the shared `NEASY` fight and clears the living-door flag only after victory.

```text
if WEKA quantity < 3 and coins < 200 and RETURN SCROLL quantity == 0:
    print the three-line request

if WEKA quantity >= 4 and coins >= 200:
    print the five-line completion
    consume 4 WEKA and 200 coins
    grant 1 beer, 1 return scroll, and 50 kunszt
    set room to original room 20

if RETURN SCROLL quantity > 0:
    print the dismissal
    set room to original room 16 (the strongest school cage)
```

Consequently, exactly three wekas suppress the request but cannot complete it,
and a successful turn-in immediately runs the dismissal branch. The original
also updates its separate carried-item counter in the wrong direction when it
grants the two rewards; the port derives carried count from actual quantities
and does not reproduce that inconsistent cache.

```text
STARUCH MOWI CI : HEJ KTO TY JESTES CZY ZE MAGICZNE DRZWI NIE POWSTRZYMALY CIE?
MUSISZ BYC NIEZLYM WOJOWNIKIEM ,SPOXOLANDIA, GLODNY JESTEM PRZYNIES MI 4 WEKI 
ORAZ OKOLO 200 KASY , A DAM CI TAKIE NUMERY O JAKICH CI SIE NIE SNILO....
STARUCH MOWI CI : OOO JAKA PIEKNA WEKA ... MNIAM I DRUGA TRZECIA I CZWARTA
TO BYLO DOBRE ZARCIE !!! , DAWAJ KASE , PIENIADZE !!! , CO SIE TAK GAPISZ?
WYNOCHA STAD !!! MRAMMMARAMMARAMAAMMARAM BUM !! -T-E-L-E-P-O-R-T-Y
WYGLADA ZE ZROBIL CIE W BUCA , A MOZE JEDNAK NIE , CO TO ? , SCROLL POWROTU
I PIWSKO NA OSLODZENIE ZYCIA , NO TRUDNO PRZYNAJMNIEJ CZEGOS SIE NAUCZYLES
AAAA SPADAJ STAD BO CI KOSCI POLAMIE
```

The adjacent `ZABIJ STARUCH` branch calls the shared `SLABO` fight, then removes
Staruch, prints the following two lines, and decrements the player's level:

```text
HMMM UBRANIE JEST , ALE CIALO GDZIES ZNIKNELO , WTEM SLYSZYSZ GLOS :
--- TO BYL TWOJ BLAD --- , DOSTAJESZ OCMIENIA LECZ NIE WIESZ CO TO BYLO
```
