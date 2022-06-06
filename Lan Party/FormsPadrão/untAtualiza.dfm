object frmAtualiza: TfrmAtualiza
  Left = 225
  Top = 143
  Width = 696
  Height = 480
  Caption = 'Atualiza ....'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object btnGravar: TBitBtn
    Left = 183
    Top = 409
    Width = 92
    Height = 32
    Caption = '&Gravar'
    TabOrder = 0
    OnClick = btnGravarClick
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 449
    Top = 409
    Width = 92
    Height = 32
    Caption = '&Cancelar'
    TabOrder = 1
    OnClick = BitBtn2Click
    Kind = bkAbort
  end
end
