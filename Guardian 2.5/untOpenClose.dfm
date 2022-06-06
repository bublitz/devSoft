object frmOpenClose: TfrmOpenClose
  Left = 417
  Top = 258
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsToolWindow
  Caption = 'Guardian - Abertura Fechamento Caixa'
  ClientHeight = 196
  ClientWidth = 264
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
    Top = 14
    Width = 49
    Height = 13
    Caption = 'Data Hora'
  end
  object Label3: TLabel
    Left = 10
    Top = 45
    Width = 57
    Height = 13
    Caption = 'Saldo Inicial'
  end
  object Label2: TLabel
    Left = 10
    Top = 80
    Width = 52
    Height = 13
    Caption = 'Saldo Final'
  end
  object Label5: TLabel
    Left = 100
    Top = 74
    Width = 155
    Height = 21
    Alignment = taCenter
    AutoSize = False
    Color = clHighlight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHighlightText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object Label4: TLabel
    Left = 100
    Top = 12
    Width = 155
    Height = 21
    Alignment = taCenter
    AutoSize = False
    Color = clHighlight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHighlightText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object lblMens: TLabel
    Left = 10
    Top = 108
    Width = 245
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = '       '
    Transparent = True
  end
  object CurrencyEdit1: TCurrencyEdit
    Left = 100
    Top = 43
    Width = 155
    Height = 21
    TabStop = False
    AutoSize = False
    BorderStyle = bsNone
    Color = clHighlight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHighlightText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 10
    Top = 145
    Width = 75
    Height = 25
    TabOrder = 1
    OnClick = BitBtn1Click
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 180
    Top = 145
    Width = 75
    Height = 25
    TabOrder = 2
    Kind = bkCancel
  end
end
