unit untdtEst;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  TdtEst = class(TDataModule)
    dsFormaPag: TDataSource;
    dsFornec: TDataSource;
    dsMoeda: TDataSource;
    dsVendedor: TDataSource;
    dsSubGrupo: TDataSource;
    dsAdmCartao: TDataSource;
    dsItenPedidoCompra: TDataSource;
    dsProduto: TDataSource;
    dsGrupo: TDataSource;
    dsItenPedidoVenda: TDataSource;
    dsPedidoVenda: TDataSource;
    dsPedidoCompra: TDataSource;
    dsCliente: TDataSource;
    dsFormaRec: TDataSource;
    qryFormaPag: TQuery;
    qryFornec: TQuery;
    qryMoeda: TQuery;
    qryVendedor: TQuery;
    qrySubGrupo: TQuery;
    qryAdmCartao: TQuery;
    qryItenPedidoCompra: TQuery;
    qryProduto: TQuery;
    qryGrupo: TQuery;
    qryItenPedidoVenda: TQuery;
    qryPedidoVenda: TQuery;
    qryPedidoCompra: TQuery;
    qryCliente: TQuery;
    qryFormaRec: TQuery;
    qryFormaPagCODIGOFORNECEDOR: TIntegerField;
    qryFormaPagCODIGOFORMAPAGAMENTO: TIntegerField;
    qryFormaPagDESCRICAO: TStringField;
    qryFormaPagPERCENTUAL: TFloatField;
    qryFormaPagVISTAPARCELADOCARTAO: TStringField;
    qryFormaPagCODIGOADMCARTAO: TIntegerField;
    qryFormaPagPARCELAS: TIntegerField;
    qryFormaPagINTERVALO: TIntegerField;
    qryFormaPagPRIMEIROVENCTO: TIntegerField;
    qryFornecCODIGOFORNECEDOR: TIntegerField;
    qryFornecNOME: TStringField;
    qryFornecTIPO: TStringField;
    qryFornecOCUPACAO: TStringField;
    qryFornecCNPJ: TStringField;
    qryFornecIE: TStringField;
    qryFornecDATACADASTRO: TDateTimeField;
    qryFornecENDERECO: TStringField;
    qryFornecBAIRRO: TStringField;
    qryFornecCEP: TStringField;
    qryFornecCIDADE: TStringField;
    qryFornecUF: TStringField;
    qryFornecFONE: TStringField;
    qryFornecCONTATO: TStringField;
    qryFornecFAX: TStringField;
    qryFornecCELULAR: TStringField;
    qryFornecEMAIL: TStringField;
    qryMoedaCODIGOMOEDA: TIntegerField;
    qryMoedaDESCRICAO: TStringField;
    qryMoedaVALOR: TFloatField;
    qryVendedorCODIGO: TIntegerField;
    qryVendedorNOME: TStringField;
    qryVendedorENDERECO: TStringField;
    qryVendedorAPELIDO: TStringField;
    qryVendedorBAIRRO: TStringField;
    qryVendedorCIDADE: TStringField;
    qryVendedorCEP: TStringField;
    qryVendedorUF: TStringField;
    qryVendedorFONE: TStringField;
    qryVendedorCELULAR: TStringField;
    qryVendedorCPF: TStringField;
    qryVendedorRG: TStringField;
    qryVendedorEMAIL: TStringField;
    qryVendedorTIPO: TStringField;
    qryVendedorCOMISSAO: TFloatField;
    qryVendedorDESCONTOMAXIMO: TFloatField;
    qrySubGrupoCODIGOSUBGRUPO: TIntegerField;
    qrySubGrupoDESCRICAO: TStringField;
    qrySubGrupoFORMULA: TStringField;
    qryAdmCartaoCODIGOADMCARTAO: TIntegerField;
    qryAdmCartaoDESCRICAO: TStringField;
    qryAdmCartaoPERCENTUAL: TFloatField;
    qryAdmCartaoCONTATO: TStringField;
    qryAdmCartaoTELEFONE: TStringField;
    qryItenPedidoCompraNUMEROPEDIDO: TIntegerField;
    qryItenPedidoCompraCODIGOPRODUTO: TIntegerField;
    qryItenPedidoCompraQUANTIDADE: TFloatField;
    qryItenPedidoCompraVALORUNITARIO: TFloatField;
    qryGrupoCODIGOGRUPO: TIntegerField;
    qryGrupoDESCRICAO: TStringField;
    qryProdutoCODIGOPRODUTO: TIntegerField;
    dd: TStringField;
    qryProdutoCODIGOFORNECEDOR: TIntegerField;
    qryProdutoCODIGOGRUPO: TIntegerField;
    qryProdutoCODIGOSUBGRUPO: TIntegerField;
    qryProdutoCODIGOBARRA: TStringField;
    qryProdutoDESCRICAODETALHADA: TStringField;
    qryProdutoFOTO: TBlobField;
    qryProdutoCODIGOMOEDA: TIntegerField;
    qryProdutoPRECOCUSTO: TFloatField;
    qryProdutoPRECOVENDA: TFloatField;
    qryProdutoESTOQUEFISICO: TIntegerField;
    qryProdutoESTOQUEMINIMO: TIntegerField;
    qryProdutoESTOQUECRITICO: TIntegerField;
    qryProdutoUNIDADE: TStringField;
    qryProdutoCOMISSAO: TFloatField;
    qryProdutoOBSERVACAO: TStringField;
    qryPedidoVendaNUMEROPEDIDO: TIntegerField;
    qryPedidoVendaCODIGOCLIENTE: TIntegerField;
    qryPedidoVendaCODIGOVENDEDOR: TIntegerField;
    qryPedidoVendaCODIGOFORMARECEBIMENTO: TIntegerField;
    qryPedidoVendaDATAPEDIDO: TDateTimeField;
    qryPedidoVendaDATAVENCTO: TDateTimeField;
    qryClienteCODIGOCLIENTE: TIntegerField;
    qryClienteNOME: TStringField;
    qryClienteTIPO: TIntegerField;
    qryClienteOCUPACAO: TIntegerField;
    qryClienteCPF: TStringField;
    qryClienteRG: TStringField;
    qryClienteDATANASCIMENTO: TDateTimeField;
    qryClienteSEXO: TStringField;
    qryClienteENDERECO: TStringField;
    qryClienteBAIRRO: TStringField;
    qryClienteCEP: TStringField;
    qryClienteCIDADE: TStringField;
    qryClienteUF: TStringField;
    qryClienteFONE: TStringField;
    qryClienteCONTATO: TStringField;
    qryClienteFAX: TStringField;
    qryClienteCELULAR: TStringField;
    qryClienteEMAIL: TStringField;
    qryFormaPagFORNECEDOR: TStringField;
    qryPedidoVendaCLIENTE: TStringField;
    qryPedidoVendaVENDEDOR: TStringField;
    qryPedidoVendaRECEBIMENTO: TStringField;
    qryFormaPagCARTAO: TStringField;
    qryPedidoCompraNUMEROPEDIDO: TIntegerField;
    qryPedidoCompraCODIGOFORMAPAGAMENTO: TIntegerField;
    qryPedidoCompraCODIGOFORNECEDOR: TIntegerField;
    qryPedidoCompraNUMEROCONTROLE: TStringField;
    qryPedidoCompraDATAPEDIDO: TDateTimeField;
    qryPedidoCompraDATAENTREGA: TDateTimeField;
    qryPedidoCompraFORNECEDOR: TStringField;
    qryPedidoCompraPAGAMENTO: TStringField;
    qryProdutoFORNECEDOR: TStringField;
    qryProdutoGRUPO: TStringField;
    qryProdutoSUBGRUPO: TStringField;
    qryProdutoMOEDA: TStringField;
    qryFormaRecCODIGOFORMARECEBIMENTO: TIntegerField;
    qryFormaRecDESCRICAO: TStringField;
    qryFormaRecPERCENTUAL: TFloatField;
    qryFormaRecVISTAPARCELADO: TStringField;
    qryFormaRecPARCELAS: TIntegerField;
    qryFormaRecINTERVALO: TIntegerField;
    qryFormaRecPRIMEIROVENCTO: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtEst: TdtEst;

implementation

{$R *.DFM}

end.
