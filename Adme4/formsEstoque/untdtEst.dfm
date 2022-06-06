object dtEst: TdtEst
  OldCreateOrder = False
  Left = 192
  Top = 107
  Height = 643
  Width = 829
  object dsFormaPag: TDataSource
    DataSet = qryFormaPag
    Left = 58
    Top = 8
  end
  object dsFornec: TDataSource
    DataSet = qryFornec
    Left = 58
    Top = 58
  end
  object dsMoeda: TDataSource
    DataSet = qryMoeda
    Left = 58
    Top = 108
  end
  object dsVendedor: TDataSource
    DataSet = qryVendedor
    Left = 58
    Top = 157
  end
  object dsSubGrupo: TDataSource
    DataSet = qrySubGrupo
    Left = 58
    Top = 207
  end
  object dsAdmCartao: TDataSource
    DataSet = qryAdmCartao
    Left = 58
    Top = 257
  end
  object dsItenPedidoCompra: TDataSource
    DataSet = qryItenPedidoCompra
    Left = 58
    Top = 307
  end
  object dsProduto: TDataSource
    DataSet = qryProduto
    Left = 58
    Top = 356
  end
  object dsGrupo: TDataSource
    DataSet = qryGrupo
    Left = 58
    Top = 406
  end
  object dsItenPedidoVenda: TDataSource
    DataSet = qryItenPedidoVenda
    Left = 58
    Top = 456
  end
  object dsPedidoVenda: TDataSource
    DataSet = qryPedidoVenda
    Left = 281
    Top = 6
  end
  object dsPedidoCompra: TDataSource
    DataSet = qryPedidoCompra
    Left = 279
    Top = 55
  end
  object dsCliente: TDataSource
    DataSet = qryCliente
    Left = 281
    Top = 105
  end
  object dsFormaRec: TDataSource
    DataSet = qryFormaRec
    Left = 281
    Top = 154
  end
  object qryFormaPag: TQuery
    Active = True
    DatabaseName = 'ADME4'
    RequestLive = True
    SQL.Strings = (
      'select *'
      'from formapagamento')
    Left = 162
    Top = 6
    object qryFormaPagCODIGOFORNECEDOR: TIntegerField
      FieldName = 'CODIGOFORNECEDOR'
      Origin = 'ADME.FORMAPAGAMENTO.CODIGOFORNECEDOR'
    end
    object qryFormaPagCODIGOFORMAPAGAMENTO: TIntegerField
      FieldName = 'CODIGOFORMAPAGAMENTO'
      Origin = 'ADME.FORMAPAGAMENTO.CODIGOFORMAPAGAMENTO'
    end
    object qryFormaPagDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'ADME.FORMAPAGAMENTO.DESCRICAO'
      Size = 50
    end
    object qryFormaPagPERCENTUAL: TFloatField
      FieldName = 'PERCENTUAL'
      Origin = 'ADME.FORMAPAGAMENTO.PERCENTUAL'
    end
    object qryFormaPagVISTAPARCELADOCARTAO: TStringField
      FieldName = 'VISTAPARCELADOCARTAO'
      Origin = 'ADME.FORMAPAGAMENTO.VISTAPARCELADOCARTAO'
      Size = 1
    end
    object qryFormaPagCODIGOADMCARTAO: TIntegerField
      FieldName = 'CODIGOADMCARTAO'
      Origin = 'ADME.FORMAPAGAMENTO.CODIGOADMCARTAO'
    end
    object qryFormaPagPARCELAS: TIntegerField
      FieldName = 'PARCELAS'
      Origin = 'ADME.FORMAPAGAMENTO.PARCELAS'
    end
    object qryFormaPagINTERVALO: TIntegerField
      FieldName = 'INTERVALO'
      Origin = 'ADME.FORMAPAGAMENTO.INTERVALO'
    end
    object qryFormaPagPRIMEIROVENCTO: TIntegerField
      FieldName = 'PRIMEIROVENCTO'
      Origin = 'ADME.FORMAPAGAMENTO.PRIMEIROVENCTO'
    end
    object qryFormaPagFORNECEDOR: TStringField
      FieldKind = fkLookup
      FieldName = 'FORNECEDOR'
      LookupDataSet = qryFornec
      LookupKeyFields = 'CODIGOFORNECEDOR'
      LookupResultField = 'NOME'
      KeyFields = 'CODIGOFORNECEDOR'
      Size = 50
      Lookup = True
    end
    object qryFormaPagCARTAO: TStringField
      FieldKind = fkLookup
      FieldName = 'CARTAO'
      LookupDataSet = qryAdmCartao
      LookupKeyFields = 'CODIGOADMCARTAO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CODIGOADMCARTAO'
      Size = 50
      Lookup = True
    end
  end
  object qryFornec: TQuery
    Active = True
    DatabaseName = 'ADME4'
    RequestLive = True
    SQL.Strings = (
      'select *'
      'from fornecedor')
    Left = 162
    Top = 56
    object qryFornecCODIGOFORNECEDOR: TIntegerField
      FieldName = 'CODIGOFORNECEDOR'
      Origin = 'ADME4.FORNECEDOR.CODIGOFORNECEDOR'
    end
    object qryFornecNOME: TStringField
      FieldName = 'NOME'
      Origin = 'ADME4.FORNECEDOR.NOME'
      Size = 50
    end
    object qryFornecTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'ADME4.FORNECEDOR.TIPO'
      Size = 1
    end
    object qryFornecOCUPACAO: TStringField
      FieldName = 'OCUPACAO'
      Origin = 'ADME4.FORNECEDOR.OCUPACAO'
      Size = 35
    end
    object qryFornecCNPJ: TStringField
      FieldName = 'CNPJ'
      Origin = 'ADME4.FORNECEDOR.CNPJ'
      Size = 25
    end
    object qryFornecIE: TStringField
      FieldName = 'IE'
      Origin = 'ADME4.FORNECEDOR.IE'
      Size = 25
    end
    object qryFornecDATACADASTRO: TDateTimeField
      FieldName = 'DATACADASTRO'
      Origin = 'ADME4.FORNECEDOR.DATACADASTRO'
    end
    object qryFornecENDERECO: TStringField
      FieldName = 'ENDERECO'
      Origin = 'ADME4.FORNECEDOR.ENDERECO'
      Size = 50
    end
    object qryFornecBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Origin = 'ADME4.FORNECEDOR.BAIRRO'
      Size = 25
    end
    object qryFornecCEP: TStringField
      FieldName = 'CEP'
      Origin = 'ADME4.FORNECEDOR.CEP'
      Size = 10
    end
    object qryFornecCIDADE: TStringField
      FieldName = 'CIDADE'
      Origin = 'ADME4.FORNECEDOR.CIDADE'
      Size = 25
    end
    object qryFornecUF: TStringField
      FieldName = 'UF'
      Origin = 'ADME4.FORNECEDOR.UF'
      Size = 2
    end
    object qryFornecFONE: TStringField
      FieldName = 'FONE'
      Origin = 'ADME4.FORNECEDOR.FONE'
      Size = 25
    end
    object qryFornecCONTATO: TStringField
      FieldName = 'CONTATO'
      Origin = 'ADME4.FORNECEDOR.CONTATO'
      Size = 25
    end
    object qryFornecFAX: TStringField
      FieldName = 'FAX'
      Origin = 'ADME4.FORNECEDOR.FAX'
      Size = 25
    end
    object qryFornecCELULAR: TStringField
      FieldName = 'CELULAR'
      Origin = 'ADME4.FORNECEDOR.CELULAR'
      Size = 25
    end
    object qryFornecEMAIL: TStringField
      FieldName = 'EMAIL'
      Origin = 'ADME4.FORNECEDOR.EMAIL'
      Size = 25
    end
  end
  object qryMoeda: TQuery
    Active = True
    DatabaseName = 'ADME4'
    RequestLive = True
    SQL.Strings = (
      'select *'
      'from moeda')
    Left = 162
    Top = 106
    object qryMoedaCODIGOMOEDA: TIntegerField
      FieldName = 'CODIGOMOEDA'
      Origin = 'ADME4.MOEDA.CODIGOMOEDA'
    end
    object qryMoedaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'ADME4.MOEDA.DESCRICAO'
      Size = 50
    end
    object qryMoedaVALOR: TFloatField
      FieldName = 'VALOR'
      Origin = 'ADME4.MOEDA.VALOR'
    end
  end
  object qryVendedor: TQuery
    Active = True
    DatabaseName = 'ADME4'
    RequestLive = True
    SQL.Strings = (
      'select *'
      'from vendedor')
    Left = 162
    Top = 157
    object qryVendedorCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'ADME4.VENDEDOR.CODIGO'
    end
    object qryVendedorNOME: TStringField
      FieldName = 'NOME'
      Origin = 'ADME4.VENDEDOR.NOME'
      Size = 50
    end
    object qryVendedorENDERECO: TStringField
      FieldName = 'ENDERECO'
      Origin = 'ADME4.VENDEDOR.ENDERECO'
      Size = 50
    end
    object qryVendedorAPELIDO: TStringField
      FieldName = 'APELIDO'
      Origin = 'ADME4.VENDEDOR.APELIDO'
      Size = 25
    end
    object qryVendedorBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Origin = 'ADME4.VENDEDOR.BAIRRO'
      Size = 25
    end
    object qryVendedorCIDADE: TStringField
      FieldName = 'CIDADE'
      Origin = 'ADME4.VENDEDOR.CIDADE'
      Size = 25
    end
    object qryVendedorCEP: TStringField
      FieldName = 'CEP'
      Origin = 'ADME4.VENDEDOR.CEP'
      Size = 10
    end
    object qryVendedorUF: TStringField
      FieldName = 'UF'
      Origin = 'ADME4.VENDEDOR.UF'
      Size = 2
    end
    object qryVendedorFONE: TStringField
      FieldName = 'FONE'
      Origin = 'ADME4.VENDEDOR.FONE'
      Size = 25
    end
    object qryVendedorCELULAR: TStringField
      FieldName = 'CELULAR'
      Origin = 'ADME4.VENDEDOR.CELULAR'
      Size = 25
    end
    object qryVendedorCPF: TStringField
      FieldName = 'CPF'
      Origin = 'ADME4.VENDEDOR.CPF'
      Size = 11
    end
    object qryVendedorRG: TStringField
      FieldName = 'RG'
      Origin = 'ADME4.VENDEDOR.RG'
      Size = 25
    end
    object qryVendedorEMAIL: TStringField
      FieldName = 'EMAIL'
      Origin = 'ADME4.VENDEDOR.EMAIL'
      Size = 25
    end
    object qryVendedorTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'ADME4.VENDEDOR.TIPO'
      Size = 1
    end
    object qryVendedorCOMISSAO: TFloatField
      FieldName = 'COMISSAO'
      Origin = 'ADME4.VENDEDOR.COMISSAO'
    end
    object qryVendedorDESCONTOMAXIMO: TFloatField
      FieldName = 'DESCONTOMAXIMO'
      Origin = 'ADME4.VENDEDOR.DESCONTOMAXIMO'
    end
  end
  object qrySubGrupo: TQuery
    Active = True
    DatabaseName = 'ADME4'
    RequestLive = True
    SQL.Strings = (
      'select *'
      'from subgrupo')
    Left = 162
    Top = 207
    object qrySubGrupoCODIGOSUBGRUPO: TIntegerField
      FieldName = 'CODIGOSUBGRUPO'
      Origin = 'ADME4.SUBGRUPO.CODIGOSUBGRUPO'
    end
    object qrySubGrupoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'ADME4.SUBGRUPO.DESCRICAO'
      Size = 50
    end
    object qrySubGrupoFORMULA: TStringField
      FieldName = 'FORMULA'
      Origin = 'ADME4.SUBGRUPO.FORMULA'
      Size = 25
    end
  end
  object qryAdmCartao: TQuery
    Active = True
    DatabaseName = 'ADME4'
    RequestLive = True
    SQL.Strings = (
      'select *'
      'from admcartao')
    Left = 162
    Top = 257
    object qryAdmCartaoCODIGOADMCARTAO: TIntegerField
      FieldName = 'CODIGOADMCARTAO'
      Origin = 'ADME4.ADMCARTAO.CODIGOADMCARTAO'
    end
    object qryAdmCartaoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'ADME4.ADMCARTAO.DESCRICAO'
      Size = 50
    end
    object qryAdmCartaoPERCENTUAL: TFloatField
      FieldName = 'PERCENTUAL'
      Origin = 'ADME4.ADMCARTAO.PERCENTUAL'
    end
    object qryAdmCartaoCONTATO: TStringField
      FieldName = 'CONTATO'
      Origin = 'ADME4.ADMCARTAO.CONTATO'
      Size = 25
    end
    object qryAdmCartaoTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Origin = 'ADME4.ADMCARTAO.TELEFONE'
      Size = 25
    end
  end
  object qryItenPedidoCompra: TQuery
    Active = True
    DatabaseName = 'ADME4'
    RequestLive = True
    SQL.Strings = (
      'select *'
      'from itenspedidocompra')
    Left = 162
    Top = 307
    object qryItenPedidoCompraNUMEROPEDIDO: TIntegerField
      FieldName = 'NUMEROPEDIDO'
      Origin = 'ADME4.ITENSPEDIDOCOMPRA.NUMEROPEDIDO'
    end
    object qryItenPedidoCompraCODIGOPRODUTO: TIntegerField
      FieldName = 'CODIGOPRODUTO'
      Origin = 'ADME4.ITENSPEDIDOCOMPRA.CODIGOPRODUTO'
    end
    object qryItenPedidoCompraQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
      Origin = 'ADME4.ITENSPEDIDOCOMPRA.QUANTIDADE'
    end
    object qryItenPedidoCompraVALORUNITARIO: TFloatField
      FieldName = 'VALORUNITARIO'
      Origin = 'ADME4.ITENSPEDIDOCOMPRA.VALORUNITARIO'
    end
  end
  object qryProduto: TQuery
    Active = True
    DatabaseName = 'ADME4'
    RequestLive = True
    SQL.Strings = (
      'select *'
      'from produto')
    Left = 162
    Top = 358
    object qryProdutoCODIGOPRODUTO: TIntegerField
      FieldName = 'CODIGOPRODUTO'
      Origin = 'ADME4.PRODUTO.CODIGOPRODUTO'
    end
    object dd: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'ADME4.PRODUTO.DESCRICAO'
      Size = 50
    end
    object qryProdutoCODIGOFORNECEDOR: TIntegerField
      FieldName = 'CODIGOFORNECEDOR'
      Origin = 'ADME4.PRODUTO.CODIGOFORNECEDOR'
    end
    object qryProdutoCODIGOGRUPO: TIntegerField
      FieldName = 'CODIGOGRUPO'
      Origin = 'ADME4.PRODUTO.CODIGOGRUPO'
    end
    object qryProdutoCODIGOSUBGRUPO: TIntegerField
      FieldName = 'CODIGOSUBGRUPO'
      Origin = 'ADME4.PRODUTO.CODIGOSUBGRUPO'
    end
    object qryProdutoCODIGOBARRA: TStringField
      FieldName = 'CODIGOBARRA'
      Origin = 'ADME4.PRODUTO.CODIGOBARRA'
      Size = 25
    end
    object qryProdutoDESCRICAODETALHADA: TStringField
      FieldName = 'DESCRICAODETALHADA'
      Origin = 'ADME4.PRODUTO.DESCRICAODETALHADA'
      Size = 250
    end
    object qryProdutoFOTO: TBlobField
      FieldName = 'FOTO'
      Origin = 'ADME4.PRODUTO.FOTO'
      BlobType = ftBlob
      Size = 1
    end
    object qryProdutoCODIGOMOEDA: TIntegerField
      FieldName = 'CODIGOMOEDA'
      Origin = 'ADME4.PRODUTO.CODIGOMOEDA'
    end
    object qryProdutoPRECOCUSTO: TFloatField
      FieldName = 'PRECOCUSTO'
      Origin = 'ADME4.PRODUTO.PRECOCUSTO'
    end
    object qryProdutoPRECOVENDA: TFloatField
      FieldName = 'PRECOVENDA'
      Origin = 'ADME4.PRODUTO.PRECOVENDA'
    end
    object qryProdutoESTOQUEFISICO: TIntegerField
      FieldName = 'ESTOQUEFISICO'
      Origin = 'ADME4.PRODUTO.ESTOQUEFISICO'
    end
    object qryProdutoESTOQUEMINIMO: TIntegerField
      FieldName = 'ESTOQUEMINIMO'
      Origin = 'ADME4.PRODUTO.ESTOQUEMINIMO'
    end
    object qryProdutoESTOQUECRITICO: TIntegerField
      FieldName = 'ESTOQUECRITICO'
      Origin = 'ADME4.PRODUTO.ESTOQUECRITICO'
    end
    object qryProdutoUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Origin = 'ADME4.PRODUTO.UNIDADE'
      Size = 2
    end
    object qryProdutoCOMISSAO: TFloatField
      FieldName = 'COMISSAO'
      Origin = 'ADME4.PRODUTO.COMISSAO'
    end
    object qryProdutoOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Origin = 'ADME4.PRODUTO.OBSERVACAO'
      Size = 50
    end
    object qryProdutoFORNECEDOR: TStringField
      FieldKind = fkLookup
      FieldName = 'FORNECEDOR'
      LookupDataSet = qryFornec
      LookupKeyFields = 'CODIGOFORNECEDOR'
      LookupResultField = 'NOME'
      KeyFields = 'CODIGOFORNECEDOR'
      Size = 50
      Lookup = True
    end
    object qryProdutoGRUPO: TStringField
      FieldKind = fkLookup
      FieldName = 'GRUPO'
      LookupDataSet = qryGrupo
      LookupKeyFields = 'CODIGOGRUPO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CODIGOGRUPO'
      Size = 50
      Lookup = True
    end
    object qryProdutoSUBGRUPO: TStringField
      FieldKind = fkLookup
      FieldName = 'SUBGRUPO'
      LookupDataSet = qrySubGrupo
      LookupKeyFields = 'CODIGOSUBGRUPO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CODIGOSUBGRUPO'
      Size = 50
      Lookup = True
    end
    object qryProdutoMOEDA: TStringField
      FieldKind = fkLookup
      FieldName = 'MOEDA'
      LookupDataSet = qryMoeda
      LookupKeyFields = 'CODIGOMOEDA'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CODIGOMOEDA'
      Size = 50
      Lookup = True
    end
  end
  object qryGrupo: TQuery
    Active = True
    DatabaseName = 'ADME4'
    RequestLive = True
    SQL.Strings = (
      'select *'
      'from grupo')
    Left = 162
    Top = 408
    object qryGrupoCODIGOGRUPO: TIntegerField
      FieldName = 'CODIGOGRUPO'
      Origin = 'ADME4.GRUPO.CODIGOGRUPO'
    end
    object qryGrupoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'ADME4.GRUPO.DESCRICAO'
      Size = 50
    end
  end
  object qryItenPedidoVenda: TQuery
    Active = True
    DatabaseName = 'ADME4'
    RequestLive = True
    SQL.Strings = (
      'select *'
      'from itenspedidovenda')
    Left = 162
    Top = 458
  end
  object qryPedidoVenda: TQuery
    Active = True
    DatabaseName = 'ADME4'
    RequestLive = True
    SQL.Strings = (
      'select *'
      'from pedidovenda')
    Left = 369
    Top = 10
    object qryPedidoVendaNUMEROPEDIDO: TIntegerField
      FieldName = 'NUMEROPEDIDO'
      Origin = 'ADME4.PEDIDOVENDA.NUMEROPEDIDO'
    end
    object qryPedidoVendaCODIGOCLIENTE: TIntegerField
      FieldName = 'CODIGOCLIENTE'
      Origin = 'ADME4.PEDIDOVENDA.CODIGOCLIENTE'
    end
    object qryPedidoVendaCODIGOVENDEDOR: TIntegerField
      FieldName = 'CODIGOVENDEDOR'
      Origin = 'ADME4.PEDIDOVENDA.CODIGOVENDEDOR'
    end
    object qryPedidoVendaCODIGOFORMARECEBIMENTO: TIntegerField
      FieldName = 'CODIGOFORMARECEBIMENTO'
      Origin = 'ADME4.PEDIDOVENDA.CODIGOFORMARECEBIMENTO'
    end
    object qryPedidoVendaDATAPEDIDO: TDateTimeField
      FieldName = 'DATAPEDIDO'
      Origin = 'ADME4.PEDIDOVENDA.DATAPEDIDO'
    end
    object qryPedidoVendaDATAVENCTO: TDateTimeField
      FieldName = 'DATAVENCTO'
      Origin = 'ADME4.PEDIDOVENDA.DATAVENCTO'
    end
    object qryPedidoVendaCLIENTE: TStringField
      FieldKind = fkLookup
      FieldName = 'CLIENTE'
      LookupDataSet = qryCliente
      LookupKeyFields = 'CODIGOCLIENTE'
      LookupResultField = 'NOME'
      KeyFields = 'CODIGOCLIENTE'
      Size = 50
      Lookup = True
    end
    object qryPedidoVendaVENDEDOR: TStringField
      FieldKind = fkLookup
      FieldName = 'VENDEDOR'
      LookupDataSet = qryVendedor
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'NOME'
      KeyFields = 'CODIGOVENDEDOR'
      Size = 50
      Lookup = True
    end
    object qryPedidoVendaRECEBIMENTO: TStringField
      FieldKind = fkLookup
      FieldName = 'RECEBIMENTO'
      LookupDataSet = qryFormaRec
      LookupKeyFields = 'CODIGOFORMARECEBIMENTO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CODIGOFORMARECEBIMENTO'
      Size = 50
      Lookup = True
    end
  end
  object qryPedidoCompra: TQuery
    Active = True
    DatabaseName = 'ADME4'
    RequestLive = True
    SQL.Strings = (
      'select *'
      'from pedidocompra'
      '')
    Left = 369
    Top = 57
    object qryPedidoCompraNUMEROPEDIDO: TIntegerField
      FieldName = 'NUMEROPEDIDO'
      Origin = 'ADME4.PEDIDOCOMPRA.NUMEROPEDIDO'
    end
    object qryPedidoCompraCODIGOFORMAPAGAMENTO: TIntegerField
      FieldName = 'CODIGOFORMAPAGAMENTO'
      Origin = 'ADME4.PEDIDOCOMPRA.CODIGOFORMAPAGAMENTO'
    end
    object qryPedidoCompraCODIGOFORNECEDOR: TIntegerField
      FieldName = 'CODIGOFORNECEDOR'
      Origin = 'ADME4.PEDIDOCOMPRA.CODIGOFORNECEDOR'
    end
    object qryPedidoCompraNUMEROCONTROLE: TStringField
      FieldName = 'NUMEROCONTROLE'
      Origin = 'ADME4.PEDIDOCOMPRA.NUMEROCONTROLE'
      Size = 25
    end
    object qryPedidoCompraDATAPEDIDO: TDateTimeField
      FieldName = 'DATAPEDIDO'
      Origin = 'ADME4.PEDIDOCOMPRA.DATAPEDIDO'
    end
    object qryPedidoCompraDATAENTREGA: TDateTimeField
      FieldName = 'DATAENTREGA'
      Origin = 'ADME4.PEDIDOCOMPRA.DATAENTREGA'
    end
    object qryPedidoCompraFORNECEDOR: TStringField
      FieldKind = fkLookup
      FieldName = 'FORNECEDOR'
      LookupDataSet = qryFornec
      LookupKeyFields = 'CODIGOFORNECEDOR'
      LookupResultField = 'NOME'
      KeyFields = 'CODIGOFORNECEDOR'
      Size = 50
      Lookup = True
    end
    object qryPedidoCompraPAGAMENTO: TStringField
      FieldKind = fkLookup
      FieldName = 'PAGAMENTO'
      LookupDataSet = qryFormaPag
      LookupKeyFields = 'CODIGOFORMAPAGAMENTO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CODIGOFORMAPAGAMENTO'
      Size = 50
      Lookup = True
    end
  end
  object qryCliente: TQuery
    Active = True
    DatabaseName = 'ADME4'
    RequestLive = True
    SQL.Strings = (
      'select *'
      'from cliente')
    Left = 369
    Top = 105
    object qryClienteCODIGOCLIENTE: TIntegerField
      FieldName = 'CODIGOCLIENTE'
      Origin = 'ADME4.CLIENTE.CODIGOCLIENTE'
    end
    object qryClienteNOME: TStringField
      FieldName = 'NOME'
      Origin = 'ADME4.CLIENTE.NOME'
      Size = 50
    end
    object qryClienteTIPO: TIntegerField
      FieldName = 'TIPO'
      Origin = 'ADME4.CLIENTE.TIPO'
    end
    object qryClienteOCUPACAO: TIntegerField
      FieldName = 'OCUPACAO'
      Origin = 'ADME4.CLIENTE.OCUPACAO'
    end
    object qryClienteCPF: TStringField
      FieldName = 'CPF'
      Origin = 'ADME4.CLIENTE.CPF'
      Size = 11
    end
    object qryClienteRG: TStringField
      FieldName = 'RG'
      Origin = 'ADME4.CLIENTE.RG'
      Size = 25
    end
    object qryClienteDATANASCIMENTO: TDateTimeField
      FieldName = 'DATANASCIMENTO'
      Origin = 'ADME4.CLIENTE.DATANASCIMENTO'
    end
    object qryClienteSEXO: TStringField
      FieldName = 'SEXO'
      Origin = 'ADME4.CLIENTE.SEXO'
      Size = 1
    end
    object qryClienteENDERECO: TStringField
      FieldName = 'ENDERECO'
      Origin = 'ADME4.CLIENTE.ENDERECO'
      Size = 50
    end
    object qryClienteBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Origin = 'ADME4.CLIENTE.BAIRRO'
      Size = 25
    end
    object qryClienteCEP: TStringField
      FieldName = 'CEP'
      Origin = 'ADME4.CLIENTE.CEP'
      Size = 25
    end
    object qryClienteCIDADE: TStringField
      FieldName = 'CIDADE'
      Origin = 'ADME4.CLIENTE.CIDADE'
      Size = 25
    end
    object qryClienteUF: TStringField
      FieldName = 'UF'
      Origin = 'ADME4.CLIENTE.UF'
      Size = 2
    end
    object qryClienteFONE: TStringField
      FieldName = 'FONE'
      Origin = 'ADME4.CLIENTE.FONE'
      Size = 25
    end
    object qryClienteCONTATO: TStringField
      FieldName = 'CONTATO'
      Origin = 'ADME4.CLIENTE.CONTATO'
      Size = 25
    end
    object qryClienteFAX: TStringField
      FieldName = 'FAX'
      Origin = 'ADME4.CLIENTE.FAX'
      Size = 25
    end
    object qryClienteCELULAR: TStringField
      FieldName = 'CELULAR'
      Origin = 'ADME4.CLIENTE.CELULAR'
      Size = 25
    end
    object qryClienteEMAIL: TStringField
      FieldName = 'EMAIL'
      Origin = 'ADME4.CLIENTE.EMAIL'
      Size = 25
    end
  end
  object qryFormaRec: TQuery
    Active = True
    DatabaseName = 'ADME4'
    RequestLive = True
    SQL.Strings = (
      'select *'
      'from formarecebimento')
    Left = 369
    Top = 154
    object qryFormaRecCODIGOFORMARECEBIMENTO: TIntegerField
      FieldName = 'CODIGOFORMARECEBIMENTO'
      Origin = 'ADME4.FORMARECEBIMENTO.CODIGOFORMARECEBIMENTO'
    end
    object qryFormaRecDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'ADME4.FORMARECEBIMENTO.DESCRICAO'
      Size = 50
    end
    object qryFormaRecPERCENTUAL: TFloatField
      FieldName = 'PERCENTUAL'
      Origin = 'ADME4.FORMARECEBIMENTO.PERCENTUAL'
    end
    object qryFormaRecVISTAPARCELADO: TStringField
      FieldName = 'VISTAPARCELADO'
      Origin = 'ADME4.FORMARECEBIMENTO.VISTAPARCELADO'
      Size = 1
    end
    object qryFormaRecPARCELAS: TIntegerField
      FieldName = 'PARCELAS'
      Origin = 'ADME4.FORMARECEBIMENTO.PARCELAS'
    end
    object qryFormaRecINTERVALO: TIntegerField
      FieldName = 'INTERVALO'
      Origin = 'ADME4.FORMARECEBIMENTO.INTERVALO'
    end
    object qryFormaRecPRIMEIROVENCTO: TIntegerField
      FieldName = 'PRIMEIROVENCTO'
      Origin = 'ADME4.FORMARECEBIMENTO.PRIMEIROVENCTO'
    end
  end
end
