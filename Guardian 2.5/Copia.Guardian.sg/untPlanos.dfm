object frmPlanos: TfrmPlanos
  Left = 281
  Top = 258
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Guardian - Cadastro Plano'
  ClientHeight = 255
  ClientWidth = 633
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel3: TPanel
    Left = 0
    Top = 202
    Width = 633
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
      Left = 440
      Top = 6
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
        'Descrição'
        'Código')
      ParentFont = False
      TabOrder = 1
      OnClick = RdGrpOrdemClick
    end
  end
  object PageCad: TPageControl
    Left = 0
    Top = 0
    Width = 633
    Height = 202
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
        Width = 625
        Height = 174
        Align = alClient
        DataSource = dtMod.dsPlano
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
            FieldName = 'CODIGOPLANO'
            Title.Caption = 'Código Plano'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRICAO'
            Title.Caption = 'Descrição'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'HORAS'
            Title.Caption = 'Horas'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR'
            Title.Alignment = taRightJustify
            Title.Caption = 'Valor'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MESES'
            Title.Caption = 'Validade (meses)'
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
        Width = 625
        Height = 41
        Align = alTop
        TabOrder = 0
        object DBNav: TDBNavigator
          Left = 9
          Top = 9
          Width = 80
          Height = 25
          DataSource = dtMod.dsPlano
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
          Left = 96
          Top = 9
          Width = 75
          Height = 25
          Caption = '&Insere'
          TabOrder = 1
          OnClick = dbNavBtnAppendClick
          NumGlyphs = 2
          DataButtonType = nbAppend
          Language = blPortugues
          DataSource = dtMod.dsPlano
          DisableReasons = [drReadonly, drEditing]
          RuntimeEnabled = True
        end
        object dbNavBtnDelete: TDBNavigationButton
          Left = 172
          Top = 9
          Width = 75
          Height = 25
          Caption = '&Exclui'
          TabOrder = 2
          NumGlyphs = 2
          DataButtonType = nbDelete
          Language = blPortugues
          DataSource = dtMod.dsPlano
          DisableReasons = [drReadonly, drEditing, drEmpty]
          RuntimeEnabled = True
        end
        object dbNavBtnEdit: TDBNavigationButton
          Left = 247
          Top = 9
          Width = 75
          Height = 25
          Caption = '&Edita'
          TabOrder = 3
          NumGlyphs = 2
          DataButtonType = nbEdit
          Language = blPortugues
          DataSource = dtMod.dsPlano
          DisableReasons = [drReadonly, drEditing, drEmpty]
          RuntimeEnabled = True
        end
        object dbNavBtnSave: TDBNavigationButton
          Left = 323
          Top = 9
          Width = 75
          Height = 25
          Caption = '&Atualiza'
          TabOrder = 4
          NumGlyphs = 2
          DataButtonType = nbPost
          Language = blPortugues
          DataSource = dtMod.dsPlano
          DisableReasons = [drNotEditing]
          RuntimeEnabled = True
        end
        object dbNavBtnCancel: TDBNavigationButton
          Left = 398
          Top = 9
          Width = 75
          Height = 25
          Caption = '&Cancela'
          TabOrder = 5
          NumGlyphs = 2
          DataButtonType = nbCancel
          Language = blPortugues
          DataSource = dtMod.dsPlano
          DisableReasons = [drNotEditing]
          RuntimeEnabled = True
        end
        object BitBtn1: TBitBtn
          Left = 539
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
        Width = 625
        Height = 133
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object Label2: TLabel
          Left = 10
          Top = 10
          Width = 63
          Height = 13
          Caption = 'Código Plano'
        end
        object Label3: TLabel
          Left = 10
          Top = 40
          Width = 48
          Height = 13
          Caption = 'Descrição'
          FocusControl = DBEdit2
        end
        object Label4: TLabel
          Left = 10
          Top = 70
          Width = 28
          Height = 13
          Caption = 'Horas'
          FocusControl = DBEdit3
        end
        object Label5: TLabel
          Left = 400
          Top = 74
          Width = 24
          Height = 13
          Caption = 'Valor'
          FocusControl = DBEdit4
        end
        object DBText1: TDBText
          Left = 100
          Top = 10
          Width = 65
          Height = 17
          DataField = 'CODIGOPLANO'
          DataSource = dtMod.dsPlano
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label6: TLabel
          Left = 10
          Top = 98
          Width = 80
          Height = 13
          Caption = 'Validade (meses)'
          FocusControl = DBEdit1
        end
        object DBEdit2: TDBEdit
          Left = 100
          Top = 40
          Width = 500
          Height = 21
          CharCase = ecUpperCase
          DataField = 'DESCRICAO'
          DataSource = dtMod.dsPlano
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
        object DBEdit3: TDBEdit
          Left = 100
          Top = 70
          Width = 100
          Height = 21
          DataField = 'HORAS'
          DataSource = dtMod.dsPlano
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
        end
        object DBEdit4: TDBEdit
          Left = 500
          Top = 74
          Width = 100
          Height = 21
          DataField = 'VALOR'
          DataSource = dtMod.dsPlano
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
        end
        object DBEdit1: TDBEdit
          Left = 100
          Top = 98
          Width = 100
          Height = 21
          DataField = 'MESES'
          DataSource = dtMod.dsPlano
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
        end
      end
    end
  end
end
