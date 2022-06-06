object frmLanctoCaixa: TfrmLanctoCaixa
  Left = 217
  Top = 301
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Guardian - Lançamento Caixa'
  ClientHeight = 183
  ClientWidth = 631
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
  object Bevel1: TBevel
    Left = 65
    Top = 62
    Width = 551
    Height = 55
  end
  object Label3: TLabel
    Left = 8
    Top = 20
    Width = 48
    Height = 13
    Caption = 'Descrição'
    FocusControl = DBEdit1
  end
  object Label4: TLabel
    Left = 87
    Top = 70
    Width = 37
    Height = 13
    Caption = 'Entrada'
    FocusControl = DBEdit2
  end
  object Label5: TLabel
    Left = 487
    Top = 70
    Width = 27
    Height = 13
    Caption = 'Saida'
    FocusControl = DBEdit3
  end
  object Bevel2: TBevel
    Left = 331
    Top = 64
    Width = 50
    Height = 50
    Shape = bsLeftLine
  end
  object DBEdit1: TDBEdit
    Left = 98
    Top = 20
    Width = 500
    Height = 21
    CharCase = ecUpperCase
    DataField = 'DESCRICAO'
    DataSource = dtMod.dsCaixa
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object DBEdit2: TDBEdit
    Left = 87
    Top = 90
    Width = 100
    Height = 21
    CharCase = ecUpperCase
    DataField = 'ENTRADA'
    DataSource = dtMod.dsCaixa
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
  object DBEdit3: TDBEdit
    Left = 487
    Top = 90
    Width = 100
    Height = 21
    CharCase = ecUpperCase
    DataField = 'SAIDA'
    DataSource = dtMod.dsCaixa
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
  end
  object BitBtn1: TBitBtn
    Left = 90
    Top = 134
    Width = 75
    Height = 25
    TabOrder = 3
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 512
    Top = 140
    Width = 75
    Height = 25
    Caption = 'Cancela'
    TabOrder = 4
    Kind = bkCancel
  end
end
