object frmDataRelPeriodo: TfrmDataRelPeriodo
  Left = 430
  Top = 220
  BorderStyle = bsSingle
  Caption = 'Guardian - Caixa por Período'
  ClientHeight = 217
  ClientWidth = 240
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 10
    Top = 10
    Width = 100
    Height = 16
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Data Inicial'
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
    Width = 100
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
    Top = 64
    Width = 100
    Height = 16
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Data Final'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object edtData1: TDateEdit
    Left = 122
    Top = 8
    Width = 100
    Height = 21
    CheckOnExit = True
    DefaultToday = True
    DialogTitle = 'Escolha a Data'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    NumGlyphs = 2
    ParentFont = False
    YearDigits = dyFour
    TabOrder = 0
    Text = '15/08/2001'
  end
  object BitBtn1: TBitBtn
    Left = 38
    Top = 179
    Width = 75
    Height = 25
    Caption = '&Emitir'
    TabOrder = 1
    OnClick = BitBtn1Click
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 129
    Top = 180
    Width = 75
    Height = 25
    Caption = '&Sair'
    TabOrder = 2
    Kind = bkClose
  end
  object edtCopias: TRxSpinEdit
    Left = 122
    Top = 124
    Width = 72
    Height = 21
    Alignment = taRightJustify
    MaxValue = 10
    MinValue = 1
    Value = 1
    TabOrder = 3
  end
  object edtData2: TDateEdit
    Left = 122
    Top = 62
    Width = 100
    Height = 21
    CheckOnExit = True
    DefaultToday = True
    DialogTitle = 'Escolha a Data'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    NumGlyphs = 2
    ParentFont = False
    YearDigits = dyFour
    TabOrder = 4
    Text = '15/08/2001'
  end
end
