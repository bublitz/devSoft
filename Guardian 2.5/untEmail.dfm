object frmEmail: TfrmEmail
  Left = 318
  Top = 255
  Width = 488
  Height = 370
  Caption = 'Guardian - Enviar e-mail'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 10
    Top = 75
    Width = 22
    Height = 13
    Caption = 'Para'
  end
  object Label2: TLabel
    Left = 10
    Top = 95
    Width = 38
    Height = 13
    Caption = 'Assunto'
  end
  object Label3: TLabel
    Left = 10
    Top = 115
    Width = 37
    Height = 13
    Caption = 'Atachar'
  end
  object Label4: TLabel
    Left = 10
    Top = 180
    Width = 57
    Height = 13
    Caption = 'Menssagem'
  end
  object Label5: TLabel
    Left = 10
    Top = 10
    Width = 59
    Height = 13
    Caption = 'Data Inicial :'
  end
  object Label6: TLabel
    Left = 10
    Top = 36
    Width = 54
    Height = 13
    Caption = 'Data Final :'
  end
  object Edit1: TFlatEdit
    Left = 100
    Top = 75
    Width = 300
    Height = 19
    ColorBorder = clNavy
    ColorFlat = clBtnFace
    ParentColor = True
    CharCase = ecLowerCase
    TabOrder = 0
  end
  object Edit2: TFlatEdit
    Left = 100
    Top = 95
    Width = 300
    Height = 19
    ColorBorder = clNavy
    ColorFlat = clBtnFace
    ParentColor = True
    CharCase = ecLowerCase
    TabOrder = 1
  end
  object ListBox1: TFlatListBox
    Left = 100
    Top = 115
    Width = 300
    Height = 61
    ColorBorder = clNavy
  end
  object Memo1: TFlatMemo
    Left = 100
    Top = 180
    Width = 300
    Height = 156
    ColorBorder = clNavy
    ColorFlat = clBtnFace
    ParentColor = True
    TabOrder = 3
  end
  object Button6: TButton
    Left = 331
    Top = 22
    Width = 71
    Height = 24
    Caption = 'Enviar'
    TabOrder = 4
    OnClick = Button6Click
  end
  object Button4: TButton
    Left = 401
    Top = 116
    Width = 75
    Height = 25
    Caption = 'Adiciona'
    TabOrder = 5
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 401
    Top = 141
    Width = 75
    Height = 25
    Caption = 'Remove'
    TabOrder = 6
    OnClick = Button5Click
  end
  object TDBDateEdit
    Left = 100
    Top = 10
    Width = 121
    Height = 21
    NumGlyphs = 2
    TabOrder = 7
  end
  object DBDateEdit2: TDBDateEdit
    Left = 100
    Top = 36
    Width = 121
    Height = 21
    NumGlyphs = 2
    TabOrder = 8
  end
  object OpenDialog1: TOpenDialog
    Left = 148
    Top = 253
  end
  object NMSMTP1: TNMSMTP
    Port = 25
    ReportLevel = 0
    PostMessage.LocalProgram = 'NetMasters SMTP Demo'
    EncodeType = uuMime
    ClearParams = True
    SubType = mtPlain
    Charset = 'us-ascii'
    Left = 218
    Top = 253
  end
end
