object frmFornec: TfrmFornec
  Left = 252
  Top = 125
  Width = 655
  Height = 536
  BorderIcons = [biSystemMenu]
  Caption = 'Adme - Cadastro Fornecedor'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label11: TLabel
    Left = 364
    Top = 228
    Width = 37
    Height = 13
    Caption = 'Contato'
  end
  object Panel3: TPanel
    Left = 0
    Top = 456
    Width = 647
    Height = 53
    Align = alBottom
    TabOrder = 0
    object Label1: TLabel
      Left = 10
      Top = 25
      Width = 56
      Height = 13
      Caption = 'Pesquisar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object EditPesq: TEdit
      Left = 100
      Top = 19
      Width = 300
      Height = 21
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnChange = EditPesqChange
    end
    object RdGrpOrdem: TRadioGroup
      Left = 444
      Top = 8
      Width = 185
      Height = 36
      Caption = 'Ordem'
      Columns = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ItemIndex = 1
      Items.Strings = (
        'Fornecedor'
        'Código')
      ParentFont = False
      TabOrder = 1
      OnClick = RdGrpOrdemClick
    end
  end
  object PageCad: TPageControl
    Left = 0
    Top = 0
    Width = 647
    Height = 456
    ActivePage = TabDetalhe
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object TabGrid: TTabSheet
      Caption = 'Listagem'
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 639
        Height = 377
        Align = alClient
        Color = clInfoBk
        DataSource = dmEst.dsFornec
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'CODIGOFORNECEDOR'
            Title.Alignment = taCenter
            Title.Caption = 'Código Fornecedor'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME'
            Title.Alignment = taCenter
            Title.Caption = 'Nome'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TIPO'
            Title.Alignment = taCenter
            Title.Caption = 'Tipo'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OCUPACAO'
            Title.Alignment = taCenter
            Title.Caption = 'Ocupação'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CNPJ'
            Title.Alignment = taCenter
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IE'
            Title.Alignment = taCenter
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DATACADASTRO'
            Title.Alignment = taCenter
            Title.Caption = 'Data Cadastro'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ENDERECO'
            Title.Alignment = taCenter
            Title.Caption = 'Endereço'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BAIRRO'
            Title.Alignment = taCenter
            Title.Caption = 'Bairro'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CEP'
            Title.Alignment = taCenter
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CIDADE'
            Title.Alignment = taCenter
            Title.Caption = 'Cidade'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'UF'
            Title.Alignment = taCenter
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FONE'
            Title.Alignment = taCenter
            Title.Caption = 'Fone'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CONTATO'
            Title.Alignment = taCenter
            Title.Caption = 'Contato'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FAX'
            Title.Alignment = taCenter
            Title.Caption = 'Fax'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CELULAR'
            Title.Alignment = taCenter
            Title.Caption = 'Celular'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'EMAIL'
            Title.Alignment = taCenter
            Title.Caption = 'e-mail'
            Width = 64
            Visible = True
          end>
      end
    end
    object TabDetalhe: TTabSheet
      Caption = 'Detalhe'
      ImageIndex = 1
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 639
        Height = 41
        Align = alTop
        TabOrder = 0
        object DBNav: TDBNavigator
          Left = 9
          Top = 9
          Width = 96
          Height = 25
          DataSource = dmEst.dsFornec
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
          OnClick = dbNavBtnAppendClick
          NumGlyphs = 2
          DataButtonType = nbAppend
          Language = blPortugues
          DataSource = dmEst.dsFornec
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
          DataSource = dmEst.dsFornec
          DisableReasons = [drReadonly, drEditing, drEmpty]
          RuntimeEnabled = True
        end
        object dbNavBtnEdit: TDBNavigationButton
          Left = 280
          Top = 9
          Width = 75
          Height = 25
          Caption = 'E&dita'
          TabOrder = 3
          NumGlyphs = 2
          DataButtonType = nbEdit
          Language = blPortugues
          DataSource = dmEst.dsFornec
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
          DataSource = dmEst.dsFornec
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
          DataSource = dmEst.dsFornec
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
      object PanDados: TPanel
        Left = 0
        Top = 41
        Width = 639
        Height = 387
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object Label2: TLabel
          Left = 10
          Top = 10
          Width = 33
          Height = 13
          Caption = 'Código'
        end
        object Label3: TLabel
          Left = 10
          Top = 40
          Width = 28
          Height = 13
          Caption = 'Nome'
          FocusControl = DBEdit2
        end
        object DBText1: TDBText
          Left = 100
          Top = 10
          Width = 65
          Height = 17
          DataField = 'CODIGOFORNECEDOR'
          DataSource = dmEst.dsFornec
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 400
          Top = 10
          Width = 68
          Height = 13
          Caption = 'Data Cadastro'
        end
        object Label5: TLabel
          Left = 10
          Top = 70
          Width = 46
          Height = 13
          Caption = 'Endereço'
          FocusControl = DBEdit3
        end
        object Label6: TLabel
          Left = 10
          Top = 100
          Width = 27
          Height = 13
          Caption = 'Bairro'
          FocusControl = DBEdit4
        end
        object Label7: TLabel
          Left = 400
          Top = 100
          Width = 21
          Height = 13
          Caption = 'CEP'
          FocusControl = DBEdit5
        end
        object Label8: TLabel
          Left = 10
          Top = 130
          Width = 33
          Height = 13
          Caption = 'Cidade'
          FocusControl = DBEdit6
        end
        object Label9: TLabel
          Left = 400
          Top = 130
          Width = 14
          Height = 13
          Caption = 'UF'
          FocusControl = DBEdit7
        end
        object Label10: TLabel
          Left = 10
          Top = 175
          Width = 42
          Height = 13
          Caption = 'Contatos'
          FocusControl = DBEdit8
        end
        object Label12: TLabel
          Left = 10
          Top = 215
          Width = 24
          Height = 13
          Caption = 'Fone'
          FocusControl = DBEdit10
        end
        object Label13: TLabel
          Left = 400
          Top = 215
          Width = 17
          Height = 13
          Caption = 'Fax'
          FocusControl = DBEdit11
        end
        object Label17: TLabel
          Left = 10
          Top = 245
          Width = 27
          Height = 13
          Caption = 'CNPJ'
          FocusControl = DBEdit15
        end
        object Label18: TLabel
          Left = 400
          Top = 245
          Width = 10
          Height = 13
          Caption = 'IE'
          FocusControl = DBEdit16
        end
        object SpeedButton1: TSpeedButton
          Left = 500
          Top = 300
          Width = 100
          Height = 25
          Caption = '&Representante'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = SpeedButton1Click
        end
        object Label14: TLabel
          Left = 400
          Top = 273
          Width = 31
          Height = 13
          Caption = 'Banco'
        end
        object Label16: TLabel
          Left = 10
          Top = 273
          Width = 39
          Height = 13
          Caption = 'Agencia'
          FocusControl = DBEdit14
        end
        object Label20: TLabel
          Left = 10
          Top = 302
          Width = 64
          Height = 13
          Caption = 'Conta/Nome '
          FocusControl = DBEdit17
        end
        object Label21: TLabel
          Left = 10
          Top = 362
          Width = 27
          Height = 13
          Caption = 'e-mail'
        end
        object Label15: TLabel
          Left = 10
          Top = 334
          Width = 18
          Height = 13
          Caption = 'Site'
          FocusControl = DBEdit18
        end
        object Label19: TLabel
          Left = 400
          Top = 187
          Width = 57
          Height = 13
          Caption = 'Fone (0800)'
          FocusControl = DBEdit19
        end
        object SpeedButton2: TSpeedButton
          Left = 530
          Top = 357
          Width = 70
          Height = 25
          Caption = 'e-&mail'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object SpeedButton3: TSpeedButton
          Left = 530
          Top = 330
          Width = 70
          Height = 25
          Caption = '&Site'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBEdit2: TDBEdit
          Left = 100
          Top = 40
          Width = 500
          Height = 21
          CharCase = ecUpperCase
          Color = clInfoBk
          DataField = 'NOME'
          DataSource = dmEst.dsFornec
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
        end
        object DBEdit3: TDBEdit
          Left = 100
          Top = 70
          Width = 500
          Height = 21
          CharCase = ecUpperCase
          DataField = 'ENDERECO'
          DataSource = dmEst.dsFornec
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
        end
        object DBEdit4: TDBEdit
          Left = 100
          Top = 100
          Width = 250
          Height = 21
          CharCase = ecUpperCase
          DataField = 'BAIRRO'
          DataSource = dmEst.dsFornec
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
        end
        object DBEdit5: TDBEdit
          Left = 500
          Top = 100
          Width = 100
          Height = 21
          CharCase = ecUpperCase
          DataField = 'CEP'
          DataSource = dmEst.dsFornec
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 4
        end
        object DBEdit6: TDBEdit
          Left = 100
          Top = 130
          Width = 250
          Height = 21
          CharCase = ecUpperCase
          DataField = 'CIDADE'
          DataSource = dmEst.dsFornec
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 5
        end
        object DBEdit7: TDBEdit
          Left = 550
          Top = 130
          Width = 50
          Height = 21
          CharCase = ecUpperCase
          DataField = 'UF'
          DataSource = dmEst.dsFornec
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 6
        end
        object DBEdit8: TDBEdit
          Left = 100
          Top = 158
          Width = 150
          Height = 21
          CharCase = ecUpperCase
          DataField = 'CONTATO'
          DataSource = dmEst.dsFornec
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 7
        end
        object DBEdit10: TDBEdit
          Left = 100
          Top = 215
          Width = 150
          Height = 21
          DataField = 'FONE'
          DataSource = dmEst.dsFornec
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 10
        end
        object DBEdit11: TDBEdit
          Left = 450
          Top = 215
          Width = 150
          Height = 21
          DataField = 'FAX'
          DataSource = dmEst.dsFornec
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 11
        end
        object DBEdit13: TDBEdit
          Left = 100
          Top = 357
          Width = 400
          Height = 21
          CharCase = ecLowerCase
          DataField = 'EMAIL'
          DataSource = dmEst.dsFornec
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 19
        end
        object DBEdit15: TDBEdit
          Left = 100
          Top = 245
          Width = 150
          Height = 21
          CharCase = ecUpperCase
          Color = clInfoBk
          DataField = 'CNPJ'
          DataSource = dmEst.dsFornec
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          MaxLength = 14
          ParentFont = False
          TabOrder = 12
        end
        object DBEdit16: TDBEdit
          Left = 450
          Top = 245
          Width = 150
          Height = 21
          CharCase = ecUpperCase
          DataField = 'IE'
          DataSource = dmEst.dsFornec
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 13
        end
        object DBEdit1: TDBDateEdit
          Left = 479
          Top = 10
          Width = 121
          Height = 21
          DataField = 'DATACADASTRO'
          DataSource = dmEst.dsFornec
          DefaultToday = True
          DialogTitle = 'Selecione a Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          NumGlyphs = 2
          ParentFont = False
          TabOrder = 0
          StartOfWeek = Sun
          YearDigits = dyFour
        end
        object DBEdit9: TDBEdit
          Left = 100
          Top = 187
          Width = 150
          Height = 21
          CharCase = ecUpperCase
          DataField = 'CONTATO2'
          DataSource = dmEst.dsFornec
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 8
        end
        object DBEdit12: TDBEdit
          Left = 450
          Top = 273
          Width = 150
          Height = 21
          CharCase = ecUpperCase
          DataField = 'BANCO'
          DataSource = dmEst.dsFornec
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 15
        end
        object DBEdit14: TDBEdit
          Left = 100
          Top = 273
          Width = 90
          Height = 21
          CharCase = ecUpperCase
          DataField = 'AGENCIA'
          DataSource = dmEst.dsFornec
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 14
        end
        object DBEdit17: TDBEdit
          Left = 100
          Top = 302
          Width = 100
          Height = 21
          DataField = 'CONTA'
          DataSource = dmEst.dsFornec
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 16
        end
        object DBEdit18: TDBEdit
          Left = 100
          Top = 330
          Width = 400
          Height = 21
          CharCase = ecLowerCase
          DataField = 'SITE'
          DataSource = dmEst.dsFornec
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 18
        end
        object DBEdit19: TDBEdit
          Left = 470
          Top = 187
          Width = 130
          Height = 21
          DataField = 'FONEFREE'
          DataSource = dmEst.dsFornec
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 9
        end
        object DBEdit20: TDBEdit
          Left = 220
          Top = 302
          Width = 280
          Height = 21
          CharCase = ecUpperCase
          DataField = 'NOMECORR'
          DataSource = dmEst.dsFornec
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 17
        end
      end
    end
  end
end
