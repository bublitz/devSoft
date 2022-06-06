object frmConfUser: TfrmConfUser
  Left = 210
  Top = 110
  Width = 696
  Height = 480
  Caption = 'Configuração de Usuários'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 242
    Top = 44
    Width = 41
    Height = 13
    Caption = 'Empresa'
  end
  object Label2: TLabel
    Left = 242
    Top = 90
    Width = 45
    Height = 13
    Caption = 'Matrícula'
    FocusControl = DBEdit2
  end
  object Label3: TLabel
    Left = 242
    Top = 135
    Width = 75
    Height = 13
    Caption = 'Nome Completo'
    FocusControl = DBEdit3
  end
  object Label4: TLabel
    Left = 428
    Top = 90
    Width = 82
    Height = 13
    Caption = 'Nome do Usuário'
    FocusControl = DBEdit4
  end
  object Label5: TLabel
    Left = 242
    Top = 181
    Width = 31
    Height = 13
    Caption = 'Senha'
    FocusControl = DBEdit5
    Visible = False
  end
  object Label6: TLabel
    Left = 406
    Top = 181
    Width = 41
    Height = 13
    Caption = 'Confirma'
    FocusControl = DBEdit5
    Visible = False
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 242
    Width = 688
    Height = 211
    ActivePage = TabSheet1
    Align = alBottom
    TabOrder = 8
    object TabSheet1: TTabSheet
      Caption = 'Configuração Padrão'
      object rdGrpConf: TDBRadioGroup
        Left = 0
        Top = 0
        Width = 680
        Height = 183
        Align = alClient
        Caption = 'Nível de Acesso:'
        DataField = 'NIVEL'
        DataSource = dmConf.dsUser
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        Items.Strings = (
          'MASTER     - acesso a todos os módulos'
          
            'AVANÇADO   - acesso a todos os módulos, não podendo criar/altera' +
            'r usuários'
          
            'OPERADOR A - acesso a maioria dos módulos, não podendo alterar f' +
            'órmulas'
          
            'OPERADOR B - acesso a maioria dos módulos, não tendo direito de ' +
            'exclusão'
          
            'OPERADOR C - acesso somente a cadastros, não podendo emitir rela' +
            'tórios'
          'VENDEDOR   - acesso somente ao módulo de vendas')
        ParentFont = False
        TabOrder = 0
        Values.Strings = (
          '1'
          '2'
          '3'
          '4'
          '5'
          '6')
        OnChange = chkLstEstoqueClick
        OnClick = chkLstEstoqueClick
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Estoque'
      ImageIndex = 1
      object sBtnAllEst: TSpeedButton
        Left = 12
        Top = 6
        Width = 26
        Height = 25
        Hint = 'Marcar todos'
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
        Layout = blGlyphTop
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = sBtnAllEstClick
      end
      object sBtnNotEst: TSpeedButton
        Left = 12
        Top = 31
        Width = 26
        Height = 25
        Hint = 'Desmarcar todos'
        Flat = True
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          04000000000080000000C40E0000C40E00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          5555555555FF555555555555577FF555555555557777F555555555557777FF55
          5555555777777F555555557777777FF555555777757777F555557775555777FF
          555555555557777F555555555555777FF555555555555777FF55555555555577
          7FF555555555555777FF55555555555557775555555555555555}
        Layout = blGlyphTop
        ParentShowHint = False
        ShowHint = True
        OnClick = sBtnNotEstClick
      end
      object chkLstEstoque: TCheckListBox
        Left = 56
        Top = 0
        Width = 624
        Height = 183
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
          'PRODUTO'
          '   Alterar Comissão'
          '   Alterar Estoque'
          '   Excluir'
          'SUB-GRUPO'
          '   Alterar Fórmula'
          '   Excluir'
          'GRUPO'
          '   Exclui'
          'VENDEDOR'
          '   Excluir')
        ParentFont = False
        TabOrder = 0
        OnClick = chkLstEstoqueClick
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'TabSheet3'
      ImageIndex = 2
    end
    object TabSheet4: TTabSheet
      Caption = 'TabSheet4'
      ImageIndex = 3
    end
    object TabSheet5: TTabSheet
      Caption = 'TabSheet5'
      ImageIndex = 4
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 688
    Height = 41
    Align = alTop
    TabOrder = 0
    object DBNav: TDBNavigator
      Left = 9
      Top = 9
      Width = 96
      Height = 25
      DataSource = dmConf.dsUser
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
      DataSource = dmConf.dsUser
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
      DataSource = dmConf.dsUser
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
      DataSource = dmConf.dsUser
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
      DataSource = dmConf.dsUser
      OnBeforeAction = dbNavBtnSaveBeforeAction
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
      DataSource = dmConf.dsUser
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
      OnClick = BitBtn1Click
      Kind = bkClose
    end
  end
  object DBEdit2: TDBEdit
    Left = 240
    Top = 106
    Width = 154
    Height = 21
    DataField = 'MATRICULA'
    DataSource = dmConf.dsUser
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
  end
  object DBEdit3: TDBEdit
    Left = 240
    Top = 151
    Width = 341
    Height = 21
    DataField = 'NOME'
    DataSource = dmConf.dsUser
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
  end
  object DBEdit4: TDBEdit
    Left = 428
    Top = 106
    Width = 154
    Height = 21
    CharCase = ecUpperCase
    DataField = 'USERNAME'
    DataSource = dmConf.dsUser
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
  end
  object DBEdit5: TDBEdit
    Left = 240
    Top = 197
    Width = 154
    Height = 21
    DataField = 'SENHA'
    DataSource = dmConf.dsUser
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    PasswordChar = '#'
    TabOrder = 5
    Visible = False
    OnChange = DBEdit5Change
  end
  object btnSalvar: TBitBtn
    Left = 580
    Top = 210
    Width = 105
    Height = 25
    Caption = 'Salvar Direitos'
    Enabled = False
    TabOrder = 7
    OnClick = btnSalvarClick
    Glyph.Data = {
      9E020000424D9E0200000000000036000000280000000E0000000E0000000100
      18000000000068020000C40E0000C40E00000000000000000000CED3D6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000086840086840000000000000000000000000000000000
      00C6C7C6C6C7C600000000868400000000000000000086840086840000000000
      00000000000000000000000000C6C7C6C6C7C600000000868400000000000000
      00008684008684000000000000000000000000000000000000C6C7C6C6C7C600
      0000008684000000000000000000868400868400000000000000000000000000
      0000000000000000000000000000008684000000000000000000868400868400
      8684008684008684008684008684008684008684008684008684008684000000
      0000000000008684008684000000000000000000000000000000000000000000
      0000000086840086840000000000000000008684000000C6C7C6C6C7C6C6C7C6
      C6C7C6C6C7C6C6C7C6C6C7C6C6C7C60000000086840000000000000000008684
      000000C6C7C6C6C7C6C6C7C6C6C7C6C6C7C6C6C7C6C6C7C6C6C7C60000000086
      840000000000000000008684000000C6C7C6C6C7C6C6C7C6C6C7C6C6C7C6C6C7
      C6C6C7C6C6C7C60000000086840000000000000000008684000000C6C7C6C6C7
      C6C6C7C6C6C7C6C6C7C6C6C7C6C6C7C6C6C7C600000000868400000000000000
      00008684000000C6C7C6C6C7C6C6C7C6C6C7C6C6C7C6C6C7C6C6C7C6C6C7C600
      00000000000000000000000000008684000000C6C7C6C6C7C6C6C7C6C6C7C6C6
      C7C6C6C7C6C6C7C6C6C7C6000000C6C7C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000}
  end
  object DBGrid1: TDBGrid
    Left = 3
    Top = 44
    Width = 231
    Height = 192
    DataSource = dmConf.dsUser
    TabOrder = 9
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'NOME'
        Width = 194
        Visible = True
      end>
  end
  object edtSenha: TEdit
    Left = 406
    Top = 197
    Width = 154
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    PasswordChar = '#'
    TabOrder = 6
    Visible = False
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 240
    Top = 60
    Width = 340
    Height = 21
    DataField = 'NomeEmpresa'
    DataSource = dmConf.dsUser
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
end
