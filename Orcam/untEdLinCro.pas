unit untEdLinCro;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, CurrEdit, RXDBCtrl, Mask, ToolEdit, DBCtrls, ExtCtrls,
  ODPopCal;

type
  TfrmEdLinCro = class(TForm)
    DBText1: TDBText;
    DBDateEdit1: TDBDateEdit;
    DBDateEdit2: TDBDateEdit;
    DBEdit1: TRxDBCalcEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure DBDateEdit2Exit(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEdLinCro: TfrmEdLinCro;

implementation

uses untDatMod;

{$R *.DFM}

procedure TfrmEdLinCro.DBDateEdit2Exit(Sender: TObject);
begin
   DatMod.TabCronoDuracao.Value := Trunc(DBDateEdit2.Date - DBDateEdit1.Date);
end;

procedure TfrmEdLinCro.DBEdit1Exit(Sender: TObject);
begin
   DatMod.TabCronoDtFinal.Value := DBDateEdit1.Date + DBEdit1.Value;
end;

end.
