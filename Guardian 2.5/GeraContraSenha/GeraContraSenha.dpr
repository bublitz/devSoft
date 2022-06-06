program GeraContraSenha;

uses
  Forms,
  untCalcCSenha in 'untCalcCSenha.pas' {frmCalcCSenha},
  untContraSenha in 'untContraSenha.pas' {frmContraSenha},
  untFuncoes in 'untFuncoes.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TfrmContraSenha, frmContraSenha);
  Application.CreateForm(TfrmCalcCSenha, frmCalcCSenha);
  Application.Run;
end.
