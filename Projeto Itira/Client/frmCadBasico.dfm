object fCadBasico: TfCadBasico
  Left = 407
  Top = 187
  Caption = 'Cadastro B'#225'sico'
  ClientHeight = 434
  ClientWidth = 705
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MenuPrincipal
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlBotoes: TPanel
    Left = 0
    Top = 0
    Width = 59
    Height = 415
    Align = alLeft
    BevelInner = bvLowered
    TabOrder = 0
    object bbtNovoRegistro: TBitBtn
      Left = 3
      Top = 3
      Width = 53
      Height = 53
      Caption = 'Novo'
      TabOrder = 0
      OnClick = bbtNovoRegistroClick
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FF035C07035C07035C07035C07FF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF025C04FFFFFF058E0D058F0D058F0D035C07FF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF025C04FFFFFF058E0D058F
        0D058F0D035C07FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF025C04
        FFFFFF058E0D058F0D058F0D035C07FF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FF025C05FFFFFF058E0D058F0D058F0D035C07FF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF035D05FFFFFF06900F058F0D058F0D035C07FF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF035D05FFFFFF0A96160792
        11079211035C07FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF035C07035C07035C07035C07035C07035C07035D05
        FFFFFF0E9D1D0B98170B9817035D05035C07035C07035C07035C07035C07035C
        07FF00FFFF00FFFF00FFFF00FFFF00FF035C07FFFFFF38D36433CC5A2DC75229
        C14B25BD4420B63B16A72B13A1240F9D1E0C97180D9C1B0A9716079211058F0D
        058F0D058F0D058F0D035C07FF00FFFF00FFFF00FFFF00FF035C07FFFFFF38D3
        6433CC5A2DC75229C14B25BD4420B63B1CAC3318A72C14A326109E200D9C1B0A
        9716079211058F0D058F0D058F0D058F0D035C07FF00FFFF00FFFF00FFFF00FF
        035C07FFFFFF3CD76B37CF6233CA5A2DC5522AC04B25BA4321B53C1CAF3518AA
        2F15A42811A0220F9C1D0C9718089212068E0E058C0D058E0D035C07FF00FFFF
        00FFFF00FFFF00FF035C07FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF22B53E1EB0371AAC31FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF035C07FF00FFFF00FFFF00FFFF00FFFF00FF035C07035C07035C07035C0703
        5C07035C07035D05FFFFFF28BD4824BA4124BA41035D05035C07035C07035C07
        035C07035C07035C07FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF035C07FFFFFF2DC6532AC24D2AC24D035C07FF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF035C07FFFFFF34CC5C30C9
        5630C956035C07FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF035C07
        FFFFFF3AD36736D06036D060035C07FF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FF035C07FFFFFF3FD96F3DD86B43E177035C07FF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF035C07FFFFFF40DA7041DD7343E177035C07FF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF035C07FFFFFFFFFFFFFFFF
        FFFFFFFF035C07FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        035C07035C07035C07035C07FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      Layout = blGlyphTop
    end
    object bbtGravarRegistro: TBitBtn
      Left = 3
      Top = 55
      Width = 53
      Height = 53
      Caption = 'Salvar'
      TabOrder = 1
      OnClick = bbtGravarRegistroClick
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FF004B00004B00004B00004B008E7B738E7B738E7B738E7B73
        8E7B738E7B738E7B738E7B738E7B738E7B738E7B73004B00004B00004B00004B
        00FF00FFFF00FFFF00FFFF00FF004B000081000081000081000081005B5B3DE2
        D9D9C9BDBDC4AFADE2CFCCF3EBE7F3EDEAE5DEDEDAE0DEDAE0DE577733285203
        285E05008100008100004B00FF00FFFF00FFFF00FF004B000081000081000081
        00008100356316E2D9D9004B00004B00038103F4E7E3FFFFFCFAF6F2EFF6F3EF
        F6F3577733294E03285E05008100008100004B00FF00FFFF00FFFF00FF004B00
        008100008100008100008100386219E2D9D9004B00004B00038103E3D5D3FAF8
        F4FEF8F4FCFFFBFCFFFF577733294E03285E05008100008100004B00FF00FFFF
        00FFFF00FF004B00008100008100008100008100376318E2D9D9004B00004B00
        038103CFC0BFEBEAE7FAF4F2FFFFFFFCFFFF577733294E03285E050081000081
        00004B00FF00FFFF00FFFF00FF004B00008100008100008100008100376619E2
        D9D9004B00004B00038103B0A09FD4D4D1EEE7E3FFFFFFFCFFFF5777332A4B03
        285F04008100008100004B00FF00FFFF00FFFF00FF004B000081000081000081
        0000810039681AE2D9D9004B00004B000381038C8382A7AFADD3D4D0FCFFFFFC
        FFFF5777332A4403285C04008100008100004B00FF00FFFF00FFFF00FF004B00
        008100008100008100008100357313E2D9D9E2D9D9E2D9D9E2D9D9E2D9D9E2D9
        D9E2D9D9E2D9D9E2D9D9577733295E03286906008100008100004B00FF00FFFF
        00FFFF00FF004B00008100008100008100008100008100008100008100008100
        0081000081000081000081000081000081000081000081000081000081000081
        00004B00FF00FFFF00FFFF00FF004B0000810000810000810000810000810000
        8100008100008100008100008100008100008100008100008100008100008100
        008100008100008100004B00FF00FFFF00FFFF00FF004B000081000081009DC2
        9D9DC29D9DC29D9DC29D9DC29D9DC29D9DC29D9DC29D9DC29D9DC29D9DC29D9D
        C29D9DC29D9DC29D9DC29D008100008100004B00FF00FFFF00FFFF00FF004B00
        0081000081009DC29DFEFCFCFEFCFCFFFEFEFFFEFEFFFEFEFFFEFEFFFEFEFFFE
        FEFFFEFEFFFEFEFFFEFEFEFCFCFCFBFB9DC29D008100008100004B00FF00FFFF
        00FFFF00FF004B000081000081009DC29DFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
        FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE9DC29D0081000081
        00004B00FF00FFFF00FFFF00FF004B000081000081009DC29DFEFEFEFEFEFEBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFFEFEFEFEFEFE
        9DC29D008100008100004B00FF00FFFF00FFFF00FF004B000081000081009DC2
        9DFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
        FEFEFEFEFEFEFEFE9DC29D008100008100004B00FF00FFFF00FFFF00FF004B00
        0081000081009DC29DFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
        FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE9DC29D008100008100004B00FF00FFFF
        00FFFF00FF004B000081000081009DC29DFEFEFEFEFEFEBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFFEFEFEFEFEFE9DC29D0081000081
        00004B00FF00FFFF00FFFF00FF004B000081000081009DC29DFEFEFEFEFEFEFE
        FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
        9DC29D008100008100004B00FF00FFFF00FFFF00FF004B000081000081009DC2
        9DFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
        FEFEFEFEFEFEFEFE9DC29D008100008100004B00FF00FFFF00FFFF00FF004B00
        0081000081009DC29DFEFEFEFEFEFEBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFFEFEFEFEFEFE9DC29D008100008100004B00FF00FFFF
        00FFFF00FF004B000081000081009DC29DFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
        FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE9DC29D0081000081
        00004B00FF00FFFF00FFFF00FFFF00FF004B00004B009DC29DFEFEFEFEFEFEFE
        FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
        9DC29D004B00004B00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      Layout = blGlyphTop
    end
    object bbtEditarRegistro: TBitBtn
      Left = 3
      Top = 107
      Width = 53
      Height = 53
      Caption = 'Editar'
      TabOrder = 2
      OnClick = bbtEditarRegistroClick
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FF93655EA46769A46769A46769A46769A46769A46769A46769A46769A46769
        A46769A46769A46769A46769A46769A46769A46769A46769A46769FF00FFFF00
        FFFF00FFFF00FFFF00FF93655FEED4B8F4DABBF2D5B1EDCEA7E6C79DE1C093DE
        BB8CE1BB88E5BC84E7BC81E7BC7EE9BD7FE9BD7FE9BD7FE9BD7FEABF7FE7BC7E
        9F6F60FF00FFFF00FFFF00FFFF00FFFF00FF93655FEED7C0F4DEC0F0D8B7E9CC
        ABD9BD99C9AD89C1A57FC6A67ED1AF7FDAB47FE1B77DE3BA7DE7BC7EE9BD7FE9
        BD7FEABF7FE7BC7E9F6F60FF00FFFF00FFFF00FFFF00FFFF00FF93655FEFDAC5
        F6E1C6F0D9BCE6CEAF2221233E39358C79609D8767AA8F6BB89A6FC7A474D1AB
        75DEB579E5BB7DE7BC7EEABF7FE7BC7E9F6F60FF00FFFF00FFFF00FFFF00FFFF
        00FF936560F0DECCF7E5CEF4DEC5EAD4B63C38351F1F21182A33344344836F56
        8E77599E835FB29268C7A36FD9B176E3BA7DE7BC7EE7BC7E9F6F60FF00FFFF00
        FFFF00FFFF00FFFF00FF956660F2E2D3FAEAD7F6E3CEF0DAC2AC9D8A113B4E04
        689A064F750C3C523A494877644C897253A4865FBC9969D1AB73E1B779E3BA7B
        9F6F60FF00FFFF00FFFF00FFFF00FFFF00FF986963F2E6DAFAEEDEF7E7D4F4E1
        CAEBD8BD1A3E4D036A9D0567981B506E2A34404135386A55427E694C987D58B2
        9163CCA66EDAB1779D6D5FFF00FFFF00FFFF00FFFF00FFFF00FF9E6E64F4EAE1
        FBF2E6F8EADCF7E6D3F3E0CA748686045983315065956060AA6E6E965D5D643B
        3A6552407663478E7451A9895DC09C6996695AFF00FFFF00FFFF00FFFF00FFFF
        00FFA37266F6EEE9FCF6EDF8EFE3F7EADAF7E6D3F0DDC90B41598C5B5BCC8E8E
        BB7E7EAA6E6E965C5C643B3A64513E6F5D43826C4B9A7E55865D51FF00FFFF00
        FFFF00FFFF00FFFF00FFA77568F8F3F0FEFBF6FBF3EBF8EEE3F8EBDCF6E6D14E
        6C769C6969DD9D9DCB8C8CBA7D7DA96D6D9159595A353462503D6A58417B6648
        735046FF00FFFF00FFFF00FFFF00FFFF00FFAC7969FAF6F4FFFFFEFEF8F3FBF2
        EAF8EEE3F8EBDAF4E3D07B504FE2A4A4DC9D9DCA8C8CBA7D7DA96D6D8C57575A
        3534604F3D6C594162443CFF00FFFF00FFFF00FFFF00FFFF00FFB17E6BFAF6F4
        FFFFFFFFFEFBFEF7F0FBF3EAFAEFE3F8EADAE1CCBB7B504FE2A3A3DC9C9CCA8B
        8BB87B7BA76C6C8C56565A353566523F583F37FF00FFFF00FFFF00FFFF00FFFF
        00FFB6816CFAF6F4FFFFFFFFFFFFFFFCFBFEF7F2FBF3EBF8EEE3F8EBDCE1CCBB
        734847E1A3A3DA9C9CC98B8BB87B7BA76C6C8B56565D3836533C35FF00FFFF00
        FFFF00FFFF00FFFF00FFBB846EFAF6F4FFFFFFFFFFFFFFFFFFFFFEFBFEF7F2FB
        F3EAFAEEE3F8EADABBA196734847E1A1A1DA9A9AC98A8AB77A7AA66B6B8B5555
        5A3535FF00FFFF00FFFF00FFFF00FFFF00FFC0896FFBF7F4FFFFFFFFFFFFFFFF
        FFFFFFFFFFFEFBFEF7F2FBF2EAFAEEE2F8EBDABBA196734847E0A1A1D99A9AC7
        8A8AB77A7AA66B6B8A55555B3535FF00FFFF00FFFF00FFFF00FFC58C70FBF7F4
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFBFCF8F2FBF3EAF8EEE2F8EAD9BCA1
        96916060EBAAAAD99999C78989B67979804E4E414855354756FF00FFFF00FFFF
        00FFCB9173FBF7F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFBFCF7F0
        FBF2E9FBF2E5E9D3C484544C916060EAAAAAD89999534E57028AC400AAEA00A6
        E60087C4FF00FFFF00FFCF9674FBF7F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFCFAFCF7F0FFFAEFDAC0B69F675BAA7856906060C28989097BAB
        00BDFF00BDFF00A6E6001C9D000082FF00FFD49875FCF8F6FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFBFFFEF7DDC4BC9F675BEAB474B7
        7D46734747009FDE00BDFF008CD1001C9D010D9D010A97000082D49875FCF8F6
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDDC7
        C29F675BEAB273EFA7517A494A0093D100B1F2012BA70725DC0420B8021DB101
        0A97D49875FFFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFE2D0CE9F675BEDB572A5686BFF00FFFF00FF0084C10C21BF2D4F
        F60F2ECC031EB100058FCF8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF
        8E68CF8E68CF8E68CF8E68CF8E68CF8E689F675BA5686BFF00FFFF00FFFF00FF
        FF00FF1624BF5270FC1839E3010997FF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FF1322BD050DA5FF00FFFF00FF}
      Layout = blGlyphTop
    end
    object bbtExcluirRegistro: TBitBtn
      Left = 3
      Top = 159
      Width = 53
      Height = 53
      Caption = 'Excluir'
      TabOrder = 3
      OnClick = bbtExcluirRegistroClick
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FF0005B70005B7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF0005B70005B70005B7FF00FFFF00FFFF00FF0005B70005B70005
        B7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF0005B70005B70005B7FF00FFFF00FFFF00FFFF00FF
        0005B70005B70005B70005B7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF0005B70005B70005B70005B7FF00FFFF00FFFF
        00FFFF00FFFF00FF0005B70005B70005B70005B70005B7FF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0005B70005B70005B70005B7FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0005B70005B70005B70005B700
        05B7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0005B70005B70005B7
        0005B7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0006
        F60005B70005B70005B70005B7FF00FFFF00FFFF00FFFF00FFFF00FF0005B700
        05B70005B70005B7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF0005B70005B70005B70005B7FF00FFFF00FF0005
        B70005B70005B70005B70005B7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0005B70005B70005B7
        0005B70005B70005B70005B70005B70005B7FF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FF0005B70005B70006F60005B70006F60005B70005B7FF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF0005B70005B70005B70006F60005B7FF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0005B70005B70006F60005B70005
        B70006F60006F6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0005B70005B70006F6
        0005B70006F60006F60006F60005B70006F6FF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0006F600
        06F60006F60005B70006F6FF00FFFF00FF0006F60006F60006F60006F6FF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FF0006F60006F60005B70006F60006F6FF00FFFF00FFFF00FFFF00FF0006F600
        06F60006F60006F6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF0006F60006F60006F60006F60006F6FF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FF0006F60006F60006F6FF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF0006F60006F60006F60006F60006F6FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0006F60006F60006F6FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF0006F60006F60006F60006F60006F6FF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF0006F6FF00FFFF00FFFF00FFFF00FFFF00FF0006F60006F60006F60006
        F60006F6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0006F6
        0006F60006F60006F6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FF0006F60006F60006F6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      Layout = blGlyphTop
    end
    object bbtPesquisar: TBitBtn
      Left = 3
      Top = 240
      Width = 53
      Height = 53
      Caption = 'Pesquisar'
      TabOrder = 4
      OnClick = bbtPesquisarClick
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FF969190736E6EAF7D7EFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF9792916C6C70174B82326089AF7B7BFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8386863A79B11A81FF0D62
        BC3B5F7FB07D7DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF2698FF
        3DB0FF349DFF1C7EF80C62BA395E7FB07B7DFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FF2996FF42ADFE349AFF1C7EF80C60B8405F7FB17D7BFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF2A96FE41AFFE349AFF1C7EF80C
        5FB83E5F7EB07B7BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF2A97
        FE41AFFE349AFF1A7BF80B5FB744627FA97A7EFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF2C98FE41ADFE349CFF197BF60C5EB62B587FFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF2D99FE41ADFE339CFF287FE7
        3D607BFF00FFFF00FFFF00FF996964996964996964996964996964FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF2D
        9AFE4BB5FF8CBDEDAC9F966C565593665F996964DDCCABFFFFD9FFFFD9FFFFD7
        E9D5B6996964996964FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFD1ADA5B68775CCAB8CFFFFD3FFFFD3FF
        FFD0FFFFCFFFFFD0FFFFD3FFFFE2D4BAA4996964FF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF996B65D4AF8FFFEF
        B0FBEDB8FFFFCFFFFFCEFFFFCFFFFFD7FFFFDCFFFFEAFFFFFFD3BBB8996964FF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        996964FFEAA6F2C78FFAEBB6FFFFD0FFFFCFFFFFD3FFFFE5FFFFF2FFFFFAFFFF
        FCFFFFFE996964FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FF996964E6C9A0F6CA8BEEBA7FFBE7B4FFFFD0FFFFCFFFFFD7FFFFEB
        FFFFFEFFFFFCFFFFF2FFFFE5D8C6A5996964FF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF996964FFEFADF0BC7DEBB075F7DDA7FEFCCBFF
        FFD1FFFFD5FFFFE6FFFFF6FFFFF6FFFFE6FFFFD7FFFFDA996964FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF996964FFF0AFEFBA7BE9A5
        6AF2C98FFCEFBCFFFFD1FFFFD3FFFFD9FFFFE1FFFFE2FFFFD9FFFFD3FFFFDA99
        6964FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF996964
        FFF2B2F3C484E99E63EDB57AF4D79FFCF4C2FFFFD1FFFFD3FFFFD3FFFFD3FFFF
        D0FFFFCFFFFFD8996964FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FF996964E6C9A0FCDE9EEFBA7EEEB779EFC284F6DAA1FBF2BFFFFFCF
        FFFFD1FFFFD0FFFFD0FFFFD1D9C6A5996964FF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF996964FFFEC2FBEBCAF6D7ACF0C186EF
        BF82F3CC95FAE3ADFCF0BCFBF4C1FEF6C4FFFFD4996964FF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF996964D7BB9EFFFF
        FFFEF7EEF6D8ACEDB474E9A76BEDB478F0C48AF6D49CFFF4B6D3B799996964FF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF996964CEB6AFFFFFFFFFF4CBF6CF90F0BC7DF2BF81F7CE90FFEDA9D4B1
        93996964FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FF996964996964E1C9A0FFF7B5FFF2AFFFF2B1
        E9CCA4996964996964FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF99696499
        6964996964996964996964FF00FFFF00FFFF00FFFF00FFFF00FF}
      Layout = blGlyphTop
    end
    object bbtFechar: TBitBtn
      Left = 3
      Top = 327
      Width = 53
      Height = 53
      Caption = 'Fechar'
      TabOrder = 5
      OnClick = bbtFecharClick
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF824B4B4E1E
        1FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF824B4B824B4B
        8C4B4B914B4B4E1E1FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF824B4B824B4B89
        4B4B9C4B4CB64B4CBD4B4C9F4B4C4E1E1FFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF824B4B824B
        4B9A4D4EAF4E4FC14E4FC04D4EBF4C4DBF4C4D9F4B4C4E1E1F994B4B824B4B82
        4B4B824B4B824B4B824B4B824B4B824B4B824B4BFF00FFFF00FFFF00FFFF00FF
        FF00FF824B4BC55455C95455C75354C65253C55152C45051C24F50A04C4D4E1E
        1FFE8B8CFC9293FB9A9CFAA3A4F8AAABF7B1B1F7B5B6F7B5B6824B4BFF00FFFF
        00FFFF00FFFF00FFFF00FF824B4BCE5859CC5758CB5657CA5556C95455C75354
        C65253A34E4F4E1E1F3F9E4C1EBC4C1EBC4C1EBC4C1EBC4C1EBC4C1EBC4CF7B5
        B6824B4BFF00FFFF00FFFF00FFFF00FFFF00FF824B4BD15B5CD05A5BCF595ACE
        5859CC5758CB5657CA5556A550504E1E1F3F9E4C1EBC4C1EBC4C1EBC4C1EBC4C
        1EBC4C1EBC4CF7B5B6824B4BFF00FFFF00FFFF00FFFF00FFFF00FF824B4BD55E
        5FD55E5FD45D5ED35C5DD15B5CD05A5BCF595AA651524E1E1F3F9E4C1EBC4C1E
        BC4C1EBC4C1EBC4C1EBC4C1EBC4CF7B5B6824B4BFF00FFFF00FFFF00FFFF00FF
        FF00FF824B4BDA6364D96263D86062D75F60D55E5FD45D5ED35C5DA953544E1E
        1F3F9E4C1EBC4C1EBC4C1EBC4C1EBC4C1EBC4C1EBC4CF7B5B6824B4BFF00FFFF
        00FFFF00FFFF00FFFF00FF824B4BDE6667DD6566DC6465DA6364D96263D86062
        D75F60AB55554E1E1F3F9E4C1EBC4C1EBC4C1EBC4C1EBC4C1EBC4C1EBC4CF7B5
        B6824B4BFF00FFFF00FFFF00FFFF00FFFF00FF824B4BE2696AE16869E06768DE
        6667E06D6EE69091DC6465AC56574E1E1F58A55B1EBC4C1EBC4C1EBC4C1EBC4C
        1EBC4C1EBC4CF7B5B6824B4BFF00FFFF00FFFF00FFFF00FFFF00FF824B4BE76D
        6EE66C6DE56B6CE36A6BEEA6A7FFFFFFEB9C9CAF58594E1E1FEECEAFB7EBAA5E
        D3775ED37745CA6745CA6745CA67F7B5B6824B4BFF00FFFF00FFFF00FFFF00FF
        FF00FF824B4BEB7072EA6F70E96E6FE76D6EF2A9AAFFFFFFEB9596B15A5A4E1E
        1FEECEAFFFFFD3FFFFD3FFFFD3FFFFD3D9F6BDD9F6BDF7B5B6824B4BFF00FFFF
        00FFFF00FFFF00FFFF00FF824B4BEF7475EE7374ED7273EB7072EA6F70EF9091
        E76D6EB25B5C4E1E1FEECEAFFFFFD3FFFFD3FFFFD3FFFFD3FFFFD3FFFFD3F7B5
        B6824B4BFF00FFFF00FFFF00FFFF00FFFF00FF824B4BF37778F37778F27677F0
        7576EF7475EE7374ED7273B55D5D4E1E1FEECEAFFFFFD3FFFFD3FFFFD3FFFFD3
        FFFFD3FFFFD3F7B5B6824B4BFF00FFFF00FFFF00FFFF00FFFF00FF824B4BF87B
        7DF77A7BF6797AF47879F37778F27677F07576B75F5F4E1E1FEECEAFFFFFD3FF
        FFD3FFFFD3FFFFD3FFFFD3FFFFD3F7B5B6824B4BFF00FFFF00FFFF00FFFF00FF
        FF00FF824B4BFC7F80FB7E7FFA7D7EF87B7DF77A7BF6797AF47879B860624E1E
        1FEECEAFFFFFD3FFFFD3FFFFD3FFFFD3FFFFD3FFFFD3F7B5B6824B4BFF00FFFF
        00FFFF00FFFF00FFFF00FF824B4BFF8182FF8182FE8081FC7F80FC7F80FB7E7F
        FA7D7EBB63634E1E1FEECEAFFFFFD3FFFFD3FFFFD3FFFFD3FFFFD3FFFFD3F7B5
        B6824B4BFF00FFFF00FFFF00FFFF00FFFF00FF824B4BFF8182FF8182FF8182FF
        8182FF8182FE8081FE8081BD65654E1E1FEECEAFFFFFD3FFFFD3FFFFD3FFFFD3
        FFFFD3FFFFD3F7B5B6824B4BFF00FFFF00FFFF00FFFF00FFFF00FF824B4BF77E
        7FFF8182FF8182FF8182FF8182FF8182FF8182BF66664E1E1FEECEAFFFFFD3FF
        FFD3FFFFD3FFFFD3FFFFD3FFFFD3F7B5B6824B4BFF00FFFF00FFFF00FFFF00FF
        FF00FF824B4B824B4BAF5E5FD56F70FF8182FF8182FF8182FF8182BF66664E1E
        1FEECEAFFFFFD3FFFFD3FFFFD3FFFFD3FFFFD3FFFFD3F7B5B6824B4BFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FF824B4B824B4B915152B66263EE7A7B
        FF8182BF66664E1E1F914B4B824B4B824B4B824B4B824B4B824B4B824B4B824B
        4B824B4BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FF824B4B824B4B9855559F58584E1E1FFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF824B4B4E1E1FFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      Layout = blGlyphTop
    end
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 415
    Width = 705
    Height = 19
    Panels = <>
  end
  object pnlResultSet: TPanel
    Left = 59
    Top = 0
    Width = 646
    Height = 415
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 2
    object pnlResultSetBotoes: TPanel
      Left = 2
      Top = 372
      Width = 642
      Height = 41
      Align = alBottom
      BevelInner = bvLowered
      TabOrder = 0
      object bbtSelecionaRegistro: TBitBtn
        Left = 262
        Top = 8
        Width = 97
        Height = 25
        Caption = 'Selecionar...'
        TabOrder = 0
        OnClick = bbtSelecionaRegistroClick
      end
      object bbtVoltarPesquisa: TBitBtn
        Left = 480
        Top = 8
        Width = 125
        Height = 25
        Caption = 'Volta para pesquisa...'
        TabOrder = 1
        OnClick = bbtVoltarPesquisaClick
      end
    end
    object dbGrid: TDBGrid
      Left = 2
      Top = 2
      Width = 642
      Height = 370
      Align = alClient
      Options = [dgTitles, dgIndicator, dgColLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 1
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  object pnlPesquisa: TPanel
    Left = 59
    Top = 0
    Width = 646
    Height = 415
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 1
    object pnlPesquisaBotoes: TPanel
      Left = 2
      Top = 372
      Width = 642
      Height = 41
      Align = alBottom
      BevelInner = bvLowered
      TabOrder = 0
      object bbtPesquisarRegistro: TBitBtn
        Left = 262
        Top = 8
        Width = 97
        Height = 25
        Caption = 'Pesquisar...'
        TabOrder = 0
        OnClick = bbtPesquisarRegistroClick
      end
      object bbtVoltarCadastro: TBitBtn
        Left = 480
        Top = 8
        Width = 125
        Height = 25
        Caption = 'Volta para cadastro...'
        TabOrder = 1
        OnClick = bbtVoltarCadastroClick
      end
    end
  end
  object pnlCampos: TPanel
    Left = 59
    Top = 0
    Width = 646
    Height = 415
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 3
  end
  object MenuPrincipal: TMainMenu
    Left = 98
    Top = 8
    object Arquivo1: TMenuItem
      Caption = '&Arquivo'
      object Fechar1: TMenuItem
        Caption = '&Fechar'
      end
    end
    object Funes1: TMenuItem
      Caption = '&Fun'#231#245'es'
      object NovoRegistro: TMenuItem
        Caption = '&Novo registro'
      end
      object GravarRegistro: TMenuItem
        Caption = '&Gravar registro'
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object EditarRegistro: TMenuItem
        Caption = '&Editar registro'
      end
      object ExcluirRegistro: TMenuItem
        Caption = '&Excluir registro'
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object Pesquisar: TMenuItem
        Caption = '&Pesquisar'
      end
    end
    object N3: TMenuItem
      Caption = '?'
      object SobreoSistema1: TMenuItem
        Caption = 'Sobre o Sistema'
      end
    end
  end
  object ImageList: TImageList
    Left = 128
    Top = 8
  end
  object dsCadBasico: TDataSource
    DataSet = cdsCadBasico
    Left = 632
    Top = 8
  end
  object cdsCadBasico: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCadBasico'
    RemoteServer = dmPrinc.ConAdmi
    Left = 664
    Top = 8
  end
end