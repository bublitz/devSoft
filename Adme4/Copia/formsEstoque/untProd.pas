unit untProd;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, DBCtrls, Buttons, DBBBtn, NavBtn, Grids, DBGrids,
  ComCtrls, Mask, Db, RxLookup, TFlatSpeedButtonUnit, ToolEdit, RXDBCtrl,
  IniFiles;

type
  TfrmProd = class(TForm)
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
    Panel3: TPanel;
    Label1: TLabel;
    EditPesq: TEdit;
    RdGrpOrdem: TRadioGroup;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label2: TLabel;
    Label4: TLabel;
    SpeedButton2: TSpeedButton;
    Label5: TLabel;
    SpeedButton3: TSpeedButton;
    Label6: TLabel;
    SpeedButton4: TSpeedButton;
    Label7: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    DBText1: TDBText;
    Label21: TLabel;
    SpeedButton5: TSpeedButton;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    RxDBLookupCombo1: TRxDBLookupCombo;
    RxDBLookupCombo2: TRxDBLookupCombo;
    RxDBLookupCombo3: TRxDBLookupCombo;
    RxDBLookupCombo4: TRxDBLookupCombo;
    Label9: TLabel;
    DBEdit3: TDBEdit;
    Label19: TLabel;
    DBEdit12: TDBEdit;
    DBText2: TDBText;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    OpenDialog: TOpenDialog;
    Label18: TLabel;
    btnZoom: TFlatSpeedButton;
    DBIFoto: TDBImage;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Label25: TLabel;
    DBEdit14: TDBEdit;
    Label26: TLabel;
    DBEdit15: TDBEdit;
    Label27: TLabel;
    DBEdit16: TDBEdit;
    FlatSpeedButton5: TFlatSpeedButton;
    FlatSpeedButton6: TFlatSpeedButton;
    FlatSpeedButton7: TFlatSpeedButton;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    DBGrid2: TDBGrid;
    SpeedButton1: TSpeedButton;
    Label13: TLabel;
    DBEdit7: TDBEdit;
    Label14: TLabel;
    DBEdit8: TDBEdit;
    Label15: TLabel;
    DBEdit9: TDBEdit;
    StatusBar1: TStatusBar;
    DBText3: TDBText;
    Label3: TLabel;
    Label12: TLabel;
    DBEdit5: TDBEdit;
    Label28: TLabel;
    DBEdit6: TDBEdit;
    Juros: TLabel;
    DBEdit17: TDBEdit;
    Label29: TLabel;
    DBDateEdit1: TDBDateEdit;
    Label20: TLabel;
    Label30: TLabel;
    DBEdit13: TDBEdit;
    Label31: TLabel;
    RxDBLookupCombo5: TRxDBLookupCombo;
    SpeedButton6: TSpeedButton;
    DBGrid3: TDBGrid;
    FlatSpeedButton1: TFlatSpeedButton;
    FlatSpeedButton11: TFlatSpeedButton;
    FlatSpeedButton12: TFlatSpeedButton;
    Panel1: TPanel;
    FlatSpeedButton8: TFlatSpeedButton;
    FlatSpeedButton9: TFlatSpeedButton;
    FlatSpeedButton10: TFlatSpeedButton;
    Panel4: TPanel;
    FlatSpeedButton13: TFlatSpeedButton;
    FlatSpeedButton14: TFlatSpeedButton;
    FlatSpeedButton15: TFlatSpeedButton;
    BitBtn2: TBitBtn;
    function CodigoPedras(Sender: TObject): string;
    procedure DBLookupComboBox3Exit(Sender: TObject);
    procedure DBEdit3Enter(Sender: TObject);
    procedure dbNavBtnAppendClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure EditPesqChange(Sender: TObject);
    procedure RdGrpOrdemClick(Sender: TObject);
    procedure DBGrid2Enter(Sender: TObject);
    procedure DBGrid3Enter(Sender: TObject);
    procedure DBIFotoClick(Sender: TObject);
    procedure dbNavBtnAppendAfterAction(Sender: TObject;
      var Error: Boolean);
    procedure btnZoomClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dbNavBtnAppendBeforeAction(Sender: TObject;
      var ActionIsDone: Boolean);
    procedure FlatSpeedButton8Click(Sender: TObject);
    procedure n9Click(Sender: TObject);
    procedure FlatSpeedButton10Click(Sender: TObject);
    procedure FlatSpeedButton13Click(Sender: TObject);
    procedure FlatSpeedButton14Click(Sender: TObject);
    procedure FlatSpeedButton15Click(Sender: TObject);
    procedure RxDBLookupCombo3Exit(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
   Data: Tdate;
   Grupo, SubGrupo, Linha: string;
   Moeda: Real;
   Metal: Integer;
  end;

var
  frmProd: TfrmProd;

implementation

uses untDtModEst, untFornec, untGrupo, untSubGrupo, untMoeda, untLinha,
  untDtModConf, untZoom, untRelEtiq;

{$R *.DFM}

  function Alltrim(Text : string) : string;
  begin
    while Pos(' ',Text) > 0 do
      Delete(Text,Pos(' ',Text),1);
    Result := Text;
  end;

  function StrZero(Num : Real ; Zeros,Deci: integer): string;
  var
    tam, z: integer;
    res, zer: string;
  begin
    Str(Num:Zeros:Deci, res);
    res := Alltrim(res);
    tam := length(res);
    zer := '';
    for z := 1 to (Zeros-tam) do
      zer := zer + '0';
    Result := zer+res;
  end;

function TfrmProd.CodigoPedras(Sender: TObject): string;
var
  r: string;
begin
  r := '';
  dmEst.tbComposicaoPeso.First;
  while not dmEst.tbComposicaoPeso.Eof do
  begin
    r := r + dmEst.tbComposicaoPesoCODIGOPEDRA.Value;
    dmEst.tbComposicaoPeso.Next;
  end;
  CodigoPedras := r;
end;

procedure TfrmProd.DBLookupComboBox3Exit(Sender: TObject);
begin
  dmEst.tbProdutoCODIGOCOMPLETO.Value :=
    //dmEst.tbProdutoCODIGOGRUPO.Value +
    copy(dmEst.tbProdutoCODIGOSUBGRUPO.Value,1,1) +
    copy(dmEst.tbLinhaDESCRICAO.Value,1,1) +
    copy(dmEst.tbMetalDESCRICAO.Value,1,1) +
    StrZero( dmEst.tbProdutoCODIGOPRODUTO.Value, 5, 0 ) +
    '/' +
    CodigoPedras( Sender );
end;

procedure TfrmProd.DBEdit3Enter(Sender: TObject);
begin
  DBEdit3.SelStart := Length(dmEst.tbProdutoCODIGOCOMPLETO.Value);
end;

procedure TfrmProd.dbNavBtnAppendClick(Sender: TObject);
begin
   DBDateEdit1.SetFocus;
end;

procedure TfrmProd.SpeedButton1Click(Sender: TObject);
begin
  frmFornec.ShowModal;
end;

procedure TfrmProd.SpeedButton2Click(Sender: TObject);
begin
  frmGrupo.ShowModal;
end;

procedure TfrmProd.SpeedButton3Click(Sender: TObject);
begin
  frmSubGrupo.ShowModal;
end;

procedure TfrmProd.SpeedButton4Click(Sender: TObject);
begin
  frmMoeda.ShowModal;
end;

procedure TfrmProd.SpeedButton5Click(Sender: TObject);
begin
  frmLinha.ShowModal;
end;

procedure TfrmProd.EditPesqChange(Sender: TObject);
begin
  dmEst.tbProduto.Locate('Descricao', EditPesq.Text, [loCaseInsensitive, loPartialkey]);
end;

procedure TfrmProd.RdGrpOrdemClick(Sender: TObject);
begin
  if RdGrpOrdem.ItemIndex = 0 then
    dmEst.tbProduto.IndexFieldNames := 'DESCRICAO'
  else
    dmEst.tbProduto.IndexFieldNames  := '';
end;

procedure TfrmProd.DBGrid2Enter(Sender: TObject);
begin
  if dmEst.tbProduto.State in [dsInsert,dsEdit] then
     dmEst.tbProduto.Post;
end;

procedure TfrmProd.DBGrid3Enter(Sender: TObject);
begin
  if dmEst.tbProduto.State in [dsInsert,dsEdit] then
     dmEst.tbProduto.Post;
end;

procedure TfrmProd.DBIFotoClick(Sender: TObject);
begin
  If OpenDialog.execute Then
  begin
    if not (dmEst.tbProduto.State in [dsEdit, dsInsert]) then
      dmEst.tbProduto.Edit;
    DBIFoto.Picture.LoadFromFile(OpenDialog.filename);
    DBIFoto.Refresh;
  end;

end;

procedure TfrmProd.dbNavBtnAppendAfterAction(Sender: TObject;
  var Error: Boolean);
begin
   //dmEst.tbProduto.FieldByName( 'DATACADASTRO' ).Value := Data;
   dmEst.tbProduto.FieldByName( 'codigoGRUPO' ).Value:=Grupo;
   dmEst.tbProduto.FieldByName( 'codigoMOEDA' ).Value:=Moeda;
   dmEst.tbProduto.FieldByName( 'codigoSUBGRUPO' ).Value:=SubGrupo;
   dmEst.tbProduto.FieldByName( 'codigoLINHA' ).Value:=Linha;
   dmEst.tbProduto.FieldByName( 'codigoMETAL' ).Value:=Metal;
   //DBEdit12.Text := dmConf.tbEmpresaMARGEM.AsString;
   //DBEdit10.Text := dmConf.tbEmpresaCOMISSAO.AsString;
  //dmEst.tbProdutoCOMISSAO.Value := dmConf.tbEmpresaCOMISSAO.Value;
  //dmEst.tbProdutoMARGEM.Value   := dmConf.tbEmpresaMARGEM.Value;
end;

procedure TfrmProd.btnZoomClick(Sender: TObject);
begin
  if DBIFoto.Picture.Graphic <> nil then
  begin
    frmZoom.Image1.Picture := DBIFoto.Picture;
    frmZoom.ClientHeight := frmZoom.Image1.Height;
    frmZoom.ClientWidth  := frmZoom.Image1.Width;
    frmZoom.Update;
    frmZoom.ShowModal;
  end;
end;

procedure TfrmProd.FormActivate(Sender: TObject);
begin
  dmEst.tbMoeda.Locate ('Descricao', 'Dolar', [loCaseInsensitive]);
  StatusBar1.Panels[0].Text := dmEst.tbMoedaDESCRICAO.AsString + ':' + ' '+ floattostrf (dmEst.tbMoedaVALOR.Value, ffcurrency, 7,2);

  dmEst.tbMoeda.Locate ('Descricao', 'Ouro', [loCaseInsensitive]);
  StatusBar1.Panels[1].Text := dmEst.tbMoedaDESCRICAO.AsString + ':' + ' '+ floattostrf (dmEst.tbMoedaVALOR.value, ffcurrency, 7,2);

  StatusBar1.Panels[2].Text := DateToStr (Date);

end;

procedure TfrmProd.dbNavBtnAppendBeforeAction(Sender: TObject;
  var ActionIsDone: Boolean);
begin
   dmEst.tbProduto.Last;
   //Data    := dmEst.tbProduto.FieldByName( 'DATACADASTRO' ).Value;
   Grupo   := dmEst.tbProduto.FieldByName( 'codigoGRUPO' ).Value;
   Moeda   := dmEst.tbProduto.FieldByName( 'codigoMOEDA' ).Value;
   SubGrupo:= dmEst.tbProduto.FieldByName( 'codigoSUBGRUPO' ).Value;
   Linha   := dmEst.tbProduto.FieldByName( 'codigoLINHA' ).Value;
   Metal   := dmEst.tbProduto.FieldByName( 'codigoMETAL' ).AsInteger;

end;

procedure TfrmProd.FlatSpeedButton8Click(Sender: TObject);
begin
  dmEst.tbComposicaoPeso.Edit;
end;

procedure TfrmProd.n9Click(Sender: TObject);
begin
  dmEst.tbComposicaoPeso.Delete;
end;

procedure TfrmProd.FlatSpeedButton10Click(Sender: TObject);
begin
  dmEst.tbComposicaoPeso.Post;
end;

procedure TfrmProd.FlatSpeedButton13Click(Sender: TObject);
begin
  dmEst.tbFornecProd.Edit;
end;

procedure TfrmProd.FlatSpeedButton14Click(Sender: TObject);
begin
  dmEst.tbFornecProd.Delete;
end;

procedure TfrmProd.FlatSpeedButton15Click(Sender: TObject);
begin
  dmEst.tbFornecProd.Post;
end;

procedure TfrmProd.RxDBLookupCombo3Exit(Sender: TObject);
begin
  if dmEst.tbProdutoCODIGOMOEDA.Value = 2 then
   begin
    frmProd.DBEdit17.Enabled := False;
    frmProd.DBEdit6.Enabled  := False;
    frmProd.DBEdit15.Enabled := False;
    frmProd.DBEdit16.Enabled := False;
   end
  else
   begin
     frmProd.DBEdit17.Enabled := True;
     frmProd.DBEdit6.Enabled  := True;
     frmProd.DBEdit15.Enabled := True;
     frmProd.DBEdit16.Enabled := True;
   end;
end;
procedure TfrmProd.BitBtn2Click(Sender: TObject);
var
  arqini: TIniFile;
  lab1top, lab2top, lab1left, lab2left: integer;

begin
  arqini := TIniFile.Create(ExtractFilePath(Application.ExeName)+'devSoft.ini');
  lab1Top  := arqini.ReadInteger('ParamEtiq', 'Label1Top',    3);
  lab2Top  := arqini.ReadInteger('ParamEtiq', 'Label2Top',   50);
  lab1Left := arqini.ReadInteger('ParamEtiq', 'Label1Left',  85);
  lab2Left := arqini.ReadInteger('ParamEtiq', 'Label2Left', 256);
  arqini.Free;

  frmRelEtiq.QRLabel1.Top    := lab1top;
  frmRelEtiq.QRLabel1.Left   := lab1left;
  frmRelEtiq.QRLabel3.Top    := lab1top + 21;
  frmRelEtiq.QRLabel3.Left   := lab1left;
  frmRelEtiq.QRBarcode1.Top  := lab1top + 43;
  frmRelEtiq.QRBarcode1.Left := lab1left + 3;

  frmRelEtiq.QRLabel2.Top    := lab2top;
  frmRelEtiq.QRLabel2.Left   := lab2left;
  frmRelEtiq.QRLabel4.Top    := lab2top + 21;
  frmRelEtiq.QRLabel4.Left   := lab2left;
  frmRelEtiq.QRBarcode2.Top  := lab2top + 43;
  frmRelEtiq.QRBarcode2.Left := lab2left + 3;

  frmRelEtiq.QRLabel1.Caption := dmEst.tbProdutoCODIGOCOMPLETO.AsString;
  frmRelEtiq.QRLabel3.Caption := dmEst.tbProdutoGRAMA.AsString;
  frmRelEtiq.QRBarcode1.Digits := StrZero(dmEst.tbProdutoCODIGOPRODUTO.value, 5, 0);
  frmRelEtiq.QRLabel2.Caption := '';
  frmRelEtiq.QRLabel4.Caption := '';
  frmRelEtiq.QRBarcode2.Digits := '';
  frmRelEtiq.QuickRep1.Preview;
end;

end.
