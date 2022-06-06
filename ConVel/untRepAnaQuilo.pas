unit untRepAnaQuilo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls, Provider, SqlExpr, DB, DBClient,
  DBLocal, DBLocalS, FMTBcd;

type
  TrptAnaQuilo = class(TForm)
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
    QRExpr1: TQRExpr;
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
    sqlQuilo: TSQLClientDataSet;
    QRLabel1: TQRLabel;
    QRAcum: TQRLabel;
    QRLabel15: TQRLabel;
    procedure QRAcumPrint(sender: TObject; var Value: String);
    procedure QRExpr2Print(sender: TObject; var Value: String);
  private
    { Private declarations }
  public
    { Public declarations }
    acumulado: integer;
  end;

var
  rptAnaQuilo: TrptAnaQuilo;

implementation

uses untDatModRelat;

{$R *.dfm}

procedure TrptAnaQuilo.QRAcumPrint(sender: TObject; var Value: String);
begin
  acumulado := acumulado + (sqlQuilo.FieldByName('FINAL').asInteger -
                            sqlQuilo.FieldByName('INICIO').asInteger );
  Value := FloatToStrF(acumulado,ffNumber,6,0);
end;

procedure TrptAnaQuilo.QRExpr2Print(sender: TObject; var Value: String);
begin
  acumulado := 0;
end;

end.
