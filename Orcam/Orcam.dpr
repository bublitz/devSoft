program Orcam;

uses
  Forms,
  untMain in 'untMain.pas' {frmMain},
  untDatMod in 'untDatMod.pas' {DatMod: TDataModule},
  untSobre in 'untSobre.pas' {AboutBox},
  Funcoes in 'Funcoes.pas',
  untCalculo in 'untCalculo.pas',
  untCadServ in 'untCadServ.pas' {frmCadServ},
  untCadInsu in 'untCadInsu.pas' {frmCadInsu},
  untCompServico in 'untCompServico.pas' {frmCompServico},
  untCompInsumo in 'untCompInsumo.pas' {frmCompInsumo},
  untPreview in 'untPreview.pas' {frmPreview},
  untParam in 'untParam.pas' {frmParam},
  untDadosGerais in 'untDadosGerais.pas' {frmDadosGerais},
  untEditOrcam in 'untEditOrcam.pas' {frmEditOrcam},
  untSplash in 'untSplash.pas' {SplashForm},
  untEditLinha in 'untEditLinha.pas' {frmEditLinha},
  untPesqServico in 'untPesqServico.pas' {frmPesqServ},
  untSobreMicro in 'untSobreMicro.pas' {frmSobreMicro},
  untAutores in 'untAutores.pas' {frmAutor},
  untImpOrcam in 'untImpOrcam.pas' {rptImpOrcam},
  untReport in 'untReport.pas' {frmReport},
  untImpInsu in 'untImpInsu.pas' {frmImpInsu},
  untImpSer in 'untImpSer.pas' {rptImpServicos},
  untImpInsOrc in 'untImpInsOrc.pas' {rptImpInsOrc},
  untConfPag in 'untConfPag.pas' {frmConfPag},
  untImpInsumos in 'untImpInsumos.pas' {frmImpInsumos},
  untImpInsCot in 'untImpInsCot.pas' {rptImpInsCot},
  untAltPrecos in 'untAltPrecos.pas' {frmAltPrecos},
  untImpIns in 'untImpIns.pas' {rptImpInsumos},
  untRecal in 'untRecal.pas' {frmRecal},
  untImpOrca in 'untImpOrca.pas' {frmImpOrcam},
  untImpOrcamPaisa in 'untImpOrcamPaisa.pas' {rptImpOrcamPaisa},
  untImpServAna in 'untImpServAna.pas' {rptImpServAna},
  untFrmImpSer in 'untFrmImpSer.pas' {frmImpSer},
  untTipoPeri in 'untTipoPeri.pas' {frmTipoPeri},
  untEdtCrono in 'untEdtCrono.pas' {frmEdtCrono},
  untEdtLinCro in 'untEdtLinCro.pas' {frmEdtLinCro},
  untVisDadGer in 'untVisDadGer.pas' {frmVisDadGer},
  untCadInsOrc in 'untCadInsOrc.pas' {frmCadInsOrc},
  untInsCrono in 'untInsCrono.pas' {frmInsCrono},
  untImpInsCro in 'untImpInsCro.pas' {rptImpInsCro};

{$R *.RES}

begin
  SplashForm := TSplashForm.Create(Application);
  SplashForm.Show;
  SplashForm.Update;
  //Application.Initialize;
  Application.HelpFile := 'D:\Projetos\Orcam\Orcam.hlp';
  Application.Title := 'Drache Orçamentos';
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.CreateForm(TfrmAutor, frmAutor);
  Application.CreateForm(TfrmCadServ, frmCadServ);
  Application.CreateForm(TfrmCadInsu, frmCadInsu);
  Application.CreateForm(TfrmCompServico, frmCompServico);
  Application.CreateForm(TfrmCompInsumo, frmCompInsumo);
  Application.CreateForm(TfrmPreview, frmPreview);
  Application.CreateForm(TfrmParam, frmParam);
  Application.CreateForm(TfrmDadosGerais, frmDadosGerais);
  Application.CreateForm(TfrmEditOrcam, frmEditOrcam);
  Application.CreateForm(TfrmEditLinha, frmEditLinha);
  Application.CreateForm(TfrmPesqServ, frmPesqServ);
  Application.CreateForm(TfrmSobreMicro, frmSobreMicro);
  Application.CreateForm(TDatMod, DatMod);
  Application.CreateForm(TrptImpOrcam, rptImpOrcam);
  Application.CreateForm(TfrmReport, frmReport);
  Application.CreateForm(TfrmImpInsu, frmImpInsu);
  Application.CreateForm(TrptImpServicos, rptImpServicos);
  Application.CreateForm(TrptImpInsOrc, rptImpInsOrc);
  Application.CreateForm(TfrmConfPag, frmConfPag);
  Application.CreateForm(TfrmImpInsumos, frmImpInsumos);
  Application.CreateForm(TrptImpInsCot, rptImpInsCot);
  Application.CreateForm(TfrmAltPrecos, frmAltPrecos);
  Application.CreateForm(TrptImpInsumos, rptImpInsumos);
  Application.CreateForm(TfrmRecal, frmRecal);
  Application.CreateForm(TfrmImpOrcam, frmImpOrcam);
  Application.CreateForm(TrptImpOrcamPaisa, rptImpOrcamPaisa);
  Application.CreateForm(TrptImpServAna, rptImpServAna);
  Application.CreateForm(TfrmImpSer, frmImpSer);
  Application.CreateForm(TfrmTipoPeri, frmTipoPeri);
  Application.CreateForm(TfrmEdtCrono, frmEdtCrono);
  Application.CreateForm(TfrmEdtLinCro, frmEdtLinCro);
  Application.CreateForm(TfrmVisDadGer, frmVisDadGer);
  Application.CreateForm(TfrmCadInsOrc, frmCadInsOrc);
  Application.CreateForm(TfrmInsCrono, frmInsCrono);
  Application.CreateForm(TrptImpInsCro, rptImpInsCro);
  SplashForm.Hide;
  SplashForm.Free;
  Application.Run;
end.
