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
