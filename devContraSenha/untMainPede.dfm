object Form1: TForm1
  Left = 192
  Top = 107
  Width = 539
  Height = 395
  Caption = 'devSoft Pede Contra Senha'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 11
    Width = 84
    Height = 13
    Caption = 'Informe os dados:'
  end
  object Label2: TLabel
    Left = 17
    Top = 252
    Width = 131
    Height = 13
    Caption = 'Digite a chave de ativa'#231#227'o:'
  end
  object Values: TValueListEditor
    Left = 16
    Top = 27
    Width = 488
    Height = 212
    Color = clBtnFace
    DisplayOptions = [doAutoColResize, doKeyColFixed]
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    KeyOptions = [keyEdit]
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goAlwaysShowEditor, goThumbTracking]
    ParentFont = False
    Strings.Strings = (
      'Nome Empresa='
      'Produto='
      'Vers'#227'o='
      'Data='
      'Hora='
      'Computador='
      'Usu'#225'rio Windows='
      'Empresa Windows='
      'Chave 1 (W)= '
      'Chave 2 (H)='
      'Chave 3 (A)=')
    TabOrder = 6
    ColWidths = (
      150
      332)
  end
  object BitBtn1: TBitBtn
    Left = 199
    Top = 324
    Width = 136
    Height = 35
    Caption = 'OK'
    Default = True
    TabOrder = 5
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
  object Edit1: TEdit
    Left = 18
    Top = 273
    Width = 89
    Height = 38
    CharCase = ecUpperCase
    Color = clNavy
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -27
    Font.Name = 'Fixedsys'
    Font.Style = []
    MaxLength = 5
    ParentFont = False
    TabOrder = 0
    OnChange = Edit1Change
  end
  object Edit2: TEdit
    Left = 122
    Top = 273
    Width = 89
    Height = 38
    CharCase = ecUpperCase
    Color = clNavy
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -27
    Font.Name = 'Fixedsys'
    Font.Style = []
    MaxLength = 5
    ParentFont = False
    TabOrder = 1
    OnChange = Edit1Change
  end
  object Edit3: TEdit
    Left = 224
    Top = 273
    Width = 89
    Height = 38
    CharCase = ecUpperCase
    Color = clNavy
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -27
    Font.Name = 'Fixedsys'
    Font.Style = []
    MaxLength = 5
    ParentFont = False
    TabOrder = 2
    OnChange = Edit1Change
  end
  object Edit4: TEdit
    Left = 327
    Top = 273
    Width = 89
    Height = 38
    CharCase = ecUpperCase
    Color = clNavy
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -27
    Font.Name = 'Fixedsys'
    Font.Style = []
    MaxLength = 5
    ParentFont = False
    TabOrder = 3
    OnChange = Edit1Change
  end
  object Edit5: TEdit
    Left = 431
    Top = 273
    Width = 89
    Height = 38
    CharCase = ecUpperCase
    Color = clNavy
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -27
    Font.Name = 'Fixedsys'
    Font.Style = []
    MaxLength = 5
    ParentFont = False
    TabOrder = 4
    OnChange = Edit1Change
  end
  object Button1: TButton
    Left = 506
    Top = 28
    Width = 21
    Height = 21
    Hint = 'Digitar Nome da Empresa'
    Caption = '...'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
    OnClick = FormShow
  end
end
