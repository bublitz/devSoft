object frmMain: TfrmMain
  Left = 193
  Top = 111
  Width = 177
  Height = 72
  Caption = 'frmMain'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object WinEnv: TAMWinEnv
    AMReg = AMR
    AppHideOption = [hoTaskbarButton, hoTasklistItem]
    DisableOption = []
    HideOption = []
    IDName = 'ARNFireWall'
    Left = 43
    Top = 2
  end
  object AMR: TAMReg
    Application = 'FireWall'
    Company = 'devSoft'
    Group = 'Software'
    RootKey = HKeyLocalMachine
    Left = 6
    Top = 2
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 15000
    OnTimer = Timer1Timer
    Left = 116
    Top = 2
  end
  object SI: TSysInfo
    Left = 79
    Top = 2
  end
end
