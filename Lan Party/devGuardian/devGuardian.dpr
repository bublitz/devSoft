program devGuardian;

uses
  Forms,
  Controls,
  untMain in 'untMain.pas' {frmMain},
  untDatModPrinc in '..\devAdm\untDatModPrinc.pas' {dmPrinc: TDataModule},
  untFuncoes in '..\devSecurity\untFuncoes.pas',
  untData in 'untData.pas' {frmData},
  untFlash in 'untFlash.pas' {frmSplash},
  untLogin in 'untLogin.pas' {frmLogin};

{$R *.res}

begin
  Screen.Cursor := crSQLWait;
  frmSplash := TfrmSplash.Create(Application);
  frmSplash.Show;
  frmSplash.Refresh;
  //Application.Initialize;
  Application.Title := 'devGuardian';
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TdmPrinc, dmPrinc);
  Application.CreateForm(TfrmData, frmData);
  Application.CreateForm(TfrmLogin, frmLogin);
  Screen.Cursor := crDefault;
  Application.Run;
end.
