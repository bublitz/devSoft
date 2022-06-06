object frmSocios: TfrmSocios
  Left = 235
  Top = 173
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Guardian - Cadastro Socios'
  ClientHeight = 453
  ClientWidth = 746
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
    Width = 746
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
        Width = 738
        Height = 372
        Align = alClient
        DataSource = dtMod.dsSocio
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
            FieldName = 'CodigoBarra'
            Title.Caption = 'Código de Barra'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODIGOSOCIO'
            Title.Caption = 'Código'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME'
            Title.Caption = 'Nome'
            Width = 160
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PLANO'
            Title.Caption = 'Plano'
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SITUACAO'
            Title.Caption = 'Situação'
            Width = 64
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'HAcum'
            Title.Alignment = taCenter
            Title.Caption = 'Acum'
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'HDisp'
            Title.Alignment = taCenter
            Title.Caption = 'Disp'
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'HTotal'
            Title.Alignment = taCenter
            Title.Caption = 'Total'
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
        Width = 738
        Height = 41
        Align = alTop
        TabOrder = 0
        object SpeedButton2: TSpeedButton
          Left = 630
          Top = 9
          Width = 107
          Height = 25
          Caption = 'E&missão Carteira'
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            333333333333FF3333333333333C0C333333333333F777F3333333333CC0F0C3
            333333333777377F33333333C30F0F0C333333337F737377F333333C00FFF0F0
            C33333F7773337377F333CC0FFFFFF0F0C3337773F33337377F3C30F0FFFFFF0
            F0C37F7373F33337377F00FFF0FFFFFF0F0C7733373F333373770FFFFF0FFFFF
            F0F073F33373F333373730FFFFF0FFFFFF03373F33373F333F73330FFFFF0FFF
            00333373F33373FF77333330FFFFF000333333373F333777333333330FFF0333
            3333333373FF7333333333333000333333333333377733333333333333333333
            3333333333333333333333333333333333333333333333333333}
          NumGlyphs = 2
          OnClick = SpeedButton2Click
        end
        object SpeedButton1: TSpeedButton
          Left = 530
          Top = 9
          Width = 75
          Height = 25
          Caption = 'E&nviar e-mail'
          OnClick = SpeedButton1Click
        end
        object DBNav: TDBNavigator
          Left = 1
          Top = 9
          Width = 80
          Height = 25
          DataSource = dtMod.dsSocio
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
          Left = 83
          Top = 9
          Width = 75
          Height = 25
          Caption = '&Insere'
          TabOrder = 1
          OnClick = dbNavBtnAppendClick
          NumGlyphs = 2
          DataButtonType = nbAppend
          Language = blPortugues
          DataSource = dtMod.dsSocio
          DisableReasons = [drReadonly, drEditing]
          RuntimeEnabled = True
        end
        object dbNavBtnDelete: TDBNavigationButton
          Left = 157
          Top = 9
          Width = 75
          Height = 25
          Caption = 'E&xclui'
          TabOrder = 2
          NumGlyphs = 2
          DataButtonType = nbDelete
          Language = blPortugues
          DataSource = dtMod.dsSocio
          DisableReasons = [drReadonly, drEditing, drEmpty]
          RuntimeEnabled = True
        end
        object dbNavBtnEdit: TDBNavigationButton
          Left = 231
          Top = 9
          Width = 75
          Height = 25
          Caption = '&Edita'
          TabOrder = 3
          NumGlyphs = 2
          DataButtonType = nbEdit
          Language = blPortugues
          DataSource = dtMod.dsSocio
          DisableReasons = [drReadonly, drEditing, drEmpty]
          RuntimeEnabled = True
        end
        object dbNavBtnSave: TDBNavigationButton
          Left = 305
          Top = 9
          Width = 75
          Height = 25
          Caption = '&Atualiza'
          TabOrder = 4
          NumGlyphs = 2
          DataButtonType = nbPost
          Language = blPortugues
          DataSource = dtMod.dsSocio
          DisableReasons = [drNotEditing]
          RuntimeEnabled = True
        end
        object dbNavBtnCancel: TDBNavigationButton
          Left = 380
          Top = 9
          Width = 75
          Height = 25
          Caption = '&Cancela'
          TabOrder = 5
          NumGlyphs = 2
          DataButtonType = nbCancel
          Language = blPortugues
          DataSource = dtMod.dsSocio
          DisableReasons = [drNotEditing]
          RuntimeEnabled = True
        end
        object BitBtn1: TBitBtn
          Left = 455
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
        Width = 738
        Height = 331
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object Label2: TLabel
          Left = 10
          Top = 10
          Width = 63
          Height = 13
          Caption = 'Código Socio'
        end
        object DBText1: TDBText
          Left = 100
          Top = 10
          Width = 65
          Height = 17
          DataField = 'CODIGOSOCIO'
          DataSource = dtMod.dsSocio
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label3: TLabel
          Left = 425
          Top = 14
          Width = 68
          Height = 13
          Caption = 'Data Cadastro'
        end
        object Label4: TLabel
          Left = 10
          Top = 40
          Width = 27
          Height = 13
          Caption = 'Plano'
        end
        object btnPlano: TSpeedButton
          Left = 248
          Top = 40
          Width = 23
          Height = 22
          Cursor = crHandPoint
          Glyph.Data = {
            66010000424D6601000000000000760000002800000014000000140000000100
            040000000000F000000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
            FFFFF00F0000FFFFFFFFFFFFFFFF55500000FFFFFFFFFFFFFFF58D500000FFFF
            FFFFFFFFFF58D5500000FFFFFFFFFFFFF58D550F0000FFFFFF00000F58D550FF
            0000FFFF007777700D550FFF0000FFF088FEFEF77050FFFF0000FF78FF00EFEF
            870FFFFF0000FF7FFE00FEFE870FFFFF0000F78FEF00EFEFE770FFFF0000F78F
            FE00000E8670FFFF0000778FEF00EF00E770FFFF0000F78FFE00FE008670FFFF
            0000F78FEF00EF00E770FFFF0000FF78FE00FE00860FFFFF0000FF78EF00000F
            E70FFFFF0000FFF78EFEFEFE70FFFFFF0000FFFF78EFFFF700FFFFFF0000FFFF
            F7777777FFFFFFFF0000}
          OnClick = btnPlanoClick
        end
        object Label5: TLabel
          Left = 10
          Top = 70
          Width = 28
          Height = 13
          Caption = 'Nome'
          FocusControl = DBEdit1
        end
        object Label6: TLabel
          Left = 10
          Top = 100
          Width = 46
          Height = 13
          Caption = 'Endereço'
          FocusControl = DBEdit2
        end
        object Label7: TLabel
          Left = 10
          Top = 130
          Width = 64
          Height = 13
          Caption = 'Complemento'
          FocusControl = DBEdit3
        end
        object Label8: TLabel
          Left = 320
          Top = 130
          Width = 27
          Height = 13
          Caption = 'Bairro'
          FocusControl = DBEdit4
        end
        object Label9: TLabel
          Left = 10
          Top = 160
          Width = 33
          Height = 13
          Caption = 'Cidade'
          FocusControl = DBEdit5
        end
        object Label10: TLabel
          Left = 320
          Top = 160
          Width = 14
          Height = 13
          Caption = 'UF'
          FocusControl = DBEdit6
        end
        object Label11: TLabel
          Left = 465
          Top = 160
          Width = 21
          Height = 13
          Caption = 'CEP'
          FocusControl = DBEdit7
        end
        object Label12: TLabel
          Left = 10
          Top = 190
          Width = 20
          Height = 13
          Caption = 'CPF'
          FocusControl = DBEdit8
        end
        object Label13: TLabel
          Left = 320
          Top = 190
          Width = 16
          Height = 13
          Caption = 'RG'
          FocusControl = DBEdit9
        end
        object Label14: TLabel
          Left = 10
          Top = 220
          Width = 82
          Height = 13
          Caption = 'Data Nascimento'
        end
        object Label15: TLabel
          Left = 332
          Top = 44
          Width = 46
          Height = 13
          Caption = 'Expira em'
        end
        object Label16: TLabel
          Left = 320
          Top = 220
          Width = 42
          Height = 13
          Caption = 'Telefone'
          FocusControl = DBEdit10
        end
        object Label17: TLabel
          Left = 10
          Top = 250
          Width = 42
          Height = 13
          Caption = 'Situação'
        end
        object Label18: TLabel
          Left = 10
          Top = 305
          Width = 27
          Height = 13
          Caption = 'e-mail'
          FocusControl = DBEdit11
        end
        object Label19: TLabel
          Left = 620
          Top = 78
          Width = 21
          Height = 13
          Caption = 'Foto'
          FocusControl = DBIFoto
        end
        object Bevel1: TBevel
          Left = 614
          Top = 70
          Width = 119
          Height = 143
          Style = bsRaised
        end
        object Label20: TLabel
          Left = 10
          Top = 280
          Width = 34
          Height = 13
          Caption = 'Emitido'
        end
        object DBText2: TDBText
          Left = 100
          Top = 280
          Width = 65
          Height = 17
          DataField = 'CARTEIRA'
          DataSource = dtMod.dsSocio
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btnBonus: TSpeedButton
          Left = 646
          Top = 240
          Width = 65
          Height = 57
          Hint = 'Adicionar Horas de Bônus'
          Caption = 'Bônus'
          Glyph.Data = {
            360C0000424D360C000000000000360000002800000020000000200000000100
            180000000000000C000000000000000000000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000FFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
            0000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF007F7F00FFFF000000000000FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000
            FFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF007F7F00FFFF00FFFF0000
            00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000FFFF00FFFF00
            0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF007F7F00FFFF00FFFF00FF
            FF000000000000FFFFFFFFFFFFFFFFFF00000000000000FFFF00FFFF00FFFF00
            0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF007F7F00FFFF00FF
            FF00FFFF00FFFF000000FFFFFF00000000FFFF00FFFF00FFFF00FFFF000000FF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF007F7F00FFFF00FF
            FF00FFFF00FFFF00FFFF00000000FFFF00FFFF00FFFF00FFFF00FFFF000000FF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF007F7F00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF000000FFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF007F7F00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF000000FF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF007F7F00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF007F7F00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF007F7F00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFF007F7F007F7F007F7F007F7F007F7F007F7F007F
            7F00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00000000000000000000
            0000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FF007F7F00FFFF00FFFF00FFFF00FFFF00FFFF000000FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FF007F7F00FFFF00FFFF00FFFF00FFFF00FFFF000000FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFF007F7F00FFFF00FFFF00FFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFF007F7F00FFFF00FFFF00FFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFF007F7F00FFFF007F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFF007F7F00FFFF007F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFF007F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFF007F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          Layout = blGlyphTop
          ParentShowHint = False
          ShowHint = True
          OnClick = btnBonusClick
        end
        object DBText3: TDBText
          Left = 386
          Top = 42
          Width = 99
          Height = 17
          Color = clHighlightText
          DataField = 'DataVencto'
          DataSource = dtMod.dsSocio
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clHighlight
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object DBText4: TDBText
          Left = 582
          Top = 42
          Width = 99
          Height = 17
          Color = clHighlightText
          DataField = 'DataRenova'
          DataSource = dtMod.dsSocio
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clHighlight
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object Label21: TLabel
          Left = 510
          Top = 44
          Width = 64
          Height = 13
          Caption = 'Data Renova'
        end
        object btnRenova: TSpeedButton
          Left = 271
          Top = 40
          Width = 23
          Height = 22
          Cursor = crHandPoint
          Hint = 'Renova plano'
          Flat = True
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            3333333333333333333333333333333333333333333333333333333333333333
            3333333333333333333333333333333333333333333FF3333333333333003333
            3333333333773FF3333333333309003333333333337F773FF333333333099900
            33333FFFFF7F33773FF30000000999990033777777733333773F099999999999
            99007FFFFFFF33333F7700000009999900337777777F333F7733333333099900
            33333333337F3F77333333333309003333333333337F77333333333333003333
            3333333333773333333333333333333333333333333333333333333333333333
            3333333333333333333333333333333333333333333333333333}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          OnClick = btnRenovaClick
        end
        object DBDateEdit1: TDBDateEdit
          Left = 500
          Top = 10
          Width = 100
          Height = 21
          DataField = 'DATACADASTRO'
          DataSource = dtMod.dsSocio
          DefaultToday = True
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          NumGlyphs = 2
          ParentFont = False
          TabOrder = 0
        end
        object RxDBLookupCombo1: TRxDBLookupCombo
          Left = 100
          Top = 40
          Width = 150
          Height = 21
          DropDownCount = 8
          DataField = 'Plano'
          DataSource = dtMod.dsSocio
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          OnChange = RxDBLookupCombo1Change
          OnEnter = RxDBLookupCombo1Enter
        end
        object DBEdit1: TDBEdit
          Left = 100
          Top = 70
          Width = 500
          Height = 21
          CharCase = ecUpperCase
          DataField = 'NOME'
          DataSource = dtMod.dsSocio
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
        end
        object DBEdit2: TDBEdit
          Left = 100
          Top = 100
          Width = 500
          Height = 21
          CharCase = ecUpperCase
          DataField = 'ENDERECO'
          DataSource = dtMod.dsSocio
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
        end
        object DBEdit3: TDBEdit
          Left = 100
          Top = 130
          Width = 200
          Height = 21
          CharCase = ecUpperCase
          DataField = 'COMPLEMENTO'
          DataSource = dtMod.dsSocio
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 4
        end
        object DBEdit4: TDBEdit
          Left = 400
          Top = 130
          Width = 200
          Height = 21
          CharCase = ecUpperCase
          DataField = 'BAIRRO'
          DataSource = dtMod.dsSocio
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 5
        end
        object DBEdit5: TDBEdit
          Left = 100
          Top = 160
          Width = 200
          Height = 21
          CharCase = ecUpperCase
          DataField = 'CIDADE'
          DataSource = dtMod.dsSocio
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 6
        end
        object DBEdit6: TDBEdit
          Left = 400
          Top = 160
          Width = 50
          Height = 21
          CharCase = ecUpperCase
          DataField = 'UF'
          DataSource = dtMod.dsSocio
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 7
        end
        object DBEdit7: TDBEdit
          Left = 500
          Top = 160
          Width = 100
          Height = 21
          DataField = 'CEP'
          DataSource = dtMod.dsSocio
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 8
        end
        object DBEdit8: TDBEdit
          Left = 100
          Top = 190
          Width = 200
          Height = 21
          DataField = 'CPF'
          DataSource = dtMod.dsSocio
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 9
        end
        object DBEdit9: TDBEdit
          Left = 400
          Top = 190
          Width = 200
          Height = 21
          DataField = 'RG'
          DataSource = dtMod.dsSocio
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 10
        end
        object DBDateEdit2: TDBDateEdit
          Left = 100
          Top = 220
          Width = 100
          Height = 21
          DataField = 'DATANASCIMENTO'
          DataSource = dtMod.dsSocio
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          NumGlyphs = 2
          ParentFont = False
          TabOrder = 11
        end
        object DBEdit10: TDBEdit
          Left = 450
          Top = 220
          Width = 150
          Height = 21
          DataField = 'TELEFONE'
          DataSource = dtMod.dsSocio
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          MaxLength = 13
          ParentFont = False
          TabOrder = 12
        end
        object RxDBComboBox2: TRxDBComboBox
          Left = 100
          Top = 250
          Width = 145
          Height = 21
          Style = csDropDownList
          DataField = 'SITUACAO'
          DataSource = dtMod.dsSocio
          EnableValues = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ItemHeight = 13
          Items.Strings = (
            'Liberado'
            'Bloqueado')
          ParentFont = False
          TabOrder = 13
          Values.Strings = (
            'L'
            'B')
        end
        object DBEdit11: TDBEdit
          Left = 100
          Top = 305
          Width = 500
          Height = 21
          CharCase = ecLowerCase
          DataField = 'EMAIL'
          DataSource = dtMod.dsSocio
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 14
        end
        object DBIFoto: TDBImage
          Left = 620
          Top = 94
          Width = 105
          Height = 105
          DataField = 'FOTO'
          DataSource = dtMod.dsSocio
          Stretch = True
          TabOrder = 15
          OnClick = DBIFotoClick
        end
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 400
    Width = 746
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
      Left = 540
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
        'Nome'
        'Código')
      ParentFont = False
      TabOrder = 1
      OnClick = RdGrpOrdemClick
    end
  end
  object OpenDialog: TOpenDialog
    DefaultExt = 'bmp'
    Filter = 'Imagem BMP|*.bmp|Imagem JPEG|*.jpeg;*.jpg'
    InitialDir = 'C:\devSoft\Fotos'
    Left = 696
    Top = 163
  end
end
