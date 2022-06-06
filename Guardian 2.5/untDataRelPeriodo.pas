unit untDataRelPeriodo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  RXSpin, StdCtrls, Buttons, Mask, ToolEdit;

type
  TfrmDataRelPeriodo = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    edtData1: TDateEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    edtCopias: TRxSpinEdit;
    Label3: TLabel;
    edtData2: TDateEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    maior, menor: integer;
  end;

var
  frmDataRelPeriodo: TfrmDataRelPeriodo;

implementation

uses untDtMod, untRelFech, untRelPeriodo, untFuncoes;

{$R *.DFM}

procedure TfrmDataRelPeriodo.BitBtn1Click(Sender: TObject);
  Function conv (s: string): string;
  begin
    conv:= copy ( s,4,2 ) + '/' + copy ( s,1,2 ) + '/' + copy ( s,7,4 );
  end;

begin
  dtMod.qrDatPer.Close;
  dtMod.qrDatPer.ParamByName('DATA1').AsDateTime := edtData1.Date;
  dtMod.qrDatPer.ParamByName('DATA2').AsDateTime := edtData2.Date+1;
  dtMod.qrDatPer.Open;
  menor := dtMod.qrDatPerMENOR.Value;
  maior := dtMod.qrDatPerMAIOR.Value;

  dtMod.qrRelFech.Close;
  dtMod.qrRelFech.ParamByName('INICIO').asInteger := menor;
  dtMod.qrRelFech.ParamByName('FINAL').asInteger  := maior;
  dtMod.qrRelFech.Open;
  Application.CreateForm(TfrmRelPeriodo, frmRelPeriodo);
  frmRelPeriodo.QRLabel3.Caption := 'Movimento de Caixa: ' + edtData1.Text +
                                    ' a ' + edtData2.Text;
  frmRelPeriodo.QuickRep1.PrinterSettings.Copies := edtCopias.AsInteger;
  frmRelPeriodo.QuickRep1.PrinterSetup;
  frmRelPeriodo.QuickRep1.Prepare;
  frmRelPeriodo.QuickRep1.Preview;
end;

procedure TfrmDataRelPeriodo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
