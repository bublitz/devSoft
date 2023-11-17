object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 339
  Width = 406
  object cdsData: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 136
    Top = 56
    object cdsDataDATA: TDateTimeField
      FieldName = 'DATA'
    end
    object cdsDataSENHA_ATUAL: TIntegerField
      FieldName = 'SENHA_ATUAL'
    end
    object cdsDataTIPO: TStringField
      FieldName = 'TIPO'
      Size = 1
    end
  end
end
