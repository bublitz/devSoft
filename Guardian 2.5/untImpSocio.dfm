object frmImpSocio: TfrmImpSocio
  Left = 235
  Top = 159
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Guardian - Impressão Carteiras Socios'
  ClientHeight = 410
  ClientWidth = 681
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 681
    Height = 410
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
      Caption = 'Emissão Carteira'
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
      DataSource = dsEmissaoCart
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
          Alignment = taCenter
          Expanded = False
          FieldName = 'CODIGOSOCIO'
          Title.Caption = 'Código Socio'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME'
          Title.Caption = 'Nome'
          Width = 400
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'DATACADASTRO'
          Title.Caption = 'Data Cadastro'
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'CARTEIRA'
          Title.Caption = 'Carteira'
          Width = 50
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
      OnChange = EditPesqChange
    end
  end
  object qrEmissaoCart: TIBQuery
    Database = dtMod.dtBase
    Transaction = dtMod.IBTrans
    CachedUpdates = False
    SQL.Strings = (
      'Select CodigoSocio, Nome, CARTEIRA, DATACADASTRO'
      'From Socio'
      'WHERE CODIGOSOCIO > 0'
      'Order by DataCadastro DESC')
    Left = 366
    Top = 124
    object qrEmissaoCartCODIGOSOCIO: TIntegerField
      FieldName = 'CODIGOSOCIO'
      Required = True
    end
    object qrEmissaoCartNOME: TIBStringField
      FieldName = 'NOME'
      Size = 50
    end
    object qrEmissaoCartCARTEIRA: TIBStringField
      FieldName = 'CARTEIRA'
      Size = 1
    end
    object qrEmissaoCartDATACADASTRO: TDateTimeField
      FieldName = 'DATACADASTRO'
    end
  end
  object dsEmissaoCart: TDataSource
    DataSet = qrEmissaoCart
    Left = 274
    Top = 126
  end
  object dsCart: TDataSource
    DataSet = qrCart
    Left = 274
    Top = 176
  end
  object qrCart: TIBQuery
    Database = dtMod.dtBase
    Transaction = dtMod.IBTrans
    CachedUpdates = False
    SQL.Strings = (
      'Select *'
      'From Socio'
      'Where Carteira = '#39'I'#39
      'Order by Nome'
      '')
    Left = 366
    Top = 176
    object qrCartCODIGOSOCIO: TIntegerField
      FieldName = 'CODIGOSOCIO'
      Required = True
    end
    object qrCartNOME: TIBStringField
      FieldName = 'NOME'
      Size = 50
    end
    object qrCartDATACADASTRO: TDateTimeField
      FieldName = 'DATACADASTRO'
    end
    object qrCartCARTEIRA: TIBStringField
      FieldName = 'CARTEIRA'
      Size = 1
    end
    object qrCartCODIGOPLANO: TIntegerField
      FieldName = 'CODIGOPLANO'
    end
    object qrCartENDERECO: TIBStringField
      FieldName = 'ENDERECO'
      Size = 50
    end
    object qrCartCOMPLEMENTO: TIBStringField
      FieldName = 'COMPLEMENTO'
      Size = 50
    end
    object qrCartBAIRRO: TIBStringField
      FieldName = 'BAIRRO'
      Size = 50
    end
    object qrCartCIDADE: TIBStringField
      FieldName = 'CIDADE'
      Size = 50
    end
    object qrCartUF: TIBStringField
      FieldName = 'UF'
    end
    object qrCartCEP: TIBStringField
      FieldName = 'CEP'
      Size = 10
    end
    object qrCartCPF: TIBStringField
      FieldName = 'CPF'
      Size = 11
    end
    object qrCartRG: TIBStringField
      FieldName = 'RG'
      Size = 15
    end
    object qrCartDATANASCIMENTO: TDateTimeField
      FieldName = 'DATANASCIMENTO'
    end
    object qrCartFOTO: TBlobField
      FieldName = 'FOTO'
      BlobType = ftBlob
      Size = 8
    end
    object qrCartTELEFONE: TIBStringField
      FieldName = 'TELEFONE'
      Size = 50
    end
    object qrCartEMAIL: TIBStringField
      FieldName = 'EMAIL'
      Size = 50
    end
    object qrCartSITUACAO: TIBStringField
      FieldName = 'SITUACAO'
      Size = 1
    end
    object qrCartDIAVENCTO: TIntegerField
      FieldName = 'DIAVENCTO'
    end
    object qrCartCodigoBarra: TStringField
      FieldKind = fkLookup
      FieldName = 'CodigoBarra'
      LookupDataSet = dtMod.tbSocio
      LookupKeyFields = 'CODIGOSOCIO'
      LookupResultField = 'CodigoBarra'
      KeyFields = 'CODIGOSOCIO'
      Size = 15
      Lookup = True
    end
  end
end
