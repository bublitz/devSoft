unit Funcoes;

interface
  uses
    SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
    Forms, Dialogs, StdCtrls, DB, dbtables, untMain;

Function Left(inString : String; numChars : Byte) : String;
Function Right(inString : String; numChars : Byte) : String;
Function Len(inString : String) : Byte;
Function Empty(inString : String) : Boolean;
Function SubStr(inString : String; numChars, strSize : Byte) : String;
Function Stuff(putString, inString: String; where: Integer) : String;
Function Lower(inString : String) : String;
Function Instr(Temp_Item: String; From, Size: Byte): String;
Function Spaces(i:Byte):String;
Function LeadZeros(inString :String) : String;
Function Str2Bin(inString :String) : Real;
Function IfStr( Text, Pattern : String) : Integer;
Function DayOfWeek( Day : Integer ): String;
Function Fix(x : Real): Real;
Function myInt(s:string):integer;
Function Int(x : Real): Real;
Function ASC( inString : String ): Byte;
Function RAD( Degrees : Real ): Real;
Function DEG( Radians : Real ): Real;
Function LOG( x : Real ): Real;
Function SGN( x : Integer ): Integer;
Procedure DefSeg( SegValue : Integer );
Function TAN( x : Real ): Real;  { input must be in radians }
Function Input( prompt : String): String;
Function InputS( prompt : String): String;
Function InputI( prompt : String): Integer;
Function InputR( prompt : String): Real;
function vercgc(snrcgc:string):Boolean;
function vercpf(snrcpf:string):Boolean;
function Alltrim(Text : string) : string;
function BuscaDireita(Busca,Text : string) : integer;
function BuscaTroca(Text,Busca,Troca : string) : string;
function Repete(Caractere : char; nCaracteres : integer) : string;
function StrZero(Num : Real ; Zeros,Deci: integer): string;
function Pad(Text: string; Tamanho: integer) : string;
function Preenche( text: String; caracter: char; tamanho: integer ): string;
function iif( exp: boolean; val1, val2: variant ): variant;
function Extenso( nValor: real ): string;
FUNCTION EXTE( cValor: string ): string;
Function Exclui( inTable: TTable ): boolean;
Function Inclui( inTable: TTable ): boolean;
Function Insere( inTable: TTable ): boolean;

{.pa}
const

  WeekDays : Array[1..7] of String =
                         ('Sunday','Monday','Tuesday','Wednesday',
                          'Thursday','Friday','Saturday');

  Meses   : Array[1..12] of String =
                          ('Janeiro  ',
                           'Fevereiro',
                           'Marco    ',
                           'Abril    ',
                           'Maio     ',
                           'Junho    ',
                           'Julho    ',
                           'Agosto   ',
                           'Setembro ',
                           'Outubro  ',
                           'Novembro ',
                           'Dezembro ');
  CR = Chr(13);
  LF = Chr(10);
  FF = Chr(12);
  ESC = Chr(27);
  BS = Chr(08);
  Space = ' ';
  Yes = True;
  No = False;

Var
   Segment  : Word;         { Preset to zero }
   GMT      : Boolean;
   Suppress : Boolean;

Implementation

{
{+---------------------------------------------------------------------+}
{: Function FIX   -    Truncates x to an integer                       :}
{+---------------------------------------------------------------------+}
{: format :    v = FIX(x)                                              :}
{:                         FIX strips all  digits to the right of the  :}
{:                         decimal point and returns the value of the  :}
{:                         digits to the left of the decimal point.    :}
{:                                                                     :}
{:  The difference between FIX and INT is that FIX does not return the :}
{:  next lower number when x is negative.                              :}
{+---------------------------------------------------------------------+}
FUNCTION Fix(x : Real): Real;
Begin
  Fix := x - Frac(x);
End;

{+---------------------------------------------------------------------+}
{: Function INT   -    Truncates x to an integer                       :}
{+---------------------------------------------------------------------+}
{: format :    v = INT(x)                                              :}
{:                         INT strips all  digits to the right of the  :}
{:                         decimal point and returns the value of the  :}
{:                         digits to the left of the decimal point.    :}
{:                                                                     :}
{:  The difference between FIX and INT is that FIX does not return the :}
{:  next lower number when x is negative.                              :}
{+---------------------------------------------------------------------+}
FUNCTION Int(x : Real): Real;
Begin
  If x < 0 Then
    If Frac(x) >= 0.5 Then
      Int := (x+1) - Frac(x)
    Else
      Int := Fix(x)
  Else
    Int := Fix(x)
End;

{+-------------------------------------------------------+}
{: Function :  DayOfWeek  ( Get Day of the Week )        :}
{+-------------------------------------------------------+}
{:    Syntax : DayOfWeek ( <expN1> )                     :}
{:                                                       :}
{:    Action : Uses Day input value to obtain Weekday    :}
{:             ASCII string from constant array.         :}
{:                                                       :}
{: Result Type :  String                                 :}
{+-------------------------------------------------------+}
Function DayOfWeek( Day : Integer ): String;
Begin
  DayOfWeek := WeekDays[Day+1];
End;


{+-------------------------------------------------------+}
{: Function :  LEFT                                      :}
{+-------------------------------------------------------+}
{:    Syntax : LEFT ( <expC> , <expN> )                  :}
{:                                                       :}
{:     where : <expC> = character string                 :}
{:             <expN> = number of characters to return   :}
{:                      Integer value                    :}
{:                                                       :}
{:    Action : Returns a specified number of characters  :}
{:             in the character string <expC>, starting  :}
{:             from the leftmost character.              :}
{:                                                       :}
{: Result Type :  String                                 :}
{+-------------------------------------------------------+}
Function Left;
Begin
  Left := Copy(inString,1,numChars)
End;

{+-------------------------------------------------------+}
{: Function :  RIGHT                                     :}
{+-------------------------------------------------------+}
{:    Syntax : RIGHT ( <expC> , <expN> )                 :}
{:                                                       :}
{:     where : <expC> = character string                 :}
{:             <expN> = number of characters to return   :}
{:                      Integer value                    :}
{:                                                       :}
{:    Action : Returns the rightmost <expN> portion of a :}
{:             character string <expC>                   :}
{:                                                       :}
{: Result Type :  String                                 :}
{+-------------------------------------------------------+}
Function Right;
Var
  index : Byte;
Begin
  If numChars >= Length(inString) Then
    Right := inString
  Else
    Begin
      index := Length(inString) - numChars+1;
      Right := Copy(inString,index,numChars)
    End
End;
{.pa}
{+-------------------------------------------------------+}
{: Function :  LEN                                       :}
{+-------------------------------------------------------+}
{:    Syntax : LEN ( <expC> )                            :}
{:                                                       :}
{:     where : <expC> = character string                 :}
{:                                                       :}
{:    Action : Returns the dynamic length of character   :}
{:             string <expC>.  Nonprinting characters    :}
{:             and blanks are counted.                   :}
{:                                                       :}
{: Result Type :  Integer                                :}
{+-------------------------------------------------------+}
Function Len;
Begin
  Len :=  Ord(Length(inString));
End;

{.pa}
{+-------------------------------------------------------+}
{: Function :  EMPTY                                     :}
{+-------------------------------------------------------+}
{:    Syntax : EMPTY ( <expC1> )                         :}
{:                                                       :}
{:     where : <expC1> = character string                :}
{:                                                       :}
{:    Action : Returns TRUE if <expC1> contains only     :}
{:             SPACES (blanks).                          :}
{:                                                       :}
{: Result Type :  Boolean                                :}
{+-------------------------------------------------------+}
Function Empty;
Var
  index : Byte;
Begin
  index := 1;
  Empty := True;
  While (index <= Length(inString))and (index <> 0) do
    Begin
      If inString[index] = ' ' Then
	inc(index)
      Else
	Begin
	  Empty := False;
	  index := 0
	End;
    End;
End;

{.pa}
{+-------------------------------------------------------+}
{: Function :  SUBSTR                                    :}
{+-------------------------------------------------------+}
{:    Syntax : SUBSTR ( <expC>, <expN1>[, <expN2>] )     :}
{:                                                       :}
{:     where : <expC> = character string                 :}
{:             <expN1>,<expN2> = numeric value (Byte)    :}
{:                                                       :}
{:    Action : Returns a string of length <expN2> from   :}
{:             <expC>, beginning with the <expN1>th      :}
{:             character.  The <expN1> and <expN2> must  :}
{:             be in the range 1 to 255.  If <expN2> is  :}
{:             omitted or if there is fewer than <expN2> :}
{:             characters to the right of the <expN1>th  :}
{:             character, all rightmost characters       :}
{:             beginning with the <expN1>th character are:}
{:             returned.  If <expN1> is greater than the :}
{:             number of characters in <expC>, SUBSTR    :}
{:             returns a null string.                    :}
{:                                                       :}
{: Result Type :  String                                 :}
{+-------------------------------------------------------+}
Function SubStr;
Begin
  SubStr := Copy(inString, numChars, StrSize );
End;
{.pa}
{+-------------------------------------------------------+}
{: Function :  Stuff                                     :}
{+-------------------------------------------------------+}
{:    Syntax : Stuff  ( <expC1>, <expC2>, <expN1> )      :}
{:                                                       :}
{:     where : <expC1>,<expC2> = character string        :}
{:             <expN1> = numeric value (Byte)            :}
{:                                                       :}
{:    Action : Replaces a portion of one string <expC2>  :}
{:             with another string <expC1>.  The         :}
{:             characters in <expC2> beginning at        :}
{:             position <expN1> are replaced by the      :}
{:             characters in <expC1>.  The number of     :}
{:             characters replaced is equal to the length:}
{:             of string <expC1>.  However, the          :}
{:             replacement of characters never goes      :}
{:             beyond the original length of <expC2>.    :}
{:                                                       :}
{: Result Type :  String                                 :}
{+-------------------------------------------------------+}
Function Stuff;
Begin
  Insert(putString, inString, where);
  Stuff := inString;
End;
{.pa}
{+-------------------------------------------------------+}
{: Function :  LOWER                                     :}
{+-------------------------------------------------------+}
{:    Syntax : LOWER ( <expC1> )                         :}
{:                                                       :}
{:     where : <expC1> = character string                :}
{:                                                       :}
{:    Action : Returns the specified character           :}
{:             expression <expC1> in lowercase.          :}
{:                                                       :}
{: Result Type :  String                                 :}
{+-------------------------------------------------------+}
Function Lower;
Var
  index : Byte;  tempString : String;
Const
    Upset = ['A'..'Z'];
    LowSet = ['a'..'z'];
Begin
  For index := 1 to Length(inString) do
    Begin
      If inString[index] in UpSet Then
	tempString[index] := Chr(Ord(inString[index])+32)
      Else
	TempString[index] := inString[index];
    End;
  Lower := tempString;
End;
{+-----------------------------------------------------------+}
{: Function:    I n s t r  ( Instring )                      :}
{+-----------------------------------------------------------+}
{:   This function extracts a string beginning at pointer    :}
{: From in string Temp_Item for Size chars and returns Value.:}
{+-----------------------------------------------------------+}
Function Instr;
Begin
  Instr := Copy(Temp_Item, From, Size);
End;

{+-------------------------------------------------------+}
{: Function :  MkStr        ( Make String )              :}
{+-------------------------------------------------------+}
{:    Syntax : MkStr ( <expN1>, <expN2> )                :}
{:                                                       :}
{:     where : <expN1>,<expN2> = numeric values (integer):}
{:                                                       :}
{:    Action : Makes a string of length <expN2> from     :}
{:             Integer expression <expN1>.               :}
{:                                                       :}
{: Result Type :  String                                 :}
{+-------------------------------------------------------+}
{.pa}
{+-------------------------------------------------------+}
{: Function :  Spaces                                    :}
{+-------------------------------------------------------+}
{:    Syntax : Spaces ( <expN1> )                        :}
{:                                                       :}
{:     where : <expN1> = numeric value ( Byte )          :}
{:                                                       :}
{:    Action : Makes a string of length <expN1> which    :}
{:             contains Space characters.                :}
{:                                                       :}
{: Result Type :  String                                 :}
{+-------------------------------------------------------+}
Function Spaces;
Var
  zip : String[255];
Begin
  if i > 0 then begin
     FillChar(zip,i+1,' ');
     zip[0] := Chr(i);
     Spaces := Zip;
  end
  else Spaces := '';
End;

{+-------------------------------------------------------+}
{: Function :  LeadZeros                                 :}
{+-------------------------------------------------------+}
{:    Syntax : LeadZeros ( <expC1> )                     :}
{:                                                       :}
{:     where : <expC1> = character string input          :}
{:                                                       :}
{:    Action : replace the leading spaces in a string    :}
{:             with ASCII Zeros.                         :}
{:                                                       :}
{: Result Type :  String                                 :}
{+-------------------------------------------------------+}
Function LeadZeros;
Var i : Integer;
Begin
  i := 1;
  While inString[i] = ' ' do
    Begin
      inString[i] := Chr(48);
      inc(i);
    End;
  LeadZeros := inString;
End;
{.pa}
{+-------------------------------------------------------+}
{: Function :  Str2Bin ( String to Binary )              :}
{+-------------------------------------------------------+}
{:    Syntax : Str2Bin ( <expC1> )                       :}
{:                                                       :}
{:     where : <expC1> = Character string                :}
{:                                                       :}
{:    Action : converts a string containing an ASCII     :}
{:             numeric value to an number.               :}
{:                                                       :}
{: Result Type :  Real                                   :}
{+-------------------------------------------------------+}
Function Str2Bin;
Var
  i : Real;
  k : Integer;
Begin
  Val(inString,i,k);
  Str2Bin := i;
End;


{+-------------------------------------------------------+}
{: Function :  IfStr ( If StringB in StringA )           :}
{+-------------------------------------------------------+}
{:    Syntax : IfStr (<expC1>,<expC2>)                   :}
{:                                                       :}
{:     where : <expC1> = Character string                :}
{:             <expC2> = Character string                :}
{:                                                       :}
{:    Action : Determines if <expC2> exists within       :}
{:             <expC1>.                                  :}
{:                                                       :}
{: Result Type :  Integer                                :}
{: Result Values :  0 = char not in stringA              :}
{:                  1-n = position of <expC2> within     :}
{:                        <expC1>                        :}
{:                                                       :}
{+-------------------------------------------------------+}
Function IfStr( Text, Pattern  : String) : Integer;
Begin
  IfStr := Pos( Pattern, Text );
End;
{.pa}
{+-------------------------------------------------------+}
{: Function :  ASC   Get ASCII code from String          :}
{+-------------------------------------------------------+}
{:    Syntax : ASC ( <expS1> )                           :}
{:                                                       :}
{:     where : <expS1> = ASCII String                    :}
{:                                                       :}
{:    Action : Returns the numeric value of the first    :}
{:             character of the String expression.       :}
{:                                                       :}
{: Result Type :  Byte                                   :}
{+-------------------------------------------------------+}
Function ASC( inString : String ) : Byte;
Begin
  If Length( inString ) > 0 Then
    ASC := Ord( inString[1] )
  Else
    ASC := 0;
End;

{+-------------------------------------------------------+}
{: Function :  RAD   Convert from Degrees to Radians     :}
{+-------------------------------------------------------+}
{:    Syntax : RAD ( <expR1> )                           :}
{:                                                       :}
{:     where : <expR1> = Degrees of type Real            :}
{:                                                       :}
{:    Action : Converts a number (REAL) containing       :}
{:             Degrees to one expressed as Radians.      :}
{:                                                       :}
{: Result Type :  Real                                   :}
{+-------------------------------------------------------+}
Function RAD( Degrees : Real ) : Real;
Begin
  RAD := Degrees * ( Pi / 180 );
End;

{+-------------------------------------------------------+}
{: Function :  DEG   Convert from Radians to Degrees     :}
{+-------------------------------------------------------+}
{:    Syntax : DEG ( <expR1> )                           :}
{:                                                       :}
{:     where : <expR1> = Radians of type Real            :}
{:                                                       :}
{:    Action : Converts a number (REAL) containing       :}
{:             Radians to one expressed as Degrees.      :}
{:                                                       :}
{: Result Type :  Real                                   :}
{+-------------------------------------------------------+}
Function DEG( Radians : Real ) : Real;
Begin
  DEG := Radians * ( 180 / Pi );
End;
{.pa}
{+-------------------------------------------------------+}
{: Function :  LOG   Returns the Log                     :}
{+-------------------------------------------------------+}
{:    Syntax : DEG ( <expR1> )                           :}
{:                                                       :}
{:     where : <expR1> = number to obtain Log of         :}
{:                                                       :}
{:    Action : Returns the natural Logarithm of the      :}
{:             argument.                                 :}
{:                                                       :}
{: Result Type :  Real                                   :}
{+-------------------------------------------------------+}
Function LOG( x : Real ) : Real;
Begin
  LOG := LN( x );
End;

{+-------------------------------------------------------+}
{: Function :  SGN   Returns the Sign of argument        :}
{+-------------------------------------------------------+}
{:    Syntax : DEG ( <expI1> )                           :}
{:                                                       :}
{:     where : <expI1> = number to obtain Sign of        :}
{:                                                       :}
{:    Action : If <expI1> is positive SGN returns 1      :}
{:             If <expI1> is zero     SGN returns 0      :}
{:             If <expI1> is negative SGN returns -1     :}
{:                                                       :}
{: Result Type :  Integer                                :}
{+-------------------------------------------------------+}
Function SGN( x : Integer ): Integer;
Begin
  If x = 0 Then
    SGN := 0
  Else
    If x < 0 Then
      SGN := -1
    Else
      SGN := 1;
End;
{.pa}
{+-------------------------------------------------------+}
{:Procedure :  DEFSEG  (assign current segment register) :}
{+-------------------------------------------------------+}
{:    Syntax : DEFSEG ( <expI1> )                        :}
{:                                                       :}
{:     where : <expI1> = Integer value of Segment Reg    :}
{:                       Segment = Global Variable       :}
{:    Action : Assigns <expI1> to the Segment Register   :}
{+-------------------------------------------------------+}
Procedure DefSeg( SegValue : Integer);
Begin
  Segment := SegValue;
End;


{+-------------------------------------------------------+}
{: Function :  TAN   Computes Tangent of Angle           :}
{+-------------------------------------------------------+}
{:    Syntax : TAN ( <expR1> )                           :}
{:                                                       :}
{:     where : <expR1> = number to obtain TAN of         :}
{:                                                       :}
{:    Action : Returns the Tangent of angle in radians   :}
{:                                                       :}
{: Result Type :  Real                                   :}
{+-------------------------------------------------------+}
Function TAN( x : Real ) : Real;  { input must be in radians }
Begin
  TAN := Sin(x)*(1/Cos(x));
End;
{.pa}
Function Input( prompt : String): String;
Var
  t1 : String;
Begin
  Write(prompt);
  ReadLn(t1);
  Input := t1;
End;

Function InputS( prompt : String): String;
Var
  t1 : String;
Begin
  Write(prompt);
  ReadLn(t1);
  InputS := t1;
End;

Function InputI( prompt : String): Integer;
Var
  t1 : String;
Begin
  Write(Prompt);
  ReadLn(t1);
  InputI := Trunc( Str2Bin( t1 ) );
End;

Function InputR( prompt : String): Real;
Var
  t1 : String;
Begin
  Write(Prompt);
  ReadLn(t1);
  InputR := Str2Bin( t1 );
End;


Procedure Print(Tex : String);
Begin
  WriteLn(Tex);
End;


function vercpf ;
VAR
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
         snrCpf := Copy(snrcpf,1,3)+Copy(snrcpf,5,3)+
         Copy(snrcpf,9,3)+Copy(snrcpf,13,2);
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
                application.messagebox('Valor informado não é válido !','Atenção!',mb_iconstop+mb_ok);
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
         snrcgc := Copy(snrcgc,1,2)+Copy(snrcgc,4,3)+
         Copy(snrcgc,8,3)+Copy(snrcgc,12,4)+Copy(snrcgc,17,2);
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
              application.messagebox('C.G.C. Inválido !','Atenção!',mb_iconstop+mb_ok);
              vercgc := false ;
           end
         else
              vercgc := true ;
        except on econverterror do
        begin
          application.messagebox('Valor informado não é válido !','Atenção!',mb_iconstop+mb_ok);
          vercgc := false;
        end
        end
     END

end;

function Alltrim(Text : string) : string;
begin
while Pos(' ',Text) > 0 do
      Delete(Text,Pos(' ',Text),1);
      Result := Text;
end;

function BuscaDireita(Busca,Text : string) : integer;
var n,retorno : integer;
begin
retorno := 0;
for n := length(Text) downto 1 do
   begin
      if Copy(Text,n,1) = Busca then
         begin
            retorno := n;
            break;
         end;
   end;
Result := retorno;
end;

function BuscaTroca(Text,Busca,Troca : string) : string;
var n : integer;
begin
for n := 1 to length(Text) do
   begin
      if Copy(Text,n,1) = Busca then
         begin
            Delete(Text,n,1);
            Insert(Troca,Text,n);
         end;
   end;
Result := Text;
end;

function Repete(Caractere : char; nCaracteres : integer) : string;
var n : integer; CadeiaCar : string;
begin
CadeiaCar := '';
for n := 1 to nCaracteres do
    CadeiaCar := CadeiaCar + Caractere;
Result := CadeiaCar;
end;

function Preenche( text: String; caracter: char; tamanho: integer ): string;
var i: integer;
    q: boolean;
begin
   text := pad( text, tamanho );
   i := tamanho;
   q := true;
   while q = true do begin
      if text[ i ] = ' ' then
         text[ i ] := caracter
      else
         q := false;
      dec( i );
   end;
   preenche := text;
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

function Pad;
begin
 Pad := Copy(Text+Spaces(Tamanho),1,Tamanho);
end;

function iif( exp: boolean; val1, val2: variant ): variant;
begin
   if exp then
      iif := val1
   else
      iif := val2;
end;

function Extenso( nValor: real ): string;
const
   cBls : array[ 1..3 ] of string = ('Real','Mil','Milhao');
   cBlp : array[ 1..3 ] of string = ('Reais','Mil','Milhoes');

var
   cExt, cMilhao, cMilhar, cCentena, cCentavo, cValor: string;

begin
   cValor   := StrZero( nValor, 12, 2 );
   cMilhao  := SubStr(  cValor,  1, 3 );
   cMilhar  := SubStr(  cValor,  4, 3 );
   cCentena := SubStr(  cValor,  7, 3 );
   cCentavo := '0'+SubStr(  cValor, 11, 2 );

   if StrToInt( cMilhao ) > 0 then
      cExt := EXTE( cMilhao ) + iif( StrToInt( cMilhao ) > 1, cBlp[ 3 ], cBls[ 3 ] );

   if StrToInt( cMilhar ) > 0 then begin
      if StrToInt( cMilhao ) > 0 then cExt := cExt + ', ';
      cExt := cExt + EXTE( cMilhar ) + iif( StrToInt( cMilhar ) > 1, cBlp[ 2 ], cBls[ 2 ] );
   end;

   if ( StrToInt( cMilhao ) > 0 ) or ( StrToInt( cMilhar ) > 0 ) then
      if StrToInt( cCentena ) = 0 then
         if StrToInt( cMilhar ) = 0 then
            cExt := cExt + ' de Reais'
         else
            cExt := cExt + ' Reais';

   if StrToInt( cCentena ) > 0 then begin
      if ( StrToInt( cMilhao ) > 0 ) or ( StrToInt( cMilhar ) > 0 ) then cExt := cExt + ', ' ;
      cExt := cExt + EXTE( cCentena ) + iif( StrToInt( cCentena ) > 1, cBlp[ 1 ] , cBls[ 1 ]  );
   end;

   if StrToInt( cCentavo ) > 0 then begin
      if ( StrToInt( cMilhao ) > 0 ) or ( StrToInt( cMilhar ) > 0 ) or ( StrToInt( cCentena ) > 0 ) then
        cExt := cExt + ' e ';

      cExt := cExt + EXTE( cCentavo ) + iif( StrToInt( cCentavo ) > 1, 'Centavos', 'Centavo' );
   end;
   
   extenso := cExt;

end;

FUNCTION EXTE( cValor: string ): string;
const
   cCen: array[ 1..9 ] of string = ( 'Cento','Duzentos','Trezentos','Quatrocentos','Quinhentos',
            'Seiscentos','Setecentos','Oitocentos','Novecentos');

   cDzt: array[ 1..10 ] of string = ( 'Dez','Onze','Doze','Treze','Quatorze','Quinze','Dezesseis',
            'Dezessete','Dezoito','Dezenove' );

   cDez: array[ 1..9 ] of string = ( 'Dez','Vinte','Trinta','Quarenta','Cinquenta','Sessenta',
            'Setenta','Oitenta','Noventa' );

   cUni: array[ 1..10 ] of string = ( 'Um','Dois','Tres','Quatro','Cinco','Seis','Sete','Oito',
          'Nove','Dez');

var
   cRet: string;
   nValor: integer;

begin
   nValor := StrToInt( SubStr( cValor, 1, 1 ) );

   if nValor > 0 then
      if nValor = 1 then
         cRet := iif( StrToInt( SubStr( cValor, 2, 2 ) ) = 0, 'Cem', cCen[ nValor ] )
      else
         cRet := cCen[ nValor ];

   nValor := StrToInt( SubStr( cValor, 2, 2 ) );

   if ( nValor > 9 ) and ( nValor < 20 ) then begin
      nValor := nValor - 9;
      if StrToInt( SubStr( cValor, 1, 1 ) ) > 0 then
         cRet := cRet + ' e ';
      cRet := cRet + cDzt[ nValor ];
   end
   else begin
      nValor := StrToInt( SubStr( cValor, 2, 1 ) );
      if nValor > 0 then begin
         if StrToInt( SubStr( cValor, 1, 1 ) ) > 0 then
            cRet := cRet + ' e ';
         cRet := cRet + cDez[ nValor ];
      end;
      nValor := StrToInt( SubStr( cValor, 3, 1 ) );
      if nValor > 0 then begin
         if ( StrToInt( SubStr( cValor, 1, 1 ) ) > 0 ) or ( StrToInt( SubStr( cValor, 2, 1 ) ) > 0 ) then
            cRet := cRet + ' e ';
         cRet := cRet + cUni[ nValor ];
      end;
   end;

   EXTE := cRet + ' ';

end;

Function myInt(s:string):integer;
begin
   if s = '' then
      myInt := 0
   else
      try
      myInt := StrToInt( s );
      except
      myInt := 0;
      end;
end;

Function Exclui;
begin
   // verificar se tem permissão
   if Application.MessageBox( 'Confirma exclusão ?', 'Excluir Registro',
                              MB_OKCANCEL + MB_ICONWARNING) = IDOK then begin
      inTable.Delete;
      Exclui := True;
   end
   else
      Exclui := False;
end;

Function Inclui;
begin
   if not frmMain.Demo then
      inTable.Append
   else
      if inTable.RecordCount >= frmMain.MaxRecord then
         ShowMessage( 'Cópia de Demonstração!'#13#13'Atingiu o máximo de registros para esta Tabela !!')
      else inTable.Append;
   if inTable.State = dsInsert then
      inclui := True
   else
      inclui := False;
end;

Function Insere;
begin
   if not frmMain.Demo then
      inTable.Insert
   else
      if inTable.RecordCount >= frmMain.MaxRecord then
         ShowMessage( 'Cópia de Demonstração!'#13#13'Atingiu o máximo de registros para esta Tabela !!')
      else inTable.Insert;
   if inTable.State = dsInsert then
      insere := True
   else
      insere := False;
end;

end.

