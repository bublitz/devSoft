object frmClientes: TfrmClientes
  Left = 362
  Top = 106
  Width = 544
  Height = 580
  Caption = 'devAdm - Cadastro de Clientes'
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
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 536
    Height = 553
    ActivePage = TabSheet2
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Listagem'
      object ToolBar1: TToolBar
        Left = 0
        Top = 0
        Width = 528
        Height = 29
        ButtonWidth = 27
        Caption = 'BtnBar'
        Images = dmPrinc.imgList
        TabOrder = 0
        object ToolButton1: TToolButton
          Left = 0
          Top = 2
          Width = 8
          Caption = 'ToolButton1'
          Style = tbsSeparator
        end
        object btnIncluir: TToolButton
          Left = 8
          Top = 2
          Hint = 'Incluir'
          Caption = 'btnIncluir'
          ImageIndex = 12
          ParentShowHint = False
          ShowHint = True
          OnClick = btnIncluirClick
        end
        object btnEditar: TToolButton
          Left = 35
          Top = 2
          Hint = 'Editar'
          Caption = 'btnEditar'
          ImageIndex = 22
          ParentShowHint = False
          ShowHint = True
          OnClick = btnEditarClick
        end
        object ToolButton4: TToolButton
          Left = 62
          Top = 2
          Width = 8
          Caption = 'ToolButton4'
          ImageIndex = 1
          Style = tbsSeparator
        end
        object btnExcluir: TToolButton
          Left = 70
          Top = 2
          Hint = 'Exluir'
          Caption = 'btnExcluir'
          ImageIndex = 4
          ParentShowHint = False
          ShowHint = True
          OnClick = btnExcluirClick
        end
        object btnAtualizar: TToolButton
          Left = 97
          Top = 2
          Hint = 'Atualizar'
          Caption = 'btnAtualizar'
          ImageIndex = 3
          ParentShowHint = False
          ShowHint = True
          OnClick = btnAtualizarClick
        end
        object ToolButton7: TToolButton
          Left = 124
          Top = 2
          Width = 65
          Caption = 'ToolButton7'
          ImageIndex = 3
          Style = tbsSeparator
        end
        object StaticText1: TStaticText
          Left = 189
          Top = 2
          Width = 53
          Height = 22
          Caption = 'Pesquisar:'
          TabOrder = 0
        end
        object edtPesq: TEdit
          Left = 242
          Top = 2
          Width = 194
          Height = 22
          CharCase = ecUpperCase
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          OnChange = edtPesqChange
        end
      end
      object DBGrid1: TDBGrid
        Left = 0
        Top = 29
        Width = 528
        Height = 496
        Align = alClient
        DataSource = dmPrinc.dsCliente
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'CODIGOLOJA'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODIGOCLIENTE'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOMECOMPLETO'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NICKNAME'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ENDERECO'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BAIRRO'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CIDADE'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'UF'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CEP'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CPF'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RG'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DATANASCTO'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DATACADASTRO'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FONE1'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FONE2'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'INDICACAO'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QUANT_INDICACAO'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'E_MAIL'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RECEBEPROMOCAO'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RECEBEMILHAGEM'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODIGOINTERNO'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOMEMAE'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOMELOGIN'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SENHALOGIN'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LIMITEDIAS'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LIMITEVALOR'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'HORASANTECIP'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALIDADEANTECIP'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'HORASMILHAGEM'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALIDADEMILHAGEM'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BONUS'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALIDADEBONUS'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SALDO'
            Visible = True
          end>
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Detalhes'
      ImageIndex = 1
      TabVisible = False
      object Label1: TLabel
        Left = 10
        Top = -2
        Width = 68
        Height = 13
        Caption = 'C'#243'digo Cliente'
        FocusControl = DBEdit1
      end
      object Label2: TLabel
        Left = 410
        Top = -2
        Width = 68
        Height = 13
        Caption = 'Data Cadastro'
        FocusControl = DBEdit2
      end
      object Label3: TLabel
        Left = 10
        Top = 33
        Width = 75
        Height = 13
        Caption = 'Nome Completo'
        FocusControl = DBEdit3
      end
      object Label4: TLabel
        Left = 10
        Top = 69
        Width = 53
        Height = 13
        Caption = 'Nick Name'
        FocusControl = DBEdit4
      end
      object Label5: TLabel
        Left = 10
        Top = 106
        Width = 46
        Height = 13
        Caption = 'Endere'#231'o'
        FocusControl = DBEdit5
      end
      object Label6: TLabel
        Left = 10
        Top = 144
        Width = 27
        Height = 13
        Caption = 'Bairro'
        FocusControl = DBEdit6
      end
      object Label7: TLabel
        Left = 182
        Top = 145
        Width = 33
        Height = 13
        Caption = 'Cidade'
        FocusControl = DBEdit7
      end
      object Label8: TLabel
        Left = 408
        Top = 146
        Width = 14
        Height = 13
        Caption = 'UF'
        FocusControl = DBEdit8
      end
      object Label9: TLabel
        Left = 10
        Top = 182
        Width = 21
        Height = 13
        Caption = 'CEP'
        FocusControl = DBEdit9
      end
      object Label10: TLabel
        Left = 408
        Top = 182
        Width = 82
        Height = 13
        Caption = 'Data Nascimento'
        FocusControl = DBEdit10
      end
      object Label11: TLabel
        Left = 182
        Top = 69
        Width = 52
        Height = 13
        Caption = 'Nome M'#227'e'
        FocusControl = DBEdit11
      end
      object Label12: TLabel
        Left = 10
        Top = 218
        Width = 24
        Height = 13
        Caption = 'Fone'
        FocusControl = DBEdit12
      end
      object Label13: TLabel
        Left = 408
        Top = 218
        Width = 32
        Height = 13
        Caption = 'Celular'
        FocusControl = DBEdit13
      end
      object Label14: TLabel
        Left = 10
        Top = 292
        Width = 57
        Height = 13
        Caption = 'Nome Login'
        FocusControl = DBEdit14
      end
      object Label15: TLabel
        Left = 10
        Top = 332
        Width = 60
        Height = 13
        Caption = 'Senha Login'
        FocusControl = DBEdit15
      end
      object Label16: TLabel
        Left = 10
        Top = 408
        Width = 47
        Height = 13
        Caption = 'Indica'#231#227'o'
        FocusControl = DBEdit16
      end
      object btnPesq: TSpeedButton
        Left = 63
        Top = 421
        Width = 23
        Height = 22
        Hint = 'Pesquisar'
        Flat = True
        Glyph.Data = {
          36050000424D3605000000000000360400002800000010000000100000000100
          08000000000000010000120B0000120B00000001000000010000000000000000
          80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
          A600F0FBFF00A4A0A000808080000000FF0000FF000000FFFF00FF000000FF00
          FF00FFFF0000FFFFFF0000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000131313131313
          1313131313131313131313131313131313131313131313131313131313131313
          1313131313130004131313131313131313131313130004001313131313131313
          1313131300040013131313131313131313131300040013131313131313000404
          0400000400131313131313130004001313000400131313131313131304131313
          1313000013131313131313000013131313131304131313131313130000000013
          1313130413131313131313000013130013131304131313131313131304131313
          1313000013131313131313130004001313000413131313131313131313000404
          0400131313131313131313131313131313131313131313131313}
        ParentShowHint = False
        ShowHint = True
        OnClick = btnPesqClick
      end
      object Label17: TLabel
        Left = 10
        Top = 254
        Width = 20
        Height = 13
        Caption = 'CPF'
        FocusControl = DBEdit18
      end
      object Label18: TLabel
        Left = 359
        Top = 254
        Width = 16
        Height = 13
        Caption = 'RG'
        FocusControl = DBEdit19
      end
      object Label19: TLabel
        Left = 10
        Top = 370
        Width = 25
        Height = 13
        Caption = 'Email'
        FocusControl = DBEdit20
      end
      object Label23: TLabel
        Left = 10
        Top = 448
        Width = 51
        Height = 13
        Caption = 'Limite Dias'
        FocusControl = DBEdit24
      end
      object Label24: TLabel
        Left = 377
        Top = 446
        Width = 54
        Height = 13
        Caption = 'Limite Valor'
        FocusControl = DBEdit25
      end
      object btnGravar: TBitBtn
        Left = 85
        Top = 493
        Width = 92
        Height = 32
        Caption = '&Gravar'
        Default = True
        TabOrder = 0
        OnClick = btnGravarClick
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
      object BitBtn2: TBitBtn
        Left = 351
        Top = 493
        Width = 92
        Height = 32
        Caption = '&Cancelar'
        TabOrder = 1
        OnClick = BitBtn2Click
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          333333333333333333333333000033338833333333333333333F333333333333
          0000333911833333983333333388F333333F3333000033391118333911833333
          38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
          911118111118333338F3338F833338F3000033333911111111833333338F3338
          3333F8330000333333911111183333333338F333333F83330000333333311111
          8333333333338F3333383333000033333339111183333333333338F333833333
          00003333339111118333333333333833338F3333000033333911181118333333
          33338333338F333300003333911183911183333333383338F338F33300003333
          9118333911183333338F33838F338F33000033333913333391113333338FF833
          38F338F300003333333333333919333333388333338FFF830000333333333333
          3333333333333333333888330000333333333333333333333333333333333333
          0000}
        NumGlyphs = 2
      end
      object DBEdit1: TDBEdit
        Left = 10
        Top = 12
        Width = 50
        Height = 21
        Color = clBtnFace
        DataField = 'CODIGOCLIENTE'
        DataSource = dmPrinc.dsCliente
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
      end
      object DBEdit2: TDBEdit
        Left = 410
        Top = 12
        Width = 100
        Height = 21
        DataField = 'DATACADASTRO'
        DataSource = dmPrinc.dsCliente
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 10
        ParentFont = False
        TabOrder = 3
      end
      object DBEdit3: TDBEdit
        Left = 10
        Top = 47
        Width = 500
        Height = 21
        CharCase = ecUpperCase
        DataField = 'NOMECOMPLETO'
        DataSource = dmPrinc.dsCliente
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
      end
      object DBEdit4: TDBEdit
        Left = 10
        Top = 83
        Width = 150
        Height = 21
        CharCase = ecUpperCase
        DataField = 'NICKNAME'
        DataSource = dmPrinc.dsCliente
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
      end
      object DBEdit5: TDBEdit
        Left = 10
        Top = 120
        Width = 500
        Height = 21
        CharCase = ecUpperCase
        DataField = 'ENDERECO'
        DataSource = dmPrinc.dsCliente
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 7
      end
      object DBEdit6: TDBEdit
        Left = 10
        Top = 158
        Width = 150
        Height = 21
        CharCase = ecUpperCase
        DataField = 'BAIRRO'
        DataSource = dmPrinc.dsCliente
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 8
      end
      object DBEdit7: TDBEdit
        Left = 182
        Top = 159
        Width = 200
        Height = 21
        CharCase = ecUpperCase
        DataField = 'CIDADE'
        DataSource = dmPrinc.dsCliente
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 9
      end
      object DBEdit8: TDBEdit
        Left = 408
        Top = 160
        Width = 100
        Height = 21
        CharCase = ecUpperCase
        DataField = 'UF'
        DataSource = dmPrinc.dsCliente
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 10
      end
      object DBEdit9: TDBEdit
        Left = 10
        Top = 196
        Width = 150
        Height = 21
        DataField = 'CEP'
        DataSource = dmPrinc.dsCliente
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 11
      end
      object DBEdit10: TDBEdit
        Left = 408
        Top = 196
        Width = 100
        Height = 21
        DataField = 'DATANASCTO'
        DataSource = dmPrinc.dsCliente
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 10
        ParentFont = False
        TabOrder = 12
      end
      object DBEdit11: TDBEdit
        Left = 182
        Top = 83
        Width = 329
        Height = 21
        CharCase = ecUpperCase
        DataField = 'NOMEMAE'
        DataSource = dmPrinc.dsCliente
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 6
      end
      object DBEdit12: TDBEdit
        Left = 10
        Top = 230
        Width = 100
        Height = 21
        DataField = 'FONE1'
        DataSource = dmPrinc.dsCliente
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 13
        ParentFont = False
        TabOrder = 13
      end
      object DBEdit13: TDBEdit
        Left = 408
        Top = 230
        Width = 100
        Height = 21
        DataField = 'FONE2'
        DataSource = dmPrinc.dsCliente
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 13
        ParentFont = False
        TabOrder = 14
      end
      object DBEdit14: TDBEdit
        Left = 10
        Top = 305
        Width = 350
        Height = 21
        CharCase = ecUpperCase
        DataField = 'NOMELOGIN'
        DataSource = dmPrinc.dsCliente
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 17
      end
      object DBEdit15: TDBEdit
        Left = 10
        Top = 346
        Width = 100
        Height = 21
        DataField = 'SENHALOGIN'
        DataSource = dmPrinc.dsCliente
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        PasswordChar = '*'
        TabOrder = 18
      end
      object DBEdit16: TDBEdit
        Left = 10
        Top = 421
        Width = 50
        Height = 21
        DataField = 'INDICACAO'
        DataSource = dmPrinc.dsCliente
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 22
      end
      object DBEdit17: TDBEdit
        Left = 88
        Top = 421
        Width = 420
        Height = 21
        CharCase = ecUpperCase
        DataField = 'NomePesq'
        DataSource = dmPrinc.dsCliente
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 23
      end
      object DBEdit18: TDBEdit
        Left = 10
        Top = 268
        Width = 199
        Height = 21
        DataField = 'CPF'
        DataSource = dmPrinc.dsCliente
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 14
        ParentFont = False
        TabOrder = 15
      end
      object DBEdit19: TDBEdit
        Left = 359
        Top = 268
        Width = 150
        Height = 21
        DataField = 'RG'
        DataSource = dmPrinc.dsCliente
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 10
        ParentFont = False
        TabOrder = 16
      end
      object DBEdit20: TDBEdit
        Left = 10
        Top = 384
        Width = 500
        Height = 21
        CharCase = ecLowerCase
        DataField = 'E_MAIL'
        DataSource = dmPrinc.dsCliente
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 21
      end
      object GroupBox1: TGroupBox
        Left = 360
        Top = 333
        Width = 149
        Height = 39
        Caption = 'Recebe e-mail'
        TabOrder = 20
        object DBCheckBox1: TDBCheckBox
          Left = 5
          Top = 16
          Width = 77
          Height = 17
          Caption = 'Milhagem'
          DataField = 'RECEBEMILHAGEM'
          DataSource = dmPrinc.dsCliente
          TabOrder = 0
          ValueChecked = 'T'
          ValueUnchecked = 'F'
        end
        object DBCheckBox2: TDBCheckBox
          Left = 75
          Top = 16
          Width = 69
          Height = 17
          Caption = 'Promo'#231#227'o'
          DataField = 'RECEBEPROMOCAO'
          DataSource = dmPrinc.dsCliente
          TabOrder = 1
          ValueChecked = 'T'
          ValueUnchecked = 'F'
        end
      end
      object LabeledEdit1: TLabeledEdit
        Left = 182
        Top = 345
        Width = 121
        Height = 21
        EditLabel.Width = 75
        EditLabel.Height = 13
        EditLabel.Caption = 'Confirma Senha'
        LabelPosition = lpAbove
        LabelSpacing = 1
        PasswordChar = '*'
        TabOrder = 19
      end
      object DBEdit24: TDBEdit
        Left = 10
        Top = 461
        Width = 134
        Height = 21
        CharCase = ecUpperCase
        DataField = 'LIMITEDIAS'
        DataSource = dmPrinc.dsCliente
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 24
      end
      object DBEdit25: TDBEdit
        Left = 377
        Top = 460
        Width = 134
        Height = 21
        CharCase = ecUpperCase
        DataField = 'LIMITEVALOR'
        DataSource = dmPrinc.dsCliente
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 25
      end
    end
  end
end
