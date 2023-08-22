program RelatDiarias;

uses
  Forms,
  untMain in 'untMain.pas' {frmMain},
  untCons in 'untCons.pas' {frmCons};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmCons, frmCons);
  Application.Run;
end.
