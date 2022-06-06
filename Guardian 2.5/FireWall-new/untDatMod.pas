unit untDatMod;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  RXShell, ExtCtrls, Db, DBTables, AMReg, AMWinEnv, IniFiles;

type
  TdtMod = class(TDataModule)
    WinEnv: TAMWinEnv;
    AMR: TAMReg;
    DataSource1: TDataSource;
    tbMicro: TTable;
    Timer1: TTimer;
    RxTrayIcon1: TRxTrayIcon;
    procedure DataModuleCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtMod: TdtMod;
  computer: integer;

implementation

{$R *.DFM}

procedure TdtMod.DataModuleCreate(Sender: TObject);
var
  arqini: TIniFile;

begin
  //Form1.WindowState := wsMinimized;
  //Application.Minimize;
  arqini := TIniFile.Create( 'FireWall.ini' );
  computer := StrToInt(arqini.ReadString( 'Params', 'Computer', '1' ));
  arqini.free;
  tbMicro.Open;
end;

procedure TdtMod.Timer1Timer(Sender: TObject);
var
  ativa: boolean;

begin
  tbMicro.Refresh;
  if tbMicro.FindKey([computer]) then
  begin
    ativa := not tbMicro.FieldByName('Estado').AsBoolean;
    WinEnv.DisableSysKey := ativa;
    if ativa then
      WinEnv.DisableOption := [hoTrayBar, hoStartButton, hoDesktopIcons]
    else
      WinEnv.DisableOption := [];
  end;
end;

end.
