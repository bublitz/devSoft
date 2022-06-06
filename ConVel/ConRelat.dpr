program ConRelat;

uses
  Forms,
  untMain in 'untMain.pas' {frmMain},
  untDatModRelat in 'untDatModRelat.pas' {dmPrinc: TDataModule},
  untRepAnaResumo in 'untRepAnaResumo.pas' {rptAnaResumo},
  untRepAnaQuilo in 'untRepAnaQuilo.pas' {rptAnaQuilo},
  untRepAnaAbast in 'untRepAnaAbast.pas' {rptAnaAbast},
  untRepAnaManut in 'untRepAnaManut.pas' {rptAnaManut},
  untRepAnaReparo in 'untRepAnaReparo.pas' {rptAnaReparo};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TdmPrinc, dmPrinc);
  Application.CreateForm(TrptAnaResumo, rptAnaResumo);
  Application.CreateForm(TrptAnaQuilo, rptAnaQuilo);
  Application.CreateForm(TrptAnaAbast, rptAnaAbast);
  Application.CreateForm(TrptAnaManut, rptAnaManut);
  Application.CreateForm(TrptAnaReparo, rptAnaReparo);
  Application.Run;
end.
