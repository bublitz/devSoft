program ShellConVel;

uses
  Forms,
  SysUtils,
  Dialogs,
  Windows,
  untFuncoes in 'untFuncoes.pas',
  untMainShell in 'untMainShell.pas' {frmMain};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ConVel';
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
