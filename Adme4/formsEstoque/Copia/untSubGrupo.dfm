object frmSubGrupo: TfrmSubGrupo
  Left = 210
  Top = 283
  Width = 655
  Height = 283
  BorderIcons = [biSystemMenu]
  Caption = 'Adme - Cadastro Sub Grupo'
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
  object Panel3: TPanel
    Left = 0
    Top = 203
    Width = 647
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
        'Sub Grupo'
        'C�digo')
      ParentFont = False
      TabOrder = 1
      OnClick = RdGrpOrdemClick
    end
  end
  object PageCad: TPageControl
    Left = 0
    Top = 0
    Width = 647
    Height = 203
    ActivePage = TabDetalhe
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object TabDetalhe: TTabSheet
      Caption = 'Detalhe'
      ImageIndex = 1
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 639
        Height = 41
        Align = alTop
        TabOrder = 1
        object DBNav: TDBNavigator
          Left = 9
          Top = 9
          Width = 96
          Height = 25
          DataSource = dmEst.dsSubGrupo
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
          Flat = True
          Hints.Strings = (
            'Primeiro'
            'Anterior'
            'Pr�ximo'
            '�ltimo')
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
          DataSource = dmEst.dsSubGrupo
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
          DataSource = dmEst.dsSubGrupo
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
          DataSource = dmEst.dsSubGrupo
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
          DataSource = dmEst.dsSubGrupo
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
          DataSource = dmEst.dsSubGrupo
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
        Height = 134
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object DBGrid1: TDBGrid
          Left = 0
          Top = 0
          Width = 639
          Height = 134
          Align = alClient
          Color = clInfoBk
          DataSource = dmEst.dsSubGrupo
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
          Columns = <
            item
              Expanded = False
              FieldName = 'CODIGOSUBGRUPO'
              Title.Caption = 'C�digo Sub-Grupo'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRICAO'
              Title.Caption = 'Descri��o'
              Visible = True
            end>
        end
      end
    end
  end
end
