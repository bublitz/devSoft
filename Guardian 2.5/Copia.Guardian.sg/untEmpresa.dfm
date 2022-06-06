object frmEmpresa: TfrmEmpresa
  Left = 225
  Top = 108
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Guardian - Empresa'
  ClientHeight = 444
  ClientWidth = 621
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
    Width = 621
    Height = 444
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
      Caption = 'Empresa'
      ImageIndex = 1
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 613
        Height = 41
        Align = alTop
        TabOrder = 0
        object DBNav: TDBNavigator
          Left = 9
          Top = 9
          Width = 96
          Height = 25
          DataSource = dtMod.dsEmpresa
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
          Enabled = False
          Flat = True
          Hints.Strings = (
            'Primeiro'
            'Anterior'
            'Próximo'
            'Último')
          TabOrder = 0
          Visible = False
        end
        object dbNavBtnAppend: TDBNavigationButton
          Left = 130
          Top = 8
          Width = 75
          Height = 25
          Caption = '&Insere'
          TabOrder = 1
          Visible = False
          NumGlyphs = 2
          DataButtonType = nbAppend
          Language = blPortugues
          DataSource = dtMod.dsEmpresa
          DisableReasons = [drReadonly, drEditing]
          RuntimeEnabled = True
        end
        object dbNavBtnDelete: TDBNavigationButton
          Left = 205
          Top = 8
          Width = 75
          Height = 25
          Caption = '&Exclui'
          TabOrder = 2
          Visible = False
          NumGlyphs = 2
          DataButtonType = nbDelete
          Language = blPortugues
          DataSource = dtMod.dsEmpresa
          DisableReasons = [drReadonly, drEditing, drEmpty]
          RuntimeEnabled = True
        end
        object dbNavBtnEdit: TDBNavigationButton
          Left = 280
          Top = 8
          Width = 75
          Height = 25
          Caption = '&Edita'
          TabOrder = 3
          NumGlyphs = 2
          DataButtonType = nbEdit
          Language = blPortugues
          DataSource = dtMod.dsEmpresa
          DisableReasons = [drReadonly, drEditing, drEmpty]
          RuntimeEnabled = True
        end
        object dbNavBtnSave: TDBNavigationButton
          Left = 355
          Top = 8
          Width = 75
          Height = 25
          Caption = '&Atualiza'
          TabOrder = 4
          NumGlyphs = 2
          DataButtonType = nbPost
          Language = blPortugues
          DataSource = dtMod.dsEmpresa
          DisableReasons = [drNotEditing]
          RuntimeEnabled = True
        end
        object dbNavBtnCancel: TDBNavigationButton
          Left = 430
          Top = 8
          Width = 75
          Height = 25
          Caption = '&Cancela'
          TabOrder = 5
          NumGlyphs = 2
          DataButtonType = nbCancel
          Language = blPortugues
          DataSource = dtMod.dsEmpresa
          DisableReasons = [drNotEditing]
          RuntimeEnabled = True
        end
        object BitBtn1: TBitBtn
          Left = 506
          Top = 8
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
        Width = 613
        Height = 375
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object Label1: TLabel
          Left = 10
          Top = 10
          Width = 63
          Height = 13
          Caption = 'Razão Social'
          FocusControl = DBEdit1
        end
        object Label2: TLabel
          Left = 10
          Top = 40
          Width = 46
          Height = 13
          Caption = 'Endereço'
          FocusControl = DBEdit2
        end
        object Label3: TLabel
          Left = 10
          Top = 70
          Width = 27
          Height = 13
          Caption = 'Bairro'
          FocusControl = DBEdit3
        end
        object Label4: TLabel
          Left = 10
          Top = 100
          Width = 33
          Height = 13
          Caption = 'Cidade'
          FocusControl = DBEdit4
        end
        object Label5: TLabel
          Left = 400
          Top = 70
          Width = 21
          Height = 13
          Caption = 'CEP'
          FocusControl = DBEdit5
        end
        object Label6: TLabel
          Left = 400
          Top = 110
          Width = 14
          Height = 13
          Caption = 'UF'
          FocusControl = DBEdit6
        end
        object Label7: TLabel
          Left = 10
          Top = 130
          Width = 24
          Height = 13
          Caption = 'Fone'
          FocusControl = DBEdit7
        end
        object Label8: TLabel
          Left = 400
          Top = 130
          Width = 17
          Height = 13
          Caption = 'Fax'
          FocusControl = DBEdit8
        end
        object Label9: TLabel
          Left = 10
          Top = 160
          Width = 27
          Height = 13
          Caption = 'CNPJ'
          FocusControl = DBEdit9
        end
        object Label10: TLabel
          Left = 400
          Top = 160
          Width = 10
          Height = 13
          Caption = 'IE'
          FocusControl = DBEdit10
        end
        object Label11: TLabel
          Left = 10
          Top = 190
          Width = 41
          Height = 13
          Caption = 'Delay (s)'
          FocusControl = DBEdit11
        end
        object Label12: TLabel
          Left = 10
          Top = 340
          Width = 27
          Height = 13
          Caption = 'e-mail'
          FocusControl = DBEdit12
        end
        object Label13: TLabel
          Left = 10
          Top = 220
          Width = 54
          Height = 13
          Caption = 'Dias Atraso'
          FocusControl = DBEdit13
        end
        object Label14: TLabel
          Left = 400
          Top = 220
          Width = 75
          Height = 13
          Caption = 'Validade Senha'
        end
        object Label15: TLabel
          Left = 10
          Top = 280
          Width = 74
          Height = 13
          Caption = 'Tempo Cortesia'
          FocusControl = DBEdit15
        end
        object Label16: TLabel
          Left = 400
          Top = 280
          Width = 63
          Height = 13
          Caption = 'Senha Libera'
          FocusControl = DBEdit16
        end
        object Label17: TLabel
          Left = 10
          Top = 250
          Width = 26
          Height = 13
          Caption = 'Multa'
          FocusControl = DBEdit17
        end
        object Label18: TLabel
          Left = 400
          Top = 250
          Width = 63
          Height = 13
          Caption = 'Juros (ao dia)'
          FocusControl = DBEdit18
        end
        object Label19: TLabel
          Left = 400
          Top = 190
          Width = 106
          Height = 13
          Caption = 'Última Geração Boleto'
        end
        object DBText1: TDBText
          Left = 516
          Top = 190
          Width = 82
          Height = 17
          DataField = 'DATAULTIMAGERACAO'
          DataSource = dtMod.dsEmpresa
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label20: TLabel
          Left = 203
          Top = 283
          Width = 19
          Height = 13
          Caption = 'min.'
          FocusControl = DBEdit15
        end
        object Label21: TLabel
          Left = 150
          Top = 255
          Width = 10
          Height = 13
          Caption = '%'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label22: TLabel
          Left = 550
          Top = 253
          Width = 10
          Height = 13
          Caption = '%'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label23: TLabel
          Left = 10
          Top = 310
          Width = 68
          Height = 13
          Caption = 'Linhas Recibo'
        end
        object DBEdit1: TDBEdit
          Left = 100
          Top = 10
          Width = 500
          Height = 21
          CharCase = ecUpperCase
          DataField = 'RAZAOSOCIAL'
          DataSource = dtMod.dsEmpresa
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
        object DBEdit2: TDBEdit
          Left = 100
          Top = 40
          Width = 500
          Height = 21
          CharCase = ecUpperCase
          DataField = 'ENDERECO'
          DataSource = dtMod.dsEmpresa
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
          Width = 200
          Height = 21
          CharCase = ecUpperCase
          DataField = 'BAIRRO'
          DataSource = dtMod.dsEmpresa
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
          Width = 200
          Height = 21
          CharCase = ecUpperCase
          DataField = 'CIDADE'
          DataSource = dtMod.dsEmpresa
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
          Top = 70
          Width = 100
          Height = 21
          DataField = 'CEP'
          DataSource = dtMod.dsEmpresa
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 4
        end
        object DBEdit6: TDBEdit
          Left = 500
          Top = 100
          Width = 100
          Height = 21
          CharCase = ecUpperCase
          DataField = 'UF'
          DataSource = dtMod.dsEmpresa
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 5
        end
        object DBEdit7: TDBEdit
          Left = 100
          Top = 130
          Width = 100
          Height = 21
          DataField = 'FONE'
          DataSource = dtMod.dsEmpresa
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 6
        end
        object DBEdit8: TDBEdit
          Left = 500
          Top = 130
          Width = 100
          Height = 21
          DataField = 'FAX'
          DataSource = dtMod.dsEmpresa
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 7
        end
        object DBEdit9: TDBEdit
          Left = 100
          Top = 160
          Width = 150
          Height = 21
          DataField = 'CNPJ'
          DataSource = dtMod.dsEmpresa
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 8
        end
        object DBEdit10: TDBEdit
          Left = 450
          Top = 160
          Width = 150
          Height = 21
          DataField = 'IE'
          DataSource = dtMod.dsEmpresa
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 9
        end
        object DBEdit11: TDBEdit
          Left = 100
          Top = 190
          Width = 100
          Height = 21
          DataField = 'DELAY'
          DataSource = dtMod.dsEmpresa
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 10
        end
        object DBEdit12: TDBEdit
          Left = 100
          Top = 340
          Width = 500
          Height = 21
          CharCase = ecLowerCase
          DataField = 'EMAIL'
          DataSource = dtMod.dsEmpresa
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 17
        end
        object DBEdit13: TDBEdit
          Left = 100
          Top = 220
          Width = 100
          Height = 21
          DataField = 'DIASATRASO'
          DataSource = dtMod.dsEmpresa
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 11
        end
        object DBEdit15: TDBEdit
          Left = 100
          Top = 280
          Width = 100
          Height = 21
          DataField = 'TEMPOCORTESIA'
          DataSource = dtMod.dsEmpresa
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 15
        end
        object DBEdit16: TDBEdit
          Left = 500
          Top = 280
          Width = 100
          Height = 21
          DataField = 'SENHALIBERA'
          DataSource = dtMod.dsEmpresa
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          PasswordChar = '#'
          TabOrder = 16
        end
        object DBEdit14: TDBEdit
          Left = 498
          Top = 220
          Width = 100
          Height = 21
          DataField = 'VALIDADESENHA'
          DataSource = dtMod.dsEmpresa
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 12
        end
        object DBEdit17: TDBEdit
          Left = 100
          Top = 250
          Width = 50
          Height = 21
          DataField = 'MULTA'
          DataSource = dtMod.dsEmpresa
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 13
        end
        object DBEdit18: TDBEdit
          Left = 500
          Top = 250
          Width = 50
          Height = 21
          DataField = 'JUROS'
          DataSource = dtMod.dsEmpresa
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 14
        end
        object DBEdit19: TDBEdit
          Left = 100
          Top = 310
          Width = 100
          Height = 21
          DataField = 'LINHAS'
          DataSource = dtMod.dsEmpresa
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 18
        end
      end
    end
  end
end
