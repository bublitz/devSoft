program GeraIni;

uses
  Forms,
  untPricIni in 'untPricIni.pas' {frmPrincipal},
  untFuncoes in 'untFuncoes.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
