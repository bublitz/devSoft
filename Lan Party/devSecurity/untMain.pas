unit untMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, StdCtrls, Menus, ComCtrls, ImgList, ExtCtrls,
  DBClient, Buttons, ToolWin, ShellAPI, ScktComp, ShellCtrls, MMSystem;

type
  TRebootOperation = (roLogOff, roReboot, roShutDown, roSuspend, roHibernate);

  TfrmMain = class(TForm)
    MainMenu1: TMainMenu;
    Configurao1: TMenuItem;
    Ligar1: TMenuItem;
    Desligar1: TMenuItem;
    N1: TMenuItem;
    Explorer1: TMenuItem;
    N3: TMenuItem;
    Fechar1: TMenuItem;
    ImageList1: TImageList;
    Aes1: TMenuItem;
    Desligar2: TMenuItem;
    Reiniciar1: TMenuItem;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    btnLogin: TToolButton;
    btnLogout: TToolButton;
    ToolButton4: TToolButton;
    btnAtiva: TToolButton;
    btnDesativa: TToolButton;
    ToolButton7: TToolButton;
    ImageList2: TImageList;
    lblTempo: TLabel;
    lblUser: TLabel;
    Timer1: TTimer;
    Label2: TLabel;
    Label3: TLabel;
    ToolButton2: TToolButton;
    Sobre1: TMenuItem;
    Sobre2: TMenuItem;
    ToolButton3: TToolButton;
    sktClient: TClientSocket;
    Image1: TImage;
    Label1: TLabel;
    Label4: TLabel;
    Panel1: TPanel;
    Image2: TImage;
    Vdeo1: TMenuItem;
    Rede1: TMenuItem;
    ControladoresdeJogos1: TMenuItem;
    OpesRegionais1: TMenuItem;
    sistema1: TMenuItem;
    Internet1: TMenuItem;
    ShellListView1: TShellListView;
    procedure FormShow(Sender: TObject);
    procedure Fechar1Click(Sender: TObject);
    procedure btnAtivaClick(Sender: TObject);
    procedure btnDesativaClick(Sender: TObject);
    procedure Desligar1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure Desligar2Click(Sender: TObject);
    procedure Reiniciar1Click(Sender: TObject);
    procedure btnLoginClick(Sender: TObject);
    procedure btnLogoutClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Sobre2Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure sktClientConnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure sktClientRead(Sender: TObject; Socket: TCustomWinSocket);
    procedure Vdeo1Click(Sender: TObject);
    procedure Rede1Click(Sender: TObject);
    procedure Internet1Click(Sender: TObject);
    procedure ControladoresdeJogos1Click(Sender: TObject);
    procedure sistema1Click(Sender: TObject);
    procedure OpesRegionais1Click(Sender: TObject);
  private
    { Private declarations }
    podeFechar: boolean;
    tempoinicial: TTime;
    procdesl, procrein, proclogoff,
    metodesl, metorein, metologoff: integer;
    Operation: TRebootOperation;
    PowerOff: Boolean;
    ForceTerminateProcesses: Boolean;
    FOperation: TRebootOperation;
    FPowerOff: boolean;
    FForceTerminateProcesses: boolean;
    procedure Liga;
    procedure Desliga(MudaIni: boolean);
    procedure ManipulaExcecoes(Sender: TObject; E: Exception);
  public
    { Public declarations }
    ipserver, mensagem,
    wav_login, wav_logout, wav_error: string;
    porta: integer;
    function Tchau: boolean;
    procedure LogOff;
  end;

const
  cRebootFlags: array[TRebootOperation] of integer = (EWX_LOGOFF, EWX_REBOOT, EWX_SHUTDOWN, 0, 0);
  cPowerOff = EWX_POWEROFF;
  cForceTerminateProcesses = EWX_FORCE;
  cPrivilegeName = 'SeShutdownPrivilege';

var
  frmMain: TfrmMain;

implementation

{$DEFINE Desenv}

uses untFuncoes, untLogin, Sobre, untAguarde;

{$R *.dfm}

procedure TfrmMain.ManipulaExcecoes(Sender: TObject; E: Exception);
begin
  if Copy(E.Message, 1, 12) = 'Asynchronous' then
    MessageDlg('Não foi possível conectar ao servidor!',  mtInformation, [mbOK], 0)
  else
    MessageDlg(E.Message,  mtError, [mbOK], 0);
end;

{$IFNDEF Desenv}
function RegisterServiceProcess(dwProcessID, dwType: Integer): Integer;
         stdcall; external 'KERNEL32.DLL';
{$ENDIF}

function SetShutdownPrivilege(Enable: boolean): boolean;
var
  PrevPrivileges: TTokenPrivileges;
  Privileges: TTokenPrivileges;
  Token: THandle;
  dwRetLen: DWord;

begin
  Result := False;
  OpenProcessToken(GetCurrentProcess, TOKEN_ADJUST_PRIVILEGES or TOKEN_QUERY, Token);
  Privileges.PrivilegeCount := 1;
  if LookupPrivilegeValue(nil, PChar(cPrivilegeName), Privileges.Privileges[0].LUID) then
  begin
    if Enable then
      Privileges.Privileges[0].Attributes := SE_PRIVILEGE_ENABLED
    else
      Privileges.Privileges[0].Attributes := 0;
    dwRetLen := 0;
    Result := AdjustTokenPrivileges(Token, False, Privileges, SizeOf(PrevPrivileges), PrevPrivileges, dwRetLen);
  end;
  CloseHandle(Token);
end;

procedure TfrmMain.LogOff;
begin
  if proclogoff = 1 then
  begin
    Operation := roReboot;
    PowerOff := True;
    ForceTerminateProcesses := True;
    Tchau;
  end
  else
    ExitWindowsEx(metologoff, 0);
  WindowState := wsMinimized;
  podeFechar := True;
  Close;
end;

function TfrmMain.Tchau: boolean;
var
  Flags: integer;
begin
  SetShutdownPrivilege(true);
  if Operation in [roLogOff..roShutDown] then
  begin
    Flags := cRebootFlags[FOperation];
    if FPowerOff then Flags := Flags or cPowerOff;
    if FForceTerminateProcesses then Flags := Flags or cForceTerminateProcesses;
    Result := ExitWindowsEx(Flags, 0);
  end
  else
    Result := SetSystemPowerState(Operation = roSuspend, FForceTerminateProcesses);
  SetShutdownPrivilege(false);
end;

procedure TfrmMain.Liga;
var
  ini: TIniFile;

begin
  {$IFNDEF Desenv}
  ini := TIniFile.Create('system.ini');
  ini.WriteString('Boot','shell','WinExplorer.exe');
  ini.Free;
  {$ENDIF}
  Ligar1.Enabled := False;
  Desligar1.Enabled := True;
end;

procedure TfrmMain.Desliga(MudaIni: boolean);
var
  ini: TIniFile;

begin
  {$IFNDEF Desenv}
  if MudaIni then
  begin
    ini := TIniFile.Create('system.ini');
    ini.WriteString('Boot', 'shell', 'Explorer.exe');
    ini.Free;
  end;
  {$ENDIF}
  Ligar1.Enabled := True;
  Desligar1.Enabled := False;
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  {$IFNDEF Desenv}
  ShowWindow(Application.Handle, SW_HIDE);
  SetWindowLong(Application.Handle, GWL_EXSTYLE,
                GetWindowLong(Application.Handle, GWL_EXSTYLE) or WS_EX_TOOLWINDOW
                and not WS_EX_APPWINDOW);
  {$ENDIF}
end;

procedure TfrmMain.Fechar1Click(Sender: TObject);
begin
  Desliga(False);
  podeFechar := True;
  Close;
end;

procedure TfrmMain.btnAtivaClick(Sender: TObject);
begin
  {$IFNDEF Desenv}
  // chama Contra-Senha
  {$ENDIF}
  Configurao1.Enabled    := True;
  btnAtiva.ImageIndex    := 9;
  btnAtiva.Enabled       := False;
  btnDesativa.ImageIndex := 6;
  btnDesativa.Enabled    := True;
end;

procedure TfrmMain.btnDesativaClick(Sender: TObject);
begin
  Configurao1.Enabled    := False;
  btnAtiva.ImageIndex    := 8;
  btnAtiva.Enabled       := True;
  btnDesativa.ImageIndex := 7;
  btnDesativa.Enabled    := False;
end;

procedure TfrmMain.Desligar1Click(Sender: TObject);
begin
  Desliga(True);
end;

procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  canClose := podeFechar;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
var
  ini: TIniFile;
  logo: TFileName;
  numero: integer;

begin
  Application.OnException := ManipulaExcecoes;
  podeFechar := False;
  {$IFNDEF Desenv}
  SystemParametersInfo(97, Word(true), @numero, 0);
  RegisterServiceProcess(GetCurrentProcessID, 1);
  {$ENDIF}

  Liga;

  ini := TIniFile.Create('explore.ini');
  ipserver   := ini.ReadString('Application',    'IPServer',   'ipERROR');
  logo       := ini.ReadString('Application',    'Logo',       'logoERROR');
  porta      := ini.ReadInteger('Application',   'Port',    1972);
  procdesl   := ini.ReadInteger('Procedures',    'Desligar',   1);
  procrein   := ini.ReadInteger('Procedures',    'Reiniciar',  1);
  proclogoff := ini.ReadInteger('Procedures',    'Logoff',     1);
  metodesl   := ini.ReadInteger('ExitWindowsEx', 'Desligar',  12);
  metorein   := ini.ReadInteger('ExitWindowsEx', 'Reiniciar',  6);
  metologoff := ini.ReadInteger('ExitWindowsEx', 'Logoff',     4);
  wav_login  := ini.ReadString('Sounds', 'Login',  'Error');
  wav_logout := ini.ReadString('Sounds', 'Logout', 'Error');
  wav_error  := ini.ReadString('Sounds', 'Error',  'Error');
  ini.Free;

  if Pos('ERROR', ipserver)<> 0 then
  begin
    ShowMessage('Erro no Arquivo de Configuração - IPSERVER!!');
    ipserver := '127.0.0.1';
  end;

  if (Pos('ERROR', logo) = 0) and (FileExists(logo)) then
  begin
    Image1.Picture.Bitmap.LoadFromFile(logo);
    Image1.Repaint;
  end;
end;

procedure TfrmMain.Desligar2Click(Sender: TObject);
begin
  if procdesl = 1 then
  begin
    Operation := roShutDown;
    PowerOff := True;
    ForceTerminateProcesses := True;
    Tchau;
  end
  else
    ExitWindowsEx(metodesl, 0);
  WindowState := wsMinimized;
  podeFechar := True;
  Close;
end;

procedure TfrmMain.Reiniciar1Click(Sender: TObject);
begin
  if procdesl = 1 then
  begin
    Operation := roReboot;
    PowerOff := True;
    ForceTerminateProcesses := True;
    Tchau;
  end
  else
    ExitWindowsEx(metorein, 0);
  WindowState := wsMinimized;
  podeFechar := True;
  Close;
end;

procedure TfrmMain.btnLoginClick(Sender: TObject);
begin
  frmLogin.edtUser.Text := '';
  frmLogin.edtSenha.Text := '';
  frmLogin.StatusBar1.SimpleText := '';

  if frmLogin.ShowModal = mrOk then
  begin
    btnLogin.ImageIndex    := 1;
    btnLogin.Enabled       := False;
    btnLogout.ImageIndex   := 2;
    btnLogout.Enabled      := True;
    lblUser.Caption        := frmLogin.nickname;
    lblTempo.Caption       := '';
    tempoinicial           := frmLogin.tempoinic;
    Timer1.Enabled         := True;
    ShellListView1.Visible := True;
    Image1.Visible         := not ShellListView1.Visible;
  end;
end;

procedure TfrmMain.btnLogoutClick(Sender: TObject);
begin
  if Application.MessageBox('Confirma logout??', 'Atenção', MB_YESNO) = IDYES then
  begin
    if wav_logout <> 'Error' then
      SndPlaySound(PChar(frmMain.wav_logout), SND_ASYNC);
    sktClient.Active       := False;
    sktClient.Address      := ipserver;
    sktClient.Active       := True;
    ShellListView1.Visible := False;
    Image1.Visible         := not ShellListView1.Visible;
  end;
end;

procedure TfrmMain.Timer1Timer(Sender: TObject);
begin
  lblTempo.Caption := TimeToStr(Time-tempoinicial);
end;

procedure TfrmMain.FormActivate(Sender: TObject);
begin
  sktClient.Port            := porta;
  frmAguarde.sktClient.Port := porta;
  frmLogin.sktClient.Port   := porta;

  ShellListView1.Visible := False;
  ShellListView1.Visible := (frmAguarde.ShowModal = mrOk);

  Image1.Visible := not ShellListView1.Visible;

  if ShellListView1.Visible then
  begin
    btnLogin.ImageIndex    := 1;
    btnLogin.Enabled       := False;
    btnLogout.ImageIndex   := 2;
    btnLogout.Enabled      := True;
    lblUser.Caption        := Copy(mensagem, 13, 99);
    lblTempo.Caption       := '';
    tempoinicial           := StrToTime(Copy(mensagem, 4, 8));
    Timer1.Interval := 5000
  end
  else
    Timer1.Interval := 1000;

  Timer1.Enabled := True;
  WindowState    := wsMaximized;
end;

procedure TfrmMain.Sobre2Click(Sender: TObject);
begin
  AboutBox.ShowModal;
end;

procedure TfrmMain.ToolButton3Click(Sender: TObject);
begin
  Executa(ExtractFilePath(Application.ExeName)+'devBrows.exe');
end;

procedure TfrmMain.sktClientConnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  sktClient.Socket.SendText('FS:');
end;

procedure TfrmMain.sktClientRead(Sender: TObject;
  Socket: TCustomWinSocket);
var
  mens: string;

begin
  mens := Socket.ReceiveText;
  if Copy(mens, 1, 3) = 'OK:' then
  begin
    btnLogin.ImageIndex  := 0;
    btnLogin.Enabled     := True;
    btnLogout.ImageIndex := 3;
    btnLogout.Enabled    := False;
    Timer1.Enabled       := False;
    lblUser.Caption      := '';
    lblTempo.Caption     := '';
  end
  else
  begin
    raise exception.Create('Servidor ocupado!! Tente novamente!!');
  end;
  sktClient.Active := False;
end;

procedure TfrmMain.Vdeo1Click(Sender: TObject);
begin
  WinExec('RunDLL32.exe Shell32.DLL,Control_RunDLL Desk.cpl', SW_Show);
end;

procedure TfrmMain.Rede1Click(Sender: TObject);
begin
  WinExec('RunDLL32.exe Shell32.DLL,Control_RunDLL Netcpl.cpl', SW_Show);
end;

procedure TfrmMain.Internet1Click(Sender: TObject);
begin
  WinExec('RunDLL32.exe Shell32.DLL,Control_RunDLL INetcpl.cpl', SW_Show);
end;

procedure TfrmMain.ControladoresdeJogos1Click(Sender: TObject);
begin
  WinExec('RunDLL32.exe Shell32.DLL,Control_RunDLL Joy.cpl', SW_Show);
end;

procedure TfrmMain.sistema1Click(Sender: TObject);
begin
  WinExec('RunDLL32.exe Shell32.DLL,Control_RunDLL sysdm.cpl', SW_Show);
end;

procedure TfrmMain.OpesRegionais1Click(Sender: TObject);
begin
  WinExec('RunDLL32.exe Shell32.DLL,Control_RunDLL intl.cpl', SW_Show);
end;

end.

