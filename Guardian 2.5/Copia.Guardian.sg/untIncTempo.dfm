object frmIncTempo: TfrmIncTempo
  Left = 405
  Top = 265
  BorderStyle = bsToolWindow
  Caption = 'Adicionar tempo...'
  ClientHeight = 145
  ClientWidth = 351
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 10
    Top = 13
    Width = 144
    Height = 20
    Alignment = taRightJustify
    Caption = 'Tempo Solicitado:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DBText2: TDBText
    Left = 162
    Top = 14
    Width = 179
    Height = 18
    Color = clHighlight
    DataField = 'TempoDisp'
    DataSource = dtMod.dsMicro
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHighlightText
    Font.Height = -16
    Font.Name = 'Courier New'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Label1: TLabel
    Left = 16
    Top = 54
    Width = 138
    Height = 20
    Alignment = taRightJustify
    Caption = 'Tempo Adicional:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 249
    Top = 56
    Width = 29
    Height = 16
    Alignment = taRightJustify
    Caption = 'min.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object cboxTempo: TComboBox
    Left = 159
    Top = 50
    Width = 85
    Height = 28
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemHeight = 20
    ParentFont = False
    TabOrder = 0
    Text = '30'
    Items.Strings = (
      '5'
      '10'
      '15'
      '20'
      '30'
      '40'
      '60'
      '90'
      '120')
  end
  object BitBtn1: TBitBtn
    Left = 43
    Top = 98
    Width = 92
    Height = 28
    TabOrder = 1
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 217
    Top = 98
    Width = 92
    Height = 28
    Caption = 'Cancela'
    TabOrder = 2
    Kind = bkCancel
  end
end
