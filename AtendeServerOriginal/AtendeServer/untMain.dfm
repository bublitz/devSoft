object frmMain: TfrmMain
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = ':: Atende :: Server ::'
  ClientHeight = 410
  ClientWidth = 358
  Color = clBtnFace
  DefaultMonitor = dmPrimary
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Arial'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object Label1a: TLabel
    Left = 7
    Top = 7
    Width = 31
    Height = 16
    Caption = 'Data:'
  end
  object Label5: TLabel
    Left = 7
    Top = 199
    Width = 48
    Height = 13
    Caption = 'Log Server'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
  end
  object edtData: TMaskEdit
    Left = 7
    Top = 24
    Width = 97
    Height = 24
    EditMask = '!99/99/0099;1;_'
    MaxLength = 10
    TabOrder = 0
    Text = '  /  /    '
    OnExit = edtDataExit
  end
  object chkEspecial: TCheckBox
    Left = 8
    Top = 63
    Width = 97
    Height = 17
    Caption = 'Especial'
    TabOrder = 1
    OnClick = chkEspecialClick
  end
  object btnIniciar: TBitBtn
    Left = 8
    Top = 140
    Width = 129
    Height = 41
    Cursor = crHandPoint
    Caption = 'Iniciar'
    TabOrder = 2
    OnClick = btnIniciarClick
    Glyph.Data = {
      F6060000424DF606000000000000360000002800000018000000180000000100
      180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4D1F1C5A23166528126528
      125C24164F1F1CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF672812672812AA3E00
      BA4800C24F00C24F00BC4A00AC3F006D2B106D2B10FF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF5E26165E2616C1
      4B00D47729E5A96FF2D4B7F4E0CBF4E1CCF2D5BAE5AD79D57D32C44E00642814
      642814FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF762E
      0EB44100D17022EFCEAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFF2D8BDD57D32BB4400782F0DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FF7D310CBA4400DA904FFEFBF7FFFFFFF7EADAE0A674CC742BC76518C765
      18CB7026DE9F68F4E1CCFFFFFFFFFFFFDE9F68C14800782F0DFF00FFFF00FFFF
      00FFFF00FFFF00FF78300EB44100DA8E4AFFFFFFFFFFFFE2AC7AC05309B84100
      B74100BA4500BA4500BA4400B84100BD4F05DD9F65FFFFFFFFFFFFE0A064BB44
      00642814FF00FFFF00FFFF00FFFF00FF78300ECE6918FCF8F4FFFFFFDC9A5EB8
      4100B84100CE772DDC9A5EBA4400BB4700BC4B00BC4B00BB4700B74100D48743
      FFFEFCFFFFFFD47A2D642814FF00FFFF00FFFF00FF8B3708BB4700EEC7A3FFFF
      FFE9BB8FBF4B00C15203BF4B00D38039FFFFFFE5B587BF5006BA4400BC4B00BC
      4B00BC4A00B74100DEA169FFFFFFF3DAC2C44E006D2B0FFF00FFFF00FF8B3708
      D37423FFFEFCFCF4EECC6C1DC65A09C95E0DC55605D5863FFFFFFFFFFFFFF2D8
      BDC56216B84100BC4B00BC4B00BB4700BF5004F6E5D4FFFFFFD57B2D6D2B0FFF
      00FF8F3908B64902E3A368FFFFFFEDC49DCB5F0ECF6817CF6817CB5F0EDA8E48
      FFFFFFFFFFFFFFFFFFFAEEE2CF7930B84100BC4A00BC4B00B84100DEA16AFFFF
      FFE5AD79AC3F004F1F1C973D07C15609EEC7A3FFFFFFE3A368D16A18D57323D5
      7323D16A18DE9552FFFFFFFFFFFFFFFFFFFFFFFFFEFCFAD99557BA4500BC4A00
      BA4400CC7328FFFFFFF2D5BABB47005C25169D4006CA6313F6DDC4FFFFFFE197
      54D87726DA7E2EDA7D2DD77423E29C5BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFE5B07EBB4800BA4500C76518FFFFFFF4E1CCC24F00652812A14105CE6918
      F6DDC4FFFFFFE6A05FDE8131E1883AE1883ADD7F2EE7A365FFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFBF2E9D38441BB4800BA4500C76618FFFFFFF6E0CAC24F0065
      2812A64304CF6B1BF3CCA7FFFFFFEEBB8BE58A3CE79348E79348E58A3CEAAA6D
      FFFFFFFFFFFFFFFFFFFFFFFFF6E0CACC6E20BA4400BC4B00BA4400CF7930FFFF
      FFF0D1B2BA48005A2418A74202CC691AEEB782FFFFFFF8DEC4EB974BEE9E56EE
      9E56E99347EEB076FFFFFFFFFFFFFFFFFFEFCCA9CE6A1BC25304C05002BC4B00
      B74100E2AC7AFFFFFFE2A56BAA3D004E1F1DFF00FFB54E07EA9E57FEFBF7FFFC
      FBF4B579F3A65FF3A964EF9D52F0B57EFFFFFFFFFEFCEEBB8BD36D1CCC6311C7
      5C0CC15204BB4700C1570AFAEEE2FFFFFFD37423672813FF00FFFF00FFB54E07
      E28839F8D8B7FFFFFFFEE9D5FBB472F8B16DF3A45BF3BD89FEF7F0E9A76BD976
      24D47220CF6817C95E0DC15203BA4400E5B587FFFFFFEECCABC04900672813FF
      00FFFF00FFFF00FFB44B04F2AA67FEF7EFFFFFFFFFE3C9FBB472F3A45BF0AD70
      EBA564E08232DA7E2ED57323CF6817C65908BF4B00DD9F65FFFFFFFCF8F4D06C
      1B5A2418FF00FFFF00FFFF00FFFF00FFB44B04E1883AF7BF88FFFCFBFFFFFFFE
      E9D5F4B579EA9649E38737DE8131D87625D16A18CB5F0ECF6F21EABF95FFFFFF
      FFFFFFD98B45B441005A2418FF00FFFF00FFFF00FFFF00FFFF00FFBA530AE791
      45F7BF88FCF4EEFFFFFFFFFFFEF8DEC4F0BF8FE7A365E29957E5A96FEEC6A0FC
      F8F4FFFFFFFCF4EED88842BA44006A2A11FF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFBA530AE0883BF2AA67F7D5B4FEFBF7FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFEFCFAEABF95CE6617B240006C2C11FF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFB04904B04904E28839EA9E57EEB47D
      F2CAA1F6DABFF3D8BCEEC197E19D5DD16E1DBB47009A3902662914FF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFAC
      4B09AC4B09C9681CCE6A1BCB6718C76011C15609B249037A310D7A310DFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FF9A3D04973E07933C098C390A86350B7B310DFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
  end
  object btnParar: TBitBtn
    Left = 223
    Top = 140
    Width = 129
    Height = 41
    Cursor = crHandPoint
    Caption = 'Parar'
    Enabled = False
    TabOrder = 3
    OnClick = btnPararClick
    Glyph.Data = {
      F6060000424DF606000000000000360000002800000018000000180000000100
      180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4D1F1C5A23166528126528
      125C24164F1F1CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF672812672812AA3E00
      BA4800C24F00C24F00BB4900AC3F006D2B106D2B10FF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF5E26165E2616C1
      4B00D47729E5A96FF2D4B7F4E0CBF4E1CCF2D7BBE6AF7BD57D32C44E00642814
      642814FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF762E
      0EB44100D17022EFCEAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFF2D8BDD57D32BB4400782F0DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FF7D310CBA4400DA904FFEFBFAFFFFFFF8EADAE1A675CC742CC66518C665
      18CB7026DD9F69F4E1CCFFFFFFFFFFFFE09F66C14800782F0DFF00FFFF00FFFF
      00FFFF00FFFF00FF78300EB44100DA8E4AFFFFFFFFFFFFE2AC7AC05409B84100
      BA4400BA4600BA4600BA4400B84100BD4F05DD9F65FFFFFFFFFFFFE0A064BB44
      00642814FF00FFFF00FFFF00FFFF00FF78300ECE6918FCF8F4FFFFFFDC995DB8
      4100BA4400BB4700BB4700BB4700BB4700BB4700BB4700BA4400B74000D48743
      FFFEFCFFFFFFD47A2D642814FF00FFFF00FFFF00FF8B3708BB4700EDC7A3FFFF
      FFE9BB8FBF4C00C15304C76213C76213C55F11C45D0FC45D0FC45D0FC45D0FC4
      5C0EBC4D01B74000DEA169FFFFFFF3DAC2C44E006D2B0FFF00FFFF00FF8B3708
      D37423FFFEFCFCF4EDCC6C1DC55807CB6413FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFC45C0EBA4400BF5004F6E5D4FFFFFFD57B2D6D2B0FFF
      00FF8F3908B64902E2A166FFFFFFEDC49DCB600ECE6715D06E1EFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC45D0FBB4700B84100DEA16AFFFF
      FFE5AD79AC3F004F1F1C973D07C15609EFC7A1FFFFFFE3A469D16A18D47220D7
      7829FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC45D0FBB4700
      BA4400CC7328FFFFFFF2D5BABB47005C25169D4006CA6313F6DDC4FFFFFFE197
      54D87726DA7B2CDC8235FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFC45D0FBB4700BA4600C76518FFFFFFF4E1CCC24F00652812A14105CE6918
      F6DDC4FFFFFFE6A05FDE8131E18839E28C41FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFC45D0FBB4700BA4600C76618FFFFFFF4E0CBC24F0065
      2812A64304CF6B1BF3CCA7FFFFFFEFBC8BE58A3CE79246E7974DFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC55F11BB4700BA4400CF792FFFFF
      FFF0D1B2BA46005A2418A74202CC691AEEB782FFFFFFF8DEC4EB974CEE9D54EE
      A15BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC66213BB4700
      B74100E2AC7AFFFFFFE2A56BAA3D004E1F1DFF00FFB54E07EA9E58FEFBFAFFFC
      FBF4B579F3A55DF3AB69FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFC76213BA4400C1570AFAEEE2FFFFFFD37423672813FF00FFFF00FFB54E07
      E18839F8D8B7FFFFFFFEE9D5FBB472F8B16EF3AB69EEA15BE7974DE28C41DC82
      35D77829D06E1ECB6413C15203B84100E5B587FFFFFFEECCABC04900672813FF
      00FFFF00FFFF00FFB44B04F2AA67FEF7EFFFFFFFFFE3C9FAB472F3A55DEE9D54
      E79246E18839DA7B2CD47220CE6715C55807BF4C00DD9F65FFFFFFFCF8F4D06C
      1B5A2418FF00FFFF00FFFF00FFFF00FFB44B04E1883BF7BF88FFFCFBFFFFFFFC
      E9D4F4B579EB974CE58A3CDE8131D87625D16A18CB600ECF6F21EABF95FFFFFF
      FFFFFFD98B45B441005A2418FF00FFFF00FFFF00FFFF00FFFF00FFBA530AE791
      45F7BF88FEF7EFFFFFFFFFFFFEF8DEC4F0BF90E7A364E29957E5A96FEEC6A0FC
      F8F4FFFFFFFBF4EED88842BA44006A2A11FF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFBA530AE0883BF2AA67F7D5B4FEFBF7FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFEFBFAEABF95CE6617B240006C2C11FF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFB04904B04904E18839EA9D56EEB47D
      F2CAA1F6DABFF4D8BCEEC197E19D5DD16E1DBB4700662914662914FF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFAC
      4B09AC4B09C9681CCC6A1BCB6718C76011C05409B249037A310D7A310DFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FF9A3D04973E07933C098C390A86350B7B310DFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
  end
  object GroupBox1: TGroupBox
    Left = 165
    Top = 8
    Width = 185
    Height = 129
    Caption = 'Ajustar Tamanho'
    TabOrder = 4
    object Label2a: TLabel
      Left = 16
      Top = 27
      Width = 37
      Height = 16
      Caption = 'Senha'
    end
    object Label3: TLabel
      Left = 16
      Top = 62
      Width = 32
      Height = 16
      Caption = 'Mesa'
    end
    object Label4: TLabel
      Left = 16
      Top = 97
      Width = 64
      Height = 16
      Caption = 'Mensagem'
    end
    object SpinEdit1: TSpinEdit
      Left = 101
      Top = 24
      Width = 68
      Height = 26
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
      Height = 26
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
      Height = 26
      MaxValue = 0
      MinValue = 0
      TabOrder = 2
      Value = 0
      OnChange = SpinEdit3Change
    end
  end
  object chkNova: TCheckBox
    Left = 8
    Top = 86
    Width = 129
    Height = 17
    Caption = 'Nova Contagem'
    Checked = True
    State = cbChecked
    TabOrder = 5
    OnClick = chkNovaClick
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 391
    Width = 358
    Height = 19
    Panels = <>
    SimplePanel = True
  end
  object Memo1: TMemo
    Left = 7
    Top = 218
    Width = 345
    Height = 170
    ScrollBars = ssVertical
    TabOrder = 7
  end
  object edtSenha: TMaskEdit
    Left = 25
    Top = 105
    Width = 54
    Height = 24
    Enabled = False
    EditMask = '!999;0; '
    MaxLength = 3
    TabOrder = 8
  end
  object btnTestar: TBitBtn
    Left = 152
    Top = 141
    Width = 57
    Height = 40
    Cursor = crHandPoint
    Caption = 'Testar'
    Enabled = False
    TabOrder = 9
    OnClick = btnTestarClick
  end
  object XPManifest1: TXPManifest
    Left = 119
    Top = 15
  end
  object Server: TServerSocket
    Active = False
    Port = 3000
    ServerType = stNonBlocking
    ThreadCacheSize = 1
    OnListen = ServerListen
    OnClientConnect = ServerClientConnect
    OnClientDisconnect = ServerClientDisconnect
    OnClientRead = ServerClientRead
    OnClientError = ServerClientError
    Left = 127
    Top = 267
  end
  object AutoUpdate1: TAutoUpdate
    FTPHost = 'intranetsrv.tre-mt.gov.br'
    FTPUser = 'anonymous'
    FTPPassword = 'atende@tre-mt.gov.br'
    FTPDir = '/atende'
    FTPPassive = False
    UpdateMessage = 
      'H'#225' uma nova vers'#227'o do aplicativo dispon'#237'vel.'#13'A atualiza'#231#227'o autom' +
      #225'tica ser'#225' iniciada.'
    OptionalUpdate = False
    OnNeedVersion = AutoUpdate1NeedVersion
    Left = 192
    Top = 272
  end
end