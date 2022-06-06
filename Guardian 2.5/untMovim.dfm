object frmMovim: TfrmMovim
  Left = 192
  Top = 107
  BorderIcons = [biSystemMenu, biMaximize]
  BorderStyle = bsSingle
  Caption = 'Guardian - Movimento'
  ClientHeight = 550
  ClientWidth = 782
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel5: TBevel
    Left = 385
    Top = 14
    Width = 332
    Height = 116
    Style = bsRaised
  end
  object Bevel1: TBevel
    Left = 316
    Top = 205
    Width = 461
    Height = 232
    Style = bsRaised
  end
  object DBText1: TDBText
    Left = 475
    Top = 214
    Width = 293
    Height = 18
    Color = clHighlight
    DataField = 'DHINICIAL'
    DataSource = dtMod.dsMicro
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHighlightText
    Font.Height = -16
    Font.Name = 'Courier New'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object DBText3: TDBText
    Left = 475
    Top = 409
    Width = 293
    Height = 18
    Color = clHighlight
    DataField = 'ValorParcial'
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
    Left = 323
    Top = 214
    Width = 145
    Height = 20
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Data/Hora Inicial:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 323
    Top = 409
    Width = 145
    Height = 20
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Valor Parcial:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 323
    Top = 360
    Width = 145
    Height = 20
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Horas Parcial:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 475
    Top = 360
    Width = 293
    Height = 20
    AutoSize = False
    Caption = '00:00:00'
    Color = clHighlight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHighlightText
    Font.Height = -16
    Font.Name = 'Courier New'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Bevel2: TBevel
    Left = 318
    Top = 294
    Width = 458
    Height = 11
    Shape = bsTopLine
  end
  object Bevel3: TBevel
    Left = 318
    Top = 392
    Width = 458
    Height = 11
    Shape = bsTopLine
  end
  object Label2: TLabel
    Left = 323
    Top = 312
    Width = 145
    Height = 20
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Tempo Solicitado:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Bevel4: TBevel
    Left = 318
    Top = 342
    Width = 458
    Height = 11
    Shape = bsTopLine
  end
  object DBText2: TDBText
    Left = 475
    Top = 312
    Width = 293
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
  object Label6: TLabel
    Left = 323
    Top = 263
    Width = 145
    Height = 20
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'S�cio:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DBText4: TDBText
    Left = 475
    Top = 263
    Width = 293
    Height = 18
    Color = clHighlight
    DataField = 'NomeSocio'
    DataSource = dtMod.dsMicro
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHighlightText
    Font.Height = -16
    Font.Name = 'Courier New'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Bevel6: TBevel
    Left = 318
    Top = 245
    Width = 458
    Height = 11
    Shape = bsTopLine
  end
  object btnCLientes: TSpeedButton
    Left = 561
    Top = 149
    Width = 150
    Height = 45
    Caption = 'S�cios'
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
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
    ParentFont = False
    OnClick = btnCLientesClick
  end
  object btnAdiciona: TSpeedButton
    Left = 386
    Top = 149
    Width = 156
    Height = 45
    Caption = 'Adicionar Tempo'
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Glyph.Data = {
      16020000424D160200000000000076000000280000001A0000001A0000000100
      040000000000A001000000000000000000001000000000000000000000000000
      BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
      7777777777777700000077777777777777777777777777000000777777777777
      77777777777777000000777777777778888877777777770000007777777777FA
      AAAA87777777770000007777777777FAAAAA87777777770000007777777777FA
      AAAA87777777770000007777777777FAAAAA87777777770000007777777777FA
      AAAA87777777770000007777777777FAAAAA877777777700000077778888888A
      AAAA8888888777000000777FAAAAAAAAAAAAAAAAAAA877000000777FAAAAAAAA
      AAAAAAAAAAA877000000777FAAAAAAAAAAAAAAAAAAA877000000777FAAAAAAAA
      AAAAAAAAAAA8770000007777FFFFFFFAAAAA8FFFFFF7770000007777777777FA
      AAAA87777777770000007777777777FAAAAA87777777770000007777777777FA
      AAAA87777777770000007777777777FAAAAA87777777770000007777777777FA
      AAAA87777777770000007777777777FAAAAA877777777700000077777777777F
      FFFF777777777700000077777777777777777777777777000000777777777777
      7777777777777700000077777777777777777777777777000000}
    ParentFont = False
    OnClick = btnAdicionaClick
  end
  object FlatSpeedButton1: TFlatSpeedButton
    Left = 726
    Top = 51
    Width = 43
    Height = 46
    ColorBorder = clNavy
    Glyph.Data = {
      B6080000424DB608000000000000360400002800000020000000240000000100
      08000000000080040000C40E0000C40E00000001000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
      A6000020400000206000002080000020A0000020C0000020E000004000000040
      20000040400000406000004080000040A0000040C0000040E000006000000060
      20000060400000606000006080000060A0000060C0000060E000008000000080
      20000080400000806000008080000080A0000080C0000080E00000A0000000A0
      200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
      200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
      200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
      20004000400040006000400080004000A0004000C0004000E000402000004020
      20004020400040206000402080004020A0004020C0004020E000404000004040
      20004040400040406000404080004040A0004040C0004040E000406000004060
      20004060400040606000406080004060A0004060C0004060E000408000004080
      20004080400040806000408080004080A0004080C0004080E00040A0000040A0
      200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
      200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
      200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
      20008000400080006000800080008000A0008000C0008000E000802000008020
      20008020400080206000802080008020A0008020C0008020E000804000008040
      20008040400080406000804080008040A0008040C0008040E000806000008060
      20008060400080606000806080008060A0008060C0008060E000808000008080
      20008080400080806000808080008080A0008080C0008080E00080A0000080A0
      200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
      200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
      200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
      2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
      2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
      2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
      2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
      2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
      2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
      2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00F9F9F9F9F9F9
      F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9
      F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9
      F9F9F9F9F9F90F0F0F0F0F0F0F0FF9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9
      F9F9F90F0F0F0F0F0F0F0F0F0F0F0F0F0FF9F9F9F9F9F9F9F9F9F9F9F9F9F9F9
      F90F0F0F0F0F0F0000000000520F0F0F0F0F0FF9F9F9F9F9F9F9F9F9F9F9F9F9
      0F0F0F0F0F0000FFFFFF00000000000F0F0F0F0FF9F9F9F9F9F9F9F9F9F9F90F
      0F0F0F0F0F52FF000000000000FF520F0F0F0F0F0FF9F9F9F9F9F9F9F9F90F0F
      0F0F0F0F0F0F0000FF00FFFF00000F0F0F0F0F0F0F0FF9F9F9F9F9F9F90F0F0F
      0F0F0F0F0F0F00FF0000FF00FF000F0F0F0F0F0F0F0F0FF9F9F9F9F9F90F0F0F
      0F0F0F0F0F0F00FF0000FF00FF000F0F0F0F0F0F0F0F0FF9F9F9F9F90F0F0F0F
      0F0F0F0F0F0F00FF0000FF00FF000F0F0F0F0F0F0F0F0F0FF9F9F9F90F0F0F0F
      0F0F0F0F0F0F00FF0000FF00FF000F0F0F0F0F0F0F0FFF0FF9F9F9F90F0F0F0F
      0F0F0F0F0F0F00FF00000000FF000F0F0F0F0F0F0F0F0F0FF9F9F90F0F0FFFFF
      FF0F0F0FAFFFFF00000000FF0000FFFF0F0F0FAFFFAFFFAF0FF9F90F0FFF0F0F
      0FFFFFFFFF00FF000000FF00FF00FF0FFF0FFF0FFF0FFF0F0FF9F90FFF0F0F0F
      FF0F0FFFFF00FFFFFF00FF0000FFFF0FFFFFFF0F0FFF0FFF0FF9F90FFF0F0FFF
      0FFFFF0F0FFF00FF0000FF0000FF00FFFF0FFFFF0F0FFFAF0FF9F90F0FFF0FFF
      0FAFFF0FFFFFFF00FF0000FF0000520F0F0FFF0FAF0F0F0F0FF9F90F0FFF0F0F
      FF0F0FFFFF0F00FFFF00FFFF00000F0F0F0FFF0FFF0F0F0F0FF9F90F0F0FFF0F
      0F0F0F0F0F0F520000000000FF00FF0F0FFFFF9FFFFF0F0F0FF9F9F90F0F0FFF
      0FFF0F0F0F0F0F00FF00FF0000FF0FFFFF0F0FFFFF0FAF0FF9F9F9F90F0F0F0F
      FFAF0F0F0F0F0F52FF00FF00520F0F0F0F0F0F0F0F0F0F0FF9F9F9F90F0F0F0F
      0F0F0F0F0F0F0F0F00FF00000F0F0F0F0F0F0F0F0F0F0F0FF9F9F9F9F90F0F0F
      0F0F0F0F0F0F0F0F00FF00000F0F0F0F0F0F0F0F0F0F0FF9F9F9F9F9F90F0F0F
      0F0F0F0F0F0F0F0F00FF00000F0F0F0F0F0F0F0F0F0F0FF9F9F9F9F9F9F90F0F
      0F0F0F0F0F0F0F0F000000000F0F0F0F0F0F0F0F0F0FF9F9F9F9F9F9F9F9F9AA
      AA0F0F0F0F0F0F5200FF0000520F0F0F0F0F0FAAAAF9F9F9F9F9F9F9F9F9F9AA
      AAAA0F0F0F0F0F5200F7F700520F0F0F0F0FAAAAAAF9F9F9F9F9F9F9F9F9AAAA
      AAFFAAAA0F0F0F0F525252520F0F0F0FAAAAFFAAAAAAF9F9F9F9F9F9F9F9AAAA
      FFAAFFAAAAAA0F0F0F0F0F0F0F0FAAAAAAFFFFAAAAAAF9F9F9F9F9F9F9F9F9AA
      FFFFAAAAFFFFAAAAAAAAAAAAAAAAAAFFAAAAFFFFAAF9F9F9F9F9F9F9F9F9F9F9
      AAAAAAFFAAAAFFFFFFAAFFAAFFAAFFAAFFAAAAAAF9F9F9F9F9F9F9F9F9F9F9F9
      F9F9AAAAAAAAFFAAFFAAAAFFAAAAAAAAAAAAF9F9F9F9F9F9F9F9F9F9F9F9F9F9
      F9F9F9F9F9AAAAAAAAAAAAAAAAAAAAF9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9
      F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9
      F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9}
    OnClick = FlatSpeedButton1Click
  end
  object RxDBGrid1: TRxDBGrid
    Left = 0
    Top = 0
    Width = 309
    Height = 550
    Cursor = crHandPoint
    Align = alLeft
    Color = clWhite
    DataSource = dtMod.dsMicro
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnCellClick = RxDBGrid1CellClick
    ClearSelection = False
    ShowGlyphs = False
    OnGetCellParams = RxDBGrid1GetCellParams
    Columns = <
      item
        Expanded = False
        FieldName = 'DESCRICAO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Title.Alignment = taCenter
        Title.Caption = 'Esta��o'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 272
        Visible = True
      end>
  end
  object BitBtn1: TBitBtn
    Left = 389
    Top = 23
    Width = 150
    Height = 45
    Caption = 'Abrir Sess�o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = btnAberturaClick
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      0400000000008000000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
      77777777777777777777000000000007777700333333333077770B0333333333
      07770FB03333333330770BFB0333333333070FBFB000000000000BFBFBFBFB07
      77770FBFBFBFBF0777770BFB0000000777777000777777770007777777777777
      7007777777770777070777777777700077777777777777777777}
  end
  object BitBtn2: TBitBtn
    Left = 561
    Top = 23
    Width = 150
    Height = 45
    Caption = 'Encerrar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = btnFechamentoClick
    Glyph.Data = {
      66010000424D6601000000000000760000002800000015000000140000000100
      040000000000F0000000C40E0000C40E00001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
      8888888880008888888888888888888880008888888888887F78888880008888
      888888F77F77F888800088888808887F7F7F78888000887000008777FFF77788
      8000880000008FFFFFFFFF888000880888088777FFF77788800088088888887F
      7F7F788880008888888888F77F77F88880008870000000787F7888888000887F
      BFBFBF08888888888000887BFBFBFB08888888888000887FBFBFBF0888888888
      8000887BFBFBFB08888888888000887777BFBF08888888888000887BFB777788
      8888888880008887778888888888888880008888888888888888888880008888
      88888888888888888000}
  end
  object swtImp: TRxSwitch
    Left = 389
    Top = 78
    Width = 150
    Height = 45
    Cursor = crHandPoint
    BorderStyle = bsSingle
    Caption = 'Emite Recibo Abertura'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHighlight
    Font.Height = -11
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    ToggleKey = 115
    TabOrder = 3
    TextPosition = tpRight
  end
  object BitBtn3: TBitBtn
    Left = 702
    Top = 512
    Width = 75
    Height = 34
    Caption = '&Sair'
    TabOrder = 4
    OnClick = BitBtn3Click
    Kind = bkClose
  end
  object GroupBox1: TGroupBox
    Left = 312
    Top = 442
    Width = 275
    Height = 105
    Caption = ' Mensagens: '
    TabOrder = 5
    object MemoMens: TMemo
      Left = 2
      Top = 15
      Width = 271
      Height = 88
      Align = alClient
      BorderStyle = bsNone
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 0
      WordWrap = False
    end
  end
  object swtFecha: TRxSwitch
    Left = 561
    Top = 78
    Width = 150
    Height = 45
    Cursor = crHandPoint
    BorderStyle = bsSingle
    Caption = 'Emite Recibo Fecham...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHighlight
    Font.Height = -11
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    ToggleKey = 115
    StateOn = True
    TabOrder = 6
    TextPosition = tpLeft
  end
  object lblHora: TLCD99
    Left = 590
    Top = 442
    Width = 189
    Height = 65
    Color = clBtnFace
    DigitNum = 8
    DigitSpacing = 3
    OffColor = clBtnFace
    OnColor = clHighlight
    Value = '88:88:88'
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 270
    Top = 496
  end
end
