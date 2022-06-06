object frmFormaPaga: TfrmFormaPaga
  Left = 241
  Top = 207
  Width = 655
  Height = 337
  BorderIcons = [biSystemMenu]
  Caption = 'Adme - Forma de Pagamento'
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
    Top = 257
    Width = 647
    Height = 53
    Align = alBottom
    TabOrder = 0
    object Label1: TLabel
      Left = 10
      Top = 22
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
      Left = 102
      Top = 17
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
      Top = 7
      Width = 185
      Height = 37
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
    Width = 647
    Height = 257
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
        Height = 229
        Align = alClient
        Color = clInfoBk
        DataSource = dmEst.dsFormaPag
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
            FieldName = 'CODIGOFORMAPAGAMENTO'
            Title.Alignment = taCenter
            Title.Caption = 'Código Forma Pagmento'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FORNECEDOR'
            Title.Alignment = taCenter
            Title.Caption = 'Fornecedor'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRICAO'
            Title.Alignment = taCenter
            Title.Caption = 'Descrição'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PERCENTUAL'
            Title.Alignment = taCenter
            Title.Caption = 'Percentual'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PARCELAS'
            Title.Alignment = taCenter
            Title.Caption = 'Parcelas'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'INTERVALO'
            Title.Alignment = taCenter
            Title.Caption = 'Intervalo'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRIMEIROVENCTO'
            Title.Alignment = taCenter
            Title.Caption = 'Primeiro Vencto'
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
          DataSource = dmEst.dsFormaPag
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
          DataSource = dmEst.dsFormaPag
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
          DataSource = dmEst.dsFormaPag
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
          DataSource = dmEst.dsFormaPag
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
          DataSource = dmEst.dsFormaPag
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
          DataSource = dmEst.dsFormaPag
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
        Height = 188
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object Label4: TLabel
          Left = 10
          Top = 80
          Width = 48
          Height = 13
          Caption = 'Descrição'
          FocusControl = DBEdit3
        end
        object Label5: TLabel
          Left = 10
          Top = 120
          Width = 51
          Height = 13
          Caption = 'Percentual'
          FocusControl = DBEdit4
        end
        object Label8: TLabel
          Left = 400
          Top = 121
          Width = 41
          Height = 13
          Caption = 'Parcelas'
          FocusControl = DBEdit7
        end
        object Label9: TLabel
          Left = 10
          Top = 157
          Width = 41
          Height = 13
          Caption = 'Intervalo'
          FocusControl = DBEdit8
        end
        object Label10: TLabel
          Left = 400
          Top = 157
          Width = 47
          Height = 13
          Caption = '1º Vencto'
          FocusControl = DBEdit9
        end
        object Label11: TLabel
          Left = 10
          Top = 40
          Width = 54
          Height = 13
          Caption = 'Fornecedor'
        end
        object Label2: TLabel
          Left = 155
          Top = 120
          Width = 16
          Height = 20
          Caption = '%'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label3: TLabel
          Left = 10
          Top = 10
          Width = 33
          Height = 13
          Caption = 'Código'
        end
        object DBText1: TDBText
          Left = 100
          Top = 10
          Width = 65
          Height = 17
          DataField = 'CODIGOFORMAPAGAMENTO'
          DataSource = dmEst.dsFormaPag
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object SpeedButton1: TSpeedButton
          Left = 610
          Top = 40
          Width = 23
          Height = 22
          Flat = True
        end
        object DBEdit3: TDBEdit
          Left = 100
          Top = 80
          Width = 500
          Height = 21
          CharCase = ecUpperCase
          DataField = 'DESCRICAO'
          DataSource = dmEst.dsFormaPag
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
        end
        object DBEdit4: TDBEdit
          Left = 102
          Top = 120
          Width = 50
          Height = 21
          DataField = 'PERCENTUAL'
          DataSource = dmEst.dsFormaPag
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
        end
        object DBEdit7: TDBEdit
          Left = 500
          Top = 121
          Width = 100
          Height = 21
          DataField = 'PARCELAS'
          DataSource = dmEst.dsFormaPag
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
        end
        object DBEdit8: TDBEdit
          Left = 100
          Top = 157
          Width = 100
          Height = 21
          DataField = 'INTERVALO'
          DataSource = dmEst.dsFormaPag
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 4
        end
        object DBEdit9: TDBEdit
          Left = 540
          Top = 157
          Width = 64
          Height = 21
          DataField = 'PRIMEIROVENCTO'
          DataSource = dmEst.dsFormaPag
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 5
        end
        object RxDBLookupCombo1: TRxDBLookupCombo
          Left = 100
          Top = 40
          Width = 500
          Height = 21
          DropDownCount = 8
          DataField = 'FORNECEDOR'
          DataSource = dmEst.dsFormaPag
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
      end
    end
  end
end
