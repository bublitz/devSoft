unit untCrypt;

interface

uses SysUtils, Forms, WinTypes;

function Crypt(strText: string; intKey: longint): string;
function Decrypt(strText: string; intKey: longint): string;
function vercgc(snrcgc: string): boolean;
function vercpf(snrcpf: string): boolean;

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

function vercpf ;
var
  WCPFCALC : STRING;
  WSOMACPF : INTEGER;
  WSX1     : SHORTINT;
  WCPFDIGT : INTEGER;

begin
 if (snrcpf <> '   .   .   -  ') and
     (snrcpf <> '') then
   {if snrcpf <> '   .   .   -  ' then}
       BEGIN
         try
         //snrCpf := Copy(snrcpf,1,3)+Copy(snrcpf,5,3)+
         //Copy(snrcpf,9,3)+Copy(snrcpf,13,2);
         wcpfcalc := copy(snrCpf, 1, 9);
         wsomacpf := 0;
         for wsx1:= 1 to 9 DO
             wsomacpf := wsomacpf + strtoint(copy(wcpfcalc, wsx1, 1)) * (11 - wsx1);
        wcpfdigt:= 11 - wsomacpf mod 11;
        if wcpfdigt in [10,11] then
            BEGIN
              wcpfcalc:= wcpfcalc + '0';
            END
        else
            BEGIN
              wcpfcalc := wcpfcalc +  inttoStr(wcpfdigt);
            END;
        wsomacpf:= 0;
        for wsx1:= 1 to 10 DO
             wsomacpf := wsomacpf + strtoint(copy(wcpfcalc, wsx1, 1)) * (12 - wsx1);
        wcpfdigt:= 11 - wsomacpf mod 11;
        if wcpfdigt in [10,11] then
            BEGIN
              wcpfcalc:= wcpfcalc + '0';
            END
        else
            BEGIN
              wcpfcalc := wcpfcalc +  inttoStr(wcpfdigt);
            END;
        if  snrcpf <> wcpfcalc then
           begin
             application.messagebox('C.P.F. Inválido !','Atenção!',mb_iconstop+mb_ok);
             vercpf := false;
           end
        else
             vercpf := true;
        except on econverterror do
        begin
                application.messagebox('CPF informado não é válido !','Atenção!',mb_iconstop+mb_ok);
                vercpf := false;
        end
        end
    END
end;

function vercgc ;
VAR
   WCGCCALC : STRING;
   WSOMACGC : INTEGER;
   WSX1     : SHORTINT;
   WCGCDIGT : INTEGER;
begin
  if (snrCGC <> '  .   .   /    -') and
     (snrCGC <> '') then
    BEGIN
        try
         //snrcgc := Copy(snrcgc,1,2)+Copy(snrcgc,4,3)+
         //Copy(snrcgc,8,3)+Copy(snrcgc,12,4)+Copy(snrcgc,17,2);
         wCgcCalc := Copy(snrcgc,1,12);
         WSOMACGC := 0;
         {-----------------------------}
         for wsx1:= 1 to 4 do
              wsomacgc:= wsomacgc + strtoint(copy(wcgccalc, wsx1, 1)) * (6 - wsx1);
         for wsx1:= 1 to 8 do
              wsomacgc:= wsomacgc + strtoint(copy(wcgccalc, wsx1 + 4, 1)) * (10 - wsx1);
         wcgcdigt:= 11 - wsomacgc mod 11;
         if wcgcdigt in [10,11] then
             BEGIN
               wcgccalc:= wcgccalc + '0';
             END
         else
             BEGIN
               wcgccalc := wcgccalc +  inttoStr(wcgcdigt);
             END;
         {---------------------------------}
         wsomacgc:= 0;
         for wsx1:= 1 to 5 do
              wsomacgc:= wsomacgc + strtoint(copy(wcgccalc, wsx1, 1)) * (7 - wsx1);
         for wsx1:= 1 to 8 do
              wsomacgc:= wsomacgc + strtoint(copy(wcgccalc, wsx1 + 5, 1)) * (10 - wsx1);
         wcgcdigt:= 11 - wsomacgc mod 11;
         if wcgcdigt in [10,11] then
             BEGIN
               wcgccalc:= wcgccalc + '0';
             END
         else
             BEGIN
               wcgccalc := wcgccalc +  inttoStr(wcgcdigt);
             END;
         if  snrcgc <> wcgccalc then
           begin
              application.messagebox('CNPJ Inválido !','Atenção!',mb_iconstop+mb_ok);
              vercgc := false ;
           end
         else
              vercgc := true ;
        except on econverterror do
        begin
          application.messagebox('CNPJ informado não é válido !','Atenção!',mb_iconstop+mb_ok);
          vercgc := false;
        end
        end
     END

end;

end.

