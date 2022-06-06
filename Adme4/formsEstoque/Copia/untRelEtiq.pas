unit untRelEtiq;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, ExtCtrls, Qrctrls, QRExport, QRBarcode;

type
  TfrmRelEtiq = class(TForm)
    QuickRep1: TQuickRep;
    QRBand11: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRBarcode1: TQRBarcode;
    QRBarcode2: TQRBarcode;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelEtiq: TfrmRelEtiq;

implementation

uses untDtModEst, untProd;

{$R *.DFM}

end.
