unit SWIAT;
{ checksum = $3B76 }
interface

uses  przedm, monstra, crt, System;

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
  (* BODY TODO: reconstruct from BOMBKI.EXE code disassembly.
     Linked code blocks & entries are documented in
     RE\tpu_reports\SWIAT.*.txt and RE\exe_reports\exe.*.txt *)
begin
  { unit-initialization: runs once at program start }
end.
