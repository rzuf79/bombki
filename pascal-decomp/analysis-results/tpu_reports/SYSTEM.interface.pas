unit System;
{ checksum = $C40A }
interface

  function Abs { special index $20 }
  function Addr { special index $BC }
  procedure Append { special index $7C }
  function ArcTan { special index $6C }
  procedure Assign { special index $28 }
  function Assigned { special index $C4 }
  procedure BlockRead { special index $8C }
  procedure BlockWrite { special index $90 }
type
  Boolean = boolean;
  procedure Break { special index $A0 }
  Byte = byte;
  Bytebool = boolean;
  Char = char;
  procedure ChDir { special index $70 }
  function Chr { special index $38 }
  procedure Close { special index $34 }
  Comp = comp;
  function Concat { special index $94 }
  procedure Continue { special index $A4 }
  function Copy { special index $90 }
  function Cos { special index $68 }
  function CSeg { special index $48 }
  procedure Dec { special index $88 }
  procedure Delete { special index $24 }
  procedure Dispose { special index $14 }
  Double = double;
  function DSeg { special index $4C }
  function Eof { special index $10 }
  function Eoln { special index $0C }
  procedure Erase { special index $3C }
  procedure Exclude { special index $AC }
  procedure Exit { special index $48 }
  function Exp { special index $74 }
  Extended = extended;
  procedure Fail { special index $9C }
const
  False = false;
  function FilePos { special index $14 }
  function FileSize { special index $18 }
  procedure FillChar { special index $58 }
  procedure Flush { special index $80 }
  function Frac { special index $9C }
  procedure FreeMem { special index $50 }
  procedure GetDir { special index $6C }
  procedure GetMem { special index $4C }
  procedure Halt { special index $44 }
  function Hi { special index $B0 }
  function High { special index $CC }
  procedure Inc { special index $84 }
  procedure Include { special index $A8 }
  procedure Insert { special index $20 }
  function Int { special index $60 }
type
  Integer = integer;
  function IOResult { special index $98 }
  function Length { special index $88 }
  function Ln { special index $70 }
  function Lo { special index $AC }
  function Low { special index $C8 }
  Longbool = longbool;
  Longint = longint;
  procedure Mark { special index $18 }
  function MaxAvail { special index $84 }
const
  MaxInt = 32767;
  MaxLongint = 2147483647;
  Mem:byte;
  function MemAvail { special index $80 }
  MemL:longint;
  MemW:word;
  procedure MkDir { special index $74 }
  procedure Move { special index $5C }
system allocator New;
  function Odd { special index $30 }
  function Ofs { special index $40 }
system open string type OpenString;
  function Ord { special index $34 }
  function ParamCount { special index $A8 }
  function ParamStr { special index $A4 }
type
  PChar = pchar;
  function Pi { special index $B8 }
  Pointer = pointer;
  Port:Byte;
  PortW:Word;
  function Pos { special index $8C }
  function Pred { special index $2C }
  function Ptr { special index $3C }
  function Random { special index $A0 }
  procedure Randomize { special index $60 }
  procedure Read { special index $0C }
  procedure ReadLn { special index $10 }
  Real = real;
  procedure Release { special index $1C }
  procedure Rename { special index $40 }
  procedure Reset { special index $2C }
  procedure Rewrite { special index $30 }
  procedure RmDir { special index $78 }
  function Round { special index $7C }
  procedure RunError { special index $98 }
  procedure Seek { special index $38 }
  function SeekEof { special index $08 }
  function SeekEoln { special index $04 }
  function Seg { special index $44 }
  procedure SetTextBuf { special index $94 }
  Shortint = shortint;
  function Sin { special index $64 }
  Single = single;
  function SizeOf { special index $58 }
  function SPtr { special index $54 }
  function Sqr { special index $24 }
  function Sqrt { special index $5C }
  function SSeg { special index $50 }
  procedure Str { special index $64 }
  function Succ { special index $28 }
  function Swap { special index $B4 }
  Text = text;
const
  True = true;
  function Trunc { special index $78 }
  procedure Truncate { special index $54 }
  function TypeOf { special index $C0 }
  function UpCase { special index $1C }
  procedure Val { special index $68 }
type
  Word = word;
  Wordbool = wordbool;
  procedure Write { special index $04 }
  procedure WriteLn { special index $08 }
  OvrCodeList: Word;
  OvrHeapSize: Word;
  OvrDebugPtr: Pointer;
  OvrHeapOrg: Word;
  OvrHeapPtr: Word;
  OvrHeapEnd: Word;
  OvrLoadList: Word;
  OvrDosHandle: Word;
  OvrEmsHandle: Word;
  HeapOrg: Pointer;
  HeapPtr: Pointer;
  HeapEnd: Pointer;
  FreeList: Pointer;
  FreeZero: Pointer;
  HeapError: Pointer;
  ExitProc: Pointer;
  ExitCode: Integer;
  ErrorAddr: Pointer;
  PrefixSeg: Word;
  StackLimit: Word;
  InOutRes: Integer;
  RandSeed: Longint;
  SelectorInc: Word;
  Seg0040: Word;
  SegA000: Word;
  SegB000: Word;
  SegB800: Word;
  Test8086: Byte;
  Test8087: Byte;
  FileMode: Byte;
  Input: Text;
  Output: Text;
  SaveInt00: Pointer;
  SaveInt02: Pointer;
  SaveInt1B: Pointer;
  SaveInt21: Pointer;
  SaveInt23: Pointer;
  SaveInt24: Pointer;
  SaveInt34: Pointer;
  SaveInt35: Pointer;
  SaveInt36: Pointer;
  SaveInt37: Pointer;
  SaveInt38: Pointer;
  SaveInt39: Pointer;
  SaveInt3A: Pointer;
  SaveInt3B: Pointer;
  SaveInt3C: Pointer;
  SaveInt3D: Pointer;
  SaveInt3E: Pointer;
  SaveInt3F: Pointer;
  SaveInt75: Pointer;
