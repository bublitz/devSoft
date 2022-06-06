object frmCadUsuario: TfrmCadUsuario
  Left = 196
  Top = 116
  Width = 800
  Height = 580
  ActiveControl = edtPesq
  Caption = 'devAdm - Cadastro de Usu'#225'rios'
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
    Width = 792
    Height = 553
    ActivePage = TabSheet1
    Align = alClient
    TabIndex = 0
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Listagem'
      object ToolBar1: TToolBar
        Left = 0
        Top = 0
        Width = 784
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
          Width = 208
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
        Width = 784
        Height = 496
        Align = alClient
        DataSource = dmPrinc.dsUsuario
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
            FieldName = 'CODIGOUSUARIO'
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
            FieldName = 'NOMECOMPLETO'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CORTESIA'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DATAALTERASENHA'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCTOMAXIMO'
            Width = 64
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
        Top = 0
        Width = 72
        Height = 13
        Caption = 'C'#243'digo Usu'#225'rio'
        FocusControl = DBEdit1
      end
      object Label2: TLabel
        Left = 10
        Top = 40
        Width = 75
        Height = 13
        Caption = 'Nome Completo'
        FocusControl = DBEdit2
      end
      object Label3: TLabel
        Left = 10
        Top = 80
        Width = 57
        Height = 13
        Caption = 'Nome Login'
        FocusControl = DBEdit3
      end
      object Label4: TLabel
        Left = 10
        Top = 121
        Width = 31
        Height = 13
        Caption = 'Senha'
        FocusControl = DBEdit4
      end
      object Label5: TLabel
        Left = 372
        Top = 123
        Width = 87
        Height = 13
        Caption = 'Data Altera Senha'
        FocusControl = DBEdit5
      end
      object Label6: TLabel
        Left = 10
        Top = 162
        Width = 38
        Height = 13
        Caption = 'Cortesia'
        FocusControl = DBEdit6
      end
      object Label7: TLabel
        Left = 372
        Top = 162
        Width = 67
        Height = 13
        Caption = 'Desc. M'#225'ximo'
        FocusControl = DBEdit7
      end
      object Label8: TLabel
        Left = 6
        Top = 209
        Width = 38
        Height = 13
        Caption = 'Direitos:'
        FocusControl = PageControl2
      end
      object btnGravar: TBitBtn
        Left = 182
        Top = 485
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
        Left = 529
        Top = 485
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
        Top = 15
        Width = 50
        Height = 21
        Color = clBtnFace
        DataField = 'CODIGOUSUARIO'
        DataSource = dmPrinc.dsUsuario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
      end
      object DBEdit2: TDBEdit
        Left = 10
        Top = 56
        Width = 500
        Height = 21
        CharCase = ecUpperCase
        DataField = 'NOMECOMPLETO'
        DataSource = dmPrinc.dsUsuario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
      end
      object DBEdit3: TDBEdit
        Left = 10
        Top = 96
        Width = 290
        Height = 21
        CharCase = ecUpperCase
        DataField = 'NOMELOGIN'
        DataSource = dmPrinc.dsUsuario
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
        Top = 138
        Width = 150
        Height = 21
        DataField = 'SENHA'
        DataSource = dmPrinc.dsUsuario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        PasswordChar = '*'
        TabOrder = 5
      end
      object DBEdit5: TDBEdit
        Left = 372
        Top = 138
        Width = 134
        Height = 21
        DataField = 'DATAALTERASENHA'
        DataSource = dmPrinc.dsUsuario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 6
      end
      object DBEdit6: TDBEdit
        Left = 10
        Top = 178
        Width = 134
        Height = 21
        DataField = 'CORTESIA'
        DataSource = dmPrinc.dsUsuario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 7
      end
      object DBEdit7: TDBEdit
        Left = 372
        Top = 178
        Width = 134
        Height = 21
        DataField = 'DESCTOMAXIMO'
        DataSource = dmPrinc.dsUsuario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 8
      end
      object PageControl2: TPageControl
        Left = 0
        Top = 223
        Width = 784
        Height = 254
        ActivePage = TabSheet3
        TabIndex = 0
        TabOrder = 9
        object TabSheet3: TTabSheet
          Caption = 'Acesso'
          object chkModulos: TCheckListBox
            Left = 0
            Top = 96
            Width = 776
            Height = 130
            Align = alClient
            BevelInner = bvLowered
            BevelKind = bkFlat
            BevelWidth = 3
            BorderStyle = bsNone
            Color = clBtnFace
            Columns = 1
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = []
            ItemHeight = 14
            Items.Strings = (
              'devGuardian'
              'devAdm'
              'devEstoque'
              'devFinanceiro'
              'devReport'
              'devGraphic')
            ParentFont = False
            TabOrder = 0
          end
          object RadioGroup1: TRadioGroup
            Left = 0
            Top = 0
            Width = 776
            Height = 96
            Align = alTop
            Caption = ' N'#237'vel de Acesso: '
            Columns = 3
            Items.Strings = (
              'Master'
              'Administrador'
              'Usu'#225'rio Avan'#231'ado'
              'Usu'#225'rio Padr'#227'o')
            TabOrder = 1
            OnClick = RadioGroup1Click
          end
        end
        object TabSheet4: TTabSheet
          Caption = 'devGuardian'
          ImageIndex = 1
          object chkGuardian: TCheckListBox
            Left = 0
            Top = 0
            Width = 776
            Height = 226
            Align = alClient
            BevelKind = bkFlat
            BevelWidth = 2
            BorderStyle = bsNone
            Color = clBtnFace
            Columns = 1
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = []
            ItemHeight = 14
            Items.Strings = (
              'Lan'#231'amentos no Caixa'
              'Liberar Esta'#231#245'es - Manuten'#231#227'o')
            ParentFont = False
            TabOrder = 0
          end
        end
        object TabSheet5: TTabSheet
          Caption = 'devAdm'
          ImageIndex = 2
          object chkAdm: TCheckListBox
            Left = 0
            Top = 0
            Width = 776
            Height = 226
            Align = alClient
            BevelKind = bkFlat
            BevelWidth = 2
            BorderStyle = bsNone
            Color = clBtnFace
            Columns = 3
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = []
            ItemHeight = 14
            Items.Strings = (
              'Esta'#231#245'es'
              '   Excluir'
              'Usu'#225'rios'
              '   Excluir'
              'Log do Sistema'
              'Clientes'
              '   Limite'
              '   Conta Corrente'
              'Horas Antecipadas'
              '   Excluir'
              'Milhagem'
              '   Excluir'
              'B'#244'nus'
              '   Excluir'
              'Pre'#231'os'
              '   Excluir'
              'Promo'#231#245'es/Panfletos'
              '   Excluir'
              'E-Mail Automatizado'
              '   Excluir'
              'Backup'
              'Restore')
            ParentFont = False
            TabOrder = 0
          end
        end
        object TabSheet6: TTabSheet
          Caption = 'devEstoque'
          ImageIndex = 3
          object chkEstoque: TCheckListBox
            Left = 0
            Top = 0
            Width = 776
            Height = 226
            Align = alClient
            BevelKind = bkFlat
            BevelWidth = 2
            BorderStyle = bsNone
            Color = clBtnFace
            Columns = 1
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = []
            ItemHeight = 14
            ParentFont = False
            TabOrder = 0
          end
        end
        object TabSheet7: TTabSheet
          Caption = 'devFinanceiro'
          ImageIndex = 4
          object chkFinan: TCheckListBox
            Left = 0
            Top = 0
            Width = 776
            Height = 226
            Align = alClient
            BevelKind = bkFlat
            BevelWidth = 2
            BorderStyle = bsNone
            Color = clBtnFace
            Columns = 1
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = []
            ItemHeight = 14
            ParentFont = False
            TabOrder = 0
          end
        end
        object TabSheet8: TTabSheet
          Caption = 'devReport'
          ImageIndex = 5
          object chkReport: TCheckListBox
            Left = 0
            Top = 0
            Width = 776
            Height = 226
            Align = alClient
            BevelKind = bkFlat
            BevelWidth = 2
            BorderStyle = bsNone
            Color = clBtnFace
            Columns = 1
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = []
            ItemHeight = 14
            ParentFont = False
            TabOrder = 0
          end
        end
        object TabSheet9: TTabSheet
          Caption = 'devGraphic'
          ImageIndex = 6
          object chkGraphic: TCheckListBox
            Left = 0
            Top = 0
            Width = 776
            Height = 226
            Align = alClient
            BevelKind = bkFlat
            BevelWidth = 2
            BorderStyle = bsNone
            Color = clBtnFace
            Columns = 1
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = []
            ItemHeight = 14
            ParentFont = False
            TabOrder = 0
          end
        end
      end
    end
  end
end
