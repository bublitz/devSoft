object dtMod: TdtMod
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 0
  Width = 0
  object WinEnv: TAMWinEnv
    AMReg = AMR
    AppHideOption = [hoTaskbarButton, hoTasklistItem]
    DisableOption = []
    HideOption = []
    IDName = 'ARNFireWall'
    Left = 70
    Top = 30
  end
  object AMR: TAMReg
    Application = 'FireWall'
    Company = 'Drache/Snake'
    Group = 'Software'
    RootKey = HKeyLocalMachine
    Left = 36
    Top = 30
  end
  object DataSource1: TDataSource
    DataSet = tbMicro
    Left = 104
    Top = 30
  end
  object tbMicro: TTable
    DatabaseName = 'Guardian'
    TableName = 'Micro.DB'
    Left = 138
    Top = 30
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 172
    Top = 28
  end
  object RxTrayIcon1: TRxTrayIcon
    Left = 214
    Top = 34
  end
end
