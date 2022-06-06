program devAdm;

uses
  Forms,
  untMain in 'untMain.pas' {frmMain},
  untDatModPrinc in 'untDatModPrinc.pas' {dmPrinc: TDataModule},
  untCadEstacao in 'untCadEstacao.pas' {frmCadEstacao},
  untCadUsuario in 'untCadUsuario.pas' {frmCadUsuario},
  untCadPrecos in 'untCadPrecos.pas' {frmCadPrecos},
  untListaEspera in 'untListaEspera.pas' {frmListaEspera},
  untEmail in 'untEmail.pas' {frmEmail},
  untClientes in 'untClientes.pas' {frmClientes},
  untPesqClientes in 'untPesqClientes.pas' {frmPesqClientes},
  untAutEmail in 'untAutEmail.pas' {frmAutEmail};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TdmPrinc, dmPrinc);
  Application.CreateForm(TfrmCadPrecos, frmCadPrecos);
  Application.CreateForm(TfrmListaEspera, frmListaEspera);
  Application.Run;
end.
