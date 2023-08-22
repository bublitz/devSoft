unit Funcoes;

interface
  uses
    SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
    Forms, Dialogs, StdCtrls;


function Alltrim(Text : string) : string;
function StrZero(Num : Real ; Zeros,Deci: integer): string;
procedure Clear(var A: array of integer);
procedure Sort(var A: array of integer);
function Find(A: array of integer; v: integer): Integer;

{.pa}
Implementation

function Find(A: array of integer; v: integer): Integer;
var
  I: Integer;
begin
  find := -1;
  for I := Low(A) to High(A) do
    if A[I] = v then begin
       find := i;
       break;
    end;
end;

procedure Sort(var A: array of integer);
var
  I, T, V: Integer;
begin
  for T := Low(A) to High(A)-1 do
     for I := Low(A) to High(A)-1 do
        if A[I] > A[I+1] then begin
           V := A[I];
           A[I] := A[I+1];
           A[I+1] := V
        end;
end;

procedure Clear(var A: array of integer);
var
  I: Integer;
begin
  for I := Low(A) to High(A) do A[I] := 0;
end;

function Alltrim(Text : string) : string;
begin
while Pos(' ',Text) > 0 do
      Delete(Text,Pos(' ',Text),1);
      Result := Text;
end;

function StrZero(Num : Real ; Zeros,Deci: integer): string;
var tam,z : integer;
    res,zer : string;
begin
Str(Num:Zeros:Deci, res);
res := Alltrim(res);
tam := length(res);
zer := '';
for z := 1 to (Zeros-tam) do
    zer := zer + '0';
Result := zer+res;
end;

end.
