unit untFuncoes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Menus, ComCtrls, Qrctrls, DBGrids, CheckLst,
  IniFiles, Db, DBCtrls, Registry;

type
  TSI = record
    UserName: string;
    CompName: string;
    ProdID: string;
    ProdKey: string;
    ProdType: string;
    WinType: string;
    CPUType: string;
    BIOSDate: string;
    BIOSInfo: string;
    NetName: string;
    SerialHD: string;
  end;

function Encrypt(const InString:string; StartKey,MultKey,AddKey:Integer): string;
function Decrypt(const InString:string; StartKey,MultKey,AddKey:Integer): string;
function GeraDG(s: string): string;
function soma(st: string):integer;
function SerialNum(FDrive: string): string;
function GetBiosInfo: string;
function SystemInformation: TSI;
function Mistura(s: string): string;
procedure GeraChaves(NomeEmpresa, Produto, Versao, Data, Hora,
             Computador, UserWindows, EmprWindows, BiosDate,
             SerialHD, BIOSInfo: string;
             var Chave1, Chave2, Chave3: string);

procedure GeraAtiva(NomeEmpresa, Produto, Versao, Data, Hora,
             Computador, UserWindows, EmprWindows,
             Chave1, Chave2, Chave3: string;
             var key1, key2, key3, key4, key5: string);

function ExecAndWait(const FileName, Params: string; const WindowState: Word): boolean;
function DefineDataHoraArq(NomeArq: string; DataHora: TDateTime): boolean;

implementation

{$R-} {$Q-}
function Encrypt(const InString:string; StartKey,MultKey,AddKey:Integer): string;
var I : Byte;
begin
  Result := '';
  for I := 1 to Length(InString) do
  begin
    Result := Result + CHAR(Byte(InString[I]) xor (StartKey shr 8));
    StartKey := (Byte(Result[I]) + StartKey) * MultKey + AddKey;
  end;
end;

function Decrypt(const InString:string; StartKey,MultKey,AddKey:Integer): string;
var I : Byte;
begin
  Result := '';
  for I := 1 to Length(InString) do
  begin
    Result := Result + CHAR(Byte(InString[I]) xor (StartKey shr 8));
    StartKey := (Byte(InString[I]) + StartKey) * MultKey + AddKey;
  end;
end;
{$R+} {$Q+}

function GeraDG(s: string): string;
var
  i, soma: integer;

begin
  soma := 0;
  for i := 1 to Length(s) do
  begin
    case s[i] of
    '0': soma := soma + 16;
    '1': soma := soma + 1;
    '2': soma := soma + 2;
    '3': soma := soma + 3;
    '4': soma := soma + 4;
    '5': soma := soma + 5;
    '6': soma := soma + 6;
    '7': soma := soma + 7;
    '8': soma := soma + 8;
    '9': soma := soma + 9;
    'A': soma := soma + 10;
    'B': soma := soma + 11;
    'C': soma := soma + 12;
    'D': soma := soma + 13;
    'E': soma := soma + 14;
    'F': soma := soma + 15;
    end;
  end;
  Result := IntToHex(soma mod 15, 1 );
end;

function soma(st: string): integer;
var
  i, s: integer;

begin
  s := 0;
  for i := 1 to Length(st) do
    s := s + Ord(st[i]);
  soma := s;
end;


function SerialNum(FDrive: string): string;
var
  Serial: DWord;
  DirLen, Flags: DWord;
  DLabel: array[0..11] of Char;

begin
  try
    GetVolumeInformation(PChar(FDrive+':\'),dLabel,12,@Serial,DirLen,Flags,nil,0);
    Result := IntToHex(Serial,8);
  except
    Result :='';
  end;
end;

function GetBiosInfo: string;
var
  p, q: pchar;

begin
  q := nil;
  p := PChar(Ptr($FE000));
  repeat
    if q <> nil then
    begin
      if (p^ in [#10, #13, ' '..'~' , '©' , '¸' ])  then
      begin
        if (p^ = #0) and (p - q >= 8) then
        begin
          Result := Result + TrimRight(String(q)) + #13#10;
        end;
        q := nil;
      end;
    end
    else
      if p^ in ['!'..'~' , '©' , '¸' ] then
    q := p;
    inc(p);
  until p > PChar(Ptr($FFFFF));
  Result := TrimRight(Result);
end;

function SystemInformation: TSI;
var
 RegIni  : TRegIniFile;
 si: TSI;

begin
 RegIni := TRegIniFile.Create('');
 with RegIni do
  begin
   RootKey := HKEY_LOCAL_MACHINE;
   LazyWrite := True;

   OpenKey('\SOFTWARE\Microsoft\Windows', False);
   SI.CompName := ReadString('CurrentVersion', 'RegisteredOrganization', '');
   SI.UserName := ReadString('CurrentVersion', 'RegisteredOwner', '');
   SI.ProdID   := ReadString('CurrentVersion', 'ProductId', '10025-FFF-3465457-65879');
   SI.ProdKey  := ReadString('CurrentVersion', 'ProductKey', 'D9FF9-ACDEF-98765-234FA-AEF54');
   SI.ProdType := ReadString('CurrentVersion', 'ProductType', 'Win9x');
   SI.WinType  := ReadString('CurrentVersion', 'Version', '9x');

   if SI.CompName+SI.UserName = '' then
   begin
     OpenKey('\SOFTWARE\Microsoft\Windows NT', False);
     SI.CompName := ReadString('CurrentVersion', 'RegisteredOrganization', '');
     SI.UserName := ReadString('CurrentVersion', 'RegisteredOwner', '');
     SI.ProdID   := ReadString('CurrentVersion', 'ProductId', '10025-FFF-3465457-65879');
     SI.ProdKey  := ReadString('CurrentVersion', 'ProductKey', 'D9FF9-ACDEF-98765-234FA-AEF54');
     SI.ProdType := ReadString('CurrentVersion', 'ProductType', 'Win9x');
     SI.WinType  := ReadString('CurrentVersion', 'Version', '9x');
   end;

   OpenKey('\Hardware\Description\System\CentralProcessor', False);
   SI.CPUType := ReadString('0', 'ProcessorNameString', 'Unknow');

   try
     SI.BIOSDate := String(PChar(Ptr($FFFF5)));
     SI.BIOSInfo := GetBiosInfo;
   except
     SI.BIOSDate := '01/01/1980';
     SI.BIOSInfo := '95876098v576376309876ynugrefuvfunsdugspodiufgpnvosif';
   end;

   OpenKey('\System\CurrentControlSet\Control\ComputerName', False);
   SI.NetName := ReadString('ComputerName', 'ComputerName', 'Unknow');

   if SI.NetName = 'Unknow' then
   begin
     OpenKey('\System\CurrentControlSet\Services\VxD', False);
     SI.NetName := ReadString('VNETSUP', 'ComputerName', 'Unknow');
   end;

   //OpenKey('\SOFTWARE\Microsoft\Windows\CurrentVersion',False);
   //di := readbinarydata ('FirstInstallDateTime',buf,sizeof(buf));

   Free;
  end;
  si.SerialHD := SerialNum('c');
  result := si;
end;

function Mistura(s: string): string;
var
  i: integer;
  r: string;

begin
  Randomize;
  r := '';
  while Length(r) < 50 do
  begin
    i := Random(Length(s));
    if (i > 0) and (i < Length(s)) then
    if i mod 2 = 0 then
      r := r + Trim(IntToHex(Ord(s[i]), 2))
    else
      r := r + Trim(IntToHex(255-Ord(s[i]), 2));
  end;
  Result := Copy(r, Random(30), 15);
end;

procedure GeraChaves;
  function Inverte(s: string): string;
  var
    r: string;
    i: integer;
  begin
    r := s;
    for i := 1 to Length(s) do
      r[Length(s)-i+1] := s[i];
    Result := r;
  end;

var
  som1, som2, som3: int64;
  i: integer;
  r, c1, c2, c3: string;

begin
  //Gera Três Chaves
  som1 := soma(Computador+UserWindows+EmprWindows);
  som2 := soma(BiosDate+SerialHD+BIOSInfo);
  som3 := soma(NomeEmpresa+Produto+Versao+Data+Hora+
               Computador+UserWindows+EmprWindows+
               BiosDate+SerialHD);

  Randomize;
  c1 := IntToHex(Random(som1)+som2+Random(som2)*som1, 6);

  r := '';
  for i := 1 to length(BiosDate) do
    if BiosDate[i] in ['1','2','3','4','5','6','7','8','9','0'] then
      r := r + BiosDate[i];

  if r = '' then r := IntToStr(Random(som1));

  c2 := IntToHex(Random(StrToInt(r))+som3*Random(som3)+StrToInt(r), 6);

  Chave1 := Inverte(IntToHex(som1*som1+som1, Length(IntToStr(som1*som1+som1))))+
            IntToHex(som1*som1+som1, Length(IntToStr(som1*som1+som1)));
  Chave1 := Chave1 + GeraDG(Chave1);

  Chave2 := Inverte(IntToHex(som2*som2+som2, Length(IntToStr(som2*som2+som2))))+
            IntToHex(som2*som2+som2, Length(IntToStr(som2*som2+som2)));
  Chave2 := Chave2 + GeraDG(Chave2);

  c3 := Mistura(Chave1+Chave2+NomeEmpresa+Produto+Versao+Data+Hora+Chave1+Chave2+
              Computador+UserWindows+EmprWindows+BiosDate+BIOSInfo)+
        IntToHex(som3*som3+som3, Length(IntToStr(som3*som3+som3)));

  som3 := soma(c3);

  Chave3 := Mistura(IntToHex(som3*som3+som3, Length(IntToStr(som3*som3+som3))));
  Chave3 := Chave3 + GeraDG(Chave3);

end;

procedure GeraAtiva;
  function GeraKey(s: string): string;
  var
    i, q: integer;
    r, t: string;

  begin
    r := '';
    for i := 1 to Length(s) do
      if i mod 2 = 0 then
        r := r + IntToHex(255-Ord(s[i]), 2)
      else
        r := r + IntToHex(Ord(s[i]), 2);

    q := Trunc(Length(r)/2);
    t := Copy(r, q-3, 5);

    Result := t;
  end;

  function Inverte(s: string): string;
  var
    r: string;
    i: integer;
  begin
    r := s;
    for i := 1 to Length(s) do
      r[Length(s)-i+1] := s[i];
    Result := r;
  end;

var
  newkey, chave, k1, k2, k3, k4, k5: string;
  i: integer;

begin
  chave := Chave3+GeraDG(Chave1+Chave2);
  chave := chave + GeraKey(NomeEmpresa+Produto+Versao+Data+Hora+
               Computador+UserWindows+EmprWindows);
  newkey := '';
  for i := 1 to Length(chave) do
    if i mod 2 = 0 then
      newkey := newkey + IntToHex(255-Ord(chave[i]), 2)
    else
      newkey := newkey + IntToHex(Ord(chave[i]), 2);

  k1 := GeraKey(chave3+newkey);
  k2 := GeraKey(Inverte(k1)+newkey);
  k3 := GeraKey(k1+k2+Inverte(newkey));
  k4 := GeraKey(chave3+k1+Inverte(k2+k3)+newkey);
  k5 := GeraKey(k1+k2+Inverte(k3+k4+newkey));

  {k1 := GeraKey(k1+GeraDG(k5)+chave3);
  k2 := GeraKey(k2+GeraDG(k4)+chave3);
  k3 := GeraKey(k3+GeraDG(k3)+chave3);
  k4 := GeraKey(k4+GeraDG(k2)+chave3);
  k5 := GeraKey(k5+GeraDG(k1)+chave3);}

  Key1 := k1[1]+k2[1]+k3[1]+k4[1]+GeraDG(k5);
  Key2 := k5[2]+k1[2]+k2[2]+k3[2]+GeraDG(k4);
  Key3 := k4[3]+k5[3]+k1[3]+k2[3]+GeraDG(k3);
  Key4 := k3[4]+k4[4]+k5[4]+k1[4]+GeraDG(k2);
  Key5 := k2[5]+k3[5]+k4[5]+k5[5]+GeraDG(k1);
end;

function ExecAndWait(const FileName, Params: string;
  const WindowState: Word): boolean;
var
  SUInfo: TStartupInfo;
  ProcInfo: TProcessInformation;
  CmdLine: string;

begin
  CmdLine := '"' + Filename + '"' + Params;
  FillChar(SUInfo, SizeOf(SUInfo), #0);
  with SUInfo do
  begin
    cb := SizeOf(SUInfo);
    dwFlags := STARTF_USESHOWWINDOW;
    wShowWindow := WindowState;
  end;
  Result := CreateProcess(nil, PChar(CmdLine), nil, nil, false,
                          CREATE_NEW_CONSOLE or NORMAL_PRIORITY_CLASS, nil,
                          PChar(ExtractFilePath(Filename)), SUInfo, ProcInfo);
  if Result then
  begin
    WaitForSingleObject(ProcInfo.hProcess, INFINITE);
    CloseHandle(ProcInfo.hProcess);
    CloseHandle(ProcInfo.hThread);
  end;
end;

function DefineDataHoraArq(NomeArq: string; DataHora: TDateTime): boolean;
var
  F: integer;

begin
  Result := false;
  F := FileOpen(NomeArq, fmOpenWrite or fmShareDenyNone);
  try
    if F > 0 then
      Result := FileSetDate(F, DateTimeToFileDate(DataHora)) = 0;
  finally
    FileClose(F);
  end;
end;

end.

