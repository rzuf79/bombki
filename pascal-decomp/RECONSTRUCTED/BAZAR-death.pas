{ BAZAR-death.pas -- EXE proc @ img 0x36F5 (paragraph 0x6A75:0x0) }
{ PRZEDM-level death/revival + item menu + auto-save.  2026-09-24 }
{ Proof: all 7 string consts decode via pstr(); save() @ 0x2BA1 is
  lcall-ed at the end; menu at ds:0x6A2 (see BODY-B 'FUKSROLL' strings). }

procedure BAZAR;
begin
  WriteLn('AJAJAJ TWOJA GLOWA NAWALA JAK TESCIOWA!!!');
  WriteLn('NIC NA TO NIE PORADZE , TRZEBA BYLO SIE STARAC');
  WriteLn('NAGLE REFLEKSJA - DO JASNEJ CENZURY JAK SIE WALCZYLO TYM MIECZEM?');
  WriteLn('NIESTETY WRAZ ZE SMIERCIA TRACISZ KUNSZT ADEKWATNIE DO TWOJEGO LEVELKA');
  WriteLn('POJAWISZ SIE W CENTRUM MIASTA ..... POWODZENIA');
  WriteLn('P.S : AHA POTWORY SIE ODREGENEROWALY');
  WriteLn('P.S.2 : Z OSTATNIEJ CHWILI : HE HE HE SPROBOJ ODLOADOWAC POSTAC >:)');

  if [0x248] = 1 then [0x24A] := 0x32      { 50  quest reset: type=1 -> 50 kills }
  else if [0x248] > 1 then [0x24A] := 0xC8; { 200 type>1 -> 200 kills }

  [0x19C] := [0x664];                       { Energy := EnergiaMax (revive; f9=f20=55) }

  { KUNSZT death penalty - DECODED 0x37DC..0x3811, level-based per
    "...TRACISZ KUNSZT ADEKWATNIE DO TWOJEGO LEVELKA":
      lvl5 := ([0x25C]*4) + [0x25C];        { = level * 5, [0x25C]=CharacterLevel }
      [0x1D4] := [0x1D4] - 0xFA             { -250 }
                 + lcall 0xBE4 Random(50)
                 - lvl5;                    { - 5 * level }
    i.e. KUNSZT loses  250 - Random(50) + 5*Level
    [0x1D4] = KUNSZT (save f8 = 99); [0x25C] = level (save f2). }
  { 0x1D6 := 0x14 }                         { CurrentContext := 20 (centrum respawn) }

  ROOM;   { lcall 0x129D:0xFA }
  Write('PAMIETAJ');                         { ds:0x564 buffer, max 255 }
  { read menu into 0x564 }                  { lcall 0x1C71:0x900 }
  { ds:0x6A2 menu handler }                 { lcall 0x1C71:0x59D + 0x291 }
  save;   { call 0x2BA1 -- PRZEDM.save() }
end;