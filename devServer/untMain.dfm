object Form1: TForm1
  Left = 192
  Top = 107
  Width = 419
  Height = 321
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 5
    Top = 54
    Width = 392
    Height = 215
    TabOrder = 0
  end
  object Button1: TButton
    Left = 47
    Top = 12
    Width = 75
    Height = 25
    Caption = 'Ativar'
    TabOrder = 1
    OnClick = Button1Click
  end
  object sktServer: TServerSocket
    Active = False
    Port = 1972
    ServerType = stNonBlocking
    OnAccept = sktServerAccept
    OnClientConnect = sktServerClientConnect
    OnClientDisconnect = sktServerClientDisconnect
    OnClientRead = sktServerClientRead
    Left = 5
    Top = 9
  end
end
