object frmPesqClientes: TfrmPesqClientes
  Left = 357
  Top = 218
  Width = 480
  Height = 248
  ActiveControl = edtPesq
  Caption = 'devAdm - PesqClientes'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 472
    Height = 29
    Align = alTop
    Alignment = taLeftJustify
    Caption = '  Pesquisar:'
    TabOrder = 0
    object edtPesq: TEdit
      Left = 62
      Top = 4
      Width = 250
      Height = 21
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnChange = edtPesqChange
    end
    object btnOk: TBitBtn
      Left = 323
      Top = 2
      Width = 69
      Height = 25
      TabOrder = 1
      OnClick = btnOkClick
      Kind = bkOK
    end
    object btnCancel: TBitBtn
      Left = 399
      Top = 2
      Width = 69
      Height = 25
      Caption = 'Cancela'
      TabOrder = 2
      Kind = bkCancel
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 29
    Width = 472
    Height = 192
    Align = alClient
    DataSource = dmPrinc.dsPesqCliente
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'NOMECOMPLETO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NICKNAME'
        Width = 130
        Visible = True
      end>
  end
end
