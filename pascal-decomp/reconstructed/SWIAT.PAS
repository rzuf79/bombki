unit SWIAT;
{ checksum = $3B76 }
{ Turbo Pascal 7.0 unit — the room/world layer of BOMBKI.
  Ground truth:
    - TPU: analysis-results\tpu_reports\SWIAT.*.txt. 12 export entries,
      13 code blocks (13.3 KB total; block 0x60, POKOJ83's, is missing
      from the codeblocks extract — extraction gap to fix).
    - Uses chain: przedm, monstra, crt, System (RECONSTRUCTION-LOG.md
      entry (32)).
    - Room model (INTEGRATED-FIELD-MAP.md "Room graph"; machine-verified):
      contexts 0..3 start/sub/school/training; 4..17 school (5 = six-way
      MUD SZKOLA, 11 = cage hall, 12..16 monster rooms); 20 city centre
      (respawn); 21..22 ULSKLEPIKOWA; 30..31 ULICA DLUGA; 32 arena
      entrance; 33..57 arena grid; 60 DOLINA ROZRYWEK; 61..66 crowd;
      67 piwiarnia; 68 estrada; 69..72 scena; ~73 LIROY; 77..82 BLUSZCZ;
      83 PIERDUT/BLUSZCZ tree; 84 PODEJRZANE KRZAKI; 100..103 road.
  EXE anchors registered so far (img-relative):
      room procs calling KillDispatch  0x6A20..0x76xx
      city-square dispatch (ctx 0x64)  0x12414..0x129C6
      Room map/garden generator        0x12ACA..0x130A1
      room command vocabulary          0x13190..0x15400
      KillDispatch router              0x4F53
  The POKOJx -> room/context and POKOJx -> EXE-region mapping is OPEN
  (per-proc notes below; pin it with entry/codeblock + img anchors). }
interface

uses  przedm, monstra, crt;

  procedure POKOJ0;
  { Proc $0008 Entry 8:005A }
  procedure POKOJ1;
  { Proc $0010 Entry 16:0397 }
  procedure POKOJ4;
  { Proc $0018 Entry 24:01E2 }
  procedure POKOJ13;
  { Proc $0020 Entry 32:01A7 }
  procedure POKOJE;
  { Proc $0028 Entry 40:00C9 }
  procedure POKOJ5;
  { Proc $0030 Entry 0:0196 }
  procedure POKOJ11;
  { Proc $0038 Entry 48:0261 }
  procedure POKOJ30;
  { Proc $0040 Entry 56:00F1 }
  procedure POKOJ60;
  { Proc $0048 Entry 64:011F }
  procedure POKOJ75;
  { Proc $0050 Entry 72:014E }
  procedure POKOJ100;
  { Proc $0058 Entry 88:03AB }
  procedure POKOJ83;
  { Proc $0060 Entry 80:012B }
implementation

{ ------------------------------------------------------------------ }
{ Bodies are RECONSTRUCTION-LOG.md §3's scoped cut — "reimplementing the
  remaining bodies as TP7 source is a separate authoring task on top of
  the preserved interface skeletons". Each stub below carries its TPU
  code anchor and the machine-verified EXE semantics known so far.
  Decode source: SWIAT.code.bin / SWIAT.reloc_code.txt (TPU side) plus
  the EXE regions in the header; every claim keeps an img 0x… anchor. }
{ ------------------------------------------------------------------ }

procedure POKOJ0;
{ TPU entry 8:005A, code block 8 (0x143 B). Room 0 = game start
  (room graph). EXE room-region target: open. }
begin
  { BODY TODO: transcribe POKOJ0 from SWIAT.code.bin block 8 + the EXE
    room region (0x6A20..0x76xx candidate); start-room bios/commands. }
end;

procedure POKOJ1;
{ TPU entry 16:0397, code block 16 (0x71D B). Room 1 = start/sub area
  (room graph). EXE target: open. }
begin
  { BODY TODO: transcribe POKOJ1 from SWIAT.code.bin block 16 + EXE
    room region. }
end;

procedure POKOJ4;
{ TPU entry 24:01E2, code block 24 (0x3F7 B). Room 4 = school
  (room graph). EXE target: open. }
begin
  { BODY TODO: transcribe POKOJ4 from SWIAT.code.bin block 24 + EXE
    room region; school commands (CWICZ/TRENUJ paths run through the
    vocabulary region 0x13190..). }
end;

procedure POKOJ13;
{ TPU entry 32:01A7, code block 32 (0x468 B). Room 13 = monster/cage
  room: tracker slot 7 == 13 fires the ZABIJ launcher 0x10981
  (HP20/Dex3/Dmg10/Random(15) — log entry (9), field map). EXE target:
  open. }
begin
  { BODY TODO: transcribe POKOJ13 from SWIAT.code.bin block 32 + EXE
    room region; cage/monster interactions. }
end;

procedure POKOJE;
{ TPU entry 40:00C9, code block 40 (0x53C B). "POKOJE" = the rooms
  dispatcher candidate; may map to the Room map/garden generator
  (EXE img 0x12ACA..0x130A1, para 0x129D:0xFA) which seeds monster pen
  positions [0x1DA..0x1EE], stage musicians [0x226..0x22C], plants
  [0x232..0x246], garden animals [0x666..0x678], marker [0x261] (log
  entry (11)). Mapping hypothesis only — pin before transcribing. }
begin
  { BODY TODO: transcribe POKOJE from SWIAT.code.bin block 40 + EXE
    img 0x12ACA..0x130A1 (pending mapping confirmation). }
end;

procedure POKOJ5;
{ TPU entry 0:0196 (code block 0; continuation block 48, 0x547 B).
  Room 5 = six-way MUD SZKOLA junction (room graph). EXE target: open. }
begin
  { BODY TODO: transcribe POKOJ5 from SWIAT.code.bin blocks 0/48 + EXE
    room region; six-way exit handling. }
end;

procedure POKOJ11;
{ TPU entry 48:0261, code block 56 (0x298 B). Room 11 = cage hall, six
  cages (room graph). EXE target: open. }
begin
  { BODY TODO: transcribe POKOJ11 from SWIAT.code.bin block 56 + EXE
    room region; cage commands. }
end;

procedure POKOJ30;
{ TPU entry 56:00F1, code block 64 (0x2AF B). Room 30 = ULICA DLUGA,
  31 -> 60 (room graph). EXE target: open. }
begin
  { BODY TODO: transcribe POKOJ30 from SWIAT.code.bin block 64 + EXE
    room region; street commands/shops. }
end;

procedure POKOJ60;
{ TPU entry 64:011F, code block 72 (0x311 B). Room 60 = DOLINA ROZRYWEK
  (room graph). EXE target: open. }
begin
  { BODY TODO: transcribe POKOJ60 from SWIAT.code.bin block 72 + EXE
    room region; valley/concert edge commands. }
end;

procedure POKOJ75;
{ TPU entry 72:014E, code block 80 (0x2CA B). Room 75 = concert district
  (near LIROY ~73, rooms 69..73; room graph). EXE target: open. }
begin
  { BODY TODO: transcribe POKOJ75 from SWIAT.code.bin block 80 + EXE
    room region; FIGHTSCENA-side interactions. }
end;

procedure POKOJ100;
{ TPU entry 88:03AB, code block 88 (0x95E B) — the largest SWIAT proc.
  Candidate EXE anchor: city-square dispatch img 0x12414..0x129C6,
  guard [0x1D6] == 0x64 (100) — mapping hypothesis, pin before
  transcribing. Machine-verified semantics (INTEGRATED-FIELD-MAP.md §
  "City square dispatch", log entries (12)/(17)):
    - shows Energy [0x19C] and KUNSZT [0x1D4]; street bios (strings
      para 0x17CB, img 0x1A660..0x1AE00)
    - quest buys: 200 / 100 / 50 coins -> QuestCount 75 / 200 / 200
      (QuestType [0x248], QuestCount [0x24A], Forsa [0x21A:0x21C])
    - turn-ins: KUNSZT +100 / +0xFA / +0x1A9, Przepustka
      [0x21E:0x220] -= 10; type2 consumes Dyplom [0x188], EnergyMax -5;
      type3 consumes Fajka [0x18A], PRAKTYK -1, PRZED -1, Madrosc -1
    - boss fight: 188/26/10 + wounds 20/10 -> Przepustka on win
    - room changes: exit / ->0x16 / ->0x65 (pass owned) /
      PRZEDM_MODE (lcall 0x129D:0x3114) -> context 0x3E8
    - loops while [0x1D6] == 0x64 }
begin
  { BODY TODO: transcribe POKOJ100 from SWIAT.code.bin block 88 + EXE
    img 0x12414..0x129C6. }
end;

procedure POKOJ83;
{ TPU entry 80:012B, code block 96 (block 0x60) — block missing from the
  codeblocks extract. Room 83 = PIERDUT/BLUSZCZ tree room (room graph);
  Duncan black market (SECRET LISTA / KUP DOKUMENT / KUP PLECAK) lives
  in PRZEDM.FIGHTBLUSZCZ (EXE 0x1B5D2/0x1B6F5, log entry (25)). EXE
  target: open. }
begin
  { BODY TODO: transcribe POKOJ83 from SWIAT.code.bin block 96 (re-extract
    the block first) + EXE room region. }
end;

begin
  { unit-initialization: runs once at program start; the EXE emits unit
    init blocks into the program prologue (entry (32)) }
end.
