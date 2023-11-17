object frmAtualizando: TfrmAtualizando
  Left = 217
  Top = 210
  BorderStyle = bsDialog
  Caption = 'Atualizando...'
  ClientHeight = 94
  ClientWidth = 199
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Gauge1: TGauge
    Left = 0
    Top = 0
    Width = 199
    Height = 94
    Align = alClient
    ForeColor = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clYellow
    Font.Height = -19
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    Kind = gkPie
    ParentFont = False
    Progress = 0
  end
end
