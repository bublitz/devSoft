unit untCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls, RxGIF, QRExport, DB, DBTables;

type
  TfrmCons = class(TForm)
    QRepCons: TQuickRep;
    PageHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    QRGroup1: TQRGroup;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabGrupo1: TQRLabel;
    QRDBText1: TQRDBText;
    DataSource1: TDataSource;
    Query1: TQuery;
    QRDBText3: TQRDBText;
    QRBand1: TQRBand;
    QRExpr1: TQRExpr;
    QRLabel5: TQRLabel;
    QRDBText2: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCons: TfrmCons;

implementation

{$R *.DFM}


end.

