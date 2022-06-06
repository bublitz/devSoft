unit untFuncoes;

interface
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Menus, ComCtrls, Qrctrls, DBGrids, CheckLst,
  IniFiles, QuickRpt, Db, DBCtrls;

function GeraDG(Cod: string): string;
function Alltrim(Text : string) : string;
function StrZero(Num : Real ; Zeros,Deci: integer): string;
function Dec2Hora( hora: real  ): String;
function soma(st:string):integer;
function min( v1, v2: integer ): integer;
function MinToHoras( min: real ): string;
function DecToHex( v: integer ): string;

implementation

function GeraDG(Cod: string): string;
var
  d1: string;
  s1, i: integer;

begin
  s1 := 0;
  for i := 1 to Length(Cod) do
    s1 := s1 + StrToInt(Cod[i]) * i;
  d1 := IntToStr(10 - (s1 mod 10));

  GeraDG := Cod + d1[1];

end;

function Alltrim(Text : string) : string;
begin
while Pos(' ',Text) > 0 do
      Delete(Text,Pos(' ',Text),1);
      Result := Text;
end;

function StrZero(Num : Real ; Zeros,Deci: integer): string;
var
  tam, z : integer;
  res, zer : string;
begin
  Str(Num:Zeros:Deci, res);
  res := Alltrim(res);
  tam := length(res);
  zer := '';
  for z := 1 to (Zeros-tam) do
    zer := zer + '0';
  Result := zer+res;
end;

function Dec2Hora( hora: real  ): String;
begin
  Dec2Hora := TimeToStr(hora);
end;

function soma(st:string):integer;
var
  i, s: integer;
begin
  s := 0;
  for i := 1 to Length(st) do
    s := s + Ord(st[i]);
  soma := s;
end;

function min( v1, v2: integer ): integer;
begin
  if v1 < v2 then min := v1 else min := v2;
end;

function MinToHoras( min: real ): string;
var
  h, m, s, mi: integer;

begin
  mi := Trunc(min);
  s := Trunc((min-mi)*100);
  h := Trunc(Int(mi/60));
  m := mi-h*60;
  if min > 0 then
    MinToHoras := IntToStr(h)+'h'+IntToStr(m)+'m';
end;

function DecToHex( v: integer ): string;
begin
  case v of
   0: DecToHex := '0';
   1: DecToHex := '1';
   2: DecToHex := '2';
   3: DecToHex := '3';
   4: DecToHex := '4';
   5: DecToHex := '5';
   6: DecToHex := '6';
   7: DecToHex := '7';
   8: DecToHex := '8';
   9: DecToHex := '9';
  10: DecToHex := 'A';
  11: DecToHex := 'B';
  12: DecToHex := 'C';
  13: DecToHex := 'D';
  14: DecToHex := 'E';
  15: DecToHex := 'F';
  end;
end;

end.
