object DM: TDM
  OldCreateOrder = False
  Pooled = False
  Height = 563
  Width = 682
  object dspPesqCli: TDataSetProvider
    DataSet = sqlPesqCli
    Left = 24
    Top = 152
  end
  object SQLCon: TSQLConnection
    ConnectionName = 'ADMI'
    DriverName = 'Interbase'
    GetDriverFunc = 'getSQLDriverINTERBASE'
    LibraryName = 'dbexpUIBfire15.dll'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=Interbase'
      
        'Database=localhost:C:\Documents and Settings\Jorge Luis\Meus doc' +
        'umentos\Projeto Itira\Banco\admi-2.0.fdb'
      'RoleName=RoleName'
      'User_Name=sysdba'
      'Password=masterkey'
      'ServerCharSet='
      'SQLDialect=3'
      'BlobSize=-1'
      'CommitRetain=False'
      'WaitOnLocks=True'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'Interbase TransIsolation=ReadCommited'
      'Trim Char=False')
    VendorLib = 'C:\Arquivos de programas\Firebird\Firebird_2_0\bin\fbclient.dll'
    Connected = True
    Left = 24
    Top = 16
  end
  object sqlPesqCli: TSQLDataSet
    SchemaName = 'sysdba'
    CommandText = 
      'select c.CODIGOCLIENTE, c.NOME, c.FONE, c.EMAIL'#13#10'from CLIENTE c'#13 +
      #10'where NOME like :pnome'#13#10'order by NOME'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'pnome'
        ParamType = ptInput
        Value = ''
      end>
    SQLConnection = SQLCon
    Left = 24
    Top = 88
    object sqlPesqCliCODIGOCLIENTE: TIntegerField
      FieldName = 'CODIGOCLIENTE'
      Required = True
    end
    object sqlPesqCliNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
    object sqlPesqCliFONE: TStringField
      FieldName = 'FONE'
      Size = 25
    end
    object sqlPesqCliEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 25
    end
  end
  object sqlAltTabs: TSQLDataSet
    SchemaName = 'sysdba'
    CommandText = 
      'select NOME_TABELA, DATA_HORA from ALTER_TABS order by NOME_TABE' +
      'LA'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLCon
    Left = 94
    Top = 88
    object sqlAltTabsNOME_TABELA: TStringField
      FieldName = 'NOME_TABELA'
      Required = True
      Size = 100
    end
    object sqlAltTabsDATA_HORA: TSQLTimeStampField
      FieldName = 'DATA_HORA'
    end
  end
  object dspAltTabs: TDataSetProvider
    DataSet = sqlAltTabs
    Left = 94
    Top = 152
  end
  object sqlFeriado: TSQLDataSet
    SchemaName = 'sysdba'
    CommandText = 'select DESCRICAO, DIA, MES from FERIADO'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLCon
    Left = 164
    Top = 88
  end
  object dspFeriado: TDataSetProvider
    DataSet = sqlFeriado
    Left = 164
    Top = 152
  end
  object sqlFPagto: TSQLDataSet
    SchemaName = 'SYSDBA'
    CommandText = 
      'select CODIGOADMCARTAO, CODIGOFORMAPAGAMENTO, CODIGOFORNECEDOR, ' +
      'DESCRICAO, FATOR, INTERVALO, PARCELAS, PRIMEIROVENCTO, VISTAPARC' +
      'ELADOCARTAO from FORMAPAGAMENTO order by DESCRICAO'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLCon
    Left = 234
    Top = 88
    object sqlFPagtoCODIGOFORMAPAGAMENTO: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'CODIGOFORMAPAGAMENTO'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
    end
    object sqlFPagtoCODIGOADMCARTAO: TIntegerField
      FieldName = 'CODIGOADMCARTAO'
      ProviderFlags = [pfInUpdate]
    end
    object sqlFPagtoCODIGOFORNECEDOR: TIntegerField
      FieldName = 'CODIGOFORNECEDOR'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sqlFPagtoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object sqlFPagtoFATOR: TBCDField
      FieldName = 'FATOR'
      ProviderFlags = [pfInUpdate]
      Precision = 9
      Size = 3
    end
    object sqlFPagtoINTERVALO: TIntegerField
      FieldName = 'INTERVALO'
      ProviderFlags = [pfInUpdate]
    end
    object sqlFPagtoPARCELAS: TIntegerField
      FieldName = 'PARCELAS'
      ProviderFlags = [pfInUpdate]
    end
    object sqlFPagtoPRIMEIROVENCTO: TIntegerField
      FieldName = 'PRIMEIROVENCTO'
      ProviderFlags = [pfInUpdate]
    end
    object sqlFPagtoVISTAPARCELADOCARTAO: TStringField
      FieldName = 'VISTAPARCELADOCARTAO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
  end
  object SQLDataSet2: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLCon
    Left = 418
    Top = 256
  end
  object SQLDataSet4: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLCon
    Left = 484
    Top = 256
  end
  object SQLDataSet6: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLCon
    Left = 550
    Top = 256
  end
  object SQLDataSet7: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLCon
    Left = 352
    Top = 256
  end
  object SQLDataSet8: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLCon
    Left = 89
    Top = 256
  end
  object SQLDataSet9: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLCon
    Left = 24
    Top = 256
  end
  object SQLDataSet10: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLCon
    Left = 155
    Top = 256
  end
  object SQLDataSet11: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLCon
    Left = 287
    Top = 256
  end
  object SQLDataSet12: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLCon
    Left = 221
    Top = 256
  end
  object SQLDataSet13: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLCon
    Left = 616
    Top = 256
  end
  object dqlFRecb: TSQLDataSet
    SchemaName = 'sysdba'
    CommandText = 
      'select CODIGOFORMARECEBIMENTO, DESCRICAO, FATOR, INTERVALO, PARC' +
      'ELAS, PRIMEIROVENCTO, VISTAPARCELADO from FORMARECEBIMENTO order' +
      ' by DESCRICAO'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLCon
    Left = 304
    Top = 88
    object dqlFRecbCODIGOFORMARECEBIMENTO: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'CODIGOFORMARECEBIMENTO'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
    end
    object dqlFRecbDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object dqlFRecbFATOR: TBCDField
      FieldName = 'FATOR'
      ProviderFlags = [pfInUpdate]
      Precision = 9
      Size = 2
    end
    object dqlFRecbINTERVALO: TIntegerField
      FieldName = 'INTERVALO'
      ProviderFlags = [pfInUpdate]
    end
    object dqlFRecbPARCELAS: TIntegerField
      FieldName = 'PARCELAS'
      ProviderFlags = [pfInUpdate]
    end
    object dqlFRecbPRIMEIROVENCTO: TIntegerField
      FieldName = 'PRIMEIROVENCTO'
      ProviderFlags = [pfInUpdate]
    end
    object dqlFRecbVISTAPARCELADO: TStringField
      FieldName = 'VISTAPARCELADO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
  end
  object DataSetProvider2: TDataSetProvider
    Left = 484
    Top = 328
  end
  object DataSetProvider3: TDataSetProvider
    Left = 418
    Top = 328
  end
  object DataSetProvider4: TDataSetProvider
    Left = 550
    Top = 328
  end
  object DataSetProvider8: TDataSetProvider
    Left = 155
    Top = 328
  end
  object DataSetProvider9: TDataSetProvider
    Left = 89
    Top = 328
  end
  object DataSetProvider10: TDataSetProvider
    Left = 24
    Top = 328
  end
  object DataSetProvider11: TDataSetProvider
    Left = 221
    Top = 328
  end
  object DataSetProvider13: TDataSetProvider
    Left = 352
    Top = 328
  end
  object DataSetProvider14: TDataSetProvider
    Left = 287
    Top = 328
  end
  object DataSetProvider15: TDataSetProvider
    Left = 616
    Top = 328
  end
  object dspFReceb: TDataSetProvider
    DataSet = dqlFRecb
    Left = 304
    Top = 152
  end
  object dspFPagto: TDataSetProvider
    DataSet = sqlFPagto
    Left = 234
    Top = 152
  end
end
