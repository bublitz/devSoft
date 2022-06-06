object frmContraSenha: TfrmContraSenha
  Left = 446
  Top = 225
  Width = 298
  Height = 171
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Contra-Senha'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 8
    Top = 7
    Width = 273
    Height = 61
  end
  object Label1: TLabel
    Left = 16
    Top = 12
    Width = 56
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Data:'
  end
  object Label2: TLabel
    Left = 16
    Top = 31
    Width = 56
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Hora:'
  end
  object Label3: TLabel
    Left = 16
    Top = 50
    Width = 56
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Operação:'
  end
  object Label4: TLabel
    Left = 75
    Top = 12
    Width = 39
    Height = 13
    Caption = 'Label4'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHighlight
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 75
    Top = 31
    Width = 39
    Height = 13
    Caption = 'Label5'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHighlight
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 75
    Top = 50
    Width = 39
    Height = 13
    Caption = 'Label6'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHighlight
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object edtSenha: TEdit
    Left = 54
    Top = 80
    Width = 183
    Height = 21
    PasswordChar = '#'
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 106
    Top = 108
    Width = 75
    Height = 25
    TabOrder = 1
    OnClick = BitBtn1Click
    Kind = bkOK
  end
end
