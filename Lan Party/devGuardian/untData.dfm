object frmData: TfrmData
  Left = 362
  Top = 300
  BorderStyle = bsNone
  Caption = 'Data'
  ClientHeight = 234
  ClientWidth = 217
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    217
    234)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 38
    Top = 8
    Width = 144
    Height = 13
    Caption = 'Selecione a data para o caixa:'
  end
  object BitBtn1: TBitBtn
    Left = 73
    Top = 200
    Width = 75
    Height = 25
    Cursor = crHandPoint
    Anchors = [akLeft, akBottom]
    TabOrder = 0
    Kind = bkOK
  end
  object MonthCalendar1: TMonthCalendar
    Left = 15
    Top = 33
    Width = 191
    Height = 154
    Date = 37260.4645341898
    TabOrder = 1
  end
end
