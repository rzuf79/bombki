{ WALKA-CombatEngine-reconstructed.pas -- BOMBKI combat engine        }
{ EXE proc @ paragraph 0x129D:0x44A6 = img 0x16E76 .. 0x181C6 (retf).  }
{ 2026-09-24.  Decoded from BOMBKI.EXE (capstone x86-16 linear descent,
{ cross-checked against RP/chance strings "KOPANIE", "UCIEKANIE",
{ "ZYSKALES", "%." x54, monster-name table and the launchers at img
{ 0x5DB4/0xB3CE/0xB695/0xB85E/0xD091/0x10981/0x13843).               }
{                                                                      }
{ CALLING CONVENTION                                                 }
{   Caller must load the active-monster stats BEFORE the far call:    }
{     [0x1B0] = MonsterHP    [0x1B6] = MonsterDmg    [0x1B8] = MonsterDex }
{   e.g. lcall 0x129D:0x44A6 (far)  or   push cs; call rel (same-seg). }
{   On return:                                                        }
{     MonsterHP < 1  ->  monster dead (launcher pays money reward);   }
{     [0x1D2] = 1    ->  player fled;                                 }
{     Energy   < 1   ->  player knocked out (CurrentContext := 10000).}
{                                                                      }
{ OPERANDS (corrected / verified here)                                }
{   [0x1A2..0x1AA]  food  [0x1AC] ManaCur  [0x1AE] ManaMax            }
{   [0x1B0] MHP [0x1B2] margin scratch [0x1B4] XP reward accumulator  }
{   [0x1B6] MDmg [0x1B8] MDex  [0x1BA]/[0x1BC] hit/dodge flags        }
{   [0x1BE] dodge margin scratch  [0x1C0] strike scratch              }
{   [0x1C6] Parowanie [0x1C8] Kopanie [0x1CE] Uciekanie               }
{   [0x19C] Energy [0x664] EnergiaMax  [0x19E] RNG scratch            }
{   [0x182] MaxLoad (+1 on skill-up)  [0x1D4] KUNSZT (XP stat)        }
{   [0x1D2] flee flag  [0x1D6] CurrentContext  [0x25C] CharacterLevel }
{   [0x258] talent chance  [0x259] talent pool  [0x25E]/[0x25F] wound
{    counters  [0x260] bleed counter  [0x224] heavy-blow threshold    }
{   [0x248]/[0x24A] quest kills / remaining  [0x212]/[0x21A:0x21C]
{    money reward scratch / Money(LongInt) - handled by launchers     }

procedure Walka;
begin
  { ================= PART A  base XP reward (0x16E76..0x173BC) ====== }
  { [0x1B4] := sum of three stat delta bonuses - fighting up gives    }
  { more XP, fighting down gives less.  (0x16E80..0x171B2)            }
  if EnergiaMax > MonsterHP then begin
    m := EnergiaMax - MonsterHP;                  { [0x1B2] }
    if m <  4 then Inc(XP, 10);
    if (m > 2) and (m < 8) then Inc(XP,  9);
    if (m > 6) and (m < 11) then Inc(XP,  8);
    if (m > 9) and (m < 14) then Inc(XP,  7);
    if (m > 12) and (m < 17) then Inc(XP,  6);
    if (m > 15) and (m < 20) then Inc(XP,  5);
    if (m > 18) and (m < 23) then Inc(XP,  4);
    if (m > 21) and (m < 26) then Inc(XP,  3);
    if (m > 24) and (m < 29) then Inc(XP,  2);
    if (m > 27) and (m < 32) then Inc(XP,  1);
  end else if EnergiaMax < MonsterHP then begin
    m := MonsterHP - EnergiaMax;
    if m = 2  then Inc(XP, 12);
    if m = 4  then Inc(XP, 13);
    if m = 6  then Inc(XP, 14);
    if m = 8  then Inc(XP, 15);
    if m = 10 then Inc(XP, 16);
    if m = 12 then Inc(XP, 17);
    if m = 14 then Inc(XP, 18);
    if m = 16 then Inc(XP, 19);
    if m = 18 then Inc(XP, 20);
    if m > 20 then Inc(XP, 21);
  end else Inc(XP, 11);

  if Sila > MonsterDmg then begin
    m := Sila - MonsterDmg;                       { 0x17046..0x170EA }
    if m = 1  then Inc(XP, 10);
    if m = 2  then Inc(XP,  9);
    if m = 3  then Inc(XP,  8);
    if m = 4  then Inc(XP,  7);
    if m = 5  then Inc(XP,  6);
    if m = 6  then Inc(XP,  5);
    if m = 7  then Inc(XP,  4);
    if m = 8  then Inc(XP,  3);
    if m = 9  then Inc(XP,  2);
    if m = 10 then Inc(XP,  1);
  end else if Sila < MonsterDmg then begin
    m := MonsterDmg - Sila;                       { 0x170F9..0x171A0 }
    if m = 1  then Inc(XP, 12);
    if m = 2  then Inc(XP, 13);
    if m = 3  then Inc(XP, 14);
    if m = 4  then Inc(XP, 15);
    if m = 5  then Inc(XP, 16);
    if m = 6  then Inc(XP, 17);
    if m = 7  then Inc(XP, 18);
    if m = 8  then Inc(XP, 19);
    if m = 9  then Inc(XP, 20);
    if m > 9  then Inc(XP, 21);
  end else Inc(XP, 11);

  if Zrecznosc > MonsterDex then begin
    m := Zrecznosc - MonsterDex;                  { 0x171C1..0x172AB }
    case m of 1,2: Inc(XP,10); 3,4: Inc(XP,9); 5,6: Inc(XP,8);
              7,8: Inc(XP,7); 9,10: Inc(XP,6); 11,12: Inc(XP,5);
              13,14: Inc(XP,4); 15,16: Inc(XP,3); 17,18: Inc(XP,2);
              19,20: Inc(XP,1); end;
  end else if Zrecznosc < MonsterDex then begin
    m := MonsterDex - Zrecznosc;                  { 0x172BA..0x173AA }
    case m of 1,2: Inc(XP,12); 3,4: Inc(XP,13); 5,6: Inc(XP,14);
              7,8: Inc(XP,15); 9,10: Inc(XP,16); 11,12: Inc(XP,17);
              13,14: Inc(XP,18); 15,16: Inc(XP,19); 17,18: Inc(XP,20);
              19,20: Inc(XP,21); end;
  end else Inc(XP, 11);

  { ================= PART B  combat rounds (0x173BC..0x1800B) ====== }
  repeat
    MissFlag := 0; DirectHit := 0;                { [0x1BC],[0x1BA] }
    WriteStr('{monsterHP} {energy}');             { cs:0x3FBA..0x3FEC }

    { -- enemy strike determination, mooted by Zrecznosc vs MonsterDex,
    {    twin symmetrical tiered rolls 0x17418..0x17990 --            }
    if Zrecznosc > MonsterDex then d := Zrecznosc - MonsterDex        { 0x1BE }
    else d := MonsterDex - Zrecznosc;
    rnd := Random(TierHit(d));                    { 0x0C..0x17 }
    if rnd < 10 then MissFlag := 1;               { 0x1757B / 0x17837 }
    rnd := Random(TierDmg(d));                    { 0x3C..0x23 }
    if rnd < 10 then DirectHit := 1;

    if MissFlag = 0 then begin                    { 0x17990? -> 0x17D16 }
      Strike := Random(MonsterDmg);               { [0x1C0] random 0..n-1 }
      case Strike of                              { severity verb cs:0x40B7..0x4128 }
       0..5:   Write('{verb1} '); 6..20:  Write('{verb2} ');
       21..50: Write('{verb3} '); 51..MaxInt: Write('{verb4} ');
      end;
      WriteLongInt(Strike); Write(' {& damage suffix cs:0x40DE}'); WriteLn;
      Inc(XP, 1);                                 { hit XP tick 0x17AAC }
      helper_0x1691c;                             { near call 0x17AB4 }

      if (Parowanie > 0) and (Strike > 0) then    { 0x17AC1..0x17BD9 }
        if Random(140) <= Parowanie then begin
          if Strike < 3 then begin                { full parry }
            Write('{parry-full cs:0x415F}'); WriteLn;
            Strike := 0;
          end else if Strike <= 10 then begin
            Dec(Strike, 2);
            Write('{parry-reduce}'); WriteLongInt(Strike);
            Write('{cs:0x41E0}'); WriteLn;
          end else begin
            Dec(Strike, 3);
            Write('{parry-reduce}'); WriteLongInt(Strike);
            Write('{cs:0x41E0}'); WriteLn;
          end;
          if (rnd = 0) and (Parowanie < 100) then begin  { roll==0 -> train }
            Write('{parry-up cs:0x41E9}'); WriteLn;
            Inc(Parowanie, 1);
            Inc(XP, 5);
          end;
        end;

      Dec(Energy, Strike);                        { 0x17BD9 }

      if ([0x25E] > 0) and (Random(100) < 10) then begin { wound-tick 0x17BE3 }
        sound(14);
        dmg := Random(20);
        Write('{cs:0x422E}'); WriteLongInt(dmg); Write('{cs:0x40DE}'); WriteLn;
        Dec(Energy, dmg);
        Dec([0x25E]);
        sound(15);
      end;
      if ([0x25F] > 0) and (Random(100) < 10) then begin { wound-tick 0x17C62 }
        sound(4);
        Write('{cs:0x4266}'); WriteLn;
        Dec([0x25F]);
        sound(15);
        Inc([0x260], 10);                         { seed bleed ticks }
      end;
      if [0x260] > 0 then begin                   { bleed 0x17CBA }
        dmg := Random(5);
        Write('{cs:0x4286}'); WriteLongInt(dmg); Write('{cs:0x41E0}'); WriteLn;
        Dec(Energy, dmg);
        Dec([0x260]);
      end;
    end;

    if DirectHit = 0 then begin                   { -- player riposte 0x17D20 }
      Strike := Random(Sila);
      if 10 * Strike <= [0x224] then begin        { heavy-blow reroll loop }
        repeat                                    { 0x17D39..0x17D6E }
          Write('{cs:0x42A0}'); WriteLn;
          Strike := Random(Sila);
        until 10 * Strike > [0x224];
      end;
      Dec(MonsterHP, Strike);
      case Strike of                              { severity cs:0x42BE..0x432C }
       0..5:   Write('{verb1} '); 6..21:  Write('{verb2} ');
       21..51: Write('{verb3} '); 51..MaxInt: Write('{verb4} ');
      end;
      WriteLongInt(Strike); Write('{cs:0x40DE}'); WriteLn;
    end;

    sound(2000);                                  { 0x17E7E }

    { -- player KOPANIE (kick) 0x17E87..0x17F8D --------------------- }
    if (Kopanie > 0) and (ManaCur > [0x1CA])
                  and (Energy < [0x1CC]) then begin
      rnd := Random(100);
      if (Kopanie - 10) >= rnd then begin         { landed kick }
        dmg := Random(CharacterLevel) + Random(10);
        sound(14);
        Write('{cs:0x4363}'); WriteLongInt(dmg); Write('{cs:0x41E0}'); WriteLn;
        sound(15);
        Dec(ManaCur, Random(3) + 3);
        Dec(MonsterHP, dmg);
      end else begin                              { whiff }
        Write('{cs:0x437B}'); WriteLn;
        Dec(ManaCur, Random(2) + 2);
      end;
    end;

    { -- player UCIEKANIE (flee) 0x17F8D..0x1800B -------------------- }
    if (Uciekanie > 0) and (Energy < [0x1D0])
                  and (ManaCur > 14) then begin
      Dec(ManaCur, 15);
      if Random(100) <= Uciekanie then begin      { fled }
        [0x1D2] := 1;                             { flee flag }
        Write('{cs:0x439E}'); WriteLn;
        Dec(KUNSZT, 20);                          { flee costs skill }
      end else Write('{cs:0x43D1}'); WriteLn;     { failed }
    end;

    if (Energy >= 1) and (MonsterHP >= 1) and ([0x1D2] = 0)
      then continue;                              { jmp 0x173BC }
  until (Energy < 1) or (MonsterHP < 1) or ([0x1D2] <> 0);

  { ================= PART C  resolution (0x18023..0x181C6) ========== }
  if (MonsterHP < 1) and (Energy > 0) then begin  { ---- KILL reward }
    rw := XP;
    if EnergiaMax >  75 then Dec(rw, 2);          { 0x18037..0x180A8 }
    if EnergiaMax > 115 then Dec(rw, 3);
    if Parowanie  >  50 then Dec(rw, 2);
    if Parowanie  >  75 then Dec(rw, 2);
    if Parowanie  >  95 then Dec(rw, 1);
    if Kopanie    >  50 then Dec(rw, 5);
    if Kopanie    >  95 then Dec(rw, 2);
    if rw < 0 then rw := 0;
    Write('{ZYSKALES }'); WriteLongInt(rw); Write('{ PUNKTOW SILY }'); WriteLn;  { 0x4401 }
    Inc(KUNSZT, rw);
    [0x25E] := 0; [0x25F] := 0;                   { clear wounds }
    if [0x248] > 0 then Dec([0x24A]);             { quest kill count }

    if ([0x258] > 0) and (Random(100) < [0x258]) then begin  { talent-up 0x18110 }
      Write('{cs:0x4429}'); WriteLn;
      Dec([0x259], 10);
      Inc(MaxLoad, 1);                            { [0x182] }
      if (Random(100) <= 1) and ([0x258] < 100) then begin
        Write('{cs:0x445C}'); WriteLn;
        Inc([0x258]);
        Inc(KUNSZT, 10);
      end;
    end;
  end else if Energy < 1 then begin               { ---- knocked out }
    Write('{cs:0x447F}'); WriteLn;
    sound(3000);                                  { 0xBB8 }
    CurrentContext := 10000;                      { [0x1D6] := 0x2710 }
  end;

  XP := 0;                                        { [0x1B4] must reset }
end;
{ ================= string identifiers used (img offsets) ============ }
{ cs:0x3FBA '{mhp} --- {e}' status   cs:0x3FFB/0x4039/0x4064/0x408A dodge
{ cs:0x40B7/0x40E8/0x40FC/0x4128 strike verbs   cs:0x40DE suffix '{ } zadal ci'
{ cs:0x415F parry-void   cs:0x41A4/0x41E9 parry   cs:0x41E0 '{ }' suffix
{ cs:0x422E/0x4266/0x4286 wounds/bleed
{ cs:0x4363 kopanie hit   cs:0x437B kopanie miss
{ cs:0x439E flee   cs:0x43D1 flee-fail
{ cs:0x4401 'ZYSKALES '  cs:0x441F ' PUNKTOW SILY '
{ cs:0x4429 talent msg  cs:0x445C talent-up  cs:0x447F knock-out
{ cs:0x42A0/0x42BE/0x42F0/0x4302/0x432C riposte verbs
{ ================= launcher table (monster spawners) =================
{ caller img  guard          HP   Dex  Dmg  reward  = monster          }
{ 0x5DB4    [0x58]=12 (0x0C) 20   3    3    R10     = first dog (JAMNIK)}
{ 0x5DC6..  [0x5A]=14 (0x0E) 20   30   3    R15     = second dog        }
{ 0xB3CE..  [0x5C]=15 (0x0F) 40   3    3    R15     = third dog         }
{ 0xB695..  [0x5E]=16 (0x10) 40   11   10   R30     = fourth dog        }
{ 0x10981   [0x68C]=13(0x0D) 20   3    10   R15     = tracked slot 7    }
{ 0xD091    boss (auto)      200  15   18   [0x25E]:=5,[0x25F]:=1;
{          +quest [0x262]-=50 after win via 0x129D:0x3014/0x2E9E/0x30C1}
{ 0x13843   dummy (trening)  1    1    2    R3      = starter fight     }
{ After kill each launcher: MonsterRoomslot := 0, reward := Random(N)
{ ([0x212]) then [Money32] += reward (0x21A:0x21C) and prints it.      }
{ ================= helper routines in 0x129D ========================= }
{ 0x1691C helper called once per enemy turn (near call), 0x129D:0x3F4C }