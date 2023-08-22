program Bingo;

uses
  Forms,
  untMain in 'untMain.pas' {frmPrincipal},
  untDatMod in 'untDatMod.pas' {DatMod: TDataModule},
  untCadCartela in 'untCadCartela.pas' {frmCadCartelas},
  untConsCartela in 'untConsCartela.pas' {frmConsCartelas},
  untCad in 'untCad.pas' {frmCad},
  Funcoes in 'Funcoes.pas',
  untSorteio in 'untSorteio.pas' {frmSorteio},
  untCadSorteio in 'untCadSorteio.pas' {frmCadSorteio},
  untGeraCartelas in 'untGeraCartelas.pas' {frmGeraCartelas},
  untImpCartelas in 'untImpCartelas.pas' {frmImpCartelas};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TDatMod, DatMod);
  Application.CreateForm(TfrmCadCartelas, frmCadCartelas);
  Application.CreateForm(TfrmConsCartelas, frmConsCartelas);
  Application.CreateForm(TfrmCad, frmCad);
  Application.CreateForm(TfrmSorteio, frmSorteio);
  Application.CreateForm(TfrmCadSorteio, frmCadSorteio);
  Application.CreateForm(TfrmGeraCartelas, frmGeraCartelas);
  Application.CreateForm(TfrmImpCartelas, frmImpCartelas);
  Application.Run;
end.
