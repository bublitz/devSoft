unit untImpOrcam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls;

type
  TrptImpOrcam = class(TForm)
    QRepOrcam: TQuickRep;
    CabecalhoPagina: TQRBand;
    QRLbCl: TQRLabel;
    CabecalhoColuna: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    Detalhe: TQRBand;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    FooterPage: TQRBand;
    QRLbDr: TQRLabel;
    QRLabel5: TQRLabel;
    QRSysData1: TQRSysData;
    QRGroup1: TQRGroup;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText8: TQRDBText;
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
  rptImpOrcam: TrptImpOrcam;

implementation

uses untDatMod, untPreview, Funcoes;

{$R *.DFM}

procedure TrptImpOrcam.DetalheBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   PrintBand := iif( myInt(DatMod.TabOrcamNivel.AsString)=0, True, False );
end;

procedure TrptImpOrcam.QRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   PrintBand := iif( myInt(DatMod.TabOrcamNivel.AsString)>0, True, False );
end;

procedure TrptImpOrcam.QRepOrcamPreview(Sender: TObject);
begin
   frmPreview.QRPrev.QRPrinter := QRepOrcam.QRPrinter;
   frmPreview.WindowState := wsMaximized;
   frmPreview.Show;
end;

procedure TrptImpOrcam.QRDBText3Print(sender: TObject; var Value: String);
begin
   if Copy( DatMod.TabOrcamCodigoServico.AsString, 1, 1) = 'T' then
      Value := ' ';
end;

end.
