object frmPrecos: TfrmPrecos
  Left = 218
  Top = 171
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Guardian - Cadastro Preço'
  ClientHeight = 207
  ClientWidth = 641
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
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 641
    Height = 41
    Align = alTop
    TabOrder = 0
    object DBNav: TDBNavigator
      Left = 9
      Top = 9
      Width = 96
      Height = 25
      DataSource = dtMod.dsPreco
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
      DataSource = dtMod.dsPreco
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
      DataSource = dtMod.dsPreco
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
      DataSource = dtMod.dsPreco
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
      DataSource = dtMod.dsPreco
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
      DataSource = dtMod.dsPreco
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
    Width = 641
    Height = 166
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 0
      Top = 0
      Width = 641
      Height = 166
      Align = alClient
      DataSource = dtMod.dsPreco
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'DescricaoDiaSemana'
          Title.Caption = 'Dia'
          Width = 180
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AVULSO15'
          Title.Alignment = taRightJustify
          Title.Caption = 'Avulso 15'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AVULSO30'
          Title.Alignment = taRightJustify
          Title.Caption = 'Avulso 30'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALORAVULSO'
          Title.Alignment = taRightJustify
          Title.Caption = 'Avulso 60'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SOCIO15'
          Title.Alignment = taRightJustify
          Title.Caption = 'Sócio 15'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SOCIO30'
          Title.Alignment = taRightJustify
          Title.Caption = 'Sócio 30'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALORSOCIO'
          Title.Alignment = taRightJustify
          Title.Caption = 'Sócio 60'
          Width = 70
          Visible = True
        end>
    end
  end
end
