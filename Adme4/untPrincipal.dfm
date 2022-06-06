object frmPrincipal: TfrmPrincipal
  Left = 214
  Top = 122
  Width = 696
  Height = 480
  BorderIcons = [biMinimize, biMaximize]
  Caption = 'devSoft Adme 4.0'
  Color = clGray
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesktopCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Toolbar: TSpeedBar
    Left = 0
    Top = 0
    Width = 688
    Height = 56
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBtnText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [sbAllowDrag, sbAllowResize, sbFlatBtns, sbGrayedBtns, sbTransparentBtns]
    BtnOffsetHorz = 8
    BtnOffsetVert = 3
    BtnWidth = 54
    BtnHeight = 50
    Version = 3
    BevelInner = bvLowered
    BevelOuter = bvNone
    TabOrder = 0
    InternalVer = 1
    object SpeedbarSection1: TSpeedbarSection
      Caption = 'File'
    end
    object SpeedbarSection2: TSpeedbarSection
      Caption = 'View'
    end
    object SpeedbarSection4: TSpeedbarSection
      Caption = 'Help'
    end
    object CustomizeBtn: TSpeedItem
      BtnCaption = 'Financeiro'
      Caption = 'Financeiro'
      Enabled = False
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555500000
        55555555000BB3B30555555030BB3303305555030BB0B3B3330555033BBBB333
        330550B3B3BB3BB3B33050B3B33BBBBB333050B3B33BBBBB3B3050B3B333BB0B
        33B050B33333BBB3B3B050BB33333333BB05550B33B3333BB305550BB33330BB
        B0555550BB33B3BB0555555500B3333055555555550000055555}
      Hint = 'Contas a Pagar'#13#10'Contas a Receber'#13#10'Bancos'#13#10'Fluxo de Caixa'
      Spacing = 3
      Left = 233
      Top = 3
      Visible = True
      WordWrap = True
      SectionName = 'File'
    end
    object ExitBtn: TSpeedItem
      BtnCaption = 'Sair'
      Caption = 'Sair'
      Glyph.Data = {
        66010000424D6601000000000000760000002800000014000000140000000100
        040000000000F000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDDDDD0000777777777777777DDDD7000077777777777777FDFD7700007777
        777777777F3F37770000444444077777FFF4444D0000DDDDD450777F3FF4DDDD
        0000DDDDD45507FFFFF4DDDD0000DDDDD45550FFFFF4DDDD0000DDD0045550FF
        FFF4DDDD0000DDD0A05550FFFFF4DDDD00000000EA0550FFFEF4DDDD00000EAE
        AEA050FFFFF4DDDD00000AEAEAEA00FEFEF4DDDD00000EAEAEA050FFFFF4DDDD
        00000000EA0550FEFEF4DDDD0000DDD0A05550EFEFE4DDDD0000DDD0045550FE
        FEF4DDDD0000DDDDD45550EFEFE4DDDD0000DDDDD44444444444DDDD0000DDDD
        DDDDDDDDDDDDDDDD0000}
      Hint = 'Sair do devSoft ADME'
      Spacing = 3
      Left = 350
      Top = 3
      Visible = True
      OnClick = Sair1Click
      SectionName = 'File'
    end
    object View1Btn: TSpeedItem
      Tag = 1
      BtnCaption = 'Login'
      Caption = 'Login'
      Glyph.Data = {
        02060000424D0206000000000000360400002800000014000000170000000100
        080000000000CC010000C40E0000C40E00000001000000000000000000004000
        00006000000080000000A0000000C0000000E0000000FF000000008000004080
        00006080000080800000A0800000C0800000E0800000FF80000000C0000040C0
        000060C0000080C00000A0C00000C0C00000E0C00000FFC0000000FF000040FF
        000060FF000080FF0000A0FF0000C0FF0000E0FF0000FFFF0000000040004000
        40006000400080004000A0004000C0004000E0004000FF004000008040004080
        40006080400080804000A0804000C0804000E0804000FF80400000C0400040C0
        400060C0400080C04000A0C04000C0C04000E0C04000FFC0400000FF400040FF
        400060FF400080FF4000A0FF4000C0FF4000E0FF4000FFFF4000000060004000
        60006000600080006000A0006000C0006000E0006000FF006000008060004080
        60006080600080806000A0806000C0806000E0806000FF80600000C0600040C0
        600060C0600080C06000A0C06000C0C06000E0C06000FFC0600000FF600040FF
        600060FF600080FF6000A0FF6000C0FF6000E0FF6000FFFF6000000080004000
        80006000800080008000A0008000C0008000E0008000FF008000008080004080
        80006080800080808000A0808000C0808000E0808000FF80800000C0800040C0
        800060C0800080C08000A0C08000C0C08000E0C08000FFC0800000FF800040FF
        800060FF800080FF8000A0FF8000C0FF8000E0FF8000FFFF80000000A0004000
        A0006000A0008000A000A000A000C000A000E000A000FF00A0000080A0004080
        A0006080A0008080A000A080A000C080A000E080A000FF80A00000C0A00040C0
        A00060C0A00080C0A000A0C0A000C0C0A000E0C0A000FFC0A00000FFA00040FF
        A00060FFA00080FFA000A0FFA000C0FFA000E0FFA000FFFFA0000000C0004000
        C0006000C0008000C000A000C000C000C000E000C000FF00C0000080C0004080
        C0006080C0008080C000A080C000C080C000E080C000FF80C00000C0C00040C0
        C00060C0C00080C0C000A0C0C000C0C0C000E0C0C000FFC0C00000FFC00040FF
        C00060FFC00080FFC000A0FFC000C0FFC000E0FFC000FFFFC0000000E0004000
        E0006000E0008000E000A000E000C000E000E000E000FF00E0000080E0004080
        E0006080E0008080E000A080E000C080E000E080E000FF80E00000C0E00040C0
        E00060C0E00080C0E000A0C0E000C0C0E000E0C0E000FFC0E00000FFE00040FF
        E00060FFE00080FFE000A0FFE000C0FFE000E0FFE000FFFFE0000000FF004000
        FF006000FF008000FF00A000FF00C000FF00E000FF00FF00FF000080FF004080
        FF006080FF008080FF00A080FF00C080FF00E080FF00FF80FF0000C0FF0040C0
        FF0060C0FF0080C0FF00A0C0FF00C0C0FF00E0C0FF00FFC0FF0000FFFF0040FF
        FF0060FFFF0080FFFF00A0FFFF00C0FFFF00E0FFFF00FFFFFF00DEDEDEDEDE94
        9494949494949494949494DEDEDEDEDEDEDE0000000000000000000000949494
        DEDEDEDEDE00808080808080808080008400949494DEDEDEDE00808080808080
        80808000840094949494DEDE008080808080808080800000848400949494DEDE
        008080808080808080800084848400DEDEDEDE00808080808080808080000000
        00848400DEDEDE0080808080808080808000F8F80084848400DE008080808080
        8080808000F8F8F80000000000DE00000000000000000000000707F800DEDEDE
        DEDEDE00F8F8F8F8F8F8F8F8F8F8F8F800DEDEDEDEDEDE00F807070707070707
        070707F800DEDEDEDEDEDE00F8F8F8F8F8F8F8F8F8F8F8F800DEDEDEDEDEDE00
        F8070707F80000000000000000DEDEDEDEDEDEDE00F8F8F800DEDEDEDEDEDEDE
        DEDEDEDEDEDEDEDEDE000000DEDE04DEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDE
        DE04040494DEDEDEDEDEDEDEDEDEDEDEDEDEDEDE040404040494DEDEDEDEDEDE
        DEDEDEDEDEDEDE0404040404040494DEDEDEDEDEDEDEDEDEDEDE040404040404
        04040494DEDEDEDEDEDEDEDEDEDE1F1F1F04040494949494DEDEDEDEDEDEDEDE
        DEDEDEDE1F04040494DEDEDEDEDEDEDEDEDEDEDEDEDEDEDE1F04040494DEDEDE
        DEDEDEDEDEDE}
      Hint = 'Digitar Usu�rio e Senha'
      Spacing = 1
      Left = 8
      Top = 3
      Visible = True
      OnClick = View1BtnClick
      SectionName = 'View'
    end
    object View2Btn: TSpeedItem
      Tag = 2
      BtnCaption = 'Logout'
      Caption = 'Logout'
      Enabled = False
      Glyph.Data = {
        02060000424D0206000000000000360400002800000014000000170000000100
        080000000000CC010000C40E0000C40E00000001000000000000000000004000
        00006000000080000000A0000000C0000000E0000000FF000000008000004080
        00006080000080800000A0800000C0800000E0800000FF80000000C0000040C0
        000060C0000080C00000A0C00000C0C00000E0C00000FFC0000000FF000040FF
        000060FF000080FF0000A0FF0000C0FF0000E0FF0000FFFF0000000040004000
        40006000400080004000A0004000C0004000E0004000FF004000008040004080
        40006080400080804000A0804000C0804000E0804000FF80400000C0400040C0
        400060C0400080C04000A0C04000C0C04000E0C04000FFC0400000FF400040FF
        400060FF400080FF4000A0FF4000C0FF4000E0FF4000FFFF4000000060004000
        60006000600080006000A0006000C0006000E0006000FF006000008060004080
        60006080600080806000A0806000C0806000E0806000FF80600000C0600040C0
        600060C0600080C06000A0C06000C0C06000E0C06000FFC0600000FF600040FF
        600060FF600080FF6000A0FF6000C0FF6000E0FF6000FFFF6000000080004000
        80006000800080008000A0008000C0008000E0008000FF008000008080004080
        80006080800080808000A0808000C0808000E0808000FF80800000C0800040C0
        800060C0800080C08000A0C08000C0C08000E0C08000FFC0800000FF800040FF
        800060FF800080FF8000A0FF8000C0FF8000E0FF8000FFFF80000000A0004000
        A0006000A0008000A000A000A000C000A000E000A000FF00A0000080A0004080
        A0006080A0008080A000A080A000C080A000E080A000FF80A00000C0A00040C0
        A00060C0A00080C0A000A0C0A000C0C0A000E0C0A000FFC0A00000FFA00040FF
        A00060FFA00080FFA000A0FFA000C0FFA000E0FFA000FFFFA0000000C0004000
        C0006000C0008000C000A000C000C000C000E000C000FF00C0000080C0004080
        C0006080C0008080C000A080C000C080C000E080C000FF80C00000C0C00040C0
        C00060C0C00080C0C000A0C0C000C0C0C000E0C0C000FFC0C00000FFC00040FF
        C00060FFC00080FFC000A0FFC000C0FFC000E0FFC000FFFFC0000000E0004000
        E0006000E0008000E000A000E000C000E000E000E000FF00E0000080E0004080
        E0006080E0008080E000A080E000C080E000E080E000FF80E00000C0E00040C0
        E00060C0E00080C0E000A0C0E000C0C0E000E0C0E000FFC0E00000FFE00040FF
        E00060FFE00080FFE000A0FFE000C0FFE000E0FFE000FFFFE0000000FF004000
        FF006000FF008000FF00A000FF00C000FF00E000FF00FF00FF000080FF004080
        FF006080FF008080FF00A080FF00C080FF00E080FF00FF80FF0000C0FF0040C0
        FF0060C0FF0080C0FF00A0C0FF00C0C0FF00E0C0FF00FFC0FF0000FFFF0040FF
        FF0060FFFF0080FFFF00A0FFFF00C0FFFF00E0FFFF00FFFFFF00DEDEDEDEDE94
        9494949494949494949494DEDEDEDEDEDEDE0000000000000000000000949494
        DEDEDEDEDE00808080808080808080008400949494DEDEDEDE00808080808080
        80808000840094949494DEDE008080808080808080800000848400949494DEDE
        008080808080808080800084848400DEDEDEDE00808080808080808080000000
        00848400DEDEDE0080808080808080808000F8F80084848400DE008080808080
        8080808000F8F8F80000000000DE00000000000000000000000707F800DEDEDE
        DEDEDE00F8F8F8F8F8F8F8F8F8F8F8F800DEDEDEDEDEDE00F807070707070707
        070707F800DEDEDEDEDEDE00F8F8F8F8F8F8F8F8F8F8F8F800DEDEDEDEDEDE00
        F8070707F80000000000000000DEDEDEDEDEDEDE00F8F8F800DEDEDEDEDEDEDE
        DEDEDEDEDEDEDEDEDE000000DEDE1F04040494DEDEDEDEDEDEDEDEDEDEDEDEDE
        DEDE1F04040494DEDEDEDEDEDEDEDEDEDEDEDEDE1F1F1F04040494949494DEDE
        DEDEDEDEDEDEDEDE04040404040404040494DEDEDEDEDEDEDEDEDEDEDE040404
        0404040494DEDEDEDEDEDEDEDEDEDEDEDEDE040404040494DEDEDEDEDEDEDEDE
        DEDEDEDEDEDEDE04040494DEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDE04DEDEDE
        DEDEDEDEDEDE}
      Hint = 'Logout'
      Spacing = 1
      Left = 62
      Top = 3
      Visible = True
      SectionName = 'View'
    end
    object View3Btn: TSpeedItem
      Tag = 3
      BtnCaption = 'Estoque'
      Caption = 'Estoque'
      Glyph.Data = {
        FA090000424DFA09000000000000360000002800000021000000190000000100
        180000000000C4090000CE0E0000C40E00000000000000000000C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C08080808080808080808080808080808080808080
        8080808080808080808080808080808080808080808080808080808080808080
        8080808080C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C000C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C080808080808080808080808080808080808080
        8080808080808080808080808080808080808080808080808080808080808080
        808080808080808080808080C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C000C0C0C0C0C0C0C0C0C0C0C0C0800000800000800000800000800000800000
        8000008000008000008000008000008000008000008000008000008000008000
        00800000800000808080808080808080808080C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C000C0C0C0C0C0C0C0C0C0FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000800000808080808080808080808080C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C000C0C0C000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000800000800000FFFFFF000000FF00008000008080808080808080808080
        80C0C0C0C0C0C0C0C0C0C0C0C000C0C0C0000000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000000000800000FFFFFFFFFFFF000000FFFFFF00000080000080808080
        8080808080808080C0C0C0C0C0C0C0C0C000C0C0C0C0C0C08000008000008000
        0080000080000080000080000080000080000080000080000080000080000080
        0000800000800000000000FFFFFFFFFFFFFFFFFF000000FFFFFF000000FF0000
        800000808080808080808080808080C0C0C0C0C0C000C0C0C0C0C0C0C0C0C000
        0000C0C0C0C0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF0000
        00FFFFFF000000800000808080808080808080808080C0C0C000C0C0C0C0C0C0
        C0C0C0000000C0C0C0C0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF
        FFFF000000FFFFFF000000FF000080000080808080808080808080808000C0C0
        C0C0C0C0C0C0C0000000C0C0C0C0C0C000000000000000000000000000000000
        0000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        000000FFFFFF000000FFFFFF000000FFFFFF0000008000008080808080808080
        8000C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF000000FFFFFF000000FFFFFF000000FFFFFF000000FF000080000080
        808080808000C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C00000000000000000
        00000000000000000000000000000000000000000000000000FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF000000FFFFFF000000FFFFFF000000FFFFFF000000FFFFFF
        00000080808080808000C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF000000FFFFFF000000FFFFFF0000
        00FFFFFF00000080808080808000C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0
        000000000000000000000000000000000000000000000000000000000000FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF000000FFFFFF000000FF
        FFFF000000FFFFFF00000080808080808000C0C0C0C0C0C0C0C0C0000000C0C0
        C0C0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF000000FFFFFF
        000000FFFFFF000000FFFFFF00000080808080808000C0C0C0C0C0C0C0C0C0C0
        C0C0000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000000000FFFFFFFFFFFF0000
        00FFFFFF000000FFFFFF000000FFFFFF00000080808080808000C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0000000FFFFFFFFFFFFFF0000FF0000FF0000FF0000FF00
        00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF000000FFFFFF000000FFFFFF000000FFFFFF00000080808080808000C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000000000FFFFFF80000080000080
        0000FFFFFF000000000000000000000000000000000000000000000000000000
        000000000000FFFFFFFFFFFF000000FFFFFF000000FFFFFF0000008080808080
        8000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0FF0000FF0000FF0000FF0000FF0000C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0000000C0C0C000000080
        808080808000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000
        00000000000000000000000000000000C0C0C0800000800000800000C0C0C000
        0000000000000000000000000000000000000000C0C0C0C0C0C0000000C0C0C0
        00000080808080808000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0FF0000FF0000FF0000FF0000FF0000C0C0C0C0C0C0C0C0C00000
        00C0C0C000000080808080808000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C00000000000000000000000000000000000000000
        00000000000000000000C0C0C0800000800000800000C0C0C000000000000000
        0000C0C0C0C0C0C000000080808080808000C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0FF
        0000FF0000FF0000FF0000FF0000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C000C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000000000
        000000C0C0C0800000800000800000C0C0C00000000000000000000000000000
        00000000000000000000000000000000C0C0C0C0C0C0C0C0C000C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C000}
      Hint = 'Controle de Estoque'
      Spacing = 1
      Left = 116
      Top = 3
      Visible = True
      OnClick = View3BtnClick
      SectionName = 'View'
    end
    object WizardBtn: TSpeedItem
      BtnCaption = 'Vendas'
      Caption = 'Vendas'
      Enabled = False
      Glyph.Data = {
        76020000424D7602000000000000760000002800000020000000200000000100
        0400000000000002000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00803131313130
        3331310F111100313013800313131333031310FFF11F03130031880331313300
        01310FFFF11F013013138880333330331300F88F111F03103131888800000331
        310FF81110880133031388888888031310F800000F0013130031888888880331
        0F80FFFFFF00313130138888888880100F0FFFFFFF0013130130888888888801
        00FFFFFFFF00313013088888888888800FFFFFFFF00313300088888888888888
        0FFF0000000007088888888888888000FFF08888887700888888888888800870
        FFFFFFFF8887708888888888880877FFFFFFFFFFFF8880888888888880F77FFF
        8FFFFFFFF80080888888888880FF80008FFFFFFFFFF080888888888880000330
        8F0FFFFF008F80888888888803333308FF0F4FFFFF08F08888888888038B8B08
        F880CFFFFF0808888888888803B8B08FF0880FF8F0880888888888880B8B80FF
        FF008F8F0FF808888888888808B8B0FFFFFF8FF0FFF08888888888880B8B00FF
        FFFFFF084F088888888888880BBB0000FFFFFF00CF088888888888880BBBFBFB
        00FFFF08F0888888888888880BBBB7FBFB000F08088888888888888880B83BFB
        FBFBB0F08888888888888888880BBBBBBBFBBB008888888888888888880BB8FF
        BBBBBBB08888888888888888888000BFBFBFB0B088888888888888888888880B
        BBBBBB0088888888888888888888888000000088888888888888}
      Hint = 'Vendas'
      Spacing = 1
      Left = 170
      Top = 3
      Visible = True
      SectionName = 'View'
    end
    object AboutBtn: TSpeedItem
      BtnCaption = 'Sobre'
      Caption = 'Sobre'
      Glyph.Data = {
        66010000424D6601000000000000760000002800000014000000140000000100
        040000000000F000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDDDDD0000DDDDDDD000000DDDDDDD0000DDDDD0040044400DDDDD0000DDDD
        0440FF044440DDDD0000DDD0440FFFF044440DDD0000DD04440FF078044440DD
        0000DD044447FF00444440DD0000D0444440FF744444440D0000D04444447FF0
        4444440D0000D04444400FF74444440D0000D044440870FF0444440D0000D044
        4440FFFF0444440D0000D04444440FF04444440D0000DD0444444004444440DD
        0000DD0444444400444440DD0000DDD0444440FF04440DDD0000DDDD044440FF
        0440DDDD0000DDDDD0044400400DDDDD0000DDDDDDD000000DDDDDDD0000DDDD
        DDDDDDDDDDDDDDDD0000}
      Hint = 'Sobre|'
      Spacing = 3
      Left = 287
      Top = 3
      Visible = True
      OnClick = AboutBtnClick
      SectionName = 'Help'
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 415
    Width = 688
    Height = 19
    Panels = <>
    SimplePanel = False
  end
  object MainMenu1: TMainMenu
    Left = 624
    Top = 6
    object Arquivo1: TMenuItem
      Caption = '&Arquivo'
      object ConfigurarImpressora1: TMenuItem
        Caption = 'Configurar Impressora...'
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Sair1: TMenuItem
        Caption = 'Sai&r'
        OnClick = Sair1Click
      end
    end
    object Configuraes1: TMenuItem
      Caption = 'C&onfigura��es'
      object Usurios1: TMenuItem
        Caption = 'Usu�rios'
        OnClick = Usurios1Click
      end
      object Empresa1: TMenuItem
        Caption = 'Par�metros'
        OnClick = Empresa1Click
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object Etiquetas1: TMenuItem
        Caption = 'Etiquetas'
        OnClick = Etiquetas1Click
      end
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 2000
    OnTimer = Timer1Timer
    Left = 654
    Top = 6
  end
end
