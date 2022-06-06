object frmGrafHoras: TfrmGrafHoras
  Left = 197
  Top = 108
  Width = 788
  Height = 577
  Caption = 'Utilização dos Micros'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Graf: TDBChart
    Left = 147
    Top = 0
    Width = 633
    Height = 550
    BackWall.Brush.Color = clWhite
    BackWall.Color = clWhite
    BottomWall.Color = clGray
    Foot.Text.Strings = (
      'Micros')
    Gradient.EndColor = clWhite
    Gradient.Visible = True
    MarginBottom = 2
    MarginLeft = 2
    MarginRight = 2
    MarginTop = 2
    Title.Color = clWhite
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clBlue
    Title.Font.Height = -16
    Title.Font.Name = 'Arial'
    Title.Font.Style = [fsBold]
    Title.Text.Strings = (
      'Utilização'
      '---------------')
    BackColor = clWhite
    Chart3DPercent = 10
    LeftAxis.AxisValuesFormat = '#,##0.##'
    LeftAxis.ExactDateTime = False
    LeftAxis.LabelsOnAxis = False
    LeftAxis.LabelStyle = talNone
    LeftAxis.RoundFirstLabel = False
    LeftAxis.Title.Caption = 'Horas'
    Legend.TextStyle = ltsPlain
    Legend.Visible = False
    View3DOptions.Elevation = 315
    View3DOptions.Orthogonal = False
    View3DOptions.Perspective = 0
    View3DOptions.Rotation = 360
    Align = alClient
    BevelOuter = bvNone
    BevelWidth = 0
    Color = clWhite
    TabOrder = 0
    Visible = False
    object Series1: TBarSeries
      Active = False
      ColorEachPoint = True
      HorizAxis = aTopAxis
      Marks.ArrowLength = 20
      Marks.Style = smsValue
      Marks.Visible = True
      DataSource = qrGraph
      SeriesColor = clRed
      Title = 'barra'
      ValueFormat = '#,##0.0'
      XLabelsSource = 'DESCRICAO'
      BarBrush.Color = clWhite
      BarPen.Visible = False
      BarWidthPercent = 75
      MultiBar = mbNone
      UseYOrigin = False
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1
      XValues.Order = loAscending
      XValues.ValueSource = 'CODIGOMICRO'
      YValues.DateTime = False
      YValues.Name = 'Bar'
      YValues.Multiplier = 1
      YValues.Order = loNone
      YValues.ValueSource = 'HORAS'
    end
    object Series2: TPieSeries
      Active = False
      HorizAxis = aTopAxis
      Marks.ArrowLength = 20
      Marks.Style = smsValue
      Marks.Visible = True
      DataSource = qrGraph
      SeriesColor = clRed
      Title = 'pizza'
      ValueFormat = '#,##0.0'
      XLabelsSource = 'DESCRICAO'
      OtherSlice.Text = 'Other'
      PieValues.DateTime = False
      PieValues.Name = 'Pie'
      PieValues.Multiplier = 1
      PieValues.Order = loDescending
      PieValues.ValueSource = 'HORAS'
      RotationAngle = 90
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 147
    Height = 550
    Align = alLeft
    TabOrder = 1
    object RxLabel1: TRxLabel
      Left = 16
      Top = 6
      Width = 55
      Height = 13
      Caption = 'Data Inicial'
    end
    object RxLabel2: TRxLabel
      Left = 16
      Top = 57
      Width = 50
      Height = 13
      Caption = 'Data Final'
    end
    object FlatSpeedButton1: TFlatSpeedButton
      Left = 16
      Top = 358
      Width = 121
      Height = 49
      Caption = 'Mostrar Gráfico'
      Glyph.Data = {
        76050000424D7605000000000000360000002800000015000000150000000100
        18000000000040050000CE0E0000C40E00000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000808080808080
        8080808080808080808080808080808080808080808080808080808080808080
        8080808080808080808080808080808080808080808080808000FFFFFF808080
        8080808080808080808080808080808080808080808080808080808080808080
        8080808080808080808080808080808080808080808080808000FFFFFFC0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C080808000FFFFFFC0C0C0
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000C0C0C0C0C0C080808000FFFFFFC0C0C0
        00000000000000FF0000FF00000000000000FF0000FF000000000000FFFF00FF
        FF000000000000FF00FF0000FF000000C0C0C0C0C0C080808000FFFFFFC0C0C0
        00000000000000FF0000FF00000000000000FF0000FF000000000000FFFF00FF
        FF0000000000000000FFFF00FF000000C0C0C0C0C0C080808000FFFFFFC0C0C0
        00000000000000FF0000FF00000000000000FF0000FF00000000000000000000
        00000000000000FF00FF0000FF000000C0C0C0C0C0C080808000FFFFFFC0C0C0
        00000000000000FF0000FF00000000000000FF0000FF0000000000C0C0C0C0C0
        C0C0C0C00000000000FFFF00FF000000C0C0C0C0C0C080808000FFFFFFC0C0C0
        00000000000000FF0000FF00000000000000FF0000FF0000000000C0C0C0C0C0
        C0C0C0C0000000FF00FF0000FF000000C0C0C0C0C0C080808000FFFFFFC0C0C0
        000000000000000000000000000000000000FF0000FF0000000000C0C0C0C0C0
        C0C0C0C00000000000FFFF00FF000000C0C0C0C0C0C080808000FFFFFFC0C0C0
        000000C0C0C0C0C0C0C0C0C0C0C0C0000000FF0000FF0000000000C0C0C0C0C0
        C0C0C0C0000000FF00FF0000FF000000C0C0C0C0C0C080808000FFFFFFC0C0C0
        000000C0C0C0C0C0C0C0C0C0C0C0C0000000FF0000FF0000000000C0C0C0C0C0
        C0C0C0C0000000000000000000000000C0C0C0C0C0C080808000FFFFFFC0C0C0
        000000C0C0C0C0C0C0C0C0C0C0C0C0000000FF0000FF0000000000C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C080808000FFFFFFC0C0C0
        000000C0C0C0C0C0C0C0C0C0C0C0C0000000000000000000000000C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C080808000FFFFFFC0C0C0
        000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C080808000FFFFFFC0C0C0
        000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C080808000FFFFFFC0C0C0
        000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C080808000FFFFFFC0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C080808000FFFFFFC0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C080808000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00}
      OnClick = FlatSpeedButton1Click
    end
    object btnImprimir: TFlatSpeedButton
      Left = 16
      Top = 414
      Width = 121
      Height = 49
      Caption = 'Imprimir Gráfico'
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        77777700000000000777707777777770707700000000000007070777777BBB77
        0007077777788877070700000000000007700777777777707070700000000007
        0700770FFFFFFFF070707770F00000F000077770FFFFFFFF077777770F00000F
        077777770FFFFFFFF07777777000000000777777777777777777}
      Visible = False
      OnClick = btnImprimirClick
    end
    object btnCopiar: TFlatSpeedButton
      Left = 16
      Top = 472
      Width = 121
      Height = 49
      Caption = 'Copiar Gráfico'
      Glyph.Data = {
        66010000424D6601000000000000760000002800000014000000140000000100
        040000000000F000000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888800008888888888888888888800008888777777778888888800008800
        00000000788888880000880BFFFBFFF0777777880000880F444444F000000078
        0000880FFBFFFBF0FBFFF0780000880F444444F04444F0780000880BFFFBFFF0
        FFFBF0780000880F444444F04444F0780000880FFBFFFBF0FBFFF0780000880F
        44F000004477F0780000880BFFF0FFF0FF0007780000880F44F0FB00F70A0778
        0000880FFBF0F0FF000A00080000880000000F470AAAAA080000888888880FFB
        000A00080000888888880000770A088800008888888888888800088800008888
        88888888888888880000}
      Visible = False
      OnClick = btnCopiarClick
    end
    object RadioGroup1: TRadioGroup
      Left = 16
      Top = 215
      Width = 121
      Height = 127
      Caption = ' Horário '
      ItemIndex = 0
      Items.Strings = (
        'Todos'
        '00:00 - 06:00'
        '06:00 - 12:00'
        '12:00 - 18:00'
        '18:00 - 24:00')
      TabOrder = 2
      Visible = False
    end
    object DateEdit1: TDateEdit
      Left = 16
      Top = 19
      Width = 121
      Height = 21
      NumGlyphs = 2
      YearDigits = dyFour
      TabOrder = 0
    end
    object DateEdit2: TDateEdit
      Left = 16
      Top = 70
      Width = 121
      Height = 21
      NumGlyphs = 2
      YearDigits = dyFour
      TabOrder = 1
    end
    object rgTipo: TRadioGroup
      Left = 16
      Top = 118
      Width = 121
      Height = 75
      Caption = ' Tipo de Gráfico '
      ItemIndex = 0
      Items.Strings = (
        'Barra'
        'Pizza')
      TabOrder = 3
    end
  end
  object qrGraph: TIBQuery
    Database = dtMod.dtBase
    Transaction = dtMod.IBTrans
    CachedUpdates = False
    SQL.Strings = (
      'select f.codigomicro, '
      '       m.descricao, '
      '       sum(f.horas)*24 horas'
      'from movimentofechado f, '
      '     micro m'
      'where f.codigomicro=m.codigomicro'
      '  and f.dhfinal >= :data1'
      '  and f.dhfinal <= :data2'
      ''
      ''
      'group by f.codigomicro, m.descricao')
    Left = 82
    Top = 496
    ParamData = <
      item
        DataType = ftDate
        Name = 'data1'
        ParamType = ptUnknown
        Value = 36892d
      end
      item
        DataType = ftDate
        Name = 'data2'
        ParamType = ptUnknown
        Value = 37072d
      end>
    object qrGraphCODIGOMICRO: TIntegerField
      FieldName = 'CODIGOMICRO'
    end
    object qrGraphHORAS: TFloatField
      FieldName = 'HORAS'
      DisplayFormat = '#0.00'
    end
    object qrGraphDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Size = 50
    end
  end
  object dsGraph: TDataSource
    DataSet = qrGraph
    Left = 36
    Top = 496
  end
end
