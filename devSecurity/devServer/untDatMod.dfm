object dtMod: TdtMod
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 192
  Top = 107
  Height = 315
  Width = 183
  object dsUser: TDataSource
    DataSet = tbUser
    Left = 22
    Top = 25
  end
  object dsEstacao: TDataSource
    DataSet = tbEstacao
    Left = 22
    Top = 98
  end
  object tbUser: TTable
    TableName = 'User.db'
    Left = 93
    Top = 25
    object tbUserCodigoUser: TAutoIncField
      FieldName = 'CodigoUser'
      ReadOnly = True
    end
    object tbUserNomeCompleto: TStringField
      FieldName = 'NomeCompleto'
      Size = 35
    end
    object tbUserNomeLogin: TStringField
      FieldName = 'NomeLogin'
    end
    object tbUserSenha: TStringField
      FieldName = 'Senha'
    end
  end
  object tbEstacao: TTable
    TableName = 'Estacao.db'
    Left = 92
    Top = 98
    object tbEstacaoCodigoEstacao: TAutoIncField
      FieldName = 'CodigoEstacao'
      ReadOnly = True
    end
    object tbEstacaoDescricao: TStringField
      FieldName = 'Descricao'
    end
    object tbEstacaoIP: TStringField
      FieldName = 'IP'
    end
    object tbEstacaoHoraDomI: TTimeField
      FieldName = 'HoraDomI'
    end
    object tbEstacaoHoraDomF: TTimeField
      FieldName = 'HoraDomF'
    end
    object tbEstacaoHoraSegSexI: TTimeField
      FieldName = 'HoraSegSexI'
    end
    object tbEstacaoHoraSegSexF: TTimeField
      FieldName = 'HoraSegSexF'
    end
    object tbEstacaoHoraSabI: TTimeField
      FieldName = 'HoraSabI'
    end
    object tbEstacaoHoraSabF: TTimeField
      FieldName = 'HoraSabF'
    end
  end
  object dsLog: TDataSource
    DataSet = tbLog
    Left = 22
    Top = 171
  end
  object tbLog: TTable
    DatabaseName = 'E:\Projetos\devSoft\devSecurity\devServer'
    TableName = 'Log.db'
    Left = 94
    Top = 171
    object tbLogCodigoUser: TIntegerField
      FieldName = 'CodigoUser'
    end
    object tbLogCodigoEstacao: TIntegerField
      FieldName = 'CodigoEstacao'
    end
    object tbLogData: TDateField
      FieldName = 'Data'
    end
    object tbLogHora: TTimeField
      FieldName = 'Hora'
    end
    object tbLogDescricao: TStringField
      FieldName = 'Descricao'
      Size = 100
    end
  end
end
