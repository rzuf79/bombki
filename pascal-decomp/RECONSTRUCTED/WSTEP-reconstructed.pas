{ WSTEP-reconstructed.pas
  BODY-A = EXE para 0E42:9A57 (abs 17E77) -- combat-damage routine.

  CORRECTED 2026-09-24 by INTEGRATION with help-you-need (see
  INTEGRATED-FIELD-MAP.md):
  - The "proven MONSTRA band 0x1AC..0x1D4 = MAXE..SILNY" claim is RETRACTED.
    Per the merged save/load map those slots are player stats/skills:
      0x1AC/0x1AE = ManaCur/ManaMax (250/250)
      0x1C4..0x1D4 = SZ parts + skill-chance fields + "%." percent (>0x1D4=99)
    Monster characteristics are NOT stored in the saved DGROUP record.
  - 0x19C = Energy (not FORSA/money); money = 0x194; max energy = 0x664.
  - 0x1D6 = CurrentContext (room/interface id), not a bare scene menu var.
  So the exact monster-stat constants used by the combat math (HP/ATK of
  OWCZAREK etc.) live elsewhere (SWIAT:0x46 shared engine, not yet traced),
  and this body's DGROUP operand NAMES below are placeholder-only pending that.

  BODY-B = para 05DD:1C71 (abs 07A41) is a STAGE/DIALOGUE routine (PRZEDM
  SCENA/TLUM), NOT a WSTEP sibling; its 0x1D6 writes are menu room options.
}

procedure WSTEP;                  { from BODY-A: BOMBKI.exe 0E42:9A57 }
var dmg: Integer;
begin
   if (PEDAL > 0) and (MAXE > PARA) and ({g19C Energy} < MACIEK) then
   begin
      dmg := Random(100);                    { lcall be4 }
      if PEDAL - 10 >= dmg then
      begin
         dmg := Random({b25C lvl+23}) + Random(10);  { + Random(10) }
         Write('...'); Write(dmg);            { string at cs:4363 }
         Delay;                               { lcall 1C71:5DD }
         Random;                              { 1C71:291 }
         MAXE := MAXE - (Random(3) + 3);
         OWCZAREK := OWCZAREK - dmg;
      end
      else
      begin
         Write('...');                        { cs:437b }
         Delay;
         MAXE := MAXE - (Random(2) + 2);
      end;
      if (OGOL > 0) and ({g19C} < DRZWI) and (MAXE > 14) then
         MAXE := MAXE - 15;
      {... continues with more damage/monster handling ...}
   end;
end;