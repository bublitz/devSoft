unit untPrincipal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, SpeedBar, ExtCtrls, ComCtrls, DB;

type
  TfrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Arquivo1: TMenuItem;
    ConfigurarImpressora1: TMenuItem;
    N1: TMenuItem;
    Sair1: TMenuItem;
    Configuraes1: TMenuItem;
    Usurios1: TMenuItem;
    Toolbar: TSpeedBar;
    SpeedbarSection1: TSpeedbarSection;
    SpeedbarSection2: TSpeedbarSection;
    SpeedbarSection4: TSpeedbarSection;
    CustomizeBtn: TSpeedItem;
    ExitBtn: TSpeedItem;
    View1Btn: TSpeedItem;
    View2Btn: TSpeedItem;
    View3Btn: TSpeedItem;
    WizardBtn: TSpeedItem;
    AboutBtn: TSpeedItem;
    StatusBar1: TStatusBar;
    Timer1: TTimer;
    Empresa1: TMenuItem;
    N2: TMenuItem;
    Etiquetas1: TMenuItem;
    procedure Sair1Click(Sender: TObject);
    procedure Usurios1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure View1BtnClick(Sender: TObject);
    procedure View3BtnClick(Sender: TObject);
    procedure AboutBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Empresa1Click(Sender: TObject);
    procedure Etiquetas1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses untConfUser, untSenha, untDtModConf, untPrincipalEst, Sobre, untSplash,
  untParam, untConfEtiq;

{$R *.DFM}
{$R BACKGRND.R32}

procedure TfrmPrincipal.Sair1Click(Sender: TObject);
begin
  with dmConf do
  begin
    dtBase.Connected := False;
    IBTrans.Active := False;
  end;
  Close;
end;

procedure TfrmPrincipal.Usurios1Click(Sender: TObject);
begin
  frmConfUser.ShowModal;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  Toolbar.Wallpaper.Bitmap.Handle := LoadBitmap(hInstance, 'BACKGROUND')
end;

procedure TfrmPrincipal.View1BtnClick(Sender: TObject);
begin
  if frmSenha.ShowModal = mrOk then
    if (dmConf.tbUser.Locate('USERNAME', frmSenha.edtUser.Text,[loCaseInsensitive])) and
       (dmConf.tbUserSENHA.Value = frmSenha.edtSenha.Text) then
      showmessage('Ok!')
    else
      showmessage('No!');
end;

procedure TfrmPrincipal.View3BtnClick(Sender: TObject);
begin
  frmPrincipalEst.ShowModal;
end;

procedure TfrmPrincipal.AboutBtnClick(Sender: TObject);
begin
  AboutBox.ShowModal;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  Timer1.Enabled := True;
end;

procedure TfrmPrincipal.Timer1Timer(Sender: TObject);
begin
  frmSplash.Hide;
  frmSplash.Free;
  Timer1.Enabled := False;
end;

procedure TfrmPrincipal.Empresa1Click(Sender: TObject);
begin
  if dmConf.tbEmpresa.RecordCount = 0 then
  begin
    dmConf.tbEmpresa.Append;
    dmConf.tbEmpresaCODIGOEMPRESA.Value := 1;
    dmConf.tbEmpresaNOME.Value := 'Farfala D''Oro';
    dmConf.tbEmpresaENDERECO.Value := '.';
    dmConf.tbEmpresaCNPJ.Value := '.';
    dmConf.tbEmpresa.Post;
  end;

  frmParam.edtMargem.Value := dmConf.tbEmpresaMARGEM.Value;
  frmParam.edtComissao.Value := dmConf.tbEmpresaCOMISSAO.Value;
  if frmParam.ShowModal = mrok then
    if (frmParam.edtMargem.Value <> dmConf.tbEmpresaMARGEM.Value) or
       (frmParam.edtComissao.Value <> dmConf.tbEmpresaCOMISSAO.Value) then
    begin
      dmConf.tbEmpresa.Edit;
      dmConf.tbEmpresaMARGEM.Value := frmParam.edtMargem.Value;
      dmConf.tbEmpresaCOMISSAO.Value := frmParam.edtComissao.Value;
      dmConf.tbEmpresa.Post;
    end;
end;

procedure TfrmPrincipal.Etiquetas1Click(Sender: TObject);
begin
  frmConfEtiq.ShowModal;
end;

end.
