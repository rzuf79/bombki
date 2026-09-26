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

procedure SMIERC;
begin
  WriteLn('AJAJAJAJ TWOJA GLOWA NAWALA JAK TESCIOWA!!!');
  WriteLn('NIC NA TO NIE PORADZE , TRZEBA BYLO SIE STARAC');
  WriteLn('NAGLE REFLEKSJA - DO JASNEJ CENZURY JAK SIE WALCZYLO TYM MIECZEM?');
  WriteLn('NIESTETY WRAZ ZE SMIERCIA TRACISZ KUNSZT ADEKWATNIE DO TWOJEGO LEVELKA');
  WriteLn('POJAWISZ SIE W CENTRUM MIASTA ..... POWODZENIA');
  WriteLn('P.S : AHA POTWORY SIE ODREGENEROWALY');
  if QUEST = 1 then
    QUESTWYK := 50;
  if QUEST > 1 then
    QUESTWYK := 200;
  ENERGIA := MONSTRA.MAXE;
  KUNSZT := KUNSZT - 250 + Random(50) - 5 * POZIOM;
  MIECHO := 20;
  POTWORY;
  wpisz := 'PAMIETAJ';
  save;
  ReadLn;
end;

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

procedure FIGHTSCENA;
begin
  if (wpisz = 'ZABIJ PERKUSISTA') and (PERKUSISTA = MIECHO) then begin
    VEASY;
    PERKUSISTA := 0;
    KASETAZYSK;
  end;
  if (wpisz = 'ZABIJ GITARZYSTA') and (GITARZYSTA = MIECHO) then begin
    VEASY;
    GITARZYSTA := 0;
    KASETAZYSK;
  end;
  if (wpisz = 'ZABIJ LIROY') and (LIROY = MIECHO) then begin
    NEASY;
    if (MIECHO <> 10000) and (ENERGIA > 0) and (PASZOL = 0) then begin
      WriteLn('GRATULACJE !!! ZABILES LIROYA DOSTAJESZ ZA DARMO 30 KASY');
      FORSA := FORSA + 30;
      KASETAZYSK;
      if QUEST > 1 then
        QUESTWYK := QUESTWYK - 150;
      LIROY := 0;
    end;
  end;
  if (wpisz = 'ZABIJ ORGANISTA') and (ORGANISTA = MIECHO) then begin
    VEASY;
    ORGANISTA := 0;
    KASETAZYSK;
  end;
end;

procedure FIGHTBLUSZCZ;
begin
  if (wpisz = 'ZABIJ DUNCAN') and (DUNCAN = MIECHO) then begin
    EASY;
    if WROGEN < 1 then
      DUNCAN := 0;
  end;
  if (wpisz = 'SECRET LISTA') and (DUNCAN = MIECHO) then begin
    WriteLn('OTO CO AKTUALNIE MAM DO ZAOFEROWANIA : PAMIETAJ U MNIE TYLKO KUPUJEMY');
    WriteLn('MARCHEWKA Z SADU DUNCANA   : 7000');
    WriteLn('PRZEPUSTKA QUEST-MASTERA   :  400');
    WriteLn('PLECAK                     : 4800');
  end;
  if wpisz = 'KUP DOKUMENT' then begin
    if FORSA > 399 then begin
      WriteLn('OTO PODROBIONA PRZEPUSTKA HE , HE NAWET QUEST-MASTER SIE NIE POKAPUJE');
      PRZEPUSTKA := PRZEPUSTKA - 10;
      FORSA := FORSA - 400;
      PRZED := PRZED + 1;
    end;
  end;
  if (wpisz = 'KUP PLECAK') and (DUNCAN = MIECHO) then begin
    if FORSA > 4799 then begin
      WriteLn('HE HE HE MILO SIE Z TOBA ROBI INTERESY');
      FORSA := FORSA - 4800;
      PLECAK := PLECAK - 10;
      PRZED := PRZED + 1;
    end;
  end;
  if (wpisz = 'ROZMAWIAJ DUNCAN') and (DUNCAN = MIECHO) then begin
    if DUNQ = 0 then begin
      WriteLn('UCH A COZ TO ZA STRASZNA ROSLINA - PRZELAKL SIE DUNCAN WIDZAC CIEBIE');
      WriteLn('AAA TO JAKIS WAL A NIE ROSLINA , MOWI PO CHWILI,JAK CI SIE NUDZI TO ');
      WriteLn('MOZESZ POMOC MI WYRYWAC CHWASTY , SZCZEGOLNIA ZABOJCZA DLA MOICH MARCHEWECZEK');
      WriteLn('JEST TA WREDNA POKRZYWA , SZKODA ZE TAK JAK INNE POTWORY SIE ODREGENEROWUJE');
      WriteLn('ALE JAK JA ZABIJESZ , POWIEDZMY ... 4 RAZY TO MOZE DA SOBIE SPOKOJ');
      WriteLn('CO CI DAM W ZAMIAN ? TROCHE KUNSZTU , A MOJ STARY PRACUJE NA CZARNYM RYNKU');
      DUNQ := 75;
    end;
    if DUNQ <> 0 then
      WriteLn('TO CO ZABIJESZ TE ROSLINY CZY BEDZIEMY TU STAC JAK OSTATNIE LOSIE?');
    if DUNQ = -125 then begin
      WriteLn('DZIEKI DZIEKI , TO BYLA DOBRA ROBOTA , OD TERAZ MOZESZ PISAC PRZY MNIE :');
      WriteLn('SECRET LISTA , TO MOZE AKURAT BEDE COS MIAL NA ZBYCIU , ADIOS');
      DUNQ := 0;
      KUNSZT := KUNSZT + 125;
      WriteLn('--------- ZDOBYLES 125 KUNSZTU ------------------------');
    end;
  end;
  if (wpisz = 'ZABIJ SZCZAW') and (SZCZAW = MIECHO) then begin
    VEASY;
    SZCZAW := 0;
  end;
  if (wpisz = 'ZABIJ STOKROTKA') and (STOKROTKA = MIECHO) then begin
    VEASY;
    if ENERGIA > 0 then
      STOKROTKA := 0;
  end;
  if (wpisz = 'ZABIJ KONICZYNKA') and (KONICZYNKA = MIECHO) then begin
    VEASY;
    KONICZYNKA := 0;
  end;
  if (wpisz = 'ZABIJ MLECZ') and (MLECZ = MIECHO) then begin
    VEASY;
    MLECZ := 0;
  end;
  if (wpisz = 'ZABIJ DMUCHAWIEC') and (DMUCHAWIEC = MIECHO) then begin
    VEASY;
    DMUCHAWIEC := 0;
  end;
  if (wpisz = 'ZABIJ ROZA') and (ROZA = MIECHO) then begin
    EASY;
    if ENERGIA > 0 then
      ROZA := 0;
  end;
  if (wpisz = 'ZABIJ OSET') and (OSET = MIECHO) then begin
    EASY;
    if ENERGIA > 0 then
      OSET := 0;
  end;
  if (wpisz = 'ZABIJ MALINA') and (MALINA = MIECHO) then begin
    EASY;
    if ENERGIA > 0 then
      MALINA := 0;
  end;
  if (wpisz = 'ZABIJ AGREST') and (AGREST = MIECHO) then begin
    EASY;
    if ENERGIA > 0 then
      AGREST := 0;
  end;
  if (wpisz = 'ZABIJ JEZYNA') and (JEZYNA = MIECHO) then begin
    EASY;
    if ENERGIA > 0 then
      JEZYNA := 0;
  end;
  if (wpisz = 'ZABIJ TRAWA') and (TRAWA = MIECHO) then begin
    WriteLn('HA HA HA WOLAJA SETKI LISCI TRAWY - TO BEDZIE WALKA');
    TRUDNO;
    if ENERGIA > 0 then
      TRUDNO;
    if ENERGIA > 0 then
      TRUDNO;
    if ENERGIA > 0 then
      TRUDNO;
    if (ENERGIA > 0) and (PASZOL = 0) then
      WriteLn('UFF STRUDZONY POSTANAWIASZ ODPOCZAC TYLU PRZECIWNIKOW DAWNO NIE WIDZIALES');
  end;
end;

procedure ULSKLEPIKOWA;
begin
  if MONSTRA.JAMNIK = MIECHO then
    WriteLn('DLUGI JAMNIK GRYZIE CI PODESZWY');
  if MONSTRA.OWCZAREK = MIECHO then
    WriteLn('PUCHATY OWCZAREK WYLEGUJE SIE W SLONCU');
  if MONSTRA.PIESEK = MIECHO then
    WriteLn('PIESEK SZUKA DRZEWKA ABY ULZYC SOBIE');
  if MONSTRA.SPANIEL = MIECHO then
    WriteLn('SPANIEL SLINI SIE AZ MILO');
  if MONSTRA.PUDEL = MIECHO then
    WriteLn('PUDEL JE KITIKET WIEC CHYBA MU NIE PRZERWIESZ.....?');
  if MONSTRA.TAKSOWKARZ = MIECHO then
    WriteLn('TAKSOWKARZ WTARGNA TU ZE SWOJA BRYKA , I CZEKA NA KLIENTOW');
  if MONSTRA.SPRZEDAWCA = MIECHO then
    WriteLn('SPRZEDAWCA PRECELKOW WLASNIE SPRZEDAL OSTATNIEGO , CZYM DOPROWADZA DO SZALENSTWA LATAJACE WOKOLO NIEGO KRUKI');
  if MONSTRA.ZAMIATACZ = MIECHO then
    WriteLn('ZAMIATACZ ULIC SPRAWIA ZE JEST TU CZYSTO JAK W CHLEWIE');
  if MONSTRA.PIJAK = MIECHO then
    WriteLn('PIJAK TU STOI(DOBRE SOBIE) I SMIERDZI MU Z GEBY');
  if MONSTRA.ZEBRAK = MIECHO then
    WriteLn('ZEBRAK UDOWADNIA PRZECHODNIOM ZE ON NAPRAWDE JEST CHORY NA AIDS');
end;

procedure POROWNANIE;
begin
  if MANA > 9 then begin
    FUKS := Random(100);
    WriteLn('KOGO CHCESZ ZE SOBA POROWNAC?');
    ReadLn(wpisz);
    MONSTRA.OGOL := POZIOM + SIL;
    if (ZRE = 8) or (ZRE = 9) then
      MONSTRA.OGOL := MONSTRA.OGOL + 4;
    if (ZRE = 10) or (ZRE = 11) then
      MONSTRA.OGOL := MONSTRA.OGOL + 5;
    if (ZRE = 12) or (ZRE = 13) then
      MONSTRA.OGOL := MONSTRA.OGOL + 6;
    if (ZRE = 14) or (ZRE = 15) then
      MONSTRA.OGOL := MONSTRA.OGOL + 7;
    if (ZRE = 16) or (ZRE = 17) then
      MONSTRA.OGOL := MONSTRA.OGOL + 8;
    if (ZRE = 18) or (ZRE = 19) then
      MONSTRA.OGOL := MONSTRA.OGOL + 9;
    if (ZRE = 20) or (ZRE = 21) then
      MONSTRA.OGOL := MONSTRA.OGOL + 10;
    if PAR > 75 then
      MONSTRA.OGOL := MONSTRA.OGOL + 1;
    if PAR > 50 then
      MONSTRA.OGOL := MONSTRA.OGOL + 1;
    if KOP > 10 then
      MONSTRA.OGOL := MONSTRA.OGOL + 2;
    if KOP > 70 then
      MONSTRA.OGOL := MONSTRA.OGOL + 2;
    if (wpisz = 'DZIK') or (wpisz = 'SZCZUR') or (wpisz = 'LIS') or
       (wpisz = 'KUROPATWA') or (wpisz = 'ZAJAC') or (wpisz = 'WILCZUR') or
       (wpisz = 'ORZEL') or (wpisz = 'SARNA') or (wpisz = 'DZIECKO') or
       (wpisz = 'DZIADEK') then begin
      if MONSTRA.OGOL < 16 then
        WriteLn('NICZEGO NIE MOGE ZAGWARANTOWAC ..... MACIE PODOBNE PARAMETRY');
      if (SIL > 15) and (SIL < 19) then
        WriteLn('PRZECIWNIK GODNY TWEJ DUMY , RACZEJ NIE POGRASZ');
      if SIL > 18 then
        WriteLn('WSTYD MI ZA CIEBIE ... JESZCZE TU JESTES ! NA CO CZEKASZ ? KILLUJ');
    end;
    if (wpisz = 'SLON') or (wpisz = 'LEW') or (wpisz = 'ZYRAFA') or
       (wpisz = 'WIELBLAD') or (wpisz = 'STRUS') or (wpisz = 'BOA') or
       (wpisz = 'WILK') or (wpisz = 'BIZON') or (wpisz = 'PANTERA') or
       (wpisz = 'WARIAT') or (wpisz = 'SLUCHACZ') or (wpisz = 'FAN') or
       (wpisz = 'CZLOWIEK') or (wpisz = 'REPORTER') then begin
      if MONSTRA.OGOL < 16 then
        WriteLn('TAK  TAK MAMA KUPI BERECIK GLOWKA W PORZADKU ? ');
      if (SIL > 15) and (SIL < 21) then
        WriteLn(' NA TWOIM MIEJSCU BYM SIE NIE ZAPUSZCZAL ');
      if (SIL > 20) and (SIL < 23) then
        WriteLn(' RYZYK FIZYK - TAK NA 50% - WALKA NA SMIERC I ZYCIE');
      if SIL > 22 then
        WriteLn('SPOX KILLUJ BEZ UPRZEDZEN');
    end;
    if (wpisz = 'GLADIATOR') or (wpisz = 'WOJOWNIK') or (wpisz = 'TRENER') or
       (wpisz = 'POLICJANT') or (wpisz = 'GORYL') or (wpisz = 'OCHRONIARZ') then begin
      if MONSTRA.OGOL < 15 then
        WriteLn('HA HA NIE NA SERJO . DAJ SE W ZYLE OKI? TO DOWCIP? HA HA HA');
      if (MONSTRA.OGOL > 14) and (MONSTRA.OGOL < 18) then
        WriteLn('POMARZ SOBIE WARIACIE . MOZE CI SIE PRZYSNI');
      if (MONSTRA.OGOL > 17) and (MONSTRA.OGOL < 23) then
        WriteLn('POWIEM  BEZ OGRODEK-TO GLUPI POMYSL');
      if (MONSTRA.OGOL > 22) and (MONSTRA.OGOL < 26) then
        WriteLn('TO DOSC RYZYKOWNE ZE TAK POWIEM');
      if MONSTRA.OGOL > 25 then
        WriteLn('TO BEDZIE TAK PROSTE JAK ZABICIE DZIECKA TOPOREM !!!');
    end;
    if (wpisz = 'MINI-BARMAN') or (wpisz = 'GRUBAS') or (wpisz = 'D.J') then begin
      if MONSTRA.OGOL < 24 then
        WriteLn('SMIERC PODZIEKUJE CI ZA TWOJ DAR (ALE ZGAPIAM)');
      if (MONSTRA.OGOL > 23) and (MONSTRA.OGOL < 26) then
        WriteLn('NIE UDAWAJ BISTY-BOYS PRZEGRASZ NA 99%');
      if (MONSTRA.OGOL > 25) and (MONSTRA.OGOL < 29) then
        WriteLn('PERFEKCYJNY MECZ NA SMIERC I ZYCIE !!!');
      if MONSTRA.OGOL > 28 then
        WriteLn('JESTES ZNACZNIE SILNIEJSZY !!!(ALE GLUPSZY)');
      if MONSTRA.OGOL > 34 then
        WriteLn('UWAZAJ DOSTANIESZ MALO KUNSZTU !!!');
    end;
    if (wpisz = 'TAKSOWKARZ') or (wpisz = 'SPRZEDAWCA') or (wpisz = 'GITARZYSTA') or
       (wpisz = 'PERKUSISTA') or (wpisz = 'ORGANISTA') or (wpisz = 'ZEBRAK') or
       (wpisz = 'PIJAK') or (wpisz = 'ZAMIATACZ') or (wpisz = 'SZCZAW') or
       (wpisz = 'STOKROTKA') or (wpisz = 'KONICZYNKA') or (wpisz = 'MLECZ') or
       (wpisz = 'DMUCHAWIEC') then begin
      if MONSTRA.OGOL < 21 then
        WriteLn('NIE');
      if (MONSTRA.OGOL > 22) and (MONSTRA.OGOL < 28) then
        WriteLn('RACZEJ NIE , CHOC MOZNA ZARYZYKOWAC(NIE POLECAM)');
      if MONSTRA.OGOL > 27 then
        WriteLn('TAK');
    end;
    if (wpisz = 'PEDAL') or (wpisz = 'PARA') or (wpisz = 'MACIEK') or
       (wpisz = 'ROZA') or (wpisz = 'MALINA') or (wpisz = 'TRAWA') or
       (wpisz = 'AGREST') or (wpisz = 'JEZYNA') then begin
      if MONSTRA.OGOL < 20 then
        WriteLn('WIERZ MI ALE TO NAPRAWDE WIERZ MI ZE NIE MASZ SZANS');
      if (MONSTRA.OGOL > 19) and (MONSTRA.OGOL < 26) then
        WriteLn('RACZEJ NIE WYGRASZ WIEC LEPIEJ NIE ATAKUJ');
      if (MONSTRA.OGOL > 25) and (MONSTRA.OGOL < 30) then
        WriteLn('JESTESCIE SOBIE ROWNI (NAPRAWDE !!!) - WIEC 50% SZANS');
      if MONSTRA.OGOL > 29 then
        WriteLn('JESTES SILNIEJSZY STAD WNIOSEK ZE SOBIE PORADZISZ');
      if MONSTRA.OGOL > 35 then
        WriteLn('P.S - JESTES DUZO DUZO SILNIEJSZY ZABIJ BEZ OGRODEK!!!');
    end;
    if wpisz = 'LIROY' then begin
      if MONSTRA.OGOL < 28 then
        WriteLn('HAHAHAHAHAHAHAHAHAHHAHOHOHOHHOHOHOHOHOHOHOHOAHAHAHAHAHAHAH');
      if (MONSTRA.OGOL > 27) and (MONSTRA.OGOL < 33) then
        WriteLn('HIHIHIHIHIHIHIHHEHEHEHE :))))))');
      if (MONSTRA.OGOL > 32) and (MONSTRA.OGOL < 44) then
        WriteLn('SPROOBÓJ A MOŻE WYGRAC SIE UDA......');
      if (MONSTRA.OGOL > 43) and (MONSTRA.OGOL < 48) then
        WriteLn('NIE PRZEJMUJ SIE JEGO MORDĄ JESTES SILNIEJSZY I BASTA');
      if MONSTRA.OGOL > 47 then
        WriteLn('UWAZAJ ... NA CHLAPIACE MOZGI FLAKI PRZECIWNIKA');
    end;
    if wpisz = 'POKRZYWA' then begin
      if MONSTRA.OGOL < 40 then
        WriteLn('NIE MASZ NAJMNIEJSZYCH SZANS');
      if MONSTRA.OGOL > 39 then
        WriteLn('JEST PEWNE PRAWDOPODOBIENSTWO WYGRANIA TEGO STARCIA');
    end;
    if (wpisz = 'SPANIEL') or (wpisz = 'OWCZAREK') or (wpisz = 'PIESEK') or
       (wpisz = 'JAMNIK') or (wpisz = 'PUDEL') then
      WriteLn('JASNE ZE MOZESZ GO ZABIC ZABIJ !!! ZABIJ . TEN PARSZYWY PIES NIE MA RACJI BYTU');
    if (FUKS < 3) and (POR < 100) then begin
      WriteLn('***************** UCZYSZ SIE ZDOLNOSCI POROWNYWANIE *****************');
      POR := POR + 1;
      KUNSZT := KUNSZT + 5;
    end;
    if wpisz = 'BAKTERIA' then begin
      WriteLn('BAKTERIA MA MAGIC RESISTANCE');
      MANA := MANA + 5;
    end;
  end;
end;

procedure TRAIN;
begin
  if wpisz = 'TRENUJ' then
    WriteLn('CO CHCESZ TRENOWAC?');
  if wpisz = 'TRENUJ SILA' then
    if (PRA > 2) and (SIL < MAXSIL) then begin
      SIL := SIL + 1;
      PRA := PRA - 3;
      WriteLn('TRENUJESZ SILE I MASZ ', SIL, ' SILY I ZOSTALO CI ', PRA, ' PRAKTYK');
    end;
  if wpisz = 'TRENUJ ZRECZNOSC' then
    if (PRA > 1) and (ZRE < MAXZRE) then begin
      ZRE := ZRE + 1;
      PRA := PRA - 2;
      WriteLn('TRENUJESZ ZRECZNOSC I MASZ ', ZRE, ' ZRECZNOSCI I ZOSTALO CI ', PRA, ' PRAKTYK');
    end;
  if wpisz = 'TRENUJ MADROSC' then
    if (PRA > 2) and (MAD < MAXMAD) then begin
      MAD := MAD + 1;
      PRA := PRA - 3;
      WriteLn('TRENUJESZ MADROSC I MASZ ', MAD, ' MADROSCI I ZOSTALO CI ', PRA, ' PRAKTYK');
    end;
end;

procedure save;
begin
end;

procedure TARCZA;
begin
  FUKS := Random(100);
  if FUKS <= PRO then begin
    WPYSK := WPYSK - ILOSC;
    if WPYSK < 0 then
      WPYSK := 0;
    WriteLn('OSLONILES SIE ! TRACISZ ', WPYSK, ' ENERGII');
  end;
end;

procedure PIERDOLY;
begin
  if wpisz = 'ZMIEN KOLOR' then begin
    WriteLn('PODAJ LICZBE KOLORU');
    ReadLn(FUKS);
    TextColor(FUKS);
  end;
  if wpisz = 'ZMIEN TLO' then begin
    WriteLn('PODAJ LICZBE TLA');
    ReadLn(FUKS);
    TextBackground(FUKS);
  end;
end;

procedure KOMENDY;
begin
  if wpisz = 'PN' then
    wpisz := 'POLNOC';
  if wpisz = 'PD' then
    wpisz := 'POLODNIE';
  if wpisz = 'W' then
    wpisz := 'WSCHOD';
  if wpisz = 'Z' then
    wpisz := 'ZACHOD';
  if wpisz = 'G' then
    wpisz := 'GORA';
  if wpisz = 'D' then
    wpisz := 'DOL';
  if wpisz = 'E' then
    wpisz := 'EXIT';
  if wpisz = 'M' then
    wpisz := 'MODE';
end;

procedure BLUSZCZ;
begin
  if SZCZAW = MIECHO then
    WriteLn('PONURY SZCZAW PLANUJE ZEMSCIC SIE NA SWOJEJ TESCIOWEJ-LISCIU KLONOWYM');
  if STOKROTKA = MIECHO then
    WriteLn('STOKROTKA TUTAJ ROSNIE POLNA ( A NAD NIA SZUMI GEJ) ');
  if KONICZYNKA = MIECHO then
    WriteLn('KONICZYNKA KTORA TUTAJ JEST NIE PRZENIESIE CI SZCZESCIA');
  if MLECZ = MIECHO then
    WriteLn('MLECZ WLASNIE DOWIODL ZE EINSTEIN SIE MYLIL');
  if DMUCHAWIEC = MIECHO then
    WriteLn('DMUCHAWIEC WLASNIE DOJRZAL DO TEGO ABY GO ZDMUCHNAC');
  if ROZA = MIECHO then
    WriteLn('PRZEROSNIETA ROZA POKAZUJE KOLCE NA ZNAK IZ NIE WARTO JEJ ATAKOWAC');
  if OSET = MIECHO then
    WriteLn('KIEDYS MYSLALES ZE OSET TO LATWY DO WYRWANIA CHWAST ... MYLILES SIE');
  if JEZYNA = MIECHO then
    WriteLn('TA JEZYNA W CIEMNOSCIACH WYGLADA JAK JAKIS NIEBYWALY SMOK ... ');
  if AGREST = MIECHO then
    WriteLn('AGREST JEST TU , CHCESZ SPROBOWAC JAK SMAKUJE ?');
  if MALINA = MIECHO then
    WriteLn('MALINA JAK DZIEWCZYNA , CHOC DZIEWCZYNY NIE SA CHYBA AZ TAKIMI MUTANTAMI');
  if TRAWA = MIECHO then
    WriteLn('TRAWA NIE WYDAJE SIE TRUDNYM PRZECIWNIKIEM , LECZ NIE DAJ SIE ZWIESC');
  if DUNCAN = MIECHO then
    WriteLn('ROLNIK DUNCAN PROBOJE ZAPANOWAC NAD TYM ZYWIOLEM I UPRAWIAC SWOJE MARCHEWKI');
end;

procedure POTWORY;
begin
  repeat
    BAKTERIA := Random(38) + 20;
    SLIMAK := Random(38) + 20;
    ZUK := Random(38) + 20;
    KARALUCH := Random(38) + 20;
    MROWKA := Random(38) + 20;
    PAJAK := Random(38) + 20;
    DZIK := Random(38) + 20;
    LIS := Random(38) + 20;
    SZCZUR := Random(38) + 20;
    KUROPATWA := Random(38) + 20;
  until (BAKTERIA > 32) and (SLIMAK > 32) and (ZUK > 32) and (KARALUCH > 32)
    and (MROWKA > 32) and (PAJAK > 32) and (DZIK > 32) and (LIS > 32)
    and (SZCZUR > 32) and (KUROPATWA > 32);
  repeat
    SARNA := Random(38) + 20;
    ORZEL := Random(38) + 20;
    ZAJAC := Random(38) + 20;
    WILCZUR := Random(38) + 20;
    KORNIK := Random(38) + 20;
    MUCHA := Random(38) + 20;
  until (SARNA > 32) and (ORZEL > 32) and (ZAJAC > 32) and (WILCZUR > 32)
    and (KORNIK > 32) and (MUCHA > 32);
  repeat
    SLON := Random(38) + 20;
    LEW := Random(38) + 20;
    ZYRAFA := Random(38) + 20;
    WIELBLAD := Random(38) + 20;
    STRUS := Random(38) + 20;
    BOA := Random(38) + 20;
    WILK := Random(38) + 20;
    BIZON := Random(38) + 20;
    PANTERA := Random(38) + 20;
  until (SLON > 32) and (LEW > 32) and (ZYRAFA > 32) and (WIELBLAD > 32)
    and (STRUS > 32) and (BOA > 32) and (WILK > 32) and (BIZON > 32)
    and (PANTERA > 32);
  repeat
    GLADIATOR := Random(38) + 20;
    WOJOWNIK := Random(38) + 20;
    TRENER := Random(38) + 20;
  until (GLADIATOR > 32) and (WOJOWNIK > 32) and (TRENER > 32);
  repeat
    MONSTRA.JAMNIK := Random(7) + 20;
    MONSTRA.OWCZAREK := Random(7) + 20;
    MONSTRA.PIESEK := Random(7) + 20;
    MONSTRA.SPANIEL := Random(7) + 20;
    MONSTRA.PUDEL := Random(7) + 20;
  until (MONSTRA.JAMNIK > 19) and (MONSTRA.OWCZAREK > 19) and (MONSTRA.PIESEK > 19)
    and (MONSTRA.SPANIEL > 19) and (MONSTRA.PUDEL > 19);
  repeat
    MONSTRA.TAKSOWKARZ := Random(7) + 20;
    MONSTRA.SPRZEDAWCA := Random(7) + 20;
    MONSTRA.ZAMIATACZ := Random(7) + 20;
    MONSTRA.PIJAK := Random(7) + 20;
    MONSTRA.ZEBRAK := Random(7) + 20;
  until (MONSTRA.TAKSOWKARZ > 19) and (MONSTRA.SPRZEDAWCA > 19)
    and (MONSTRA.ZAMIATACZ > 19) and (MONSTRA.PIJAK > 19) and (MONSTRA.ZEBRAK > 19);
  repeat
    DZIECKO := Random(7) + 60;
    WARIAT := Random(8) + 60;
    SLUCHACZ := Random(8) + 60;
    FAN := Random(8) + 60;
    CZLOWIEK := Random(8) + 60;
  until (DZIECKO > 60) and (WARIAT > 60) and (SLUCHACZ > 60) and (FAN > 60)
    and (CZLOWIEK > 60);
  repeat
    POLICJANT := Random(9) + 60;
    OCHRONIARZ := Random(9) + 60;
    GORYL := Random(9) + 60;
    DZIADEK := Random(8) + 60;
    REPORTER := Random(7) + 60;
  until (POLICJANT > 60) and (OCHRONIARZ > 60) and (GORYL > 60) and (DZIADEK > 60)
    and (REPORTER > 60);
  GITARZYSTA := Random(3) + 70;
  PERKUSISTA := Random(3) + 70;
  ORGANISTA := Random(3) + 70;
  LIROY := Random(3) + 70;
  MONSTRA.MINIBARMAN := 67;
  MONSTRA.GRUBAS := 67;
  MONSTRA.DJ := 69;
  MONSTRA.PEDAL := 76;
  MONSTRA.PARA := 76;
  MONSTRA.MACIEK := 76;
  MONSTRA.DRZWI := 1;
  MONSTRA.STARUCH := 1;
  repeat
    SZCZAW := Random(8) + 77;
    KONICZYNKA := Random(8) + 77;
    STOKROTKA := Random(8) + 77;
    MLECZ := Random(8) + 77;
    DMUCHAWIEC := Random(8) + 77;
    ROZA := Random(8) + 77;
    OSET := Random(8) + 77;
    MALINA := Random(8) + 77;
    AGREST := Random(8) + 77;
    JEZYNA := Random(8) + 77;
    TRAWA := Random(8) + 77;
    DUNCAN := Random(8) + 77;
  until (SZCZAW < 84) and (STOKROTKA < 84) and (KONICZYNKA < 84) and (MLECZ < 84)
    and (DMUCHAWIEC < 84) and (ROZA < 84) and (OSET < 84) and (MALINA < 84);
end;

procedure KTO;
begin
  if KORNIK = MIECHO then
    WriteLn('KORNIK SZUKA JAKIEGOS DRZEWA ABY COS PRZEKASIC');
  if MUCHA = MIECHO then
    WriteLn('MUCHA BZYKA SOBIE TO TU TO TAM');
  if BAKTERIA = MIECHO then
    WriteLn('BAKTERIA KTORA ZOBACZYLES POD MIKROSKOPEM STARA USUNAC CI SIE Z DROGI');
  if SLIMAK = MIECHO then
    WriteLn('SLIMAK KTORY ZOSTAWIA SLUZ POWOLI SUNIE PO PODLODZE');
  if ZUK = MIECHO then
    WriteLn('ZUK KTORY WIDZI CO SIE SWIECI ZWIEWA STAD');
  if KARALUCH = MIECHO then
    WriteLn('OHYDNY KARALUCH MA OCHOTE CIE OBRZYDZIC');
  if MROWKA = MIECHO then
    WriteLn('MROWKA NIESIE TLUSTY PACZEK I SIE CIESZY');
  if PAJAK = MIECHO then
    WriteLn('PAJAK ZROBIL SIEC NA SCIANIE ARENY');
  if DZIK = MIECHO then
    WriteLn('TLUSTY DZICZEK BIEGNIE SOBIE TEDY');
  if SZCZUR = MIECHO then
    WriteLn('JEST TUTAJ SZCZUR,TAK WIELKI ZE WIEKSZEGO NIE WIDZIALES');
  if LIS = MIECHO then
    WriteLn('CHYTRY LIS SZUKA SPOSOBU BY CIE ZABIC');
  if KUROPATWA = MIECHO then
    WriteLn('KUROPATWA PO PROSTU JEST TU');
  if ZAJAC = MIECHO then
    WriteLn('ZAJAC KICA SOBIE SPIEWAJAC "POMYLONE MISIE"');
  if WILCZUR = MIECHO then
    WriteLn('CZARNY WILCZUR PO KRZYWEJ SIE TOCZY (MU PIANA Z UST)');
  if ORZEL = MIECHO then
    WriteLn('ORZEL SZYBUJE W POWIETRZYU W POSZUKIWANIU OFIARY');
  if SARNA = MIECHO then
    WriteLn('SARNA SKASZE SOBIE NIE ZDAJAC SOBIE SPRAWY ZE ZARAZ ZGINIE');
  if SLON = MIECHO then
    WriteLn('OGROMNIASTY SLON ZGNIATA WSZYSTKO CO NAPOTKA');
  if LEW = MIECHO then
    WriteLn('LEW - KROL ZWIERZAT WLASNIE ZABIJA NIEWINNE DZIECKO ROZWALAJAC JEGO MOZG');
  if ZYRAFA = MIECHO then
    WriteLn('ZYRAFA KTORA TU STOI NIE SZUKA ZACZEPKI');
  if WIELBLAD = MIECHO then
    WriteLn('WIELBLAD KORZYSTA Z GARBOW UZYWAJAC ICH JAKO SMIERTELNEJ BRONI');
  if STRUS = MIECHO then
    WriteLn('STRUS NIE CHOWA GLOWY W PIASEK BO JEST NA BETONIE');
  if BOA = MIECHO then
    WriteLn('BOA DUSICIEL WLASNIE ZJADL KROWE ');
  if WILK = MIECHO then
    WriteLn('WILK CHORY NA WSCIEKLIZNE PANOSZY SIE W OKOLICY');
  if BIZON = MIECHO then
    WriteLn('NIEWINNY BIZON MORDUJE WLASNIE PUBLICZNOSC');
  if PANTERA = MIECHO then
    WriteLn('ZWINNA PANTERA NUDZI SIE POLYKAJAC RESZTKI LUDZKIEGO MIESA');
  if GLADIATOR = MIECHO then
    WriteLn('GLADIATOR ZDOBYWA TUTAJ KUNSZT');
  if WOJOWNIK = MIECHO then
    WriteLn('WOJOWNIK GREEN PEACE MORDUJE TUTAJ BEZBRONNE LWIATKA :( ');
  if TRENER = MIECHO then
    WriteLn('TRENER CYRKU LAPIE ZWIERZETA NA SWOJE PRZEDSTAWIENIE');
end;

procedure BRANIE;
begin
  if (wpisz = 'BIERZ STARY') and (MMIECZ = MIECHO2) then begin
    WriteLn('PODNOSISZ STARY ZARDZEWIALY MIECZ I MASZ JAROWE ZE GO POSIADASZ');
    MMIECZ := -10;
    PRZED := PRZED + 1;
  end;
  if (wpisz = 'BIERZ MALA') and (MTARCZA = MIECHO2) then begin
    WriteLn('PODNOSISZ MALA TARCZA (JEST OKRAGLA)');
    MTARCZA := -10;
    PRZED := PRZED + 1;
  end;
  if (wpisz = 'BIERZ SERCE') and (SERCE = MIECHO2) then begin
    WriteLn('PODNOSISZ ZAKRWAWIONE SERCE (BLEEEE)');
    SERCE := -10;
    PRZED := PRZED + 1;
  end;
  if (wpisz = 'BIERZ DYPLOM') and (DYPLOM = MIECHO2) then begin
    WriteLn('PODNOSISZ DYPLOM MUD SZKOLY , I CZUJESZ PRZEPLYWAJACA PRZEZ CIEBIE MOC');
    DYPLOM := -10;
    MONSTRA.MAXE := MONSTRA.MAXE + 5;
    PRZED := PRZED + 1;
  end;
  if (wpisz = 'BIERZ FAJKA') and (FAJKA = MIECHO2) then begin
    WriteLn('PODNOSISZ FAJKE ');
    FAJKA := -10;
    PRZED := PRZED + 1;
    if MAD < MAXMAD then
      MAD := MAD + 1;
  end;
  if (wpisz = 'ODRZUC STARY') and (MMIECZ = -10) then begin
    WriteLn('ODRZUCASZ STARY ZARDZEWIALY MIECZ I MASZ JAROWE ZE GO NIE POSIADASZ');
    MMIECZ := MIECHO2;
    PRZED := PRZED - 1;
  end;
  if (wpisz = 'ODRZUC FAJKA') and (FAJKA = -10) then begin
    WriteLn('WYRZUCASZ FAJKE ');
    FAJKA := MIECHO2;
    PRZED := PRZED - 1;
    MAD := MAD - 1;
  end;
  if (wpisz = 'ODRZUC MALA') and (MTARCZA = -10) then begin
    WriteLn('ODRZUCASZ MALA ZWYKLA TARCZE ');
    MTARCZA := MIECHO2;
    PRZED := PRZED - 1;
  end;
  if (wpisz = 'ODRZUC SERCE') and (SERCE = -10) then begin
    WriteLn('ODRZUCASZ ZAKRWAWIONE SERCE ');
    SERCE := MIECHO2;
    PRZED := PRZED - 1;
  end;
  if (wpisz = 'ODRZUC DYPLOM') and (DYPLOM = -10) then begin
    WriteLn('ODRZUCASZ DYPLOM MUD SZKOLY , I PRZESTAJESZ CZUC PRZEPLYWAJACA PRZEZ CIEBIE MOC');
    DYPLOM := MIECHO2;
    MONSTRA.MAXE := MONSTRA.MAXE - 5;
    PRZED := PRZED - 1;
  end;
end;

procedure UZYWANIE;
begin
  if (wpisz = 'UZYJ FAJKA') and (FAJKA = -10) then
    WriteLn('ZAPALASZ FAJECZKE I PYKASZ Z ZADOWOLENIEM');
  if (wpisz = 'UZYJ SERCE') and (SERCE = -10) then begin
    SERCE := 0;
    WriteLn('ZJADASZ ZAKRWAWIONE SERCE I ODZYSKUJESZ 5% ENERGII');
    ENERGIA := ENERGIA + 5;
    if ENERGIA > MONSTRA.MAXE then
      ENERGIA := MONSTRA.MAXE;
    PRZED := PRZED - 1;
  end;
  if (wpisz = 'UZYJ DYPLOM') and (DYPLOM = -10) then begin
    WriteLn('PATRZYSZ SIE NA DYPLOM:');
    WriteLn('--------------------------------------');
    WriteLn('|         DYPLOM MUD SZKOLY          |');
    WriteLn('|                                    |');
    WriteLn('|                                    |');
    WriteLn('|                                    |');
    WriteLn('|  BRAWO! BEZ WIEKSZYCH PROBLEMOW    |');
    WriteLn('|  PRZEBRNALES PRZEZ MUD SZKOLE      |');
    WriteLn('|  W NAGRODE ZA DUZA AKTYWNOSC       |');
    WriteLn('|  DAJE CI OTO TEN DYPLOM MUD SZKOLY |');
    WriteLn('|____________________________________|');
  end;
  if (wpisz = 'UZYJ PACZEK') and (PACZEK <= -10) then begin
    PRZED := PRZED - 1;
    PACZEK := PACZEK + 10;
    WriteLn('ZJADASZ PACZKA I TYJESZ 1 KILO (DOSTAJESZ 8%ENERGII)');
    ENERGIA := ENERGIA + 8;
    if ENERGIA > MONSTRA.MAXE then
      ENERGIA := MONSTRA.MAXE;
  end;
  if (wpisz = 'UZYJ CIASTKO') and (CIASTKO <= -10) then begin
    PRZED := PRZED - 1;
    CIASTKO := CIASTKO + 10;
    WriteLn('ZJADASZ CIASTKO I TYJESZ 2 KILO (DOSTAJESZ 12% ENERGII)');
    ENERGIA := ENERGIA + 12;
    if ENERGIA > MONSTRA.MAXE then
      ENERGIA := MONSTRA.MAXE;
  end;
  if (wpisz = 'UZYJ SUCHA RACJA') and (SUCHA <= -10) then begin
    PRZED := PRZED - 1;
    SUCHA := SUCHA + 10;
    WriteLn('ZJADASZ SUCHA RACJE I CHUDNIESZ 3 KILO (DOSTAJESZ 16% ENERGII)');
    ENERGIA := ENERGIA + 16;
    if ENERGIA > MONSTRA.MAXE then
      ENERGIA := MONSTRA.MAXE;
  end;
  if (wpisz = 'UZYJ BULKA') and (BULKA <= -10) then begin
    PRZED := PRZED - 1;
    BULKA := BULKA + 10;
    WriteLn('ZJADASZ BULKE I STWIERDZASZ ZE ZYSKALES 20%');
    ENERGIA := ENERGIA + 20;
    if ENERGIA > MONSTRA.MAXE then
      ENERGIA := MONSTRA.MAXE;
  end;
  if (wpisz = 'ZNISZCZ PRZEPUSTKA') and (PRZEPUSTKA < -1) then begin
    WriteLn('GRRRRRRRRR .... GLUPIA PRZEPUSTKA');
    PRZEPUSTKA := PRZEPUSTKA + 10;
    PRZED := PRZED + 1;
  end;
  if (wpisz = 'PATRZ PRZEPUSTKA') and (PRZEPUSTKA < -1) then begin
    WriteLn('|========================|');
    WriteLn('| Niniejszym zaswiadczam |');
    WriteLn('|  Iz osoba posiadajaca  |');
    WriteLn('|      Ten dokument      |');
    WriteLn('|   Ukonczyla pozytywnie |');
    WriteLn('| Jeden z moich questów  |');
    WriteLn('|========================|');
  end;
  if (wpisz = 'UZYJ CHLEB') and (CHLEB <= -10) then begin
    PRZED := PRZED - 1;
    CHLEB := CHLEB + 10;
    WriteLn('ZJADASZ DUZY CIEPLY CHLEB I JESTES PELEN (ZYSKUJESZ 26%)');
    ENERGIA := ENERGIA + 26;
    if ENERGIA > MONSTRA.MAXE then
      ENERGIA := MONSTRA.MAXE;
  end;
  if wpisz = 'UZYJ KASETA' then
    WriteLn('TEN PRZEMIOT JEST TYPU : SMIEC . S.Z -8 MAXE +5 ZRE +1 ');
  if (wpisz = 'UZYJ WEKA') and (WEKA <= -10) then begin
    PRZED := PRZED - 1;
    WEKA := WEKA + 10;
    WriteLn('ZJADASZ DLUGASNA WEKE I TYJAC 15 KILO ZYSKUJESZ 34%');
    ENERGIA := ENERGIA + 34;
    if ENERGIA > MONSTRA.MAXE then
      ENERGIA := MONSTRA.MAXE;
  end;
  if (wpisz = 'UZYJ MALA BUTELKA MANY') and (MBUTELKA <= -10) then begin
    PRZED := PRZED - 1;
    MBUTELKA := MBUTELKA + 10;
    WriteLn('WYPIJASZ MALA BUTELKE MANY I ODZYSKUJESZ 30 MANY');
    MANA := MANA + 30;
    if MANA > MAXMANA then
      MANA := MAXMANA;
  end;
  if (wpisz = 'UZYJ BIGOS') and (BIGOS <= -10) then begin
    PRZED := PRZED - 1;
    BIGOS := BIGOS + 10;
    WriteLn('ZJADASZ BIGOS Z WROGA I ODZYSKUJESZ 20% ENERGI');
    ENERGIA := ENERGIA + 20;
    if ENERGIA > MONSTRA.MAXE then
      ENERGIA := MONSTRA.MAXE;
  end;
  if (wpisz = 'UZYJ KOMPLET') and (KOMPLET <= -10) and (JAKIEUB = '') then begin
    WriteLn('NAKLADASZ KOMPLET UBRAN FIRMY "SYF"');
    PRO := PRO + 7;
    CIALO := 1;
    JAKIEUB := 'SYF';
  end;
  if (wpisz = 'ODLORZ KOMPLET') and (KOMPLET <= -10) and (JAKIEUB = 'SYF') then begin
    WriteLn('ZDEJMUJESZ KOMPLET UBRAN FIRMY "SYF"');
    CIALO := 0;
    PRO := PRO - 7;
    JAKIEUB := '';
  end;
  if (wpisz = 'UZYJ LISTEK') and (LISTEK <= -10) then
    WriteLn('LISTEK JEST TYPU SMIEC MAX PRZEDMIOTOW + 3 ');
  if (wpisz = 'UZYJ GARNITUR') and (GARNITUR <= -10) and (JAKIEUB = '') then begin
    WriteLn('NAKLADASZ GARNITUR Z KOLCAMI NA SWE (NIE)WYSPORTOWANE CIALO');
    CIALO := 1;
    ILOSC := ILOSC + 1;
    PRO := PRO + 10;
    FUKSROLL := FUKSROLL + 15;
    JAKIEUB := 'GARNITUR';
  end;
  if (wpisz = 'UZYJ PIGULKA') and (PIGULKA <= -10) then begin
    WriteLn('WSZYSTKO ZACZYNA WIROWAC , POTEM NAGLY BLYSK I ZNAJDUJESZ SIE W PRZESZLOSCI');
    PIGULKA := PIGULKA + 10;
    POTWORY;
    if MAD < 10 then begin
      WriteLn('BRAK OBYCIA W POSLUGIWANIU SIE MAGICZNYMI PRZEDMIOTAMI SPRAWIL ZE ');
      WriteLn('ZNACZNIE OPADLES Z SIL I STALES SIE BARDZO ZMECZONY');
      MONSTRA.MAXE := MONSTRA.MAXE - 1;
      ENERGIA := 1;
      KUNSZT := KUNSZT - 50;
    end;
    if (MAD > 9) and (MAD < 16) then begin
      WriteLn('MASZ PEWNE OBYCIE W MAGICZNYCH PRZEDMIOTACH ALE MIMO WSZYSTKO');
      WriteLn('OPADLES Z SIL I STALES SIE ZMECZONY');
      ENERGIA := ENERGIA - 40;
      if ENERGIA < 1 then
        ENERGIA := 1;
      KUNSZT := KUNSZT - 30;
    end;
    if MAD > 15 then
      WriteLn('ZNASZ SIE NA TEGO TYPU PRZEDMIOTACH , WYSZEDLES Z TEGO BEZ SZWANKU');
  end;
  if (wpisz = 'ODLORZ GARNITUR') and (GARNITUR <= -10) and (JAKIEUB = 'GARNITUR') then begin
    WriteLn('ZDEJMUJESZ GARNITUR Z KOLCAMI ZE SWEGO (NIE)WYSPORTOWANEGO CIALA');
    CIALO := 0;
    ILOSC := ILOSC - 1;
    PRO := PRO - 10;
    FUKSROLL := FUKSROLL - 15;
    JAKIEUB := '';
  end;
end;

  (* Remaining bodies are still to be reconstructed from the retained TPU
     listings and BOMBKI.EXE disassembly. *)
begin
  { unit-initialization: runs once at program start }
end.
