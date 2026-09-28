unit MONSTRA;
{ checksum = $242F }
interface

uses  crt;

var
  MAXE: Integer;
  JAMNIK: Integer;
  OWCZAREK: Integer;
  SPANIEL: Integer;
  PUDEL: Integer;
  PIESEK: Integer;
  TAKSOWKARZ: Integer;
  SPRZEDAWCA: Integer;
  ZAMIATACZ: Integer;
var
  PIJAK: Integer;
  ZEBRAK: Integer;
  MINIBARMAN: Integer;
  GRUBAS: Integer;
  DJ: Integer;
  PEDAL: Integer;
  PARA: Integer;
  MACIEK: Integer;
  OGOL: Integer;
  DRZWI: Integer;
  STARUCH: Integer;
var
  SILNY: Integer;
  procedure WSTEP;
  { Proc $0008 Entry 0:022B }
implementation

procedure WSTEP;
begin
  ClrScr;
  MAXE := 50;
  WriteLn('         |||||| ');
  WriteLn('         ||||||                     M&M=MILY MUD ');
  WriteLn('         ||||||     ');
  WriteLn(' /-----------------------\       /\  /\   | |   \./  ');
  WriteLn('|   /\           /\       |     /  \/  \  | |__  | ');
  WriteLn('|   \/           \/       |');
  WriteLn('|        /                |     /\  /\   |   |  |-\ ');
  WriteLn('| \     /___)      /      |    /  \/  \  |___|  |_/ ');
  WriteLn('|  \______________/       |');
  WriteLn('|   \____________/        |');
  WriteLn('\_________________________/');
  WriteLn('VERSJA CETA 0.86 23.05.99 - LAST MODYFIKACIONEN');
  WriteLn('NACISNIJ DOWOLNY KLAWISZ ABY ROZPOCZAC GRE');
  WriteLn('KORZYSTAJ Z DUZYCH LITER !!!!!!!!!!!!!!!!!');
  repeat
    Sound(100);
    Delay(100);
    Sound(200);
    Delay(100);
    Sound(300);
    Delay(100);
    Sound(400);
    Delay(100);
    Sound(500);
    Delay(100);
    Sound(600);
    Delay(100);
    Sound(500);
    Delay(100);
    Sound(400);
    Delay(100);
    Sound(300);
    Delay(100);
    Sound(200);
    Delay(100);
    WriteLn('TICK !!!');
  until KeyPressed;
  NoSound;
end;

end.
