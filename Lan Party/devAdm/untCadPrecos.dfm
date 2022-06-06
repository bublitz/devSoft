object frmCadPrecos: TfrmCadPrecos
  Left = 350
  Top = 237
  Width = 597
  Height = 370
  Caption = 'devAdm - Cadastro de Pre'#231'os'
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
    Width = 589
    Height = 343
    ActivePage = TabSheet1
    Align = alClient
    TabIndex = 0
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Listagem'
      object ToolBar1: TToolBar
        Left = 0
        Top = 0
        Width = 581
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
          CharCase = ecUpperCase
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          OnChange = edtTextChange
        end
      end
      object DBGrid1: TDBGrid
        Left = 0
        Top = 29
        Width = 581
        Height = 286
        Align = alClient
        DataSource = dmPrinc.dsPreco
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'DIASEMANA'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SOCIO15'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SOCIO30'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SOCIO60'
            Visible = True
          end>
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Detalhes'
      ImageIndex = 1
      TabVisible = False
      object Label1: TLabel
        Left = 18
        Top = 10
        Width = 73
        Height = 13
        Caption = 'Dia da Semana'
        FocusControl = DBEdit1
      end
      object Label2: TLabel
        Left = 18
        Top = 50
        Width = 42
        Height = 13
        Caption = 'S'#243'cio 15'
        FocusControl = DBEdit2
      end
      object Label3: TLabel
        Left = 18
        Top = 90
        Width = 42
        Height = 13
        Caption = 'S'#243'cio 30'
        FocusControl = DBEdit3
      end
      object Label4: TLabel
        Left = 18
        Top = 130
        Width = 42
        Height = 13
        Caption = 'S'#243'cio 60'
        FocusControl = DBEdit4
      end
      object btnGravar: TBitBtn
        Left = 183
        Top = 283
        Width = 92
        Height = 32
        Caption = '&Gravar'
        TabOrder = 0
        OnClick = btnGravarClick
        Kind = bkOK
      end
      object BitBtn2: TBitBtn
        Left = 449
        Top = 283
        Width = 92
        Height = 32
        Caption = '&Cancelar'
        TabOrder = 1
        OnClick = BitBtn2Click
        Kind = bkAbort
      end
      object DBEdit1: TDBEdit
        Left = 18
        Top = 24
        Width = 134
        Height = 21
        DataField = 'DIASEMANA'
        DataSource = dmPrinc.dsPreco
        TabOrder = 2
      end
      object DBEdit2: TDBEdit
        Left = 18
        Top = 64
        Width = 134
        Height = 21
        DataField = 'SOCIO15'
        DataSource = dmPrinc.dsPreco
        TabOrder = 3
      end
      object DBEdit3: TDBEdit
        Left = 18
        Top = 104
        Width = 134
        Height = 21
        DataField = 'SOCIO30'
        DataSource = dmPrinc.dsPreco
        TabOrder = 4
      end
      object DBEdit4: TDBEdit
        Left = 18
        Top = 144
        Width = 134
        Height = 21
        DataField = 'SOCIO60'
        DataSource = dmPrinc.dsPreco
        TabOrder = 5
      end
    end
  end
end
