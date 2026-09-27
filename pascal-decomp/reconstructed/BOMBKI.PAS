program BOMBKI;
{ Turbo Pascal 7.0 real-mode main program of BOMBKI.EXE.
  MZ: CS:IP = 0000:B0CF, header paragraphs 0x52E, image length 0x1D4F0;
  img = file[0x52E*16:]. At img 0xB0CF sits lcall 1C71:0000 (System
  bootstrap); the program prologue is at img 0xB0D9 and the main-loop
   bleed check at img 0xB193; room dispatch starts at img 0xB1E5.
   Backedge img 0xF5BF returns to img 0xB0F0. Traced startup order:
   RECONSTRUCTION-LOG.md entries (32), (34). }
uses
  crt, swiat, przedm, monstra, dos;

{ program-level DGROUP workspace:
    ds:0x564  wpisz / command ReadLn buffer (textrec)
  Unit-owned globals live in the SWIAT/PRZEDM/MONSTRA interface vars. }

begin
  { --- TP7 runtime, implicit (file 0x52E0..): img 0xB0CF..0xB0D8 ---
    lcall 1C71:0000 System bootstrap: DS := DGROUP (para 0x1D49), BSS
    zeroed 0x52..0x8EE, CPU probe, heap init; std TextRec init 1C0F:000D. }
  { --- main prologue img 0xB0D9: push bp; mov bp,sp; xor ax,ax --- }
  { heap check: lcall 1C71:02CD }
  Randomize;            { GetTime-seeded, lcall 1C71:0C79 }
  { startup/input-overwrite routine img 0x11638.. (call 0x116EF at img
    0xB0E8): writes prompt strings cs:0x1FEE / 0x1FF3 / 0x1FF8 into
    textrec 0x564, calls PRZEDM_MODE (lcall 0x129D:0x3114); 1C0F:031A }
  { Checkpoint (call 0x51C3); LevelUp (call 0x872E, body 0x87A2..) }
  { Overload gate: PRZED [0x182] > carrying capacity -> overload-print
    block ("JESTES OBLADOWANY"); capacity field in DGROUP. }
   { --- img 0xB193 bleed tick; img 0xB1E5 ordered room dispatch --- }
   repeat
     { BODY TODO: inline rooms and MODE body, img 0xB25A..0xF5B1.
       Dispatched SWIAT calls: 0xB1EC..0xB255, 0xBF11/0xBF1D,
       0xCC13, 0xE0F9, 0xE85B. PRZEDM.MINIARENA at img 0xEA15;
       UNMODE/UM restores MIECHO2 at img 0xF5A1. See the dated
       dispatch index in RECONSTRUCTION-LOG.md entry (34). }
   until False;
   { Exit path: MIECHO = 193, or WYJSCIE in an inline room, jumps to
     img 0xF5C2 (System termination at img 0xF5C5). }
end.
