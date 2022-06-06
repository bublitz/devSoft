unit untAbreSessao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  RxLookup, StdCtrls, Mask, DBCtrls, Buttons, DB, ExtCtrls, RxDBComb, ToolEdit;

type
  TfrmAbreSessao = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    DBText1: TDBText;
    Label3: TLabel;
    DBText2: TDBText;
    Label4: TLabel;
    DBText3: TDBText;
    Label5: TLabel;
    DBText4: TDBText;
    Label6: TLabel;
    Label7: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Bevel5: TBevel;
    edtCodigo: TComboEdit;
    DBText5: TDBText;
    DBRadioGroup1: TRadioGroup;
    DBEdtTempo: TMaskEdit;
    procedure FormShow(Sender: TObject);
    procedure edtCodigoOldExit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure edtCodigoOldKeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton2Click(Sender: TObject);
    procedure edtCodigoButtonClick(Sender: TObject);
    procedure DBRadioGroup1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAbreSessao: TfrmAbreSessao;

implementation

uses untDtMod, untLibera, untFuncoes, untPesqSocio, untMain, untSenha;

{$R *.DFM}

procedure TfrmAbreSessao.FormShow(Sender: TObject);
begin
  edtCodigo.SetFocus;
end;

procedure TfrmAbreSessao.edtCodigoOldExit(Sender: TObject);
begin
  if edtCodigo.Text = '' then edtCodigo.Text := '000000000';
  if StrToInt64(edtCodigo.Text) = 0 then
  begin
    dtMod.tbMicroCODIGOSOCIO.Value := 0;
    dtMod.tbSocio.Locate('NOME', 'SEM PLANO', []);
  end
  else
  begin
    if not dtMod.tbSocio.Locate('CodigoBarra',edtCodigo.Text,[]) then
    begin
      edtCodigo.Text := '';
      edtCodigo.SetFocus;
      raise exception.create('Código não Localizado !!');
    end
    else
    begin
      dtMod.tbMicroCODIGOSOCIO.Value := dtMod.tbSocioCODIGOSOCIO.Value;
    end;
  end;
end;

procedure TfrmAbreSessao.Button1Click(Sender: TObject);
begin
  if (DBRadioGroup1.ItemIndex = 1) and
     (StrToInt(DBEdtTempo.Text) > frmMain.tempocortesia) then
  begin
    Application.CreateForm(TfrmSenha, frmSenha);
    ModalResult := frmsenha.ShowModal;
    if ModalResult = mrOk then
      if ((dtMod.tbUser.Locate('USERNAME', frmSenha.edtUser.Text,[loCaseInsensitive])) and
          (dtMod.tbUserSENHA.Value = frmSenha.edtSenha.Text) and
          (dtMod.tbUserCORTESIA.asInteger >= StrToInt(DBEdtTempo.Text))) then
      begin
        dtMod.Acao('Abriu sessão cortesia: ' + frmSenha.edtUser.Text);
        dtMod.tbSocio.IndexFieldNames := '';
      end
      else
        ModalResult := mrCancel;
  end
  else
  if dtMod.tbSocioSITUACAO.Value = 'B' then
  begin
    Application.CreateForm(TfrmLibera, frmLibera);
    ModalResult := frmLibera.ShowModal;
    if ModalResult = mrOk then
    begin
      dtMod.Acao('Liberou sessão para sócio bloqueado: ' + dtMod.tbSocioNOME.Value );
      dtMod.tbSocio.IndexFieldNames := '';
    end;
  end
  else
  begin
    dtMod.tbSocio.IndexFieldNames := '';
    ModalResult := mrOk;
  end;
end;

procedure TfrmAbreSessao.edtCodigoOldKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    DBEdtTempo.SetFocus;
end;

procedure TfrmAbreSessao.SpeedButton2Click(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmAbreSessao.edtCodigoButtonClick(Sender: TObject);
begin
  Application.CreateForm(TfrmPesqSocio, frmPesqSocio);
  if frmPesqSocio.ShowModal = mrOk then
  begin
    edtCodigo.Text := dtMod.tbSocioCodigoBarra.Value;
    frmAbreSessao.edtCodigoOldExit(frmAbreSessao);
  end
  else
    edtCodigo.Text := '';
end;

procedure TfrmAbreSessao.DBRadioGroup1Change(Sender: TObject);
begin
  if DBRadioGroup1.ItemIndex = 1 then
    DBEdtTempo.Text := IntToStr(frmMain.tempocortesia);
end;

end.
