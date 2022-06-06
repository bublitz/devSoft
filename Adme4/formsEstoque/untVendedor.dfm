object frmVendedor: TfrmVendedor
  Left = 192
  Top = 107
  Width = 655
  Height = 480
  BorderIcons = [biSystemMenu]
  Caption = 'Adme - Cadastro Vendedor'
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
  object PageCad: TPageControl
    Left = 0
    Top = 0
    Width = 647
    Height = 400
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
        Width = 639
        Height = 372
        Align = alClient
        Color = clInfoBk
        DataSource = dmEst.dsVendedor
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
            FieldName = 'CODIGO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ENDERECO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'APELIDO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BAIRRO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CIDADE'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CEP'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'UF'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FONE'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CELULAR'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CPF'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RG'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'EMAIL'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TIPO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'COMISSAO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCONTOMAXIMO'
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
          DataSource = dmEst.dsVendedor
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
          DataSource = dmEst.dsVendedor
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
          DataSource = dmEst.dsVendedor
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
          DataSource = dmEst.dsVendedor
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
          DataSource = dmEst.dsVendedor
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
          DataSource = dmEst.dsVendedor
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
        Height = 331
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
          DataField = 'CODIGO'
          DataSource = dmEst.dsVendedor
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
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
          Left = 398
          Top = 130
          Width = 14
          Height = 13
          Caption = 'UF'
          FocusControl = DBEdit7
        end
        object Label10: TLabel
          Left = 10
          Top = 160
          Width = 41
          Height = 13
          Caption = 'Apeldido'
          FocusControl = DBEdit8
        end
        object Label11: TLabel
          Left = 402
          Top = 160
          Width = 45
          Height = 13
          Caption = 'Comissão'
          FocusControl = DBEdit9
        end
        object Label12: TLabel
          Left = 10
          Top = 190
          Width = 24
          Height = 13
          Caption = 'Fone'
          FocusControl = DBEdit10
        end
        object Label13: TLabel
          Left = 400
          Top = 190
          Width = 46
          Height = 13
          Caption = 'Desconto'
          FocusControl = DBEdit11
        end
        object Label14: TLabel
          Left = 10
          Top = 220
          Width = 32
          Height = 13
          Caption = 'Celular'
          FocusControl = DBEdit12
        end
        object Label15: TLabel
          Left = 10
          Top = 250
          Width = 27
          Height = 13
          Caption = 'e-mail'
          FocusControl = DBEdit13
        end
        object Label16: TLabel
          Left = 10
          Top = 310
          Width = 21
          Height = 13
          Caption = 'Tipo'
          FocusControl = DBEdit14
        end
        object Label17: TLabel
          Left = 10
          Top = 280
          Width = 20
          Height = 13
          Caption = 'CPF'
          FocusControl = DBEdit15
        end
        object Label18: TLabel
          Left = 400
          Top = 280
          Width = 16
          Height = 13
          Caption = 'RG'
          FocusControl = DBEdit16
        end
        object DBEdit2: TDBEdit
          Left = 100
          Top = 40
          Width = 500
          Height = 21
          CharCase = ecUpperCase
          DataField = 'NOME'
          DataSource = dmEst.dsVendedor
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
          Width = 500
          Height = 21
          CharCase = ecUpperCase
          DataField = 'ENDERECO'
          DataSource = dmEst.dsVendedor
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
        end
        object DBEdit4: TDBEdit
          Left = 100
          Top = 100
          Width = 250
          Height = 21
          CharCase = ecUpperCase
          DataField = 'BAIRRO'
          DataSource = dmEst.dsVendedor
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
        end
        object DBEdit5: TDBEdit
          Left = 500
          Top = 100
          Width = 100
          Height = 21
          CharCase = ecUpperCase
          DataField = 'CEP'
          DataSource = dmEst.dsVendedor
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
        end
        object DBEdit6: TDBEdit
          Left = 100
          Top = 130
          Width = 250
          Height = 21
          CharCase = ecUpperCase
          DataField = 'CIDADE'
          DataSource = dmEst.dsVendedor
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 4
        end
        object DBEdit7: TDBEdit
          Left = 550
          Top = 130
          Width = 50
          Height = 21
          DataField = 'UF'
          DataSource = dmEst.dsVendedor
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 5
        end
        object DBEdit8: TDBEdit
          Left = 100
          Top = 160
          Width = 250
          Height = 21
          CharCase = ecUpperCase
          DataField = 'APELIDO'
          DataSource = dmEst.dsVendedor
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 6
        end
        object DBEdit9: TDBEdit
          Left = 500
          Top = 162
          Width = 100
          Height = 21
          CharCase = ecUpperCase
          DataField = 'COMISSAO'
          DataSource = dmEst.dsVendedor
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
          Top = 190
          Width = 150
          Height = 21
          DataField = 'FONE'
          DataSource = dmEst.dsVendedor
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 8
        end
        object DBEdit11: TDBEdit
          Left = 500
          Top = 190
          Width = 100
          Height = 21
          DataField = 'DESCONTOMAXIMO'
          DataSource = dmEst.dsVendedor
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 9
        end
        object DBEdit12: TDBEdit
          Left = 100
          Top = 220
          Width = 150
          Height = 21
          DataField = 'CELULAR'
          DataSource = dmEst.dsVendedor
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 10
        end
        object DBEdit13: TDBEdit
          Left = 100
          Top = 250
          Width = 500
          Height = 21
          CharCase = ecLowerCase
          DataField = 'EMAIL'
          DataSource = dmEst.dsVendedor
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 11
        end
        object DBEdit14: TDBEdit
          Left = 100
          Top = 310
          Width = 50
          Height = 21
          CharCase = ecUpperCase
          DataField = 'TIPO'
          DataSource = dmEst.dsVendedor
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 12
        end
        object DBEdit15: TDBEdit
          Left = 100
          Top = 280
          Width = 150
          Height = 21
          CharCase = ecUpperCase
          DataField = 'CPF'
          DataSource = dmEst.dsVendedor
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 13
        end
        object DBEdit16: TDBEdit
          Left = 450
          Top = 280
          Width = 150
          Height = 21
          CharCase = ecUpperCase
          DataField = 'RG'
          DataSource = dmEst.dsVendedor
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 14
        end
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 400
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
