unit untFecha;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, Mask, ToolEdit, CurrEdit, Buttons, ExtCtrls;

type
  TfrmFechaSessao = class(TForm)
    lblDHFinal: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    Bevel1: TBevel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    lblHTotal: TLabel;
    Bevel2: TBevel;
    Bevel4: TBevel;
    Label15: TLabel;
    Bevel6: TBevel;
    lblTotalP: TLabel;
    Label13: TLabel;
    lblDelay: TLabel;
    Bevel5: TBevel;
    Label16: TLabel;
    Bevel7: TBevel;
    Label18: TLabel;
    lblTotal: TLabel;
    Bevel8: TBevel;
    lblDHInicial: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Bevel3: TBevel;
    Label1: TLabel;
    lblSocio: TLabel;
    procedure CurrencyEdit1Change(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    desctod, totalp: real;
  end;

var
  frmFechaSessao: TfrmFechaSessao;

implementation

uses untDtMod, untMain, untLibera;

{$R *.DFM}

procedure TfrmFechaSessao.CurrencyEdit1Change(Sender: TObject);
var
  desctov: real;
begin
  desctov := CurrencyEdit1.Value;
  lblTotal.Caption := FloatToStrF(totalp-(desctov+desctod), ffFixed, 15, 2);
end;

procedure TfrmFechaSessao.SpeedButton2Click(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmFechaSessao.SpeedButton1Click(Sender: TObject);
begin
  {if CurrencyEdit1.Value > frmMain.maxDescto then
  begin
    Application.CreateForm(TfrmLibera, frmLibera);
    ModalResult := frmLibera.ShowModal;
    if ModalResult = mrOk then
      dtMod.Acao('Desconto maior que o máximo');
  end;}

  if StrToFloat(lblTotal.Caption) >= dtMod.tbPrecoAVULSO15.Value then
    ModalResult := mrOk
  else
    ModalResult := mrNone;
end;

end.
