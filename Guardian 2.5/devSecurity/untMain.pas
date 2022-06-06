unit untMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, StdCtrls, Menus, ComCtrls, ImgList, ExtCtrls,
  DBClient, Buttons, ToolWin, ShellAPI, ScktComp;

type
  TfrmMain = class(TForm)
    MainMenu1: TMainMenu;
    Configurao1: TMenuItem;
    Ligar1: TMenuItem;
    Desligar1: TMenuItem;
    N1: TMenuItem;
    Adicionarcone1: TMenuItem;
    N2: TMenuItem;
    Explorer1: TMenuItem;
    N3: TMenuItem;
    Fechar1: TMenuItem;
    ImageList1: TImageList;
    Aes1: TMenuItem;
    Desligar2: TMenuItem;
    Reiniciar1: TMenuItem;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    btnAtiva: TToolButton;
    btnDesativa: TToolButton;
    ImageList2: TImageList;
    lblTempo: TLabel;
    Timer1: TTimer;
    Label2: TLabel;
    ToolButton2: TToolButton;
    ListView1: TListView;
    Sobre1: TMenuItem;
    Sobre2: TMenuItem;
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
    AdicionarRemoverProgramas1: TMenuItem;
    ConfiguraMSDOSSYS1: TMenuItem;
    procedure Fechar1Click(Sender: TObject);
    procedure Adicionarcone1Click(Sender: TObject);
    procedure LeIcones(Sender: TObject);
    procedure btnAtivaClick(Sender: TObject);
    procedure btnDesativaClick(Sender: TObject);
    procedure Desligar1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Desligar2Click(Sender: TObject);
    procedure Reiniciar1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ListView1DblClick(Sender: TObject);
    procedure Sobre2Click(Sender: TObject);
    procedure Vdeo1Click(Sender: TObject);
    procedure Rede1Click(Sender: TObject);
    procedure Internet1Click(Sender: TObject);
    procedure ControladoresdeJogos1Click(Sender: TObject);
    procedure sistema1Click(Sender: TObject);
    procedure OpesRegionais1Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure AdicionarRemoverProgramas1Click(Sender: TObject);
    procedure ConfiguraMSDOSSYS1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
    tempoinicial: TTime;
    comando: TStringList;
    msdos:   TStringList;
    procdesl, procrein, proclogoff,
    metodesl, metorein, metologoff: integer;
    vhora, vminu: word;
    podeFechar: boolean;
    procedure Liga;
    procedure Desliga(MudaIni: boolean);
  public
    { Public declarations }
    ipserver, computername: string;
    function Tchau: boolean;
    procedure LogOff;
  end;

type
  TRebootOperation = (roLogOff, roReboot, roShutDown, roSuspend, roHibernate);

const
  cRebootFlags: array[TRebootOperation] of integer = (EWX_LOGOFF, EWX_REBOOT, EWX_SHUTDOWN, 0, 0);
  cPowerOff = EWX_POWEROFF;
  cForceTerminateProcesses = EWX_FORCE;
  cPrivilegeName = 'SeShutdownPrivilege';

var
  frmMain: TfrmMain;
  Operation: TRebootOperation;
  PowerOff: Boolean;
  ForceTerminateProcesses: Boolean;
  FOperation: TRebootOperation;
  FPowerOff: boolean;
  FForceTerminateProcesses: boolean;

implementation

uses untIncIcon, untDatMod, untFuncoes, Sobre, untContraSenha;

{$R *.dfm}

function RegisterServiceProcess(dwProcessID, dwType: Integer): Integer;
         stdcall; external 'KERNEL32.DLL';

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

procedure TfrmMain.LeIcones(Sender: TObject);
var
  ico: TIcon;
  i, q: integer;

begin
  ico := TIcon.Create;

  dtMod.Local.First;
  while not dtMod.Local.Eof do
  begin
    if (dtMod.LocalATALHO.AsString <> '') and
       (FileExists(dtMod.LocalATALHO.AsString)) then
    begin
      try
        if dtMod.LocalIcone.AsString <> '' then
          ico.LoadFromFile(dtMod.LocalICONE.AsString)
        else
          Ico.Handle := ExtractIcon(Handle, PChar(dtMod.LocalAtalho.AsString), 0);
      finally
        if not ico.Empty then
        begin
          ImageList1.AddIcon(ico);
          i := ImageList1.Count - 1;
          ListView1.Items.Add;
          q := ListView1.Items.Count - 1;
          ListView1.Items[q].Caption := dtMod.LocalNOME.AsString;
          ListView1.Items[q].ImageIndex := i;
          comando.Add(dtMod.LocalATALHO.AsString);
          msdos.Add(dtMod.LocalMSDOS.AsString);
        end;
      end;
    end;
    dtMod.Local.Next;
  end;
end;

procedure TfrmMain.Liga;
var
  ini: TIniFile;

begin
  ini := TIniFile.Create('system.ini');
  ini.WriteString('Boot','shell','WinExplorer.exe');
  ini.Free;
  Ligar1.Enabled := False;
  Desligar1.Enabled := True;
end;

procedure TfrmMain.Desliga(MudaIni: boolean);
var
  ini: TIniFile;

begin
  if MudaIni then
  begin
    ini := TIniFile.Create('system.ini');
    ini.WriteString('Boot','shell','Explorer.exe');
    ini.Free;
  end;
  Ligar1.Enabled := True;
  Desligar1.Enabled := False;
end;

procedure TfrmMain.Fechar1Click(Sender: TObject);
begin
  Desliga(False);
  podeFechar := True;
  Close;
end;

procedure TfrmMain.Adicionarcone1Click(Sender: TObject);
begin
  frmIncIcon.ShowModal;
  ListView1.Items.Clear;
  comando.Clear;
  msdos.Clear;
  LeIcones(Sender);
end;

procedure TfrmMain.btnAtivaClick(Sender: TObject);
begin
  frmContraSenha.ShowModal;
  if frmContraSenha.senha = frmContraSenha.edtSenha.Text then
  begin
    Configurao1.Enabled    := True;
    btnAtiva.ImageIndex    := 9;
    btnAtiva.Enabled       := False;
    btnDesativa.ImageIndex := 6;
    btnDesativa.Enabled    := True;
  end;
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

procedure TfrmMain.FormCreate(Sender: TObject);
var
  ini: TIniFile;
  logo: TFileName;
  numero: integer;
  I: DWord;
  compname: string;

begin
  I := MAX_COMPUTERNAME_LENGTH + 1;
  SetLength(computername, I);
  Windows.GetComputerName(PChar(computername), I);
  computername := string(PChar(computername));

  DecodeTime(Now, vhora, vminu, vminu, vminu);

  podeFechar := False;
  SystemParametersInfo(97, Word(true), @numero, 0);
  RegisterServiceProcess(GetCurrentProcessID, 1);

  Liga;

  ini := TIniFile.Create('explore.ini');
  logo       := ini.ReadString('Application',    'Logo',      'logoERROR');
  compname   := ini.ReadString('Application',    'ComputerName', 'compERROR');
  procdesl   := ini.ReadInteger('Procedures',    'Desligar',  1);
  procrein   := ini.ReadInteger('Procedures',    'Reiniciar', 1);
  proclogoff := ini.ReadInteger('Procedures',    'Logoff',    1);
  metodesl   := ini.ReadInteger('ExitWindowsEx', 'Desligar', 12);
  metorein   := ini.ReadInteger('ExitWindowsEx', 'Reiniciar', 6);
  metologoff := ini.ReadInteger('ExitWindowsEx', 'Logoff',    4);
  ini.Free;

  if Pos('ERROR', compname) = 0 then
    computername := compname;

  AboutBox.lblComp.Caption := computername;

  if (Pos('ERROR', logo) = 0) and (FileExists(logo)) then
  begin
    Image1.Picture.Bitmap.LoadFromFile(logo);
    Image1.Repaint;
  end;

  ListView1.Visible := FileExists('C:\Windows\efxtpgu.tmp') and FileExists('\\Recepcao\devsoft\'+computername+'.lck');
  Image1.Visible := not ListView1.Visible;
  if ListView1.Visible then
    Timer1.Interval := 5000
  else
    Timer1.Interval := 1000;

  Timer1.Enabled := True;
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

procedure TfrmMain.Timer1Timer(Sender: TObject);
var
  estado, arqexiste: boolean;
  hora: word;

begin
  estado := Image1.Visible;
  DecodeTime(Now, hora, vminu, vminu, vminu);

  if hora = vhora then
    arqexiste := FileExists('C:\Windows\efxtpgu.tmp')
  else
  begin
    arqexiste := FileExists('C:\Windows\efxtpgu.tmp') and
                 FileExists('\\Recepcao\devsoft\'+computername+'.lck');
    vhora := hora;
  end;

  if estado and arqexiste then
  begin
    tempoinicial := Time;
    Image1.Visible := False;
    ListView1.Visible := True;
    Label2.Caption := 'Tempo: ';
    Timer1.Interval := 5000;
    Timer1.Enabled := True;
  end;

  if not estado and not arqexiste then
  begin
    tempoinicial := 0;
    Label2.Caption := 'Hora: ';
    ListView1.Visible := False;
    Image1.Visible := True;
    Timer1.Interval := 1000;
    Timer1.Enabled := True;
    LogOff;
  end;
  lblTempo.Caption := TimeToStr(Time-tempoinicial);
end;

procedure TfrmMain.FormActivate(Sender: TObject);
begin
  WindowState := wsMaximized;
  ToolBar1.Visible := True;;
  comando := TStringList.Create;
  msdos := TStringList.Create;
  LeIcones(Sender);
end;

procedure TfrmMain.ListView1DblClick(Sender: TObject);
var
  i: integer;

begin
  i := ListView1.ItemIndex;
  if msdos[i] = 'T' then
    ExecutaDOS(comando[i])
  else
    Executa(comando[i]);
end;

procedure TfrmMain.Sobre2Click(Sender: TObject);
begin
  AboutBox.ShowModal;
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

procedure TfrmMain.FormResize(Sender: TObject);
begin
  ListView1.Top    := Image1.Top;
  ListView1.Left   := Image1.Left;
  ListView1.Width  := Image1.Width;
  ListView1.Height := Image1.Height;
end;

procedure TfrmMain.AdicionarRemoverProgramas1Click(Sender: TObject);
begin
  WinExec('RunDLL32.exe Shell32.DLL,Control_RunDLL appwiz.cpl', SW_Show);
end;

procedure TfrmMain.ConfiguraMSDOSSYS1Click(Sender: TObject);
var
  ini: TIniFile;

begin
  FileSetAttr('c:\msdos.sys', faArchive);
  ini := TIniFile.Create('c:\msdos.sys');
  ini.WriteInteger('Options', 'BootDelay', 0);
  ini.WriteInteger('Options', 'BootKeys', 0);
  ini.Free;
  FileSetAttr('c:\msdos.sys', faArchive+faReadOnly+faSysFile+faHidden);
  ShowMessage('MSDOS.SYS alterado com sucesso!!');
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  ShowWindow(Application.Handle, SW_HIDE);
  SetWindowLong(Application.Handle, GWL_EXSTYLE,
                GetWindowLong(Application.Handle, GWL_EXSTYLE) or WS_EX_TOOLWINDOW
                and not WS_EX_APPWINDOW);
end;

procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := podeFechar;
end;

end.

