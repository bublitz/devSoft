object frmSituacao: TfrmSituacao
  Left = 254
  Top = 296
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Guardian - Situação'
  ClientHeight = 228
  ClientWidth = 688
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
  object PageCad: TPageControl
    Left = 0
    Top = 0
    Width = 688
    Height = 175
    ActivePage = TabDetalhe
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object TabGrid: TTabSheet
      Caption = 'Listagem'
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 680
        Height = 110
        Align = alClient
        DataSource = dtMod.dsReceb
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
    end
    object TabDetalhe: TTabSheet
      Caption = 'Detalhe'
      ImageIndex = 1
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 680
        Height = 41
        Align = alTop
        TabOrder = 0
        object DBNav: TDBNavigator
          Left = 9
          Top = 9
          Width = 80
          Height = 25
          DataSource = dtMod.dsSituacao
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
          Left = 94
          Top = 9
          Width = 75
          Height = 25
          Caption = '&Insere'
          TabOrder = 1
          NumGlyphs = 2
          DataButtonType = nbAppend
          Language = blPortugues
          DataSource = dtMod.dsSituacao
          DisableReasons = [drReadonly, drEditing]
          RuntimeEnabled = True
        end
        object dbNavBtnDelete: TDBNavigationButton
          Left = 169
          Top = 9
          Width = 75
          Height = 25
          Caption = '&Exclui'
          TabOrder = 2
          NumGlyphs = 2
          DataButtonType = nbDelete
          Language = blPortugues
          DataSource = dtMod.dsSituacao
          DisableReasons = [drReadonly, drEditing, drEmpty]
          RuntimeEnabled = True
        end
        object dbNavBtnEdit: TDBNavigationButton
          Left = 244
          Top = 9
          Width = 75
          Height = 25
          Caption = '&Edita'
          TabOrder = 3
          NumGlyphs = 2
          DataButtonType = nbEdit
          Language = blPortugues
          DataSource = dtMod.dsSituacao
          DisableReasons = [drReadonly, drEditing, drEmpty]
          RuntimeEnabled = True
        end
        object dbNavBtnSave: TDBNavigationButton
          Left = 320
          Top = 9
          Width = 75
          Height = 25
          Caption = '&Atualiza'
          TabOrder = 4
          NumGlyphs = 2
          DataButtonType = nbPost
          Language = blPortugues
          DataSource = dtMod.dsSituacao
          DisableReasons = [drNotEditing]
          RuntimeEnabled = True
        end
        object dbNavBtnCancel: TDBNavigationButton
          Left = 396
          Top = 9
          Width = 75
          Height = 25
          Caption = '&Cancela'
          TabOrder = 5
          NumGlyphs = 2
          DataButtonType = nbCancel
          Language = blPortugues
          DataSource = dtMod.dsSituacao
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
        Width = 680
        Height = 106
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object Label2: TLabel
          Left = 10
          Top = 10
          Width = 78
          Height = 13
          Caption = 'Código Situação'
        end
        object DBText1: TDBText
          Left = 100
          Top = 10
          Width = 65
          Height = 17
          DataField = 'CODIGOSITUACAO'
          DataSource = dtMod.dsSituacao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label3: TLabel
          Left = 10
          Top = 40
          Width = 48
          Height = 13
          Caption = 'Descrição'
          FocusControl = DBEdit1
        end
        object Label17: TLabel
          Left = 10
          Top = 78
          Width = 71
          Height = 13
          Caption = 'Bloqueia Sócio'
        end
        object DBEdit1: TDBEdit
          Left = 100
          Top = 40
          Width = 500
          Height = 21
          CharCase = ecUpperCase
          DataField = 'DESCRICAO'
          DataSource = dtMod.dsSituacao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
        object RxDBComboBox2: TRxDBComboBox
          Left = 100
          Top = 74
          Width = 63
          Height = 21
          Style = csDropDownList
          DataField = 'BLOQUEIASOCIO'
          DataSource = dtMod.dsSituacao
          EnableValues = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ItemHeight = 13
          Items.Strings = (
            'Sim'
            'Não')
          ParentFont = False
          TabOrder = 1
          Values.Strings = (
            'S'
            'N')
        end
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 175
    Width = 688
    Height = 53
    Align = alBottom
    TabOrder = 1
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
      Items.Strings = (
        'Descrição'
        'Código')
      ParentFont = False
      TabOrder = 1
    end
  end
end
