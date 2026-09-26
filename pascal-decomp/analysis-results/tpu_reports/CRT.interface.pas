unit Crt;
{ checksum = $D5E2 }
interface

uses  System;

const
  BW40 = raw@0111;
  CO40 = raw@0121;
  BW80 = raw@0131;
  CO80 = raw@0141;
  Mono = raw@0151;
  Font8x8 = raw@0164;
  C40 = raw@0173;
  C80 = raw@0182;
  Black = raw@0193;
  Blue = raw@01A3;
  Green = raw@01B4;
  Cyan = raw@01C4;
  Red = raw@01D3;
  Magenta = raw@01E6;
  Brown = raw@01F7;
  LightGray = raw@020C;
  DarkGray = raw@0220;
  LightBlue = raw@0235;
  LightGreen = raw@024B;
  LightCyan = raw@0260;
  LightRed = raw@0274;
  LightMagenta = raw@028C;
  Yellow = raw@029E;
  White = raw@02AF;
  Blink = raw@02C0;
  CheckBreak: Boolean;
  CheckEOF: Boolean;
  DirectVideo: Boolean;
  CheckSnow: Boolean;
  LastMode: Word;
  TextAttr: Byte;
  WindMin: Word;
  WindMax: Word;
  procedure AssignCrt(var   arg1: Text);
  external;
  { Proc $0008 Entry 16:0301 }
  function KeyPressed: Boolean;
  external;
  { Proc $0010 Entry 16:02CD }
  function ReadKey: Char;
  external;
  { Proc $0018 Entry 16:02DF }
  procedure TextMode(      arg1: Integer);
  external;
  { Proc $0020 Entry 16:013C }
  procedure Window(      arg1: Byte;       arg2: Byte;       arg3: Byte;       arg4: Byte);
  external;
  { Proc $0028 Entry 16:0151 }
  procedure GotoXY(      arg1: Byte;       arg2: Byte);
  external;
  { Proc $0030 Entry 16:01E4 }
  function WhereX: Byte;
  external;
  { Proc $0038 Entry 16:0210 }
  function WhereY: Byte;
  external;
  { Proc $0040 Entry 16:021C }
  procedure ClrScr;
  external;
  { Proc $0048 Entry 16:0191 }
  procedure ClrEol;
  external;
  { Proc $0050 Entry 16:01AB }
  procedure InsLine;
  external;
  { Proc $0058 Entry 16:01BF }
  procedure DelLine;
  external;
  { Proc $0060 Entry 16:01C4 }
  procedure TextColor(      arg1: Byte);
  external;
  { Proc $0068 Entry 16:0228 }
  procedure TextBackground(      arg1: Byte);
  external;
  { Proc $0070 Entry 16:0242 }
  procedure LowVideo;
  external;
  { Proc $0078 Entry 16:025A }
  procedure HighVideo;
  external;
  { Proc $0080 Entry 16:0260 }
  procedure NormVideo;
  external;
  { Proc $0088 Entry 16:0266 }
  procedure Delay(      arg1: Word);
  external;
  { Proc $0090 Entry 16:026D }
  procedure Sound(      arg1: Word);
  external;
  { Proc $0098 Entry 16:0299 }
  procedure NoSound;
  external;
  { Proc $00A0 Entry 16:02C6 }
