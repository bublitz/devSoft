unit untPedidoVend;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, DBCtrls, Buttons, DBBBtn, NavBtn, Grids,
  DBGrids, ComCtrls, RxLookup, Db;

type
  TfrmPedVend = class(TForm)
    Panel1: TPanel;
    Label2: TLabel;
    DBText1: TDBText;
    Label3: TLabel;
    SpeedButton1: TSpeedButton;
    Label4: TLabel;
    SpeedButton2: TSpeedButton;
    Label5: TLabel;
    SpeedButton3: TSpeedButton;
    Label6: TLabel;
    Label7: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Panel2: TPanel;
    DBNav: TDBNavigator;
    dbNavBtnAppend: TDBNavigationButton;
    dbNavBtnDelete: TDBNavigationButton;
    dbNavBtnEdit: TDBNavigationButton;
    dbNavBtnSave: TDBNavigationButton;
    dbNavBtnCancel: TDBNavigationButton;
    BitBtn1: TBitBtn;
    DBGrid1: TDBGrid;
    RxDBLookupCombo2: TRxDBLookupCombo;
    RxDBLookupCombo1: TRxDBLookupCombo;
    RxDBLookupCombo3: TRxDBLookupCombo;
    Panel3: TPanel;
    DBText2: TDBText;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    DBText3: TDBText;
    Label1: TLabel;
    procedure dbNavBtnAppendClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure DBGrid1EditButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1Enter(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPedVend: TfrmPedVend;

implementation

uses untDtModEst, untCliente, untVendedor, untFormaRec, untProd,
  untSeekProduto;

{$R *.DFM}

procedure TfrmPedVend.dbNavBtnAppendClick(Sender: TObject);
begin
  RxDBLookupCombo2.SetFocus;
end;

procedure TfrmPedVend.SpeedButton1Click(Sender: TObject);
begin
  frmCliente.ShowModal;
end;

procedure TfrmPedVend.SpeedButton2Click(Sender: TObject);
begin
  frmVendedor.ShowModal;
end;

procedure TfrmPedVend.SpeedButton3Click(Sender: TObject);
begin
  frmFormaRec.ShowModal;
end;

procedure TfrmPedVend.DBGrid1EditButtonClick(Sender: TObject);
begin
  if DbGrid1.SelectedField = dmEst.tbItenPedidoVendaCODIGOPRODUTO then
  begin
  if frmSeekProduto.ShowModal = mrOk then
    begin
      dmEst.tbItenPedidoVenda.Edit;
      dmEst.tbItenPedidoVendaNUMEROPEDIDO.Value      := dmEst.tbPedidoVendaNUMEROPEDIDO.Value;
      dmEst.tbItenPedidoVendaCODIGOPRODUTO.Value     := dmEst.tbProdutoCODIGOPRODUTO.Value;
      dmEst.tbItenPedidoVendaDESCRICAOPRODUTO.Value  := dmEst.tbProdutoDESCRICAO.Value;
      //dmEst.tbItenPedidoVendaVALORUNITARIO.Value     := dmEst.tbProdutoPRECOVENDA.Value;
      dmEst.tbItenPedidoVendaVALORUNITARIO.Value     := dmEst.tbProdutoPrecoVendaCalc.Value;
    end;
  end;
end;

procedure TfrmPedVend.FormShow(Sender: TObject);
begin
  if not dmEst.tbPedidoVenda.IsEmpty then
    dmEst.tbPedidoVenda.Refresh;
end;

procedure TfrmPedVend.DBGrid1Enter(Sender: TObject);
begin
  if dmEst.tbPedidoVenda.State in [dsInsert,dsEdit] then
    dmEst.tbPedidoVenda.Post;
end;

procedure TfrmPedVend.SpeedButton5Click(Sender: TObject);
begin
  if (dmEst.tbPedidoVendaSITUACAO.Value = '') then
  begin
    if Application.MessageBox('Confirma o Pedido?',
                   'Atenção', MB_OKCANCEL) = IDOK then
    begin
      dmEst.tbPedidoVenda.Edit;
      dmEst.tbPedidoVendaSITUACAO.Value := 'C';
      dmEst.tbPedidoVenda.Post;

      with dmEst.tbItenPedidoVenda do
      begin
        DisableControls;
        First;
        while not Eof do
        begin
          if dmEst.tbProduto.Locate('CODIGOPRODUTO', FieldByName('CODIGOPRODUTO').Value, []) then
          begin
            dmEst.tbProduto.Edit;
            dmEst.tbProdutoESTOQUEFISICO.Value := dmEst.tbProdutoESTOQUEFISICO.Value -
                                                  FieldByName('QUANTIDADE').Value;
            dmEst.tbProduto.Post;
          end;
          Next;
        end;
        EnableControls;
      end;
    end;
    ShowMessage('Pedido confirmado !!');
  end
  else
    raise exception.create('Este pedido já foi confirmado'#13'ou está pendente!');
end;

end.
