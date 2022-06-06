object frmBackup: TfrmBackup
  Left = 300
  Top = 288
  Width = 367
  Height = 232
  Caption = 'Guardian - Backup/Restore'
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
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 359
    Height = 205
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Backup'
      object Label1: TLabel
        Left = 10
        Top = 10
        Width = 188
        Height = 13
        Caption = 'Digite o caminho para efetuar o Backup'
      end
      object Label2: TLabel
        Left = 10
        Top = 56
        Width = 196
        Height = 28
        Caption = 'Ex. \\Server2\jogos98\backup'#13#10'    c:\backup'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHighlight
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
      end
      object btnBackup: TFlatSpeedButton
        Left = 230
        Top = 75
        Width = 109
        Height = 81
        Caption = 'Backup'
        Glyph.Data = {
          76020000424D7602000000000000760000002800000020000000200000000100
          0400000000000002000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7777777777777777777774888888888888888888888888884847748888888888
          8888888888888888484774888888888888888888888888884847748888888888
          8888888888888888404774888888888888888888888888884047748888888888
          8888888888888888404774888888888888888888888888884047748888888888
          888888888888888440477488888888844444444444444444C047748888888884
          CCF7CCCF7777CCCCC047744888888844CCF777777777CCCCC04777444444444C
          CCCFFFFFFFFCCCCCC04777777488880CCCCCCCCCCCCCCCCCC07777777488880C
          CCCCCCCCCCCCCCCCC07777777744400CCCCCCCCCCCCCCCCCC07777777777770C
          CC000000000000CCC07777777777770CCC0FFFFFFFFFF0CCC07777771777770C
          CC0F88888888F0CCC07777119117770CCC0FFFFFFFFFF0CCC07771999991770C
          CC0F88888888F0CCC07719999999170C0C0FFFFFFFFFF0CCC07711199911170C
          0C0F88888888F0CCC07777199917770CCC0FFFFFFFFFF0CCC077771999177700
          0000000000000000007777199917777777777777777777777777771999177777
          7777777777777777777777111117777777777777777777777777777777777777
          7777777777777777777777777777777777777777777777777777777777777777
          7777777777777777777777777777777777777777777777777777}
        OnClick = btnBackupClick
      end
      object edtPatch: TEdit
        Left = 10
        Top = 27
        Width = 331
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Restore'
      ImageIndex = 1
      object Label3: TLabel
        Left = 10
        Top = 10
        Width = 187
        Height = 13
        Caption = 'Digite o caminho do arquivo de Backup'
      end
      object Label4: TLabel
        Left = 10
        Top = 56
        Width = 196
        Height = 28
        Caption = 'Ex. \\Server2\jogos98\backup'#13#10'    c:\backup'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHighlight
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
      end
      object btnRestaura: TFlatSpeedButton
        Left = 230
        Top = 75
        Width = 109
        Height = 81
        Caption = 'Restaurar'
        Glyph.Data = {
          76020000424D7602000000000000760000002800000020000000200000000100
          0400000000000002000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7777777777777777777774888888888888888888888888884847748888888888
          8888888888888888484774888888888888888888888888884847748888888888
          8888888888888888404774888888888888888888888888884047748888888888
          8888888888888888404774888888888888888888888888884047748888888888
          888888888888888440477488888888844444444444444444C047748888888884
          CCF7CCCF7777CCCCC047744888888844CCF777777777CCCCC04777444444444C
          CCCFFFFFFFFCCCCCC04777777488880CCCCCCCCCCCCCCCCCC07777777488880C
          CCCCCCCCCCCCCCCCC07777777744400CCCCCCCCCCCCCCCCCC07777777777770C
          CC000000000000CCC07777777777770CCC0FFFFFFFFFF0CCC07777777777770C
          CC0F88888888F0CCC07777777777770CCC0FFFFFFFFFF0CCC07777777777770C
          CC0F88888888F0CCC07777711111770C0C0FFFFFFFFFF0CCC07777719991770C
          0C0F88888888F0CCC07777719991770CCC0FFFFFFFFFF0CCC077777199917700
          0000000000000000007777719991777777777777777777777777111199911117
          7777777777777777777771999999917777777777777777777777771999991777
          7777777777777777777777711911777777777777777777777777777771777777
          7777777777777777777777777777777777777777777777777777}
        OnClick = btnRestauraClick
      end
      object edtRestore: TEdit
        Left = 10
        Top = 27
        Width = 331
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object stBar: TStatusBar
        Left = 0
        Top = 158
        Width = 351
        Height = 19
        Panels = <>
        SimplePanel = True
      end
    end
  end
  object IbMan: TIbManager
    Username = 'SYSDBA'
    Password = 'devkey'
    Left = 82
    Top = 140
  end
end
