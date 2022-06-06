object frmHoje: TfrmHoje
  Left = 436
  Top = 253
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Confirme a Data Atual'
  ClientHeight = 91
  ClientWidth = 226
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object StaticText1: TStaticText
    Left = 6
    Top = 6
    Width = 57
    Height = 17
    Caption = 'Data Atual:'
    TabOrder = 0
  end
  object edtDate1: TDateTimePicker
    Left = 72
    Top = 4
    Width = 136
    Height = 21
    CalAlignment = dtaLeft
    Date = 0.415466504629876
    Time = 0.415466504629876
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 1
  end
  object BitBtn1: TBitBtn
    Left = 74
    Top = 50
    Width = 75
    Height = 25
    TabOrder = 2
    Kind = bkOK
  end
end
