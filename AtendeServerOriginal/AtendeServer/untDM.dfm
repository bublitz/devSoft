object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 339
  Width = 406
  object AtendeTRE: TSQLConnection
    ConnectionName = 'Atende'
    DriverName = 'INTERBASE'
    GetDriverFunc = 'getSQLDriverINTERBASE'
    LibraryName = 'dbxint30.dll'
    LoginPrompt = False
    Params.Strings = (
      'drivername=INTERBASE'
      'blobsize=-1'
      'commitretain=False'
      
        'Database=localhost:C:\Documents and Settings\Jorge\Meus document' +
        'os\RAD Studio\Projects\AtendeServer\Banco\atende.fdb'
      'localecode=0000'
      'password=masterkey'
      'rolename=RoleName'
      'sqldialect=3'
      'interbase transisolation=ReadCommited'
      'user_name=sysdba'
      'waitonlocks=True'
      'trim char=False')
    VendorLib = 'fbclient.dll'
    Left = 42
    Top = 34
  end
  object sqlAtend: TSQLDataSet
    SchemaName = 'sysdba'
    CommandText = 
      'select ESTACAO, FINAL, INICIO, NUMERO, SENHA, USUARIO from ATEND' +
      'IMENTO order by NUMERO'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = AtendeTRE
    Left = 40
    Top = 104
    object sqlAtendNUMERO: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'NUMERO'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object sqlAtendESTACAO: TStringField
      FieldName = 'ESTACAO'
      ProviderFlags = [pfInUpdate]
      Size = 200
    end
    object sqlAtendFINAL: TSQLTimeStampField
      FieldName = 'FINAL'
      ProviderFlags = [pfInUpdate]
    end
    object sqlAtendINICIO: TSQLTimeStampField
      FieldName = 'INICIO'
      ProviderFlags = [pfInUpdate]
    end
    object sqlAtendSENHA: TIntegerField
      FieldName = 'SENHA'
      ProviderFlags = [pfInUpdate]
    end
    object sqlAtendUSUARIO: TStringField
      FieldName = 'USUARIO'
      ProviderFlags = [pfInUpdate]
      Size = 200
    end
  end
  object sqlData: TSQLDataSet
    CommandText = 'select DATA, SENHA_ATUAL from SENHA order by DATA'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = AtendeTRE
    Left = 40
    Top = 168
  end
  object dspData: TDataSetProvider
    DataSet = sqlData
    Left = 120
    Top = 168
  end
  object dspAtend: TDataSetProvider
    DataSet = sqlAtend
    Left = 120
    Top = 104
  end
  object cdsData: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspData'
    Left = 200
    Top = 168
    object cdsDataDATA: TDateField
      FieldName = 'DATA'
      Required = True
    end
    object cdsDataSENHA_ATUAL: TIntegerField
      FieldName = 'SENHA_ATUAL'
    end
  end
  object cdsAtend: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAtend'
    Left = 200
    Top = 104
    object cdsAtendNUMERO: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'NUMERO'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
    end
    object cdsAtendESTACAO: TStringField
      FieldName = 'ESTACAO'
      ProviderFlags = [pfInUpdate]
      Size = 200
    end
    object cdsAtendFINAL: TSQLTimeStampField
      FieldName = 'FINAL'
      ProviderFlags = [pfInUpdate]
    end
    object cdsAtendINICIO: TSQLTimeStampField
      FieldName = 'INICIO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsAtendSENHA: TIntegerField
      FieldName = 'SENHA'
      ProviderFlags = [pfInUpdate]
    end
    object cdsAtendUSUARIO: TStringField
      FieldName = 'USUARIO'
      ProviderFlags = [pfInUpdate]
      Size = 200
    end
  end
end
