program WinExplorer;

uses
  Forms,
  untMain in 'untMain.pas' {frmMain},
  untIncIcon in 'untIncIcon.pas' {frmIncIcon},
  untDatMod in 'untDatMod.pas' {dtMod: TDataModule},
  untFuncoes in 'untFuncoes.pas',
  untLogin in 'untLogin.pas' {frmLogin},
  Sobre in 'Sobre.pas' {AboutBox};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'devLock';
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmIncIcon, frmIncIcon);
  Application.CreateForm(TdtMod, dtMod);
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.Run;
end.
