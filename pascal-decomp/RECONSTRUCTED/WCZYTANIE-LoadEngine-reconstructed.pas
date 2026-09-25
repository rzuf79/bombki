{ ====================== WCZYTANIE (load engine) ======================   }
{ EXE procs decoded 2026-09-24:
{   * save()     img 0x2BA1 .. ~0x356E   (PRZEDM.save; 80 fields, WriteLn)   }
{   * wczytaj()  img 0x7D80 .. ~0x85FF  (PRZEDM.load; ReadLn mirror)        }
{   * trening    img 0x2396 .. 0x2B73  (skill training, 1x PRAKTYK[0x194]/ea) }
{   * level gate img 0x872D            (KUNSZT thresholds per level)        }
{                                                                           }
{ RTL text-file helpers used (all lcall 0x1C71:off):                        }
{   0x900 ReadLn(string) [stdin -> ds:0x564 cmd buffer]                     }
{   0x6C6 ReadLn(string) [same, in wczytaj]                                 }
{   0x2E6 Assign(plik, defname cs:0x7D6B 'pliku.tpu' <- save 0x2B97)        }
{   0x9263 (129D) Rewrite   |  0x364 Reset                                   }
{   0x72D ReadLn(plik, int/longint) -> AL/AX; longint in DX:AX               }
{   0x5FE line-flush (after each scalar, before waitkey 0x291)              }
{   0x7BD WriteLongint(cx:bx) / 0x789 WriteLongint(ax)                      }
{   0x7FA LongInt Add(cx:bx to dx:ax)                                       }
{                                                                           }
{ wczytaj() reads, IN save() ORDER, the 80 fields, then the player-name     }
{ Pascal string.  save()/wczytaj() transforms are exact inverses:           }
{                                                                           }
{   field   save():  [f] := expr           load(): [f] := raw^-1            }
{   f1  0x1AC  raw := ManaCur SHL 2        ManaCur := v SAR 2  (idiv 4)      }
{   f2  0x25C  raw := lvl + 0x17 (byte)    lvl     := v - 0x17  (byte)       }
{   f3  0x17E  raw := [0x17E]              raw                              }
{   f5  0x188  raw                        raw                               }
{   f6  0x184  raw                        raw                               }
{   f7  0x222  raw                        raw                               }
{   f8  0x1D4  raw := KUNSZT              KUNSZT := v                        }
{   f9  0x19C  raw := (Energy+0x28) SHL 2  Energy := v SAR 2 - 0x28 (40)     }
{   f10 0x180  raw                        PreviousRoomContext := v           }
{   f11 0x190  raw := Zrec + 0x0C         Zrec := v - 0x0C                   }
{   f12 0x18E  raw := Sila - 0x18         Sila := v + 0x18                   }
{   f13 0x18C  raw                        Madrosc := v                       }
{   f14 0x194  raw := Money WORD          Money := v                         }
{   f15 0x6C   raw                        (dev-path artifact)                }
{   f16 0x52  ...f17 0x1B2 ... f19 0x212  raw                               }
{   f18 0x21A:0x21C coins longint (DX:AX); raw = coins x MadroscCur (net-worth  }
{                       field encoding: @LMul on save, @LDiv on load — a       }
{                       reversible transform, not a round-trip loss)           }
{   f20 0x664 EnergiaMax  f21 0x62 MaxLoad  f22 0x25D byte                  }
{   f23 0x1AE ManaMax f24 0x198 SilaMax f25 0x19A ZrecznoscMax              }
{   f26 0x196 MadroscMax f27 0x182  f28 0x1C2 f29 0x224 HeavyBlowTresh       }
{   f30 0x54 f31 0x218 f32 0x686 f33 0x56 f34 0x58  (monster trackers)       }
{   f35 0x68C f36 0x5A f37 0x5C f38 0x5E f39 0x60 f40 0x6E                  }
{   f41 0x258 TalentChance (byte)  f42 0x74  f43 0x76  f44 0x186            }
{   f45 0x192 f46 0x1A2 f47 0x1A4 f48 0x1A6 f49 0x1A8 f50 0x1AA            }
{   f53 0x1C4 f54 0x1C6 Parowanie f55 0x1C8 Kopanie f56 0x1CA f57 0x1CC    }
{   f58 0x1CE Uciekanie f59 0x1D0 f60 0x1D2 f61 0x1D8 f62 0x216             }
{   f63 0x22E f64 0x257 (BYTE - Potrawki count) f65 0x1DA f66 0x1DC         }
{   f67 0x1DE f68 0x248 QUEST f69 0x24A f70 0x1E0 f71 0x25B f72 0x78        }
{   f73 0x259 f74 0x7C f75 0x230 f76 0x7A f77 0x68A f78 0x262 f79 0x255     }
{   f80 0x261                                                                 }

procedure wczytaj;
begin  { img 0x7D80 }
  Write('{prompt cs:0x68A8}'); WriteLn;                     { 0x7D14..0x7D2B }
  ReadLn(cmdline);                                          { 0x7D8F..0x7D98, 0x6C6, ds:0x564, 0xff }
  if cmd<>'{0x600d}' then if cmd='{0x601c}' then CurrentContext:=$47;  { 0x7D30..0x7D54 }
  Assign(plik, 'pliki.tpu');                                { 0x7DA7..0x7DB1, cs:0x7D6B, 0x2E6 }
  Reset(plik);                                              { 0x7DB9..0x7DBB, 0x364 }
  repeat until EOF=false;                                   { 0x7DCC.. }
  ManaCur := ReadLn div 4;                                  { f1  0x7DCF..0x7DE5, idiv 4 }
  Level   := ReadLn - 0x17;                                 { f2  0x7DED..0x7E06, byte }
  [0x17E] := ReadLn;                                        { f3  0x7E0E }
  [0x188] := ReadLn; [0x184] := ReadLn; [0x222] := ReadLn;  { f5..f7 }
  KUNSZT  := ReadLn;                                        { f8  0x7E7C }
  Energy  := ReadLn div 4 - 0x28;                           { f9  0x7E93..0x7EBC }
  PreviousRoomContext := ReadLn;                            { f10 0x7EBF }
  Zrecznosc := ReadLn - 0x0C;                               { f11 0x7ED6..0x7EF3 }
  Sila := ReadLn + 0x18;                                    { f12 0x7EF6..0x7F13 }
  Madrosc := ReadLn;                                        { f13 0x7F16 }
  Praktik := ReadLn;                                          { f14 0x7F2D }  { 0x194 word; practice counter }

  [0x6C] := ReadLn;                                         { f15 0x7F44 }
  [0x52] := ReadLn; [0x1B2] := ReadLn;                      { f16 f17 }
  Forsa := ReadLn;                                          { f18 0x7F89..0x7F9A, DX:AX -> [0x21A]/[0x21C] }
  { 0x7FA4..0x7FBB: Forsa := Forsa div MadroscCur           }
  {   mov ax,[0x18c]; cwd; mov cx,ax; mov bx,dx; mov ax,[0x21a]; mov dx,[0x21c]; }
  {   lcall 0x1C71:0x7FA (TP7 RTL @LDiv: DX:AX/CX:BX -> quoT DX:AX, rem CX:BX) }
  Forsa := Forsa div MadroscCur;                            { f18 inverse: net-worth/16 -> pocket coins }
  [0x212] := ReadLn; [0x664] := ReadLn; [0x62] := ReadLn;   { f19..f21 }
  [0x25D] := ReadLn; [0x1AE] := ReadLn; [0x198] := ReadLn;  { f22..f24 }
  [0x19A] := ReadLn; [0x196] := ReadLn; [0x182] := ReadLn;  { f25..f27 }
  [0x1C2] := ReadLn; [0x224] := ReadLn; [0x54] := ReadLn;   { f28..f30 }
  [0x218] := ReadLn; [0x686] := ReadLn; [0x56] := ReadLn;   { f31..f33 }
  [0x58] := ReadLn; [0x68C] := ReadLn; [0x5A] := ReadLn;    { f34..f36 }
  [0x5C] := ReadLn; [0x5E] := ReadLn; [0x60] := ReadLn;     { f37..f39 }
  [0x6E] := ReadLn; [0x258] := ReadLn; [0x74] := ReadLn;    { f40..f42 }
  [0x76] := ReadLn; [0x186] := ReadLn; [0x192] := ReadLn;   { f43..f45 }
  [0x1A2] := ReadLn; [0x1A4] := ReadLn; [0x1A6] := ReadLn;  { f46..f48 }
  [0x1A8] := ReadLn; [0x1AA] := ReadLn; [0x1C4] := ReadLn;  { f49..f53 }
  Parowanie := ReadLn; Kopanie := ReadLn;                    { f54 f55 }
  [0x1CA] := ReadLn; [0x1CC] := ReadLn; Uciekanie := ReadLn;{ f56..f58 }
  [0x1D0] := ReadLn; [0x1D2] := ReadLn; [0x1D8] := ReadLn;  { f59..f61 }
  [0x216] := ReadLn; [0x22E] := ReadLn; [0x257] := ReadLn;  { f62..f64, 0x257 byte }
  [0x1DA] := ReadLn; [0x1DC] := ReadLn; [0x1DE] := ReadLn;  { f65..f67 }
  QuestType := ReadLn; QuestMonsters := ReadLn;              { f68 f69 }
  [0x1E0] := ReadLn; [0x25B] := ReadLn; [0x78] := ReadLn;   { f70..f72 }
  [0x259] := ReadLn; [0x7C] := ReadLn; [0x230] := ReadLn;   { f73..f75 }
  [0x7A] := ReadLn; [0x68A] := ReadLn; [0x262] := ReadLn;   { f76..f78 }
  [0x255] := ReadLn; [0x261] := ReadLn;                     { f79 f80 }
  {then player-name Pascal string (ds:0x264) - last line}
  Close(plik);
  { print 'WROCONES DO GRY' style 4x cs:0x85A8, then proceed }
end;

{ ------------------ trening (img 0x2396..0x2B73) --------------------- }
{ command dispatch via ds:0x564 strcmp (0x9D7) - each jump = one skill;  }
{ every train costs 1 PRAKTYK ([0x194]--), all cap, then print new %:      }
{   cs:0x221d train UCIEKANIE [0x1CE]: need Madrosc>0? gates=[0x1CE]<0x55
{          [0x1CE] += Madrosc + Zrecznosc - 5                    (0x2886)  }
{   cs:0x2286 train POWRACANIE [0x78]: need Madrosc>0x11(17), <0x5A(90)
{          [0x78] += 2*Madrosc - 3                               (0x2930)  }
{   cs:0x22c8 train PAROWANIE [0x1C6]: need Madrosc>0x0F(15), Zrec>0x0B(11)
{          [0x1C6] += Madrosc + Zrecznosc - 0x0E(14)             (0x29C1)  }
{   cs:0x230c train SKILL_B [0x25D] (byte): need Madrosc>0x0B(11)
{          [0x25D] += 3*Madrosc - 9                              (0x2A5E)  }
{   cs:0x2354 train TALENT [0x258] (byte): need Madrosc>0x12(18), <0x5A(90)
{          [0x258] += Madrosc + 1                                (0x2AF8)  }
{ (Kopanie training block not in this window - ends at 0x2B73 pop bp; ret) }

{ ---------------- level gate (img 0x872D...) -------------------------- }
{ [0x25C] CharacterLevel vs KUNSZT[0x1D4] thresholds:                     }
{   lvl==1: need KUNSZT >= 0x2D5 (725)        (0x8740..0x874D)           }
{   lvl==2: need KUNSZT >= 0x2DA (730)        (0x874F..0x875E)           }
{   lvl>=3: threshold = 0x2DF + 2*lvl (i.e. 741+), via 2*lvl+0x2DF sums   }
{           on reaching threshold jump to 0x8BA2 (level-up handler).      }
{ adjacent map-floor strings cs:0x8681..0x872C ('...CZAS PODW...',        }
{ 'MAX ','MADROSC SILA...','MASZ TERAZ...' area)                          }