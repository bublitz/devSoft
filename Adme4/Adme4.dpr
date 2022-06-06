program Adme4;

uses
  Forms,
  untPrincipal in 'untPrincipal.pas' {frmPrincipal},
  untDtModConf in 'untDtModConf.pas' {dmConf: TDataModule},
  untConfUser in 'untConfUser.pas' {frmConfUser},
  untAdmCartao in 'formsEstoque\untAdmCartao.pas' {frmAdmCartao},
  untCliente in 'formsEstoque\untCliente.pas' {frmCliente},
  untDtModEst in 'formsEstoque\untDtModEst.pas' {dmEst: TDataModule},
  untFormaPaga in 'formsEstoque\untFormaPaga.pas' {frmFormaPaga},
  untFormaRec in 'formsEstoque\untFormaRec.pas' {frmFormaRec},
  untGrupo in 'formsEstoque\untGrupo.pas' {frmGrupo},
  untMoeda in 'formsEstoque\untMoeda.pas' {frmMoeda},
  untPedidoComp in 'formsEstoque\untPedidoComp.pas' {frmPedidoComp},
  untPedidoVend in 'formsEstoque\untPedidoVend.pas' {frmPedVend},
  untProd in 'formsEstoque\untProd.pas' {frmProd},
  untSubGrupo in 'formsEstoque\untSubGrupo.pas' {frmSubGrupo},
  untVendedor in 'formsEstoque\untVendedor.pas' {frmVendedor},
  untSenha in 'untSenha.pas' {frmSenha},
  untSplash in 'untSplash.pas' {frmSplash},
  untPrincipalEst in 'formsEstoque\untPrincipalEst.pas' {frmPrincipalEst},
  untCrypt in 'untCrypt.pas',
  untLinha in 'formsEstoque\untLinha.pas' {frmLinha},
  untConjunto in 'formsEstoque\untConjunto.pas' {frmConjunto},
  Sobre in 'Sobre.pas' {AboutBox},
  untSeekProduto in 'formsEstoque\untSeekProduto.pas' {frmSeekProduto},
  untRepresentante in 'formsEstoque\untRepresentante.pas' {frmRepresentante},
  untAniversario in 'formsEstoque\untAniversario.pas' {frmAniversario},
  FuncoesDB in 'FuncoesDB.pas',
  untPedra in 'formsEstoque\untPedra.pas' {frmPedra},
  untParam in 'untParam.pas' {frmParam},
  untZoom in 'formsEstoque\untZoom.pas' {frmZoom},
  untFornec in 'formsEstoque\untFornec.pas' {frmFornec},
  untRelEtiq in 'formsEstoque\untRelEtiq.pas' {frmRelEtiq},
  untSelEti in 'formsEstoque\untSelEti.pas' {frmSelEti},
  untConfEtiq in 'untConfEtiq.pas' {frmConfEtiq};

const
  formularios = 21;
{$R *.RES}

begin
  Application.Title := 'devSoft Adme 4.0';
  frmSplash := TfrmSplash.Create(Application);
  frmSplash.PBar.Max := formularios;
  frmSplash.Show;
  frmSplash.Refresh;
  //   Application.Initialize;

  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmSeekProduto, frmSeekProduto);
  Application.CreateForm(TfrmRepresentante, frmRepresentante);
  Application.CreateForm(TfrmAniversario, frmAniversario);
  Application.CreateForm(TfrmPedra, frmPedra);
  Application.CreateForm(TfrmParam, frmParam);
  Application.CreateForm(TfrmZoom, frmZoom);
  Application.CreateForm(TfrmFornec, frmFornec);
  Application.CreateForm(TfrmRelEtiq, frmRelEtiq);
  Application.CreateForm(TfrmConfEtiq, frmConfEtiq);
  frmSplash.PBar.StepBy(1);
  Application.CreateForm(TfrmConfUser, frmConfUser);
  frmSplash.PBar.StepBy(1);
  Application.CreateForm(TdmConf, dmConf);
  frmSplash.PBar.StepBy(1);
  Application.CreateForm(TdmEst, dmEst);
  frmSplash.PBar.StepBy(1);
  Application.CreateForm(TfrmAdmCartao, frmAdmCartao);
  frmSplash.PBar.StepBy(1);
  Application.CreateForm(TfrmCliente, frmCliente);
  frmSplash.PBar.StepBy(1);
  Application.CreateForm(TfrmFormaPaga, frmFormaPaga);
  frmSplash.PBar.StepBy(1);
  Application.CreateForm(TfrmFormaRec, frmFormaRec);
  frmSplash.PBar.StepBy(1);
  Application.CreateForm(TfrmFornec, frmFornec);
  frmSplash.PBar.StepBy(1);
  Application.CreateForm(TfrmGrupo, frmGrupo);
  frmSplash.PBar.StepBy(1);
  Application.CreateForm(TfrmMoeda, frmMoeda);
  frmSplash.PBar.StepBy(1);
  Application.CreateForm(TfrmPedidoComp, frmPedidoComp);
  frmSplash.PBar.StepBy(1);
  Application.CreateForm(TfrmPedVend, frmPedVend);
  frmSplash.PBar.StepBy(1);
  Application.CreateForm(TfrmProd, frmProd);
  frmSplash.PBar.StepBy(1);
  Application.CreateForm(TfrmSubGrupo, frmSubGrupo);
  frmSplash.PBar.StepBy(1);
  Application.CreateForm(TfrmVendedor, frmVendedor);
  frmSplash.PBar.StepBy(1);
  Application.CreateForm(TfrmSenha, frmSenha);
  frmSplash.PBar.StepBy(1);
  Application.CreateForm(TfrmPrincipalEst, frmPrincipalEst);
  frmSplash.PBar.StepBy(1);
  Application.CreateForm(TfrmLinha, frmLinha);
  frmSplash.PBar.StepBy(1);
  Application.CreateForm(TfrmConjunto, frmConjunto);
  frmSplash.PBar.StepBy(1);
  Application.CreateForm(TAboutBox, AboutBox);
  frmSplash.PBar.StepBy(1);
  //frmSplash.Hide;
  //frmSplash.Free;
  Application.Run;
end.
