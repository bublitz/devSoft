unit untPrincipal;

interface

uses
  SysUtils, Types, Classes, QGraphics, QControls, QForms, QDialogs,
  QStdCtrls, QMenus, QTypes, QExtCtrls, QComCtrls, QDBLogDlg,
  IniFiles, Printers, QImgList;

type
  TfrmPrinc = class(TForm)
    imgLogo: TImage;
    MainMenu1: TMainMenu;
    Arquivo1: TMenuItem;
    Alterarsenha1: TMenuItem;
    N1: TMenuItem;
    Sair1: TMenuItem;
    abelas1: TMenuItem;
    Manuteno1: TMenuItem;
    Ajuda1: TMenuItem;
    Marcas1: TMenuItem;
    Modelos1: TMenuItem;
    StatusBar1: TStatusBar;
    Sobre1: TMenuItem;
    Veculos1: TMenuItem;
    N2: TMenuItem;
    iposdeAbastecimento1: TMenuItem;
    iposdeManuteno1: TMenuItem;
    iposdeReparo1: TMenuItem;
    QuilometragemDiria1: TMenuItem;
    N3: TMenuItem;
    Abastecimento1: TMenuItem;
    Manuteno2: TMenuItem;
    Reparo1: TMenuItem;
    lblRegional: TLabel;
    Utilitrios1: TMenuItem;
    Backup1: TMenuItem;
    Restore1: TMenuItem;
    N4: TMenuItem;
    Seguros1: TMenuItem;
    MemoMens: TMemo;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    imgListBtns: TImageList;
    procedure Sobre1Click(Sender: TObject);
    procedure Marcas1Click(Sender: TObject);
    procedure Modelos1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure Veculos1Click(Sender: TObject);
    procedure iposdeAbastecimento1Click(Sender: TObject);
    procedure iposdeManuteno1Click(Sender: TObject);
    procedure iposdeReparo1Click(Sender: TObject);
    procedure Alterarsenha1Click(Sender: TObject);
    procedure QuilometragemDiria1Click(Sender: TObject);
    procedure Abastecimento1Click(Sender: TObject);
    procedure Manuteno2Click(Sender: TObject);
    procedure Reparo1Click(Sender: TObject);
    procedure Backup1Click(Sender: TObject);
    procedure Restore1Click(Sender: TObject);
    procedure Seguros1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    user, pass, regional: string;

  end;

var
  frmPrinc: TfrmPrinc;

const
  SK = 1;
  MK = 2;
  AK = 2;

implementation

uses untSobre, untCadMarca, untCadModelo, untCadVeic, untCadTAbast,
  untCadTManu, untCadTRepar, untAltSenha, untManQuilo, untManAbast,
  untManManut, untManReparo, untBackup, untRestore, untCadSeguro,
  untFuncoes;

{$R *.xfm}

procedure TfrmPrinc.Sobre1Click(Sender: TObject);
begin
  Application.CreateForm(TAboutBox, AboutBox);
  AboutBox.ShowModal;
end;

procedure TfrmPrinc.Marcas1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmCadMarca, frmCadMarca);
  frmCadMarca.ShowModal;
end;

procedure TfrmPrinc.Modelos1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmCadModelo, frmCadModelo);
  frmCadModelo.ShowModal;
end;

procedure TfrmPrinc.FormCreate(Sender: TObject);
var
  inifile: TIniFile;
  userName, userPass: string;

begin
  inifile := TIniFile.Create('convel.ini');
  user := inifile.ReadString('User', 'UserName', '-');
  pass := inifile.ReadString('User', 'UserPass', '-');
  regional := inifile.ReadString('Conf', 'Regional', 'Tribunal Regional Eleitoral de Mato Grosso');
  lblRegional.Caption := regional;
  inifile.Free;
  
  userName := 'TRANSP';
  if LoginDialog('CONVEL', userName, userPass) then
  begin
    userName := EncryptSTR(userName, SK, MK, AK);
    userPass := EncryptSTR(userPass, SK, MK, AK);

    if not ((userName = user) and (userPass = pass)) then
    begin
      MessageDlg('Senha errada!', mtError, [mbOk], 0);
      Halt(0);
    end;
  end
  else
  begin
    MessageDlg('Senha não digitada!', mtError, [mbOk], 0);
    Halt(0);
  end;
end;

procedure TfrmPrinc.Sair1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmPrinc.Veculos1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmCadVeic, frmCadVeic);
  frmCadVeic.ShowModal;
end;

procedure TfrmPrinc.iposdeAbastecimento1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmCadTAbast, frmCadTAbast);
  frmCadTAbast.ShowModal;
end;

procedure TfrmPrinc.iposdeManuteno1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmCadTManu, frmCadTManu);
  frmCadTManu.ShowModal;
end;

procedure TfrmPrinc.iposdeReparo1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmCadTrepar, frmCadTRepar);
  frmCadTrepar.ShowModal;
end;

procedure TfrmPrinc.Alterarsenha1Click(Sender: TObject);
var
  inifile: TIniFile;
  pas1, pas2, pas3, pass: string;

begin
  Application.CreateForm(TfrmAltSenha, frmAltSenha);
  if frmAltSenha.ShowModal = mrok then
  begin
    pas1 := frmAltSenha.Edit1.Text;
    pas2 := frmAltSenha.Edit2.Text;
    pas3 := frmAltSenha.Edit3.Text;
    inifile := TIniFile.Create('convel.ini');
    pass := inifile.ReadString('User','UserPass','');

    pas1 := EncryptSTR(pas1, SK, MK, AK);
    pas2 := EncryptSTR(pas2, SK, MK, AK);
    pas3 := EncryptSTR(pas3, SK, MK, AK);

    if (pass = pas1) and (pas2 = pas3) then
    begin
      inifile.WriteString('User','UserPass', pas2);
      MessageDlg('Senha alterada com sucesso!!', mtInformation, [mbOk], 0);
    end
    else
      MessageDlg('Senha não alterada!!', mtError, [mbOk], 0);
    inifile.Free;
  end;
end;

procedure TfrmPrinc.QuilometragemDiria1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmManQuilo, frmManQuilo);
  frmManQuilo.ShowModal;
end;

procedure TfrmPrinc.Abastecimento1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmManAbast, frmManAbast);
  frmManAbast.ShowModal;
end;

procedure TfrmPrinc.Manuteno2Click(Sender: TObject);
begin
  Application.CreateForm(TfrmManManut, frmManManut);
  frmManManut.ShowModal;
end;

procedure TfrmPrinc.Reparo1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmManReparo, frmManReparo);
  frmManReparo.ShowModal;
end;

procedure TfrmPrinc.Backup1Click(Sender: TObject);
begin
  frmBackup.ShowModal;
end;

procedure TfrmPrinc.Restore1Click(Sender: TObject);
begin
  frmRestore.ShowModal;
end;

procedure TfrmPrinc.Seguros1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmCadSeguro, frmCadSeguro);
  frmCadSeguro.ShowModal;
end;

end.

