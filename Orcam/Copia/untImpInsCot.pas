unit untImpInsCot;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls;

type
  TrptImpInsCot = class(TForm)
    QRepIns: TQuickRep;
    CabecalhoPagina: TQRBand;
    QRLbCl: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel4: TQRLabel;
    FooterPage: TQRBand;
    QRLbDr: TQRLabel;
    QRLabel5: TQRLabel;
    QRSysData1: TQRSysData;
    CabecalhoColuna: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel6: TQRLabel;
    Detalhe: TQRBand;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel11: TQRLabel;
    QRDBText6: TQRDBText;
    procedure QRepInsPreview(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rptImpInsCot: TrptImpInsCot;

implementation

uses untDatMod, untPreview;

{$R *.DFM}

procedure TrptImpInsCot.QRepInsPreview(Sender: TObject);
begin
   frmPreview.QRPrev.QRPrinter := QRepIns.QRPrinter;
   frmPreview.WindowState := wsMaximized;
   frmPreview.Show;
end;

end.
