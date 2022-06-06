object frmPrincipal: TfrmPrincipal
  Left = 192
  Top = 107
  Width = 696
  Height = 480
  Caption = 'devFinan'
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
  object MainMenu1: TMainMenu
    Left = 123
    Top = 4
    object Cadastros1: TMenuItem
      Caption = '&Cadastros'
      object PlanodeContas1: TMenuItem
        Caption = 'Plano de Contas'
        OnClick = PlanodeContas1Click
      end
      object ContasaReceber1: TMenuItem
        Caption = 'Contas a Receber'
        OnClick = ContasaReceber1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Sair1: TMenuItem
        Caption = 'Sai&r'
      end
    end
  end
end
