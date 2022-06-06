object frmCaixa: TfrmCaixa
  Left = 224
  Top = 116
  BorderStyle = bsSingle
  Caption = 'Caixa'
  ClientHeight = 453
  ClientWidth = 570
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object RxDBGrid1: TRxDBGrid
    Left = 16
    Top = 56
    Width = 541
    Height = 381
    DataSource = dtMod.dsCxAtual
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnGetCellParams = RxDBGrid1GetCellParams
    Columns = <
      item
        Expanded = False
        FieldName = 'DESCRICAO'
        Title.Caption = 'Descrição Lançamento'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ENTRADA'
        Title.Alignment = taRightJustify
        Title.Caption = 'Entrada'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SAIDA'
        Title.Alignment = taRightJustify
        Title.Caption = 'Saída'
        Visible = True
      end
      item
        Color = clSilver
        Expanded = False
        FieldName = 'SALDO'
        Title.Alignment = taRightJustify
        Title.Caption = 'Saldo'
        Width = 70
        Visible = True
      end>
  end
  object btnIncluir: TButton
    Left = 18
    Top = 10
    Width = 110
    Height = 34
    Caption = 'Incluir Lançamento'
    TabOrder = 1
    OnClick = btnIncluirClick
  end
  object btnEditar: TButton
    Left = 158
    Top = 10
    Width = 110
    Height = 34
    Caption = 'Editar Lançamento'
    TabOrder = 2
    OnClick = btnEditarClick
  end
  object BitBtn3: TBitBtn
    Left = 297
    Top = 10
    Width = 110
    Height = 34
    Caption = '&Sair'
    TabOrder = 3
    Kind = bkClose
  end
end
