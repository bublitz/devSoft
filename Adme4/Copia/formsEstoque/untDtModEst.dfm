object dmEst: TdmEst
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 193
  Top = 104
  Height = 596
  Width = 821
  object dsFormaPag: TDataSource
    DataSet = tbFormaPag
    Left = 20
    Top = 7
  end
  object dsFornec: TDataSource
    DataSet = tbFornec
    Left = 20
    Top = 65
  end
  object dsMoeda: TDataSource
    DataSet = tbMoeda
    Left = 20
    Top = 122
  end
  object dsVendedor: TDataSource
    DataSet = tbVendedor
    Left = 20
    Top = 178
  end
  object dsSubGrupo: TDataSource
    DataSet = tbSubGrupo
    Left = 20
    Top = 234
  end
  object dsAdmCartao: TDataSource
    DataSet = tbAdmCartao
    Left = 20
    Top = 292
  end
  object dsItenPedidoCompra: TDataSource
    DataSet = tbItenPedidoCompra
    Left = 20
    Top = 347
  end
  object dsProduto: TDataSource
    DataSet = tbProduto
    Left = 20
    Top = 403
  end
  object dsGrupo: TDataSource
    DataSet = tbGrupo
    Left = 248
    Top = 206
  end
  object dsItenPedidoVenda: TDataSource
    DataSet = tbItenPedidoVenda
    Left = 250
    Top = 272
  end
  object dsPedidoVenda: TDataSource
    DataSet = tbPedidoVenda
    Left = 248
    Top = 9
  end
  object dsPedidoCompra: TDataSource
    DataSet = tbPedidoCompra
    Left = 248
    Top = 75
  end
  object dsCliente: TDataSource
    DataSet = tbCliente
    Left = 248
    Top = 138
  end
  object dsFormaRec: TDataSource
    DataSet = tbFormaRec
    Left = 248
    Top = 337
  end
  object dsFornecProd: TDataSource
    DataSet = tbFornecProd
    Left = 248
    Top = 403
  end
  object tbFormaPag: TIBTable
    Tag = 1
    Database = dmConf.dtBase
    Transaction = dmConf.IBTrans
    AfterInsert = GravaCodigo
    BeforeInsert = GeraCodigo
    CachedUpdates = False
    TableName = 'FORMAPAGAMENTO'
    Left = 126
    Top = 9
    object tbFormaPagCODIGOFORMAPAGAMENTO: TIntegerField
      FieldName = 'CODIGOFORMAPAGAMENTO'
    end
    object tbFormaPagCODIGOFORNECEDOR: TIntegerField
      FieldName = 'CODIGOFORNECEDOR'
    end
    object tbFormaPagDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object tbFormaPagPERCENTUAL: TFloatField
      FieldName = 'PERCENTUAL'
      DisplayFormat = ',#.00'
    end
    object tbFormaPagPARCELAS: TIntegerField
      FieldName = 'PARCELAS'
    end
    object tbFormaPagINTERVALO: TIntegerField
      FieldName = 'INTERVALO'
    end
    object tbFormaPagPRIMEIROVENCTO: TIntegerField
      FieldName = 'PRIMEIROVENCTO'
    end
    object tbFormaPagFORNECEDOR: TStringField
      FieldKind = fkLookup
      FieldName = 'FORNECEDOR'
      LookupDataSet = tbFornec
      LookupKeyFields = 'CODIGOFORNECEDOR'
      LookupResultField = 'NOME'
      KeyFields = 'CODIGOFORNECEDOR'
      Size = 50
      Lookup = True
    end
  end
  object tbFornec: TIBTable
    Tag = 2
    Database = dmConf.dtBase
    Transaction = dmConf.IBTrans
    AfterInsert = GravaCodigo
    BeforeInsert = GeraCodigo
    CachedUpdates = False
    TableName = 'FORNECEDOR'
    Left = 124
    Top = 65
    object tbFornecCODIGOFORNECEDOR: TIntegerField
      FieldName = 'CODIGOFORNECEDOR'
    end
    object tbFornecNOME: TIBStringField
      FieldName = 'NOME'
      Size = 50
    end
    object tbFornecTIPO: TIBStringField
      FieldName = 'TIPO'
      Size = 1
    end
    object tbFornecOCUPACAO: TIBStringField
      FieldName = 'OCUPACAO'
      Size = 35
    end
    object tbFornecIE: TIBStringField
      FieldName = 'IE'
      Size = 25
    end
    object tbFornecDATACADASTRO: TDateTimeField
      FieldName = 'DATACADASTRO'
      EditMask = '!99/99/0000;1;_'
    end
    object tbFornecENDERECO: TIBStringField
      FieldName = 'ENDERECO'
      Size = 50
    end
    object tbFornecBAIRRO: TIBStringField
      FieldName = 'BAIRRO'
      Size = 25
    end
    object tbFornecCEP: TIBStringField
      FieldName = 'CEP'
      EditMask = '00\-000\-000;1;_'
      Size = 10
    end
    object tbFornecCIDADE: TIBStringField
      FieldName = 'CIDADE'
      Size = 25
    end
    object tbFornecUF: TIBStringField
      FieldName = 'UF'
      Size = 2
    end
    object tbFornecFONE: TIBStringField
      FieldName = 'FONE'
      EditMask = '!\(99\)#000-0000;1;_'
      Size = 25
    end
    object tbFornecCONTATO: TIBStringField
      FieldName = 'CONTATO'
      Size = 25
    end
    object tbFornecFAX: TIBStringField
      FieldName = 'FAX'
      EditMask = '!\(99\)#000-0000;1;_'
      Size = 25
    end
    object tbFornecCELULAR: TIBStringField
      FieldName = 'CELULAR'
      EditMask = '!\(99\)#000-0000;1;_'
      Size = 25
    end
    object tbFornecBANCO: TIBStringField
      FieldName = 'BANCO'
      Size = 25
    end
    object tbFornecCONTA: TIBStringField
      FieldName = 'CONTA'
    end
    object tbFornecCONTATO2: TIBStringField
      FieldName = 'CONTATO2'
      Size = 25
    end
    object tbFornecFONEFREE: TIBStringField
      FieldName = 'FONEFREE'
      Size = 25
    end
    object tbFornecEMAIL: TIBStringField
      FieldName = 'EMAIL'
      Size = 100
    end
    object tbFornecSITE: TIBStringField
      FieldName = 'SITE'
      Size = 100
    end
    object tbFornecCNPJ: TIBStringField
      FieldName = 'CNPJ'
      Size = 25
    end
    object tbFornecAGENCIA: TIBStringField
      FieldName = 'AGENCIA'
      Size = 10
    end
    object tbFornecNOMECORR: TIBStringField
      FieldName = 'NOMECORR'
      Size = 50
    end
  end
  object tbMoeda: TIBTable
    Tag = 3
    Database = dmConf.dtBase
    Transaction = dmConf.IBTrans
    AfterInsert = GravaCodigo
    BeforeInsert = GeraCodigo
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'CODIGOMOEDA'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'DESCRICAO'
        Attributes = [faRequired]
        DataType = ftString
        Size = 50
      end
      item
        Name = 'VALOR'
        DataType = ftFloat
      end
      item
        Name = 'SIGLA'
        DataType = ftString
        Size = 2
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY3'
        Fields = 'CODIGOMOEDA'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'XPKMOEDA'
        Fields = 'CODIGOMOEDA'
        Options = [ixUnique]
      end
      item
        Name = 'XAK1MOEDA'
        Fields = 'DESCRICAO'
        Options = [ixUnique]
      end>
    StoreDefs = True
    TableName = 'MOEDA'
    Left = 124
    Top = 124
    object tbMoedaCODIGOMOEDA: TIntegerField
      FieldName = 'CODIGOMOEDA'
    end
    object tbMoedaDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object tbMoedaVALOR: TFloatField
      FieldName = 'VALOR'
      DisplayFormat = ',#0.00'
    end
    object tbMoedaSIGLA: TIBStringField
      FieldName = 'SIGLA'
      Size = 2
    end
  end
  object tbVendedor: TIBTable
    Tag = 4
    Database = dmConf.dtBase
    Transaction = dmConf.IBTrans
    AfterInsert = GravaCodigo
    BeforeInsert = GeraCodigo
    CachedUpdates = False
    TableName = 'VENDEDOR'
    Left = 126
    Top = 180
    object tbVendedorCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object tbVendedorNOME: TIBStringField
      FieldName = 'NOME'
      Size = 50
    end
    object tbVendedorENDERECO: TIBStringField
      FieldName = 'ENDERECO'
      Size = 50
    end
    object tbVendedorAPELIDO: TIBStringField
      FieldName = 'APELIDO'
      Size = 25
    end
    object tbVendedorBAIRRO: TIBStringField
      FieldName = 'BAIRRO'
      Size = 25
    end
    object tbVendedorCIDADE: TIBStringField
      FieldName = 'CIDADE'
      Size = 25
    end
    object tbVendedorCEP: TIBStringField
      FieldName = 'CEP'
      Size = 10
    end
    object tbVendedorUF: TIBStringField
      FieldName = 'UF'
      Size = 2
    end
    object tbVendedorFONE: TIBStringField
      FieldName = 'FONE'
      Size = 25
    end
    object tbVendedorCELULAR: TIBStringField
      FieldName = 'CELULAR'
      Size = 25
    end
    object tbVendedorCPF: TIBStringField
      FieldName = 'CPF'
      Size = 11
    end
    object tbVendedorRG: TIBStringField
      FieldName = 'RG'
      Size = 25
    end
    object tbVendedorEMAIL: TIBStringField
      FieldName = 'EMAIL'
      Size = 25
    end
    object tbVendedorTIPO: TIBStringField
      FieldName = 'TIPO'
      Size = 1
    end
    object tbVendedorCOMISSAO: TFloatField
      FieldName = 'COMISSAO'
    end
    object tbVendedorDESCONTOMAXIMO: TFloatField
      FieldName = 'DESCONTOMAXIMO'
    end
  end
  object tbSubGrupo: TIBTable
    Tag = 5
    Database = dmConf.dtBase
    Transaction = dmConf.IBTrans
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'CODIGOSUBGRUPO'
        Attributes = [faRequired]
        DataType = ftString
        Size = 2
      end
      item
        Name = 'DESCRICAO'
        Attributes = [faRequired]
        DataType = ftString
        Size = 50
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY4'
        Fields = 'CODIGOSUBGRUPO'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'XPKSUBGRUPO'
        Fields = 'CODIGOSUBGRUPO'
        Options = [ixUnique]
      end
      item
        Name = 'XAK1SUBGRUPO'
        Fields = 'DESCRICAO'
        Options = [ixUnique]
      end>
    StoreDefs = True
    TableName = 'SUBGRUPO'
    Left = 122
    Top = 236
    object tbSubGrupoCODIGOSUBGRUPO: TIBStringField
      FieldName = 'CODIGOSUBGRUPO'
      EditMask = '>c<c;1; '
      Size = 2
    end
    object tbSubGrupoDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      EditMask = '>cccccccccccccccccccccccccccccccccccccccc'
      Size = 50
    end
  end
  object tbAdmCartao: TIBTable
    Tag = 6
    Database = dmConf.dtBase
    Transaction = dmConf.IBTrans
    AfterInsert = GravaCodigo
    BeforeInsert = GeraCodigo
    CachedUpdates = False
    TableName = 'ADMCARTAO'
    Left = 126
    Top = 290
    object tbAdmCartaoCODIGOADMCARTAO: TIntegerField
      FieldName = 'CODIGOADMCARTAO'
    end
    object tbAdmCartaoDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object tbAdmCartaoPERCENTUAL: TFloatField
      FieldName = 'PERCENTUAL'
    end
    object tbAdmCartaoCONTATO: TIBStringField
      FieldName = 'CONTATO'
      Size = 25
    end
    object tbAdmCartaoTELEFONE: TIBStringField
      FieldName = 'TELEFONE'
      EditMask = '!\(99\)#000-0000;1;_'
      Size = 25
    end
  end
  object tbItenPedidoCompra: TIBTable
    Tag = 7
    Database = dmConf.dtBase
    Transaction = dmConf.IBTrans
    OnCalcFields = tbItenPedidoCompraCalcFields
    CachedUpdates = False
    IndexFieldNames = 'NUMEROPEDIDO'
    MasterFields = 'NUMEROPEDIDO'
    MasterSource = dsPedidoCompra
    TableName = 'ITENSPEDIDOCOMPRA'
    Left = 124
    Top = 347
    object tbItenPedidoCompraNUMEROPEDIDO: TIntegerField
      FieldName = 'NUMEROPEDIDO'
    end
    object tbItenPedidoCompraCODIGOPRODUTO: TIntegerField
      DisplayLabel = 'Código'
      FieldName = 'CODIGOPRODUTO'
    end
    object tbItenPedidoCompraDESCRICAOPRODUTO: TStringField
      DisplayLabel = 'Descrição'
      FieldKind = fkLookup
      FieldName = 'DESCRICAOPRODUTO'
      LookupDataSet = tbProduto
      LookupKeyFields = 'CODIGOPRODUTO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CODIGOPRODUTO'
      Size = 50
      Lookup = True
    end
    object tbItenPedidoCompraVALORUNITARIO: TFloatField
      DisplayLabel = 'Valor Unit'
      FieldName = 'VALORUNITARIO'
      currency = True
    end
    object tbItenPedidoCompraSUBTOTAL: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SUBTOTAL'
      currency = True
      Calculated = True
    end
    object tbItenPedidoCompraQUANTIDADE: TIntegerField
      FieldName = 'QUANTIDADE'
    end
  end
  object tbProduto: TIBTable
    Tag = 8
    Database = dmConf.dtBase
    Transaction = dmConf.IBTrans
    AfterInsert = GravaCodigo
    AfterPost = tbProdutoAfterPost
    BeforeInsert = GeraCodigo
    BeforePost = tbProdutoBeforePost
    OnCalcFields = tbProdutoCalcFields
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'CODIGOPRODUTO'
        DataType = ftInteger
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'CODIGOCOMPLETO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'CODIGOLINHA'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'CODIGOGRUPO'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'CODIGOSUBGRUPO'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'CODIGOBARRA'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'DESCRICAODETALHADA'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'FOTO'
        DataType = ftBlob
      end
      item
        Name = 'REFERENCIAFORNEC'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'CODIGOMOEDA'
        DataType = ftInteger
      end
      item
        Name = 'PRECOCUSTO'
        DataType = ftFloat
      end
      item
        Name = 'PESOPEDRA'
        DataType = ftFloat
      end
      item
        Name = 'PESOPECA'
        DataType = ftFloat
      end
      item
        Name = 'PRECOVENDA'
        DataType = ftFloat
      end
      item
        Name = 'ESTOQUEFISICO'
        DataType = ftInteger
      end
      item
        Name = 'ESTOQUEMINIMO'
        DataType = ftInteger
      end
      item
        Name = 'ESTOQUECRITICO'
        DataType = ftInteger
      end
      item
        Name = 'UNIDADE'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'COMISSAO'
        DataType = ftFloat
      end
      item
        Name = 'OBSERVACAO'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'TEMCONJUNTO'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'DATACADASTRO'
        DataType = ftDateTime
      end
      item
        Name = 'FORMULA'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'MARGEM'
        DataType = ftFloat
      end
      item
        Name = 'GRAMA'
        DataType = ftFloat
      end
      item
        Name = 'MAOOBRA'
        DataType = ftFloat
      end
      item
        Name = 'INDICE'
        DataType = ftFloat
      end
      item
        Name = 'JUROS'
        DataType = ftFloat
      end
      item
        Name = 'DOLAR'
        DataType = ftFloat
      end
      item
        Name = 'SEGURO'
        DataType = ftFloat
      end
      item
        Name = 'CODFORNEC'
        DataType = ftFloat
      end
      item
        Name = 'CODIGOMETAL'
        DataType = ftInteger
      end
      item
        Name = 'EMITETIQ'
        DataType = ftString
        Size = 10
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY5'
        Fields = 'CODIGOPRODUTO'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'RDB$FOREIGN6'
        Fields = 'CODIGOLINHA'
      end
      item
        Name = 'RDB$FOREIGN7'
        Fields = 'CODIGOGRUPO'
      end
      item
        Name = 'RDB$FOREIGN8'
        Fields = 'CODIGOMOEDA'
      end
      item
        Name = 'RDB$FOREIGN9'
        Fields = 'CODIGOSUBGRUPO'
      end
      item
        Name = 'XPKPRODUTO'
        Fields = 'CODIGOPRODUTO'
        Options = [ixUnique]
      end
      item
        Name = 'XAK1PRODUTO'
        Fields = 'CODIGOCOMPLETO'
        Options = [ixUnique]
      end
      item
        Name = 'XIF3PRODUTO'
        Fields = 'CODIGOSUBGRUPO'
      end
      item
        Name = 'XIF5PRODUTO'
        Fields = 'CODIGOMOEDA'
      end
      item
        Name = 'XIF6PRODUTO'
        Fields = 'CODIGOGRUPO'
      end
      item
        Name = 'XIF80PRODUTO'
        Fields = 'CODIGOLINHA'
      end
      item
        Name = 'RDB$FOREIGN12'
        Fields = 'CODIGOMETAL'
      end>
    StoreDefs = True
    TableName = 'PRODUTO'
    Left = 128
    Top = 403
    object tbProdutoCODIGOPRODUTO: TIntegerField
      FieldName = 'CODIGOPRODUTO'
    end
    object tbProdutoCODIGOLINHA: TIBStringField
      FieldName = 'CODIGOLINHA'
      Size = 2
    end
    object tbProdutoCODIGOGRUPO: TIBStringField
      FieldName = 'CODIGOGRUPO'
      Size = 2
    end
    object tbProdutoCODIGOSUBGRUPO: TIBStringField
      FieldName = 'CODIGOSUBGRUPO'
      Size = 2
    end
    object tbProdutoCODIGOBARRA: TIBStringField
      FieldName = 'CODIGOBARRA'
      Size = 25
    end
    object tbProdutoDESCRICAODETALHADA: TIBStringField
      FieldName = 'DESCRICAODETALHADA'
      Size = 250
    end
    object tbProdutoFOTO: TBlobField
      FieldName = 'FOTO'
      BlobType = ftBlob
      Size = 8
    end
    object tbProdutoREFERENCIAFORNEC: TIBStringField
      FieldName = 'REFERENCIAFORNEC'
      Size = 25
    end
    object tbProdutoCODIGOMOEDA: TIntegerField
      FieldName = 'CODIGOMOEDA'
    end
    object tbProdutoPRECOCUSTO: TFloatField
      FieldName = 'PRECOCUSTO'
      EditFormat = ',#0.00'
      currency = True
    end
    object tbProdutoPRECOVENDA: TFloatField
      FieldName = 'PRECOVENDA'
      EditFormat = ',#0.00'
      currency = True
    end
    object tbProdutoESTOQUEFISICO: TIntegerField
      FieldName = 'ESTOQUEFISICO'
    end
    object tbProdutoESTOQUEMINIMO: TIntegerField
      FieldName = 'ESTOQUEMINIMO'
    end
    object tbProdutoESTOQUECRITICO: TIntegerField
      FieldName = 'ESTOQUECRITICO'
    end
    object tbProdutoUNIDADE: TIBStringField
      FieldName = 'UNIDADE'
      Size = 2
    end
    object tbProdutoCOMISSAO: TFloatField
      FieldName = 'COMISSAO'
      DisplayFormat = ',#.00'
    end
    object tbProdutoOBSERVACAO: TIBStringField
      FieldName = 'OBSERVACAO'
      Size = 50
    end
    object tbProdutoDESCRICAOLINHA: TIBStringField
      FieldKind = fkLookup
      FieldName = 'DESCRICAOLINHA'
      LookupDataSet = tbLinha
      LookupKeyFields = 'CODIGOLINHA'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CODIGOLINHA'
      Size = 50
      Lookup = True
    end
    object tbProdutoDESCRICAOGRUPO: TIBStringField
      FieldKind = fkLookup
      FieldName = 'DESCRICAOGRUPO'
      LookupDataSet = tbGrupo
      LookupKeyFields = 'CODIGOGRUPO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CODIGOGRUPO'
      Size = 50
      Lookup = True
    end
    object tbProdutoDESCRICAOSUBGRUPO: TIBStringField
      FieldKind = fkLookup
      FieldName = 'DESCRICAOSUBGRUPO'
      LookupDataSet = tbSubGrupo
      LookupKeyFields = 'CODIGOSUBGRUPO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CODIGOSUBGRUPO'
      Size = 50
      Lookup = True
    end
    object tbProdutoDESCRICAOMOEDA: TIBStringField
      FieldKind = fkLookup
      FieldName = 'DESCRICAOMOEDA'
      LookupDataSet = tbMoeda
      LookupKeyFields = 'CODIGOMOEDA'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CODIGOMOEDA'
      Size = 50
      Lookup = True
    end
    object tbProdutoCODIGOCOMPLETO: TIBStringField
      FieldName = 'CODIGOCOMPLETO'
    end
    object tbProdutoTEMCONJUNTO: TIBStringField
      FieldName = 'TEMCONJUNTO'
      Size = 1
    end
    object tbProdutoDATACADASTRO: TDateTimeField
      FieldName = 'DATACADASTRO'
    end
    object tbProdutoPESOPEDRA: TFloatField
      FieldName = 'PESOPEDRA'
      DisplayFormat = ',#.00'
    end
    object tbProdutoPESOPECA: TFloatField
      FieldName = 'PESOPECA'
      DisplayFormat = ',#.00'
    end
    object tbProdutoFORMULA: TIBStringField
      FieldName = 'FORMULA'
      Size = 25
    end
    object tbProdutoPrecoVendaCalc: TFloatField
      FieldKind = fkCalculated
      FieldName = 'PrecoVendaCalc'
      DisplayFormat = ',#0.00'
      Calculated = True
    end
    object tbProdutoMARGEM: TFloatField
      FieldName = 'MARGEM'
    end
    object tbProdutoGRAMA: TFloatField
      FieldName = 'GRAMA'
      EditFormat = ',#0.00'
    end
    object tbProdutoMAOOBRA: TFloatField
      FieldName = 'MAOOBRA'
      EditFormat = ',#0.00'
    end
    object tbProdutoINDICE: TFloatField
      DisplayWidth = 10
      FieldName = 'INDICE'
    end
    object tbProdutoJUROS: TFloatField
      FieldName = 'JUROS'
    end
    object tbProdutoDOLAR: TFloatField
      FieldName = 'DOLAR'
    end
    object tbProdutoSEGURO: TFloatField
      FieldName = 'SEGURO'
    end
    object tbProdutoDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Size = 100
    end
    object tbProdutoCODFORNEC: TFloatField
      FieldName = 'CODFORNEC'
    end
    object tbProdutoCODIGOMETAL: TIntegerField
      FieldName = 'CODIGOMETAL'
    end
    object tbProdutoMETAL: TStringField
      FieldKind = fkLookup
      FieldName = 'METAL'
      LookupDataSet = tbMetal
      LookupKeyFields = 'CODIGOMETAL'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CODIGOMETAL'
      Size = 50
      Lookup = True
    end
    object tbProdutoPrecoCustCalc: TFloatField
      FieldKind = fkCalculated
      FieldName = 'PrecoCustCalc'
      DisplayFormat = ',#0.00'
      EditFormat = ',#0.00'
      Calculated = True
    end
    object tbProdutoEMITETIQ: TIBStringField
      FieldName = 'EMITETIQ'
      Size = 10
    end
  end
  object tbGrupo: TIBTable
    Tag = 13
    Database = dmConf.dtBase
    Transaction = dmConf.IBTrans
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'CODIGOGRUPO'
        Attributes = [faRequired]
        DataType = ftString
        Size = 2
      end
      item
        Name = 'DESCRICAO'
        Attributes = [faRequired]
        DataType = ftString
        Size = 50
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY2'
        Fields = 'CODIGOGRUPO'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'XPKGRUPO'
        Fields = 'CODIGOGRUPO'
        Options = [ixUnique]
      end
      item
        Name = 'XAK1GRUPO'
        Fields = 'DESCRICAO'
        Options = [ixUnique]
      end>
    StoreDefs = True
    TableName = 'GRUPO'
    Left = 348
    Top = 206
    object tbGrupoCODIGOGRUPO: TIBStringField
      FieldName = 'CODIGOGRUPO'
      EditMask = '>c<c;1; '
      Size = 2
    end
    object tbGrupoDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      EditMask = '>cccccccccccccccccccccccccccccccccccccccc'
      Size = 50
    end
  end
  object tbItenPedidoVenda: TIBTable
    Tag = 14
    Database = dmConf.dtBase
    Transaction = dmConf.IBTrans
    OnCalcFields = tbItenPedidoVendaCalcFields
    CachedUpdates = False
    IndexFieldNames = 'NUMEROPEDIDO'
    MasterFields = 'NUMEROPEDIDO'
    MasterSource = dsPedidoVenda
    TableName = 'ITENSPEDIDOVENDA'
    Left = 346
    Top = 274
    object tbItenPedidoVendaNUMEROPEDIDO: TIntegerField
      FieldName = 'NUMEROPEDIDO'
    end
    object tbItenPedidoVendaCODIGOPRODUTO: TIntegerField
      FieldName = 'CODIGOPRODUTO'
    end
    object tbItenPedidoVendaQUANTIDADE: TIntegerField
      FieldName = 'QUANTIDADE'
    end
    object tbItenPedidoVendaDESCRICAOPRODUTO: TStringField
      FieldKind = fkLookup
      FieldName = 'DESCRICAOPRODUTO'
      LookupDataSet = tbProduto
      LookupKeyFields = 'CODIGOPRODUTO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CODIGOPRODUTO'
      Size = 50
      Lookup = True
    end
    object tbItenPedidoVendaVALORUNITARIO: TFloatField
      FieldName = 'VALORUNITARIO'
      currency = True
    end
    object tbItenPedidoVendaSUBTOTAL: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SUBTOTAL'
      currency = True
      Calculated = True
    end
  end
  object tbFormaRec: TIBTable
    Tag = 15
    Database = dmConf.dtBase
    Transaction = dmConf.IBTrans
    AfterInsert = GravaCodigo
    BeforeInsert = GeraCodigo
    CachedUpdates = False
    TableName = 'FORMARECEBIMENTO'
    Left = 348
    Top = 337
    object tbFormaRecCODIGOFORMARECEBIMENTO: TIntegerField
      FieldName = 'CODIGOFORMARECEBIMENTO'
    end
    object tbFormaRecDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object tbFormaRecPERCENTUAL: TFloatField
      FieldName = 'PERCENTUAL'
      DisplayFormat = ',#.00'
    end
    object tbFormaRecCARTAO: TIBStringField
      FieldName = 'CARTAO'
      Size = 1
    end
    object tbFormaRecVISTAPARCELADO: TIBStringField
      FieldName = 'VISTAPARCELADO'
      Size = 1
    end
    object tbFormaRecCODIGOADMCARTAO: TIntegerField
      FieldName = 'CODIGOADMCARTAO'
    end
    object tbFormaRecPARCELAS: TIntegerField
      FieldName = 'PARCELAS'
    end
    object tbFormaRecINTERVALO: TIntegerField
      FieldName = 'INTERVALO'
    end
    object tbFormaRecPRIMEIROVENCTO: TIntegerField
      FieldName = 'PRIMEIROVENCTO'
    end
  end
  object tbPedidoVenda: TIBTable
    Tag = 10
    Database = dmConf.dtBase
    Transaction = dmConf.IBTrans
    AfterInsert = GravaCodigo
    BeforeInsert = GeraCodigo
    OnCalcFields = tbPedidoVendaCalcFields
    CachedUpdates = False
    TableName = 'PEDIDOVENDA'
    Left = 346
    Top = 11
    object tbPedidoVendaNUMEROPEDIDO: TIntegerField
      FieldName = 'NUMEROPEDIDO'
    end
    object tbPedidoVendaCODIGOCLIENTE: TIntegerField
      FieldName = 'CODIGOCLIENTE'
    end
    object tbPedidoVendaCODIGOVENDEDOR: TIntegerField
      FieldName = 'CODIGOVENDEDOR'
    end
    object tbPedidoVendaCODIGOFORMARECEBIMENTO: TIntegerField
      FieldName = 'CODIGOFORMARECEBIMENTO'
    end
    object tbPedidoVendaDATAPEDIDO: TDateTimeField
      FieldName = 'DATAPEDIDO'
    end
    object tbPedidoVendaDATAVENCTO: TDateTimeField
      FieldName = 'DATAVENCTO'
    end
    object tbPedidoVendaNOMECLIENTE: TStringField
      FieldKind = fkLookup
      FieldName = 'NOMECLIENTE'
      LookupDataSet = tbCliente
      LookupKeyFields = 'CODIGOCLIENTE'
      LookupResultField = 'NOME'
      KeyFields = 'CODIGOCLIENTE'
      Size = 50
      Lookup = True
    end
    object tbPedidoVendaNOMEVENDEDOR: TStringField
      FieldKind = fkLookup
      FieldName = 'NOMEVENDEDOR'
      LookupDataSet = tbVendedor
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'NOME'
      KeyFields = 'CODIGOVENDEDOR'
      Size = 50
      Lookup = True
    end
    object tbPedidoVendaFORMArecebimento: TStringField
      FieldKind = fkLookup
      FieldName = 'FORMARECEBIMENTO'
      LookupDataSet = tbFormaRec
      LookupKeyFields = 'CODIGOFORMARECEBIMENTO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CODIGOFORMARECEBIMENTO'
      Size = 50
      Lookup = True
    end
    object tbPedidoVendaSITUACAO: TIBStringField
      FieldName = 'SITUACAO'
      Size = 1
    end
    object tbPedidoVendaVALORTOTAL: TFloatField
      FieldKind = fkCalculated
      FieldName = 'VALORTOTAL'
      currency = True
      Calculated = True
    end
    object tbPedidoVendaSTATUS: TStringField
      FieldKind = fkCalculated
      FieldName = 'STATUS'
      Size = 15
      Calculated = True
    end
  end
  object tbPedidoCompra: TIBTable
    Tag = 11
    Database = dmConf.dtBase
    Transaction = dmConf.IBTrans
    AfterInsert = GravaCodigo
    BeforeInsert = GeraCodigo
    OnCalcFields = tbPedidoCompraCalcFields
    CachedUpdates = False
    TableName = 'PEDIDOCOMPRA'
    Left = 346
    Top = 75
    object tbPedidoCompraNUMEROPEDIDO: TIntegerField
      FieldName = 'NUMEROPEDIDO'
    end
    object tbPedidoCompraCODIGOFORMAPAGAMENTO: TIntegerField
      FieldName = 'CODIGOFORMAPAGAMENTO'
    end
    object tbPedidoCompraCODIGOFORNECEDOR: TIntegerField
      FieldName = 'CODIGOFORNECEDOR'
    end
    object tbPedidoCompraNUMEROCONTROLE: TIBStringField
      FieldName = 'NUMEROCONTROLE'
      Size = 25
    end
    object tbPedidoCompraDATAPEDIDO: TDateTimeField
      FieldName = 'DATAPEDIDO'
    end
    object tbPedidoCompraDATAENTREGA: TDateTimeField
      FieldName = 'DATAENTREGA'
    end
    object tbPedidoCompraFORMAPAGAMENTO: TStringField
      FieldKind = fkLookup
      FieldName = 'FORMAPAGAMENTO'
      LookupDataSet = tbFormaPag
      LookupKeyFields = 'CODIGOFORMAPAGAMENTO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CODIGOFORMAPAGAMENTO'
      Size = 50
      Lookup = True
    end
    object tbPedidoCompraFORNECEDOR: TStringField
      FieldKind = fkLookup
      FieldName = 'FORNECEDOR'
      LookupDataSet = tbFornec
      LookupKeyFields = 'CODIGOFORNECEDOR'
      LookupResultField = 'NOME'
      KeyFields = 'CODIGOFORNECEDOR'
      Size = 50
      Lookup = True
    end
    object tbPedidoCompraSITUACAO: TIBStringField
      FieldName = 'SITUACAO'
      Size = 1
    end
    object tbPedidoCompraVALORTOTAL: TFloatField
      FieldKind = fkCalculated
      FieldName = 'VALORTOTAL'
      currency = True
      Calculated = True
    end
    object tbPedidoCompraSTATUS: TStringField
      FieldKind = fkCalculated
      FieldName = 'STATUS'
      Size = 15
      Calculated = True
    end
  end
  object tbCliente: TIBTable
    Tag = 12
    Database = dmConf.dtBase
    Transaction = dmConf.IBTrans
    AfterInsert = GravaCodigo
    BeforeInsert = GeraCodigo
    CachedUpdates = False
    TableName = 'CLIENTE'
    Left = 348
    Top = 140
    object tbClienteCODIGOCLIENTE: TIntegerField
      FieldName = 'CODIGOCLIENTE'
    end
    object tbClienteNOME: TIBStringField
      FieldName = 'NOME'
      Size = 50
    end
    object tbClienteRG: TIBStringField
      FieldName = 'RG'
      Size = 25
    end
    object tbClienteSEXO: TIBStringField
      FieldName = 'SEXO'
      Size = 1
    end
    object tbClienteENDERECO: TIBStringField
      FieldName = 'ENDERECO'
      Size = 50
    end
    object tbClienteBAIRRO: TIBStringField
      FieldName = 'BAIRRO'
      Size = 25
    end
    object tbClienteCEP: TIBStringField
      FieldName = 'CEP'
      EditMask = '00\-000\-000;1;_'
      Size = 25
    end
    object tbClienteCIDADE: TIBStringField
      FieldName = 'CIDADE'
      Size = 25
    end
    object tbClienteUF: TIBStringField
      FieldName = 'UF'
      Size = 2
    end
    object tbClienteFONE: TIBStringField
      FieldName = 'FONE'
      EditMask = '!\(99\)#000-0000;1;_'
      Size = 25
    end
    object tbClienteCONTATO: TIBStringField
      FieldName = 'CONTATO'
      Size = 25
    end
    object tbClienteFAX: TIBStringField
      FieldName = 'FAX'
      EditMask = '!\(99\)#000-0000;1;_'
      Size = 25
    end
    object tbClienteCELULAR: TIBStringField
      FieldName = 'CELULAR'
      EditMask = '!\(99\)#000-0000;1;_'
      Size = 25
    end
    object tbClienteOCUPACAO: TIBStringField
      FieldName = 'OCUPACAO'
      Size = 25
    end
    object tbClienteTIPO: TIBStringField
      FieldName = 'TIPO'
      Size = 1
    end
    object tbClienteDATANASCIMENTO: TDateTimeField
      FieldName = 'DATANASCIMENTO'
      EditMask = '!99/99/0000;1;_'
    end
    object tbClienteANONASCIMENTO: TIBStringField
      FieldName = 'ANONASCIMENTO'
      Size = 4
    end
    object tbClienteDATACADASTRO: TDateTimeField
      FieldName = 'DATACADASTRO'
      EditMask = '!99/99/0000;1;_'
    end
    object tbClienteDIAMES: TIBStringField
      FieldName = 'DIAMES'
      EditMask = '!99/99;1;_'
      Size = 5
    end
    object tbClienteEMAIL: TIBStringField
      FieldName = 'EMAIL'
      Size = 100
    end
    object tbClienteCPF: TIBStringField
      FieldName = 'CPF'
      Size = 100
    end
  end
  object tbFornecProd: TIBTable
    Tag = 16
    Database = dmConf.dtBase
    Transaction = dmConf.IBTrans
    CachedUpdates = False
    IndexFieldNames = 'CODIGOPRODUTO'
    MasterFields = 'CODIGOPRODUTO'
    MasterSource = dsProduto
    TableName = 'FORNECPRODUTO'
    Left = 348
    Top = 403
    object tbFornecProdCODIGOPRODUTO: TIntegerField
      FieldName = 'CODIGOPRODUTO'
    end
    object tbFornecProdNOMEFORNEC: TStringField
      FieldKind = fkLookup
      FieldName = 'NOMEFORNEC'
      LookupDataSet = tbFornec
      LookupKeyFields = 'CODIGOFORNECEDOR'
      LookupResultField = 'NOME'
      KeyFields = 'CODIGOFORNECEDOR'
      Size = 50
      Lookup = True
    end
    object tbFornecProdCODIGOFORNECEDOR: TIntegerField
      FieldName = 'CODIGOFORNECEDOR'
    end
  end
  object dsLinha: TDataSource
    DataSet = tbLinha
    Left = 20
    Top = 455
  end
  object tbLinha: TIBTable
    Tag = 9
    Database = dmConf.dtBase
    Transaction = dmConf.IBTrans
    AfterInsert = GravaCodigo
    BeforeInsert = GeraCodigo
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'CODIGOLINHA'
        Attributes = [faRequired]
        DataType = ftString
        Size = 2
      end
      item
        Name = 'DESCRICAO'
        Attributes = [faRequired]
        DataType = ftString
        Size = 50
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY1'
        Fields = 'CODIGOLINHA'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'XPKLINHA'
        Fields = 'CODIGOLINHA'
        Options = [ixUnique]
      end
      item
        Name = 'XAK1LINHA'
        Fields = 'DESCRICAO'
        Options = [ixUnique]
      end>
    StoreDefs = True
    TableName = 'LINHA'
    Left = 124
    Top = 457
    object tbLinhaCODIGOLINHA: TIBStringField
      FieldName = 'CODIGOLINHA'
      Size = 2
    end
    object tbLinhaDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      EditMask = '>cccccccccccccccccccccccccccccccccccccccc'
      Size = 50
    end
  end
  object dsConjunto: TDataSource
    DataSet = tbConjunto
    Left = 248
    Top = 459
  end
  object tbConjunto: TIBTable
    Database = dmConf.dtBase
    Transaction = dmConf.IBTrans
    CachedUpdates = False
    TableName = 'CONJUNTO'
    Left = 346
    Top = 461
    object tbConjuntoCODIGOCONJUNTO: TIntegerField
      FieldName = 'CODIGOCONJUNTO'
    end
    object tbConjuntoCODIGOPRODUTO: TIntegerField
      FieldName = 'CODIGOPRODUTO'
    end
  end
  object dsAniversario: TDataSource
    DataSet = tbAniversario
    Left = 430
    Top = 10
  end
  object tbAniversario: TIBTable
    Database = dmConf.dtBase
    Transaction = dmConf.IBTrans
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'CODIGOCLIENTE'
        DataType = ftInteger
      end
      item
        Name = 'NOME'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'DATA'
        DataType = ftDateTime
      end
      item
        Name = 'ANONASCIMENTO'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'DIAMES'
        DataType = ftString
        Size = 5
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY81'
        Fields = 'CODIGOCLIENTE;NOME;DATA'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'RDB$FOREIGN82'
        Fields = 'CODIGOCLIENTE'
      end
      item
        Name = 'XPKANIVERSARIOS'
        Fields = 'CODIGOCLIENTE;NOME;DATA'
        Options = [ixUnique]
      end
      item
        Name = 'XIF106ANIVERSARIOS'
        Fields = 'CODIGOCLIENTE'
      end>
    IndexFieldNames = 'CODIGOCLIENTE'
    MasterFields = 'CODIGOCLIENTE'
    MasterSource = dsCliente
    StoreDefs = True
    TableName = 'ANIVERSARIOS'
    Left = 530
    Top = 14
    object tbAniversarioCODIGOCLIENTE: TIntegerField
      FieldName = 'CODIGOCLIENTE'
    end
    object tbAniversarioNOME: TIBStringField
      FieldName = 'NOME'
      EditMask = '>cccccccccccccccccccccccccccccccccccccccc'
      Size = 50
    end
    object tbAniversarioDATA: TDateTimeField
      FieldName = 'DATA'
    end
    object tbAniversarioANONASCIMENTO: TIBStringField
      FieldName = 'ANONASCIMENTO'
      Size = 4
    end
    object tbAniversarioDIAMES: TIBStringField
      FieldName = 'DIAMES'
      EditMask = '!99/99;1;_'
      Size = 5
    end
  end
  object dsRepresentante: TDataSource
    DataSet = tbRepresentante
    Left = 434
    Top = 74
  end
  object tbRepresentante: TIBTable
    Tag = 17
    Database = dmConf.dtBase
    Transaction = dmConf.IBTrans
    AfterInsert = GravaCodigo
    BeforeInsert = GeraCodigo
    CachedUpdates = False
    IndexFieldNames = 'CODIGOFORNECEDOR'
    MasterFields = 'CODIGOFORNECEDOR'
    MasterSource = dsFornec
    TableName = 'REPRESENTANTE'
    Left = 530
    Top = 73
    object tbRepresentanteCODIGOREPRESENTANTE: TIntegerField
      FieldName = 'CODIGOREPRESENTANTE'
    end
    object tbRepresentanteCODIGOFORNECEDOR: TIntegerField
      FieldName = 'CODIGOFORNECEDOR'
    end
    object tbRepresentanteNOME: TIBStringField
      FieldName = 'NOME'
      EditMask = '>cccccccccccccccccccccccccccccccccccccccc'
      Size = 50
    end
    object tbRepresentanteENDERECO: TIBStringField
      FieldName = 'ENDERECO'
      EditMask = '>cccccccccccccccccccccccccccccccccccccccc'
      Size = 50
    end
    object tbRepresentanteFONE: TIBStringField
      FieldName = 'FONE'
      EditMask = '!\(99\)#000-0000;1;_'
      Size = 13
    end
    object tbRepresentanteEMAIL: TIBStringField
      FieldName = 'EMAIL'
      Size = 50
    end
    object tbRepresentanteCELULAR: TIBStringField
      FieldName = 'CELULAR'
      EditMask = '!\(99\)#000-0000;1;_'
      Size = 13
    end
    object tbRepresentanteFAX: TIBStringField
      FieldName = 'FAX'
      EditMask = '!\(99\)#000-0000;1;_'
      Size = 13
    end
  end
  object dsComposicaoPeso: TDataSource
    DataSet = tbComposicaoPeso
    Left = 436
    Top = 132
  end
  object tbComposicaoPeso: TIBTable
    Tag = 19
    Database = dmConf.dtBase
    Transaction = dmConf.IBTrans
    AfterInsert = GravaCodigo
    BeforeInsert = GeraCodigo
    CachedUpdates = False
    IndexFieldNames = 'CODIGOPRODUTO'
    MasterFields = 'CODIGOPRODUTO'
    MasterSource = dsProduto
    TableName = 'COMPOSICAOPESOS'
    Left = 532
    Top = 133
    object tbComposicaoPesoCODIGOPRODUTO: TIntegerField
      FieldName = 'CODIGOPRODUTO'
    end
    object tbComposicaoPesoNUMEROPEDRA: TIBStringField
      FieldName = 'NUMEROPEDRA'
      Size = 1
    end
    object tbComposicaoPesoKILATE: TFloatField
      FieldName = 'KILATE'
    end
    object tbComposicaoPesoCOR: TIBStringField
      FieldName = 'COR'
      EditMask = '>cccccccccccccccccccccccccccccccccccccccc'
      Size = 25
    end
    object tbComposicaoPesoLAPIDACAO: TIBStringField
      FieldName = 'LAPIDACAO'
      EditMask = '>cccccccccccccccccccccccccccccccccccccccc'
      Size = 25
    end
    object tbComposicaoPesoDescPedra: TStringField
      FieldKind = fkLookup
      FieldName = 'DescPedra'
      LookupDataSet = tbPedra
      LookupKeyFields = 'CODIGOPEDRA'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CODIGOPEDRA'
      Size = 25
      Lookup = True
    end
    object tbComposicaoPesoREFERENCIAFORNEC: TIBStringField
      FieldName = 'REFERENCIAFORNEC'
      Size = 25
    end
    object tbComposicaoPesoCODIGOPEDRA: TIBStringField
      FieldName = 'CODIGOPEDRA'
      Size = 3
    end
  end
  object dsPedra: TDataSource
    DataSet = tbPedra
    Left = 434
    Top = 190
  end
  object tbPedra: TIBTable
    Tag = 18
    Database = dmConf.dtBase
    Transaction = dmConf.IBTrans
    CachedUpdates = False
    TableName = 'PEDRA'
    Left = 530
    Top = 192
    object tbPedraDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      EditMask = '>cccccccccccccccccccccccccccccccccccccccc'
      Size = 25
    end
    object tbPedraCODIGOPEDRA: TIBStringField
      FieldName = 'CODIGOPEDRA'
      EditMask = '>c<cc;1; '
      Size = 3
    end
  end
  object dsMetal: TDataSource
    DataSet = tbMetal
    Left = 438
    Top = 254
  end
  object tbMetal: TIBTable
    Database = dmConf.dtBase
    Transaction = dmConf.IBTrans
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'CODIGOMETAL'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 50
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY7'
        Fields = 'CODIGOMETAL'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'XPKMETAL'
        Fields = 'CODIGOMETAL'
        Options = [ixUnique]
      end>
    StoreDefs = True
    TableName = 'METAL'
    Left = 526
    Top = 252
    object tbMetalCODIGOMETAL: TIntegerField
      FieldName = 'CODIGOMETAL'
    end
    object tbMetalDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Size = 50
    end
  end
end
