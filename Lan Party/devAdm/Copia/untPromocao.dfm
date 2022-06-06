object frmPromocao: TfrmPromocao
  Left = 246
  Top = 197
  Width = 536
  Height = 274
  Caption = 'devAdm - Cadastro de Promo'#231#227'o'
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
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 528
    Height = 247
    ActivePage = TabSheet2
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Listagem'
      object ToolBar1: TToolBar
        Left = 0
        Top = 0
        Width = 784
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
          Height = 17
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
        Width = 784
        Height = 496
        Align = alClient
        DataSource = dmPrinc.dsPromocoes
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'CODIGOPROMOCAO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRICAO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BONUS'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DATAINICIAL'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DATAFINAL'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PANFLETOINICIAL'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PANFLETOFINAL'
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
        Top = 10
        Width = 84
        Height = 13
        Caption = 'C'#243'digo Promo'#231#227'o'
        FocusControl = DBEdit1
      end
      object Label2: TLabel
        Left = 10
        Top = 51
        Width = 48
        Height = 13
        Caption = 'Descri'#231#227'o'
        FocusControl = DBEdit2
      end
      object Label3: TLabel
        Left = 10
        Top = 92
        Width = 53
        Height = 13
        Caption = 'Data Inicial'
        FocusControl = DBEdit3
      end
      object Label4: TLabel
        Left = 377
        Top = 92
        Width = 48
        Height = 13
        Caption = 'Data Final'
        FocusControl = DBEdit4
      end
      object Label5: TLabel
        Left = 10
        Top = 133
        Width = 69
        Height = 13
        Caption = 'Panfleto Inicial'
        FocusControl = DBEdit5
      end
      object Label6: TLabel
        Left = 377
        Top = 133
        Width = 64
        Height = 13
        Caption = 'Panfleto Final'
        FocusControl = DBEdit6
      end
      object btnGravar: TBitBtn
        Left = 81
        Top = 180
        Width = 92
        Height = 32
        Caption = '&Gravar'
        TabOrder = 0
        OnClick = btnGravarClick
        Kind = bkOK
      end
      object BitBtn2: TBitBtn
        Left = 347
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
        Top = 26
        Width = 50
        Height = 21
        Color = clBtnFace
        DataField = 'CODIGOPROMOCAO'
        DataSource = dmPrinc.dsPromocoes
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
        Top = 67
        Width = 500
        Height = 21
        CharCase = ecUpperCase
        DataField = 'DESCRICAO'
        DataSource = dmPrinc.dsPromocoes
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
      end
      object DBEdit3: TDBEdit
        Left = 10
        Top = 108
        Width = 134
        Height = 21
        DataField = 'DATAINICIAL'
        DataSource = dmPrinc.dsPromocoes
        TabOrder = 4
      end
      object DBEdit4: TDBEdit
        Left = 377
        Top = 108
        Width = 134
        Height = 21
        DataField = 'DATAFINAL'
        DataSource = dmPrinc.dsPromocoes
        TabOrder = 5
      end
      object DBEdit5: TDBEdit
        Left = 10
        Top = 150
        Width = 134
        Height = 21
        DataField = 'PANFLETOINICIAL'
        DataSource = dmPrinc.dsPromocoes
        TabOrder = 6
      end
      object DBEdit6: TDBEdit
        Left = 377
        Top = 150
        Width = 134
        Height = 21
        DataField = 'PANFLETOFINAL'
        DataSource = dmPrinc.dsPromocoes
        TabOrder = 7
      end
    end
  end
end
