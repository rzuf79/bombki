unit Dos;
{ checksum = $E727 }
interface

uses
uses  System;

const
  FCarry = raw@0113;
  FParity = raw@0126;
  FAuxiliary = raw@013C;
  FZero = raw@014D;
  FSign = raw@015E;
  FOverflow = raw@0173;
  fmClosed = raw@0187;
  fmInput = raw@019A;
  fmOutput = raw@01AE;
  fmInOut = raw@01C1;
  ReadOnly = raw@01D5;
  Hidden = raw@01E7;
  SysFile = raw@01FA;
  VolumeID = raw@020E;
  Directory = raw@0223;
  Archive = raw@0236;
  AnyFile = raw@0249;
type
  ComStr = string[127];
  PathStr = string[79];
  DirStr = string[67];
  NameStr = string[8];
  ExtStr = string[4];
  Registers = Record;
  FileRec = Record;
  TextBuf = array[Dos.ofs05C3] of System.ofs01CE;
  TextRec = Record;
  SearchRec = Record;
  DateTime = Record;
  DosError: System.ofs012A;
  function DosVersion: System.ofs013E;
  external;
  { Proc $0008 Entry 0:0000 }
  procedure Intr(      arg1: System.ofs0116; var   arg2: Registers);
  external;
  { Proc $0010 Entry 136:000B }
  procedure MsDos(var   arg1: Registers);
  external;
  { Proc $0018 Entry 136:0000 }
  procedure GetDate(var   arg1: System.ofs013E; var   arg2: System.ofs013E; var   arg3: System.ofs013E; var   arg4: System.ofs013E);
  external;
  { Proc $0020 Entry 8:0000 }
  procedure SetDate(      arg1: System.ofs013E;       arg2: System.ofs013E;       arg3: System.ofs013E);
  external;
  { Proc $0028 Entry 8:0022 }
  procedure GetTime(var   arg1: System.ofs013E; var   arg2: System.ofs013E; var   arg3: System.ofs013E; var   arg4: System.ofs013E);
  external;
  { Proc $0030 Entry 8:0036 }
  procedure SetTime(      arg1: System.ofs013E;       arg2: System.ofs013E;       arg3: System.ofs013E;       arg4: System.ofs013E);
  external;
  { Proc $0038 Entry 8:005B }
  procedure GetCBreak(var   arg1: System.ofs0172);
  external;
  { Proc $0040 Entry 16:0000 }
  procedure SetCBreak(      arg1: System.ofs0172);
  external;
  { Proc $0048 Entry 16:0012 }
  procedure GetVerify(var   arg1: System.ofs0172);
  external;
  { Proc $0050 Entry 24:0000 }
  procedure SetVerify(      arg1: System.ofs0172);
  external;
  { Proc $0058 Entry 24:000F }
  function DiskFree(      arg1: System.ofs0116): System.ofs0152;
  external;
  { Proc $0060 Entry 32:0000 }
  function DiskSize(      arg1: System.ofs0116): System.ofs0152;
  external;
  { Proc $0068 Entry 32:0019 }
  procedure GetFAttr(var   arg1: System.ofs0082; var   arg2: System.ofs013E);
  external;
  { Proc $0070 Entry 40:0000 }
  procedure SetFAttr(var   arg1: System.ofs0082;       arg2: System.ofs013E);
  external;
  { Proc $0078 Entry 40:0024 }
  procedure GetFTime(var   arg1: System.ofs0082; var   arg2: System.ofs0152);
  external;
  { Proc $0080 Entry 48:0000 }
  procedure SetFTime(var   arg1: System.ofs0082;       arg2: System.ofs0152);
  external;
  { Proc $0088 Entry 48:0027 }
  procedure FindFirst(      arg1: PathStr;       arg2: System.ofs013E; var   arg3: SearchRec);
  external;
  { Proc $0090 Entry 56:0000 }
  procedure FindNext(var   arg1: SearchRec);
  external;
  { Proc $0098 Entry 56:003E }
  procedure UnpackTime(      arg1: System.ofs0152; var   arg2: DateTime);
  external;
  { Proc $00A0 Entry 64:0000 }
  procedure PackTime(var   arg1: DateTime; var   arg2: System.ofs0152);
  external;
  { Proc $00A8 Entry 64:0044 }
  procedure GetIntVec(      arg1: System.ofs0116; var   arg2: System.ofs00AE);
  external;
  { Proc $00B0 Entry 72:0000 }
  procedure SetIntVec(      arg1: System.ofs0116;       arg2: System.ofs00AE);
  external;
  { Proc $00B8 Entry 72:0018 }
  function FSearch(      arg1: PathStr;       arg2: System.ofs00BA): PathStr;
  external;
  { Proc $00C0 Entry 80:0000 }
  function FExpand(      arg1: PathStr): PathStr;
  external;
  { Proc $00C8 Entry 88:0000 }
  procedure FSplit(      arg1: PathStr; var   arg2: DirStr; var   arg3: NameStr; var   arg4: ExtStr);
  external;
  { Proc $00D0 Entry 96:0000 }
  function EnvCount: System.ofs012A;
  external;
  { Proc $00D8 Entry 104:0000 }
  function EnvStr(      arg1: System.ofs012A): System.ofs00BA;
  external;
  { Proc $00E0 Entry 104:0009 }
  function GetEnv(      arg1: System.ofs00BA): System.ofs00BA;
  external;
  { Proc $00E8 Entry 112:0000 }
  procedure SwapVectors;
  external;
  { Proc $00F0 Entry 144:0000 }
  procedure Keep(      arg1: System.ofs013E);
  external;
  { Proc $00F8 Entry 120:0000 }
  procedure Exec(      arg1: PathStr;       arg2: ComStr);
  external;
  { Proc $0100 Entry 128:0000 }
  function DosExitCode: System.ofs013E;
  external;
  { Proc $0108 Entry 128:0094 }
