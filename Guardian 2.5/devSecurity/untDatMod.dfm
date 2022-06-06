object dtMod: TdtMod
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 424
  Top = 210
  Height = 260
  Width = 447
  object dsLocal: TDataSource
    DataSet = Local
    Left = 112
    Top = 34
  end
  object Local: TTable
    DatabaseName = 'c:\windows'
    TableName = 'Icones.DB'
    Left = 60
    Top = 35
    object LocalNome: TStringField
      FieldName = 'Nome'
      Size = 50
    end
    object LocalIcone: TStringField
      FieldName = 'Icone'
      Size = 100
    end
    object LocalMSDOS: TStringField
      FieldName = 'MSDOS'
      Size = 1
    end
    object LocalAtalho: TStringField
      FieldName = 'Atalho'
      Size = 200
    end
  end
end
