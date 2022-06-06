unit untRelSocio;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, IBCustomDataSet, IBQuery, Qrctrls, QuickRpt, ExtCtrls;

type
  TfrmRelSocio = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRDBText4: TQRDBText;
    QRLabel1: TQRLabel;
    QRBand2: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel7: TQRLabel;
    QRBand3: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText5: TQRDBText;
    PageFooterBand1: TQRBand;
    QRCopy: TQRLabel;
    QRLabel10: TQRLabel;
    QRSysData1: TQRSysData;
    QRBand4: TQRBand;
    QRExpr1: TQRExpr;
    QRLabel6: TQRLabel;
    dsRelSocio: TDataSource;
    qrRelSocio: TIBQuery;
    qrRelSocioNOME: TIBStringField;
    qrRelSocioTELEFONE: TIBStringField;
    qrRelSocioSITUACAO: TIBStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelSocio: TfrmRelSocio;

implementation

uses untDtMod;

{$R *.DFM}

end.
