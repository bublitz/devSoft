object frmEmail: TfrmEmail
  Left = 250
  Top = 150
  Width = 696
  Height = 480
  Caption = 'devAdm - Envia e-mail'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 180
    Width = 688
    Height = 9
    Cursor = crVSplit
    Align = alTop
  end
  object PnConfigura: TPanel
    Left = 0
    Top = 0
    Width = 688
    Height = 180
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 17
      Top = 19
      Width = 30
      Height = 13
      Caption = 'Anexo'
    end
    object Label2: TLabel
      Left = 17
      Top = 51
      Width = 38
      Height = 13
      Caption = 'Assunto'
    end
    object btArquivo: TSpeedButton
      Left = 420
      Top = 14
      Width = 75
      Height = 25
      Caption = 'Anexar'
      Flat = True
      OnClick = btArquivoClick
    end
    object btnEnvia: TSpeedButton
      Left = 446
      Top = 86
      Width = 75
      Height = 25
      Caption = 'Envia'
      Flat = True
    end
    object edTexto: TEdit
      Left = 96
      Top = 16
      Width = 320
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object edAssunto: TEdit
      Left = 96
      Top = 46
      Width = 320
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    object gbConfigura: TGroupBox
      Left = 16
      Top = 80
      Width = 425
      Height = 90
      Caption = 'Configura'#231#227'o Servidor SMTP'
      TabOrder = 2
      object Label3: TLabel
        Left = 16
        Top = 20
        Width = 22
        Height = 13
        Caption = 'Host'
      end
      object Label4: TLabel
        Left = 16
        Top = 44
        Width = 36
        Height = 13
        Caption = 'Usu'#225'rio'
      end
      object Label5: TLabel
        Left = 16
        Top = 69
        Width = 28
        Height = 13
        Caption = 'Conta'
      end
      object Label6: TLabel
        Left = 327
        Top = 20
        Width = 25
        Height = 13
        Caption = 'Porta'
      end
      object Label7: TLabel
        Left = 176
        Top = 44
        Width = 31
        Height = 13
        Caption = 'Senha'
      end
      object edHost: TEdit
        Left = 63
        Top = 16
        Width = 250
        Height = 21
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        Text = 'smtp.bol.com.br'
      end
      object edUsuario: TEdit
        Left = 63
        Top = 40
        Width = 106
        Height = 21
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        Text = 'ig'
      end
      object edSenha: TMaskEdit
        Left = 216
        Top = 40
        Width = 97
        Height = 21
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        PasswordChar = '*'
        TabOrder = 2
        Text = 'ig'
      end
      object edConta: TEdit
        Left = 63
        Top = 65
        Width = 250
        Height = 21
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        Text = 'fernandofernandes@bol.com.br'
      end
      object edPorta: TMaskEdit
        Left = 368
        Top = 16
        Width = 48
        Height = 21
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        Text = '25'
      end
    end
  end
  object Memo1: TMemo
    Left = 0
    Top = 189
    Width = 688
    Height = 264
    Align = alClient
    TabOrder = 1
  end
  object OpenDialog1: TOpenDialog
    Filter = 'txt, doc'
    Left = 546
    Top = 2
  end
  object IdSMTP1: TIdSMTP
    Left = 572
    Top = 2
  end
  object IdAntiFreeze1: TIdAntiFreeze
    Left = 600
    Top = 2
  end
  object PP1: TPageProducer
    Left = 626
    Top = 2
  end
  object IdMessage1: TIdMessage
    BccList = <>
    CCList = <>
    ContentType = 'text/HTML'
    Recipients = <>
    ReplyTo = <>
    Left = 656
    Top = 2
  end
end
