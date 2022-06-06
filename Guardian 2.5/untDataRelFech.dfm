object frmDataFech: TfrmDataFech
  Left = 630
  Top = 208
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Guardian - Caixa'
  ClientHeight = 217
  ClientWidth = 233
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 10
    Top = 10
    Width = 60
    Height = 16
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Data'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 10
    Top = 126
    Width = 60
    Height = 16
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Cópias'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 10
    Top = 70
    Width = 60
    Height = 16
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Período'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object edtData: TDateEdit
    Left = 83
    Top = 8
    Width = 100
    Height = 21
    CheckOnExit = True
    DialogTitle = 'Escolha a Data'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    NumGlyphs = 2
    ParentFont = False
    StartOfWeek = Sun
    YearDigits = dyFour
    TabOrder = 0
    OnExit = edtDataExit
  end
  object BitBtn1: TBitBtn
    Left = 38
    Top = 179
    Width = 75
    Height = 25
    Caption = '&Emitir'
    TabOrder = 3
    OnClick = BitBtn1Click
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 129
    Top = 180
    Width = 75
    Height = 25
    Caption = '&Sair'
    TabOrder = 4
    Kind = bkClose
  end
  object edtCopias: TRxSpinEdit
    Left = 83
    Top = 124
    Width = 72
    Height = 21
    Alignment = taRightJustify
    MaxValue = 10
    MinValue = 1
    Value = 1
    TabOrder = 2
  end
  object cbPeriodo: TComboBox
    Left = 83
    Top = 66
    Width = 145
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemHeight = 16
    ParentFont = False
    TabOrder = 1
    Text = 'cbPeriodo'
  end
end
