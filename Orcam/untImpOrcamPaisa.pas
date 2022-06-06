unit untImpOrcamPaisa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, Qrctrls, ExtCtrls;

type
  TrptImpOrcamPaisa = class(TForm)
    QRepOrcam: TQuickRep;
    CabecalhoPagina: TQRBand;
    QRLbCl: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel4: TQRLabel;
    CabecalhoColuna: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel10: TQRLabel;
    Detalhe: TQRBand;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText8: TQRDBText;
    FooterPage: TQRBand;
    QRLbDr: TQRLabel;
    QRLabel5: TQRLabel;
    QRSysData1: TQRSysData;
    QRGroup1: TQRGroup;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRLabel9: TQRLabel;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    procedure DetalheBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRepOrcamPreview(Sender: TObject);
    procedure QRDBText3Print(sender: TObject; var Value: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rptImpOrcamPaisa: TrptImpOrcamPaisa;

implementation

uses untDatMod, untPreview, Funcoes;

{$R *.DFM}

procedure TrptImpOrcamPaisa.DetalheBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   PrintBand := iif( myInt(DatMod.TabOrcamNivel.AsString)=0, True, False );
end;

procedure TrptImpOrcamPaisa.QRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   PrintBand := iif( myInt(DatMod.TabOrcamNivel.AsString)>0, True, False );
end;

procedure TrptImpOrcamPaisa.QRepOrcamPreview(Sender: TObject);
begin
   frmPreview.QRPrev.QRPrinter := QRepOrcam.QRPrinter;
   frmPreview.WindowState := wsMaximized;
   frmPreview.Show;
end;

procedure TrptImpOrcamPaisa.QRDBText3Print(sender: TObject;
  var Value: String);
begin
   if Copy( DatMod.TabOrcamCodigoServico.AsString, 1, 1) = 'T' then
      Value := ' ';
end;

end.
