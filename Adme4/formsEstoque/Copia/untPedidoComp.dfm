object frmPedidoComp: TfrmPedidoComp
  Left = 219
  Top = 125
  Width = 713
  Height = 577
  BorderIcons = [biSystemMenu]
  Caption = 'Adme - Pedido Compra'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PanDados: TPanel
    Left = 0
    Top = 41
    Width = 705
    Height = 158
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object DBText1: TDBText
      Left = 100
      Top = 10
      Width = 65
      Height = 17
      DataField = 'NUMEROPEDIDO'
      DataSource = dmEst.dsPedidoCompra
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 10
      Top = 10
      Width = 37
      Height = 13
      Caption = 'Número'
    end
    object Label3: TLabel
      Left = 10
      Top = 40
      Width = 54
      Height = 13
      Caption = 'Fornecedor'
    end
    object Label4: TLabel
      Left = 10
      Top = 70
      Width = 54
      Height = 13
      Caption = 'Pagamento'
    end
    object Label5: TLabel
      Left = 10
      Top = 100
      Width = 39
      Height = 13
      Caption = 'Controle'
      FocusControl = DBEdit1
    end
    object Label6: TLabel
      Left = 308
      Top = 101
      Width = 59
      Height = 13
      Caption = 'Data Pedido'
      FocusControl = DBEdit2
    end
    object Label7: TLabel
      Left = 526
      Top = 102
      Width = 63
      Height = 13
      Caption = 'Data Entrega'
      FocusControl = DBEdit3
    end
    object SpeedButton3: TSpeedButton
      Left = 439
      Top = 36
      Width = 23
      Height = 22
      Cursor = crHandPoint
      Glyph.Data = {
        66010000424D6601000000000000760000002800000014000000140000000100
        040000000000F000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
        FFFFF00F0000FFFFFFFFFFFFFFFF55500000FFFFFFFFFFFFFFF58D500000FFFF
        FFFFFFFFFF58D5500000FFFFFFFFFFFFF58D550F0000FFFFFF00000F58D550FF
        0000FFFF007777700D550FFF0000FFF088FEFEF77050FFFF0000FF78FF00EFEF
        870FFFFF0000FF7FFE00FEFE870FFFFF0000F78FEF00EFEFE770FFFF0000F78F
        FE00000E8670FFFF0000778FEF00EF00E770FFFF0000F78FFE00FE008670FFFF
        0000F78FEF00EF00E770FFFF0000FF78FE00FE00860FFFFF0000FF78EF00000F
        E70FFFFF0000FFF78EFEFEFE70FFFFFF0000FFFF78EFFFF700FFFFFF0000FFFF
        F7777777FFFFFFFF0000}
      OnClick = SpeedButton3Click
    end
    object SpeedButton5: TSpeedButton
      Left = 439
      Top = 65
      Width = 23
      Height = 22
      Cursor = crHandPoint
      Glyph.Data = {
        66010000424D6601000000000000760000002800000014000000140000000100
        040000000000F000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
        FFFFF00F0000FFFFFFFFFFFFFFFF55500000FFFFFFFFFFFFFFF58D500000FFFF
        FFFFFFFFFF58D5500000FFFFFFFFFFFFF58D550F0000FFFFFF00000F58D550FF
        0000FFFF007777700D550FFF0000FFF088FEFEF77050FFFF0000FF78FF00EFEF
        870FFFFF0000FF7FFE00FEFE870FFFFF0000F78FEF00EFEFE770FFFF0000F78F
        FE00000E8670FFFF0000778FEF00EF00E770FFFF0000F78FFE00FE008670FFFF
        0000F78FEF00EF00E770FFFF0000FF78FE00FE00860FFFFF0000FF78EF00000F
        E70FFFFF0000FFF78EFEFEFE70FFFFFF0000FFFF78EFFFF700FFFFFF0000FFFF
        F7777777FFFFFFFF0000}
      OnClick = SpeedButton5Click
    end
    object DBEdit1: TDBEdit
      Left = 100
      Top = 97
      Width = 154
      Height = 21
      CharCase = ecUpperCase
      DataField = 'NUMEROCONTROLE'
      DataSource = dmEst.dsPedidoCompra
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
    end
    object DBEdit2: TDBEdit
      Left = 370
      Top = 99
      Width = 100
      Height = 21
      DataField = 'DATAPEDIDO'
      DataSource = dmEst.dsPedidoCompra
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
    end
    object DBEdit3: TDBEdit
      Left = 596
      Top = 100
      Width = 100
      Height = 21
      DataField = 'DATAENTREGA'
      DataSource = dmEst.dsPedidoCompra
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
    end
    object RxDBLookupCombo2: TRxDBLookupCombo
      Left = 100
      Top = 36
      Width = 332
      Height = 21
      DropDownCount = 8
      DataField = 'FORNECEDOR'
      DataSource = dmEst.dsPedidoCompra
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object RxDBLookupCombo4: TRxDBLookupCombo
      Left = 100
      Top = 65
      Width = 332
      Height = 21
      DropDownCount = 8
      DataField = 'FORMAPAGAMENTO'
      DataSource = dmEst.dsPedidoCompra
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 705
    Height = 41
    Align = alTop
    TabOrder = 1
    object DBNav: TDBNavigator
      Left = 9
      Top = 9
      Width = 96
      Height = 25
      DataSource = dmEst.dsPedidoCompra
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Flat = True
      Hints.Strings = (
        'Primeiro'
        'Anterior'
        'Próximo'
        'Último')
      TabOrder = 0
    end
    object dbNavBtnAppend: TDBNavigationButton
      Left = 130
      Top = 9
      Width = 75
      Height = 25
      Caption = '&Insere'
      TabOrder = 1
      NumGlyphs = 2
      DataButtonType = nbAppend
      Language = blPortugues
      DataSource = dmEst.dsPedidoCompra
      DisableReasons = [drReadonly, drEditing]
      RuntimeEnabled = True
    end
    object dbNavBtnDelete: TDBNavigationButton
      Left = 205
      Top = 9
      Width = 75
      Height = 25
      Caption = '&Exclui'
      TabOrder = 2
      NumGlyphs = 2
      DataButtonType = nbDelete
      Language = blPortugues
      DataSource = dmEst.dsPedidoCompra
      DisableReasons = [drReadonly, drEditing, drEmpty]
      RuntimeEnabled = True
    end
    object dbNavBtnEdit: TDBNavigationButton
      Left = 280
      Top = 9
      Width = 75
      Height = 25
      Caption = '&Edita'
      TabOrder = 3
      NumGlyphs = 2
      DataButtonType = nbEdit
      Language = blPortugues
      DataSource = dmEst.dsPedidoCompra
      DisableReasons = [drReadonly, drEditing, drEmpty]
      RuntimeEnabled = True
    end
    object dbNavBtnSave: TDBNavigationButton
      Left = 355
      Top = 9
      Width = 75
      Height = 25
      Caption = '&Atualiza'
      TabOrder = 4
      NumGlyphs = 2
      DataButtonType = nbPost
      Language = blPortugues
      DataSource = dmEst.dsPedidoCompra
      DisableReasons = [drNotEditing]
      RuntimeEnabled = True
    end
    object dbNavBtnCancel: TDBNavigationButton
      Left = 430
      Top = 9
      Width = 75
      Height = 25
      Caption = '&Cancela'
      TabOrder = 5
      NumGlyphs = 2
      DataButtonType = nbCancel
      Language = blPortugues
      DataSource = dmEst.dsPedidoCompra
      DisableReasons = [drNotEditing]
      RuntimeEnabled = True
    end
    object BitBtn1: TBitBtn
      Left = 506
      Top = 9
      Width = 75
      Height = 25
      Caption = '&Sair'
      TabOrder = 6
      Kind = bkClose
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 199
    Width = 705
    Height = 351
    Align = alClient
    BevelOuter = bvLowered
    Caption = 'Panel1'
    TabOrder = 2
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 703
      Height = 308
      TabStop = False
      Align = alClient
      Color = clInfoBk
      DataSource = dmEst.dsItenPedidoCompra
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnEditButtonClick = DBGrid1EditButtonClick
      OnEnter = DBGrid1Enter
      Columns = <
        item
          ButtonStyle = cbsEllipsis
          Expanded = False
          FieldName = 'CODIGOPRODUTO'
          Width = 87
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAOPRODUTO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QUANTIDADE'
          Title.Alignment = taRightJustify
          Width = 87
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALORUNITARIO'
          Title.Alignment = taRightJustify
          Width = 84
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SUBTOTAL'
          Title.Alignment = taRightJustify
          Title.Caption = 'Sub Total'
          Width = 90
          Visible = True
        end>
    end
    object Panel3: TPanel
      Left = 1
      Top = 309
      Width = 703
      Height = 41
      Align = alBottom
      Alignment = taRightJustify
      Caption = 'Total do Pedido                                                 '
      TabOrder = 1
      object DBText2: TDBText
        Left = 568
        Top = 14
        Width = 109
        Height = 17
        Alignment = taRightJustify
        DataField = 'VALORTOTAL'
        DataSource = dmEst.dsPedidoCompra
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHighlight
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object SpeedButton1: TSpeedButton
        Left = 444
        Top = 5
        Width = 32
        Height = 32
        Hint = 'Calcula o Total do Pedido'
        Flat = True
        Glyph.Data = {
          36080000424D3608000000000000360400002800000020000000200000000100
          08000000000000040000CE0E0000C40E00000001000000000000000000004000
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
          FF0060FFFF0080FFFF00A0FFFF00C0FFFF00E0FFFF00FFFFFF00DEDEDEDEDEDE
          DEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDE
          DEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDE
          DEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDE
          DEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDE
          DEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDE
          DEDEDEDEDEDE030303030303DEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDE
          DE0803DEDE030808080808080303DEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDE
          DE0808030308080808080808080803DEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDE
          DE0808080808081818181818080808039494DEDEDEDEDEDEDEDEDEDEDEDEDEDE
          DE080808080818000000000018080808039494DEDEDEDEDEDEDEDEDEDEDEDEDE
          DE08080808088080808080808018080803949494DEDEDEDEDEDEDEDEDEDEDEDE
          DE0808080808088080808080801803030394949494DEDEDEDEDEDEDEDEDEDEDE
          DE1818181818181880808080800000848400949494DEDEDEDEDEDEDEDEDEDEDE
          DEDEDE008080808080808080800084848400DEDEDEDEDEDEDEDEDEDEDEDEDEDE
          DEDE0080808080808080808000000000848400DEDEDEDEDEDEDEDEDEDEDEDEDE
          DEDE0080808080808080808000F8F80084848400DEDEDEDEDEDEDEDEDEDEDEDE
          DE0080808080808080808000F8F8F80000000000DEDEDEDEDEDEDEDEDEDEDEDE
          DE00000000000000000000000707F800DEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDE
          DEDE00F8F8F8F8F8F8F8F8F8F8F8F800DEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDE
          DEDE00F807070707070707070707F800DEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDE
          DEDE00F8F8F8F8F8F8F8F8F8F8F8F800DEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDE
          DEDE00F8070707F80000000000000000DEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDE
          DEDEDE00F8F8F800DEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDE
          DEDEDEDE000000DEDEDEDE030303030303DEDEDEDEDEDEDEDEDEDEDEDEDEDEDE
          18030303DEDEDEDEDEDE18080808080803DEDEDEDEDEDEDEDEDEDEDEDEDEDEDE
          18080803DEDEDEDEDEDEDE180808080803DEDEDEDEDEDEDEDEDEDEDEDEDEDEDE
          DE18080803DEDEDEDEDE03030808080803DEDEDEDEDEDEDEDEDEDEDEDEDEDEDE
          DE18080808030303030308080808080803DEDEDEDEDEDEDEDEDEDEDEDEDEDEDE
          DEDE180808080808080808080818180803DEDEDEDEDEDEDEDEDEDEDEDEDEDEDE
          DEDEDE18180808080808081818DEDE18DEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDE
          DEDEDEDEDE181818181818DEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDE
          DEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDE}
        OnClick = FormShow
      end
      object DBText3: TDBText
        Left = 54
        Top = 14
        Width = 129
        Height = 17
        DataField = 'STATUS'
        DataSource = dmEst.dsPedidoCompra
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHighlight
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label1: TLabel
        Left = 6
        Top = 14
        Width = 42
        Height = 13
        Caption = 'Situação'
      end
      object SpeedButton2: TSpeedButton
        Left = 187
        Top = 5
        Width = 32
        Height = 32
        Hint = 'Confirma o Pedido'
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          555555555555555555555555555555555555555555FF55555555555559055555
          55555555577FF5555555555599905555555555557777F5555555555599905555
          555555557777FF5555555559999905555555555777777F555555559999990555
          5555557777777FF5555557990599905555555777757777F55555790555599055
          55557775555777FF5555555555599905555555555557777F5555555555559905
          555555555555777FF5555555555559905555555555555777FF55555555555579
          05555555555555777FF5555555555557905555555555555777FF555555555555
          5990555555555555577755555555555555555555555555555555}
        NumGlyphs = 2
        OnClick = SpeedButton2Click
      end
    end
  end
end
