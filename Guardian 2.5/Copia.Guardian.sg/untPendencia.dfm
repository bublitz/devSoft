object frmPendencia: TfrmPendencia
  Left = 239
  Top = 202
  BorderStyle = bsSingle
  Caption = 'Pendências dos Sócios'
  ClientHeight = 311
  ClientWidth = 753
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
  object Label1: TLabel
    Left = 10
    Top = 7
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
  object Label2: TLabel
    Left = 342
    Top = 38
    Width = 35
    Height = 13
    Caption = 'Faturas'
  end
  object DBGrid1: TDBGrid
    Left = 10
    Top = 54
    Width = 300
    Height = 249
    Cursor = crHandPoint
    DataSource = dtMod.dsSocio
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'NOME'
        Title.Caption = 'Sócio'
        Width = 261
        Visible = True
      end>
  end
  object EditPesq: TEdit
    Left = 10
    Top = 25
    Width = 300
    Height = 21
    CharCase = ecUpperCase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnChange = EditPesqChange
  end
  object DBGrid2: TDBGrid
    Left = 342
    Top = 54
    Width = 401
    Height = 249
    Cursor = crHandPoint
    DataSource = dsFaturas
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = DBGrid2DblClick
    Columns = <
      item
        ButtonStyle = cbsEllipsis
        Expanded = False
        FieldName = 'NUMERO'
        Title.Caption = 'Número'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATAVENCIMENTO'
        Title.Caption = 'Vencto'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRICAO'
        Title.Caption = 'Situação'
        Width = 108
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR'
        Title.Alignment = taRightJustify
        Title.Caption = 'Valor'
        Width = 120
        Visible = True
      end>
  end
  object dsFaturas: TDataSource
    DataSet = qryFaturas
    Left = 344
    Top = 10
  end
  object qryFaturas: TIBQuery
    Database = dtMod.dtBase
    Transaction = dtMod.IBTrans
    CachedUpdates = False
    DataSource = dtMod.dsSocio
    SQL.Strings = (
      'select r.NUMERO, '
      '       r.DATAVENCIMENTO, '
      '       r.VALOR,'
      '       s.DESCRICAO'
      'from CONTARECEBER r,'
      '     SITUACAO s'
      'where r.CODIGOSITUACAO=s.CODIGOSITUACAO'
      '  and r.DATAPAGAMENTO is null '
      '  and r.DATAVENCIMENTO <= :DTVENCTO'
      '  and r.CODIGOSOCIO = :CODIGOSOCIO')
    Left = 376
    Top = 10
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DTVENCTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CODIGOSOCIO'
        ParamType = ptUnknown
      end>
    object qryFaturasNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Required = True
    end
    object qryFaturasDATAVENCIMENTO: TDateTimeField
      FieldName = 'DATAVENCIMENTO'
    end
    object qryFaturasVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object qryFaturasDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Size = 50
    end
  end
end
