object frmSelEti: TfrmSelEti
  Left = 238
  Top = 177
  Width = 696
  Height = 457
  Caption = 'devSoft - Selecione Etiqueta a ser Impressa'
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
    Width = 688
    Height = 430
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvSpace
    BorderStyle = bsSingle
    TabOrder = 0
    object Bevel1: TBevel
      Left = 526
      Top = 340
      Width = 147
      Height = 63
    end
    object SpeedButton1: TSpeedButton
      Left = 550
      Top = 344
      Width = 100
      Height = 25
      Caption = 'Emissão Etiqueta'
      Flat = True
      OnClick = SpeedButton1Click
    end
    object Label1: TLabel
      Left = 10
      Top = 369
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
    object BitBtn1: TBitBtn
      Left = 563
      Top = 374
      Width = 75
      Height = 25
      Caption = '&Sair'
      TabOrder = 0
      Kind = bkClose
    end
    object RxDBGrid1: TRxDBGrid
      Left = 6
      Top = 6
      Width = 673
      Height = 329
      DataSource = dsProduto
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      ParentFont = False
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      MultiSelect = True
      OnGetCellParams = RxDBGrid1GetCellParams
      Columns = <
        item
          Expanded = False
          FieldName = 'CODIGOPRODUTO'
          Title.Alignment = taCenter
          Title.Caption = 'Código Produto'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Caption = 'Descrição'
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'EMITETIQ'
          Title.Caption = 'Etiqueta Emitida'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DATACADASTRO'
          Title.Caption = 'Data Cadastro'
          Visible = True
        end>
    end
    object EditPesq: TEdit
      Left = 100
      Top = 363
      Width = 300
      Height = 21
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
    end
  end
  object dsProduto: TDataSource
    DataSet = qrProduto
    Left = 270
    Top = 98
  end
  object dsProd: TDataSource
    DataSet = qrProd
    Left = 272
    Top = 146
  end
  object qrProduto: TIBQuery
    Database = dmConf.dtBase
    Transaction = dmConf.IBTrans
    CachedUpdates = False
    SQL.Strings = (
      'Select CodigoProduto, Descricao, Emitetiq, DataCadastro'
      'From Produto'
      'Order by DataCadastro DESC')
    Left = 328
    Top = 98
    object qrProdutoCODIGOPRODUTO: TIntegerField
      FieldName = 'CODIGOPRODUTO'
      Required = True
    end
    object qrProdutoDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 50
    end
    object qrProdutoEMITETIQ: TIBStringField
      FieldName = 'EMITETIQ'
      Size = 10
    end
    object qrProdutoDATACADASTRO: TDateTimeField
      FieldName = 'DATACADASTRO'
    end
  end
  object qrProd: TIBQuery
    Database = dmConf.dtBase
    Transaction = dmConf.IBTrans
    CachedUpdates = False
    SQL.Strings = (
      'Select *'
      'From Produto'
      'Where Emitetiq = '#39'I'#39
      'Order by Descricao')
    Left = 328
    Top = 152
    object qrProdCODIGOPRODUTO: TIntegerField
      FieldName = 'CODIGOPRODUTO'
      Required = True
    end
    object qrProdDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 50
    end
    object qrProdCODIGOCOMPLETO: TIBStringField
      FieldName = 'CODIGOCOMPLETO'
      Required = True
    end
    object qrProdCODIGOLINHA: TIBStringField
      FieldName = 'CODIGOLINHA'
      Size = 2
    end
    object qrProdCODIGOGRUPO: TIBStringField
      FieldName = 'CODIGOGRUPO'
      Required = True
      Size = 2
    end
    object qrProdCODIGOSUBGRUPO: TIBStringField
      FieldName = 'CODIGOSUBGRUPO'
      Required = True
      Size = 2
    end
    object qrProdCODIGOBARRA: TIBStringField
      FieldName = 'CODIGOBARRA'
      Size = 25
    end
    object qrProdDESCRICAODETALHADA: TIBStringField
      FieldName = 'DESCRICAODETALHADA'
      Size = 250
    end
    object qrProdFOTO: TBlobField
      FieldName = 'FOTO'
      BlobType = ftBlob
      Size = 8
    end
    object qrProdREFERENCIAFORNEC: TIBStringField
      FieldName = 'REFERENCIAFORNEC'
      Size = 25
    end
    object qrProdCODIGOMOEDA: TIntegerField
      FieldName = 'CODIGOMOEDA'
      Required = True
    end
    object qrProdPRECOCUSTO: TFloatField
      FieldName = 'PRECOCUSTO'
    end
    object qrProdPESOPEDRA: TFloatField
      FieldName = 'PESOPEDRA'
    end
    object qrProdPESOPECA: TFloatField
      FieldName = 'PESOPECA'
    end
    object qrProdPRECOVENDA: TFloatField
      FieldName = 'PRECOVENDA'
    end
    object qrProdESTOQUEFISICO: TIntegerField
      FieldName = 'ESTOQUEFISICO'
    end
    object qrProdESTOQUEMINIMO: TIntegerField
      FieldName = 'ESTOQUEMINIMO'
    end
    object qrProdESTOQUECRITICO: TIntegerField
      FieldName = 'ESTOQUECRITICO'
    end
    object qrProdUNIDADE: TIBStringField
      FieldName = 'UNIDADE'
      Required = True
      Size = 2
    end
    object qrProdCOMISSAO: TFloatField
      FieldName = 'COMISSAO'
    end
    object qrProdOBSERVACAO: TIBStringField
      FieldName = 'OBSERVACAO'
      Size = 50
    end
    object qrProdTEMCONJUNTO: TIBStringField
      FieldName = 'TEMCONJUNTO'
      Size = 1
    end
    object qrProdDATACADASTRO: TDateTimeField
      FieldName = 'DATACADASTRO'
    end
    object qrProdFORMULA: TIBStringField
      FieldName = 'FORMULA'
      Size = 25
    end
    object qrProdMARGEM: TFloatField
      FieldName = 'MARGEM'
    end
    object qrProdGRAMA: TFloatField
      FieldName = 'GRAMA'
    end
    object qrProdMAOOBRA: TFloatField
      FieldName = 'MAOOBRA'
    end
    object qrProdINDICE: TFloatField
      FieldName = 'INDICE'
    end
    object qrProdJUROS: TFloatField
      FieldName = 'JUROS'
    end
    object qrProdDOLAR: TFloatField
      FieldName = 'DOLAR'
    end
    object qrProdSEGURO: TFloatField
      FieldName = 'SEGURO'
    end
    object qrProdCODFORNEC: TFloatField
      FieldName = 'CODFORNEC'
    end
    object qrProdCODIGOMETAL: TIntegerField
      FieldName = 'CODIGOMETAL'
    end
    object qrProdEMITETIQ: TIBStringField
      FieldName = 'EMITETIQ'
      Size = 10
    end
  end
end
