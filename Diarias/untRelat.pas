unit untRelat;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, ExtCtrls;

type
  TfrmRelat = class(TForm)
    QuickRep1: TQuickRep;
    TitleBand1: TQRBand;
    PageHeaderBand1: TQRBand;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelat: TfrmRelat;

implementation

{$R *.DFM}

end.
