object frmGeraBoleto: TfrmGeraBoleto
  Left = 314
  Top = 354
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Guardain - Gera Boleto'
  ClientHeight = 157
  ClientWidth = 405
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 405
    Height = 157
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvSpace
    TabOrder = 0
    object SpeedButton1: TSpeedButton
      Left = 95
      Top = 6
      Width = 220
      Height = 39
      Caption = '&Gera Boleto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Glyph.Data = {
        22030000424D2203000000000000760000002800000048000000130000000100
        040000000000AC02000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00666668866666
        666666666668F666666666666666622666666666666666688666666666666666
        844866666666666666888F666666666666662AA2666666666666668448666666
        666666684444866666666666688888F6666666666662AAAA2666666666666844
        448666666666668444444866666666668888888F66666666662AAAAAA2666666
        6666844444486666666668444C4444866666666888878888F666666662AAA2AA
        AA2666666668444C4444866666666444C4C444866666666888787888F6666666
        6AAA2A2AAA266666666444C4C444866666666C4C444C44486666666787888788
        8F66666662A2AAA2AAA26666666C4C444C444866666668C44444C44486666668
        7888887888F66666622AAAAA2AAA26666668C44444C4448666668444C4444C44
        4866668888788887888F66662AAA2AAAA2AAA266668444C4444C44486666444C
        6C4448C444866688876788887888F666AAA262AAA22AAA2666444C6C4448C444
        8666C4C666C4448C444866787666788887888F662A26662AAA22AAA266C4C666
        C4448C4448666C66666C4448C444866766666788887888F662666662AAA22AAA
        266C66666C4448C4448666666666C4448C44866666666678888788F666666666
        2AAA22AA2666666666C4448C4486666666666C4448C446666666666788887886
        6666666662AAA22AA6666666666C4448C4466666666666C4448C666666666666
        78888F6666666666662AAA22666666666666C4448C6666666666666C44486666
        6666666667888F66666666666662AAA26666666666666C444866666666666666
        C44866666666666666788F666666666666662AA266666666666666C448666666
        666666666C446666666666666667886666666666666662AA666666666666666C
        446666666666666666C666666666666666667666666666666666662666666666
        66666666C666}
      ParentFont = False
      OnClick = SpeedButton1Click
    end
    object BitBtn1: TBitBtn
      Left = 168
      Top = 48
      Width = 75
      Height = 25
      Caption = '&Sair'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      Kind = bkClose
    end
    object Pbar: TProgressBar
      Left = 2
      Top = 78
      Width = 401
      Height = 16
      Align = alBottom
      Min = 0
      Max = 100
      TabOrder = 1
    end
    object Panel2: TPanel
      Left = 2
      Top = 94
      Width = 401
      Height = 61
      Align = alBottom
      BevelInner = bvLowered
      BevelWidth = 2
      BorderWidth = 1
      BorderStyle = bsSingle
      Color = clBlack
      TabOrder = 2
      object Label3: TLabel
        Left = 5
        Top = 5
        Width = 387
        Height = 47
        Align = alClient
        Alignment = taCenter
        Caption = '             '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
  end
end
