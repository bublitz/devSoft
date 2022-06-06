object rptAnaResumo: TrptAnaResumo
  Left = 189
  Top = 108
  Width = 603
  Height = 448
  VertScrollBar.Position = 39
  Caption = 'rptAnaResumo'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  object QuickRep1: TQuickRep
    Left = 6
    Top = 1
    Width = 794
    Height = 1123
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    DataSet = sqlReport
    Description.Strings = (
      'Relat'#243'rio Anal'#237'tico - Resumo Mensal')
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    Functions.Strings = (
      'PAGENUMBER'
      'COLUMNNUMBER'
      'REPORTTITLE')
    Functions.DATA = (
      '0'
      '0'
      #39#39)
    Options = [FirstPageHeader, LastPageFooter]
    Page.Columns = 1
    Page.Orientation = poPortrait
    Page.PaperSize = A4
    Page.Values = (
      300
      2970
      50
      2100
      100
      100
      0)
    PrinterSettings.Copies = 1
    PrinterSettings.Duplex = False
    PrinterSettings.FirstPage = 0
    PrinterSettings.LastPage = 0
    PrinterSettings.OutputBin = Auto
    PrintIfEmpty = False
    ReportTitle = 'Relat'#243'rio Anal'#237'tico - Resumo Mensal'
    SnapToGrid = True
    Units = MM
    Zoom = 100
    object PageHeaderBand1: TQRBand
      Left = 38
      Top = 19
      Width = 718
      Height = 64
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = True
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        169.333333333333
        1899.70833333333)
      BandType = rbPageHeader
      object qrLabRegional: TQRLabel
        Left = 302
        Top = 5
        Width = 114
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.9166666666667
          799.041666666667
          13.2291666666667
          301.625)
        Alignment = taCenter
        AlignToBand = True
        AutoSize = True
        AutoStretch = False
        Caption = 'qrLabRegional'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object qrLabSecao: TQRLabel
        Left = 324
        Top = 28
        Width = 70
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          857.25
          74.0833333333333
          185.208333333333)
        Alignment = taCenter
        AlignToBand = True
        AutoSize = True
        AutoStretch = False
        Caption = 'qrLabSecao'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel12: TQRLabel
        Left = 612
        Top = 42
        Width = 45
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1619.25
          111.125
          119.0625)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'P'#225'gina:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRSysData2: TQRSysData
        Left = 662
        Top = 42
        Width = 46
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1751.54166666667
          111.125
          121.708333333333)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        Color = clWhite
        Data = qrsPageNumber
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        FontSize = 10
      end
      object QRLabel11: TQRLabel
        Left = 0
        Top = 45
        Width = 279
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          0
          119.0625
          738.1875)
        Alignment = taLeftJustify
        AlignToBand = True
        AutoSize = True
        AutoStretch = False
        Caption = 'ConVel - Controle de Ve'#237'culos Oficiais - vs. 1.01'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object TitleBand1: TQRBand
      Left = 38
      Top = 83
      Width = 718
      Height = 34
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = True
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        89.9583333333333
        1899.70833333333)
      BandType = rbTitle
      object QRLabel3: TQRLabel
        Left = 218
        Top = 0
        Width = 281
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          576.791666666667
          0
          743.479166666667)
        Alignment = taCenter
        AlignToBand = True
        AutoSize = True
        AutoStretch = False
        Caption = 'Relat'#243'rio Anal'#237'tico - Resumo Mensal'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrLabPeriodo: TQRLabel
        Left = 310
        Top = 15
        Width = 97
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          820.208333333333
          39.6875
          256.645833333333)
        Alignment = taCenter
        AlignToBand = True
        AutoSize = True
        AutoStretch = False
        Caption = 'qrLabPeriodo'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object DetailBand1: TQRBand
      Left = 38
      Top = 117
      Width = 718
      Height = 142
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = True
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        375.708333333333
        1899.70833333333)
      BandType = rbDetail
      object QRShape3: TQRShape
        Left = 419
        Top = 49
        Width = 194
        Height = 49
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          129.645833333333
          1108.60416666667
          129.645833333333
          513.291666666667)
        Shape = qrsRectangle
      end
      object QRShape2: TQRShape
        Left = 202
        Top = 49
        Width = 209
        Height = 88
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          231.510416666667
          535.78125
          128.984375
          552.317708333333)
        Shape = qrsRectangle
      end
      object QRShape1: TQRShape
        Left = 3
        Top = 49
        Width = 193
        Height = 55
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          145.520833333333
          7.9375
          129.645833333333
          510.645833333333)
        Shape = qrsRectangle
      end
      object QRDBText3: TQRDBText
        Left = 94
        Top = 21
        Width = 85
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          46.3020833333333
          248.046875
          56.2239583333333
          224.895833333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = sqlReport
        DataField = 'KMRODADOS'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText1: TQRDBText
        Left = 107
        Top = 61
        Width = 85
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          46.3020833333333
          284.427083333333
          162.057291666667
          224.895833333333)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = sqlReport
        DataField = 'QTDCOMB'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel7: TQRLabel
        Left = 2
        Top = 21
        Width = 89
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          5.29166666666667
          55.5625
          235.479166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'KM Rodados:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel13: TQRLabel
        Left = 6
        Top = 41
        Width = 105
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          15.875
          108.479166666667
          277.8125)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = ' Consumo (l) '
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel5: TQRLabel
        Left = 5
        Top = 61
        Width = 97
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          13.2291666666667
          161.395833333333
          256.645833333333)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Combust'#237'vel:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText2: TQRDBText
        Left = 324
        Top = 61
        Width = 85
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          46.3020833333333
          856.588541666667
          162.057291666667
          224.895833333333)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = sqlReport
        DataField = 'VALABAST'
        Mask = ',#0.00'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel1: TQRLabel
        Left = 206
        Top = 41
        Width = 113
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          545.041666666667
          108.479166666667
          298.979166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = ' Valores (R$) '
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel2: TQRLabel
        Left = 203
        Top = 61
        Width = 113
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          537.104166666667
          161.395833333333
          298.979166666667)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Abastecimento:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText4: TQRDBText
        Left = 324
        Top = 77
        Width = 85
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          46.3020833333333
          856.588541666667
          205.052083333333
          224.895833333333)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = sqlReport
        DataField = 'VALMANUT'
        Mask = ',#0.00'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel6: TQRLabel
        Left = 203
        Top = 77
        Width = 113
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          537.104166666667
          203.729166666667
          298.979166666667)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Manut/Conserv:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel8: TQRLabel
        Left = 259
        Top = 93
        Width = 57
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          685.270833333333
          246.0625
          150.8125)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Reparo:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText5: TQRDBText
        Left = 324
        Top = 93
        Width = 85
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          857.25
          246.0625
          224.895833333333)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = sqlReport
        DataField = 'VALREPARO'
        Mask = ',#0.00'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel14: TQRLabel
        Left = 268
        Top = 116
        Width = 49
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          709.083333333333
          306.916666666667
          129.645833333333)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Total:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRExpr1: TQRExpr
        Left = 325
        Top = 116
        Width = 84
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          46.3020833333333
          859.895833333333
          307.578125
          221.588541666667)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        Master = QuickRep1
        ResetAfterPrint = True
        Transparent = False
        WordWrap = True
        Expression = 'sqlReport.VALABAST + sqlReport.VALMANUT + sqlReport.VALREPARO'
        Mask = ',#0.00'
        FontSize = 10
      end
      object QRLabel15: TQRLabel
        Left = 422
        Top = 41
        Width = 65
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1116.54166666667
          108.479166666667
          171.979166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = ' M'#233'dias '
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel16: TQRLabel
        Left = 436
        Top = 61
        Width = 81
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1153.58333333333
          161.395833333333
          214.3125)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Km/Litros:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel17: TQRLabel
        Left = 443
        Top = 77
        Width = 73
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1172.10416666667
          203.729166666667
          193.145833333333)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Valor/Km:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel4: TQRLabel
        Left = 2
        Top = 4
        Width = 65
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          5.29166666666667
          10.5833333333333
          171.979166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Ve'#237'culo:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRExpr3: TQRExpr
        Left = 71
        Top = 4
        Width = 353
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          187.854166666667
          10.5833333333333
          933.979166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        WordWrap = True
        Expression = 'sqlReport.DESCRICAO + '#39'  '#39' + sqlReport.PLACA'
        FontSize = 10
      end
      object QRDBText6: TQRDBText
        Left = 526
        Top = 61
        Width = 85
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1391.70833333333
          161.395833333333
          224.895833333333)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = sqlReport
        DataField = 'km_litros'
        Mask = ',#0.00'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText8: TQRDBText
        Left = 526
        Top = 77
        Width = 85
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1391.70833333333
          203.729166666667
          224.895833333333)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = sqlReport
        DataField = 'valor_km'
        Mask = ',#0.00'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText7: TQRDBText
        Left = 107
        Top = 78
        Width = 85
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          283.104166666667
          206.375
          224.895833333333)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = sqlReport
        DataField = 'QtdOleo'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel18: TQRLabel
        Left = 61
        Top = 78
        Width = 41
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          161.395833333333
          206.375
          108.479166666667)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = #211'leo:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object PageFooterBand1: TQRBand
      Left = 38
      Top = 259
      Width = 718
      Height = 22
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        58.2083333333333
        1899.70833333333)
      BandType = rbPageFooter
      object QRLabel9: TQRLabel
        Left = 0
        Top = 2
        Width = 120
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          0
          5.29166666666667
          317.5)
        Alignment = taLeftJustify
        AlignToBand = True
        AutoSize = True
        AutoStretch = False
        Caption = 'Relat'#243'rio emitido em'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRSysData1: TQRSysData
        Left = 129
        Top = 2
        Width = 68
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          341.3125
          5.29166666666667
          179.916666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        Color = clWhite
        Data = qrsDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        FontSize = 10
      end
      object QRLabel10: TQRLabel
        Left = 519
        Top = 2
        Width = 199
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1373.1875
          5.29166666666667
          526.520833333333)
        Alignment = taRightJustify
        AlignToBand = True
        AutoSize = True
        AutoStretch = False
        Caption = 'desenvolvido por Jorge Luis Bublitz'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
  end
  object dsReport: TDataSource
    DataSet = sqlReport
    Left = 57
    Top = 305
  end
  object sqlReport: TSQLClientDataSet
    CommandText = 'select CODIGOVEICULO, DESCRICAO, PLACA'#13#10'from VEICULO'#13#10
    Aggregates = <>
    Options = [poAllowCommandText]
    ObjectView = True
    Params = <>
    OnCalcFields = sqlReportCalcFields
    DBConnection = dmPrinc.SQLCon
    Left = 57
    Top = 335
    object sqlReportCODIGOVEICULO: TIntegerField
      FieldName = 'CODIGOVEICULO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlReportDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 54
    end
    object sqlReportPLACA: TStringField
      FieldName = 'PLACA'
      Size = 12
    end
    object sqlReportKMRODADOS: TIntegerField
      FieldKind = fkLookup
      FieldName = 'KMRODADOS'
      LookupDataSet = sqlKM
      LookupKeyFields = 'CODIGOVEICULO'
      LookupResultField = 'KMRODADOS'
      KeyFields = 'CODIGOVEICULO'
      Lookup = True
    end
    object sqlReportQtdComb: TIntegerField
      FieldKind = fkLookup
      FieldName = 'QtdComb'
      LookupDataSet = sqlAbast
      LookupKeyFields = 'CODIGOVEICULO'
      LookupResultField = 'QTDCOMB'
      KeyFields = 'CODIGOVEICULO'
      Lookup = True
    end
    object sqlReportValAbast: TFloatField
      FieldKind = fkLookup
      FieldName = 'ValAbast'
      LookupDataSet = sqlAbast
      LookupKeyFields = 'CODIGOVEICULO'
      LookupResultField = 'VALABAST'
      KeyFields = 'CODIGOVEICULO'
      Lookup = True
    end
    object sqlReportQtdOleo: TIntegerField
      FieldKind = fkLookup
      FieldName = 'QtdOleo'
      LookupDataSet = sqlOleo
      LookupKeyFields = 'CODIGOVEICULO'
      LookupResultField = 'QTDOLEO'
      KeyFields = 'CODIGOVEICULO'
      Lookup = True
    end
    object sqlReportValManut: TFloatField
      FieldKind = fkLookup
      FieldName = 'ValManut'
      LookupDataSet = sqlManut
      LookupKeyFields = 'CODIGOVEICULO'
      LookupResultField = 'VALMANUT'
      KeyFields = 'CODIGOVEICULO'
      Lookup = True
    end
    object sqlReportValReparo: TFloatField
      FieldKind = fkLookup
      FieldName = 'ValReparo'
      LookupDataSet = sqlReparo
      LookupKeyFields = 'CODIGOVEICULO'
      LookupResultField = 'VALREPARO'
      KeyFields = 'CODIGOVEICULO'
      Lookup = True
    end
    object sqlReportkm_litros: TFloatField
      FieldKind = fkCalculated
      FieldName = 'km_litros'
      Calculated = True
    end
    object sqlReportvalor_km: TFloatField
      FieldKind = fkCalculated
      FieldName = 'valor_km'
      Calculated = True
    end
  end
  object dsKM: TDataSource
    DataSet = sqlKM
    Left = 95
    Top = 305
  end
  object sqlKM: TSQLClientDataSet
    Active = True
    CommandText = 
      'select CODIGOVEICULO, '#13#10'         cast(max(FINAL)-min(INICIO) as ' +
      'integer) as KmRodados'#13#10'from QUILOMETRAGEM'#13#10'where extract(year fr' +
      'om DATA) = :ano'#13#10'   and extract(month from DATA) = :mes'#13#10'group b' +
      'y CODIGOVEICULO'#13#10'order by CODIGOVEICULO'#13#10
    Aggregates = <>
    Options = [poAllowCommandText]
    ObjectView = True
    Params = <
      item
        DataType = ftInteger
        Name = 'ano'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'mes'
        ParamType = ptInput
      end>
    DBConnection = dmPrinc.SQLCon
    Left = 95
    Top = 335
    object sqlKMCODIGOVEICULO: TIntegerField
      FieldName = 'CODIGOVEICULO'
    end
    object sqlKMKMRODADOS: TIntegerField
      FieldName = 'KMRODADOS'
    end
  end
  object dsAbast: TDataSource
    DataSet = sqlAbast
    Left = 128
    Top = 305
  end
  object sqlAbast: TSQLClientDataSet
    Active = True
    CommandText = 
      'select CODIGOVEICULO, '#13#10'       cast(sum(LITROS) as integer) as Q' +
      'tdComb,'#13#10'       cast(sum(LITROS*VALORUNITARIO) as double precisi' +
      'on) as ValAbast'#13#10'from ABASTECIMENTO'#13#10'where extract(year from DAT' +
      'A) = :ano'#13#10'   and extract(month from DATA) = :mes'#13#10'group by CODI' +
      'GOVEICULO'#13#10'order by CODIGOVEICULO'#13#10
    Aggregates = <>
    Options = [poAllowCommandText]
    ObjectView = True
    Params = <
      item
        DataType = ftInteger
        Name = 'ano'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'mes'
        ParamType = ptInput
      end>
    DBConnection = dmPrinc.SQLCon
    Left = 128
    Top = 335
    object sqlAbastCODIGOVEICULO: TIntegerField
      FieldName = 'CODIGOVEICULO'
    end
    object sqlAbastQTDCOMB: TIntegerField
      FieldName = 'QTDCOMB'
    end
    object sqlAbastVALABAST: TFloatField
      FieldName = 'VALABAST'
    end
  end
  object dsManut: TDataSource
    DataSet = sqlManut
    Left = 163
    Top = 305
  end
  object sqlManut: TSQLClientDataSet
    Active = True
    CommandText = 
      'select CODIGOVEICULO, '#13#10'       cast(sum(LITROS) as integer) as Q' +
      'tdOleo,'#13#10'       cast(sum(LITROS*VALOR) as double precision) as V' +
      'alManut'#13#10'from MANUTENCAO'#13#10'where extract(year from DATA) = :ano'#13#10 +
      '   and extract(month from DATA) = :mes'#13#10'group by CODIGOVEICULO'#13#10 +
      'order by CODIGOVEICULO'#13#10
    Aggregates = <>
    Options = [poAllowCommandText]
    ObjectView = True
    Params = <
      item
        DataType = ftInteger
        Name = 'ano'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'mes'
        ParamType = ptInput
      end>
    DBConnection = dmPrinc.SQLCon
    Left = 163
    Top = 335
    object sqlManutCODIGOVEICULO: TIntegerField
      FieldName = 'CODIGOVEICULO'
    end
    object sqlManutQTDOLEO: TIntegerField
      FieldName = 'QTDOLEO'
    end
    object sqlManutVALMANUT: TFloatField
      FieldName = 'VALMANUT'
    end
  end
  object dsReparo: TDataSource
    DataSet = sqlReparo
    Left = 229
    Top = 306
  end
  object sqlReparo: TSQLClientDataSet
    Active = True
    CommandText = 
      'select CODIGOVEICULO, '#13#10'       cast(sum(VALORMAO+VALORMAT) as do' +
      'uble precision) as ValReparo'#13#10'from REPARO'#13#10'where extract(year fr' +
      'om DATA) = :ano'#13#10'   and extract(month from DATA) = :mes'#13#10'group b' +
      'y CODIGOVEICULO'#13#10'order by CODIGOVEICULO'#13#10
    Aggregates = <>
    Options = [poAllowCommandText]
    ObjectView = True
    Params = <
      item
        DataType = ftInteger
        Name = 'ano'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'mes'
        ParamType = ptInput
      end>
    DBConnection = dmPrinc.SQLCon
    Left = 229
    Top = 336
    object sqlReparoCODIGOVEICULO: TIntegerField
      FieldName = 'CODIGOVEICULO'
    end
    object sqlReparoVALREPARO: TFloatField
      FieldName = 'VALREPARO'
    end
  end
  object dsOleo: TDataSource
    DataSet = sqlOleo
    Left = 196
    Top = 306
  end
  object sqlOleo: TSQLClientDataSet
    Active = True
    CommandText = 
      'select m.CODIGOVEICULO, '#13#10'       cast(sum(m.LITROS) as integer) ' +
      'as QtdOleo'#13#10'from MANUTENCAO m,  TIPOMANUT t'#13#10'where extract(year ' +
      'from m.DATA) = :ano'#13#10'   and extract(month from m.DATA) = :mes'#13#10' ' +
      '  and m.CODIGOTIPOMANUT = t.CODIGOTIPOMANUT'#13#10'   and t.OLEOLUBRIF' +
      'ICANTE = '#39'S'#39#13#10'group by m.CODIGOVEICULO'#13#10'order by m.CODIGOVEICULO' +
      #13#10
    Aggregates = <>
    Options = [poAllowCommandText]
    ObjectView = True
    Params = <
      item
        DataType = ftInteger
        Name = 'ano'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'mes'
        ParamType = ptInput
      end>
    DBConnection = dmPrinc.SQLCon
    Left = 196
    Top = 336
    object sqlOleoCODIGOVEICULO: TIntegerField
      FieldName = 'CODIGOVEICULO'
    end
    object sqlOleoQTDOLEO: TIntegerField
      FieldName = 'QTDOLEO'
    end
  end
end
