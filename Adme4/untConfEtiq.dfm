object frmConfEtiq: TfrmConfEtiq
  Left = 306
  Top = 317
  Width = 238
  Height = 233
  Caption = 'Configuração de Etiqueta'
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
  object btnTestar: TButton
    Left = 136
    Top = 78
    Width = 75
    Height = 25
    Caption = '&Testar'
    TabOrder = 0
    OnClick = btnTestarClick
  end
  object GroupBox1: TGroupBox
    Left = 10
    Top = 6
    Width = 107
    Height = 89
    Caption = ' Etiqueta 1 '
    TabOrder = 1
    object Label1: TLabel
      Left = 11
      Top = 22
      Width = 19
      Height = 13
      Alignment = taRightJustify
      Caption = 'Top'
    end
    object Label2: TLabel
      Left = 12
      Top = 58
      Width = 18
      Height = 13
      Alignment = taRightJustify
      Caption = 'Left'
    end
    object edt1Top: TEdit
      Left = 34
      Top = 18
      Width = 53
      Height = 21
      TabOrder = 0
    end
    object edt1Left: TEdit
      Left = 34
      Top = 54
      Width = 53
      Height = 21
      TabOrder = 1
    end
  end
  object GroupBox2: TGroupBox
    Left = 11
    Top = 106
    Width = 107
    Height = 89
    Caption = ' Etiqueta 2 '
    TabOrder = 2
    object Label3: TLabel
      Left = 11
      Top = 22
      Width = 19
      Height = 13
      Alignment = taRightJustify
      Caption = 'Top'
    end
    object Label4: TLabel
      Left = 12
      Top = 58
      Width = 18
      Height = 13
      Alignment = taRightJustify
      Caption = 'Left'
    end
    object edt2Top: TEdit
      Left = 34
      Top = 18
      Width = 53
      Height = 21
      TabOrder = 0
    end
    object edt2Left: TEdit
      Left = 34
      Top = 54
      Width = 53
      Height = 21
      TabOrder = 1
    end
  end
  object Button1: TButton
    Left = 136
    Top = 40
    Width = 75
    Height = 25
    Caption = '&Ler'
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 136
    Top = 116
    Width = 75
    Height = 25
    Caption = '&Gravar'
    TabOrder = 4
    OnClick = Button2Click
  end
end
