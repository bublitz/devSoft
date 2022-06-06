unit untRepAnaResumo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls, Provider, SqlExpr, DB, DBClient,
  DBLocal, DBLocalS, FMTBcd, QRExport;

type
  TrptAnaResumo = class(TForm)
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    TitleBand1: TQRBand;
    qrLabRegional: TQRLabel;
    qrLabSecao: TQRLabel;
    QRLabel3: TQRLabel;
    DetailBand1: TQRBand;
    qrLabPeriodo: TQRLabel;
    QRDBText3: TQRDBText;
    dsReport: TDataSource;
    PageFooterBand1: TQRBand;
    QRLabel9: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel10: TQRLabel;
    QRLabel12: TQRLabel;
    QRSysData2: TQRSysData;
    sqlReport: TSQLClientDataSet;
    QRDBText1: TQRDBText;
    QRLabel7: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel5: TQRLabel;
    QRShape1: TQRShape;
    QRDBText2: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRShape2: TQRShape;
    QRDBText4: TQRDBText;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel14: TQRLabel;
    QRExpr1: TQRExpr;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRShape3: TQRShape;
    QRLabel17: TQRLabel;
    QRLabel4: TQRLabel;
    QRExpr3: TQRExpr;
    QRDBText6: TQRDBText;
    QRDBText8: TQRDBText;
    dsKM: TDataSource;
    sqlKM: TSQLClientDataSet;
    dsAbast: TDataSource;
    sqlAbast: TSQLClientDataSet;
    dsManut: TDataSource;
    sqlManut: TSQLClientDataSet;
    dsReparo: TDataSource;
    sqlReparo: TSQLClientDataSet;
    sqlReportCODIGOVEICULO: TIntegerField;
    sqlReportDESCRICAO: TStringField;
    sqlReportPLACA: TStringField;
    sqlKMCODIGOVEICULO: TIntegerField;
    sqlReportKMRODADOS: TIntegerField;
    sqlKMKMRODADOS: TIntegerField;
    sqlAbastCODIGOVEICULO: TIntegerField;
    sqlAbastQTDCOMB: TIntegerField;
    sqlAbastVALABAST: TFloatField;
    sqlReportQtdComb: TIntegerField;
    sqlReportValAbast: TFloatField;
    sqlManutCODIGOVEICULO: TIntegerField;
    sqlManutQTDOLEO: TIntegerField;
    sqlManutVALMANUT: TFloatField;
    sqlReportQtdOleo: TIntegerField;
    sqlReportValManut: TFloatField;
    sqlReparoCODIGOVEICULO: TIntegerField;
    sqlReparoVALREPARO: TFloatField;
    sqlReportValReparo: TFloatField;
    sqlReportkm_litros: TFloatField;
    sqlReportvalor_km: TFloatField;
    QRLabel11: TQRLabel;
    dsOleo: TDataSource;
    sqlOleo: TSQLClientDataSet;
    QRDBText7: TQRDBText;
    QRLabel18: TQRLabel;
    sqlOleoCODIGOVEICULO: TIntegerField;
    sqlOleoQTDOLEO: TIntegerField;
    procedure sqlReportCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rptAnaResumo: TrptAnaResumo;

implementation

uses untDatModRelat;

{$R *.dfm}

procedure TrptAnaResumo.sqlReportCalcFields(DataSet: TDataSet);
begin
  if sqlReportQtdComb.Value > 0 then
    sqlReportkm_litros.Value := sqlReportKMRODADOS.Value / sqlReportQtdComb.Value
  else
    sqlReportkm_litros.Value := 0;

  if sqlReportKMRODADOS.Value > 0 then
    sqlReportvalor_km.Value := (sqlReportValAbast.Value +
                                sqlReportValManut.Value +
                                sqlReportValReparo.Value) / sqlReportKMRODADOS.Value
  else
    sqlReportvalor_km.Value := 0;

end;

end.
