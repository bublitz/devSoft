program Convel;

uses
  QForms,
  untPrincipal in 'untPrincipal.pas' {frmPrinc},
  untDatMod in 'untDatMod.pas' {dtMod: TDataModule},
  untSobre in 'untSobre.pas' {AboutBox},
  untCadVeic in 'untCadVeic.pas' {frmCadVeic},
  untAtuVeic in 'untAtuVeic.pas' {frmAtuVeic},
  untCadMarca in 'untCadMarca.pas' {frmCadMarca},
  untAtuMarca in 'untAtuMarca.pas' {frmAtuMarca},
  untPesqModelo in 'untPesqModelo.pas' {frmPesqModelo},
  untCadModelo in 'untCadModelo.pas' {frmCadModelo},
  untCadTAbast in 'untCadTAbast.pas' {frmCadTAbast},
  untAtuTAbast in 'untAtuTAbast.pas' {frmAtuTAbast},
  untCadTManu in 'untCadTManu.pas' {frmCadTManu},
  untCadTRepar in 'untCadTRepar.pas' {frmCadTRepar},
  untPesqTReparo in 'untPesqTReparo.pas' {frmPesqTReparo},
  QDBLogDlg in 'QDBLogDlg.pas' {LoginDialog},
  untAltSenha in 'untAltSenha.pas' {frmAltSenha},
  untManQuilo in 'untManQuilo.pas' {frmManQuilo},
  untAtuQuilo in 'untAtuQuilo.pas' {frmAtuQuilo},
  untFuncoes in 'untFuncoes.pas',
  untAtuModelo in 'untAtuModelo.pas' {frmAtuModelo},
  untManReparo in 'untManReparo.pas' {frmManReparo},
  untAtuReparo in 'untAtuReparo.pas' {frmAtuReparo},
  untPesqMarca in 'untPesqMarca.pas' {frmPesqMarca},
  untPesqTAbast in 'untPesqTAbast.pas' {frmPesqTAbast},
  untManManut in 'untManManut.pas' {frmManManut},
  untManAbast in 'untManAbast.pas' {frmManAbast},
  untAtuAbast in 'untAtuAbast.pas' {frmAtuAbast},
  untAtuManut in 'untAtuManut.pas' {frmAtuManut},
  untPesqTManut in 'untPesqTManut.pas' {frmPesqTManut},
  untRestore in 'untRestore.pas' {frmRestore},
  untAtuVeiculo in 'untAtuVeiculo.pas' {frmAtuVeiculo},
  untAtuTManu in 'untAtuTManu.pas' {frmAtuTManu},
  untAtuTRepar in 'untAtuTRepar.pas' {frmAtuTRepar},
  untBackup in 'untBackup.pas' {frmBackup},
  untCadSeguro in 'untCadSeguro.pas' {frmCadSeguro},
  untVeicSegurados in 'untVeicSegurados.pas' {frmVeicSegurados};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ConVel 1.01';
  Application.CreateForm(TfrmPrinc, frmPrinc);
  Application.CreateForm(TdtMod, dtMod);
  Application.CreateForm(TfrmRestore, frmRestore);
  Application.CreateForm(TfrmBackup, frmBackup);
  Application.Run;
end.
