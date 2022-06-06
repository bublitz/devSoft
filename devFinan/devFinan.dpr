program devFinan;

uses
  Forms,
  untPrincipal in 'untPrincipal.pas' {frmPrincipal},
  untDatModPrinc in 'untDatModPrinc.pas' {dmPrinc: TDataModule},
  untCadPlano in 'untCadPlano.pas' {frmCadPlano},
  untCadReceber in 'untCadReceber.pas' {frmCadReceber};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TdmPrinc, dmPrinc);
  Application.CreateForm(TfrmCadReceber, frmCadReceber);
  Application.Run;
end.
