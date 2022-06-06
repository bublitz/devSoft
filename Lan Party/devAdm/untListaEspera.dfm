object frmListaEspera: TfrmListaEspera
  Left = 226
  Top = 184
  Width = 507
  Height = 273
  Caption = 'devAdm - Cadastro Lista de Espera'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 499
    Height = 246
    ActivePage = TabSheet1
    Align = alClient
    TabIndex = 0
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Listagem'
      object ToolBar1: TToolBar
        Left = 0
        Top = 0
        Width = 491
        Height = 29
        ButtonWidth = 27
        Caption = 'BtnBar'
        Images = dmPrinc.imgList
        TabOrder = 0
        object ToolButton1: TToolButton
          Left = 0
          Top = 2
          Width = 8
          Caption = 'ToolButton1'
          Style = tbsSeparator
        end
        object btnIncluir: TToolButton
          Left = 8
          Top = 2
          Hint = 'Incluir'
          Caption = 'btnIncluir'
          ImageIndex = 12
          ParentShowHint = False
          ShowHint = True
          OnClick = btnIncluirClick
        end
        object btnEditar: TToolButton
          Left = 35
          Top = 2
          Hint = 'Editar'
          Caption = 'btnEditar'
          ImageIndex = 22
          ParentShowHint = False
          ShowHint = True
          OnClick = btnEditarClick
        end
        object ToolButton4: TToolButton
          Left = 62
          Top = 2
          Width = 8
          Caption = 'ToolButton4'
          ImageIndex = 1
          Style = tbsSeparator
        end
        object btnExcluir: TToolButton
          Left = 70
          Top = 2
          Hint = 'Exluir'
          Caption = 'btnExcluir'
          ImageIndex = 4
          ParentShowHint = False
          ShowHint = True
          OnClick = btnExcluirClick
        end
        object btnAtualizar: TToolButton
          Left = 97
          Top = 2
          Hint = 'Atualizar'
          Caption = 'btnAtualizar'
          ImageIndex = 3
          ParentShowHint = False
          ShowHint = True
          OnClick = btnAtualizarClick
        end
        object ToolButton7: TToolButton
          Left = 124
          Top = 2
          Width = 65
          Caption = 'ToolButton7'
          ImageIndex = 3
          Style = tbsSeparator
        end
        object StaticText1: TStaticText
          Left = 189
          Top = 2
          Width = 53
          Height = 22
          Caption = 'Pesquisar:'
          TabOrder = 0
        end
        object edtText: TEdit
          Left = 242
          Top = 2
          Width = 208
          Height = 22
          TabOrder = 1
          OnChange = edtTextChange
        end
      end
      object DBGrid1: TDBGrid
        Left = 0
        Top = 29
        Width = 491
        Height = 189
        Align = alClient
        DataSource = dmPrinc.dsListaEspera
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'SEQUENCIA'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODIGOCLIENTE'
            Visible = True
          end>
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Detalhes'
      ImageIndex = 1
      TabVisible = False
      object Label1: TLabel
        Left = 10
        Top = 18
        Width = 51
        Height = 13
        Caption = 'Sequencia'
        FocusControl = DBEdit1
      end
      object Label2: TLabel
        Left = 10
        Top = 109
        Width = 68
        Height = 13
        Caption = 'C'#243'digo Cliente'
        FocusControl = DBEdit2
      end
      object btnPesq: TSpeedButton
        Left = 63
        Top = 124
        Width = 23
        Height = 22
        Hint = 'Pesquisar'
        Flat = True
        Glyph.Data = {
          36050000424D3605000000000000360400002800000010000000100000000100
          08000000000000010000120B0000120B00000001000000010000000000000000
          80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
          A600F0FBFF00A4A0A000808080000000FF0000FF000000FFFF00FF000000FF00
          FF00FFFF0000FFFFFF0000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000131313131313
          1313131313131313131313131313131313131313131313131313131313131313
          1313131313130004131313131313131313131313130004001313131313131313
          1313131300040013131313131313131313131300040013131313131313000404
          0400000400131313131313130004001313000400131313131313131304131313
          1313000013131313131313000013131313131304131313131313130000000013
          1313130413131313131313000013130013131304131313131313131304131313
          1313000013131313131313130004001313000413131313131313131313000404
          0400131313131313131313131313131313131313131313131313}
        ParentShowHint = False
        ShowHint = True
      end
      object Label3: TLabel
        Left = 93
        Top = 109
        Width = 32
        Height = 13
        Caption = 'Label3'
      end
      object btnGravar: TBitBtn
        Left = 76
        Top = 180
        Width = 92
        Height = 32
        Caption = '&Gravar'
        TabOrder = 0
        OnClick = btnGravarClick
        Kind = bkOK
      end
      object BitBtn2: TBitBtn
        Left = 318
        Top = 180
        Width = 92
        Height = 32
        Caption = '&Cancelar'
        TabOrder = 1
        OnClick = BitBtn2Click
        Kind = bkAbort
      end
      object DBEdit1: TDBEdit
        Left = 10
        Top = 32
        Width = 50
        Height = 21
        Color = clBtnFace
        DataField = 'SEQUENCIA'
        DataSource = dmPrinc.dsListaEspera
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
      end
      object DBEdit2: TDBEdit
        Left = 10
        Top = 123
        Width = 50
        Height = 21
        DataField = 'CODIGOCLIENTE'
        DataSource = dmPrinc.dsListaEspera
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
      end
      object DBEdit3: TDBEdit
        Left = 90
        Top = 123
        Width = 400
        Height = 21
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
      end
      object RdGrpOrdem: TRadioGroup
        Left = 134
        Top = 62
        Width = 185
        Height = 36
        Caption = 'Ordem Pesquisa'
        Columns = 2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ItemIndex = 1
        Items.Strings = (
          'Produto'
          'C'#243'digo')
        ParentFont = False
        TabOrder = 5
      end
    end
  end
end
