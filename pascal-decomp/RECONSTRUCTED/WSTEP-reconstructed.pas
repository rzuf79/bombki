{ WSTEP-reconstructed.pas
  BODY-A = the KOPANIE (kick) + UCIEKANIE (flee) round block at the head of
  the shared combat engine WALKA (BOMBKI.exe img 0x17E87..0x1800B, inside
  WALKA img 0x16E76..0x181C6, para 0x129D:0x44A6). The earlier "SWIAT:0x46
  shared engine, not yet traced" note refers to this same engine; it is now
  traced (see WALKA-CombatEngine-reconstructed.pas and the combat engine
  section of INTEGRATED-FIELD-MAP.md).

  Operand names are the corrected merged map (2026-09-24): the retracted
  MONSTRA band 0x1AC..0x1D4 are player stats/skills (ManaCur, skill gates,
  Uciekanie, KUNSZT), NOT monster HP. Monster HP/Dmg/Dex live in the unsaved
  slots [0x1B0]/[0x1B6]/[0x1B8], written per fight by the launchers (see the
  launcher table in INTEGRATED-FIELD-MAP.md).

  BODY-B = para 05DD:1C71 (abs 07A41) is a STAGE/DIALOGUE routine (PRZEDM
  SCENA/TLUM), NOT a WSTEP sibling; its 0x1D6 writes are menu room options.
}

procedure WSTEP;                  { kick+flee block: BOMBKI.exe img 0x17E87..0x1800B }
var dmg: Integer;
begin
   if (Kopanie > 0) and (ManaCur > ManaGateKopanie) and (Energy < EnergyGateKopanie) then
   begin
      dmg := Random(100);                     { lcall be4; kept in [0x19E] scratch }
      if Kopanie - 10 >= dmg then
      begin
         dmg := Random(CharacterLevel) + Random(10);   { byte [0x25C]; + Random(10) }
         Write('TWOJ SUPER KOP ZABIERA ', dmg, '% ENERGI');   { cs:4363 / 41E0 }
         Delay;                               { lcall 1C71:5DD }
         Random;                              { 1C71:291 }
         ManaCur := ManaCur - (Random(3) + 3);   { [0x1AC] }
         MonsterHP := MonsterHP - dmg;           { [0x1B0] }
      end
      else
         Write('TWOJ SUPER KOP CHYBIA PRZECIWNIKA ');   { cs:437B }
      ManaCur := ManaCur - (Random(2) + 2);   { img 0x17F6D: flee attempt drain }
   end;
   if (Uciekanie > 0) and (Energy < EnergyGateUciekanie) and (ManaCur > 14) then
   begin
      ManaCur := ManaCur - 15;                { [0x1AC] -= 0xF }
      if Random(100) <= Uciekanie then        { [0x1CE] }
      begin
         FleeFlag := 1;                        { [0x1D2] := 1 }
         Write('WSTYD !!! UCIEKLES Z POLA BITWY TRACISZ 20 KUNSZTU');  { cs:439E }
         Delay;
         KUNSZT := KUNSZT - 20;                { [0x1D4] -= 0x14 }
      end
      else
         Write('NIE UDALO CI SIE UCIEC !!!! WALCZYSZ DALEJ !!! ');  { cs:43D1 }
   end;
   { img 0x1800B: loop another round while Energy>=1 && MonsterHP>=1 && !FleeFlag;
     otherwise fall into the victory/death ladder (rewardXP [0x1B4] deductions). }
end;
