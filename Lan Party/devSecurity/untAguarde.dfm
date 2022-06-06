object frmAguarde: TfrmAguarde
  Left = 418
  Top = 307
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Aguarde... Conectando ao servidor....'
  ClientHeight = 96
  ClientWidth = 297
  Color = clGray
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 0
    Top = 0
    Width = 297
    Height = 20
    Align = alTop
    Alignment = taCenter
    Caption = 'Verificando status...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Layout = tlBottom
  end
  object BitBtn1: TBitBtn
    Left = 102
    Top = 47
    Width = 102
    Height = 34
    TabOrder = 0
    Kind = bkOK
  end
  object sktClient: TClientSocket
    Active = False
    ClientType = ctNonBlocking
    Port = 1972
    OnConnect = sktClientConnect
    OnRead = sktClientRead
    OnError = sktClientError
    Left = 13
    Top = 47
  end
end
