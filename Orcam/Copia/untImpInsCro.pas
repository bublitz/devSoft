unit untImpInsCro;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls;

type
  TrptImpInsCro = class(TForm)
    QRepIns: TQuickRep;
    CabecalhoPagina: TQRBand;
    QRLbCl: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel4: TQRLabel;
    FooterPage: TQRBand;
    QRLbDr: TQRLabel;
    QRLabel5: TQRLabel;
    QRSysData1: TQRSysData;
    CabecalhoColuna: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    Detalhe: TQRBand;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel10: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel8: TQRLabel;
    QRLabPer: TQRLabel;
    procedure QRepInsPreview(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rptImpInsCro: TrptImpInsCro;

implementation

uses untDatMod, untPreview;

{$R *.DFM}

procedure TrptImpInsCro.QRepInsPreview(Sender: TObject);
begin
   frmPreview.QRPrev.QRPrinter := QRepIns.QRPrinter;
   frmPreview.WindowState := wsMaximized;
   frmPreview.Show;
end;

end.
