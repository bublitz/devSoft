object frmPainel: TfrmPainel
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Tribunal Regional Eleitoral de Mato Grosso'
  ClientHeight = 445
  ClientWidth = 687
  Color = clBlack
  DefaultMonitor = dmDesktop
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  OldCreateOrder = False
  PopupMenu = PopupMenu1
  Position = poScreenCenter
  Visible = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 14
  GlassFrame.Left = 35
  GlassFrame.Right = 35
  object MediaPlayer1: TMediaPlayer
    Left = 24
    Top = 120
    Width = 253
    Height = 30
    Visible = False
    TabOrder = 0
    OnNotify = MediaPlayer1Notify
  end
  object panSenha: TPanel
    Left = 200
    Top = 0
    Width = 487
    Height = 445
    Align = alClient
    TabOrder = 1
    DesignSize = (
      487
      445)
    object Label1: TLabel
      Left = 1
      Top = 1
      Width = 485
      Height = 50
      Align = alTop
      Alignment = taCenter
      Caption = 'Senha'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -45
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
      ExplicitWidth = 130
    end
    object Label2: TLabel
      Left = 1
      Top = 332
      Width = 485
      Height = 50
      Align = alBottom
      Alignment = taCenter
      Caption = 'Mesa'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -45
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
      ExplicitWidth = 110
    end
    object labMesa: TLabel
      Left = 1
      Top = 382
      Width = 485
      Height = 62
      Align = alBottom
      Alignment = taCenter
      Caption = '---'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clYellow
      Font.Height = -53
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
      ExplicitWidth = 54
    end
    object labSenha: TLabel
      Left = 1
      Top = 51
      Width = 485
      Height = 281
      Align = alClient
      Alignment = taCenter
      Caption = '---'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clYellow
      Font.Height = -133
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
      ExplicitWidth = 132
      ExplicitHeight = 153
    end
    object GroupBox1: TGroupBox
      Left = 9
      Top = 8
      Width = 185
      Height = 169
      Anchors = [akTop, akRight]
      Caption = 'Ajustar Tamanho'
      Color = clSilver
      ParentBackground = False
      ParentColor = False
      TabOrder = 0
      Visible = False
      object Label2a: TLabel
        Left = 16
        Top = 27
        Width = 31
        Height = 14
        Caption = 'Senha'
      end
      object Label3: TLabel
        Left = 16
        Top = 62
        Width = 26
        Height = 14
        Caption = 'Mesa'
      end
      object Label4: TLabel
        Left = 16
        Top = 97
        Width = 52
        Height = 14
        Caption = 'Mensagem'
      end
      object SpinEdit1: TSpinEdit
        Left = 101
        Top = 24
        Width = 68
        Height = 23
        MaxValue = 0
        MinValue = 0
        TabOrder = 0
        Value = 0
        OnChange = SpinEdit1Change
      end
      object SpinEdit2: TSpinEdit
        Left = 101
        Top = 59
        Width = 68
        Height = 23
        MaxValue = 0
        MinValue = 0
        TabOrder = 1
        Value = 0
        OnChange = SpinEdit2Change
      end
      object SpinEdit3: TSpinEdit
        Left = 101
        Top = 94
        Width = 68
        Height = 23
        MaxValue = 0
        MinValue = 0
        TabOrder = 2
        Value = 0
        OnChange = SpinEdit3Change
      end
      object BitBtn1: TBitBtn
        Left = 56
        Top = 128
        Width = 75
        Height = 25
        Caption = 'Ok'
        TabOrder = 3
        OnClick = BitBtn1Click
      end
    end
  end
  object panNoticias: TPanel
    Left = 0
    Top = 0
    Width = 200
    Height = 445
    Align = alLeft
    Color = clSkyBlue
    ParentBackground = False
    TabOrder = 2
    Visible = False
    object WebBrowser1: TWebBrowser
      Left = 1
      Top = 1
      Width = 198
      Height = 443
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alClient
      TabOrder = 0
      ExplicitWidth = 685
      ControlData = {
        4C00000077140000C92D00000000000000000000000000000000000000000000
        000000004C000000000000000000000001000000E0D057007335CF11AE690800
        2B2E126202000000000000004C0000000114020000000000C000000000000046
        8000000000000000000000000000000000000000000000000000000000000000
        00000000000000000100000000000000000000000000000000000000}
    end
    object ProgressBar1: TProgressBar
      Left = 84
      Top = 388
      Width = 150
      Height = 17
      TabOrder = 1
      Visible = False
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 60000
    OnTimer = Timer1Timer
    Left = 280
    Top = 208
  end
  object PopupMenu1: TPopupMenu
    Left = 320
    Top = 208
    object estar1: TMenuItem
      Caption = 'Testar'
      ShortCut = 113
      OnClick = estar1Click
    end
    object Ajustar: TMenuItem
      Caption = 'Ajustar tamanho das fontes'
      ShortCut = 114
      OnClick = AjustarClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object Especial1: TMenuItem
      Caption = 'Especial'
      ShortCut = 116
      OnClick = Especial1Click
    end
  end
end
