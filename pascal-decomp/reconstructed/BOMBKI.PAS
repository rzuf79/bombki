program BOMBKI;
{ Turbo Pascal 7.0 real-mode main program of BOMBKI.EXE.
  MZ: CS:IP = 0000:B0CF, header paragraphs 0x52E, image length 0x1D4F0;
  img = file[0x52E*16:]. At img 0xB0CF sits lcall 1C71:0000 (System
  bootstrap); program prologue at img 0xB0D9; wrapped near-call at img 0xB0E8
  enters WybierzRase at img 0x16EF, which far-calls MONSTRA.WSTEP (the intro)
  at img 0x16F9. Main loop bleed tick at img 0xB193; ordered room dispatch
  at img 0xB1E5. Backedge img 0xF5BF returns to img 0xB0F0. }
uses
  crt, swiat, przedm, monstra, dos;

{ program-level DGROUP workspace:
    ds:0x564  wpisz / command ReadLn buffer (textrec)
  Unit-owned globals live in the SWIAT/PRZEDM/MONSTRA interface vars. }

var
  EtapPunktuKontrolnego: Integer; { invented label for DGROUP word 0x06C }
  StanPotwora14: Integer;   { invented label for BOMBKI DGROUP word 0x05A }
  StanPotwora12: Integer;   { invented label for BOMBKI DGROUP word 0x058 }
  PoleBOMBKI0066: Integer;  { invented neutral label; room writes $01F4 }
  PoleBOMBKI0068: Integer;  { invented neutral label; room writes $012C }
  PoleBOMBKI006A: Integer;  { invented neutral label; room writes $0032 }
  StanDrzwi: Integer;       { invented name for DGROUP word 0x688 }
  StanStarucha: Integer;    { invented name for DGROUP word 0x68A }
  PoleBOMBKI007A: Integer;  { invented neutral label for DGROUP word 0x07A }
  PoleBOMBKI007C: Integer;  { invented neutral label for DGROUP word 0x07C }
  StanPotwora15: Integer;   { invented label for BOMBKI DGROUP word 0x05C }
  StanPotwora16: Integer;   { invented label for BOMBKI DGROUP word 0x05E }
  StanPotwora17: Integer;   { invented label for BOMBKI DGROUP word 0x060 }
  Powracanie: Integer;      { invented label for unclaimed DGROUP word 0x078 }
  ZwierzetaOgroda: array[0..9] of Integer; { invented DGROUP words 0x666..0x678 }

procedure LosujPolozenia(Parametr: Integer);
{ img 0x12ACA..0x130A1: randomizes encounter, concert, garden-animal,
  room-flag, musician, and plant contexts. The machine body does not read
  its stack argument; all generated values are written to DGROUP/PRZEDM. }
begin
  repeat
    PRZEDM.BAKTERIA := Random(38) + 20;
    PRZEDM.SLIMAK := Random(38) + 20;
    PRZEDM.ZUK := Random(38) + 20;
    PRZEDM.KARALUCH := Random(38) + 20;
    PRZEDM.MROWKA := Random(38) + 20;
    PRZEDM.PAJAK := Random(38) + 20;
    PRZEDM.DZIK := Random(38) + 20;
    PRZEDM.LIS := Random(38) + 20;
    PRZEDM.SZCZUR := Random(38) + 20;
    PRZEDM.KUROPATWA := Random(38) + 20;
  until (PRZEDM.BAKTERIA > 32) and (PRZEDM.SLIMAK > 32) and
        (PRZEDM.ZUK > 32) and (PRZEDM.KARALUCH > 32) and
        (PRZEDM.MROWKA > 32) and (PRZEDM.PAJAK > 32) and
        (PRZEDM.DZIK > 32) and (PRZEDM.LIS > 32) and
        (PRZEDM.SZCZUR > 32) and (PRZEDM.KUROPATWA > 32);

  repeat
    PRZEDM.SARNA := Random(38) + 20;
    PRZEDM.ORZEL := Random(38) + 20;
    PRZEDM.ZAJAC := Random(38) + 20;
    PRZEDM.WILCZUR := Random(38) + 20;
    PRZEDM.KORNIK := Random(38) + 20;
    PRZEDM.MUCHA := Random(38) + 20;
  until (PRZEDM.SARNA > 32) and (PRZEDM.ORZEL > 32) and
        (PRZEDM.ZAJAC > 32) and (PRZEDM.WILCZUR > 32) and
        (PRZEDM.KORNIK > 32) and (PRZEDM.MUCHA > 32);

  repeat
    PRZEDM.SLON := Random(38) + 20;
    PRZEDM.LEW := Random(38) + 20;
    PRZEDM.ZYRAFA := Random(38) + 20;
    PRZEDM.WIELBLAD := Random(38) + 20;
    PRZEDM.STRUS := Random(38) + 20;
    PRZEDM.BOA := Random(38) + 20;
    PRZEDM.WILK := Random(38) + 20;
    PRZEDM.BIZON := Random(38) + 20;
    PRZEDM.PANTERA := Random(38) + 20;
  until (PRZEDM.SLON > 32) and (PRZEDM.LEW > 32) and
        (PRZEDM.ZYRAFA > 32) and (PRZEDM.WIELBLAD > 32) and
        (PRZEDM.STRUS > 32) and (PRZEDM.BOA > 32) and
        (PRZEDM.WILK > 32) and (PRZEDM.BIZON > 32) and
        (PRZEDM.PANTERA > 32);

  repeat
    PRZEDM.GLADIATOR := Random(38) + 20;
    PRZEDM.WOJOWNIK := Random(38) + 20;
    PRZEDM.TRENER := Random(38) + 20;
  until (PRZEDM.GLADIATOR > 32) and (PRZEDM.WOJOWNIK > 32) and
        (PRZEDM.TRENER > 32);

  { DGROUP words 0x666..0x678, in the disassembly's slot order. }
  ZwierzetaOgroda[0] := Random(7) + 20;
  ZwierzetaOgroda[1] := Random(7) + 20;
  ZwierzetaOgroda[4] := Random(7) + 20;
  ZwierzetaOgroda[2] := Random(7) + 20;
  ZwierzetaOgroda[3] := Random(7) + 20;
  ZwierzetaOgroda[5] := Random(7) + 20;
  ZwierzetaOgroda[6] := Random(7) + 20;
  ZwierzetaOgroda[7] := Random(7) + 20;
  ZwierzetaOgroda[8] := Random(7) + 20;
  ZwierzetaOgroda[9] := Random(7) + 20;

  repeat
    PRZEDM.DZIECKO := Random(7) + 60;
    PRZEDM.WARIAT := Random(8) + 60;
    PRZEDM.SLUCHACZ := Random(8) + 60;
    PRZEDM.FAN := Random(8) + 60;
    PRZEDM.CZLOWIEK := Random(8) + 60;
  until (PRZEDM.DZIECKO > 60) and (PRZEDM.WARIAT > 60) and
        (PRZEDM.SLUCHACZ > 60) and (PRZEDM.FAN > 60) and
        (PRZEDM.CZLOWIEK > 60);

  repeat
    PRZEDM.POLICJANT := Random(9) + 60;
    PRZEDM.OCHRONIARZ := Random(9) + 60;
    PRZEDM.GORYL := Random(9) + 60;
    PRZEDM.DZIADEK := Random(8) + 60;
    PRZEDM.REPORTER := Random(7) + 60;
  until (PRZEDM.POLICJANT > 60) and (PRZEDM.OCHRONIARZ > 60) and
        (PRZEDM.GORYL > 60) and (PRZEDM.DZIADEK > 60) and
        (PRZEDM.REPORTER > 60);

  PRZEDM.GITARZYSTA := Random(3) + 70;
  PRZEDM.PERKUSISTA := Random(3) + 70;
  PRZEDM.ORGANISTA := Random(3) + 70;
  PRZEDM.LIROY := Random(3) + 70;

  MONSTRA.MINIBARMAN := 67;
  MONSTRA.GRUBAS := 67;
  MONSTRA.DJ := 69;
  MONSTRA.PEDAL := 76;
  MONSTRA.PARA := 76;
  MONSTRA.MACIEK := 76;
  MONSTRA.DRZWI := 1;
  MONSTRA.STARUCH := 1;

  repeat
    PRZEDM.SZCZAW := Random(8) + 77;
    PRZEDM.KONICZYNKA := Random(8) + 77;
    PRZEDM.STOKROTKA := Random(8) + 77;
    PRZEDM.MLECZ := Random(8) + 77;
    PRZEDM.DMUCHAWIEC := Random(8) + 77;
    PRZEDM.ROZA := Random(8) + 77;
    PRZEDM.OSET := Random(8) + 77;
    PRZEDM.MALINA := Random(8) + 77;
    PRZEDM.AGREST := Random(8) + 77;
    PRZEDM.JEZYNA := Random(8) + 77;
    PRZEDM.TRAWA := Random(8) + 77;
    PRZEDM.DUNCAN := Random(8) + 77;
  until (PRZEDM.SZCZAW < 84) and (PRZEDM.STOKROTKA < 84) and
        (PRZEDM.KONICZYNKA < 84) and (PRZEDM.MLECZ < 84) and
        (PRZEDM.DMUCHAWIEC < 84) and (PRZEDM.ROZA < 84) and
        (PRZEDM.OSET < 84) and (PRZEDM.MALINA < 84);
end;

procedure WybierzRase;
{ img 0x16EF..0x1ABD: intro call, then race selection at game start }
var
  Rasa: string;
begin
  MONSTRA.WSTEP; { img 0x16F9 -> far entry 1BC4:022B }
  WriteLn('NAPISZ SWA RASE : OLBRZYM , NIMFA , UFOK , CZAROMIL , CZLOWIEK , POL-ELF');
  repeat
    ReadLn(Rasa);
    if Rasa = 'CZLOWIEK' then begin
      SIL := 10; ZRE := 10; MAD := 10;
      MAXSIL := 15; MAXZRE := 15; MAXMAD := 15;
    end;
    if Rasa = 'OLBRZYM' then begin
      SIL := 13; ZRE := 13; MAD := 5;
      MAXSIL := 20; MAXZRE := 20; MAXMAD := 7;
      MAXMANA := MAXMANA - 30;
    end;
    if Rasa = 'NIMFA' then begin
      SIL := 10; ZRE := 13; MAD := 7;
      MAXSIL := 15; MAXZRE := 20; MAXMAD := 11;
    end;
    if Rasa = 'POL-ELF' then begin
      SIL := 6; ZRE := 16; MAD := 8;
      MAXSIL := 10; MAXZRE := 24; MAXMAD := 12;
      MAXMANA := MAXMANA - 20;
      FORSA := FORSA + 30;
      ENERGIA := ENERGIA - 5;
      MAXE := MAXE - 5;
    end;
    if Rasa = 'UFOK' then begin
      SIL := 9; ZRE := 9; MAD := 13;
      MAXSIL := 13; MAXZRE := 14; MAXMAD := 20;
      MAXMANA := MAXMANA + 50;
    end;
    if Rasa = 'CZAROMIL' then begin
      SIL := 6; ZRE := 7; MAD := 16;
      MAXSIL := 9; MAXZRE := 11; MAXMAD := 25;
      MAXMANA := MAXMANA + 150;
    end;
  until (Rasa = 'CZLOWIEK') or (Rasa = 'OLBRZYM') or (Rasa = 'NIMFA') or
        (Rasa = 'POL-ELF') or (Rasa = 'UFOK') or (Rasa = 'CZAROMIL');
  WriteLn('PODAJE SWE IMIE (I TAK MNIE TO NIE OBCHODZI)');
  ReadLn(wpisz);
  ENERGIA := 50;
  PRA := 10;
  { EtapPunktuKontrolnego starts at zero in the cleared DGROUP (img 0x51D5). }
  MONSTRA.SILNY := 13; { img 0x1973 DGROUP $68C }
  { Room-state initializers are in Room at img 0x12ACA. }
  POZIOM := 1;
  MAXMANA := MAXMANA + 100;
  MANA := MAXMANA;
  LosujPolozenia(0); { lcall 129D:00FA, img 0x12ACA room/garden generator }
  WriteLn('WITAJ W MUD-ZIE INTERAKTYWNIEJ FORMIE ROZRYWKI');
  WriteLn('MUD JEST TO BARDZO SKOMPLIKOWANA GRA INTERNETOWA');
  WriteLn('TEN PROGRAM NIE JEST IDENTYCZNY JAK MUD TYLE ZE NIE GRA W TO 1000 OSOB');
  WriteLn('DZIEKI TEMU PROGRAMOWI NAUCZYSZ SIE GRAC W PRAWDZIWEGO MUDA');
  WriteLn('ALE MAM NADZIEJE ZE ROZRYWKA TA BEDZIE DLA CIEBIE NOWYM WYZWANIEM');
  WriteLn('W CZASIE GRY BEDZIESZ POZNAWAL CORAZ TO NOWE KOMENDY');
  WriteLn('ALE JAK NARAZIE TYLKO KILKA Z NIECH');
  WriteLn('KOMENDA EXIT PODAJE WSZYSTKIE AKTUALNIE DOSTEPNE WYJSCIA');
  WriteLn('PORUSZASZ SIE ZA POMOCA KOMEND POLNOC POLODNIE WSCHOD ZACHOD GORA DOL');
  WriteLn('ABY SIE PATRZEC UZYJ KOMENDY PATRZ RAZEM Z RZECZA KTORA CHCESZ OBEJRZECZ');
end;

procedure PunktKontrolny;
{ img 0x51C3..0x534A: at most one checkpoint per main-loop invocation }
begin
  if (KUNSZT >= 400) and (EtapPunktuKontrolnego = 0) and (SIL < 20) then begin
    WriteLn('###################!!!CHECKPOINT!!!#########################');
    EtapPunktuKontrolnego := 1;
    LosujPolozenia(0);
    Exit;
  end;
  if (KUNSZT >= 180) and (EtapPunktuKontrolnego = 0) and (SIL < 8) then begin
    WriteLn('###################!!!CHECKPOINT!!!#########################');
    EtapPunktuKontrolnego := 1;
    LosujPolozenia(0);
    Exit;
  end;
  if (KUNSZT >= 360) and (EtapPunktuKontrolnego = 1) and (SIL < 8) then begin
    WriteLn('###################!!!CHECKPOINT!!!#########################');
    EtapPunktuKontrolnego := 2;
    LosujPolozenia(0);
    Exit;
  end;
  if (KUNSZT >= 540) and (EtapPunktuKontrolnego = 2) and (SIL < 8) then begin
    WriteLn('###################!!!CHECKPOINT!!!#########################');
    EtapPunktuKontrolnego := 3;
    LosujPolozenia(0);
    Exit;
  end;
  if (KUNSZT >= 300) and (EtapPunktuKontrolnego = 0) and (SIL >= 7) and (SIL <= 13) then begin
    WriteLn('###################!!!CHECKPOINT!!!#########################');
    EtapPunktuKontrolnego := 1;
    LosujPolozenia(0);
    Exit;
  end;
  if (KUNSZT >= 500) and (EtapPunktuKontrolnego = 1) and (SIL >= 7) and (SIL <= 13) then begin
    WriteLn('###################!!!CHECKPOINT!!!#########################');
    EtapPunktuKontrolnego := 2;
    LosujPolozenia(0);
    Exit;
  end;
end;

procedure ZdobadzPoziom;
{ img 0x872E..0x8BA2: level thresholds and stat gains }
var
  ProgPoziomu: Integer;
begin
  if POZIOM = 1 then begin
    if KUNSZT >= 725 then Exit;
  end;
  if POZIOM = 2 then begin
    if KUNSZT >= 730 then Exit;
  end;
  if POZIOM = 3 then begin
    if KUNSZT >= 735 then Exit;
  end;
  if (POZIOM >= 4) and (POZIOM <= 8) then begin
    ProgPoziomu := 735 + POZIOM;
    if KUNSZT >= ProgPoziomu then Exit;
  end;
  if POZIOM >= 9 then begin
    ProgPoziomu := 735 + POZIOM * 2;
    if KUNSZT >= ProgPoziomu then Exit;
  end;
  { Level up body at img 0x87A2 }
  WriteLn('<<<<<<<<<=+=+=+!!!#####ZDOBYLES LEVEL#####!!!+=+=+=<<<<<<<<<<<<<');
  WriteLn('<<<<<<<<<=+=+=+!!!#####ZDOBYLES LEVEL#####!!!+=+=+=<<<<<<<<<<<<<');
  WriteLn('<<<<<<<<<=+=+=+!!!#####ZDOBYLES LEVEL#####!!!+=+=+=<<<<<<<<<<<<<');
  WriteLn('<<<<<<<<<=+=+=+!!!#####ZDOBYLES LEVEL#####!!!+=+=+=<<<<<<<<<<<<<');
  if POZIOM = 1 then KUNSZT := KUNSZT - 725;
  if POZIOM = 2 then KUNSZT := KUNSZT - 730;
  if POZIOM = 3 then KUNSZT := KUNSZT - 735;
  if (POZIOM > 3) and (POZIOM < 9) then
    KUNSZT := KUNSZT - (735 + POZIOM);
  if (POZIOM >= 9) then
    KUNSZT := KUNSZT - (735 + POZIOM * 2);
  if POZIOM = 1 then PRA := PRA + 3;
  if POZIOM = 2 then PRA := PRA + 4;
  if POZIOM = 3 then PRA := PRA + 5;
  if (POZIOM >= 4) and (POZIOM <= 8) then
    PRA := PRA + (POZIOM + 2);
  if (POZIOM >= 9) then
    PRA := PRA + (POZIOM * 2 - 9);
  WriteLn('<<<<<<<<<<<<ZYSKALES ', PRA, ' PRA >>>>>>>>>>>>>>>');
  if ZRE > 12 then MAXE := MAXE + 11
  else MAXE := MAXE + 10;
  if ZRE > 16 then MAXE := MAXE + 1;
  if ZRE > 21 then MAXE := MAXE + 1;
  if (ZRE > 26) and (SIL > 20) then MAXE := MAXE + 1;
  WriteLn('<<<<<<<<<<<<ZYSKALES ', MAXE, ' ENERGI >>>>>>>>>>>>>>>');
  POZIOM := POZIOM + 1;
end;

procedure PokazPostepTreningu(Nazwa: string; Wartosc: Integer);
{ Invented helper for the repeated practice-result output at img 0x280C..0x2B6E. }
begin
  WriteLn('CWICZYSZ ', Nazwa,
          ' - PRAWDOPODOBIENSTWO JEST TERAZ ', Wartosc,
          '% MASZ ', PRA, ' PRAKTYK');
end;

procedure Trening;
{ Invented source name for the program-local routine at img 0x2395..0x2B74. }
begin
  if wpisz = 'PATRZ PLAKAT' then begin
    WriteLn('NA PLAKACIE PISZE:');
    WriteLn('MOZESZ CWICZYC UZYWAJAC KOMENDY CWICZ RAZEM Z ');
    if MAD < 11 then WriteLn('Z NICZYM BO MASZ ZA MALA MADROSC');
    if (MAD > 10) and (SIL > 11) then WriteLn('KOPAC - KOMENDA:KOP ');
    if (MAD > 10) and (ZRE > 10) then WriteLn('UCIEKAC - KOMENDA : ZWIEJ ');
    if (MAD > 15) and (ZRE > 11) then WriteLn('PAROWANIE - SAMOCZYNNIE ');
    if MAD > 11 then WriteLn('POROWNANIE-KOMEDA POROWNAJ');
    if MAD > 18 then WriteLn('POTRAWKI-SAMOCZYNNIE , PO WALCE');
    if MAD > 17 then WriteLn('POWROT-KOMEDA POWROT');
    if ZRE > 20 then WriteLn('ZRECZNE RECE - KOMENDA : RECE');
    if (SIL > 20) and (ZRE > 10) then WriteLn('KRZEPA : SAMOCZYNNIE');
    if (MAD > 19) and (ZRE > 10) and (SIL > 10) then
      WriteLn('TARGOWANIE SIE : SAMOCZYNNIE');
    if (SIL > 25) and (MAD > 12) then WriteLn('WIROWANIE - SAMOCZYNNIE ');
    if ZRE > 22 then WriteLn('COMBO - SAMOCZYNNIE ');
    if ZRE > 28 then WriteLn('SUPER COMBO - SAMOCZYNNIE ');
    if MAD > 22 then WriteLn('TRUCIZNA - SAMOCZYNNIE');
    if MAD > 23 then WriteLn('UZDRAWIANIE - KOMENDA UZDROW');
    if (ZRE > 24) and (MAD > 14) and (SIL > 14) then
      WriteLn('MOCNY SEN - SAMOCZYNNIE ');
    if MAD > 24 then WriteLn('OSLEPIANIE  - KOMEDA OSLEP ');
    if MAD > 26 then WriteLn('NEKROMANCJA - SAMOCZYNNIE ');
    if (SIL > 12) and (MAD > 19) and (ZRE > 12) then
      WriteLn('SZAL - KOMEDNA SZAL');
    if (ZRE > 22) and (MAD > 16) then WriteLn('SIATKA - KOMENDA SIATKA');
    if ZRE > 30 then WriteLn('CIOS W PLECY - KOMENDA CIOS W (COS)');
    if MAD > 28 then WriteLn('ROZPALANIE OGNISKA - KOMENDA ROZPAL');
    if MAD > 19 then WriteLn('HIPER SPEED - KOMENDA SPEED');
    if (MAD > 23) and (ZRE > 12) then WriteLn('PIECZENIE - KOMENDA PIECZ');
    WriteLn('W STANIE PODSWIADOMOSCI KOMEDA ZDOLNOSCI SPRAWDZI TWE ZDOLNOSCI');
  end;

  if wpisz = 'CWICZ KOPAC' then
    if (MAD > 10) and (SIL > 11) and (PRA > 0) then begin
      KOP := KOP + MAD;
      PRA := PRA - 1;
      PokazPostepTreningu('KOPANIE', KOP);
    end;

  if wpisz = 'CWICZ UCIEKAC' then begin
    if (MAD > 10) and (ZRE > 10) and (PRA > 0) and (ZWIEJ < 85) then begin
      ZWIEJ := ZWIEJ + MAD + ZRE - 5;
      PRA := PRA - 1;
      PokazPostepTreningu('UCIEKANIE', ZWIEJ);
    end else
      WriteLn('ALBO MASZ ZA DOBRZE WYTRENOWANE ALBO ZA MALO PRAKTYK');
  end;

  if wpisz = 'CWICZ POWROT' then
    if (MAD > 17) and (Powracanie < 90) and (PRA > 0) then begin
      Powracanie := Powracanie + 2 * MAD - 3;
      PRA := PRA - 1;
      PokazPostepTreningu('POWRACANIE', Powracanie);
    end;

  if wpisz = 'CWICZ PAROWANIE' then
    if (MAD > 15) and (ZRE > 11) and (PAR < 90) and (PRA > 0) then begin
      PAR := PAR + MAD + ZRE - 14;
      PRA := PRA - 1;
      PokazPostepTreningu('PAROWANIE', PAR);
    end;

  if wpisz = 'CWICZ POROWNANIE' then
    if (MAD > 11) and (POR < 90) and (PRA > 0) then begin
      POR := POR + 3 * MAD - 9;
      PRA := PRA - 1;
      PokazPostepTreningu('POROWNYWANIE', POR);
    end;

  if wpisz = 'CWICZ POTRAWKI' then
    if (MAD > 18) and (POTRAWKI < 90) and (PRA > 0) then begin
      POTRAWKI := POTRAWKI + MAD + 1;
      PRA := PRA - 1;
      PokazPostepTreningu('POTRAWKI', POTRAWKI);
    end;
end;

procedure Pokoj2;
{ img 0x548A: inline room 2 (context 2) - POKOJ TRENINGOWY 1 }
begin
  WriteLn('JESTES W POKOJU GDZIE RAMBO TRENUJE SWYCH UCZNOW ');
  WriteLn('WSZEDZIE SA PRZEDMIOTY DO ROZNYCH RODZAJI CWICZEN');
  WriteLn('NO A POZA TYM NA SCIANIE JEST!!! PLAKAT!!!!');
  repeat
    Write(ENERGIA, '%.', KUNSZT, '>');
    ReadLn(wpisz);
    PRZEDM.KOMENDY;
    if wpisz = 'MODE' then PRZEDM.MODE;
    if wpisz = 'EXIT' then begin
      WriteLn('DOSTEPNE WYJSCIA:');
      WriteLn('ZACHOD-POKOJ CENTRALNY');
    end;
    if wpisz = 'WYJSCIE' then begin MIECHO := 193; Exit; end;
    if wpisz = 'ZACHOD' then MIECHO := 1;
    if wpisz = 'PATRZ PLAKAT' then begin
      WriteLn('NA PLAKACIE PISZE:');
      WriteLn('ABY TRENOWAC UZYJ KOMENDY TRENUJ RAZEM Z ');
      WriteLn('SILA , ZRECZNOSC  LUB MADROSC ');
    end;
    PRZEDM.TRAIN;
  until MIECHO <> 2;
end;

procedure Pokoj3;
{ img 0x571E: inline room 3 (context 3) - PODDZIEMNY POKOJ TRENINGOWY(2) }
begin
  WriteLn('ZSZEDLES NA DOL GDZIE TRENUJE SIE MEDYTUJAC');
  WriteLn('NA SRODKU NA WIELKI MATERAC PRZEZNACZONY DO MEDYTACJI');
  WriteLn('NA SCIANCE JEST PIEKNIUTKI PLAKAT');
  repeat
    Write(ENERGIA, '%.', KUNSZT, '>');
    ReadLn(wpisz);
    PRZEDM.KOMENDY;
    if wpisz = 'MODE' then PRZEDM.MODE;
    if wpisz = 'EXIT' then
      WriteLn('DOSTEPNE WYJSCIE-GORA-HALA GLOWNA MUD SZKOLE ');
    if wpisz = 'WYJSCIE' then begin MIECHO := 193; Exit; end;
    if wpisz = 'DOL' then MIECHO := 5;
    if wpisz = 'GORA' then MIECHO := 11;
    Trening; { img 0x5853 -> program-local routine img 0x2396 }
  until MIECHO <> 3;
end;

procedure Pokoj9;
{ img 0x5923: inline room 9 (context 9) }
begin
  WriteLn('JESTES W MALUTKIM POKOJU ALE WIDZISZ WYJSCIA W DWIE STRONY ');
  WriteLn('SKADS SLYSZYSZ DZIWNE NIEPOKOJACE WRZASKI');
  repeat
    Write(ENERGIA, '%.', KUNSZT, '>');
    ReadLn(wpisz);
    PRZEDM.KOMENDY;
    if wpisz = 'MODE' then PRZEDM.MODE;
    if wpisz = 'EXIT' then begin
      WriteLn('DOSTEPNE WYJSCIA:');
      WriteLn('DOL-MUD SZKOLA (2)');
      WriteLn('GORA-KLATKI PELNE GAJDY');
    end;
    if wpisz = 'WYJSCIE' then begin MIECHO := 193; Exit; end;
    if wpisz = 'DOL' then MIECHO := 5;
    if wpisz = 'GORA' then MIECHO := 11;
  until MIECHO <> 9;
end;

procedure Pokoj12;
{ img 0x5C36: inline room 12 (context 12) - KLATKA CIENIASA }
begin
  WriteLn('TEN POKOJ JEST CALY OBRYZGANY KRWIA NA SCIANACH FLAKI I MOZGI LODZKIE ');
  if StanPotwora12 = 12 then
    WriteLn('POTWOR - CIENIAS STOI NA 1 NODZE POD SCIANA');
  if StanPotwora12 = 0 then
    WriteLn('PAROJACE WNETRZNOSCI POTWORA SA ROZWLECZONE DOOKOLA');
  repeat
    Write(ENERGIA, '%.', KUNSZT, '>');
    ReadLn(wpisz);
    PRZEDM.KOMENDY;
    if wpisz = 'EXIT' then begin
      WriteLn('DOSTEPNE WYJSCIA:');
      WriteLn('ZACHOD-KLATKI PELNE GAJDY');
    end;
    if wpisz = 'MODE' then PRZEDM.MODE;
    if wpisz = 'WYJSCIE' then begin MIECHO := 193; Exit; end;
    if wpisz = 'ZACHOD' then MIECHO := 11;
    if (wpisz = 'ZABIJ POTWOR') and (StanPotwora12 = 12) then begin
      WROGEN := 20; WROGZRE := 3; WROGSIL := 3;
      WALKA;
      if PASZOL = 0 then begin
        StanPotwora12 := 0;
        CZY := Random(10);
        WriteLn('WYCIAGASZ ', CZY, ' MONET Z CIALA POTWORA');
        FORSA := FORSA + CZY;
      end;
      if StanPotwora12 = 0 then begin
        if (PRZEDM.MMIECZ = 0) and (Random(20) < 4) then begin
          PRZEDM.MMIECZ := MIECHO;
          WriteLn('WYCIAGASZ STARY ZARDZEWIALY MIECZ Z CIALA POTWORA');
          PoleBOMBKI0066 := 500;
        end;
        if (PRZEDM.MTARCZA = 0) and (Random(20) < 4) then begin
          PRZEDM.MTARCZA := MIECHO;
          WriteLn('WYCIAGASZ ZWYKLA MALA TARCZA Z CIALA POTWORA');
          PoleBOMBKI0068 := 300;
        end;
        if (PRZEDM.SERCE = 0) and (Random(20) < 6) then begin
          PRZEDM.SERCE := MIECHO;
          WriteLn('WYCIAGASZ ZAKRWAWIONE SERCE Z CIALA POTWORA');
          PoleBOMBKI006A := 50;
        end;
      end;
    end;
  until MIECHO <> 12;
end;

procedure Pokoj14;
{ img 0xB264..0xB520: inline room 14 (context 14) - zreczny potwor }
begin
  WriteLn('TEN POKOJ JEST CALY OBRYZGANY KRWIA NA SCIANACH FLAKI I MOZGI LODZKIE ');
  if StanPotwora14 = 14 then
    WriteLn('ZRECZNY POTWOR SMIGA MIEDZY SCIANAMI');
  if StanPotwora14 = 0 then
    WriteLn('PAROJACE WNETRZNOSCI POTWORA SMIERDZA DOSYC MOCNO');
  repeat
    Write(ENERGIA, '%.', KUNSZT, '>');
    ReadLn(wpisz);
    PRZEDM.KOMENDY;
    if wpisz = 'MODE' then PRZEDM.MODE;
    if wpisz = 'EXIT' then begin
      WriteLn('DOSTEPNE WYJSCIA:');
      WriteLn('POLODNIE-KLATKI PELNE GAJDY');
    end;
    if wpisz = 'WYJSCIE' then begin
      MIECHO := 193; { termination sentinel }
      Exit;
    end;
    if wpisz = 'POLODNIE' then MIECHO := 11;
    if (wpisz = 'ZABIJ POTWOR') and (StanPotwora14 = 14) then begin
      WROGEN := 20; WROGZRE := 30; WROGSIL := 15;
      WALKA;
      if StanPotwora14 = 14 then begin
        StanPotwora14 := 0;
        CZY := Random(15);
        WriteLn('WYCIAGASZ ', CZY, ' MONET Z CIALA POTWORA');
        FORSA := FORSA + CZY;
      end else
        PASZOL := 0;
    end;
  until MIECHO <> 14;
end;

procedure Pokoj15;
{ img 0xB52B..0xB7F1: inline room 15 (context 15) - silny potwor }
begin
  WriteLn('TEN POKOJ JEST CALY OBRYZGANY KRWIA NA SCIANACH FLAKI I MOZGI LODZKIE ');
  if StanPotwora15 = 15 then
    WriteLn('SILNY POTWOR BLOKUJE DROGE');
  if StanPotwora15 = 0 then
    WriteLn('PAROJACE WNETRZNOSCI POTWORA SMIERDZA DOSYC MOCNO');
  repeat
    Write(ENERGIA, '%.', KUNSZT, '>');
    ReadLn(wpisz);
    PRZEDM.KOMENDY;
    if wpisz = 'MODE' then PRZEDM.MODE;
    if wpisz = 'EXIT' then begin
      WriteLn('DOSTEPNE WYJSCIA:');
      WriteLn('POLNOC-KLATKI PELNE GAJDY');
    end;
    if wpisz = 'WYJSCIE' then begin
      MIECHO := 193; Exit;
    end;
    if wpisz = 'POLNOC' then MIECHO := 11;
    if (wpisz = 'ZABIJ POTWOR') and (StanPotwora15 = 15) then begin
      WROGEN := 40; WROGZRE := 20; WROGSIL := 25;
      WALKA;
      if StanPotwora15 = 15 then begin
        StanPotwora15 := 0;
        CZY := Random(20);
        WriteLn('WYCIAGASZ ', CZY, ' MONET Z CIALA POTWORA');
        FORSA := FORSA + CZY;
      end else
        PASZOL := 0;
    end;
  until MIECHO <> 15;
end;

procedure Pokoj16;
{ img 0xB7F2..0xBAAB: inline room 16 (context 16) - odporny potwor }
begin
  WriteLn('TEN POKOJ JEST CALY OBRYZGANY KRWIA NA SCIANACH FLAKI I MOZGI LODZKIE ');
  if StanPotwora16 = 16 then
    WriteLn('ODPORNY POTWOR STOI NA STRAZY');
  if StanPotwora16 = 0 then
    WriteLn('PAROJACE WNETRZNOSCI POTWORA SMIERDZA DOSYC MOCNO');
  repeat
    Write(ENERGIA, '%.', KUNSZT, '>');
    ReadLn(wpisz);
    PRZEDM.KOMENDY;
    if wpisz = 'MODE' then PRZEDM.MODE;
    if wpisz = 'EXIT' then begin
      WriteLn('DOSTEPNE WYJSCIA:');
      WriteLn('WSCHOD-KLATKI PELNE GAJDY');
    end;
    if wpisz = 'WYJSCIE' then begin
      MIECHO := 193; Exit;
    end;
    if wpisz = 'WSCHOD' then MIECHO := 11;
    if (wpisz = 'ZABIJ POTWOR') and (StanPotwora16 = 16) then begin
      WROGEN := 60; WROGZRE := 15; WROGSIL := 30;
      WALKA;
      if StanPotwora16 = 16 then begin
        StanPotwora16 := 0;
        CZY := Random(25);
        WriteLn('WYCIAGASZ ', CZY, ' MONET Z CIALA POTWORA');
        FORSA := FORSA + CZY;
      end else
        PASZOL := 0;
    end;
  until MIECHO <> 16;
end;

procedure Pokoj17;
{ img 0xBAAB..0xBD5A: inline room 17 (context 17) - zreczny/silny/odporny potwor }
begin
  WriteLn('TEN POKOJ JEST CALY OBRYZGANY KRWIA NA SCIANACH FLAKI I MOZGI LODZKIE ');
  if StanPotwora17 = 17 then
    WriteLn('ZRECZNY SILNY I ODPORNY POTWOR CZEKA NA CIEBIE');
  if StanPotwora17 = 0 then
    WriteLn('PAROJACE WNETRZNOSCI POTWORA SMIERDZA DOSYC MOCNO');
  repeat
    Write(ENERGIA, '%.', KUNSZT, '>');
    ReadLn(wpisz);
    PRZEDM.KOMENDY;
    if wpisz = 'MODE' then PRZEDM.MODE;
    if wpisz = 'EXIT' then begin
      WriteLn('DOSTEPNE WYJSCIA:');
      WriteLn('ZACHOD-KLATKI PELNE GAJDY');
    end;
    if wpisz = 'WYJSCIE' then begin
      MIECHO := 193; Exit;
    end;
    if wpisz = 'ZACHOD' then MIECHO := 11;
    if (wpisz = 'ZABIJ POTWOR') and (StanPotwora17 = 17) then begin
      WROGEN := 80; WROGZRE := 25; WROGSIL := 35;
      WALKA;
      if StanPotwora17 = 17 then begin
        StanPotwora17 := 0;
        CZY := Random(30);
        WriteLn('WYCIAGASZ ', CZY, ' MONET Z CIALA POTWORA');
        FORSA := FORSA + CZY;
      end else
        PASZOL := 0;
    end;
  until MIECHO <> 17;
end;

procedure Pokoj18;
{ img 0xBCA2..0xBD1E: one-shot teleport room, context 18 -> room 1 }
begin
  WriteLn('BBBBBBBBZBZBZBZBZZZZZZZzzzzzzzzzbbzbBbzbzbzBZZZ');
  WriteLn('===-------......_________.....----------....._______....-------======');
  WriteLn('T***E***L***E***P***O***R***T***O***W***A***L***E***S***** *****S***I***E!');
  WriteLn('==========================================================================');
  MIECHO := 1;
end;

procedure PlacMiejski;
{ img 0xBD29..0xBF0A: context 20, city center }
begin
  WriteLn('JESTES W CENTRUM MIASTA : NA SCIANIE JEST PLAKAT (DUZY RUCH) ');
  PRZEDM.ULSKLEPIKOWA; { img 0xBD45 -> PRZEDM entry at 0x155F2 }
  repeat
    Write(ENERGIA, '%.', KUNSZT, '>');
    ReadLn(wpisz);
    if wpisz = 'MODE' then PRZEDM.MODE;
    if wpisz = 'PATRZ PLAKAT' then
      WriteLn('TO JEST MIASTO : RADZ SOBIE SAM!');
    if wpisz = 'EXIT' then begin
      WriteLn('DOSTEPNE WYJSCIA:');
      WriteLn('POLODNIE-POKOJ CENTRALNY');
      WriteLn('POLNOC-UL.SKLEPIKOWA');
      WriteLn('WSCHOD-UL.CIEMNA');
      WriteLn('ZACHOD-UL.DLUGA');
    end;
    if wpisz = 'WYJSC0IE' then begin MIECHO := 193; Exit; end;
    if wpisz = 'POLODNIE' then MIECHO := 1;
    if wpisz = 'POLNOC' then MIECHO := 21;
    if wpisz = 'ZACHOD' then MIECHO := 30;
    if wpisz = 'WSCHOD' then MIECHO := 75;
  until MIECHO <> 20;
end;

procedure BarPodDwomaPedalami;
{ img 0xC005..0xC202: context 0x4C (76) - BAR POD DWOMA PEDALAMI }
begin
  { Initial bar description prints at img 0xBFA3..0xC000 }
  if MONSTRA.PEDAL = 76 then
    WriteLn('MACIEK , TUTEJSZY BARMAN SERWUJE TUTAJ DRINKI (MOZLIWA LISTA!');
  if MONSTRA.PEDAL = 76 then
    WriteLn(' PEDAL CZEKA TU NA TEGO JEDYNEGO');
  if MONSTRA.PARA = 76 then
    WriteLn('PARA-JACEK I JUREK OBMYSLAJA MIESIAC MIODOWY');
  repeat
    Write(ENERGIA, '%.', KUNSZT, '>');
    ReadLn(wpisz);
    PRZEDM.KOMENDY;
    if wpisz = 'MODE' then PRZEDM.MODE;
    if wpisz = 'EXIT' then begin
      WriteLn('DOSTEPNE WYJSCIE:');
      WriteLn('POLODNIE-ULICA CIEMNA');
    end;
    if wpisz = 'WYJSCIE' then begin
      MIECHO := 193; Exit;
    end;
    if wpisz = 'POLODNIE' then MIECHO := 75;
    if wpisz = 'LISTA' then begin
      WriteLn('DRINK        CENA');
      WriteLn('ORAL DRINK     130');
      WriteLn('ONANISOFT      180');
      WriteLn('PEDAL&SPRZEGLO 220');
    end;
    if wpisz = 'ZABIJ PEDAL' then begin
      PRZEDM.EASY;
      MONSTRA.PEDAL := 0;
      PRZEDM.PIGULKAZYSK;
    end;
    if wpisz = 'ZABIJ PARA' then begin
      PRZEDM.BTRUDNO;
      MONSTRA.PARA := 0;
      PRZEDM.BTRUDNO;
    end;
    if wpisz = 'ZABIJ MACIEK' then begin
      PRZEDM.EASY;
      MONSTRA.MACIEK := 0;
    end;
    if wpisz = 'MAM 18 LAT' then begin
      WriteLn('I CO Z TEGO ??? A JA MAM 100 LAT I ZYJE !!!');
    end;
  until MIECHO <> 76;
end;

procedure OgrodBluszcz;
{ Invented grouping of the six inline garden contexts at img 0xC20C..0xCC0C. }
var
  KontekstOgrodu: Integer;
begin
  KontekstOgrodu := MIECHO;
  case KontekstOgrodu of
    77: begin
      WriteLn('ZNALAZLES SIE WSROD BLUSZCZU , WOKOLO CIEBIE TAJEMNICZE ROSLINY ');
      WriteLn('MUSISZ BARDZO UWAZAC,TU NAWET STOKROTKA MOZE BYC ZABOJCZA');
    end;
    78: begin
      WriteLn('WSZEDLES W GASZCZ ROSLIN I KWIATOW');
      WriteLn('NIE MA CO OPISYWAC WYSTARCZY POWIEDZIEC ZE JEST TU BYDLO CHWASTOW');
    end;
    79: begin
      WriteLn('SLYSZYSZ POKRZYWKE KTORA POZERA BEZBRONNY SZCZAW .... OHYDA');
      WriteLn('WOKOLO TAK CIEMNO,ZE GDYBY NIE JA JUZ DAWNO BYS ZGINAL');
    end;
    80: begin
      WriteLn('CHOC TO MALO PRAWDOPODOBNE TUTAJ JEST JESZCZE CIEMNIEJ');
      WriteLn('PONADTO W NIEKTORYCH MIEJSCACH ZNAJDUJE SIE BLOTO I INNE BZDURY');
      WriteLn('NA SRODKU ZNAJDUJE SIE STUDNIA I MALO CZYTELNY NAPIS');
    end;
    81: begin
      WriteLn('PRZEDZIERASZ SIE PRZEZ CALY TEN SYF I NAJCHETNIEJ BYS');
      WriteLn('TERAZ PORZYCZYL KOSIARKI OD SWEGO KOLEGI TOMKA');
    end;
    82: begin
      WriteLn('W TEJ KOMNACIE JEST ZNACZNIE JASNIEJ A TO DLATEGO ZE NAPROMIENIOWANE');
      WriteLn('I ZMUTOWANE ROSLINY IDA W TWYM KIERUNKU');
    end;
  end;
  PRZEDM.BLUSZCZ; { each room calls the shared description proc on entry }
  repeat
    Write(ENERGIA, '%.', KUNSZT, '>');
    ReadLn(wpisz);
    PRZEDM.KOMENDY;
    PRZEDM.FIGHTBLUSZCZ;
    if wpisz = 'MODE' then PRZEDM.MODE;
    if wpisz = 'EXIT' then begin
      WriteLn('DOSTEPNE WYJSCIA:');
      case KontekstOgrodu of
        77: begin
          WriteLn('POLNOC-UL.CIEMNA');
          WriteLn('WSCHOD-BLUSZCZ');
          WriteLn('ZACHOD-BLUSZCZ');
          WriteLn('POLODNIE-BLUSZCZ');
        end;
        78: WriteLn('ZACHOD-BLUSZCZ');
        79: WriteLn('WSCHOD-BLUSZCZ');
        80: begin
          WriteLn('POLNOC-BLUSZCZ');
          WriteLn('WSCHOD-BLUSZCZ');
          WriteLn('ZACHOD-BLUSZCZ');
          WriteLn('POLODNIE-WEJSCIE DO GROTY ');
        end;
        81: WriteLn('WSCHOD-BLUSZCZ');
        82: WriteLn('ZACHOD-BLUSZCZ');
      end;
    end;
    if wpisz = 'WYJSCIE' then begin
      MIECHO := 193; Exit;
    end;
    if KontekstOgrodu = 77 then begin
      if wpisz = 'POLNOC' then MIECHO := 75;
      if wpisz = 'WSCHOD' then MIECHO := 78;
      if wpisz = 'ZACHOD' then MIECHO := 79;
      if wpisz = 'POLODNIE' then MIECHO := 80;
    end;
    if KontekstOgrodu = 78 then
      if wpisz = 'ZACHOD' then MIECHO := 77;
    if KontekstOgrodu = 79 then
      if wpisz = 'WSCHOD' then MIECHO := 77;
    if KontekstOgrodu = 80 then begin
      if wpisz = 'POLNOC' then MIECHO := 77;
      if wpisz = 'ZACHOD' then MIECHO := 81;
      if wpisz = 'WSCHOD' then MIECHO := 82;
      if wpisz = 'POLODNIE' then MIECHO := 83;
      if wpisz = 'PATRZ NAPIS' then
        WriteLn('PISZE TUTAJ : A RZY D SUDN (MOWILEM ZE MALO CZYTELNY)');
      if wpisz = 'PATRZ STUDNIA' then begin
        CZY := Random(3) + 1;
        Write('ZAGLADASZ DO SRODKA STUDNI,COS TAM JEST,WYCIAGASZ ', CZY,
              ' MONET!');
        FORSA := FORSA + CZY;
        if Random(100) < 40 then begin
          WriteLn('NO PIEKNIE WLAZLES W JAKIES TOKSYCZNE SUBSTANCJE ,AAA, TO PARZY TRACISZ ',
                  25 - ZRE, ' ENERGI');
          ENERGIA := ENERGIA - (25 - ZRE);
          WriteLn('JAK SMIESZ PODBIERAC MOJE SWIETOSCI , GIN CHAMIE , GIN');
          ENERGIA := ENERGIA - 40;
          WriteLn('ODDAWAJ MOJE PIENIADZE !!!');
          FORSA := FORSA - 100;
          if FORSA < 0 then FORSA := 0;
        end;
      end;
    end;
    if KontekstOgrodu = 81 then
      if wpisz = 'WSCHOD' then MIECHO := 80;
    if KontekstOgrodu = 82 then
      if wpisz = 'ZACHOD' then MIECHO := 80;
  until MIECHO <> KontekstOgrodu;
end;

procedure Pokoj84;
{ img 0xCC22..0xCDFB: context 84, entrance toward the cave }
begin
  WriteLn('TO CIEKAWE ZE WCZESNIEJ NIE ZAUWAZYLES TYCH KRARZAKOW PRZEDZIERASZ');
  WriteLn('SIE PRZEZ ICH GASZCZ WYGLADA TO NA NIEZBYT MILA KRAINE');
  WriteLn('DALEJ NA ZACHOD WIDZISZ JAKIES PODEJRZANE BUDOWLE , A NA POLODNIE BRRRR.');
  WriteLn('NA POLODNIE JAK GDYBY KTOS SIE OBZERAL , ALE BARDZO GLOSNO I NIEBEZPIECZNIE');
  repeat
    Write(ENERGIA, '%.', KUNSZT, '>');
    ReadLn(wpisz);
    PRZEDM.KOMENDY;
    PRZEDM.FIGHTBLUSZCZ;
    if wpisz = 'MODE' then PRZEDM.MODE;
    if wpisz = 'EXIT' then begin
      WriteLn('DOSTEPNE WYJSCIA:');
      WriteLn('WSCHOD-BLUSZCZ');
      WriteLn('ZACHOD-BUDYNEK');
      WriteLn('POLODNIE-WEJSCIE DO GROTY ');
    end;
    if wpisz = 'WYJSCIE' then begin MIECHO := 193; Exit; end;
    if wpisz = 'WSCHOD' then MIECHO := 83;
    if wpisz = 'ZACHOD' then MIECHO := 85;
    if wpisz = 'POLODNIE' then MIECHO := 87;
  until MIECHO <> 84;
end;

procedure Pokoj87;
{ img 0xCDFB..0xCFC2: context 87, poisonous passage }
begin
  WriteLn('MLASK , MLASK KTOS RZECZYWISCIE SIE OBZERA CZY JESTES 100% PEWNY IZ');
  WriteLn('CHCESZ SIE ZAGLEBIC W TE NIEBADANE CZELUSCIE PIEKIELNE?, MOZE LEPIEJ WROC');
  CZY := Random(100);
  if CZY < 40 then begin
    Write('NO PIEKNIE WLAZLES W JAKIES TOKSYCZNE SUBSTANCJE ,AAA, TO PARZY TRACISZ ',
          25 - ZRE, '%');
    ENERGIA := ENERGIA - (25 - ZRE);
  end;
  repeat
    Write(ENERGIA, '%.', KUNSZT, '>');
    ReadLn(wpisz);
    PRZEDM.KOMENDY;
    if wpisz = 'MODE' then PRZEDM.MODE;
    if wpisz = 'EXIT' then begin
      WriteLn('DOSTEPNE WYJSCIA:');
      WriteLn('POLODNIE-GROTA');
      WriteLn('POLNOC-PODEJRZANE KRZAKI');
    end;
    if wpisz = 'WYJSCIE' then begin MIECHO := 193; Exit; end;
    if wpisz = 'POLNOC' then MIECHO := 84;
    if wpisz = 'POLODNIE' then MIECHO := 88;
  until MIECHO <> 87;
end;

procedure Pokoj88;
{ img 0xCFCC..0xD1FB: context 88, giant man-eating plant encounter }
begin
  WriteLn('MOJ BOZE , COZ TO JEST , NA TRONIE SIEDZI 20 RAZY WIEKSZA OD CIEBIE POKRZYWKA');
  WriteLn('WOKOL NIEJ UWIJAJA SIE PRACOWITE MLECZE DOSTARCZAJAC JEJ SWIEZEGO ');
  WriteLn('MIESA LUDZKIEGO !!! , UWIELBIA ONA MOZGI KTORE WYSSYSA JAK PYSZNY PUDDING ');
  WriteLn('W PEWNYM MOMECIE ZAUWAZA CIEBIE - WITAJ WEDROWCZE PODOBAM CI SIE? - (TAK,NIE)');
  Write('TAK lub NIE >');
  ReadLn(wpisz);
  WriteLn('NO TO GIN!!!');
    WROGEN := 200; WROGZRE := 15; WROGSIL := 18;
    ILEPOI := 5; PRZEDM.POISON := 1;
    WALKA;
  if WROGEN < 0 then begin
    PRZEDM.LISTEKZYSK;
    PRZEDM.PIGULKAZYSK;
    PRZEDM.SCROLLPORZYSK;
    if QUESTWYK <> 0 then QUESTWYK := QUESTWYK - 50;
  end;
  if ENERGIA > 0 then begin
    WriteLn('UFFF,TO BYLA PRZYGODA,WOKOL GROMADZILY SIE SETKI MLECZOW - NIE MIALBYS SZANS');
    MIECHO := 87;
  end;
  repeat
    Write(ENERGIA, '%.', KUNSZT, '>');
    ReadLn(wpisz);
    PRZEDM.KOMENDY;
    if wpisz = 'MODE' then PRZEDM.MODE;
    if wpisz = 'EXIT' then begin
      WriteLn('DOSTEPNE WYJSCIA:');
      WriteLn('POLODNIE-WEJSCIE DO GROTY');
    end;
    if wpisz = 'WYJSCIE' then begin MIECHO := 193; Exit; end;
    if wpisz = 'POLODNIE' then MIECHO := 87;
  until MIECHO <> 88;
end;

procedure Pokoj85;
{ img 0xD1FB..0xD41D: context 85, living door }
begin
  WriteLn('DO DOBRA WYGLADA TO NA JAKIS DOM , WEJDZMY DO SRODKA ');
  WriteLn('GOD DAMN , A NIECH MNIE MA MATEUSZ W SWOJEJ OPIECE , TE DRZWI ZYJA !!!');
  if StanDrzwi <> 0 then
    WriteLn('DRZWI WYCIAGAJA SWE DREWNIANE RECE W TWYM KIERUNKU MOWIAC : NIE WPUSZCZE');
  repeat
    Write(ENERGIA, '%.', KUNSZT, '>');
    ReadLn(wpisz);
    PRZEDM.KOMENDY;
    if wpisz = 'ZABIJ DRZWI' then begin
      if StanDrzwi <> 0 then begin
        PRZEDM.NEASY;
        if ENERGIA > 0 then StanDrzwi := 0;
      end;
    end;
    if wpisz = 'MODE' then PRZEDM.MODE;
    if wpisz = 'EXIT' then begin
      WriteLn('DOSTEPNE WYJSCIA:');
      WriteLn('WSCHOD-PODEJRZANE KRZAKI');
      if StanDrzwi <> 0 then
        WriteLn('ZACHOD-GDYBY NIE TE CHOLERNE DRZWI ... ')
      else
        WriteLn('ZACHOD-WEJSCIE DO DOMKU');
    end;
    if wpisz = 'WYJSCIE' then begin MIECHO := 193; Exit; end;
    if wpisz = 'WSCHOD' then MIECHO := 84;
    if (wpisz = 'ZACHOD') and (StanDrzwi = 0) then MIECHO := 86;
    if (wpisz = 'ZACHOD') and (StanDrzwi <> 0) then
      WriteLn('SPROBOJ OMINAC TE MEGA-PRZYPAKOWANE DRZWI KTORYCH BY SIE HE-MAN NIE POWSTYDZIL');
  until MIECHO <> 85;
end;

procedure Pokoj86;
{ img 0xD427..0xD7F0: context 86, the old man's room }
begin
  WriteLn('DOBRA JESTES W SRODKU BRAK OSWIETLENIA CIE NIE WZRUSZA , DOOKOLA ROZNE GARNKI');
  if StanStarucha <> 0 then
    WriteLn('W ROGU ZAUWAZASZ MALEGO WYGLODZONEGO ELFIEGO STARUCHA')
  else
    WriteLn('WIDZISZ TU TYLKO PLASZCZ PO STARUCHU KTORY ZNIKNA W PRZESTRZEN');
  repeat
    Write(ENERGIA, '%.', KUNSZT, '>');
    ReadLn(wpisz);
    PRZEDM.KOMENDY;
    if wpisz = 'DAWAJ KUNSZT' then KUNSZT := KUNSZT + 500;
    if wpisz = 'PATRZ GARNKI' then
      WriteLn('Z JEZOREM NA WIERZCHU PATRZYSZ DO GARNKOW LECZ NIC W NICH NIE MA');
    if wpisz = 'ROZMAWIAJ STARUCH' then begin
      if (WEKA > -30) and (FORSA < 200) and (PoleBOMBKI007A = 0) then begin
        WriteLn('STARUCH MOWI CI : HEJ KTO TY JESTES CZY ZE MAGICZNE DRZWI NIE POWSTRZYMALY CIE?');
        WriteLn('MUSISZ BYC NIEZLYM WOJOWNIKIEM ,SPOXOLANDIA, GLODNY JESTEM PRZYNIES MI 4 WEKI');
        WriteLn('ORAZ OKOLO 200 KASY , A DAM CI TAKIE NUMERY O JAKICH CI SIE NIE SNILO....');
      end;
      if (WEKA < -30) and (FORSA >= 200) then begin
        WriteLn('STARUCH MOWI CI : OOO JAKA PIEKNA WEKA ... MNIAM I DRUGA TRZECIA I CZWARTA');
        WriteLn('TO BYLO DOBRE ZARCIE !!! , DAWAJ KASE , PIENIADZE !!! , CO SIE TAK GAPISZ?');
        WriteLn('WYNOCHA STAD !!! MRAMMMARAMMARAMAAMMARAM BUM !! -T-E-L-E-P-O-R-T-Y');
        WriteLn('WYGLADA ZE ZROBIL CIE W BUCA , A MOZE JEDNAK NIE , CO TO ? , SCROLL POWROTU');
        WriteLn('I PIWSKO NA OSLODZENIE ZYCIA , NO TRUDNO PRZYNAJMNIEJ CZEGOS SIE NAUCZYLES');
        MIECHO := 20;
        PoleBOMBKI007C := PoleBOMBKI007C - 10;
        PRZED := PRZED - 2;
        WEKA := WEKA + 40;
        FORSA := FORSA - 200;
        PoleBOMBKI007A := PoleBOMBKI007A - 10;
        KUNSZT := KUNSZT + 50;
      end;
      if PoleBOMBKI007A < 0 then begin
        WriteLn('AAAA SPADAJ STAD BO CI KOSCI POLAMIE');
        MIECHO := 16;
      end;
    end;
    if wpisz = 'ZABIJ STARUCH' then begin
      if StanStarucha <> 0 then begin
        PRZEDM.SLABO;
        StanStarucha := 0;
        WriteLn('HMMM UBRANIE JEST , ALE CIALO GDZIES ZNIKNELO , WTEM SLYSZYSZ GLOS :');
        WriteLn('--- TO BYL TWOJ BLAD --- , DOSTAJESZ OCMIENIA LECZ NIE WIESZ CO TO BYLO');
        POZIOM := POZIOM - 1;
      end;
    end;
    if wpisz = 'MODE' then PRZEDM.MODE;
    if wpisz = 'EXIT' then begin
      WriteLn('DOSTEPNE WYJSCIA:');
      WriteLn('POLODNIE-CENTRUM MIASTA');
      WriteLn('POLNOC-UL.SKLEPIKOWA');
      WriteLn('WSCHOD-PIEKARNIA');
      WriteLn('ZACHOD-ZBROJOWNIA');
    end;
    if wpisz = 'WYJSCIE' then begin MIECHO := 193; Exit; end;
    if wpisz = 'POLODNIE' then MIECHO := 20;
    if wpisz = 'POLNOC' then MIECHO := 22;
    if wpisz = 'WSCHOD' then MIECHO := 23;
    if wpisz = 'ZACHOD' then MIECHO := 24;
  until MIECHO <> 86;
end;

procedure UlicaSklepikowa;
{ img 0xD7F0..0xD9CA: context 21 }
begin
  WriteLn('JESTES NA ULICY NA ULICY SKLEPIKOWEJ - JAK SAMA NAZWA WZKAZUJE');
  WriteLn('JEST TU PARE SKLEPIKOW KTORE BYC MOZE CI SIE PRZYDADZA');
  PRZEDM.ULSKLEPIKOWA;
  repeat
    Write(ENERGIA, '%.', KUNSZT, '>');
    ReadLn(wpisz);
    PRZEDM.KOMENDY;
    if wpisz = 'MODE' then PRZEDM.MODE;
    if wpisz = 'EXIT' then begin
      WriteLn('DOSTEPNE WYJSCIA:');
      WriteLn('POLODNIE-CENTRUM MIASTA');
      WriteLn('POLNOC-UL.SKLEPIKOWA');
      WriteLn('WSCHOD-PIEKARNIA');
      WriteLn('ZACHOD-ZBROJOWNIA');
    end;
    if wpisz = 'WYJSCIE' then begin MIECHO := 193; Exit; end;
    if wpisz = 'POLODNIE' then MIECHO := 20;
    if wpisz = 'POLNOC' then MIECHO := 22;
    if wpisz = 'WSCHOD' then MIECHO := 23;
    if wpisz = 'ZACHOD' then MIECHO := 24;
  until MIECHO <> 21;
end;

procedure UlicaDalej;
{ img 0xD9CA..0xDBA4: context 22 }
begin
  WriteLn('CIAGNIE SIE TEDY ULICA SKLEPIKOWA JEST TU JESZCZE PARE');
  WriteLn('INTERESUJACYCH SKLEPOW. DALEJ CIAGNIE SIE KILKA ULIC....');
  PRZEDM.ULSKLEPIKOWA;
  repeat
    Write(ENERGIA, '%.', KUNSZT, '>');
    ReadLn(wpisz);
    PRZEDM.KOMENDY;
    if wpisz = 'MODE' then PRZEDM.MODE;
    if wpisz = 'EXIT' then begin
      WriteLn('DOSTEPNE WYJSCIA:');
      WriteLn('POLODNIE-UL.SKLEPIKOWA');
      WriteLn('POLNOC-ROZJAZD!');
      WriteLn('WSCHOD-SKLEP WIELOBRANZOWY');
      WriteLn('ZACHOD-SKLEP MAGICZNY  ');
    end;
    if wpisz = 'WYJSCIE' then begin MIECHO := 193; Exit; end;
    if wpisz = 'POLODNIE' then MIECHO := 21;
    if wpisz = 'POLNOC' then MIECHO := 101;
    if wpisz = 'WSCHOD' then MIECHO := 25;
    if wpisz = 'ZACHOD' then MIECHO := 26;
  until MIECHO <> 22;
end;

procedure Droga;
{ img 0xDBA4..0xDDA8: context 101 }
begin
  WriteLn('IDZIESZ DROGA , MIASTA PO DRODZE MIJASZ DROGOWSKAZ . JEST TU O WIELE');
  WriteLn('NIEBEZPIECZNIEJ NIZ W MIESCIE PELNO TU ZEZIMIERZKOW ROZNEGO RODZAJU');
  WriteLn('JESLI NIE CHCESZ MIEC KLOPOTOW LEPIEJ DOBRZE TRYMAJ SIE DROGI....');
  repeat
    Write(ENERGIA, '%.', KUNSZT, '>');
    ReadLn(wpisz);
    PRZEDM.KOMENDY;
    if wpisz = 'MODE' then PRZEDM.MODE;
    if wpisz = 'EXIT' then begin
      WriteLn('DOSTEPNE WYJSCIA:');
      WriteLn('WSCHOD-ROZJAZD!');
      WriteLn('ZACHOD-DROGA');
      WriteLn('POLNOC-LAS');
      WriteLn('POLODNIE-LAS');
    end;
    if wpisz = 'PATRZ DROGOWSKAZ' then
      WriteLn('WSCHOD - MIASTO , ZACHOD - SHIGGHLERATHR');
    if wpisz = 'WYJSCIE' then begin MIECHO := 193; Exit; end;
    if wpisz = 'WSCHOD' then MIECHO := 100;
    if wpisz = 'ZACHOD' then MIECHO := 102;
    if wpisz = 'POLNOC' then MIECHO := 104;
  until MIECHO <> 101;
end;

procedure DrogaKamienista;
{ img 0xDDA8..0xDF4C: context 102 }
begin
  WriteLn('IDZIESZ DALEJ KAMIENISTA DROGA , BRZYDALA BI CI SIE JAKA BRYCZKA NALEPIEJ');
  WriteLn('MODEL SZKAPA 2000 , ALE COZ KONIE SA TYLKO DLA NAJBOGATSZYCH');
  repeat
    Write(ENERGIA, '%.', KUNSZT, '>');
    ReadLn(wpisz);
    PRZEDM.KOMENDY;
    if wpisz = 'MODE' then PRZEDM.MODE;
    if wpisz = 'EXIT' then begin
      WriteLn('DOSTEPNE WYJSCIA:');
      WriteLn('WSCHOD-DROGA');
      WriteLn('ZACHOD-DROGA');
      WriteLn('POLNOC-LAS');
      WriteLn('POLODNIE-LAS');
    end;
    if wpisz = 'WYJSCIE' then begin MIECHO := 193; Exit; end;
    if wpisz = 'WSCHOD' then MIECHO := 101;
    if wpisz = 'ZACHOD' then MIECHO := 103;
  until MIECHO <> 102;
end;

procedure DrogaKrecona;
{ img 0xDF4C..0xE0F2: context 103 }
begin
  WriteLn('CO TO ZA GLUPOTA ? DROGA SKRECA TROCHE W LEWO , TROCHE W PRAWO ALE');
  WriteLn('PRZECIEZ ROWNIE DOBRZE MOGLA BY ISC SRODKIEM , ZYSKALI BY NA TYM WSZYSCY');
  WriteLn('A SZCZEGOLNIE TY ,  BO BOLA CIE NOGI OD TEGO CHODZENIA NIEMOZEBNIE');
  WriteLn('UPS DROGA SIE KONCZY NA TEJ NIEPRZEPASTNEJ RZECE O DALSZEJ PODROZY NIE MA MOWY');
  repeat
    Write(ENERGIA, '%.', KUNSZT, '>');
    ReadLn(wpisz);
    PRZEDM.KOMENDY;
    if wpisz = 'MODE' then PRZEDM.MODE;
    if wpisz = 'EXIT' then begin
      WriteLn('DOSTEPNE WYJSCIA:');
      WriteLn('WSCHOD-DROGA');
      WriteLn('POLNOC-LAS');
      WriteLn('POLODNIE-LAS');
    end;
    if wpisz = 'WYJSCIE' then begin MIECHO := 193; Exit; end;
    if wpisz = 'WSCHOD' then MIECHO := 102;
  until MIECHO <> 103;
end;

procedure Piekarnia;
{ img 0xE0FE..0xE2A1: inline context 23; merchant subroutine unresolved }
begin
  WriteLn('JESTES W PIEKARNI , SKLEP PRZESIAKNIETY JEST PRZYJEMNYM ZAPACHEM CHLEBA ');
  WriteLn('PIEKARZ MILO SIE NA CIEBIE PATRZY WYCIERAJAC MAKE Z TWARZY');
  WriteLn('NA SCIANIE  JEST PLAKAT CALY W MACE');
  repeat
    Write(ENERGIA, '%.', KUNSZT, '>');
    ReadLn(wpisz);
    PRZEDM.KOMENDY;
    if wpisz = 'MODE' then PRZEDM.MODE;
    if wpisz = 'PATRZ PLAKAT' then begin
      WriteLn('LISTA-LISTA DOSTEPNYCH RZECZY,KUP (PRZEDMIOT)-KUPUJESZ GO ');
      WriteLn('PO ODEJSCIU OD LADY REKLAMACJI NIE UWZGLEDNIA SIE');
    end;
    if wpisz = 'EXIT' then begin
      WriteLn('DOSTEPNE WYJSCIA:');
      WriteLn('ZACHOD-ULICA SKLEPIKOWA');
    end;
    if wpisz = 'WYJSCIE' then begin MIECHO := 193; Exit; end;
    if wpisz = 'ZACHOD' then MIECHO := 21;
    { The inline shop transaction routine at img 0x139BE is not reconstructed. }
  until MIECHO <> 23;
end;

procedure Zbrojownia;
{ img 0xE2AB..0xE42B: inline context 24; shop mechanics unresolved }
begin
  WriteLn('JESTES W ZBROJOWNI - SKLEP NIEDAWNO ZOSTAL OTWARTY');
  WriteLn('SPRZEDAWCA(BRZYDKA AURA) STARA SIE WCISNAC CI JAKIS TOWAR ');
  WriteLn('NA SCIANIE WISI PLAKAT');
  repeat
    Write(ENERGIA, '%.', KUNSZT, '>');
    ReadLn(wpisz);
    PRZEDM.KOMENDY;
    if wpisz = 'MODE' then PRZEDM.MODE;
    if wpisz = 'PATRZ PLAKAT' then
      WriteLn('LISTA,KUP XXX I SPRZEDAJ XXX TO JEST DOSTEPNE W TYM SKLEPIE ');
    if wpisz = 'EXIT' then begin
      WriteLn('DOSTEPNE WYJSCIA:');
      WriteLn('WSCHOD-ULICA SKLEPIKOWA');
    end;
    if wpisz = 'WYJSCIE' then begin MIECHO := 193; Exit; end;
    if wpisz = 'WSCHOD' then MIECHO := 21;
    { The shop transaction helper reached at img 0xE41E remains open. }
  until MIECHO <> 24;
end;

procedure SklepWielobranzowy;
{ img 0xE435..0xE599: inline context 25; shop transaction helper unresolved }
begin
  WriteLn('WSZEDLES DO SKLEPU WIELOBRANZOWEGO,STWIERDZASZ OBECNOSC SPRZEDAWCY');
  WriteLn('NA DRZWIACH ZOSTALA WYWIESZONA WYWIESZKA');
  repeat
    Write(ENERGIA, '%.', KUNSZT, '>');
    ReadLn(wpisz);
    PRZEDM.KOMENDY;
    if wpisz = 'MODE' then PRZEDM.MODE;
    if wpisz = 'EXIT' then begin
      WriteLn('DOSTEPNE WYJSCIA:');
      WriteLn('ZACHOD-ULICA SKLEPIKOWA');
    end;
    if wpisz = 'ZACHOD' then MIECHO := 22;
    if wpisz = 'PATRZ WYWIESZKA' then
      WriteLn('* SKLEP OTWARTY DO ODWOLANIA *');
    if wpisz = 'WYJSCIE' then begin MIECHO := 193; Exit; end;
    { The transaction routine at img 0x143A5 is not reconstructed. }
  until MIECHO <> 25;
end;

procedure SklepZamkniety;
{ img 0xE5A3..0xE6EB: inline context 26; shop transaction helper unresolved }
begin
  WriteLn('WCHODZISZ DO SKLEPU ALE NICZEGO TU NIE MA POZA SPRZEDAWCA I JEGO TOWAREM');
  repeat
    Write(ENERGIA, '%.', KUNSZT, '>');
    ReadLn(wpisz);
    PRZEDM.KOMENDY;
    if wpisz = 'MODE' then PRZEDM.MODE;
    if wpisz = 'EXIT' then begin
      WriteLn('DOSTEPNE WYJSCIA:');
      WriteLn('WSCHOD-ULICA SKLEPIKOWA');
    end;
    if wpisz = 'WSCHOD' then MIECHO := 22;
    if wpisz = 'PATRZ PLAKAT' then
      WriteLn('* OTWARTE Z POWODU CHOROBY *');
    if wpisz = 'WYJSCIE' then begin MIECHO := 193; Exit; end;
    { The shop transaction routine at img 0x14ADD is not reconstructed. }
  until MIECHO <> 26;
end;

procedure UlicaDluga;
{ img 0xE6F5..0xE854: inline context 31 }
begin
  WriteLn('IDAC ULICA DLUGA NA POLNOC SPOSTRZEGASZ DOLINE ROZRYWEK');
  WriteLn('A NA POLODNIE BASNIOWY GAJ...........');
  repeat
    Write(ENERGIA, '%.', KUNSZT, '>');
    ReadLn(wpisz);
    if wpisz = 'MODE' then PRZEDM.MODE;
    if wpisz = 'EXIT' then begin
      WriteLn('DOSTEPNE WYJSCIA:');
      WriteLn('WSCHOD-ULICA DLUGA');
      WriteLn('POLNOC-DOLINA ROZRYWEK');
    end;
    if wpisz = 'WYJSCIE' then begin MIECHO := 193; Exit; end;
    if wpisz = 'WSCHOD' then MIECHO := 30;
    if wpisz = 'POLNOC' then MIECHO := 60;
  until MIECHO <> 31;
end;

procedure WejscieAreny;
{ img 0xE86D..0xEA0B: inline context 32; MINIARENA owns cells 33..57 }
begin
  WriteLn('CZESC TO ARENA PRZYCHODZA TU TACY JAK TY PO TO ABY MORDOWAC');
  WriteLn('!!!!!O NIE!!!!!!!! TO STRASZNE!!! ( SIE DAL NABRAC ) (NAPISZ PATRZ PLAKAT');
  repeat
    Write(ENERGIA, '%.', KUNSZT, '>');
    ReadLn(wpisz);
    if wpisz = 'MODE' then PRZEDM.MODE;
    if wpisz = 'PATRZ PLAKAT' then begin
      WriteLn('NA PLAKACIE PISZE');
      WriteLn('NIE ATAKUJ LUDZI I ZWIERZAT Z ZOO CHYBA ZE MASZ 3 LEVEL( LUB WYZEJ :P)');
    end;
    if wpisz = 'EXIT' then begin
      WriteLn('DOSTEPNE WYJSCIA:');
      WriteLn('POLODNIE-ULICA DLUGA');
      WriteLn('POLNOC-ARENA');
    end;
    if wpisz = 'WYJSCIE' then begin MIECHO := 193; Exit; end;
    if wpisz = 'POLODNIE' then MIECHO := 30;
    if wpisz = 'POLNOC' then MIECHO := 33;
  until MIECHO <> 32;
end;

procedure SalaKoncertowa;
{ img 0x68D0..0x6AE6: inline context 61; kill dispatch remains open }
begin
  WriteLn('KIEDY PODSZEDLES BLIZEJ ZBARANIALES - TO SALA KONCERTOWA !!!');
  WriteLn('WOKOLO TLUMY SLUCHAJA MUZYKI , DZIWNA TO MUZYKA - WLASCIWIE SAME SLOWA');
  WriteLn('!!!!!!!!!NA SCIANIE JEST PLAKAT !!!!!!!!!!!!!!!');
  PRZEDM.TLUM;
  repeat
    Write(ENERGIA, '%.', KUNSZT, '>');
    ReadLn(wpisz);
    if wpisz = 'MODE' then PRZEDM.MODE;
    if wpisz = 'EXIT' then begin
      WriteLn('DOSTEPNE WYJSCIA:');
      WriteLn('ZACHOD-DOLINA ROZRYWEK');
      WriteLn('POLNOC-TLUM');
      WriteLn('POLODNIE-TLUM');
    end;
    if wpisz = 'PATRZ PLAKAT' then begin
      WriteLn(' NA PLAKACIE PISZE :');
      WriteLn('20 X 98 r KONCERT LIROYA - ZAPRASZAMY WSZYSTKICH  ');
    end;
    if wpisz = 'WYJSCIE' then begin MIECHO := 193; Exit; end;
    if wpisz = 'ZACHOD' then MIECHO := 60;
    if wpisz = 'POLNOC' then MIECHO := 66;
    if wpisz = 'POLODNIE' then MIECHO := 65;
    if wpisz = 'WSCHOD' then MIECHO := 64;
    { KillDispatch at img 0x6A20 is not reconstructed yet. }
  until MIECHO <> 61;
end;

procedure BrzegTlumu;
{ img 0x6AF0..0x6C40: inline context 62; kill dispatch remains open }
begin
  WriteLn('NA BRZEGACH TLUM JEST MNIEJSZY , MIMO TO UCZUCIE SCISKU IRYTUJE CIE');
  PRZEDM.TLUM;
  repeat
    Write(ENERGIA, '%.', KUNSZT, '>');
    ReadLn(wpisz);
    if wpisz = 'MODE' then PRZEDM.MODE;
    if wpisz = 'EXIT' then begin
      WriteLn('DOSTEPNE WYJSCIA:');
      WriteLn('POLNOC-TLUM');
      WriteLn('WSCHOD-TLUM');
    end;
    if wpisz = 'WYJSCIE' then begin MIECHO := 193; Exit; end;
    if wpisz = 'POLNOC' then MIECHO := 61;
    if wpisz = 'WSCHOD' then MIECHO := 65;
    { KillDispatch at img 0x6BF1 is not reconstructed yet. }
  until MIECHO <> 62;
end;

procedure RzadkiTlum;
{ img 0x6C4A..0x6DCD: inline context 63; kill dispatch remains open }
begin
  WriteLn('NA BRZEGACH TLUM JEST RZADSZY , BOISZ SIE POMYSLEC CO SIE DZIEJE W SRODKU');
  PRZEDM.TLUM;
  repeat
    Write(ENERGIA, '%.', KUNSZT, '>');
    ReadLn(wpisz);
    if wpisz = 'MODE' then PRZEDM.MODE;
    if wpisz = 'EXIT' then begin
      WriteLn('DOSTEPNE WYJSCIA:');
      WriteLn('POLODNIE-TLUM');
      WriteLn('WSCHOD-TLUM');
      WriteLn('POLNOC-PIWIARNIA');
    end;
    if wpisz = 'WYJSCIE' then begin MIECHO := 193; Exit; end;
    if wpisz = 'POLODNIE' then MIECHO := 61;
    if wpisz = 'WSCHOD' then MIECHO := 66;
    if wpisz = 'POLNOC' then MIECHO := 67;
    { KillDispatch at img 0x6D67 is not reconstructed yet. }
  until MIECHO <> 63;
end;

procedure SrodekTlumu;
{ img 0x6DD2..0x6F76: inline context 64; kill dispatch remains open }
begin
  WriteLn('JESTES W SRODKU TLUMU A DO TEGO PRZY BALUSTRADKACH-CO ZA TLOK');
  WriteLn('NIE MOZNA ODDYCHAC W TAKIM TLUMIE - LEPIEJ SZYBKO Z TAD IDZ');
  PRZEDM.TLUM;
  { Additional room helper at img 0x6E74 is not identified yet. }
  repeat
    Write(ENERGIA, '%.', KUNSZT, '>');
    ReadLn(wpisz);
    if wpisz = 'MODE' then PRZEDM.MODE;
    if wpisz = 'EXIT' then begin
      WriteLn('DOSTEPNE WYJSCIA:');
      WriteLn('ZACHOD-TLUM');
      WriteLn('POLNOC-TLUM');
      WriteLn('POLODNIE-TLUM');
    end;
    if wpisz = 'WYJSCIE' then begin MIECHO := 193; Exit; end;
    if wpisz = 'ZACHOD' then MIECHO := 61;
    if wpisz = 'POLNOC' then MIECHO := 66;
    if wpisz = 'POLODNIE' then MIECHO := 65;
    { KillDispatch at img 0x6F10 is not reconstructed yet. }
  until MIECHO <> 64;
end;

procedure BokTlumu;
{ img 0x6F76..0x70EC: inline context 65; kill dispatch remains open }
begin
  WriteLn('JESTES Z BOKU ALE PRZY BALUSTRADKACH LUDZIE WPYCHAJA CIE NA TE BALUSTRADKI');
  WriteLn('NIE MOZNA ODDYCHAC W TAKIM TLUMIE - LEPIEJ SZYBKO Z TAD IDZ');
  PRZEDM.TLUM;
  { Additional room helper at img 0x701D is not identified yet. }
  repeat
    Write(ENERGIA, '%.', KUNSZT, '>');
    ReadLn(wpisz);
    if wpisz = 'MODE' then PRZEDM.MODE;
    if wpisz = 'EXIT' then begin
      WriteLn('DOSTEPNE WYJSCIA:');
      WriteLn('ZACHOD-TLUM');
      WriteLn('POLNOC-TLUM');
    end;
    if wpisz = 'WYJSCIE' then begin MIECHO := 193; Exit; end;
    if wpisz = 'POLNOC' then MIECHO := 64;
    if wpisz = 'ZACHOD' then MIECHO := 62;
    { KillDispatch at img 0x709D is not reconstructed yet. }
  until MIECHO <> 65;
end;

procedure PrzyBalustradzie;
{ img 0x70EC..0x723C: inline context 66; kill dispatch remains open }
begin
  WriteLn('JESTES PRZY BALUSTRADKACH-NIE BEDE SIE ROZWODZIL JAK CI JEST CIASNO');
  { The context-specific helper at img 0x7177 is not identified yet. }
  repeat
    Write(ENERGIA, '%.', KUNSZT, '>');
    ReadLn(wpisz);
    if wpisz = 'MODE' then PRZEDM.MODE;
    if wpisz = 'EXIT' then begin
      WriteLn('DOSTEPNE WYJSCIA:');
      WriteLn('ZACHOD-TLUM');
      WriteLn('POLODNIE-TLUM');
    end;
    if wpisz = 'WYJSCIE' then begin MIECHO := 193; Exit; end;
    if wpisz = 'ZACHOD' then MIECHO := 63;
    if wpisz = 'POLODNIE' then MIECHO := 64;
    { KillDispatch at img 0x71F7 is not reconstructed yet. }
  until MIECHO <> 66;
end;

procedure Piwiarnia;
{ img 0x7250..0x74FA: inline context 67; common kill dispatch remains open }
begin
  WriteLn('JESTES W PIWIARNI - WOKOLO CIEBIE UNOSI SIE ZAPACH PIWA , TY NIE PIJASZ PIWA');
  WriteLn('TY PIJASZ JABOLA !!! , NIE REZYGNUJAC ZE SWYCH PRZYZWYCZAJEN ROZGLADASZ SIE:');
  if PoleBOMBKI007A = 67 then
    WriteLn('I WIDZISZ MINI-BARMANA SPIESZACEGO SIE ABY PODAC WSZYSTKIM NAWARZONE PIWO');
  if PoleBOMBKI007C = 67 then
    WriteLn('I WIDZISZ GRUBASA KTORY PO WYPICIU 18 PIW WYRAZNIE MA PEWNE OBJAWY SPICIA');
  PRZEDM.TLUM;
  repeat
    Write(ENERGIA, '%.', KUNSZT, '>');
    ReadLn(wpisz);
    if wpisz = 'MODE' then PRZEDM.MODE;
    if wpisz = 'EXIT' then begin
      WriteLn('DOSTEPNE WYJSCIA:');
      WriteLn('WSCHOD-WEJSCIE NA ESTRADE');
      WriteLn('POLODNIE-TLUM');
    end;
    if (wpisz = 'ZABIJ MINI-BARMAN') and (PoleBOMBKI007A = 67) then begin
      WriteLn('---------------  ROUND ONE --------------------');
      WriteLn('----------------  FIGHT -----------------------');
      PRZEDM.BTRUDNO;
      if ENERGIA > 0 then begin
        PoleBOMBKI007A := 0;
        PRZEDM.CZY := Random(100);
        if PRZEDM.CZY < 15 then begin
          WriteLn('Z CIALA MINI-BARMANA WYCIAGASZ NAPOJ BOGOW : PIWO !!!');
          PoleBOMBKI007C := PoleBOMBKI007C - 10;
          PRZEDM.PRZED := PRZEDM.PRZED + 1;
        end;
      end;
    end;
    if (wpisz = 'ZABIJ GRUBAS') and (PoleBOMBKI007C = 67) then begin
      PRZEDM.BTRUDNO;
      if ENERGIA > 0 then begin
        PoleBOMBKI007C := 0;
        if PRZEDM.CZY < 15 then begin
          WriteLn('Z CIALA GRUBASA WYCIAGASZ NAPOJ BOGOW : PIWO !!!');
          PoleBOMBKI007C := PoleBOMBKI007C - 10;
          PRZEDM.PRZED := PRZEDM.PRZED + 1;
        end;
      end;
    end;
    if wpisz = 'WYJSCIE' then begin MIECHO := 193; Exit; end;
    if wpisz = 'POLODNIE' then MIECHO := 63;
    if wpisz = 'WSCHOD' then MIECHO := 68;
    { KillDispatch at img 0x73B3 and helper at 0x7333 remain OPEN. }
  until MIECHO <> 67;
end;

procedure WejscieNaScene;
{ img 0x750E..0x76C3: inline context 68 }
begin
  WriteLn('TO JEST WEJSCIE NA SCENE NA KTOREJ TANCZY LIROY - UWAZAJ');
  WriteLn('NA SCIANIE WISI !!!TABLICZKA!!!');
  PRZEDM.SCENA;
  { Room command helper at img 0x75AB is not yet identified. }
  repeat
    Write(ENERGIA, '%.', KUNSZT, '>');
    ReadLn(wpisz);
    if wpisz = 'MODE' then PRZEDM.MODE;
    if wpisz = 'EXIT' then begin
      WriteLn('DOSTEPNE WYJSCIA:');
      WriteLn('ZACHOD-PIWIARNIA');
      WriteLn('WSCHOD-SCENA');
      WriteLn('P.S-HEJ DZIECI JESLI CHCECIE ZOBACZYC TAMTEN SWIAT PODLACZCIE SIE DO 1000 WAT');
    end;
    if wpisz = 'WYJSCIE' then begin MIECHO := 193; Exit; end;
    if wpisz = 'ZACHOD' then MIECHO := 67;
    if wpisz = 'WSCHOD' then MIECHO := 69;
    if wpisz = 'PATRZ TABLICZKA' then
      WriteLn('*** NIE UPOWAZNIONYM WSTEP WZBRONIONY *** ');
    { KillDispatch at img 0x7647 is not reconstructed yet. }
  until MIECHO <> 68;
end;

procedure ZaKulisami;
{ img 0x76CD..0x7928: inline context 69 }
begin
  WriteLn('JESTES NA SCENIE , WLASCIWIE TO DOPIERO POCZATEK SCENY');
  WriteLn('WLASCIWIE JESTES JESZCZE ZA KULISAMI BO WIDZOWIE CIE NIE WIDZA');
  if MONSTRA.DJ = 69 then
    WriteLn('D.J PILNUJE ABY WSZYSTKO PRZEBIEGALO ZGODNIE Z PLAYBACKIEM');
  PRZEDM.SCENA;
  repeat
    Write(ENERGIA, '%.', KUNSZT, '>');
    ReadLn(wpisz);
    if wpisz = 'MODE' then PRZEDM.MODE;
    if wpisz = 'EXIT' then begin
      WriteLn('DOSTEPNE WYJSCIA:');
      WriteLn('ZACHOD-WEJSCIE NA SCENE');
      WriteLn('POLODNIE-SCENA');
    end;
    if wpisz = 'ZABIJ D.J' then begin
      if MONSTRA.DJ = 69 then begin
        PRZEDM.BTRUDNO;
        if PRZEDM.WROGEN < 0 then begin
          MONSTRA.DJ := 0;
          PRZEDM.FUKS := Random(100);
          if PRZEDM.FUKS < 25 then begin
            WriteLn('WYCIAGASZ SUCHA RACJA Z CIALA D.J-a');
            PRZEDM.SUCHA := PRZEDM.SUCHA - 10;
            PRZEDM.PRZED := PRZEDM.PRZED + 1;
          end;
          if PRZEDM.FUKS < 3 then begin
            WriteLn('WYCIAGASZ KASETE LIROYA Z CIALA D.J-a');
            WriteLn('!!! PRZEDMIOT UNIQE 3% !!!');
            PRZEDM.kaseta := PRZEDM.kaseta - 10;
            MAXE := MAXE + 5;
            PRO := PRO - 8;
            PRZEDM.PRZED := PRZEDM.PRZED + 1;
            ZRE := ZRE + 1;
          end;
        end;
      end;
    end;
    if wpisz = 'WYJSCIE' then begin MIECHO := 193; Exit; end;
    if wpisz = 'ZACHOD' then MIECHO := 68;
    if wpisz = 'POLODNIE' then MIECHO := 70;
  until MIECHO <> 69;
end;

procedure PrzodSceny;
{ img 0x7932..0x7AB7: inline context 70 }
begin
  WriteLn('ALL RIGHT JESTES NA SCENIE !!! NA TWOJ WIDOK OCHRONIAZE COS MAMROCZA');
  WriteLn('TLUMY CIE PRAKTYCZNIE NIE ZAUWAZAJA BO ICH OCZY SKIEROWANE SA NA LIROYA');
  WriteLn('GDY NAGLE WSROD TLUMU ZAUWAZASZ NIEZLA LALE,JEDNAK ONA KOCHA LIROYA :(');
  PRZEDM.SCENA;
  repeat
    Write(ENERGIA, '%.', KUNSZT, '>');
    ReadLn(wpisz);
    if wpisz = 'MODE' then PRZEDM.MODE;
    if wpisz = 'EXIT' then begin
      WriteLn('DOSTEPNE WYJSCIA:');
      WriteLn('POLNOC-SCENA');
      WriteLn('POLODNIE-SRODEK SCENY');
    end;
    if wpisz = 'WYJSCIE' then begin MIECHO := 193; Exit; end;
    if wpisz = 'POLNOC' then MIECHO := 69;
    if wpisz = 'POLODNIE' then MIECHO := 71;
    PRZEDM.FIGHTSCENA; { img 0x7AA8 -> PRZEDM:0x85C7 }
  until MIECHO <> 70;
end;

procedure SrodekSceny;
{ img 0x7AC1..0x7C2A: inline context 71 }
begin
  WriteLn('LUDZIE SIE NA CIEBIE GAPIA , JESTES NA SRODKU SCENY !!! KTOS CI MOWI:');
  WriteLn('HEY MAN IT,S COOL YEAH! . A TY NA TO: JE JE KUP KUL....');
  PRZEDM.SCENA;
  repeat
    Write(ENERGIA, '%.', KUNSZT, '>');
    ReadLn(wpisz);
    if wpisz = 'MODE' then PRZEDM.MODE;
    if wpisz = 'EXIT' then begin
      WriteLn('DOSTEPNE WYJSCIA:');
      WriteLn('POLNOC-SCENA');
      WriteLn('POLODNIE-SCENA');
    end;
    if wpisz = 'WYJSCIE' then begin MIECHO := 193; Exit; end;
    if wpisz = 'POLNOC' then MIECHO := 70;
    if wpisz = 'POLODNIE' then MIECHO := 72;
    PRZEDM.FIGHTSCENA; { img 0x7C1B -> PRZEDM:0x85C7 }
  until MIECHO <> 71;
end;

procedure TylSceny;
{ img 0x7C34..0x7D69: inline context 72 }
begin
  WriteLn('UFFF PRZEBIEGLES PRZEZ SRODEK SCENY WIEC TREMA CIE JUZ NIE DRECZY');
  WriteLn('DALEJ PISAC NIE MA O CZYM WIEC MOZESZ MI NASKOCZYC ');
  repeat
    Write(ENERGIA, '%.', KUNSZT, '>');
    ReadLn(wpisz);
    if wpisz = 'MODE' then PRZEDM.MODE;
    if wpisz = 'EXIT' then begin
      WriteLn('DOSTEPNE WYJSCIA:');
      WriteLn('POLNOC-SRODEK SCENY');
    end;
    if wpisz = 'WYJSCIE' then begin MIECHO := 193; Exit; end;
    if wpisz = 'POLNOC' then MIECHO := 71;
    PRZEDM.FIGHTSCENA; { img 0x7D5A -> PRZEDM:0x85C7 }
  until MIECHO <> 72;
end;

begin
  { --- TP7 runtime, implicit (file 0x52E0..): img 0xB0CF..0xB0D8 ---
    lcall 1C71:0000 System bootstrap: DS := DGROUP (para 0x1D49), BSS
    zeroed 0x52..0x8EE, CPU probe, heap init; std TextRec init 1C0F:000D. }
  { --- main prologue img 0xB0D9: push bp; mov bp,sp; xor ax,ax --- }
  { heap check: lcall 1C71:02CD }
  Randomize; { GetTime-seeded, lcall 1C71:0C79 }
  WybierzRase; { near-call displacement lands at IP 0x16EF after 16-bit wrap }
  { TextRec init: lcall 1C0F:031A at img 0xB0EB }
  PunktKontrolny; { call 0x51C3 at img 0xB0F0 }
  ZdobadzPoziom; { call 0x872E at img 0xB0F3 }
  { Overload gate: PRZED [0x182] > PRO [0x62] -> overload-print block }
  if PRZED > PRO then begin
    Write('JESTES OBLADOWANY !!! MASZ O ');
    Write(PRZED - PRO, ' ZA DUZO');
    WriteLn('% ENERGI');
    ENERGIA := ENERGIA - ((PRZED - PRO) * 10);
  end;
  { --- img 0xB193 bleed tick; img 0xB1E5 ordered room dispatch --- }
  repeat
    { bleed tick at img 0xB193..0xB1E4 }
    if ILEPOI > 0 then begin
      WriteLn('JESTES ZATRUTY TRACISZ ', Random(5), ' % ENERGI');
      ILEPOI := ILEPOI - 1;
    end;
    { Ordered independent tests, not a case: a room transition can reach a
      later handler in this same pass (img 0xB1E5..0xCC13). }
    if MIECHO = 0 then POKOJ0;
    if MIECHO = 1 then POKOJ1;
    if MIECHO = 2 then Pokoj2; { img 0x548A }
    if MIECHO = 3 then Pokoj3; { img 0x571E }
    if MIECHO = 4 then POKOJ4;
    if MIECHO = 5 then POKOJ5;
    POKOJE; { unconditional dispatcher for contexts 6, 8, 7, and 10 }
    if MIECHO = 9 then Pokoj9; { img 0x5923 }
    if MIECHO = 11 then POKOJ11;
    if MIECHO = 12 then Pokoj12; { img 0x5C36 }
    if MIECHO = 13 then POKOJ13;
    if MIECHO = 14 then Pokoj14;
    if MIECHO = 15 then Pokoj15;
    if MIECHO = 16 then Pokoj16;
    if MIECHO = 17 then Pokoj17;
    if MIECHO = 18 then Pokoj18;
    if MIECHO = 20 then PlacMiejski;
    if MIECHO = 75 then POKOJ75;
    if MIECHO = 30 then POKOJ30;
    if MIECHO = 76 then BarPodDwomaPedalami;
    if (MIECHO >= 77) and (MIECHO <= 82) then OgrodBluszcz;
    if MIECHO = 83 then POKOJ83;
    if MIECHO = 84 then Pokoj84;
    if MIECHO = 87 then Pokoj87;
    if MIECHO = 88 then Pokoj88;
    if MIECHO = 85 then Pokoj85;
    if MIECHO = 86 then Pokoj86;
    if MIECHO = 21 then UlicaSklepikowa;
    if MIECHO = 22 then UlicaDalej;
    if MIECHO = 101 then Droga;
    if MIECHO = 102 then DrogaKamienista;
    if MIECHO = 103 then DrogaKrecona;
    if MIECHO = 100 then POKOJ100;
    if MIECHO = 23 then Piekarnia;
    if MIECHO = 24 then Zbrojownia;
    if MIECHO = 25 then SklepWielobranzowy;
    if MIECHO = 26 then SklepZamkniety;
    if MIECHO = 31 then UlicaDluga;
    if MIECHO = 60 then POKOJ60;
    if MIECHO = 32 then WejscieAreny;
    if MIECHO = 61 then SalaKoncertowa;
    if MIECHO = 62 then BrzegTlumu;
    if MIECHO = 63 then RzadkiTlum;
    if MIECHO = 64 then SrodekTlumu;
    if MIECHO = 65 then BokTlumu;
    if MIECHO = 66 then PrzyBalustradzie;
    if MIECHO = 67 then Piwiarnia;
    if MIECHO = 68 then WejscieNaScene;
    if MIECHO = 69 then ZaKulisami;
    if MIECHO = 70 then PrzodSceny;
    if MIECHO = 71 then SrodekSceny;
    if MIECHO = 72 then TylSceny;
    { Called unconditionally at img 0xEA15; MINIARENA guards contexts 33..57. }
    PRZEDM.MINIARENA;
    { At img 0xF5A1, UNMODE and UM both restore the saved room context. }
    if (MIECHO = 1000) and ((wpisz = 'UNMODE') or (wpisz = 'UM')) then
      MIECHO := PRZEDM.MIECHO2;
    { Reached after leaving MODE: img 0xF5B2 clears the combat flee flag. }
    PRZEDM.PASZOL := 0;
    { Context 193 terminates at img 0xF5C2; otherwise the loop restarts at
      img 0xB0F0, including the save/load checkpoint and level-up gates. }
  until MIECHO = 193;
  { Exit path: System termination at img 0xF5C5 }
end.
