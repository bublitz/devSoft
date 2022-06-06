unit untRepAnaManut;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls, Provider, SqlExpr, DB, DBClient,
  DBLocal, DBLocalS, FMTBcd;

type
  TrptAnaManut = class(TForm)
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
    QRLabel15: TQRLabel;
    procedure QRAcum2Print(sender: TObject; var Value: String);
    procedure QRExpr2Print(sender: TObject; var Value: String);
  private
    { Private declarations }
  public
    { Public declarations }
    acumulado: real;
  end;

var
  rptAnaManut: TrptAnaManut;

implementation

uses untDatModRelat;

{$R *.dfm}

procedure TrptAnaManut.QRAcum2Print(sender: TObject; var Value: String);
begin
  acumulado := acumulado + sqlReport.FieldByName('VALORTOTAL').AsFloat;
  Value := FloatToStrF(acumulado,ffNumber,8,2);
end;

procedure TrptAnaManut.QRExpr2Print(sender: TObject; var Value: String);
begin
  acumulado := 0;
end;

end.
