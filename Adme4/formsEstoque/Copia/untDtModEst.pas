unit untDtModEst;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, IBCustomDataSet, IBTable;

type
  TdmEst = class(TDataModule)
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
    dsFornecProd: TDataSource;
    tbFormaPag: TIBTable;
    tbFornec: TIBTable;
    tbFornecCODIGOFORNECEDOR: TIntegerField;
    tbFornecNOME: TIBStringField;
    tbFornecTIPO: TIBStringField;
    tbFornecOCUPACAO: TIBStringField;
    tbFornecIE: TIBStringField;
    tbFornecDATACADASTRO: TDateTimeField;
    tbFornecENDERECO: TIBStringField;
    tbFornecBAIRRO: TIBStringField;
    tbFornecCEP: TIBStringField;
    tbFornecCIDADE: TIBStringField;
    tbFornecUF: TIBStringField;
    tbFornecFONE: TIBStringField;
    tbFornecCONTATO: TIBStringField;
    tbFornecFAX: TIBStringField;
    tbFornecCELULAR: TIBStringField;
    tbFormaPagCODIGOFORNECEDOR: TIntegerField;
    tbFormaPagCODIGOFORMAPAGAMENTO: TIntegerField;
    tbFormaPagDESCRICAO: TIBStringField;
    tbFormaPagPERCENTUAL: TFloatField;
    tbFormaPagPARCELAS: TIntegerField;
    tbFormaPagINTERVALO: TIntegerField;
    tbFormaPagPRIMEIROVENCTO: TIntegerField;
    tbFormaPagFORNECEDOR: TStringField;
    tbMoeda: TIBTable;
    tbMoedaCODIGOMOEDA: TIntegerField;
    tbMoedaDESCRICAO: TIBStringField;
    tbMoedaVALOR: TFloatField;
    tbMoedaSIGLA: TIBStringField;
    tbVendedor: TIBTable;
    tbSubGrupo: TIBTable;
    tbSubGrupoCODIGOSUBGRUPO: TIBStringField;
    tbSubGrupoDESCRICAO: TIBStringField;
    tbVendedorCODIGO: TIntegerField;
    tbVendedorNOME: TIBStringField;
    tbVendedorENDERECO: TIBStringField;
    tbVendedorAPELIDO: TIBStringField;
    tbVendedorBAIRRO: TIBStringField;
    tbVendedorCIDADE: TIBStringField;
    tbVendedorCEP: TIBStringField;
    tbVendedorUF: TIBStringField;
    tbVendedorFONE: TIBStringField;
    tbVendedorCELULAR: TIBStringField;
    tbVendedorCPF: TIBStringField;
    tbVendedorRG: TIBStringField;
    tbVendedorEMAIL: TIBStringField;
    tbVendedorTIPO: TIBStringField;
    tbVendedorCOMISSAO: TFloatField;
    tbVendedorDESCONTOMAXIMO: TFloatField;
    tbAdmCartao: TIBTable;
    tbAdmCartaoCODIGOADMCARTAO: TIntegerField;
    tbAdmCartaoDESCRICAO: TIBStringField;
    tbAdmCartaoPERCENTUAL: TFloatField;
    tbAdmCartaoCONTATO: TIBStringField;
    tbAdmCartaoTELEFONE: TIBStringField;
    tbItenPedidoCompra: TIBTable;
    tbProduto: TIBTable;
    tbProdutoCODIGOPRODUTO: TIntegerField;
    tbProdutoCODIGOLINHA: TIBStringField;
    tbProdutoCODIGOGRUPO: TIBStringField;
    tbProdutoCODIGOSUBGRUPO: TIBStringField;
    tbProdutoCODIGOBARRA: TIBStringField;
    tbProdutoDESCRICAODETALHADA: TIBStringField;
    tbProdutoFOTO: TBlobField;
    tbProdutoREFERENCIAFORNEC: TIBStringField;
    tbProdutoCODIGOMOEDA: TIntegerField;
    tbProdutoPRECOCUSTO: TFloatField;
    tbProdutoPRECOVENDA: TFloatField;
    tbProdutoESTOQUEFISICO: TIntegerField;
    tbProdutoESTOQUEMINIMO: TIntegerField;
    tbProdutoESTOQUECRITICO: TIntegerField;
    tbProdutoUNIDADE: TIBStringField;
    tbProdutoCOMISSAO: TFloatField;
    tbProdutoOBSERVACAO: TIBStringField;
    tbGrupo: TIBTable;
    tbItenPedidoVenda: TIBTable;
    tbFormaRec: TIBTable;
    tbPedidoVenda: TIBTable;
    tbPedidoCompra: TIBTable;
    tbCliente: TIBTable;
    tbFornecProd: TIBTable;
    tbPedidoVendaNUMEROPEDIDO: TIntegerField;
    tbPedidoVendaCODIGOCLIENTE: TIntegerField;
    tbPedidoVendaCODIGOVENDEDOR: TIntegerField;
    tbPedidoVendaCODIGOFORMARECEBIMENTO: TIntegerField;
    tbPedidoVendaDATAPEDIDO: TDateTimeField;
    tbPedidoVendaDATAVENCTO: TDateTimeField;
    tbPedidoCompraNUMEROPEDIDO: TIntegerField;
    tbPedidoCompraCODIGOFORMAPAGAMENTO: TIntegerField;
    tbPedidoCompraCODIGOFORNECEDOR: TIntegerField;
    tbPedidoCompraNUMEROCONTROLE: TIBStringField;
    tbPedidoCompraDATAPEDIDO: TDateTimeField;
    tbPedidoCompraDATAENTREGA: TDateTimeField;
    tbGrupoCODIGOGRUPO: TIBStringField;
    tbGrupoDESCRICAO: TIBStringField;
    tbItenPedidoVendaNUMEROPEDIDO: TIntegerField;
    tbItenPedidoVendaCODIGOPRODUTO: TIntegerField;
    tbItenPedidoVendaQUANTIDADE: TIntegerField;
    tbFormaRecCODIGOFORMARECEBIMENTO: TIntegerField;
    tbFormaRecDESCRICAO: TIBStringField;
    tbFormaRecPERCENTUAL: TFloatField;
    tbFormaRecCARTAO: TIBStringField;
    tbFormaRecVISTAPARCELADO: TIBStringField;
    tbFormaRecCODIGOADMCARTAO: TIntegerField;
    tbFormaRecPARCELAS: TIntegerField;
    tbFormaRecINTERVALO: TIntegerField;
    tbFormaRecPRIMEIROVENCTO: TIntegerField;
    tbFornecProdCODIGOPRODUTO: TIntegerField;
    tbItenPedidoCompraNUMEROPEDIDO: TIntegerField;
    tbItenPedidoCompraCODIGOPRODUTO: TIntegerField;
    tbItenPedidoCompraVALORUNITARIO: TFloatField;
    tbItenPedidoCompraDESCRICAOPRODUTO: TStringField;
    tbPedidoCompraFORMAPAGAMENTO: TStringField;
    tbPedidoCompraFORNECEDOR: TStringField;
    tbFornecProdNOMEFORNEC: TStringField;
    tbPedidoVendaNOMECLIENTE: TStringField;
    tbPedidoVendaNOMEVENDEDOR: TStringField;
    tbPedidoVendaFORMArecebimento: TStringField;
    tbItenPedidoVendaDESCRICAOPRODUTO: TStringField;
    dsLinha: TDataSource;
    tbLinha: TIBTable;
    tbLinhaCODIGOLINHA: TIBStringField;
    tbLinhaDESCRICAO: TIBStringField;
    tbProdutoDESCRICAOLINHA: TIBStringField;
    tbProdutoDESCRICAOGRUPO: TIBStringField;
    tbProdutoDESCRICAOSUBGRUPO: TIBStringField;
    tbProdutoDESCRICAOMOEDA: TIBStringField;
    tbProdutoCODIGOCOMPLETO: TIBStringField;
    tbProdutoTEMCONJUNTO: TIBStringField;
    dsConjunto: TDataSource;
    tbConjunto: TIBTable;
    tbConjuntoCODIGOCONJUNTO: TIntegerField;
    tbConjuntoCODIGOPRODUTO: TIntegerField;
    tbProdutoDATACADASTRO: TDateTimeField;
    tbClienteCODIGOCLIENTE: TIntegerField;
    tbClienteNOME: TIBStringField;
    tbClienteRG: TIBStringField;
    tbClienteSEXO: TIBStringField;
    tbClienteENDERECO: TIBStringField;
    tbClienteBAIRRO: TIBStringField;
    tbClienteCEP: TIBStringField;
    tbClienteCIDADE: TIBStringField;
    tbClienteUF: TIBStringField;
    tbClienteFONE: TIBStringField;
    tbClienteCONTATO: TIBStringField;
    tbClienteFAX: TIBStringField;
    tbClienteCELULAR: TIBStringField;
    tbClienteOCUPACAO: TIBStringField;
    tbClienteTIPO: TIBStringField;
    tbProdutoPESOPEDRA: TFloatField;
    tbProdutoPESOPECA: TFloatField;
    tbItenPedidoVendaVALORUNITARIO: TFloatField;
    tbPedidoVendaSITUACAO: TIBStringField;
    tbPedidoCompraSITUACAO: TIBStringField;
    tbItenPedidoVendaSUBTOTAL: TFloatField;
    tbItenPedidoCompraSUBTOTAL: TFloatField;
    tbPedidoCompraVALORTOTAL: TFloatField;
    tbPedidoVendaVALORTOTAL: TFloatField;
    tbPedidoVendaSTATUS: TStringField;
    tbPedidoCompraSTATUS: TStringField;
    dsAniversario: TDataSource;
    tbAniversario: TIBTable;
    tbAniversarioCODIGOCLIENTE: TIntegerField;
    tbAniversarioNOME: TIBStringField;
    dsRepresentante: TDataSource;
    tbRepresentante: TIBTable;
    tbRepresentanteCODIGOREPRESENTANTE: TIntegerField;
    tbRepresentanteCODIGOFORNECEDOR: TIntegerField;
    tbRepresentanteNOME: TIBStringField;
    tbRepresentanteENDERECO: TIBStringField;
    tbRepresentanteFONE: TIBStringField;
    tbRepresentanteEMAIL: TIBStringField;
    dsComposicaoPeso: TDataSource;
    tbComposicaoPeso: TIBTable;
    tbFornecProdCODIGOFORNECEDOR: TIntegerField;
    tbFornecBANCO: TIBStringField;
    tbFornecCONTA: TIBStringField;
    tbRepresentanteCELULAR: TIBStringField;
    tbRepresentanteFAX: TIBStringField;
    tbProdutoFORMULA: TIBStringField;
    tbProdutoPrecoVendaCalc: TFloatField;
    tbProdutoMARGEM: TFloatField;
    dsPedra: TDataSource;
    tbPedra: TIBTable;
    tbPedraDESCRICAO: TIBStringField;
    tbComposicaoPesoCODIGOPRODUTO: TIntegerField;
    tbComposicaoPesoNUMEROPEDRA: TIBStringField;
    tbComposicaoPesoKILATE: TFloatField;
    tbComposicaoPesoCOR: TIBStringField;
    tbComposicaoPesoLAPIDACAO: TIBStringField;
    tbComposicaoPesoDescPedra: TStringField;
    tbFornecCONTATO2: TIBStringField;
    tbItenPedidoCompraQUANTIDADE: TIntegerField;
    tbComposicaoPesoREFERENCIAFORNEC: TIBStringField;
    tbPedraCODIGOPEDRA: TIBStringField;
    tbComposicaoPesoCODIGOPEDRA: TIBStringField;
    tbClienteDATANASCIMENTO: TDateTimeField;
    tbFornecFONEFREE: TIBStringField;
    tbClienteANONASCIMENTO: TIBStringField;
    tbClienteDATACADASTRO: TDateTimeField;
    tbClienteDIAMES: TIBStringField;
    tbProdutoGRAMA: TFloatField;
    tbProdutoMAOOBRA: TFloatField;
    tbProdutoINDICE: TFloatField;
    tbFornecEMAIL: TIBStringField;
    tbFornecSITE: TIBStringField;
    tbFornecCNPJ: TIBStringField;
    tbClienteEMAIL: TIBStringField;
    tbClienteCPF: TIBStringField;
    tbAniversarioDATA: TDateTimeField;
    tbAniversarioANONASCIMENTO: TIBStringField;
    tbAniversarioDIAMES: TIBStringField;
    tbProdutoJUROS: TFloatField;
    tbProdutoDOLAR: TFloatField;
    tbProdutoSEGURO: TFloatField;
    tbFornecAGENCIA: TIBStringField;
    tbProdutoDESCRICAO: TIBStringField;
    tbProdutoCODFORNEC: TFloatField;
    dsMetal: TDataSource;
    tbMetal: TIBTable;
    tbMetalCODIGOMETAL: TIntegerField;
    tbMetalDESCRICAO: TIBStringField;
    tbProdutoCODIGOMETAL: TIntegerField;
    tbProdutoMETAL: TStringField;
    tbProdutoPrecoCustCalc: TFloatField;
    tbProdutoEMITETIQ: TIBStringField;
    tbFornecNOMECORR: TIBStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure GeraCodigo(DataSet: TDataSet);
    procedure GravaCodigo(DataSet: TDataSet);
    procedure tbItenPedidoVendaCalcFields(DataSet: TDataSet);
    procedure tbItenPedidoCompraCalcFields(DataSet: TDataSet);
    procedure tbPedidoCompraCalcFields(DataSet: TDataSet);
    procedure tbPedidoVendaCalcFields(DataSet: TDataSet);
    procedure tbProdutoCalcFields(DataSet: TDataSet);
    procedure tbProdutoAfterPost(DataSet: TDataSet);
    procedure tbProdutoBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmEst: TdmEst;
  valor: array[1..25] of integer;

implementation

uses untDtModConf, FuncoesDB;

{$R *.DFM}

procedure TdmEst.DataModuleCreate(Sender: TObject);
begin
  tbFormaPag.Open;
  tbFornec.Open;
  tbMoeda.Open;
  tbVendedor.Open;
  tbSubGrupo.Open;
  tbAdmCartao.Open;
  tbItenPedidoCompra.Open;
  tbProduto.Open;
  tbGrupo.Open;
  tbItenPedidoVenda.Open;
  tbPedidoVenda.Open;
  tbPedidoCompra.Open;
  tbCliente.Open;
  tbFormaRec.Open;
  tbFornecProd.Open;
  tbLinha.Open;
  tbConjunto.Open;
  tbAniversario.Open;
  tbRepresentante.Open;
  tbComposicaoPeso.OPen;
  tbPedra.Open;
  tbMetal.Open;
end;

procedure TdmEst.GeraCodigo(DataSet: TDataSet);
var
  CampoIndex: String;
  tabela: TIBTable;
  i: integer;

begin
 if DataSet.Active then
    if DataSet.RecordCount = 0 then
    begin
      valor[ DataSet.Tag ] := 0;
    end
    else
    begin

      for i := 0 to dmEst.ComponentCount - 1 do
      begin
        if dmEst.Components[i].Tag = DataSet.Tag then
        begin
          tabela := (dmEst.Components[i] as TIBTable);
          break;
        end;
      end;

      campoIndex := tabela.IndexFieldNames;
      tabela.IndexFieldNames := '';

      DataSet.Last;
      if DataSet.Tag in [1,17,19] then
        valor[ DataSet.Tag ] := DataSet.Fields.FieldByNumber(2).Value
      else
        valor[ DataSet.Tag ] := DataSet.Fields.FieldByNumber(1).Value;

      tabela.IndexFieldNames := campoIndex;


    end;
end;

procedure TdmEst.GravaCodigo(DataSet: TDataSet);
begin
  inc(valor[ DataSet.Tag ]);
  if DataSet.Tag in [1,17,19] then
    DataSet.Fields.FieldByNumber(2).Value := valor[ DataSet.Tag ]
  else
    DataSet.Fields.FieldByNumber(1).Value := valor[ DataSet.Tag ];
  dmEst.tbProdutoUNIDADE.Value := 'UN';

end;

procedure TdmEst.tbItenPedidoVendaCalcFields(DataSet: TDataSet);
begin
  tbItenPedidoVendaSUBTOTAL.Value := tbItenPedidoVendaQUANTIDADE.Value *
                                     tbItenPedidoVendaVALORUNITARIO.Value;
end;

procedure TdmEst.tbItenPedidoCompraCalcFields(DataSet: TDataSet);
begin
  tbItenPedidoCompraSUBTOTAL.Value := tbItenPedidoCompraQUANTIDADE.Value *
                                      tbItenPedidoCOmpraVALORUNITARIO.Value;
end;

procedure TdmEst.tbPedidoCompraCalcFields(DataSet: TDataSet);
var
  sub: real;
  reg: integer;
  
begin
  sub := 0.00;
  reg := tbItenPedidoCompra.RecNo;
  with tbItenPedidoCompra do
  begin
    DisableControls;
    First;
    while not Eof do
    begin
      sub := sub + tbItenPedidoCompraSUBTOTAL.Value;
      Next;
    end;
    EnableControls;
  end;
  tbItenPedidoCompra.RecNo := reg;
  tbPedidoCompraVALORTOTAL.Value := sub;

  if tbPedidoCompraSITUACAO.Value = 'C' then
    tbPedidoCompraSTATUS.Value := 'CONFIRMADO'
  else
  if tbPedidoCompraSITUACAO.Value = 'P' then
    tbPedidoCompraSTATUS.Value := 'PENDENTE'
  else
    tbPedidoCompraSTATUS.Value := 'NÃO CONFIRMADO'
end;

procedure TdmEst.tbPedidoVendaCalcFields(DataSet: TDataSet);
var
  sub: real;
  reg: integer;
  
begin
  sub := 0.00;
  reg := tbItenPedidoVenda.RecNo;
  with tbItenPedidoVenda do
  begin
    DisableControls;
    First;
    while not Eof do
    begin
      sub := sub + tbItenPedidoVendaSUBTOTAL.Value;
      Next;
    end;
    EnableControls;
  end;
  tbItenPedidoVenda.RecNo := reg;
  tbPedidoVendaVALORTOTAL.Value := sub;

  if tbPedidoVendaSITUACAO.Value = 'C' then
    tbPedidoVendaSTATUS.Value := 'CONFIRMADO'
  else
  if tbPedidoVendaSITUACAO.Value = 'P' then
    tbPedidoVendaSTATUS.Value := 'PENDENTE'
  else
    tbPedidoVendaSTATUS.Value := 'NÃO CONFIRMADO'
end;

procedure TdmEst.tbProdutoCalcFields(DataSet: TDataSet);
var
 moeda, Moeda1: real;

begin
  tbMoeda.Locate('Descricao', 'Dolar', [loCaseInsensitive]);
  moeda1 := tbMoedaVALOR.Value;

  tbMoeda.Locate('CODIGOMOEDA', tbProdutoCODIGOMOEDA.Value, []);
  moeda := tbMoedaVALOR.Value;


  tbProdutoPrecoCustCalc.Value:= tbProdutoGRAMA.Value * ( tbProdutoMAOOBRA.Value +
                              tbProdutoINDICE.Value * moeda) + (tbProdutoDOLAR.Value * MOEDA1);

  tbProdutoPrecoCustCalc.Value  := tbProdutoPrecoCustCalc.Value * (1 + tbProdutoSEGURO.Value / 100 );

  tbProdutoPrecoCustCalc.Value  := tbProdutoPrecoCustCalc.Value * (1 + tbProdutoJuros.Value / 100 );

  tbProdutoPrecoVendaCalc.Value := tbProdutoPrecoCustCalc.Value * (1 + tbProdutoMARGEM.Value / 100 );

end;

procedure TdmEst.tbProdutoAfterPost(DataSet: TDataSet);
var
 moeda, moeda1: real;

begin
  tbMoeda.Locate('Descricao', 'Dolar', [loCaseInsensitive]);
  moeda1 := tbMoedaVALOR.Value;

  tbMoeda.Locate('CODIGOMOEDA', tbProdutoCODIGOMOEDA.Value, []);
  moeda := tbMoedaVALOR.Value;

  tbProdutoPRECOCUSTO.Value:= tbProdutoGRAMA.Value * ( tbProdutoMAOOBRA.Value +
                              tbProdutoINDICE.Value * moeda) + (tbProdutoDOLAR.Value * MOEDA1);

  tbProdutoPRECOCUSTO.Value:= tbProdutoPRECOCUSTO.Value * (1 + tbProdutoSEGURO.Value / 100 );

  tbProdutoPRECOCUSTO.Value:= tbProdutoPRECOCUSTO.Value * (1 + tbProdutoJuros.Value / 100 );
end;

procedure TdmEst.tbProdutoBeforePost(DataSet: TDataSet);
var
 moeda, Moeda1: real;

begin
  tbMoeda.Locate('Descricao', 'Dolar', [loCaseInsensitive]);
  moeda1 := tbMoedaVALOR.Value;

  tbMoeda.Locate('CODIGOMOEDA', tbProdutoCODIGOMOEDA.Value, []);
  moeda := tbMoedaVALOR.Value;

  tbProdutoPRECOCUSTO.Value:= tbProdutoGRAMA.Value * ( tbProdutoMAOOBRA.Value +
                              tbProdutoINDICE.Value * moeda) + (tbProdutoDOLAR.Value * MOEDA1);

  tbProdutoPRECOCUSTO.Value:= tbProdutoPRECOCUSTO.Value * (1 + tbProdutoSEGURO.Value / 100 );

  tbProdutoPRECOCUSTO.Value:= tbProdutoPRECOCUSTO.Value * (1 + tbProdutoJuros.Value / 100 );
end;
end.

