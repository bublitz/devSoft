program Trava;

uses
  Forms,
  untMain in 'untMain.pas' {frmMain};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
