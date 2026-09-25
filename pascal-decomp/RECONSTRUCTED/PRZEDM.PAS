unit PRZEDM;
{ checksum = $647E }
interface

uses  dos, monstra, crt, System;

  MMIECZ: Integer;
  MIECHO2: Integer;
  PRZED: Integer;
  MTARCZA: Integer;
  SERCE: Integer;
  DYPLOM: Integer;
  FAJKA: Integer;
  MAD: Integer;
  SIL: Integer;
  ZRE: Integer;
  MBUTELKA: Integer;
  PRA: Integer;
  MAXMAD: Integer;
  MAXSIL: Integer;
  MAXZRE: Integer;
  ENERGIA: Integer;
  FUKS: Integer;
  PACZEK: Integer;
  CIASTKO: Integer;
  SUCHA: Integer;
  CHLEB: Integer;
  BULKA: Integer;
  WEKA: Integer;
  MANA: Integer;
  MAXMANA: Integer;
  WROGEN: Integer;
  TEST1: Integer;
  MINIKUNSZT: Integer;
  WROGSIL: Integer;
  WROGZRE: Integer;
  ON: Integer;
  TY: Integer;
  SZANSA: Integer;
  WPYSK: Integer;
  PRO: Integer;
  ILOSC: Integer;
  PAR: Integer;
  KOP: Integer;
  KOPM: Integer;
  KOPHP: Integer;
  ZWIEJ: Integer;
  WIMP: Integer;
  PASZOL: Integer;
  KUNSZT: Integer;
  MIECHO: Integer;
  ARENA: Integer;
  KORNIK: Integer;
  MUCHA: Integer;
  BAKTERIA: Integer;
  SLIMAK: Integer;
  ZUK: Integer;
  KARALUCH: Integer;
  MROWKA: Integer;
  PAJAK: Integer;
  DZIK: Integer;
  SZCZUR: Integer;
  LIS: Integer;
  KUROPATWA: Integer;
  ZAJAC: Integer;
  WILCZUR: Integer;
  ORZEL: Integer;
  SARNA: Integer;
  SLON: Integer;
  LEW: Integer;
  ZYRAFA: Integer;
  WIELBLAD: Integer;
  STRUS: Integer;
  BOA: Integer;
  WILK: Integer;
  BIZON: Integer;
  PANTERA: Integer;
  GLADIATOR: Integer;
  WOJOWNIK: Integer;
  TRENER: Integer;
  CZY: Integer;
  STOP: Integer;
  KOMPLET: Integer;
  CIALO: Integer;
  FORSA: Longint;
  PRZEPUSTKA: Longint;
  GARNITUR: Integer;
  FUKSROLL: Integer;
  GITARZYSTA: Integer;
  PERKUSISTA: Integer;
  ORGANISTA: Integer;
  LIROY: Integer;
  kaseta: Integer;
  SCROLLPOR: Integer;
  SZCZAW: Integer;
  STOKROTKA: Integer;
  KONICZYNKA: Integer;
  MLECZ: Integer;
  DMUCHAWIEC: Integer;
  ROZA: Integer;
  JEZYNA: Integer;
  OSET: Integer;
  AGREST: Integer;
  MALINA: Integer;
  TRAWA: Integer;
  QUEST: Integer;
  QUESTWYK: Integer;
  DZIECKO: Shortint;
  WARIAT: Shortint;
  SLUCHACZ: Shortint;
  FAN: Shortint;
  CZLOWIEK: Shortint;
  POLICJANT: Shortint;
  OCHRONIARZ: Shortint;
  DZIADEK: Shortint;
  GORYL: Shortint;
  PLECAK: Shortint;
  REPORTER: Shortint;
  PIGULKA: Shortint;
  POTRAWKI: Shortint;
  BIGOS: Shortint;
  NOZYCE: Shortint;
  LISTEK: Shortint;
  POZIOM: Shortint;
  POR: Shortint;
  FIREBALL: Shortint;
  POISON: Shortint;
  ILEPOI: Shortint;
  DUNCAN: Shortint;
  DUNQ: Shortint;
  JAKIEUB: string;
  JAKABRON: string;
  JAKATAR: string;
  plik: Text;
  wpisz: string;
  procedure BRANIE;
  { Proc $0008 Entry 208:023F }
  procedure UZYWANIE;
  { Proc $0010 Entry 216:07C6 }
  procedure PIERDOLY;
  { Proc $0018 Entry 224:003B }
  procedure TARCZA;
  { Proc $0020 Entry 192:0022 }
  procedure WALKA;
  { Proc $0028 Entry 200:04EC }
  procedure MINIARENA;
  { Proc $0030 Entry 232:0299 }
  procedure KTO;
  { Proc $0038 Entry 184:0523 }
  procedure MODE;
  { Proc $0040 Entry 160:0000 }
  procedure SLABO;
  { Proc $0048 Entry 40:0047 }
  procedure MNIEJSLABO;
  { Proc $0050 Entry 48:0038 }
  procedure SREDNIO;
  { Proc $0058 Entry 56:0038 }
  procedure TRUDNO;
  { Proc $0060 Entry 64:0038 }
  procedure BTRUDNO;
  { Proc $0068 Entry 96:0038 }
  procedure VEASY;
  { Proc $0070 Entry 72:0038 }
  procedure EASY;
  { Proc $0078 Entry 80:0038 }
  procedure NEASY;
  { Proc $0080 Entry 88:0038 }
  procedure GARNITURZYSK;
  { Proc $0088 Entry 120:0049 }
  procedure PIGULKAZYSK;
  { Proc $0090 Entry 128:004E }
  procedure KASETAZYSK;
  { Proc $0098 Entry 136:004E }
  procedure LISTEKZYSK;
  { Proc $00A0 Entry 144:0054 }
  procedure SCROLLPORZYSK;
  { Proc $00A8 Entry 152:0034 }
  procedure SCENA;
  { Proc $00B0 Entry 168:00D3 }
  procedure FIGHTSCENA;
  { Proc $00B8 Entry 240:0077 }
  procedure TLUM;
  { Proc $00C0 Entry 176:01C8 }
  procedure POTWORY;
  { Proc $00C8 Entry 8:0000 }
  procedure BLUSZCZ;
  { Proc $00D0 Entry 32:02E3 }
  procedure KOMENDY;
  { Proc $00D8 Entry 256:0043 }
  procedure FIGHTBLUSZCZ;
  { Proc $00E0 Entry 248:0522 }
  procedure WALKAPIES;
  { Proc $00E8 Entry 0:0046 }
  procedure ULSKLEPIKOWA;
  { Proc $00F0 Entry 112:0209 }
  procedure POROWNANIE;
  { Proc $00F8 Entry 104:0816 }
  procedure TRAIN;
  { Proc $0100 Entry 16:00E3 }
  procedure save;
  { Proc $0108 Entry 264:0000 }
implementation

procedure WALKAPIES;
begin
  WROGEN := 10;
  WROGZRE := 10;
  WROGSIL := 5;
  WALKA;
  CZY := Random(15);
  WriteLn('WYCIAGASZ ', CZY, ' MONET Z CIALA PSA');
  FORSA := FORSA + CZY;
  if SERCE = 0 then begin
    FUKS := Random(20);
    if FUKS < 5 then begin
      SERCE := MIECHO;
      WriteLn('WYCIAGASZ ZAKRWAWIONE SERCE Z CIALA PSA');
    end;
  end;
end;

procedure SLABO;
begin
  WROGEN := 1;
  WROGZRE := 1;
  WROGSIL := 2;
  WALKA;
  if PASZOL = 0 then begin
    CZY := Random(3);
    WriteLn('WYCIAGASZ ', CZY, ' MONET Z CIALA');
    FORSA := FORSA + CZY;
    if wpisz = 'ZABIJ MROWKA' then begin
      FUKS := Random(10);
      if (FUKS < 7) and (PACZEK <> -10) then begin
        WriteLn('WYCIAGASZ PACZEK Z CIALA MROWKI');
        PACZEK := -10;
        PRZED := PRZED + 1;
      end;
    end;
  end;
end;

procedure MNIEJSLABO;
begin
  WROGEN := Random(3) + 34;
  WROGZRE := Random(4) + 8;
  WROGSIL := 10;
  WALKA;
  if PASZOL = 0 then begin
    CZY := Random(21) + 10;
    WriteLn('WYCIAGASZ ', CZY, ' MONET Z CIALA');
    FORSA := FORSA + CZY;
    if SERCE = 0 then begin
      FUKS := Random(20);
      if (FUKS < 5) and (SERCE <> -10) then begin
        WriteLn('WYCIAGASZ SERCE Z CIALA TRUPA');
        SERCE := -10;
        PRZED := PRZED + 1;
      end;
    end;
  end;
end;

procedure SREDNIO;
begin
  WROGEN := Random(5) + 50;
  WROGZRE := Random(5) + 10;
  WROGSIL := Random(2) + 13;
  WALKA;
  if PASZOL = 0 then begin
    CZY := Random(30) + 30;
    WriteLn('WYCIAGASZ ', CZY, ' MONET Z CIALA');
    FORSA := FORSA + CZY;
    if SERCE = 0 then begin
      FUKS := Random(20);
      if (FUKS < 7) and (SERCE <> -10) then begin
        WriteLn('WYCIAGASZ SERCE Z CIALA TRUPA');
        SERCE := -10;
        PRZED := PRZED + 1;
      end;
    end;
  end;
end;

procedure TRUDNO;
begin
  WROGEN := Random(6) + 60;
  WROGZRE := Random(3) + 12;
  WROGSIL := Random(3) + 15;
  WALKA;
  if PASZOL = 0 then begin
    CZY := Random(40) + 20;
    WriteLn('WYCIAGASZ ', CZY, ' MONET Z CIALA');
    FORSA := FORSA + CZY;
    if SERCE = 0 then begin
      FUKS := Random(20);
      if (FUKS < 7) and (SERCE <> -10) then begin
        WriteLn('WYCIAGASZ SERCE Z CIALA TRUPA');
        SERCE := -10;
        PRZED := PRZED + 1;
      end;
    end;
  end;
end;

procedure VEASY;
begin
  WROGEN := Random(10) + 90;
  WROGZRE := Random(2) + 14;
  WROGSIL := Random(2) + 17;
  WALKA;
  if (PASZOL = 0) and (ENERGIA > 0) then begin
    CZY := Random(55) + 10;
    WriteLn('WYCIAGASZ ', CZY, ' MONET Z CIALA');
    FORSA := FORSA + CZY;
    if SERCE = 0 then begin
      FUKS := Random(20);
      if (FUKS < 4) and (SERCE <> -10) then begin
        WriteLn('WYCIAGASZ SERCE Z CIALA TRUPA');
        SERCE := -10;
        PRZED := PRZED + 1;
      end;
    end;
  end;
end;

procedure EASY;
begin
  WROGEN := Random(20) + 100;
  WROGZRE := 16;
  WROGSIL := Random(2) + 18;
  WALKA;
  if (PASZOL = 0) and (ENERGIA > 0) then begin
    CZY := Random(30) + 30;
    WriteLn('WYCIAGASZ ', CZY, ' MONET Z CIALA');
    FORSA := FORSA + CZY;
    if SERCE = 0 then begin
      FUKS := Random(20);
      if (FUKS < 4) and (SERCE <> -10) then begin
        WriteLn('WYCIAGASZ SERCE Z CIALA TRUPA');
        SERCE := -10;
        PRZED := PRZED + 1;
      end;
    end;
  end;
end;

procedure NEASY;
begin
  WROGEN := Random(20) + 130;
  WROGZRE := 20;
  WROGSIL := Random(2) + 19;
  WALKA;
  if (PASZOL = 0) and (ENERGIA > 0) then begin
    CZY := Random(45) + 20;
    WriteLn('WYCIAGASZ ', CZY, ' MONET Z CIALA');
    FORSA := FORSA + CZY;
    if SERCE = 0 then begin
      FUKS := Random(20);
      if (FUKS < 4) and (SERCE <> -10) then begin
        WriteLn('WYCIAGASZ SERCE Z CIALA TRUPA');
        SERCE := -10;
        PRZED := PRZED + 1;
      end;
    end;
  end;
end;

procedure BTRUDNO;
begin
  WROGEN := Random(3) + 72;
  WROGZRE := Random(2) + 13;
  WROGSIL := Random(2) + 16;
  WALKA;
  if PASZOL = 0 then begin
    CZY := Random(50) + 15;
    WriteLn('WYCIAGASZ ', CZY, ' MONET Z CIALA');
    FORSA := FORSA + CZY;
    if SERCE = 0 then begin
      FUKS := Random(20);
      if (FUKS < 5) and (SERCE <> -10) then begin
        WriteLn('WYCIAGASZ SERCE Z CIALA TRUPA');
        SERCE := -10;
        PRZED := PRZED + 1;
      end;
    end;
  end;
end;

procedure GARNITURZYSK;
begin
  FUKS := Random(1000);
  if FUKS <= 25 then begin
    WriteLn('ZYSKUJESZ GARNITUR !!!! Z CIALA WROGA !!!!');
    WriteLn('PRZEDMIOT UNIQE !!! 2.5% !!! ');
    GARNITUR := GARNITUR - 10;
    PRZED := PRZED + 1;
  end;
end;

procedure PIGULKAZYSK;
begin
  FUKS := Random(1000);
  if FUKS <= 42 then begin
    WriteLn('HMMM , A TO CO ? , TOZ TO !!! PIGULKA TRANSPORTUJACA !!! PROSTO Z CIALA WROGA');
    PIGULKA := PIGULKA - 10;
    PRZED := PRZED + 1;
  end;
end;

procedure KASETAZYSK;
begin
  FUKS := Random(100);
  if (FUKS < 2) and (MIECHO <> 10000) then begin
    WriteLn('WYCIAGASZ KASETE LIROYA Z CIALA BIEDNEGO CZLOWIEKA');
    WriteLn('!!! PRZEDMIOT UNIQE 2% !!!');
    kaseta := kaseta - 10;
    MAXE := MAXE + 5;
    PRO := PRO - 8;
    PRZED := PRZED + 1;
    ZRE := ZRE + 1;
  end;
end;

procedure LISTEKZYSK;
begin
  FUKS := Random(100);
  if (FUKS < 6) and (MIECHO <> 10000) then begin
    WriteLn('WYCIAGASZ LISTEK SZCZESCIA Z CIALA WROGIEJ TOBIE POSTACI');
    WriteLn('!!! PRZEDMIOT UNIQE 4% !!!');
    LISTEK := LISTEK - 10;
    PRZED := PRZED + 1;
    MAXMANA := MAXMANA + 40;
  end;
end;

procedure SCROLLPORZYSK;
begin
  FUKS := Random(100);
  if (FUKS < 10) and (MIECHO <> 10000) then begin
    WriteLn('WYCIAGASZ SCROLL POROWNANIA Z WROGIEJ TOBIE POSTACI');
    SCROLLPOR := SCROLLPOR - 10;
    PRZED := PRZED + 1;
  end;
end;

procedure MODE;
begin
  MIECHO2 := MIECHO;
  MIECHO := 1000;
end;

procedure SCENA;
begin
  if GITARZYSTA = MIECHO then
    WriteLn('GITARZYSTA GRA TU NA WYSOKIM CE-DUR');
  if PERKUSISTA = MIECHO then
    WriteLn('PERKUSISTA TLUCZE TU NIEMILOSIERNIE (W) TALEZE I BEBNY');
  if ORGANISTA = MIECHO then
    WriteLn('ORGANISTA KORZYSTA Z 8 CIASIO NARAZ PODLĄCZONYCH DO SIECI');
  if LIROY = MIECHO then
    WriteLn('MAGA BOSS TEJ PLANSZY - LIROY SPIEWA JEDEN ZE SWOICH KAWALKOW');
end;

procedure TLUM;
begin
  if DZIECKO = MIECHO then
    WriteLn('MILE DZIECKO POWTARZA NAJLEPSZE KAWALKI LIROYA');
  if WARIAT = MIECHO then
    WriteLn('WARIAT SIE CIESZY ZE NIE TYLKO ON JEST WARIATEM');
  if SLUCHACZ = MIECHO then
    WriteLn('SLUCHACZ SLUCHA');
  if FAN = MIECHO then
    WriteLn('FAN LIROYA ZAPUSCIL SOBIE BRODKE JAK LIROY I MA PODJAR');
  if CZLOWIEK = MIECHO then
    WriteLn('NORMALNY CZLOWIEK PRZYSZEDL POSLUCHAC LIROYA(DZIWNE NIE)?');
  if POLICJANT = MIECHO then
    WriteLn('ZALANY POLICJANT STARA SIE PELNIC SWA SLUZBE');
  if OCHRONIARZ = MIECHO then
    WriteLn('OCHRONIARZ ZABIJA KAZDEGO KTO PRZEJDZIE PRZEZ BALUSTRADKI');
  if GORYL = MIECHO then
    WriteLn('PRYWATNY GORYL LIROYA JE BANANA ');
  if DZIADEK = MIECHO then
    WriteLn('DZIADEK NIESTESTY NIE SKACZE DO GORY JAK KANGURY');
  if REPORTER = MIECHO then
    WriteLn('REPORTER UWAZNIE ZAPISUJE WSZYSTKIE WULGARYZMY');
end;

  (* Remaining bodies are still to be reconstructed from the retained TPU
     listings and BOMBKI.EXE disassembly. *)
begin
  { unit-initialization: runs once at program start }
end.
