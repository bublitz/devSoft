program CtrlFinan;

uses
  Forms,
  Main in 'Main.pas' {FrmMain},
  DataMod in 'DataMod.pas' {DatMod: TDataModule},
  Funcoes in 'Funcoes.pas',
  CadClientes in 'CadClientes.pas' {FrmClientes},
  Splash in 'Splash.pas' {SplashForm},
  CadFornec in 'CadFornec.pas' {FrmFornec},
  CadBanco in 'CadBanco.pas' {FrmBanco},
  CadTabela in 'CadTabela.pas' {FrmTabela},
  Sobre in 'Sobre.pas' {AboutBox},
  CadPagar in 'CadPagar.pas' {FrmCtasPagar},
  PesqCtas in 'PesqCtas.pas' {FrmPesq},
  CadReceber in 'CadReceber.pas' {FrmCtasReceb},
  RelatContas in 'RelatContas.pas' {FrmRelContas},
  ReportContas in 'ReportContas.pas' {frmRepContas},
  CadLancto in 'CadLancto.pas' {FrmCadLancto};

{$R *.RES}

begin
  SplashForm := TSplashForm.Create(Application);
  SplashForm.Show;
  SplashForm.Refresh;
  SplashForm.PBar.Position := 5;
//  Application.Initialize;
  Application.CreateForm(TFrmMain, FrmMain);
  Application.CreateForm(TFrmRelContas, FrmRelContas);
  Application.CreateForm(TfrmRepContas, frmRepContas);
  Application.CreateForm(TFrmCadLancto, FrmCadLancto);
  SplashForm.PBar.Position := SplashForm.PBar.Position + 5;
  Application.CreateForm(TFrmTabela, FrmTabela);
  SplashForm.PBar.Position := SplashForm.PBar.Position + 5;
  Application.CreateForm(TAboutBox, AboutBox);
  SplashForm.PBar.Position := SplashForm.PBar.Position + 5;
  Application.CreateForm(TFrmCtasPagar, FrmCtasPagar);
  SplashForm.PBar.Position := SplashForm.PBar.Position + 5;
  Application.CreateForm(TFrmPesq, FrmPesq);
  SplashForm.PBar.Position := SplashForm.PBar.Position + 5;
  Application.CreateForm(TFrmCtasReceb, FrmCtasReceb);
  SplashForm.PBar.Position := SplashForm.PBar.Position + 5;
  Application.CreateForm(TFrmClientes, FrmClientes);
  SplashForm.PBar.Position := SplashForm.PBar.Position + 5;
  Application.CreateForm(TDatMod, DatMod);
  SplashForm.PBar.Position := SplashForm.PBar.Position + 5;
  Application.CreateForm(TFrmFornec, FrmFornec);
  SplashForm.PBar.Position := SplashForm.PBar.Position + 5;
  Application.CreateForm(TFrmBanco, FrmBanco);
  SplashForm.PBar.Position := 95;
  SplashForm.Hide;
  SplashForm.Free;
  Application.Run;
end.
