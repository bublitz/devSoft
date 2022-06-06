object dmConf: TdmConf
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 208
  Top = 107
  Height = 480
  Width = 696
  object dsUser: TDataSource
    DataSet = tbUser
    Left = 28
    Top = 79
  end
  object dtBase: TIBDatabase
    Connected = True
    DatabaseName = 'F:\Projects\Adme4\Dados\ADME.GDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    IdleTimer = 0
    SQLDialect = 1
    TraceFlags = []
    Left = 28
    Top = 12
  end
  object IBTrans: TIBTransaction
    Active = False
    DefaultDatabase = dtBase
    Left = 86
    Top = 12
  end
  object tbUser: TIBTable
    Database = dtBase
    Transaction = IBTrans
    AfterScroll = tbUserAfterScroll
    CachedUpdates = False
    TableName = 'USUARIO'
    Left = 86
    Top = 79
    object tbUserCODIGOEMPRESA: TIntegerField
      FieldName = 'CODIGOEMPRESA'
    end
    object tbUserMATRICULA: TIBStringField
      FieldName = 'MATRICULA'
      Size = 25
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
    object tbUserDIREITOS: TIBStringField
      FieldName = 'DIREITOS'
      Size = 75
    end
    object tbUserNIVEL: TIBStringField
      FieldName = 'NIVEL'
      Size = 1
    end
    object tbUserNOMEEMPRESA: TIBStringField
      FieldKind = fkLookup
      FieldName = 'NOMEEMPRESA'
      LookupDataSet = tbEmpresa
      LookupKeyFields = 'CODIGOEMPRESA'
      LookupResultField = 'NOME'
      KeyFields = 'CODIGOEMPRESA'
      Size = 50
      Lookup = True
    end
  end
  object dsEmpresa: TDataSource
    DataSet = tbEmpresa
    Left = 28
    Top = 146
  end
  object tbEmpresa: TIBTable
    Database = dtBase
    Transaction = IBTrans
    AfterScroll = tbUserAfterScroll
    CachedUpdates = False
    TableName = 'EMPRESA'
    Left = 86
    Top = 146
    object tbEmpresaCODIGOEMPRESA: TIntegerField
      FieldName = 'CODIGOEMPRESA'
    end
    object tbEmpresaNOME: TIBStringField
      FieldName = 'NOME'
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
      Size = 10
    end
    object tbEmpresaUF: TIBStringField
      FieldName = 'UF'
      Size = 2
    end
    object tbEmpresaFONE: TIBStringField
      FieldName = 'FONE'
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
    object tbEmpresaEMAIL: TIBStringField
      FieldName = 'EMAIL'
      Size = 25
    end
  end
end
