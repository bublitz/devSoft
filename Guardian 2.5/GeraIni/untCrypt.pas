unit untCrypt;

interface

uses SysUtils, Forms, WinTypes;

function Crypt(strText: string; intKey: longint): string;
function Decrypt(strText: string; intKey: longint): string;

const
  defKey = -947001;

implementation

function Crypt;
var
  i: integer;
  strResult: string;

begin
  RandSeed := intKey;
  strResult := strText;
  for i := 1 to Length(strText) do
    strResult[ i ] := Chr(Ord(strResult[ i ]) + Random(10)-5);
  crypt := strResult;
end;

function Decrypt;
begin
  Decrypt := Crypt(strText, intKey);
end;

end.

