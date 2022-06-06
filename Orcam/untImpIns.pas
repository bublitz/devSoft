unit untImpIns;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls;

type
  TrptImpInsumos = class(TForm)
    QRepIns: TQuickRep;
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
    QRGroup1: TQRGroup;
    QRLabel4: TQRLabel;
    procedure QRepInsPreview(Sender: TObject);
    procedure QRLabel4Print(sender: TObject; var Value: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rptImpInsumos: TrptImpInsumos;

implementation

uses untDatMod, untPreview;

{$R *.DFM}

procedure TrptImpInsumos.QRepInsPreview(Sender: TObject);
begin
   frmPreview.QRPrev.QRPrinter := QRepIns.QRPrinter;
   frmPreview.WindowState := wsMaximized;
   frmPreview.Show;
end;

procedure TrptImpInsumos.QRLabel4Print(sender: TObject; var Value: String);
begin
   case DatMod.QryInscOrc.FieldByName('tipo').AsInteger of
   1: Value := 'Mão de Obra';
   2: Value := 'Material';
   3: Value := 'Equipamento';
   else Value := '---------------';
   end;
end;

end.
