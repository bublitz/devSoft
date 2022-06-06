program devServer;

uses
  Forms,
  untMain in 'untMain.pas' {frmMain},
  untFuncoes in '..\devSecurity\untFuncoes.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
