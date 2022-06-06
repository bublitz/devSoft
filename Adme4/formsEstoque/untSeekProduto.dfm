object frmSeekProduto: TfrmSeekProduto
  Left = 268
  Top = 210
  Width = 696
  Height = 480
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Adme - Consulta'
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 688
    Height = 453
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 10
      Top = 26
      Width = 48
      Height = 13
      Caption = 'Descrição'
    end
    object DBGrid1: TDBGrid
      Left = 3
      Top = 80
      Width = 686
      Height = 458
      Color = clInfoBk
      DataSource = dmEst.dsProduto
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = DBGrid1DblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'CODIGOBARRA'
          Title.Caption = 'Código Completo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Caption = 'Descrição do Produto'
          Width = 369
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PrecoVendaCalc'
          Title.Caption = 'Preço de Venda'
          Width = 89
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UNIDADE'
          Title.Caption = 'Un'
          Width = 25
          Visible = True
        end>
    end
    object Edit1: TEdit
      Left = 100
      Top = 26
      Width = 400
      Height = 21
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnChange = Edit1Change
    end
    object BitBtn1: TBitBtn
      Left = 513
      Top = 26
      Width = 75
      Height = 25
      TabOrder = 2
      Kind = bkOK
    end
  end
end
