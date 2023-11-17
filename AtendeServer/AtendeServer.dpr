program AtendeServer;

uses
  Forms,
  untMain in 'untMain.pas' {frmMain},
  untDM in 'untDM.pas' {DM: TDataModule},
  untPainel in 'untPainel.pas' {frmPainel};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
