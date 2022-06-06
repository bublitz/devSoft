unit untImpSer;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls;

type
  TrptImpServicos = class(TForm)
    QRep: TQuickRep;
    CabecalhoPagina: TQRBand;
    QRLbCl: TQRLabel;
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
    QRLabel10: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel3: TQRLabel;
    procedure QRepPreview(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rptImpServicos: TrptImpServicos;

implementation

uses untDatMod, untPreview;

{$R *.DFM}

procedure TrptImpServicos.QRepPreview(Sender: TObject);
begin
   frmPreview.QRPrev.QRPrinter := QRep.QRPrinter;
   frmPreview.WindowState := wsMaximized;
   frmPreview.Show;
end;

end.
