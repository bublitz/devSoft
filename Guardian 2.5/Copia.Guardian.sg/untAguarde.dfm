object frmAguarde: TfrmAguarde
  Left = 322
  Top = 215
  Width = 367
  Height = 121
  BorderIcons = [biSystemMenu]
  Caption = 'Aguarde...'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object lblMens: TRxLabel
    Left = 0
    Top = 0
    Width = 359
    Height = 21
    Align = alTop
    Alignment = taCenter
    Caption = 'Aguarde... Atualizando situação dos Sócios...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
  end
  object btnFechar: TBitBtn
    Left = 282
    Top = 66
    Width = 75
    Height = 25
    Caption = '&Fechar'
    Enabled = False
    TabOrder = 0
    OnClick = btnFecharClick
    Kind = bkClose
  end
  object dsAtual: TDataSource
    DataSet = qrAtual
    Left = 20
    Top = 28
  end
  object qrAtual: TIBQuery
    Database = dtMod.dtBase
    Transaction = dtMod.IBTrans
    CachedUpdates = False
    SQL.Strings = (
      'update socio'
      'set'
      'SITUACAO = '#39'B'#39
      'where DATAVENCTO <=:DATA '
      '       or DATAVENCTO is null '
      '  ')
    Left = 64
    Top = 28
    ParamData = <
      item
        DataType = ftDate
        Name = 'DATA'
        ParamType = ptUnknown
      end>
  end
end
