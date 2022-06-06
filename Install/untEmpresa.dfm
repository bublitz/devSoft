object frmEmpresa: TfrmEmpresa
  Left = 410
  Top = 335
  BorderStyle = bsDialog
  Caption = 'Escolha a empresa...'
  ClientHeight = 175
  ClientWidth = 373
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
  object BitBtn1: TBitBtn
    Left = 154
    Top = 141
    Width = 75
    Height = 25
    TabOrder = 0
    Kind = bkOK
  end
  object grpEmpresa: TRadioGroup
    Left = 40
    Top = 14
    Width = 284
    Height = 105
    ItemIndex = 0
    Items.Strings = (
      'Lan Party - Shopping Goiabeiras'
      'Lan Party - Boa Esperan'#231'a'
      'Lan Party - Shopping Tr'#234's Am'#233'ricas')
    TabOrder = 1
  end
end
