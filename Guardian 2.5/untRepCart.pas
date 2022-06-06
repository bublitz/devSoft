unit untRepCart;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, ExtCtrls, Qrctrls, QRBarcode, jpeg, QRExport;

type
  TfrmRepCart = class(TForm)
    QuickRep1: TQuickRep;
    DetailBand1: TQRBand;
    QRDBImage1: TQRDBImage;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText5: TQRDBText;
    QRImage1: TQRImage;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRImage2: TQRImage;
    QRDBText1: TQRDBText;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRDBText3: TQRDBText;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    ChildBand1: TQRChildBand;
    QRBarCode: TQRBarcode;
    QRHTMLFilter1: TQRHTMLFilter;
    QRExcelFilter1: TQRExcelFilter;
    QRRTFFilter1: TQRRTFFilter;
    QRWMFFilter1: TQRWMFFilter;
    QRImage3: TQRImage;
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRepCart: TfrmRepCart;

implementation

uses untImpSocio, untMain;

{$R *.DFM}

procedure TfrmRepCart.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRBarCode.Digits := frmImpSocio.qrCartCodigoBarra.Value;
  PrintBand := True;
end;

procedure TfrmRepCart.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
