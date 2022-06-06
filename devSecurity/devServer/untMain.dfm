object Form1: TForm1
  Left = 192
  Top = 107
  Width = 452
  Height = 480
  Caption = 'devSecurity - Server'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 0
    Top = 41
    Width = 444
    Height = 393
    Align = alBottom
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
  object MainMenu1: TMainMenu
    Left = 200
    Top = 9
    object Arquivo1: TMenuItem
      Caption = '&Arquivo'
      object Sair1: TMenuItem
        Caption = 'Sai&r'
      end
    end
    object abelas1: TMenuItem
      Caption = '&Tabelas'
      object Estaes1: TMenuItem
        Caption = '&Esta'#231#245'es'
      end
      object Usurios1: TMenuItem
        Caption = '&Usu'#225'rios'
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Senha1: TMenuItem
        Caption = '&Senha'
      end
    end
    object Ajuda1: TMenuItem
      Caption = 'Ajuda'
      object Sobre1: TMenuItem
        Caption = 'Sobre...'
        OnClick = Sobre1Click
      end
    end
  end
end
