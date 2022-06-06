program Project1;

uses
  Forms,
  untDatModPrinc in 'untDatModPrinc.pas' {dmPrinc: TDataModule},
  untCadastro in 'untCadastro.pas' {frmCadastro},
  untAtualiza in 'untAtualiza.pas' {frmAtualiza};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TdmPrinc, dmPrinc);
  Application.CreateForm(TfrmCadastro, frmCadastro);
  Application.CreateForm(TfrmAtualiza, frmAtualiza);
  Application.Run;
end.
