unit untDataRelFech;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ToolEdit, Buttons, ExtCtrls, Grids, DBGrids, RXSpin;

type
  TfrmDataFech = class(TForm)
    Label1: TLabel;
    edtData: TDateEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label2: TLabel;
    edtCopias: TRxSpinEdit;
    Label3: TLabel;
    cbPeriodo: TComboBox;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtDataExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    maior, menor: integer;
    controle: array[0..100] of Integer;
    comple: string;
  end;

var
  frmDataFech: TfrmDataFech;

implementation

uses untDtMod, untRelFech, untFuncoes, untMain;

{$R *.DFM}

procedure TfrmDataFech.BitBtn1Click(Sender: TObject);
  Function conv (s: string): string;
  begin
    conv:= copy ( s,4,2 ) + '/' + copy ( s,1,2 ) + '/' + copy ( s,7,4 );
  end;

var
  comple: string;

begin
  if cbPeriodo.ItemIndex >= 0 then //escolheu um periodo
  begin
    menor := controle[cbPeriodo.ItemIndex];
    maior := menor;
    comple := '  ' + cbPeriodo.Text;
  end
  else
  begin
    menor := controle[0];
    maior := controle[cbPeriodo.Items.Count-1];
    comple := '';
  end;


  //Atualiza Copyright nos Relatórios
  Application.CreateForm(TfrmRelFech, frmRelFech);
  frmRelFech.QRCopy.Caption := frmMain.aplic;
  frmRelFech.QRLabel3.Caption := 'Movimento de Caixa: ' + edtData.Text + comple;
  dtMod.qrRelFech.Close;
  dtMod.qrRelFech.ParamByName('INICIO').AsInteger := menor;
  dtMod.qrRelFech.ParamByName('FINAL').AsInteger := maior;
  dtMod.qrRelFech.Open;
  frmRelFech.QuickRep1.PrinterSettings.Copies := edtCopias.AsInteger;
  frmRelFech.QuickRep1.PrinterSetup;
  frmRelFech.QuickRep1.Prepare;
  frmRelFech.QuickRep1.Preview;
end;

procedure TfrmDataFech.FormShow(Sender: TObject);
begin
  cbPeriodo.Items.Clear;
  cbPeriodo.Text := '';
  edtData.Date := Date;
  edtData.SetFocus;
end;

procedure TfrmDataFech.edtDataExit(Sender: TObject);
var
  linha: string;
  i: integer;

begin
  cbPeriodo.Items.Clear;
  cbPeriodo.Text := '';

  dtMod.qrDataCaixa.Close;
  linha := Date2IB(edtData.Date);
  dtMod.qrDataCaixa.ParamByName('DATA').AsString := Date2IB(edtData.Date);
  dtMod.qrDataCaixa.Open;

  i := 0;
  dtMod.qrDataCaixa.First;
  while not dtMod.qrDataCaixa.Eof do
  begin
    controle[i] := dtMod.qrDataCaixaCONTROLECAIXA.Value;
    linha := TimeToStr(dtMod.qrDataCaixaDHABERTURA.AsDateTime) + ' - ' +
             TimeToStr(dtMod.qrDataCaixaDHFECHAMENTO.AsDateTime);
    inc(i);
    cbPeriodo.Items.Add(linha);
    dtMod.qrDataCaixa.Next;
  end;
end;

procedure TfrmDataFech.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
