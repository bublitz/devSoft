program WinExplorer;

uses
  Forms,
  untMain in 'untMain.pas' {frmMain},
  untFuncoes in 'untFuncoes.pas',
  untLogin in 'untLogin.pas' {frmLogin},
  Sobre in 'Sobre.pas' {AboutBox},
  untAguarde in 'untAguarde.pas' {frmAguarde};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'devGameMan';
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.CreateForm(TfrmAguarde, frmAguarde);
  Application.Run;
end.
