unit untHoje;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls;

type
  TfrmHoje = class(TForm)
    StaticText1: TStaticText;
    edtDate1: TDateTimePicker;
    BitBtn1: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmHoje: TfrmHoje;

implementation

{$R *.DFM}

end.
