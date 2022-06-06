object frmMicros: TfrmMicros
  Left = 286
  Top = 258
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Guardian - Cadastro Micro'
  ClientHeight = 271
  ClientWidth = 592
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
  object Label1: TLabel
    Left = 262
    Top = 86
    Width = 40
    Height = 13
    Caption = 'Código'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 262
    Top = 136
    Width = 58
    Height = 13
    Caption = 'Descrição'
    FocusControl = DBEdit2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 262
    Top = 190
    Width = 85
    Height = 13
    Caption = 'Nome na Rede'
    FocusControl = DBEdit3
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DBText1: TDBText
    Left = 262
    Top = 102
    Width = 52
    Height = 16
    AutoSize = True
    Color = clHighlight
    DataField = 'CODIGOMICRO'
    DataSource = dtMod.dsMicro
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHighlightText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 56
    Width = 229
    Height = 203
    TabStop = False
    DataSource = dtMod.dsMicro
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'DESCRICAO'
        Title.Alignment = taCenter
        Title.Caption = 'Descrição do Micro'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 191
        Visible = True
      end>
  end
  object DBEdit2: TDBEdit
    Left = 262
    Top = 150
    Width = 184
    Height = 21
    DataField = 'Descricao'
    DataSource = dtMod.dsMicro
    TabOrder = 1
  end
  object DBEdit3: TDBEdit
    Left = 262
    Top = 204
    Width = 244
    Height = 21
    DataField = 'NetName'
    DataSource = dtMod.dsMicro
    TabOrder = 2
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 592
    Height = 41
    Align = alTop
    TabOrder = 3
    object DBNav: TDBNavigator
      Left = 9
      Top = 9
      Width = 96
      Height = 25
      DataSource = dtMod.dsMicro
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
      DataSource = dtMod.dsMicro
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
      DataSource = dtMod.dsMicro
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
      DataSource = dtMod.dsMicro
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
      DataSource = dtMod.dsMicro
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
      DataSource = dtMod.dsMicro
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
end
