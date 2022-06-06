object Form1: TForm1
  Left = 192
  Top = 107
  Width = 539
  Height = 378
  Caption = 'devSoft Contra Senha'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 116
    Top = 11
    Width = 84
    Height = 13
    Caption = 'Informe os dados:'
  end
  object LabKey1: TLabel
    Left = 18
    Top = 304
    Width = 80
    Height = 30
    Alignment = taCenter
    Caption = '12345'
    Color = clNavy
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -27
    Font.Name = 'Fixedsys'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object LabKey2: TLabel
    Left = 121
    Top = 304
    Width = 80
    Height = 30
    Alignment = taCenter
    Caption = '12345'
    Color = clNavy
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -27
    Font.Name = 'Fixedsys'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object LabKey3: TLabel
    Left = 225
    Top = 304
    Width = 80
    Height = 30
    Alignment = taCenter
    Caption = '12345'
    Color = clNavy
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -27
    Font.Name = 'Fixedsys'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object LabKey4: TLabel
    Left = 328
    Top = 304
    Width = 80
    Height = 30
    Alignment = taCenter
    Caption = '12345'
    Color = clNavy
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -27
    Font.Name = 'Fixedsys'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object LabKey5: TLabel
    Left = 432
    Top = 305
    Width = 80
    Height = 30
    Alignment = taCenter
    Caption = '12345'
    Color = clNavy
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -27
    Font.Name = 'Fixedsys'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Values: TValueListEditor
    Left = 117
    Top = 35
    Width = 305
    Height = 212
    Color = clBtnFace
    DisplayOptions = [doAutoColResize, doKeyColFixed]
    Strings.Strings = (
      'Nome Empresa='
      'Produto='
      'Vers'#227'o='
      'Data (dd/mm/aaaa)='
      'Hora (hh:mm:ss)='
      'Computador='
      'Usu'#225'rio Windows='
      'Empresa Windows='
      'Chave 1= '
      'Chave 2='
      'Chave 3=')
    TabOrder = 0
    ColWidths = (
      150
      149)
  end
  object BitBtn1: TBitBtn
    Left = 200
    Top = 253
    Width = 136
    Height = 35
    Caption = 'Gera Contra Senha'
    Default = True
    TabOrder = 1
    OnClick = BitBtn1Click
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
end
