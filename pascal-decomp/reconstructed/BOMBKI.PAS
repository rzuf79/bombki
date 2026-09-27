program BOMBKI;
{ Turbo Pascal 7.0 real-mode main program of BOMBKI.EXE.
  MZ: CS:IP = 0000:B0CF, header paragraphs 0x52E, image length 0x1D4F0;
  img = file[0x52E*16:]. At img 0xB0CF sits lcall 1C71:0000 (System
  bootstrap); program prologue at img 0xB0D9; main loop bleed tick at
  img 0xB193; ordered room dispatch at img 0xB1E5. Backedge img 0xF5BF
  returns to img 0xB0F0. Traced startup order: RECONSTRUCTION-LOG.md
  entries (32), (34). }
uses
  crt, swiat, przedm, monstra, dos;

{ program-level DGROUP workspace:
    ds:0x564  wpisz / command ReadLn buffer (textrec)
  Unit-owned globals live in the SWIAT/PRZEDM/MONSTRA interface vars. }

var
  EtapPunktuKontrolnego: Integer; { invented label for DGROUP word 0x06C }
  StanPotwora14: Integer;   { invented label for BOMBKI DGROUP word 0x05A }
  StanPotwora15: Integer;   { invented label for BOMBKI DGROUP word 0x05C }
  StanPotwora16: Integer;   { invented label for BOMBKI DGROUP word 0x05E }
  StanPotwora17: Integer;   { invented label for BOMBKI DGROUP word 0x060 }
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
{ img 0x16EF..0x1ABD: race selection at game start }
var
  Rasa: string;
begin
  WriteLn('NAPISZ SWA RASE : OLBRZYM , NIMFA , UFOK , CZAROMIL , CZLOWIEK , POL-ELF');
  repeat
    Write('CZLOWIEK');
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
    if (Rasa <> 'CZLOWIEK') and (Rasa <> 'OLBRZYM') and (Rasa <> 'NIMFA') and
       (Rasa <> 'POL-ELF') and (Rasa <> 'UFOK') and (Rasa <> 'CZAROMIL') then
      WriteLn('ALE JAK NARAZIE TYLKO KILKA Z NIECH');
  until (Rasa = 'CZLOWIEK') or (Rasa = 'OLBRZYM') or (Rasa = 'NIMFA') or
        (Rasa = 'POL-ELF') or (Rasa = 'UFOK') or (Rasa = 'CZAROMIL');
  WriteLn('PODAJE SWE IMIE (I TAK MNIE TO NIE OBCHODZI)');
  ReadLn(wpisz);
  ENERGIA := 50;
  PRA := 10;
  EtapPunktuKontrolnego := 12;
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
{ img 0x51C3..0x534A: KUNSZT/level checkpoints with SIL gate }
begin
  if (KUNSZT >= 400) and (EtapPunktuKontrolnego = 0) and (SIL < 20) then begin
    WriteLn('###################!!!CHECKPOINT!!!#########################');
    EtapPunktuKontrolnego := 1;
    LosujPolozenia(0);
  end;
  if (KUNSZT >= 180) and (EtapPunktuKontrolnego = 0) and (SIL < 8) then begin
    WriteLn('###################!!!CHECKPOINT!!!#########################');
    EtapPunktuKontrolnego := 1;
    LosujPolozenia(0);
  end;
  if (KUNSZT >= 360) and (EtapPunktuKontrolnego = 1) and (SIL < 8) then begin
    WriteLn('###################!!!CHECKPOINT!!!#########################');
    EtapPunktuKontrolnego := 2;
    LosujPolozenia(0);
  end;
  if (KUNSZT >= 540) and (EtapPunktuKontrolnego = 2) and (SIL < 8) then begin
    WriteLn('###################!!!CHECKPOINT!!!#########################');
    EtapPunktuKontrolnego := 3;
    LosujPolozenia(0);
  end;
  if (KUNSZT >= 300) and (EtapPunktuKontrolnego = 0) and (SIL >= 7) and (SIL <= 13) then begin
    WriteLn('###################!!!CHECKPOINT!!!#########################');
    EtapPunktuKontrolnego := 1;
    LosujPolozenia(0);
  end;
  if (KUNSZT >= 500) and (EtapPunktuKontrolnego = 1) and (SIL >= 7) and (SIL <= 13) then begin
    WriteLn('###################!!!CHECKPOINT!!!#########################');
    EtapPunktuKontrolnego := 2;
    LosujPolozenia(0);
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

procedure Pokoj2;
{ img 0x548A: inline room 2 (context 2) - POKOJ TRENINGOWY 1 }
begin
  { TODO: transcribe from img 0x548A }
end;

procedure Pokoj3;
{ img 0x571E: inline room 3 (context 3) - PODDZIEMNY POKOJ TRENINGOWY(2) }
begin
  { TODO: transcribe from img 0x571E }
end;

procedure Pokoj9;
{ img 0x5923: inline room 9 (context 9) }
begin
  { TODO: transcribe from img 0x5923 }
end;

procedure Pokoj12;
{ img 0x5C36: inline room 12 (context 12) - KLATKA CIENIASA }
begin
  { TODO: transcribe from img 0x5C36 }
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
{ img 0xC20C..: contexts 0x4D=77, 0x4E=78, 0x4F=79, 0x50=80, 0x51=81, 0x52=82 - BLUSZCZ garden }
begin
  WriteLn('ZNALAZLES SIE WSROD BLUSZCZU , WOKOLO CIEBIE TAJEMNICZE ROSLINY ');
  WriteLn('MUSISZ BARDZO UWAZAC,TU NAWET STOKROTKA MOZE BYC ZABOJCZA');
  PRZEDM.BLUSZCZ; { img 0xC244 -> 0x13629 }
  repeat
    Write(ENERGIA, '%.', KUNSZT, '>');
    ReadLn(wpisz);
    PRZEDM.KOMENDY; { img 0xC2A9 -> 0x1BB07 }
    PRZEDM.FIGHTBLUSZCZ; { img 0xC2AE -> 0x1B5B7 }
    if wpisz = 'MODE' then PRZEDM.MODE;
    if wpisz = 'EXIT' then begin
      WriteLn('DOSTEPNE WYJSCIA:');
      WriteLn('POLNOC-UL.CIEMNA');
      WriteLn('WSCHOD-BLUSZCZ');
      WriteLn('ZACHOD-BLUSZCZ');
      WriteLn('POLODNIE-BLUSZCZ');
    end;
    if wpisz = 'WYJSCIE' then begin
      MIECHO := 193; Exit;
    end;
    if wpisz = 'POLNOC' then MIECHO := 75;
    if wpisz = 'WSCHOD' then MIECHO := 78;
    if wpisz = 'ZACHOD' then MIECHO := 79;
    if wpisz = 'POLODNIE' then MIECHO := 80;
  until (MIECHO < 77) or (MIECHO > 82);
end;

begin
  { --- TP7 runtime, implicit (file 0x52E0..): img 0xB0CF..0xB0D8 ---
    lcall 1C71:0000 System bootstrap: DS := DGROUP (para 0x1D49), BSS
    zeroed 0x52..0x8EE, CPU probe, heap init; std TextRec init 1C0F:000D. }
  { --- main prologue img 0xB0D9: push bp; mov bp,sp; xor ax,ax --- }
  { heap check: lcall 1C71:02CD }
  Randomize; { GetTime-seeded, lcall 1C71:0C79 }
  WybierzRase; { call 0x16EF at img 0xB0E8 }
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
    { ordered SWIAT room dispatch at img 0xB1E5..0xB255 }
    case MIECHO of
      0: POKOJ0;
      1: POKOJ1;
      2: Pokoj2; { img 0x548A }
      3: Pokoj3; { img 0x571E }
      4: POKOJ4;
      5: begin POKOJ5; POKOJE; end;
      9: Pokoj9; { img 0x5923 }
      11: POKOJ11;
      12: Pokoj12; { img 0x5C36 }
      13: POKOJ13;
      14: Pokoj14;
      15: Pokoj15;
      16: Pokoj16;
      17: Pokoj17;
      30: POKOJ30;
      60: POKOJ60;
      75: POKOJ75;
      76: BarPodDwomaPedalami; { BAR POD DWOMA PEDALAMI }
      77, 78, 79, 80, 81, 82: OgrodBluszcz; { BLUSZCZ garden }
      83: POKOJ83;
      100: POKOJ100;
    end;
    { post-room: MODE at img 0xB380/0xC076, WALKA at img 0xB3E0/0xB6A7/0xB870 }
    { MINIARENA for arena grid 33..57 at img 0xEA15 -> PRZEDM.MINIARENA }
    if MIECHO >= 33 then PRZEDM.MINIARENA;
    { UNMODE/UM at img 0xF5A1 restores context from PreviousRoom }
    { PASZOL reset at img 0xF5B2 }
    { context 193 terminates at img 0xF5C2 }
  until MIECHO = 193;
  { Exit path: System termination at img 0xF5C5 }
end.
