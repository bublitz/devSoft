object frmMain: TfrmMain
  Left = 192
  Top = 107
  Width = 408
  Height = 375
  Caption = 'Testa travas'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object btnOn: TButton
    Left = 6
    Top = 4
    Width = 75
    Height = 25
    Caption = 'Liga'
    TabOrder = 0
    OnClick = btnOnClick
  end
  object btnOff: TButton
    Left = 6
    Top = 36
    Width = 75
    Height = 25
    Caption = 'Desliga'
    TabOrder = 1
    OnClick = btnOffClick
  end
  object memAction: TMemo
    Left = 90
    Top = 4
    Width = 305
    Height = 339
    TabOrder = 2
  end
end
