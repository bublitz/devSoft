object frmMain: TfrmMain
  Left = 189
  Top = 105
  Width = 800
  Height = 580
  Caption = 'devAdm - Principal'
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
  object lblEmpresa: TLabel
    Left = 0
    Top = 502
    Width = 792
    Height = 13
    Align = alBottom
    Alignment = taCenter
    Caption = 'lblEmpresa'
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 792
    Height = 36
    ButtonHeight = 30
    ButtonWidth = 30
    Caption = 'ToolBar1'
    TabOrder = 0
    object ToolButton1: TToolButton
      Left = 0
      Top = 2
      Width = 8
      Caption = 'ToolButton1'
      Style = tbsSeparator
    end
    object ToolButton2: TToolButton
      Left = 8
      Top = 2
      Caption = 'ToolButton2'
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 515
    Width = 792
    Height = 19
    Panels = <>
    SimplePanel = False
  end
  object MainMenu1: TMainMenu
    Left = 32
    Top = 108
    object Cadastro1: TMenuItem
      Caption = '&Cadastro'
      object Clientes1: TMenuItem
        Caption = '&Clientes'
        OnClick = Clientes1Click
      end
      object ListadeEspera1: TMenuItem
        Caption = '&Lista de Espera'
      end
      object ControledePromoesPanfletos1: TMenuItem
        Caption = 'C&ontrole de Promo'#231#245'es/Panfletos'
        OnClick = ControledePromoesPanfletos1Click
      end
      object Email1: TMenuItem
        Caption = '&Email'
        OnClick = Email1Click
      end
      object Estaes1: TMenuItem
        Caption = 'E&sta'#231#227'o'
        OnClick = Estaes1Click
      end
      object UsuariosdoSistema1: TMenuItem
        Caption = 'Us&uarios do Sistema'
        OnClick = UsuariosdoSistema1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Sair1: TMenuItem
        Caption = '&Sair'
        OnClick = Sair1Click
      end
    end
    object MovimentaoClientes1: TMenuItem
      Caption = '&Movimenta'#231#227'o Clientes'
      object ControledeGastosRecebimentosContaCorrente1: TMenuItem
        Caption = 'C&ontrole de Gastos/Recebimentos - Conta Corrente'
      end
      object CompradeHorasAntecipadas1: TMenuItem
        Caption = 'Co&mpra de Horas Antecipadas'
      end
      object ControledeMilhagens1: TMenuItem
        Caption = 'Co&ntrole de Milhagens'
      end
      object ContoledeBnus1: TMenuItem
        Caption = 'Con&trole de B'#244'nus'
      end
    end
    object Manuteno1: TMenuItem
      Caption = 'M&anuten'#231#227'o'
      object Backup1: TMenuItem
        Caption = '&Backup'
      end
      object Restore1: TMenuItem
        Caption = '&Restore'
      end
      object Log1: TMenuItem
        Caption = '&Log'
      end
    end
  end
end
