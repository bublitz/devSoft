object frmRec: TfrmRec
  Left = 258
  Top = 139
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Guardian - Contas a Receber'
  ClientHeight = 399
  ClientWidth = 666
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 255
    Width = 666
    Height = 109
    BevelOuter = bvNone
    BorderWidth = 1
    BorderStyle = bsSingle
    Enabled = False
    TabOrder = 1
    object Label11: TLabel
      Left = 13
      Top = 20
      Width = 37
      Height = 13
      Caption = 'Cheque'
      FocusControl = DBEdit5
    end
    object Label12: TLabel
      Left = 220
      Top = 20
      Width = 31
      Height = 13
      Caption = 'Banco'
      FocusControl = DBEdit6
    end
    object Label13: TLabel
      Left = 13
      Top = 64
      Width = 80
      Height = 13
      Caption = 'Data Pagamento'
    end
    object Label14: TLabel
      Left = 220
      Top = 67
      Width = 52
      Height = 13
      Caption = 'Valor Pago'
      FocusControl = DBEdit7
    end
    object DBEdit5: TDBEdit
      Left = 103
      Top = 18
      Width = 100
      Height = 21
      CharCase = ecUpperCase
      DataField = 'CHEQUE'
      DataSource = dtMod.dsReceb
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object DBEdit6: TDBEdit
      Left = 270
      Top = 18
      Width = 150
      Height = 21
      CharCase = ecUpperCase
      DataField = 'BANCO'
      DataSource = dtMod.dsReceb
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnEnter = DBEdit6Enter
    end
    object DBDateEdit3: TDBDateEdit
      Left = 103
      Top = 61
      Width = 100
      Height = 21
      DataField = 'DATAPAGAMENTO'
      DataSource = dtMod.dsReceb
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 2
    end
    object DBEdit7: TDBEdit
      Left = 320
      Top = 63
      Width = 100
      Height = 21
      DataField = 'VALORPAGO'
      DataSource = dtMod.dsReceb
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
    end
  end
  object PageCad: TPageControl
    Left = 0
    Top = 0
    Width = 666
    Height = 255
    ActivePage = TabDetalhe
    Align = alTop
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
        Width = 658
        Height = 227
        Align = alClient
        DataSource = dtMod.dsReceb
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
            FieldName = 'NUMERO'
            Title.Caption = 'Numero'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NomeSocio'
            Title.Caption = 'Sócio'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Situacao'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DATAEMISSAO'
            Title.Caption = 'Data Emissão'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DATAVENCIMENTO'
            Title.Caption = 'Data Vencto'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DATAPAGAMENTO'
            Title.Caption = 'Data Pgamento'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CHEQUE'
            Title.Caption = 'Cheque'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BANCO'
            Title.Caption = 'Banco'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MULTA'
            Title.Caption = 'Multa'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR'
            Title.Caption = 'Valor'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'JUROS'
            Title.Caption = 'Juros'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALORPAGO'
            Title.Caption = 'Valor Pago'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OBSERVACAO'
            Title.Caption = 'Observação'
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
        Width = 658
        Height = 41
        Align = alTop
        TabOrder = 0
        object btnBaixar: TSpeedButton
          Left = 472
          Top = 9
          Width = 75
          Height = 25
          Caption = '&Baixar'
          Glyph.Data = {
            F2060000424DF206000000000000360400002800000019000000190000000100
            080000000000BC020000CE0E0000C40E00000001000000000000000000004000
            00006000000080000000A0000000C0000000E0000000FF000000008000004080
            00006080000080800000A0800000C0800000E0800000FF80000000C0000040C0
            000060C0000080C00000A0C00000C0C00000E0C00000FFC0000000FF000040FF
            000060FF000080FF0000A0FF0000C0FF0000E0FF0000FFFF0000000040004000
            40006000400080004000A0004000C0004000E0004000FF004000008040004080
            40006080400080804000A0804000C0804000E0804000FF80400000C0400040C0
            400060C0400080C04000A0C04000C0C04000E0C04000FFC0400000FF400040FF
            400060FF400080FF4000A0FF4000C0FF4000E0FF4000FFFF4000000060004000
            60006000600080006000A0006000C0006000E0006000FF006000008060004080
            60006080600080806000A0806000C0806000E0806000FF80600000C0600040C0
            600060C0600080C06000A0C06000C0C06000E0C06000FFC0600000FF600040FF
            600060FF600080FF6000A0FF6000C0FF6000E0FF6000FFFF6000000080004000
            80006000800080008000A0008000C0008000E0008000FF008000008080004080
            80006080800080808000A0808000C0808000E0808000FF80800000C0800040C0
            800060C0800080C08000A0C08000C0C08000E0C08000FFC0800000FF800040FF
            800060FF800080FF8000A0FF8000C0FF8000E0FF8000FFFF80000000A0004000
            A0006000A0008000A000A000A000C000A000E000A000FF00A0000080A0004080
            A0006080A0008080A000A080A000C080A000E080A000FF80A00000C0A00040C0
            A00060C0A00080C0A000A0C0A000C0C0A000E0C0A000FFC0A00000FFA00040FF
            A00060FFA00080FFA000A0FFA000C0FFA000E0FFA000FFFFA0000000C0004000
            C0006000C0008000C000A000C000C000C000E000C000FF00C0000080C0004080
            C0006080C0008080C000A080C000C080C000E080C000FF80C00000C0C00040C0
            C00060C0C00080C0C000A0C0C000C0C0C000E0C0C000FFC0C00000FFC00040FF
            C00060FFC00080FFC000A0FFC000C0FFC000E0FFC000FFFFC0000000E0004000
            E0006000E0008000E000A000E000C000E000E000E000FF00E0000080E0004080
            E0006080E0008080E000A080E000C080E000E080E000FF80E00000C0E00040C0
            E00060C0E00080C0E000A0C0E000C0C0E000E0C0E000FFC0E00000FFE00040FF
            E00060FFE00080FFE000A0FFE000C0FFE000E0FFE000FFFFE0000000FF004000
            FF006000FF008000FF00A000FF00C000FF00E000FF00FF00FF000080FF004080
            FF006080FF008080FF00A080FF00C080FF00E080FF00FF80FF0000C0FF0040C0
            FF0060C0FF0080C0FF00A0C0FF00C0C0FF00E0C0FF00FFC0FF0000FFFF0040FF
            FF0060FFFF0080FFFF00A0FFFF00C0FFFF00E0FFFF00FFFFFF00DEDEDEDEDEDE
            DEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDE000000DEDEDEDEDEDEDEDEDEDE
            DEDEDEDEDEDEDEDEDEDEDEDEDEDEDE000000DEDEDEDEDEDEDEDEDEDEDEDEDEDE
            DEDEDEDEDEDEDEDEDEDEDE000000DEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDE
            DEDEDEDEDEDEDE000000DEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDE
            DEDEDE000000DEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDE00
            0000DEDE0000000000000000000000000000DEDEDEDEDEDEDEDEDE000000DEDE
            00F8F8F8F8F8F8F8F8F8F8F8F800DEDEDEDEDEDEDEDEDE000000DEDE00F8F8F8
            F8F8F8F8F8F8F8F8F800DEDEDEDEDEDEDEDEDE000000DEDE00F8070707070707
            07070707F800DEDEDEDEDEDE040404000000DEDE00F8F8F8F8F8F8F8F8F8F8F8
            F800000000000000000707000000DEDE00F80707070707949494949490949090
            94949490940007000000DEDE00F8F8F8F81F0000000000009490949094909494
            940007000000DEDE00F8070707F8001F0400DE00949490949094949094000700
            0000DEDEDE00F8F8F80000901F0400009490949094909494000004000000DEDE
            DEDE000000DE00DEDE1F04049494949490940000DEDEDE000000DEDEDEDEDEDE
            DEDE000090901F04009490909400DEDEDEDEDE000000DEDEDEDEDEDEDEDEDEDE
            00DE901F0400949400DEDEDEDEDEDE000000DEDEDEDEDEDEDEDEDEDEDE00DE90
            1F040400DEDEDEDEDEDEDE000000DEDEDEDEDEDEDEDEDEDEDEDE0000001F0404
            DEDEDEDEDEDEDE000000DEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDE1F04DEDEDEDE
            DEDEDE000000DEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDE00
            0000DEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDE000000DEDE
            DEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDE000000DEDEDEDEDEDE
            DEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDE000000}
          OnClick = btnBaixarClick
        end
        object DBNav: TDBNavigator
          Left = 9
          Top = 9
          Width = 80
          Height = 25
          DataSource = dtMod.dsReceb
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
          DataSource = dtMod.dsReceb
          OnAfterAction = dbNavBtnAppendAfterAction
          DisableReasons = [drReadonly, drEditing]
          RuntimeEnabled = True
        end
        object dbNavBtnDelete: TDBNavigationButton
          Left = 169
          Top = 9
          Width = 74
          Height = 25
          Caption = '&Exclui'
          TabOrder = 2
          NumGlyphs = 2
          DataButtonType = nbDelete
          Language = blPortugues
          DataSource = dtMod.dsReceb
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
          DataSource = dtMod.dsReceb
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
          OnClick = dbNavBtnSaveClick
          NumGlyphs = 2
          DataButtonType = nbPost
          Language = blPortugues
          DataSource = dtMod.dsReceb
          OnBeforeAction = dbNavBtnSaveBeforeAction
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
          OnClick = dbNavBtnCancelClick
          NumGlyphs = 2
          DataButtonType = nbCancel
          Language = blPortugues
          DataSource = dtMod.dsReceb
          DisableReasons = [drNotEditing]
          RuntimeEnabled = True
        end
        object BitBtn1: TBitBtn
          Left = 577
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
        Width = 658
        Height = 186
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object Label2: TLabel
          Left = 10
          Top = 10
          Width = 37
          Height = 13
          Caption = 'Numero'
        end
        object DBText1: TDBText
          Left = 100
          Top = 10
          Width = 65
          Height = 17
          DataField = 'NUMERO'
          DataSource = dtMod.dsReceb
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
          Width = 27
          Height = 13
          Caption = 'Socio'
        end
        object Label4: TLabel
          Left = 10
          Top = 70
          Width = 42
          Height = 13
          Caption = 'Situacao'
        end
        object Label5: TLabel
          Left = 10
          Top = 100
          Width = 60
          Height = 13
          Caption = 'Data Emisão'
        end
        object Label6: TLabel
          Left = 400
          Top = 100
          Width = 60
          Height = 13
          Caption = 'Data Vencto'
        end
        object Label7: TLabel
          Left = 10
          Top = 130
          Width = 24
          Height = 13
          Caption = 'Valor'
          FocusControl = DBEdit1
        end
        object Label8: TLabel
          Left = 10
          Top = 160
          Width = 26
          Height = 13
          Caption = 'Multa'
          FocusControl = DBEdit2
        end
        object Label9: TLabel
          Left = 400
          Top = 162
          Width = 25
          Height = 13
          Caption = 'Juros'
          FocusControl = DBEdit3
        end
        object RxDBLookupCombo1: TRxDBLookupCombo
          Left = 100
          Top = 42
          Width = 500
          Height = 21
          DropDownCount = 8
          DataField = 'NomeSocio'
          DataSource = dtMod.dsReceb
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
        object RxDBLookupCombo2: TRxDBLookupCombo
          Left = 100
          Top = 70
          Width = 200
          Height = 21
          DropDownCount = 8
          DataField = 'Situacao'
          DataSource = dtMod.dsReceb
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
        end
        object DBDateEdit1: TDBDateEdit
          Left = 100
          Top = 100
          Width = 100
          Height = 21
          DataField = 'DATAEMISSAO'
          DataSource = dtMod.dsReceb
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          NumGlyphs = 2
          ParentFont = False
          TabOrder = 2
        end
        object DBDateEdit2: TDBDateEdit
          Left = 500
          Top = 100
          Width = 100
          Height = 21
          DataField = 'DATAVENCIMENTO'
          DataSource = dtMod.dsReceb
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          NumGlyphs = 2
          ParentFont = False
          TabOrder = 3
        end
        object DBEdit1: TDBEdit
          Left = 100
          Top = 130
          Width = 100
          Height = 21
          DataField = 'VALOR'
          DataSource = dtMod.dsReceb
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 4
        end
        object DBEdit2: TDBEdit
          Left = 100
          Top = 160
          Width = 100
          Height = 21
          DataField = 'MULTA'
          DataSource = dtMod.dsReceb
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 5
        end
        object DBEdit3: TDBEdit
          Left = 500
          Top = 160
          Width = 100
          Height = 21
          DataField = 'JUROS'
          DataSource = dtMod.dsReceb
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 6
        end
      end
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 364
    Width = 666
    Height = 35
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object Label10: TLabel
      Left = 10
      Top = 10
      Width = 41
      Height = 13
      Caption = 'Historico'
      FocusControl = DBEdit4
    end
    object DBEdit4: TDBEdit
      Left = 100
      Top = 10
      Width = 500
      Height = 21
      CharCase = ecUpperCase
      DataField = 'OBSERVACAO'
      DataSource = dtMod.dsReceb
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
