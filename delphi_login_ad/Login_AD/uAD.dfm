object frmLogin: TfrmLogin
  Left = 0
  Top = 0
  Caption = 'Login'
  ClientHeight = 175
  ClientWidth = 394
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lblUsuario: TLabel
    Left = 48
    Top = 51
    Width = 40
    Height = 13
    Caption = 'Usu'#225'rio:'
  end
  object lblSenha: TLabel
    Left = 48
    Top = 88
    Width = 34
    Height = 13
    Caption = 'Senha:'
  end
  object lblLogin: TLabel
    Left = 169
    Top = 8
    Width = 66
    Height = 24
    Caption = 'LOGIN'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btnLogin: TButton
    Left = 168
    Top = 128
    Width = 75
    Height = 25
    Caption = 'Entrar'
    TabOrder = 2
    OnClick = btnLoginClick
  end
  object edtUsuario: TEdit
    Left = 104
    Top = 48
    Width = 233
    Height = 21
    TabOrder = 0
  end
  object edtSenha: TEdit
    Left = 104
    Top = 85
    Width = 233
    Height = 21
    PasswordChar = '*'
    TabOrder = 1
  end
end
