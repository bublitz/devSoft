object frmLogin: TfrmLogin
  Left = 317
  Top = 222
  Width = 296
  Height = 185
  ActiveControl = edtUser
  Caption = 'Login'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object SpeedButton1: TSpeedButton
    Left = 11
    Top = 107
    Width = 69
    Height = 26
    Cursor = crHandPoint
    Caption = 'Ok'
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
      555555555555555555555555555555555555555555FF55555555555559055555
      55555555577FF5555555555599905555555555557777F5555555555599905555
      555555557777FF5555555559999905555555555777777F555555559999990555
      5555557777777FF5555557990599905555555777757777F55555790555599055
      55557775555777FF5555555555599905555555555557777F5555555555559905
      555555555555777FF5555555555559905555555555555777FF55555555555579
      05555555555555777FF5555555555557905555555555555777FF555555555555
      5990555555555555577755555555555555555555555555555555}
    NumGlyphs = 2
    OnClick = SpeedButton1Click
  end
  object SpeedButton2: TSpeedButton
    Left = 207
    Top = 108
    Width = 69
    Height = 26
    Cursor = crHandPoint
    Caption = 'Cancela'
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
      33333337777FF377FF3333993370739993333377FF373F377FF3399993000339
      993337777F777F3377F3393999707333993337F77737333337FF993399933333
      399377F3777FF333377F993339903333399377F33737FF33377F993333707333
      399377F333377FF3377F993333101933399377F333777FFF377F993333000993
      399377FF3377737FF7733993330009993933373FF3777377F7F3399933000399
      99333773FF777F777733339993707339933333773FF7FFF77333333999999999
      3333333777333777333333333999993333333333377777333333}
    NumGlyphs = 2
    OnClick = SpeedButton2Click
  end
  object edtUser: TLabeledEdit
    Left = 11
    Top = 24
    Width = 121
    Height = 21
    CharCase = ecUpperCase
    EditLabel.Width = 67
    EditLabel.Height = 13
    EditLabel.Caption = 'Nome Usu'#225'rio'
    LabelPosition = lpAbove
    LabelSpacing = 3
    TabOrder = 0
  end
  object edtSenha: TLabeledEdit
    Left = 155
    Top = 24
    Width = 121
    Height = 21
    EditLabel.Width = 31
    EditLabel.Height = 13
    EditLabel.Caption = 'Senha'
    LabelPosition = lpAbove
    LabelSpacing = 3
    PasswordChar = '*'
    TabOrder = 1
    OnKeyPress = edtSenhaKeyPress
  end
  object Animate1: TAnimate
    Left = 86
    Top = 50
    Width = 115
    Height = 81
    Active = False
    AutoSize = False
    CommonAVI = aviFindFolder
    StopFrame = 29
    Visible = False
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 139
    Width = 288
    Height = 19
    Panels = <>
    SimplePanel = True
  end
  object sktClient: TClientSocket
    Active = False
    ClientType = ctNonBlocking
    Port = 1972
    OnConnect = sktClientConnect
    OnRead = sktClientRead
    OnError = sktClientError
    Left = 12
    Top = 69
  end
end