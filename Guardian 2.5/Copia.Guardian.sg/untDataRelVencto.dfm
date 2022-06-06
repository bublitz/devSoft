object frmDataVencto: TfrmDataVencto
  Left = 454
  Top = 226
  Width = 237
  Height = 161
  Caption = 'Guardian - Socio Bloqueado'
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
    Left = 2
    Top = 10
    Width = 68
    Height = 16
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Data Inicio'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 2
    Top = 50
    Width = 68
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
  end
  object edtData2: TDateEdit
    Left = 83
    Top = 48
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
    TabOrder = 1
  end
  object BitBtn1: TBitBtn
    Left = 32
    Top = 98
    Width = 75
    Height = 25
    Caption = '&Emitir'
    TabOrder = 2
    OnClick = BitBtn1Click
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 123
    Top = 97
    Width = 75
    Height = 25
    Caption = '&Sair'
    TabOrder = 3
    Kind = bkClose
  end
end
