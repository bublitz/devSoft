object dtMod: TdtMod
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 217
  Top = 108
  Height = 628
  Width = 800
  object dsUser: TDataSource
    DataSet = tbUser
    Left = 24
    Top = 80
  end
  object dtBase: TIBDatabase
    Params.Strings = (
      'user_name=SYSDBA'
      'password=devkey')
    LoginPrompt = False
    DefaultTransaction = IBTrans
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 24
    Top = 22
  end
  object IBTrans: TIBTransaction
    Active = False
    DefaultDatabase = dtBase
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 85
    Top = 22
  end
  object tbUser: TIBTable
    Tag = 15
    Database = dtBase
    Transaction = IBTrans
    AfterInsert = GravaCodigo
    AfterScroll = tbUserAfterScroll
    BeforeInsert = GeraCodigo
    CachedUpdates = False
    TableName = 'USUARIO'
    Left = 85
    Top = 80
    object tbUserMATRICULA: TIntegerField
      FieldName = 'MATRICULA'
    end
    object tbUserNOME: TIBStringField
      FieldName = 'NOME'
      Size = 50
    end
    object tbUserUSERNAME: TIBStringField
      FieldName = 'USERNAME'
      Size = 25
    end
    object tbUserSENHA: TIBStringField
      FieldName = 'SENHA'
      Size = 25
    end
    object tbUserCORTESIA: TIntegerField
      FieldName = 'CORTESIA'
    end
    object tbUserDIREITOS: TIBStringField
      FieldName = 'DIREITOS'
      Size = 25
    end
    object tbUserDESCTOMAXIMO: TFloatField
      DisplayLabel = 'Descto Máximo'
      FieldName = 'DESCTOMAXIMO'
      currency = True
    end
    object tbUserDATAALTSENHA: TDateTimeField
      FieldName = 'DATAALTSENHA'
    end
  end
  object dsEmpresa: TDataSource
    DataSet = tbEmpresa
    Left = 242
    Top = 22
  end
  object tbEmpresa: TIBTable
    Tag = 1
    Database = dtBase
    Transaction = IBTrans
    AfterInsert = GravaCodigo
    BeforeInsert = GeraCodigo
    CachedUpdates = False
    TableName = 'EMPRESA'
    Left = 307
    Top = 22
    object tbEmpresaRAZAOSOCIAL: TIBStringField
      FieldName = 'RAZAOSOCIAL'
      Size = 50
    end
    object tbEmpresaENDERECO: TIBStringField
      FieldName = 'ENDERECO'
      Size = 50
    end
    object tbEmpresaBAIRRO: TIBStringField
      FieldName = 'BAIRRO'
      Size = 25
    end
    object tbEmpresaCIDADE: TIBStringField
      FieldName = 'CIDADE'
      Size = 25
    end
    object tbEmpresaCEP: TIBStringField
      FieldName = 'CEP'
      EditMask = '00\-000\-000;1;_'
      Size = 10
    end
    object tbEmpresaUF: TIBStringField
      FieldName = 'UF'
      Size = 2
    end
    object tbEmpresaFONE: TIBStringField
      FieldName = 'FONE'
      EditMask = '!\(99\)#000-0000;1;_'
      Size = 25
    end
    object tbEmpresaFAX: TIBStringField
      FieldName = 'FAX'
      Size = 25
    end
    object tbEmpresaCNPJ: TIBStringField
      FieldName = 'CNPJ'
      Size = 25
    end
    object tbEmpresaIE: TIBStringField
      FieldName = 'IE'
      Size = 25
    end
    object tbEmpresaDELAY: TIntegerField
      FieldName = 'DELAY'
    end
    object tbEmpresaEMAIL: TIBStringField
      FieldName = 'EMAIL'
      Size = 35
    end
    object tbEmpresaDIASATRASO: TIntegerField
      FieldName = 'DIASATRASO'
    end
    object tbEmpresaVALIDADESENHA: TIntegerField
      FieldName = 'VALIDADESENHA'
    end
    object tbEmpresaTEMPOCORTESIA: TIntegerField
      FieldName = 'TEMPOCORTESIA'
    end
    object tbEmpresaSENHALIBERA: TIBStringField
      FieldName = 'SENHALIBERA'
      Size = 25
    end
    object tbEmpresaMULTA: TFloatField
      FieldName = 'MULTA'
      DisplayFormat = ',#0.00'
    end
    object tbEmpresaJUROS: TFloatField
      FieldName = 'JUROS'
      DisplayFormat = ',#0.00'
    end
    object tbEmpresaDATAULTIMAGERACAO: TDateTimeField
      FieldName = 'DATAULTIMAGERACAO'
    end
    object tbEmpresaLINHAS: TIntegerField
      FieldName = 'LINHAS'
    end
    object tbEmpresaLANCTO: TFloatField
      FieldName = 'LANCTO'
    end
  end
  object dsFechado: TDataSource
    DataSet = tbFechado
    Left = 439
    Top = 127
  end
  object dsSituacao: TDataSource
    DataSet = tbSituacao
    Left = 439
    Top = 230
  end
  object dsPlano: TDataSource
    DataSet = tbPlano
    Left = 439
    Top = 179
  end
  object dsDiasSem: TDataSource
    DataSet = tbDiasSemana
    Left = 242
    Top = 191
  end
  object dsFeriado: TDataSource
    DataSet = tbFeriado
    Left = 242
    Top = 248
  end
  object dsCaixa: TDataSource
    DataSet = tbCaixa
    Left = 242
    Top = 74
  end
  object dsReceb: TDataSource
    DataSet = tbReceb
    Left = 242
    Top = 133
  end
  object dsMicro: TDataSource
    DataSet = tbMicro
    Left = 242
    Top = 306
  end
  object dsPreco: TDataSource
    DataSet = tbPreco
    Left = 439
    Top = 282
  end
  object tbSituacao: TIBTable
    Tag = 8
    Database = dtBase
    Transaction = IBTrans
    AfterInsert = GravaCodigo
    BeforeInsert = GeraCodigo
    CachedUpdates = False
    TableName = 'SITUACAO'
    Left = 508
    Top = 230
    object tbSituacaoCODIGOSITUACAO: TIntegerField
      FieldName = 'CODIGOSITUACAO'
    end
    object tbSituacaoDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object tbSituacaoBLOQUEIASOCIO: TIBStringField
      FieldName = 'BLOQUEIASOCIO'
      Size = 1
    end
  end
  object tbPlano: TIBTable
    Tag = 7
    Database = dtBase
    Transaction = IBTrans
    AfterInsert = GravaCodigo
    BeforeInsert = GeraCodigo
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'CODIGOPLANO'
        DataType = ftInteger
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'VALOR'
        DataType = ftFloat
      end
      item
        Name = 'HORAS'
        DataType = ftInteger
      end
      item
        Name = 'MESES'
        DataType = ftInteger
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY8'
        Fields = 'CODIGOPLANO'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'XPKPLANO'
        Fields = 'CODIGOPLANO'
        Options = [ixUnique]
      end
      item
        Name = 'XAK1PLANO'
        Fields = 'DESCRICAO'
        Options = [ixUnique]
      end>
    StoreDefs = True
    TableName = 'PLANO'
    Left = 508
    Top = 179
    object tbPlanoCODIGOPLANO: TIntegerField
      FieldName = 'CODIGOPLANO'
    end
    object tbPlanoDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object tbPlanoHORAS: TIntegerField
      FieldName = 'HORAS'
    end
    object tbPlanoVALOR: TFloatField
      FieldName = 'VALOR'
      currency = True
    end
    object tbPlanoMESES: TIntegerField
      FieldName = 'MESES'
    end
  end
  object tbFechado: TIBTable
    Database = dtBase
    Transaction = IBTrans
    CachedUpdates = False
    TableName = 'MOVIMENTOFECHADO'
    Left = 508
    Top = 127
    object tbFechadoCODIGOMICRO: TIntegerField
      FieldName = 'CODIGOMICRO'
    end
    object tbFechadoDHINICIAL: TDateTimeField
      FieldName = 'DHINICIAL'
    end
    object tbFechadoMATRICULA: TIntegerField
      FieldName = 'MATRICULA'
    end
    object tbFechadoDHFINAL: TDateTimeField
      FieldName = 'DHFINAL'
    end
    object tbFechadoVALORUNITARIO: TFloatField
      FieldName = 'VALORUNITARIO'
      currency = True
    end
    object tbFechadoHORAS: TFloatField
      FieldName = 'HORAS'
    end
    object tbFechadoVALORTOTAL: TFloatField
      FieldName = 'VALORTOTAL'
      currency = True
    end
    object tbFechadoCORTESIA: TIBStringField
      FieldName = 'CORTESIA'
      Size = 1
    end
    object tbFechadoCODIGOSOCIO: TIntegerField
      FieldName = 'CODIGOSOCIO'
    end
    object tbFechadoTEMPOESTIMADO: TIntegerField
      FieldName = 'TEMPOESTIMADO'
    end
    object tbFechadoTIPO: TIBStringField
      FieldName = 'TIPO'
      Size = 1
    end
    object tbFechadoCONTABILIZADO: TIBStringField
      FieldName = 'CONTABILIZADO'
      Size = 1
    end
  end
  object tbPreco: TIBTable
    Tag = 9
    Database = dtBase
    Transaction = IBTrans
    AfterInsert = GravaCodigo
    BeforeInsert = GeraCodigo
    CachedUpdates = False
    TableName = 'PRECOS'
    Left = 508
    Top = 282
    object tbPrecoCODIGODIASEMANA: TIntegerField
      FieldName = 'CODIGODIASEMANA'
    end
    object tbPrecoHORAINICIAL: TDateTimeField
      FieldName = 'HORAINICIAL'
    end
    object tbPrecoHORAFINAL: TDateTimeField
      FieldName = 'HORAFINAL'
    end
    object tbPrecoVALORAVULSO: TFloatField
      FieldName = 'VALORAVULSO'
      currency = True
    end
    object tbPrecoVALORSOCIO: TFloatField
      FieldName = 'VALORSOCIO'
      currency = True
    end
    object tbPrecoDescricaoDiaSemana: TStringField
      FieldKind = fkLookup
      FieldName = 'DescricaoDiaSemana'
      LookupDataSet = tbDiasSemana
      LookupKeyFields = 'CODIGODIASEMANA'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CODIGODIASEMANA'
      Size = 50
      Lookup = True
    end
    object tbPrecoAVULSO15: TFloatField
      FieldName = 'AVULSO15'
      currency = True
    end
    object tbPrecoAVULSO30: TFloatField
      FieldName = 'AVULSO30'
      currency = True
    end
    object tbPrecoSOCIO15: TFloatField
      FieldName = 'SOCIO15'
      currency = True
    end
    object tbPrecoSOCIO30: TFloatField
      FieldName = 'SOCIO30'
      currency = True
    end
  end
  object tbDiasSemana: TIBTable
    Tag = 4
    Database = dtBase
    Transaction = IBTrans
    AfterInsert = GravaCodigo
    BeforeInsert = GeraCodigo
    CachedUpdates = False
    TableName = 'DIASSEMANA'
    Left = 307
    Top = 195
    object tbDiasSemanaCODIGODIASEMANA: TIntegerField
      FieldName = 'CODIGODIASEMANA'
    end
    object tbDiasSemanaDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Size = 50
    end
  end
  object tbFeriado: TIBTable
    Database = dtBase
    Transaction = IBTrans
    CachedUpdates = False
    TableName = 'FERIADO'
    Left = 307
    Top = 250
    object tbFeriadoDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object tbFeriadoDIA: TIntegerField
      FieldName = 'DIA'
    end
    object tbFeriadoMES: TIntegerField
      FieldName = 'MES'
    end
  end
  object tbCaixa: TIBTable
    Tag = 10
    Database = dtBase
    Transaction = IBTrans
    AfterInsert = GravaCodigo
    BeforeInsert = GeraCodigo
    BeforePost = tbCaixaBeforePost
    CachedUpdates = False
    TableName = 'CAIXA'
    Left = 307
    Top = 76
    object tbCaixaNomeMatricula: TStringField
      FieldKind = fkLookup
      FieldName = 'NomeMatricula'
      LookupDataSet = tbUser
      LookupKeyFields = 'MATRICULA'
      LookupResultField = 'NOME'
      KeyFields = 'MATRICULA'
      Size = 50
      Lookup = True
    end
    object tbCaixaDATAMOVIMENTO: TDateTimeField
      FieldName = 'DATAMOVIMENTO'
    end
    object tbCaixaCONTROLECAIXA: TIntegerField
      FieldName = 'CONTROLECAIXA'
    end
    object tbCaixaMATRICULA: TIntegerField
      FieldName = 'MATRICULA'
    end
    object tbCaixaTIPOLANCTO: TIBStringField
      FieldName = 'TIPOLANCTO'
      Size = 1
    end
    object tbCaixaDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object tbCaixaENTRADA: TFloatField
      FieldName = 'ENTRADA'
    end
    object tbCaixaSAIDA: TFloatField
      FieldName = 'SAIDA'
    end
    object tbCaixaSALDO: TFloatField
      FieldName = 'SALDO'
    end
    object tbCaixaCONTROLE: TIntegerField
      FieldName = 'CONTROLE'
    end
  end
  object tbReceb: TIBTable
    Tag = 3
    Database = dtBase
    Transaction = IBTrans
    AfterInsert = GravaCodigo
    BeforeInsert = GeraCodigo
    CachedUpdates = False
    TableName = 'CONTARECEBER'
    Left = 307
    Top = 135
    object tbRecebNUMERO: TIntegerField
      FieldName = 'NUMERO'
    end
    object tbRecebCODIGOSOCIO: TIntegerField
      FieldName = 'CODIGOSOCIO'
    end
    object tbRecebCODIGOSITUACAO: TIntegerField
      FieldName = 'CODIGOSITUACAO'
    end
    object tbRecebDATAEMISSAO: TDateTimeField
      FieldName = 'DATAEMISSAO'
      EditMask = '!99/99/0000;1;_'
    end
    object tbRecebDATAVENCIMENTO: TDateTimeField
      FieldName = 'DATAVENCIMENTO'
      EditMask = '!99/99/0000;1;_'
    end
    object tbRecebDATAPAGAMENTO: TDateTimeField
      FieldName = 'DATAPAGAMENTO'
      EditMask = '!99/99/0000;1;_'
    end
    object tbRecebCHEQUE: TIBStringField
      FieldName = 'CHEQUE'
      Size = 10
    end
    object tbRecebBANCO: TIBStringField
      FieldName = 'BANCO'
      Size = 25
    end
    object tbRecebOBSERVACAO: TIBStringField
      FieldName = 'OBSERVACAO'
      Size = 50
    end
    object tbRecebVALOR: TFloatField
      FieldName = 'VALOR'
      currency = True
    end
    object tbRecebMULTA: TFloatField
      FieldName = 'MULTA'
      DisplayFormat = ',#0.00'
    end
    object tbRecebJUROS: TFloatField
      FieldName = 'JUROS'
      DisplayFormat = ',#0.00'
    end
    object tbRecebVALORPAGO: TFloatField
      FieldName = 'VALORPAGO'
      currency = True
    end
    object tbRecebNomeSocio: TStringField
      FieldKind = fkLookup
      FieldName = 'NomeSocio'
      LookupDataSet = tbSocio
      LookupKeyFields = 'CODIGOSOCIO'
      LookupResultField = 'NOME'
      KeyFields = 'CODIGOSOCIO'
      Size = 50
      Lookup = True
    end
    object tbRecebSituacao: TStringField
      FieldKind = fkLookup
      FieldName = 'Situacao'
      LookupDataSet = tbSituacao
      LookupKeyFields = 'CODIGOSITUACAO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CODIGOSITUACAO'
      Size = 50
      Lookup = True
    end
  end
  object tbMicro: TIBTable
    Tag = 5
    Database = dtBase
    Transaction = IBTrans
    AfterInsert = GravaCodigo
    BeforeInsert = GeraCodigo
    OnCalcFields = tbMicroCalcFields
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'CODIGOMICRO'
        DataType = ftInteger
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'CODIGOSOCIO'
        DataType = ftInteger
      end
      item
        Name = 'ESTADO'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'NETNAME'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'DHINICIAL'
        DataType = ftDateTime
      end
      item
        Name = 'VALORUNITARIO'
        DataType = ftFloat
      end
      item
        Name = 'TEMPOESTIMADO'
        DataType = ftInteger
      end
      item
        Name = 'TIPO'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'CORTESIA'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'VALOR15'
        DataType = ftFloat
      end
      item
        Name = 'VALOR30'
        DataType = ftFloat
      end
      item
        Name = 'TEMPOCORTESIA'
        DataType = ftInteger
      end>
    IndexDefs = <
      item
        Name = 'XIF27MICRO'
        Fields = 'CODIGOSOCIO'
      end
      item
        Name = 'RDB$FOREIGN27'
        Fields = 'CODIGOSOCIO'
      end
      item
        Name = 'RDB$PRIMARY14'
        Fields = 'CODIGOMICRO'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'XPKMICRO'
        Fields = 'CODIGOMICRO'
        Options = [ixUnique]
      end
      item
        Name = 'XAK1MICRO'
        Fields = 'DESCRICAO'
        Options = [ixUnique]
      end>
    StoreDefs = True
    TableName = 'MICRO'
    UpdateObject = updMicro
    Left = 307
    Top = 308
    object tbMicroCODIGOMICRO: TIntegerField
      FieldName = 'CODIGOMICRO'
    end
    object tbMicroDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object tbMicroESTADO: TIBStringField
      FieldName = 'ESTADO'
      Size = 1
    end
    object tbMicroNETNAME: TIBStringField
      FieldName = 'NETNAME'
      Size = 50
    end
    object tbMicroCODIGOSOCIO: TIntegerField
      FieldName = 'CODIGOSOCIO'
    end
    object tbMicroDHINICIAL: TDateTimeField
      FieldName = 'DHINICIAL'
    end
    object tbMicroVALORUNITARIO: TFloatField
      FieldName = 'VALORUNITARIO'
      currency = True
    end
    object tbMicroTEMPOESTIMADO: TIntegerField
      FieldName = 'TEMPOESTIMADO'
    end
    object tbMicroTIPO: TIBStringField
      FieldName = 'TIPO'
      Size = 1
    end
    object tbMicroCORTESIA: TIBStringField
      FieldName = 'CORTESIA'
      Size = 1
    end
    object tbMicroHorasParcial: TFloatField
      FieldKind = fkCalculated
      FieldName = 'HorasParcial'
      Calculated = True
    end
    object tbMicroValorParcial: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ValorParcial'
      currency = True
      Calculated = True
    end
    object tbMicroNomeSocio: TStringField
      FieldKind = fkLookup
      FieldName = 'NomeSocio'
      LookupDataSet = tbSocio
      LookupKeyFields = 'CODIGOSOCIO'
      LookupResultField = 'NOME'
      KeyFields = 'CODIGOSOCIO'
      Size = 50
      Lookup = True
    end
    object tbMicroTempoDisp: TStringField
      FieldKind = fkCalculated
      FieldName = 'TempoDisp'
      Size = 15
      Calculated = True
    end
    object tbMicroVALOR15: TFloatField
      FieldName = 'VALOR15'
    end
    object tbMicroVALOR30: TFloatField
      FieldName = 'VALOR30'
    end
    object tbMicroTEMPOCORTESIA: TIntegerField
      FieldName = 'TEMPOCORTESIA'
    end
  end
  object dsSocio: TDataSource
    DataSet = tbSocio
    Left = 439
    Top = 22
  end
  object tbSocio: TIBTable
    Tag = 6
    Database = dtBase
    Transaction = IBTrans
    AfterInsert = GravaCodigo
    AfterPost = tbSocioAfterPost
    BeforeInsert = GeraCodigo
    OnCalcFields = tbSocioCalcFields
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'CODIGOSOCIO'
        DataType = ftInteger
      end
      item
        Name = 'CODIGOPLANO'
        DataType = ftInteger
      end
      item
        Name = 'NOME'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'ENDERECO'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'COMPLEMENTO'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'BAIRRO'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'CIDADE'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'UF'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'CEP'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'CPF'
        DataType = ftString
        Size = 11
      end
      item
        Name = 'RG'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'DATANASCIMENTO'
        DataType = ftDateTime
      end
      item
        Name = 'FOTO'
        DataType = ftBlob
      end
      item
        Name = 'DATACADASTRO'
        DataType = ftDateTime
      end
      item
        Name = 'TELEFONE'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'EMAIL'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'SITUACAO'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'DIAVENCTO'
        DataType = ftInteger
      end
      item
        Name = 'CARTEIRA'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'DATARENOVA'
        DataType = ftDateTime
      end
      item
        Name = 'DATAVENCTO'
        DataType = ftDateTime
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY9'
        Fields = 'CODIGOSOCIO'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'RDB$FOREIGN10'
        Fields = 'CODIGOPLANO'
      end
      item
        Name = 'XPKSOCIO'
        Fields = 'CODIGOSOCIO'
        Options = [ixUnique]
      end
      item
        Name = 'XAK1SOCIO'
        Fields = 'NOME'
        Options = [ixUnique]
      end
      item
        Name = 'XIF13SOCIO'
        Fields = 'CODIGOPLANO'
      end>
    StoreDefs = True
    TableName = 'SOCIO'
    Left = 508
    Top = 22
    object tbSocioCODIGOSOCIO: TIntegerField
      FieldName = 'CODIGOSOCIO'
    end
    object tbSocioCODIGOPLANO: TIntegerField
      FieldName = 'CODIGOPLANO'
    end
    object tbSocioNOME: TIBStringField
      FieldName = 'NOME'
      Size = 50
    end
    object tbSocioENDERECO: TIBStringField
      FieldName = 'ENDERECO'
      Size = 50
    end
    object tbSocioCOMPLEMENTO: TIBStringField
      FieldName = 'COMPLEMENTO'
      Size = 50
    end
    object tbSocioBAIRRO: TIBStringField
      FieldName = 'BAIRRO'
      Size = 50
    end
    object tbSocioCIDADE: TIBStringField
      FieldName = 'CIDADE'
      Size = 50
    end
    object tbSocioUF: TIBStringField
      FieldName = 'UF'
    end
    object tbSocioCEP: TIBStringField
      FieldName = 'CEP'
      EditMask = '00\-000\-000;1;_'
      Size = 10
    end
    object tbSocioCPF: TIBStringField
      FieldName = 'CPF'
      Size = 11
    end
    object tbSocioRG: TIBStringField
      FieldName = 'RG'
      Size = 15
    end
    object tbSocioDATANASCIMENTO: TDateTimeField
      FieldName = 'DATANASCIMENTO'
      EditMask = '!99/99/0000;1;_'
    end
    object tbSocioFOTO: TBlobField
      FieldName = 'FOTO'
      BlobType = ftBlob
      Size = 8
    end
    object tbSocioDATACADASTRO: TDateTimeField
      FieldName = 'DATACADASTRO'
      EditMask = '!99/99/0000;1;_'
    end
    object tbSocioTELEFONE: TIBStringField
      FieldName = 'TELEFONE'
      EditMask = '!\(99\)#000-0000;1;_'
      Size = 50
    end
    object tbSocioEMAIL: TIBStringField
      FieldName = 'EMAIL'
      Size = 50
    end
    object tbSocioSITUACAO: TIBStringField
      FieldName = 'SITUACAO'
      Size = 1
    end
    object tbSocioPLANO: TStringField
      FieldKind = fkLookup
      FieldName = 'PLANO'
      LookupDataSet = tbPlano
      LookupKeyFields = 'CODIGOPLANO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CODIGOPLANO'
      Size = 50
      Lookup = True
    end
    object tbSocioHorasAcumuladas: TFloatField
      FieldKind = fkCalculated
      FieldName = 'HorasAcumuladas'
      Calculated = True
    end
    object tbSocioHorasDisponiveis: TFloatField
      FieldKind = fkCalculated
      FieldName = 'HorasDisponiveis'
      Calculated = True
    end
    object tbSocioCodigoBarra: TStringField
      FieldKind = fkCalculated
      FieldName = 'CodigoBarra'
      ReadOnly = True
      Size = 15
      Calculated = True
    end
    object tbSocioCARTEIRA: TIBStringField
      FieldName = 'CARTEIRA'
      Size = 1
    end
    object tbSocioHAcum: TStringField
      FieldKind = fkCalculated
      FieldName = 'HAcum'
      Size = 10
      Calculated = True
    end
    object tbSocioHDisp: TStringField
      FieldKind = fkCalculated
      FieldName = 'HDisp'
      Size = 10
      Calculated = True
    end
    object tbSocioHTotal: TStringField
      FieldKind = fkCalculated
      FieldName = 'HTotal'
      Size = 10
      Calculated = True
    end
    object tbSocioHorasTotal: TIntegerField
      FieldKind = fkLookup
      FieldName = 'HorasTotal'
      LookupDataSet = tbPlano
      LookupKeyFields = 'CODIGOPLANO'
      LookupResultField = 'HORAS'
      KeyFields = 'CODIGOPLANO'
      ReadOnly = True
      Lookup = True
    end
    object tbSocioMesAtual: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'MesAtual'
      Calculated = True
    end
    object tbSocioDATARENOVA: TDateTimeField
      FieldName = 'DATARENOVA'
    end
    object tbSocioDATAVENCTO: TDateTimeField
      FieldName = 'DATAVENCTO'
    end
  end
  object dsConta: TDataSource
    DataSet = tbConta
    Left = 24
    Top = 139
  end
  object tbConta: TIBTable
    Database = dtBase
    Transaction = IBTrans
    AfterPost = tbContaAfterPost
    CachedUpdates = False
    TableName = 'CONTASOCIO'
    Left = 85
    Top = 139
    object tbContaCODIGOSOCIO: TIntegerField
      FieldName = 'CODIGOSOCIO'
    end
    object tbContaANO: TIntegerField
      FieldName = 'ANO'
    end
    object tbContaMES: TIntegerField
      FieldName = 'MES'
    end
    object tbContaACUMULADO: TFloatField
      FieldName = 'ACUMULADO'
    end
  end
  object dsOpCl: TDataSource
    DataSet = tbOpenClose
    Left = 439
    Top = 76
  end
  object tbOpenClose: TIBTable
    Tag = 2
    Database = dtBase
    Transaction = IBTrans
    AfterInsert = GravaCodigo
    BeforeInsert = GeraCodigo
    CachedUpdates = False
    TableName = 'OPENCLOSE'
    Left = 508
    Top = 76
    object tbOpenCloseCONTROLECAIXA: TIntegerField
      FieldName = 'CONTROLECAIXA'
    end
    object tbOpenCloseMATRICULA: TIntegerField
      FieldName = 'MATRICULA'
    end
    object tbOpenCloseSALDOABERTURA: TFloatField
      FieldName = 'SALDOABERTURA'
    end
    object tbOpenCloseDHABERTURA: TDateTimeField
      FieldName = 'DHABERTURA'
    end
    object tbOpenCloseDHFECHAMENTO: TDateTimeField
      FieldName = 'DHFECHAMENTO'
    end
    object tbOpenCloseSALDOFECHAMENTO: TFloatField
      FieldName = 'SALDOFECHAMENTO'
    end
  end
  object dsDataCaixa: TDataSource
    DataSet = qrDataCaixa
    Left = 242
    Top = 359
  end
  object qrDataCaixa: TIBQuery
    Database = dtBase
    Transaction = IBTrans
    CachedUpdates = False
    SQL.Strings = (
      'select *'
      'from OPENCLOSE'
      'where cast(DHABERTURA as date) = :DATA')
    Left = 307
    Top = 361
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DATA'
        ParamType = ptUnknown
      end>
    object qrDataCaixaCONTROLECAIXA: TIntegerField
      FieldName = 'CONTROLECAIXA'
      Required = True
    end
    object qrDataCaixaMATRICULA: TIntegerField
      FieldName = 'MATRICULA'
    end
    object qrDataCaixaSALDOABERTURA: TFloatField
      FieldName = 'SALDOABERTURA'
    end
    object qrDataCaixaDHABERTURA: TDateTimeField
      FieldName = 'DHABERTURA'
    end
    object qrDataCaixaDHFECHAMENTO: TDateTimeField
      FieldName = 'DHFECHAMENTO'
    end
    object qrDataCaixaSALDOFECHAMENTO: TFloatField
      FieldName = 'SALDOFECHAMENTO'
    end
  end
  object dsCalFechado: TDataSource
    DataSet = qrCalFechado
    Left = 242
    Top = 417
  end
  object qrCalFechado: TIBQuery
    Database = dtBase
    Transaction = IBTrans
    CachedUpdates = False
    SQL.Strings = (
      'select CODIGOMICRO, SUM(VALORTOTAL) VALORTOTAL'
      'from MOVIMENTOFECHADO'
      'where CONTABILIZADO='#39'N'#39
      'group by CODIGOMICRO')
    Left = 307
    Top = 419
    object qrCalFechadoCODIGOMICRO: TIntegerField
      FieldName = 'CODIGOMICRO'
    end
    object qrCalFechadoVALORTOTAL: TFloatField
      FieldName = 'VALORTOTAL'
    end
    object qrCalFechadoMicro: TStringField
      FieldKind = fkLookup
      FieldName = 'Micro'
      LookupDataSet = tbMicro
      LookupKeyFields = 'CODIGOMICRO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CODIGOMICRO'
      Size = 52
      Lookup = True
    end
  end
  object dsMovFechado: TDataSource
    DataSet = qrMovFechado
    Left = 24
    Top = 313
  end
  object qrMovFechado: TIBQuery
    Database = dtBase
    Transaction = IBTrans
    CachedUpdates = False
    SQL.Strings = (
      'Update MovimentoFechado'
      'set'
      'Contabilizado = '#39'S'#39)
    Left = 85
    Top = 313
  end
  object dsRelFech: TDataSource
    DataSet = qrRelFech
    Left = 24
    Top = 372
  end
  object qrRelFech: TIBQuery
    Database = dtBase
    Transaction = IBTrans
    CachedUpdates = False
    SQL.Strings = (
      
        'select DATAMOVIMENTO, TIPOLANCTO, DESCRICAO, ENTRADA, SAIDA, SAL' +
        'DO, cast(datamovimento as date) DATA'
      'from CAIXA'
      'where CONTROLECAIXA >= :INICIO'
      '  and CONTROLECAIXA <= :FINAL')
    Left = 85
    Top = 372
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'INICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FINAL'
        ParamType = ptUnknown
      end>
    object qrRelFechDATAMOVIMENTO: TDateTimeField
      FieldName = 'DATAMOVIMENTO'
      Required = True
    end
    object qrRelFechTIPOLANCTO: TIBStringField
      FieldName = 'TIPOLANCTO'
      Size = 1
    end
    object qrRelFechDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 50
    end
    object qrRelFechENTRADA: TFloatField
      FieldName = 'ENTRADA'
    end
    object qrRelFechSAIDA: TFloatField
      FieldName = 'SAIDA'
    end
    object qrRelFechSALDO: TFloatField
      FieldName = 'SALDO'
    end
    object qrRelFechDATA: TDateField
      FieldName = 'DATA'
    end
  end
  object dsDatPer: TDataSource
    DataSet = qrDatPer
    Left = 439
    Top = 333
  end
  object qrDatPer: TIBQuery
    Database = dtBase
    Transaction = IBTrans
    CachedUpdates = False
    SQL.Strings = (
      'select min(CONTROLECAIXA) MENOR, '
      '          max(CONTROLECAIXA) MAIOR'
      'from OPENCLOSE'
      'where DHABERTURA  >= :DATA1'
      '    and DHABERTURA < :DATA2'
      ''
      '')
    Left = 508
    Top = 333
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DATA1'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATA2'
        ParamType = ptUnknown
      end>
    object qrDatPerMENOR: TIntegerField
      FieldName = 'MENOR'
    end
    object qrDatPerMAIOR: TIntegerField
      FieldName = 'MAIOR'
    end
  end
  object dsCxAtual: TDataSource
    DataSet = qrCxAtual
    Left = 439
    Top = 385
  end
  object qrCxAtual: TIBQuery
    Database = dtBase
    Transaction = IBTrans
    CachedUpdates = False
    SQL.Strings = (
      'select DATAMOVIMENTO, CONTROLECAIXA, TIPOLANCTO,'
      'DESCRICAO, ENTRADA, SAIDA, SALDO, CONTROLE'
      'from caixa'
      'where CONTROLECAIXA = :num_control'
      'order by DATAMOVIMENTO')
    Left = 508
    Top = 385
    ParamData = <
      item
        DataType = ftInteger
        Name = 'num_control'
        ParamType = ptUnknown
      end>
    object qrCxAtualDATAMOVIMENTO: TDateTimeField
      FieldName = 'DATAMOVIMENTO'
      Required = True
    end
    object qrCxAtualCONTROLECAIXA: TIntegerField
      FieldName = 'CONTROLECAIXA'
      Required = True
    end
    object qrCxAtualTIPOLANCTO: TIBStringField
      FieldName = 'TIPOLANCTO'
      Size = 1
    end
    object qrCxAtualDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 50
    end
    object qrCxAtualENTRADA: TFloatField
      FieldName = 'ENTRADA'
      currency = True
    end
    object qrCxAtualSAIDA: TFloatField
      FieldName = 'SAIDA'
      currency = True
    end
    object qrCxAtualSALDO: TFloatField
      FieldName = 'SALDO'
      currency = True
    end
    object qrCxAtualCONTROLE: TIntegerField
      FieldName = 'CONTROLE'
      Required = True
    end
  end
  object dsExpira: TDataSource
    DataSet = tbExpira
    Left = 24
    Top = 197
  end
  object tbExpira: TIBTable
    Database = dtBase
    Transaction = IBTrans
    CachedUpdates = False
    IndexFieldNames = 'DHEXPIRA'
    TableName = 'EXPIRATEMPO'
    Left = 85
    Top = 197
    object tbExpiraDHEXPIRA: TDateTimeField
      FieldName = 'DHEXPIRA'
    end
  end
  object updMicro: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  RDB$DB_KEY as IBX_INTERNAL_DBKEY, '
      '  CODIGOMICRO,'
      '  DESCRICAO,'
      '  CODIGOSOCIO,'
      '  ESTADO,'
      '  NETNAME,'
      '  DHINICIAL,'
      '  VALORUNITARIO,'
      '  TEMPOESTIMADO,'
      '  TIPO,'
      '  CORTESIA,'
      '  VALOR15,'
      '  VALOR30,'
      '  TEMPOCORTESIA'
      'from MICRO '
      'where'
      '  CODIGOMICRO = :CODIGOMICRO')
    ModifySQL.Strings = (
      'update MICRO'
      'set'
      '  CODIGOMICRO = :CODIGOMICRO,'
      '  DESCRICAO = :DESCRICAO,'
      '  CODIGOSOCIO = :CODIGOSOCIO,'
      '  ESTADO = :ESTADO,'
      '  NETNAME = :NETNAME,'
      '  DHINICIAL = :DHINICIAL,'
      '  VALORUNITARIO = :VALORUNITARIO,'
      '  TEMPOESTIMADO = :TEMPOESTIMADO,'
      '  TIPO = :TIPO,'
      '  CORTESIA = :CORTESIA,'
      '  VALOR15 = :VALOR15,'
      '  VALOR30 = :VALOR30,'
      '  TEMPOCORTESIA = :TEMPOCORTESIA'
      'where'
      '  CODIGOMICRO = :OLD_CODIGOMICRO')
    InsertSQL.Strings = (
      'insert into MICRO'
      
        '  (CODIGOMICRO, DESCRICAO, CODIGOSOCIO, ESTADO, NETNAME, DHINICI' +
        'AL, '
      'VALORUNITARIO, '
      
        '   TEMPOESTIMADO, TIPO, CORTESIA, VALOR15, VALOR30, TEMPOCORTESI' +
        'A)'
      'values'
      '  (:CODIGOMICRO, :DESCRICAO, :CODIGOSOCIO, :ESTADO, :NETNAME, '
      ':DHINICIAL, '
      '   :VALORUNITARIO, :TEMPOESTIMADO, :TIPO, :CORTESIA, :VALOR15, '
      ':VALOR30, '
      '   :TEMPOCORTESIA)')
    DeleteSQL.Strings = (
      'delete from MICRO'
      'where'
      '  CODIGOMICRO = :OLD_CODIGOMICRO')
    Left = 354
    Top = 308
  end
  object dsBaixa: TDataSource
    DataSet = qrBaixa
    Left = 24
    Top = 255
  end
  object qrBaixa: TIBQuery
    Database = dtBase
    Transaction = IBTrans
    CachedUpdates = False
    SQL.Strings = (
      'UPDATE '
      '  contareceber'
      'SET'
      '  datapagamento = :DATA,'
      '  valorpago = 0,'
      '  observacao = '#39'BAIXADO AUTOMATICAMENTE'#39','
      '  codigosituacao = 2'
      'WHERE'
      '  codigosocio = :SOCIO')
    Left = 85
    Top = 255
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DATA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'SOCIO'
        ParamType = ptUnknown
      end>
  end
  object dsLog: TDataSource
    Left = 24
    Top = 430
  end
  object qrLog: TIBQuery
    Database = dtBase
    Transaction = IBTrans
    CachedUpdates = False
    SQL.Strings = (
      'select * from LOG')
    UpdateObject = upLog
    Left = 85
    Top = 430
    object qrLogMATRICULA: TIntegerField
      FieldName = 'MATRICULA'
      Required = True
    end
    object qrLogDATA: TDateField
      FieldName = 'DATA'
      Required = True
    end
    object qrLogHORA: TTimeField
      FieldName = 'HORA'
      Required = True
    end
    object qrLogDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Size = 50
    end
  end
  object upLog: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  MATRICULA,'
      '  DATA,'
      '  HORA,'
      '  DESCRICAO'
      'from LOG '
      'where'
      '  MATRICULA = :MATRICULA and'
      '  DATA = :DATA and'
      '  HORA = :HORA')
    ModifySQL.Strings = (
      'update LOG'
      'set'
      '  MATRICULA = :MATRICULA,'
      '  DATA = :DATA,'
      '  HORA = :HORA,'
      '  DESCRICAO = :DESCRICAO'
      'where'
      '  MATRICULA = :OLD_MATRICULA and'
      '  DATA = :OLD_DATA and'
      '  HORA = :OLD_HORA')
    InsertSQL.Strings = (
      'insert into LOG'
      '  (MATRICULA, DATA, HORA, DESCRICAO)'
      'values'
      '  (:MATRICULA, :DATA, :HORA, :DESCRICAO)')
    DeleteSQL.Strings = (
      'delete from LOG'
      'where'
      '  MATRICULA = :OLD_MATRICULA and'
      '  DATA = :OLD_DATA and'
      '  HORA = :OLD_HORA')
    Left = 128
    Top = 432
  end
  object dsEmail: TDataSource
    DataSet = qrEmail
    Left = 439
    Top = 436
  end
  object qrEmail: TIBQuery
    Database = dtBase
    Transaction = IBTrans
    CachedUpdates = False
    SQL.Strings = (
      'select Nome, DataNascimento, Email'
      'from Socio'
      'where DataNascimento >= :INICIO'
      '  and DataNascimento <= :FINAL')
    Left = 508
    Top = 436
    ParamData = <
      item
        DataType = ftDate
        Name = 'INICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'FINAL'
        ParamType = ptUnknown
      end>
    object qrEmailNOME: TIBStringField
      FieldName = 'NOME'
      Size = 50
    end
    object qrEmailDATANASCIMENTO: TDateTimeField
      FieldName = 'DATANASCIMENTO'
    end
    object qrEmailEMAIL: TIBStringField
      FieldName = 'EMAIL'
      Size = 50
    end
  end
  object dsRelVencto: TDataSource
    DataSet = qrRelVencto
    Left = 24
    Top = 488
  end
  object qrRelVencto: TIBQuery
    Database = dtBase
    Transaction = IBTrans
    CachedUpdates = False
    SQL.Strings = (
      'select nome, telefone, datavencto, datarenova, situacao '
      'from socio'
      'where situacao = '#39'B'#39' and dataVencto >= :data1 '
      'and dataVencto <=:data2'
      ''
      '')
    Left = 85
    Top = 488
    ParamData = <
      item
        DataType = ftDate
        Name = 'data1'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'data2'
        ParamType = ptUnknown
      end>
    object qrRelVenctoNOME: TIBStringField
      FieldName = 'NOME'
      Size = 50
    end
    object qrRelVenctoTELEFONE: TIBStringField
      FieldName = 'TELEFONE'
      Size = 50
    end
    object qrRelVenctoDATAVENCTO: TDateTimeField
      FieldName = 'DATAVENCTO'
    end
    object qrRelVenctoDATARENOVA: TDateTimeField
      FieldName = 'DATARENOVA'
    end
    object qrRelVenctoSITUACAO: TIBStringField
      FieldName = 'SITUACAO'
      Size = 1
    end
  end
  object dsDesconto: TDataSource
    DataSet = tbDesconto
    Left = 246
    Top = 472
  end
  object tbDesconto: TIBTable
    Tag = 16
    Database = dtBase
    Transaction = IBTrans
    AfterInsert = GravaCodigo
    BeforeInsert = GeraCodigo
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'CODIGODESCONTO'
        DataType = ftInteger
      end
      item
        Name = 'HORAS'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO'
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY3'
        Fields = 'CODIGODESCONTO'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'XPKDESCONTO'
        Fields = 'CODIGODESCONTO'
        Options = [ixUnique]
      end>
    StoreDefs = True
    TableName = 'DESCONTO'
    Left = 312
    Top = 472
    object tbDescontoCODIGODESCONTO: TIntegerField
      FieldName = 'CODIGODESCONTO'
    end
    object tbDescontoHORAS: TFloatField
      FieldName = 'HORAS'
    end
    object tbDescontoDESCONTO: TFloatField
      FieldName = 'DESCONTO'
    end
  end
  object dsSqlDescto: TDataSource
    DataSet = sqlDescto
    Left = 246
    Top = 528
  end
  object sqlDescto: TIBQuery
    Database = dtBase
    Transaction = IBTrans
    CachedUpdates = False
    SQL.Strings = (
      'select HORAS, DESCONTO from DESCONTO'
      'order by HORAS desc')
    Left = 312
    Top = 530
    object sqlDesctoHORAS: TFloatField
      FieldName = 'HORAS'
    end
    object sqlDesctoDESCONTO: TFloatField
      FieldName = 'DESCONTO'
    end
  end
end
