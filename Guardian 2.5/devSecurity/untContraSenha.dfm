object frmContraSenha: TfrmContraSenha
  Left = 270
  Top = 127
  ActiveControl = edtSenha
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Contra-Senha'
  ClientHeight = 207
  ClientWidth = 290
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  DesignSize = (
    290
    207)
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 7
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
    Caption = 'Opera'#231#227'o:'
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
  object Label7: TLabel
    Left = 111
    Top = 83
    Width = 65
    Height = 13
    Caption = 'Contra-Senha'
  end
  object edtSenha: TEdit
    Left = 52
    Top = 100
    Width = 183
    Height = 28
    Anchors = [akLeft, akBottom]
    Color = clSkyBlue
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    PasswordChar = '@'
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 106
    Top = 166
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    TabOrder = 1
    Kind = bkOK
  end
end
