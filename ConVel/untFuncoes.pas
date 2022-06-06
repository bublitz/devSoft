unit untFuncoes;

interface

uses Windows, Dialogs, SysUtils;

function EncryptSTR(const InString:string; StartKey,MultKey,AddKey:Integer): string;
function AScan( a: array of integer; valor: integer): integer;
function compart(PServer, PSenha, PLetra : PChar): boolean;
function ExecAndWait(const FileName, Params: string;
  const WindowState: Word): boolean;

implementation

{$R-} {$Q-}
function EncryptSTR(const InString:string; StartKey,MultKey,AddKey:Integer): string;
var I : Byte;
begin
  Result := '';
  for I := 1 to Length(InString) do
  begin
    Result := Result + CHAR(Byte(InString[I]) xor (StartKey shr 8));
    StartKey := (Byte(Result[I]) + StartKey) * MultKey + AddKey;
  end;
end;
{$R+} {$Q+}

function compart(PServer, PSenha, PLetra : PChar): boolean;
var
  err : Word;

begin
  ERR := WNetAddConnection ( PServer , PSenha , PLetra );
  case ERR of
    ERROR_ACCESS_DENIED : ShowMessage ( 'Acesso negado.' );
    ERROR_ALREADY_ASSIGNED : ShowMessage ( 'A letra do drive especificada já está conectada.' );
    ERROR_BAD_DEV_TYPE : ShowMessage ( 'O tipo de dispositivo e o tipo de recurso não são compatíveis.' );
    ERROR_BAD_DEVICE : ShowMessage ( 'Letra inválida.' );
    ERROR_BAD_NET_NAME : ShowMessage ( 'Nome do servidor não é válido ou não pode ser localizado.' );
    ERROR_BAD_PROFILE : ShowMessage ( 'Formato incorreto de parâmetros.' );
    ERROR_CANNOT_OPEN_PROFILE : ShowMessage ( 'Conexão permanente não disponível.' );
    ERROR_DEVICE_ALREADY_REMEMBERED : ShowMessage ( 'Uma entrada para o dispositivo especificado já está no perfil do usuário.' );
    ERROR_EXTENDED_ERROR : ShowMessage ( 'Erro de rede.' );
    ERROR_INVALID_PASSWORD : ShowMessage ( 'Senha especificada inválida.' );
    ERROR_NO_NET_OR_BAD_PATH : ShowMessage ( 'A operação não foi concluída porque a rede não foi inicializada ou caminho é inválido.' );
    ERROR_NO_NETWORK : ShowMessage ( 'A rede não está presente.' );
  else
    if Err > 0 then
      compart := False
    else
      compart := True;
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

end.
