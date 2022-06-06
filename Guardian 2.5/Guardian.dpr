program Guardian;

uses
  Forms,
  Controls,
  untMain in 'untMain.pas' {frmMain},
  untDtMod in 'untDtMod.pas' {dtMod: TDataModule},
  untPrecos in 'untPrecos.pas' {frmPrecos},
  untMicros in 'untMicros.pas' {frmMicros},
  untFeriados in 'untFeriados.pas' {frmFeriados},
  untMovim in 'untMovim.pas' {frmMovim},
  untFuncoes in 'untFuncoes.pas',
  untFecha in 'untFecha.pas' {frmFechaSessao},
  untRelPeriodo in 'untRelPeriodo.pas' {frmRelPeriodo},
  untDataRelFech in 'untDataRelFech.pas' {frmDataFech},
  untSplash in 'untSplash.pas' {frmSplash},
  untCrypt in 'untCrypt.pas',
  untSenha in 'untSenha.pas' {frmSenha},
  untConfUser in 'untConfUser.pas' {frmConfUser},
  Sobre in 'Sobre.pas' {AboutBox},
  untRec in 'untRec.pas' {frmRec},
  untEmpresa in 'untEmpresa.pas' {frmEmpresa},
  untContraSenha in 'untContraSenha.pas' {frmContraSenha},
  untPlanos in 'untPlanos.pas' {frmPlanos},
  untSituacao in 'untSituacao.pas' {frmSituacao},
  untSocios in 'untSocios.pas' {frmSocios},
  untAbreSessao in 'untAbreSessao.pas' {frmAbreSessao},
  untLibera in 'untLibera.pas' {frmLibera},
  untGeraBoleto in 'untGeraBoleto.pas' {frmGeraBoleto},
  untOpenClose in 'untOpenClose.pas' {frmOpenClose},
  untLanctoCaixa in 'untLanctoCaixa.pas' {frmLanctoCaixa},
  untIncTempo in 'untIncTempo.pas' {frmIncTempo},
  untRepCart in 'untRepCart.pas' {frmRepCart},
  untImpSocio in 'untImpSocio.pas' {frmImpSocio},
  untBackup in 'untBackup.pas' {frmBackup},
  untDataRelPeriodo in 'untDataRelPeriodo.pas' {frmDataRelPeriodo},
  untRelFech in 'untRelFech.pas' {frmRelFech},
  untCaixa in 'untCaixa.pas' {frmCaixa},
  untAguarde in 'untAguarde.pas' {frmAguarde},
  untBonus in 'untBonus.pas' {frmBonus},
  untPendencia in 'untPendencia.pas' {frmPendencia},
  untPesqSocio in 'untPesqSocio.pas' {frmPesqSocio},
  untGrafHoras in 'untGrafHoras.pas' {frmGrafHoras},
  untGrafico in 'untGrafico.pas' {frmGrafico},
  untLog in 'untLog.pas' {frmLog},
  untRelLog in 'untRelLog.pas' {frmRelLog},
  untEmail in 'untEmail.pas' {frmEmail},
  untHoje in 'untHoje.pas' {frmHoje},
  untRelVencto in 'untRelVencto.pas' {frmRelVencto},
  untDataRelVencto in 'untDataRelVencto.pas' {frmDataVencto},
  untRelSocio in 'untRelSocio.pas' {frmRelSocio},
  untListClienteBarra in 'untListClienteBarra.pas' {frmListClientBarra},
  untDesconto in 'untDesconto.pas' {frmDesconto};

const
  formularios = 31;

{$R *.RES}

begin
  Application.Title := 'devSoft Guardian 2.6';
  Randomize;
  Screen.Cursor := crSQLWait;
  frmSplash := TfrmSplash.Create(Application);
  frmSplash.Show;
  frmSplash.Refresh;
  //Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmConfUser, frmConfUser);
  Application.CreateForm(TfrmMovim, frmMovim);
  Application.CreateForm(TfrmSocios, frmSocios);
  Application.CreateForm(TfrmFechaSessao, frmFechaSessao);
  Application.CreateForm(TdtMod, dtMod);
  Application.CreateForm(TfrmRelLog, frmRelLog);
  Application.CreateForm(TfrmEmail, frmEmail);
  Application.CreateForm(TfrmHoje, frmHoje);
  Application.CreateForm(TfrmRelVencto, frmRelVencto);
  Application.CreateForm(TfrmDataVencto, frmDataVencto);
  Application.CreateForm(TfrmRelSocio, frmRelSocio);
  Application.CreateForm(TfrmListClientBarra, frmListClientBarra);
  Application.CreateForm(TfrmDesconto, frmDesconto);
  frmSplash.Hide;
  frmSplash.Free;
  Screen.Cursor := crDefault;
  Application.Run;
end.
