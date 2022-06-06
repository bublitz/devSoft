unit untImpServAna;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls;

type
  TrptImpServAna = class(TForm)
    QRep: TQuickRep;
    CabecalhoPagina: TQRBand;
    QRLbCl: TQRLabel;
    QRLabel3: TQRLabel;
    FooterPage: TQRBand;
    QRLbDr: TQRLabel;
    QRLabel5: TQRLabel;
    QRSysData1: TQRSysData;
    CabecalhoColuna: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel10: TQRLabel;
    Detalhe: TQRBand;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText1: TQRDBText;
    QRGrpServ: TQRGroup;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRGrpTipoServ: TQRGroup;
    QRLabel4: TQRLabel;
    QRFootTipoServ: TQRBand;
    QRLabel7: TQRLabel;
    QRDBText5: TQRDBText;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabSub: TQRLabel;
    QRLabTot: TQRLabel;
    QRFootServ: TQRBand;
    QRLabel11: TQRLabel;
    QRLabTotal: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRDBText6: TQRDBText;
    LabBDI: TQRLabel;
    QRLabBDI: TQRLabel;
    LabTot: TQRLabel;
    QRLabGeral: TQRLabel;
    QRDBText7: TQRDBText;
    procedure QRepPreview(Sender: TObject);
    procedure QRLabel4Print(sender: TObject; var Value: String);
    procedure QRExpr2Print(sender: TObject; var Value: String);
    procedure QRLabTotalPrint(sender: TObject; var Value: String);
    procedure LabBDIPrint(sender: TObject; var Value: String);
    procedure QRLabBDIPrint(sender: TObject; var Value: String);
    procedure QRLabGeralPrint(sender: TObject; var Value: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rptImpServAna: TrptImpServAna;
  mult, total, vlbdi, vlgeral, bdi : real;

implementation

uses untPreview, untDatMod, untMain;

{$R *.DFM}

procedure TrptImpServAna.QRepPreview(Sender: TObject);
begin
   total := 0;
   frmPreview.QRPrev.QRPrinter := QRep.QRPrinter;
   frmPreview.WindowState := wsMaximized;
   frmPreview.Show;
end;

procedure TrptImpServAna.QRLabel4Print(sender: TObject; var Value: String);
begin
   if DatMod.TabTipoInsu.FindKey([DatMod.QryComp.FieldByName('tipo').Value]) then
      Value := DatMod.TabTipoInsuDescricao.Value
   else
      Value := '';

   QRLabel7.Caption := 'Custo de ' + Value + ':';
   QRLabel9.Caption := 'Total de ' + Value + ':';
   if DatMod.QryComp.FieldByName('tipo').Value=1 then begin
      QRLabel8.Caption := 'L.S. ('+FloatToStrF( DatMod.QryComp.FieldByName('LS').asFloat, ffFixed, 15, 2 ) + '%):';
      mult := DatMod.QryComp.FieldByName('LS').asFloat;
      QRFootTipoServ.Height := 59;
   end
   else begin
      QRLabel8.Caption := '';//'B.D.I. ('+FloatToStrF( frmMain.BDI, ffFixed, 15, 2 ) + '%):';
      QRLabel9.Caption := '';
      mult := 0; //frmMain.BDI;
      QRFootTipoServ.Height := 21;
   end;
end;

procedure TrptImpServAna.QRExpr2Print(sender: TObject; var Value: String);
var val1, val2: real;
begin
   val1 := QRExpr2.Value.dblResult * mult / 100;
   val2 := QRExpr2.Value.dblResult + val1;
   if mult > 0 then begin
      QRLabSub.Caption := FloatToStrF( val1, ffNumber, 15, 2 );
      QRLabTot.Caption := FloatToStrF( val2, ffNumber, 15, 2 );
   end
   else begin
      QRLabSub.Caption := '';
      QRLabTot.Caption := '';
   end;
   total := total + val2;
end;

procedure TrptImpServAna.QRLabTotalPrint(sender: TObject;
  var Value: String);
begin
   value := FloatToStrF( total, ffNumber, 15, 2 );
   bdi := DatMod.QryComp.FieldByName('BDI').asFloat;
   vlbdi := total * bdi / 100;
   vlgeral := total + vlbdi;
   total := 0;
end;

procedure TrptImpServAna.LabBDIPrint(sender: TObject; var Value: String);
begin
   Value := 'B.D.I. ('+FloatToStrF( bdi, ffFixed, 15, 2 ) + '%):';
end;

procedure TrptImpServAna.QRLabBDIPrint(sender: TObject; var Value: String);
begin
   value := FloatToStrF( vlbdi, ffNumber, 15, 2 );
end;

procedure TrptImpServAna.QRLabGeralPrint(sender: TObject;
  var Value: String);
begin
   value := FloatToStrF( vlgeral, ffNumber, 15, 2 );
end;

end.
