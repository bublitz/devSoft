unit untMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  AMWinEnv, StdCtrls, IniFiles, AMReg, ExtCtrls,
  MMSystem, sysinfo;

type
  TfrmMain = class(TForm)
    WinEnv: TAMWinEnv;
    AMR: TAMReg;
    Timer1: TTimer;
    SI: TSysInfo;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    nomeini: string;
    showsenha: boolean;
  end;

var
  frmMain: TfrmMain;

implementation

uses untContraSenha;

{$R *.DFM}

procedure TfrmMain.FormCreate(Sender: TObject);
var
  arqini: TIniFile;

begin
  ShowWindow(Application.Handle, SW_HIDE);
  SetWindowLong(Application.Handle, GWL_EXSTYLE,
                GetWindowLong(Application.Handle, GWL_EXSTYLE) or WS_EX_TOOLWINDOW
                and not WS_EX_APPWINDOW);
  arqini := TIniFile.Create( 'FireWall.ini' );
  nomeini := arqini.ReadString( 'Params', 'ArqIni', '' );
  arqini.free;

  showsenha := (nomeini = '') or (FileExists(nomeini)=False);

  Timer1.Enabled := True;

end;

procedure TfrmMain.Timer1Timer(Sender: TObject);
var
  arqini: TIniFile;
  estado: string;

begin
  if showsenha then
    with frmContraSenha do
    begin
      lblData.Caption := DateToStr(Now);
      lblHora.Caption := TimeToStr(Now);

      if nomeini = '' then
        lblComp.Caption := SI.NetComputerName
      else
        lblComp.Caption := Copy(ExtractFileName(frmMain.nomeini),1,Length(ExtractFileName(frmMain.nomeini))-4);

      WinEnv.DisableOption := [hoTrayBar,hoTrayNotify,hoStartButton,hoAppSwitchBar,hoDesktopIcons];
      WinEnv.DisableSysKey := True;

      if frmContraSenha.ShowModal = mrOk then
         Halt(0);

      showsenha := False;
      WinEnv.DisableOption := [];
      WinEnv.DisableSysKey := False;
    end;


  arqini := TIniFile.Create( nomeini );
  estado := arqini.ReadString( 'Params', 'Estado', 'B' );
  arqini.Free;
  if estado = 'B' then
    ExitWindowsEx(EWX_LOGOFF,1);
    //Halt(0);
end;

end.
