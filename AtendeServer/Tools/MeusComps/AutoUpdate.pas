{
Componente   AutoUpdate
=======================
Versão       - 12/05/2006
Autor        - Ricardo Alves Carvalho
               ricardo.alves@fazenda.mg.gov.br
               ricardo@dbquester.com
Linguagem    - Delphi 2006 / Indy 10
Distribuição - Free, sem garantias

Funcionamento:
==============
1 - Habilitar a inclusão de informações de versão (Project/Options)
2 - Configurar as propriedades do FTP
3 - Criar um handler para o evento OnNeedVersion. Este handler deve
    informar qual a versão mais atual do programa, tipicamente bus-
    cando esta informação no banco de dados.
4 - Opcionalmente, criar um handler para o evento OnNeedDeploy.
    Este evento ocorre quando a versão atual é mais recente que
    a informada no evento OnNeedVersion e pode ser utilizada para
    chamar o método Deploy (envia a versão para o FTP) do
    componente.
5 - Opcionalmente, criar um handler para o evento OnCompareVersions.
    Dados dois identificadores de versão, este handler deve
    informar se iguais ou qual é a mais recente. Se a comparação for
    a padrão (1.0.0.0), o handler é desnecessário.

Exemplo de utilização:
======================

procedure Tdm.IBDatabase1AfterConnect(Sender: TObject);
begin
  aup1.UpdateMessage :=
    'Há uma nova versão do ' +
    Application.Title + ' disponível.'#13#10 +
    'A atualização automática será iniciada.';
  aup1.Execute;
end;

procedure Tdm.aup1NeedVersion(Sender: TObject; var DeployVersion: String);
begin
  qryVersao.Close;
  qryVersao.ParamByName('NOME').AsString := ExtractFileName(ParamStr(0));
  qryVersao.Open;
  if qryVersao.IsEmpty then
    raise Exception.Create(
      'O software não está na lista de atualização automática'
    );
  DeployVersion := qryVersao.FieldByName('VERSAO').AsString;
  qryVersao.Close;
end;

procedure Tdm.aup1NeedDeploy(Sender: TObject);
begin
  Deploy;
end;

procedure Tdm.Deploy;
begin
  if MessageDlg('Fazer deploy do ' + Application.Title + '?'#13#10#13#10 +
  'Atenção: Lembre-se de salvar o projeto antes do deploy!',
  mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    with TfrmSenha.Create(Self) do
    try
      if not ((ShowModal = mrOK) and (Edit1.Text = 'senha_do_admin')) then
        Exit;
    finally
      Free;
    end;
    aup1.Deploy;
    sqlUpVersao.ParamByName('NOME').AsString := ExtractFileName(ParamStr(0));
    sqlUpVersao.ParamByName('VERSAO').AsString := aup1.ExeVersion;
    sqlUpVersao.ExecQuery;
    sqlUpVersao.Transaction.CommitRetaining;
  end;
end;
}

unit AutoUpdate;

interface

uses
  Classes, SysUtils, Windows, Forms, Dialogs, Controls, IdFTP, IdAntiFreeze,
  unAtualizando, IdFTPCommon, IdComponent, IdAntiFreezeBase;

type
  TCompareVersions = procedure(Sender: TObject;
    ExeVersion, DeployVersion: string; var DeployIsLatest: Integer) of object;
  TNeedVersion = procedure (Sender: TObject;
    var DeployVersion: string) of object;

  TAutoUpdate = class(TComponent)
  private
    FOptionalUpdate: Boolean;
    FFTPHost: string;
    FFTPUser: string;
    FUpdateMessage: string;
    FFTPPassword: string;
    FOnCompareVersions: TCompareVersions;
    FOnNeedVersion: TNeedVersion;
    FOnNeedDeploy: TNotifyEvent;
    Client: TIdFTP;
    AntiFreeze: TIdAntiFreeze;
    FFTPDir: string;
    FFTPPassive: Boolean;
    BytesToTransfer: LongWord;
    procedure SetFTPHost(const Value: string);
    procedure SetFTPPassword(const Value: string);
    procedure SetFTPUser(const Value: string);
    procedure SetUpdateMessage(const Value: string);
    procedure SetOnCompareVersions(const Value: TCompareVersions);
    procedure SetOnNeedDeploy(const Value: TNotifyEvent);
    procedure SetOnNeedVersion(const Value: TNeedVersion);
    procedure SetOptionalUpdate(const Value: Boolean);
    procedure CreateClient;
    procedure SetFTPDir(const Value: string);
    procedure SetFTPPassive(const Value: Boolean);
    procedure FTPWorkBegin(Sender: TObject; AWorkMode: TWorkMode;
      AWorkCountMax: Integer);
    procedure FTPWork(Sender: TObject; AWorkMode: TWorkMode;
          AWorkCount: Integer);
    function GetExeVersion: string;
  protected
    procedure Update;
  public
    procedure Execute;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Deploy;
  published
    property FTPHost: string read FFTPHost write SetFTPHost;
    property FTPUser: string read FFTPUser write SetFTPUser;
    property FTPPassword: string read FFTPPassword write SetFTPPassword;
    property FTPDir: string read FFTPDir write SetFTPDir;
    property FTPPassive: Boolean read FFTPPassive write SetFTPPassive;
    property UpdateMessage: string read FUpdateMessage write SetUpdateMessage;
    property OptionalUpdate: Boolean
      read FOptionalUpdate write SetOptionalUpdate;
    property ExeVersion: string read GetExeVersion;
    // eventos
    property OnNeedVersion: TNeedVersion
      read FOnNeedVersion write SetOnNeedVersion;
    property OnCompareVersions: TCompareVersions
      read FOnCompareVersions write SetOnCompareVersions;
    property OnNeedDeploy: TNotifyEvent
      read FOnNeedDeploy write SetOnNeedDeploy;
  end;

  procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Ric', [TAutoUpdate]);
end;

{$WARN SYMBOL_PLATFORM OFF}

var
  frmAtualizando: TfrmAtualizando;

function VersaoExe: String;
type
  PFFI = ^vs_FixedFileInfo;
var
  F       : PFFI;
  Handle  : Dword;
  Len     : Longint;
  Data    : Pchar;
  Buffer  : Pointer;
  Tamanho : Dword;
  Parquivo: Pchar;
  Arquivo : String;
begin
  Arquivo  := Application.ExeName;
  Parquivo := StrAlloc(Length(Arquivo) + 1);
  StrPcopy(Parquivo, Arquivo);
  Len := GetFileVersionInfoSize(Parquivo, Handle);
  Result := '';
  if Len > 0 then
  begin
     Data:=StrAlloc(Len+1);
     if GetFileVersionInfo(Parquivo,Handle,Len,Data) then
     begin
        VerQueryValue(Data, '\',Buffer,Tamanho);
        F := PFFI(Buffer);
        Result := Format('%d.%d.%d.%d',
                         [HiWord(F^.dwFileVersionMs),
                          LoWord(F^.dwFileVersionMs),
                          HiWord(F^.dwFileVersionLs),
                          Loword(F^.dwFileVersionLs)]
                        );
     end;
     StrDispose(Data);
  end;
  StrDispose(Parquivo);
end;

function CompareVersion(UmaVersao, OutraVersao: String): Shortint;
var
  a, b, i, j: byte;
begin
  i := pos('.', UmaVersao);
  if i = 0 then
    a := StrToInt(UmaVersao)
  else
    a := StrToInt(copy(UmaVersao, 1, i-1));

  j := pos('.', OutraVersao);
  if j = 0 then
    b := StrToInt(OutraVersao)
  else
    b := StrToInt(copy(OutraVersao, 1, j-1));

  if a <> b then
  begin
    if a > b then
      result := 1
    else
      result := -1;
  end
  else if i = 0 then
      result := 0
  else
    result := CompareVersion(
      copy(UmaVersao,   i+1, length(UmaVersao)),
      copy(OutraVersao, j+1, length(OutraVersao))
    );
end;

function GetTmpDir: string;
var
  pc: PChar;
begin
  pc := StrAlloc(MAX_PATH + 1);
  GetTempPath(MAX_PATH, pc);
  Result := string(pc);
  StrDispose(pc);
end;

function GetTmpFileName(ext: string): string;
var
  pc: PChar;
begin
  pc := StrAlloc(MAX_PATH + 1);
  GetTempFileName(PChar(GetTmpDir), 'EZC', 0, pc);
  Result := string(pc);
  Result := ChangeFileExt(Result, ext);
  StrDispose(pc);
end;

function FileLength(FileName: string): integer;
var
  f: File of byte;
  oldMode: integer;
begin
  oldMode := FileMode;
  AssignFile(f, FileName);
  try
    FileMode := fmOpenRead;
    Reset(f);
    result := FileSize(f);
  finally
    CloseFile(f);
    FileMode := oldMode;
  end;
end;

{ TAutoUpdate }

constructor TAutoUpdate.Create(AOwner: TComponent);
begin
  inherited;
  UpdateMessage :=
    'Há uma nova versão do aplicativo disponível.'#13 +
    'A atualização automática será iniciada.';
end;

procedure TAutoUpdate.Execute;
var
  VersaoExecutavel, VersaoDisponivel: string;
  i: integer;
  botoes: TMsgDlgButtons;
begin
  if not Assigned(FOnNeedVersion) then
    raise Exception.Create(
      'O manipulador do evento OnNeedVersion é obrigatório.'
    );
  VersaoDisponivel := '';
  FOnNeedVersion(Self, VersaoDisponivel);
  if VersaoDisponivel = '' then
    raise Exception.Create('Versão disponível inválida (vazia).');
  VersaoExecutavel := VersaoExe;
  if VersaoExecutavel = '' then
    VersaoExecutavel := '1.0.0.0';

  i := CompareVersion(VersaoDisponivel, VersaoExecutavel);
  if Assigned(FOnCompareVersions) then
    FOnCompareVersions(Self, VersaoExecutavel, VersaoDisponivel, i);
  if i > 0 then
  begin
    botoes := [mbOK];
    if OptionalUpdate then
      Include(botoes, mbCancel);
    if MessageDlg(UpdateMessage, mtInformation, botoes, 0) = mrOk then
      Update;
  end
  else if (i < 0) and Assigned(FOnNeedDeploy) then
    FOnNeedDeploy(Self);
end;

procedure TAutoUpdate.SetFTPHost(const Value: string);
begin
  FFTPHost := Value;
end;

procedure TAutoUpdate.SetFTPPassword(const Value: string);
begin
  FFTPPassword := Value;
end;

procedure TAutoUpdate.SetFTPUser(const Value: string);
begin
  FFTPUser := Value;
end;

procedure TAutoUpdate.SetUpdateMessage(const Value: string);
begin
  FUpdateMessage := Value;
end;

procedure TAutoUpdate.SetOnCompareVersions(const Value: TCompareVersions);
begin
  FOnCompareVersions := Value;
end;

procedure TAutoUpdate.SetOnNeedDeploy(const Value: TNotifyEvent);
begin
  FOnNeedDeploy := Value;
end;

procedure TAutoUpdate.SetOnNeedVersion(const Value: TNeedVersion);
begin
  FOnNeedVersion := Value;
end;

procedure TAutoUpdate.SetOptionalUpdate(const Value: Boolean);
begin
  FOptionalUpdate := Value;
end;

procedure TAutoUpdate.Update;
var
  tempFile, NomeExe, batchName, NomeDos: string;
  lista: TStringList;
  existe: Boolean;
begin
  if FTPHost = '' then
    raise Exception.Create('FTPHost não definido');
  CreateClient;
  Client.Host     := FTPHost;
  Client.Username := FTPUser;
  Client.Password := FTPPassword;
  Client.Passive  := FTPPassive;

  if not Client.Connected then
    Client.Connect;
  if not Client.Connected then
    raise Exception.Create('Erro na conexão com o servidor de FTP');
  Client.ChangeDir(FTPDir);

  // verificar disponibilidade do arquivo no servidor
  NomeExe := ExtractFileName(Application.ExeName);
  lista := TStringList.Create;
  frmAtualizando := TfrmAtualizando.Create(Self);
  try
    Client.TransferType := ftASCII;
    Client.List(lista, NomeExe, False);
    existe := (lista.Count > 0) and
              (UpperCase(lista[0]) = UpperCase(NomeExe));
    if not existe then
      raise Exception.Create('Arquivo não disponível no servidor FTP.');

    // Exibir transferência para o usuário
    Client.TransferType := ftBinary;
    BytesToTransfer := Client.Size(NomeExe);
    frmAtualizando.Show;

    // baixar arquivo temporário
    tempFile := GetTmpDir + ChangeFileExt(NomeExe, '.tmp');
    Client.Get(NomeExe, tempFile, True);
    Client.Disconnect;
    if not FileExists(tempFile) then
      exit;

    // criar bath e sobrepor exe
    NomeDos := ExtractShortPathName(ParamStr(0));
    lista.Clear;
    batchname := GetTmpFileName('.bat');
    FileSetAttr(ParamStr(0), 0);
    lista.Add(':Label1');
    lista.Add('@echo off');
    lista.Add('del ' + NomeDos);
    lista.Add('if Exist ' + NomeDos + ' goto Label1');
    lista.Add('Move ' + tempFile + ' ' + NomeDos);
    lista.Add('Call ' + NomeDos);
    lista.Add('del ' + batchname);
    lista.SaveToFile(batchname);
    ChDir(GetTmpDir);
    WinExec(PChar(batchname), SW_HIDE);
  finally
    lista.Free;
    FreeAndNil(frmAtualizando);
    Application.Terminate;
  end;
end;

procedure TAutoUpdate.CreateClient;
begin
  if Client = nil then
  begin
    AntiFreeze         := TIdAntiFreeze.Create(nil);
    Client             := TIdFTP.Create(nil);
    Client.OnWorkBegin := FTPWorkBegin;
    Client.OnWork      := FTPWork;
  end;
end;

destructor TAutoUpdate.Destroy;
begin
  if Client <> nil then
  begin
    Client.Free;
    AntiFreeze.Free;
  end;
  inherited;
end;

procedure TAutoUpdate.SetFTPDir(const Value: string);
begin
  FFTPDir := Value;
end;

procedure TAutoUpdate.SetFTPPassive(const Value: Boolean);
begin
  FFTPPassive := Value;
end;

procedure TAutoUpdate.FTPWorkBegin(Sender: TObject; AWorkMode: TWorkMode;
  AWorkCountMax: Integer);
begin
  if AWorkCountMax > 0 then
    frmAtualizando.Max := AWorkCountMax
  else
    frmAtualizando.Max := BytesToTransfer;
end;

procedure TAutoUpdate.FTPWork(Sender: TObject; AWorkMode: TWorkMode;
  AWorkCount: Integer);
begin
  frmAtualizando.Position := AWorkCount;
end;

procedure TAutoUpdate.Deploy;
var
  NomeExe: string;
begin
  if FTPHost = '' then
    raise Exception.Create('FTPHost não definido');
  CreateClient;
  Client.Host     := FTPHost;
  Client.Username := FTPUser;
  Client.Password := FTPPassword;
  Client.Passive  := FTPPassive;

  if not Client.Connected then
    Client.Connect;
  if not Client.Connected then
    raise Exception.Create('Erro na conexão com o servidor de FTP');
  Client.ChangeDir(FTPDir);

  NomeExe := Application.ExeName;
  frmAtualizando := TfrmAtualizando.Create(Self);
  try
    Client.TransferType := ftBinary;
    BytesToTransfer := FileLength(NomeExe);
    Client.Put(NomeExe, ExtractFileName(NomeExe));
    frmAtualizando.Show;
    Client.Disconnect;
  finally
    FreeAndNil(frmAtualizando);
    Screen.Cursor := crDefault;
  end;
  ShowMessage('Deploy finalizado.');
end;

function TAutoUpdate.GetExeVersion: string;
begin
  result := VersaoExe;
end;

end.

