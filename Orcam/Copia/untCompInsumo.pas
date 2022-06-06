unit untCompInsumo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, RXLookup, DBCtrls, Buttons, Mask, ToolEdit, CurrEdit, RXDBCtrl;

type
  TfrmCompInsumo = class(TForm)
    Label1: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    RxDBCalcEdit1: TRxDBCalcEdit;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCompInsumo: TfrmCompInsumo;

implementation

uses untDatMod;

{$R *.DFM}

procedure TfrmCompInsumo.FormShow(Sender: TObject);
begin
   DBLookupComboBox1.SetFocus;
end;

end.
