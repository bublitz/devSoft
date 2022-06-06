object frmPrincipal: TfrmPrincipal
  Left = 188
  Top = 107
  Width = 414
  Height = 316
  Caption = 'Configura'#231#227'o ConVel'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object ValList: TValueListEditor
    Left = 13
    Top = 5
    Width = 379
    Height = 212
    KeyOptions = [keyUnique]
    Strings.Strings = (
      'CompPass='
      'LocalApp='
      'RemotApp='
      'LocalRep='
      'Banco='
      'UserName='
      'UserPass='
      'Regional='
      'Setor='
      'Path=')
    TabOrder = 0
    TitleCaptions.Strings = (
      'Chave'
      'Valor')
    ColWidths = (
      150
      223)
  end
  object Button1: TButton
    Left = 165
    Top = 245
    Width = 75
    Height = 25
    Caption = '&Salvar'
    TabOrder = 1
    OnClick = Button1Click
  end
end
