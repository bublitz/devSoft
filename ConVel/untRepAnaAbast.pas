unit untRepAnaAbast;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls, Provider, SqlExpr, DB, DBClient,
  DBLocal, DBLocalS, FMTBcd;

type
  TrptAnaAbast = class(TForm)
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    TitleBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    qrLabRegional: TQRLabel;
    qrLabSecao: TQRLabel;
    QRLabel3: TQRLabel;
    DetailBand1: TQRBand;
    QRGroup1: TQRGroup;
    QRLabel4: TQRLabel;
    qrLabPeriodo: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    dsQuilo: TDataSource;
    PageFooterBand1: TQRBand;
    QRLabel9: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel10: TQRLabel;
    QRGroupFooter: TQRBand;
    QRLabel11: TQRLabel;
    QRExpr2: TQRExpr;
    QRLabel12: TQRLabel;
    QRSysData2: TQRSysData;
    QRExpr3: TQRExpr;
    sqlReport: TSQLClientDataSet;
    QRLabel1: TQRLabel;
    QRAcum2: TQRLabel;
    QRLabel2: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel13: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel14: TQRLabel;
    QRDBText6: TQRDBText;
    QRAcum1: TQRLabel;
    QRExpr1: TQRExpr;
    QRLabel15: TQRLabel;
    procedure QRAcum2Print(sender: TObject; var Value: String);
    procedure QRExpr2Print(sender: TObject; var Value: String);
    procedure QRAcum1Print(sender: TObject; var Value: String);
  private
    { Private declarations }
  public
    { Public declarations }
    acumulado1: integer;
    acumulado2: real;
  end;

var
  rptAnaAbast: TrptAnaAbast;

implementation

uses untDatModRelat;

{$R *.dfm}

procedure TrptAnaAbast.QRAcum1Print(sender: TObject; var Value: String);
begin
  acumulado1 := acumulado1 + sqlReport.FieldByName('LITROS').AsInteger;
  Value := FloatToStrF(acumulado1,ffNumber,6,0);
end;

procedure TrptAnaAbast.QRAcum2Print(sender: TObject; var Value: String);
begin
  acumulado2 := acumulado2 + sqlReport.FieldByName('VALORTOTAL').AsFloat;
  Value := FloatToStrF(acumulado2,ffNumber,8,2);
end;

procedure TrptAnaAbast.QRExpr2Print(sender: TObject; var Value: String);
begin
  acumulado1 := 0;
  acumulado2 := 0;
end;

end.
