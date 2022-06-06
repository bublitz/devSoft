program Instala;

uses
  Forms,
  untMain in 'untMain.pas' {frmPrincipal},
  untInstala in 'untInstala.pas' {frmInstala},
  untAjuda in 'untAjuda.pas' {frmAjuda},
  untMainPede in 'untMainPede.pas' {frmContraSenha},
  untFuncoes in 'untFuncoes.pas',
  untEmpresa in 'untEmpresa.pas' {frmEmpresa};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmInstala, frmInstala);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmAjuda, frmAjuda);
  Application.CreateForm(TfrmContraSenha, frmContraSenha);
  Application.CreateForm(TfrmEmpresa, frmEmpresa);
  Application.Run;
end.
