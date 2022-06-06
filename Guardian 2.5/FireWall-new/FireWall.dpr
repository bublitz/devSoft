program FireWall;

uses
  Forms,
  untMain in 'untMain.pas' {frmMain},
  untContraSenha in 'untContraSenha.pas' {frmContraSenha},
  untFuncoes in 'untFuncoes.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.ShowMainForm := False;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmContraSenha, frmContraSenha);
  Application.Run;
end.
