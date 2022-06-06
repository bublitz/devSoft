unit untDataRelVencto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ToolEdit;

type
  TfrmDataVencto = class(TForm)
    Label1: TLabel;
    edtData1: TDateEdit;
    Label2: TLabel;
    edtData2: TDateEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDataVencto: TfrmDataVencto;

implementation

uses untDtMod, untRelVencto;

{$R *.DFM}

procedure TfrmDataVencto.BitBtn1Click(Sender: TObject);
begin
  dtMod.qrRelVencto.Close;
  dtMod.qrRelVencto.ParamByName('DATA1').AsDateTime := edtData1.Date;
  dtMod.qrRelVencto.ParamByName('DATA2').AsDateTime := edtData2.Date;
  dtMod.qrRelVencto.Open;

  Application.CreateForm(TfrmRelVencto, frmRelVencto);
  frmRelVencto.QRLabel3.Caption := 'Socio Bloqueado do Período: ' + edtData1.Text +
                                    ' a ' + edtData2.Text;
  frmRelVencto.QuickRep1.PrinterSetup;
  frmRelVencto.QuickRep1.Prepare;
  frmRelVencto.QuickRep1.Preview;

end;

procedure TfrmDataVencto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
