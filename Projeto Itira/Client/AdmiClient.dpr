program AdmiClient;

uses
  Forms,
  untPrincipal in 'untPrincipal.pas' {frmPrincipal},
  untBusca in 'untBusca.pas' {frmBusca},
  untDM in 'untDM.pas' {dmPrinc: TDataModule},
  frmCadBasico in 'frmCadBasico.pas' {fCadBasico},
  untTeste in 'untTeste.pas' {frmTeste};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := ':: ADMI :: Cliente';
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmBusca, frmBusca);
  Application.CreateForm(TdmPrinc, dmPrinc);
  Application.CreateForm(TfCadBasico, fCadBasico);
  Application.CreateForm(TfrmTeste, frmTeste);
  Application.Run;
end.
