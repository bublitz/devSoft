object dmPrinc: TdmPrinc
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 206
  Top = 114
  Height = 297
  Width = 358
  object SQLCon: TSQLConnection
    ConnectionName = 'ConVel'
    DriverName = 'Interbase'
    GetDriverFunc = 'getSQLDriverINTERBASE'
    LibraryName = 'dbexpint.dll'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=Interbase'
      'BlobSize=-1'
      'CommitRetain=False'
      'Database=D:\Sistema ConVel\Dados\Bublitz.gdb'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'Password=476096'
      'RoleName=RoleName'
      'ServerCharSet='
      'SQLDialect=3'
      'Interbase TransIsolation=ReadCommited'
      'User_Name=sysdba'
      'WaitOnLocks=True')
    VendorLib = 'GDS32.DLL'
    Left = 14
    Top = 7
  end
  object sqlMarca: TSQLClientDataSet
    CommandText = 
      'select CODIGOMARCA, DESCRICAO, SIGLA '#13#10'from MARCA'#13#10'order by SIGL' +
      'A'
    Aggregates = <>
    Options = [poAllowCommandText]
    ObjectView = True
    Params = <>
    DBConnection = SQLCon
    Left = 75
    Top = 72
    object sqlMarcaCODIGOMARCA: TIntegerField
      FieldName = 'CODIGOMARCA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlMarcaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 52
    end
    object sqlMarcaSIGLA: TStringField
      FieldName = 'SIGLA'
      Size = 7
    end
  end
  object dsMarca: TDataSource
    DataSet = sqlMarca
    Left = 11
    Top = 70
  end
  object dsModelo: TDataSource
    DataSet = sqlModelo
    Left = 11
    Top = 126
  end
  object sqlModelo: TSQLClientDataSet
    CommandText = 
      'select CODIGOMODELO, CODIGOMARCA, DESCRICAO'#13#10'from MODELO'#13#10'order ' +
      'by DESCRICAO'
    Aggregates = <>
    Options = [poAllowCommandText]
    ObjectView = True
    Params = <>
    OnCalcFields = sqlModeloCalcFields
    DBConnection = SQLCon
    Left = 76
    Top = 132
    object sqlModeloCODIGOMODELO: TIntegerField
      FieldName = 'CODIGOMODELO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlModeloCODIGOMARCA: TIntegerField
      FieldName = 'CODIGOMARCA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlModeloDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 52
    end
    object sqlModeloDESCMODELO: TStringField
      FieldKind = fkLookup
      FieldName = 'DESCMODELO'
      LookupDataSet = sqlMarca
      LookupKeyFields = 'CODIGOMARCA'
      LookupResultField = 'SIGLA'
      KeyFields = 'CODIGOMARCA'
      Lookup = True
    end
    object sqlModeloDESCCOMPLETA: TStringField
      FieldKind = fkCalculated
      FieldName = 'DESCCOMPLETA'
      Calculated = True
    end
  end
  object dsVeic: TDataSource
    DataSet = sqlVeic
    Left = 11
    Top = 184
  end
  object sqlVeic: TSQLClientDataSet
    CommandText = 
      'select CODIGOVEICULO, CODIGOMODELO, DESCRICAO, ANO, PLACA, UF, U' +
      'LTIMATROCA, LITROSCARTER, LITROSFILTRO, PROXIMATROCA, TROCACOMFI' +
      'LTRO from VEICULO'#13#10'order by DESCRICAO'
    Aggregates = <>
    Options = [poAllowCommandText]
    ObjectView = True
    Params = <>
    OnCalcFields = sqlVeicCalcFields
    DBConnection = SQLCon
    Left = 72
    Top = 183
    object sqlVeicCODIGOVEICULO: TIntegerField
      FieldName = 'CODIGOVEICULO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlVeicCODIGOMODELO: TIntegerField
      FieldName = 'CODIGOMODELO'
    end
    object sqlVeicDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 52
    end
    object sqlVeicANO: TIntegerField
      FieldName = 'ANO'
    end
    object sqlVeicPLACA: TStringField
      FieldName = 'PLACA'
      Size = 10
    end
    object sqlVeicUF: TStringField
      FieldName = 'UF'
      Size = 4
    end
    object sqlVeicULTIMATROCA: TIntegerField
      FieldName = 'ULTIMATROCA'
    end
    object sqlVeicLITROSCARTER: TFloatField
      FieldName = 'LITROSCARTER'
    end
    object sqlVeicLITROSFILTRO: TFloatField
      FieldName = 'LITROSFILTRO'
    end
    object sqlVeicPROXIMATROCA: TIntegerField
      FieldName = 'PROXIMATROCA'
    end
    object sqlVeicTROCACOMFILTRO: TStringField
      FieldName = 'TROCACOMFILTRO'
      Size = 3
    end
    object sqlVeicDESCMODELO: TStringField
      FieldKind = fkLookup
      FieldName = 'DESCMODELO'
      LookupDataSet = sqlModelo
      LookupKeyFields = 'CODIGOMODELO'
      LookupResultField = 'DESCCOMPLETA'
      KeyFields = 'CODIGOMODELO'
      Lookup = True
    end
    object sqlVeicDESCCOMPLETA: TStringField
      FieldKind = fkCalculated
      FieldName = 'DESCCOMPLETA'
      Size = 100
      Calculated = True
    end
  end
end
