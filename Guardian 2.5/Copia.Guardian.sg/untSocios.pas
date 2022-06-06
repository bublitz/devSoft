unit untSocios;

interface                            

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, DBBBtn, NavBtn, DBCtrls, Grids, DBGrids,
  ComCtrls, Mask, ToolEdit, RXDBCtrl, RxLookup, RxDBComb, DB, jpeg;

type
  TfrmSocios = class(TForm)
    PageCad: TPageControl;
    TabGrid: TTabSheet;
    DBGrid1: TDBGrid;
    TabDetalhe: TTabSheet;
    Panel2: TPanel;
    DBNav: TDBNavigator;
    dbNavBtnAppend: TDBNavigationButton;
    dbNavBtnDelete: TDBNavigationButton;
    dbNavBtnEdit: TDBNavigationButton;
    dbNavBtnSave: TDBNavigationButton;
    dbNavBtnCancel: TDBNavigationButton;
    BitBtn1: TBitBtn;
    PanDados: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    EditPesq: TEdit;
    RdGrpOrdem: TRadioGroup;
    Label2: TLabel;
    DBText1: TDBText;
    Label3: TLabel;
    DBDateEdit1: TDBDateEdit;
    Label4: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    btnPlano: TSpeedButton;
    Label5: TLabel;
    DBEdit1: TDBEdit;
    Label6: TLabel;
    DBEdit2: TDBEdit;
    Label7: TLabel;
    DBEdit3: TDBEdit;
    Label8: TLabel;
    DBEdit4: TDBEdit;
    Label9: TLabel;
    DBEdit5: TDBEdit;
    Label10: TLabel;
    DBEdit6: TDBEdit;
    Label11: TLabel;
    DBEdit7: TDBEdit;
    Label12: TLabel;
    DBEdit8: TDBEdit;
    Label13: TLabel;
    DBEdit9: TDBEdit;
    Label14: TLabel;
    Label15: TLabel;
    DBDateEdit2: TDBDateEdit;
    Label16: TLabel;
    DBEdit10: TDBEdit;
    Label17: TLabel;
    RxDBComboBox2: TRxDBComboBox;
    Label18: TLabel;
    DBEdit11: TDBEdit;
    Label19: TLabel;
    DBIFoto: TDBImage;
    Bevel1: TBevel;
    OpenDialog: TOpenDialog;
    SpeedButton2: TSpeedButton;
    Label20: TLabel;
    DBText2: TDBText;
    btnBonus: TSpeedButton;
    DBText3: TDBText;
    DBText4: TDBText;
    Label21: TLabel;
    btnRenova: TSpeedButton;
    SpeedButton1: TSpeedButton;
    procedure RenovaPlano(Sender: TObject);
    procedure EditPesqChange(Sender: TObject);
    procedure RdGrpOrdemClick(Sender: TObject);
    procedure DBIFotoClick(Sender: TObject);
    procedure btnPlanoClick(Sender: TObject);
    procedure dbNavBtnAppendClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure RxDBLookupCombo1Change(Sender: TObject);
    procedure btnBonusClick(Sender: TObject);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure btnRenovaClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSocios: TfrmSocios;
  plano: integer;

implementation

uses untDtMod, untPlanos, untRepCart, untImpSocio, untBonus, untEmail;

{$R *.DFM}

procedure TfrmSocios.RenovaPlano(Sender: TObject);
var
  codplano, meses: integer;
  valor: real;

begin
  if not dtMod.tbSocioNOME.IsNull then
  begin
    codplano := dtMod.tbSocioCODIGOPLANO.AsInteger;
    dtMod.tbPlano.Locate('codigoplano', codplano, []);
    if not dtMod.tbPlanoMESES.IsNull then
      meses := dtMod.tbPlanoMESES.AsInteger
    else
      meses := 1; 

    dtMod.tbSocio.Edit;
    dtMod.tbSocioDATARENOVA.Value := Date;
    dtMod.tbSocioDATAVENCTO.Value := IncMonth(Date, meses);
    dtMod.tbSocioSITUACAO.Value := 'L';

    //Lancto Automático no Caixa
    codplano := dtMod.tbSocioCODIGOPLANO.AsInteger;
    dtMod.tbPlano.Locate('codigoplano', codplano, []);
    valor := dtMod.tbPlanoVALOR.AsFloat;
    dtMod.tbCaixa.Append;
    dtMod.tbCaixaDESCRICAO.Value := 'Renovacao Plano - ' + dtMod.tbSocioNOME.AsString;
    dtMod.tbCaixaTIPOLANCTO.Value := 'A';
    dtMod.tbCaixaENTRADA.Value := valor;
    if dtMod.tbCaixa.State = dsInsert then
      dtMod.tbCaixa.Post;
    dtMod.ApplyUpdates( dtMod.tbCaixa );

    //Baixa todos os Boletos
    dtMod.qrBaixa.ParamByName('DATA').Value := Date;
    dtMod.qrBaixa.ParamByName('SOCIO').Value := dtMod.tbSocioCODIGOSOCIO.Value;
    dtMod.qrBaixa.ExecSQL;
    if dtMod.IBTrans.InTransaction then
      dtMod.IBTrans.CommitRetaining;

    MessageDlg('Plano renovado com sucesso', mtInformation, [mbOk], 0);
  end
  else
    MessageDlg('Nome do Sócio em Branco !!', mtError, [mbCancel], 0);

end;

procedure TfrmSocios.EditPesqChange(Sender: TObject);
begin
  dtMod.tbSocio.Locate ('Nome', EditPesq.Text, [loCaseInsensitive, loPartialkey]);
end;

procedure TfrmSocios.RdGrpOrdemClick(Sender: TObject);
begin
  if RdGrpOrdem.ItemIndex = 0 then
    dtMod.tbSocio.IndexFieldNames := 'NOME'
  else
    dtMod.tbSocio.IndexFieldNames  := '';

end;

procedure TfrmSocios.DBIFotoClick(Sender: TObject);
begin
  If OpenDialog.execute Then
  begin
    if not (dtMod.tbSocio.State in [dsEdit, dsInsert]) then
      dtMod.tbSocio.Edit;
    DBIFoto.Picture.LoadFromFile(OpenDialog.filename);
    DBIFoto.Refresh;
  end;
end;

procedure TfrmSocios.btnPlanoClick(Sender: TObject);
begin
  Application.CreateForm(TfrmPlanos, frmPlanos);
  frmPlanos.ShowModal;
end;

procedure TfrmSocios.dbNavBtnAppendClick(Sender: TObject);
begin
  dbDateEdit1.Date := Date;
  dtMod.tbSocioSITUACAO.Value := 'L';
  RxDBLookupCombo1.SetFocus;
end;

procedure TfrmSocios.SpeedButton2Click(Sender: TObject);
begin
  Application.CreateForm(TfrmImpSocio, frmImpSocio);
  frmImpsocio.qrEmissaoCart.Close;
  frmImpsocio.qrEmissaoCart.Open;
  frmImpSocio.ShowModal;
end;

procedure TfrmSocios.RxDBLookupCombo1Change(Sender: TObject);
var
  Year, Month, Day: word;

begin
  if (dtMod.tbSocio.State = dsEdit) and
     (Application.MessageBox('Confirma a mudança de plano ?', 'Atenção', MB_OKCANCEL) = IDOK ) then
  begin
    DecodeDate(Now, Year, Month, Day);
    //dtMod.tbSocioDATARENOVA.Value := Date;
    Inc(Month);
    if Month = 13 then
    begin
      Month := 1;
      Inc(Year);
    end;
    if plano < dtMod.tbSocioCODIGOPLANO.Value then
    begin
      //dtMod.tbSocioDATAVENCTO.Value := EncodeDate( Year, Month, Day );
      //dtMod.tbSocioDIAVENCTO.Value := Day;
      if dtMod.tbConta.Locate('CODIGOSOCIO;ANO;MES',VarArrayOf([dtMod.tbSocioCODIGOSOCIO.Value,Year,dtMod.tbSocioMesAtual.Value]),[]) then
        dtMod.tbConta.Delete;
    end
    else
    begin
      //dtMod.tbSocioDATAVENCTO.Value := EncodeDate( Year, Month, dtMod.tbSocioDIAVENCTO.Value );
      //if dtMod.tbSocioDIAVENCTO.Value < Day then
        //dtMod.tbSocioDIAVENCTO.Value := Day;
    end;
    dtMod.tbSocioSITUACAO.Value := 'L';
    dtMod.tbSocio.Post;
    dtMod.Acao('Alterou plano '+dtMod.tbSocioNOME.AsString);
  end
  else
    if dtMod.tbSocio.State = dsInsert then
      //RenovaPlano( frmSocios )
    else
      dtMod.tbSocio.Cancel;
end;

procedure TfrmSocios.btnBonusClick(Sender: TObject);
var
  horas, hacum, htot: real;
  Year, Month, Day: word;

begin
  Application.CreateForm(TfrmBonus, frmBonus);
  frmBonus.edtHoras.Clear;
  if frmBonus.ShowModal = mrOk then
  begin
    dtMod.Acao('Adicionou Bônus '+dtMod.tbSocioNOME.AsString);
    horas := StrToInt( Trim(frmBonus.edtHoras.Text) ) / 60;
    hacum := dtMod.tbSocioHorasAcumuladas.Value;
    dtMod.tbPlano.Locate('CODIGOPLANO', dtMod.tbSocioCODIGOPLANO.Value, []);
    htot  := dtMod.tbPlanoHORAS.Value;
    DecodeDate(Now, Year, Month, Day);
    if dtMod.tbConta.Locate('CODIGOSOCIO;ANO;MES',VarArrayOf([dtMod.tbSocioCODIGOSOCIO.Value,Year,dtMod.tbSocioMesAtual.Value]),[]) then
    begin
      dtMod.tbConta.Edit;
      if hacum > htot then
        dtMod.tbContaACUMULADO.Value := dtMod.tbContaACUMULADO.Value - ( horas + ( hacum - htot ) )
      else
        dtMod.tbContaACUMULADO.Value := dtMod.tbContaACUMULADO.Value - horas;
    end
    else
    begin
      dtMod.tbConta.Append;
      dtMod.tbContaANO.Value := Year;
      dtMod.tbContaMES.Value := Month;
      dtMod.tbContaCODIGOSOCIO.Value := dtMod.tbSocioCODIGOSOCIO.Value;
      dtMod.tbContaACUMULADO.Value := dtMod.tbContaACUMULADO.Value - horas;
    end;

    dtMod.tbConta.Post;
    dtMod.tbSocio.Refresh;
  end;
end;

procedure TfrmSocios.RxDBLookupCombo1Enter(Sender: TObject);
begin
  plano := dtMod.tbSocioCODIGOPLANO.Value;
end;

procedure TfrmSocios.btnRenovaClick(Sender: TObject);
begin
  if Application.MessageBox('Confirma a renovação do plano ?', 'Atenção', MB_OKCANCEL) = IDOK then
  begin
    RenovaPlano( frmSocios );
    dtMod.tbSocio.Post;
    dtMod.Acao('Renovou plano '+dtMod.tbSocioNOME.AsString);
  end;
end;

procedure TfrmSocios.SpeedButton1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmEMail, frmEMail);
  //frmImpsocio.qrEmissaoCart.Close;
  //frmImpsocio.qrEmissaoCart.Open;
  frmEMail.ShowModal;

end;

procedure TfrmSocios.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if dtMod.IBTrans.InTransaction then
    dtMod.IBTrans.CommitRetaining;
end;

end.
