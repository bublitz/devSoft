object dmPrinc: TdmPrinc
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 335
  Width = 492
  object ConAdmi: TDCOMConnection
    Connected = True
    ServerGUID = '{2D412DD6-3DEE-45E6-8E8B-99DD5AAE6C57}'
    ServerName = 'AdmServer.DM'
    Left = 40
    Top = 40
  end
  object cdsPesqCli: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'pnome'
        ParamType = ptInput
        Value = ''
      end>
    ProviderName = 'dspPesqCli'
    RemoteServer = ConAdmi
    Left = 40
    Top = 112
    object cdsPesqCliCODIGOCLIENTE: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'CODIGOCLIENTE'
      ProviderFlags = [pfInWhere]
    end
    object cdsPesqCliNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object cdsPesqCliFONE: TStringField
      FieldName = 'FONE'
      ProviderFlags = [pfInUpdate]
      Size = 25
    end
    object cdsPesqCliEMAIL: TStringField
      FieldName = 'EMAIL'
      ProviderFlags = [pfInUpdate]
      Size = 25
    end
  end
  object cdsFeriado: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFeriado'
    RemoteServer = ConAdmi
    Left = 112
    Top = 112
    object cdsFeriadoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 25
    end
    object cdsFeriadoDIA: TIntegerField
      FieldName = 'DIA'
      Required = True
    end
    object cdsFeriadoMES: TIntegerField
      FieldName = 'MES'
      Required = True
    end
  end
  object cdsAltTabs: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAltTabs'
    RemoteServer = ConAdmi
    Left = 184
    Top = 112
    object cdsAltTabsNOME_TABELA: TStringField
      FieldName = 'NOME_TABELA'
      Required = True
      Size = 100
    end
    object cdsAltTabsDATA_HORA: TSQLTimeStampField
      FieldName = 'DATA_HORA'
    end
  end
  object cdsFPagto: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFPagto'
    RemoteServer = ConAdmi
    Left = 248
    Top = 112
    object cdsFPagtoCODIGOFORMAPAGAMENTO: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'CODIGOFORMAPAGAMENTO'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
    end
    object cdsFPagtoCODIGOADMCARTAO: TIntegerField
      FieldName = 'CODIGOADMCARTAO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsFPagtoCODIGOFORNECEDOR: TIntegerField
      FieldName = 'CODIGOFORNECEDOR'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsFPagtoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object cdsFPagtoFATOR: TBCDField
      FieldName = 'FATOR'
      ProviderFlags = [pfInUpdate]
      Precision = 9
      Size = 3
    end
    object cdsFPagtoINTERVALO: TIntegerField
      FieldName = 'INTERVALO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsFPagtoPARCELAS: TIntegerField
      FieldName = 'PARCELAS'
      ProviderFlags = [pfInUpdate]
    end
    object cdsFPagtoPRIMEIROVENCTO: TIntegerField
      FieldName = 'PRIMEIROVENCTO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsFPagtoVISTAPARCELADOCARTAO: TStringField
      FieldName = 'VISTAPARCELADOCARTAO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
  end
  object cdsFReceb: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFReceb'
    RemoteServer = ConAdmi
    Left = 312
    Top = 112
    object cdsFRecebCODIGOFORMARECEBIMENTO: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'CODIGOFORMARECEBIMENTO'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
    end
    object cdsFRecebDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object cdsFRecebFATOR: TBCDField
      FieldName = 'FATOR'
      ProviderFlags = [pfInUpdate]
      Precision = 9
      Size = 2
    end
    object cdsFRecebINTERVALO: TIntegerField
      FieldName = 'INTERVALO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsFRecebPARCELAS: TIntegerField
      FieldName = 'PARCELAS'
      ProviderFlags = [pfInUpdate]
    end
    object cdsFRecebPRIMEIROVENCTO: TIntegerField
      FieldName = 'PRIMEIROVENCTO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsFRecebVISTAPARCELADO: TStringField
      FieldName = 'VISTAPARCELADO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
  end
end
