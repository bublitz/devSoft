unit untFuncoes;

interface

uses Windows, Dialogs, SysUtils, Forms;

function DifHora(Inicio, Fim: String): String;
function AScan(a: array of integer; valor: integer): integer;
function compart(PServer, PSenha, PLetra : PChar): boolean;
procedure Executa(comando: string);
procedure ExecutaDOS(comando: string);
procedure hideTaskbar;
procedure showTaskbar;
function dTimeToStr(hora: real): string;

implementation

function DifHora(Inicio, Fim: String): String;
var
  FIni, FFim : TDateTime;

begin
  Fini := StrTotime(Inicio);
  FFim := StrToTime(Fim);
  if (Inicio > Fim) then
    Result := TimeToStr((StrTotime('23:59:59')-Fini)+FFim)
  else
    Result := TimeToStr(FFim-Fini);
end;


function compart(PServer, PSenha, PLetra : PChar): boolean;
var
  err : Word;

Begin

  ERR := WNetAddConnection(PServer , PSenha , PLetra);

  CASE ERR of
  ERROR_ACCESS_DENIED : ShowMessage('Acesso negado.');
  ERROR_ALREADY_ASSIGNED : ShowMessage('A letra do drive especificada já está conectada.');
  ERROR_BAD_DEV_TYPE : ShowMessage('O tipo de dispositivo e o tipo de recurso não são compatíveis.');
  ERROR_BAD_DEVICE : ShowMessage('Letra inválida.');
  ERROR_BAD_NET_NAME : ShowMessage('Nome do servidor não é válido ou não pode ser localizado.');
  ERROR_BAD_PROFILE : ShowMessage('Formato incorreto de parâmetros.');
  ERROR_CANNOT_OPEN_PROFILE : ShowMessage('Conexão permanente não disponível.');
  ERROR_DEVICE_ALREADY_REMEMBERED : ShowMessage('Uma entrada para o dispositivo especificado já está no perfil do usuário.');
  ERROR_EXTENDED_ERROR : ShowMessage('Erro de rede.');
  ERROR_INVALID_PASSWORD : ShowMessage('Senha especificada inválida.');
  ERROR_NO_NET_OR_BAD_PATH : ShowMessage('A operação não foi concluída porque a rede não foi inicializada ou caminho é inválido.');
  ERROR_NO_NETWORK : ShowMessage('A rede não está presente.');
  else
    if Err > 0 then
      compart := False
    else
      compart := True;
    //ShowMessage (IntToStr(Err));
  end;
end;

function AScan( a: array of integer; valor: integer): integer;
var
  q, i: integer;

begin
  q := Length(a)-1;
  i := 0;
  while i <= q do
  begin
    if a[i] = valor then
      break;
    inc(i);
  end;
  if i <= q then
    AScan := i
  else
    AScan := -1;
end;

procedure Executa(comando: string);
var
  pi: TProcessInformation;
  si: TStartupInfo;

begin
  //WinExec(PChar(comando), SW_SHOWNORMAL); --> antigo
  FillMemory(@si, sizeof( si ), 0);
  si.cb := sizeof(si);
  CreateProcess(Nil, PChar(comando), Nil, Nil, False,
                NORMAL_PRIORITY_CLASS, Nil, Nil, si, pi);
  CloseHandle(pi.hProcess);
  CloseHandle(pi.hThread);
end;

procedure ExecutaDOS(comando: string);
var
  T: TextFile;
  linha: string;

begin
  AssignFile(T, ExtractFilePath(Application.ExeName) + 'game.bat');
  Rewrite(T);
  WriteLn(T, '@Echo Off');
  linha := ExtractFileDrive(comando);
  WriteLn(T, linha);
  linha := Copy(ExtractFileDir(comando),4,999);
  WriteLn(T, 'CD\"'+linha+'"');
  linha := ExtractFileName(comando);
  WriteLn(T, linha);
  CloseFile(T);
  linha := ExtractFilePath(Application.ExeName) + 'game.bat';
  Executa(linha);
end;

procedure hideTaskbar;
var
  wndHandle : THandle;
  wndClass : array[0..50] of Char;

begin
  StrPCopy(@wndClass[0], 'Shell_TrayWnd');
  wndHandle := FindWindow(@wndClass[0], nil);
  ShowWindow(wndHandle, SW_HIDE);
end;

procedure showTaskbar;
var
  wndHandle : THandle;
  wndClass : array[0..50] of Char;

begin
  StrPCopy(@wndClass[0], 'Shell_TrayWnd');
  wndHandle := FindWindow(@wndClass[0], nil);
  ShowWindow(wndHandle, SW_RESTORE);
end;

function dTimeToStr(hora: real): string;
var
  dias, horas: integer;
  tempo: string;

begin
  dias := Trunc(hora);
  if dias = 0 then
    Result := TimeToStr(hora)
  else
  begin
    tempo := TimeToStr(hora-dias);
    horas := StrToInt(Copy(tempo, 1, 2)) + dias*24;
    Result := IntToStr(horas) + Copy(tempo, 3, 6);
  end
end;

end.
