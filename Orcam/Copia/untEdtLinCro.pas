unit untEdtLinCro;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, Mask, ToolEdit, CurrEdit, RXDBCtrl, ExtCtrls;

type
  TfrmEdtLinCro = class(TForm)
    DBEdtVl: TRxDBCalcEdit;
    DBEdtPc: TRxDBCalcEdit;
    DBText1: TDBText;
    Label1: TLabel;
    Label2: TLabel;
    BtnOk: TBitBtn;
    BitBtn2: TBitBtn;
    Bevel1: TBevel;
    procedure FormShow(Sender: TObject);
    procedure DBEdtVlChange(Sender: TObject);
    procedure DBEdtPcChange(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    valor: real;
  end;

var
  frmEdtLinCro: TfrmEdtLinCro;

implementation

uses untDatMod;

{$R *.DFM}

procedure TfrmEdtLinCro.FormShow(Sender: TObject);
begin
   if DBEdtVl.Enabled then
      DBEdtVl.SetFocus
   else
      DBEdtPc.SetFocus;
end;

procedure TfrmEdtLinCro.DBEdtVlChange(Sender: TObject);
begin
   if valor > 0 then
      DBEdtPc.Value := Trunc(100*DBEdtVl.Value/valor*100)/100;
end;

procedure TfrmEdtLinCro.DBEdtPcChange(Sender: TObject);
begin
   DBEdtVl.Value := valor*DBEdtPc.Value/100;
end;

procedure TfrmEdtLinCro.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
     if ActiveControl.Name <> 'BtnOk' then begin
        SelectNext( ActiveControl, True, True );
        Key := #0;
     end;
end;

end.
