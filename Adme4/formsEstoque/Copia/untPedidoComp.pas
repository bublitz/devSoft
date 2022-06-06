unit untPedidoComp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, DBCtrls, Buttons, DBBBtn, NavBtn, Grids,
  DBGrids, ComCtrls, RxLookup, Db;

type
  TfrmPedidoComp = class(TForm)
    PanDados: TPanel;
    DBText1: TDBText;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    Panel2: TPanel;
    DBNav: TDBNavigator;
    dbNavBtnAppend: TDBNavigationButton;
    dbNavBtnDelete: TDBNavigationButton;
    dbNavBtnEdit: TDBNavigationButton;
    dbNavBtnSave: TDBNavigationButton;
    dbNavBtnCancel: TDBNavigationButton;
    BitBtn1: TBitBtn;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    SpeedButton3: TSpeedButton;
    SpeedButton5: TSpeedButton;
    RxDBLookupCombo2: TRxDBLookupCombo;
    RxDBLookupCombo4: TRxDBLookupCombo;
    Panel3: TPanel;
    DBText2: TDBText;
    SpeedButton1: TSpeedButton;
    DBText3: TDBText;
    Label1: TLabel;
    SpeedButton2: TSpeedButton;
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1Enter(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure DBGrid1EditButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPedidoComp: TfrmPedidoComp;

implementation

uses untDtModEst, untFormaPaga, untFornec, untSeekProduto;

{$R *.DFM}

procedure TfrmPedidoComp.SpeedButton3Click(Sender: TObject);
begin
  frmFornec.ShowModal;
end;

procedure TfrmPedidoComp.SpeedButton5Click(Sender: TObject);
begin
  frmFormaPaga.ShowModal;
end;

procedure TfrmPedidoComp.FormShow(Sender: TObject);
begin
  if not dmEst.tbPedidoCompra.IsEmpty then
    dmEst.tbPedidoCompra.Refresh;
end;

procedure TfrmPedidoComp.DBGrid1Enter(Sender: TObject);
begin
  if dmEst.tbPedidoCompra.State in [dsInsert,dsEdit] then
    dmEst.tbPedidoCompra.Post;
end;

procedure TfrmPedidoComp.SpeedButton2Click(Sender: TObject);
begin
  if (dmEst.tbPedidoCompraSITUACAO.Value = '') then
  begin
    if Application.MessageBox('Confirma o Pedido?',
                   'Atenção', MB_OKCANCEL) = IDOK then
    begin
      dmEst.tbPedidoCompra.Edit;
      dmEst.tbPedidoCompraSITUACAO.Value := 'C';
      dmEst.tbPedidoCompra.Post;

      with dmEst.tbItenPedidoCompra do
      begin
        DisableControls;
        First;
        while not Eof do
        begin
          if dmEst.tbProduto.Locate('CODIGOPRODUTO', FieldByName('CODIGOPRODUTO').Value, []) then
          begin
            dmEst.tbProduto.Edit;
            dmEst.tbProdutoESTOQUEFISICO.Value := dmEst.tbProdutoESTOQUEFISICO.Value +
                                                  FieldByName('QUANTIDADE').Value;
            dmEst.tbProdutoPRECOCUSTO.Value := FieldByName('VALORUNITARIO').Value;
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

procedure TfrmPedidoComp.DBGrid1EditButtonClick(Sender: TObject);
begin
  if DbGrid1.SelectedField = dmEst.tbItenPedidoCompraCODIGOPRODUTO then
  begin
  if frmSeekProduto.ShowModal = mrOk then
    begin
      dmEst.tbItenPedidoCompra.Edit;
      dmEst.tbItenPedidoCompraNUMEROPEDIDO.Value      := dmEst.tbPedidoCompraNUMEROPEDIDO.Value;
      dmEst.tbItenPedidoCompraCODIGOPRODUTO.Value     := dmEst.tbProdutoCODIGOPRODUTO.Value;
      //dmEst.tbItenPedidoCompraDESCRICAOPRODUTO.Value  := dmEst.tbProdutoDESCRICAO.Value;
      //dmEst.tbItenPedidoCompraVALORUNITARIO.Value     := dmEst.tbProdutoPRECOVenda.Value;
    end;
  end;
end;

end.
