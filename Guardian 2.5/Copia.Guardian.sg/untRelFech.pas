unit untRelFech;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls;

type
  TfrmRelFech = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRBand3: TQRBand;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    SummaryBand1: TQRBand;
    QRLabel6: TQRLabel;
    QRExpr3: TQRExpr;
    QRExpr2: TQRExpr;
    QRLabel8: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText5: TQRDBText;
    PageFooterBand1: TQRBand;
    QRCopy: TQRLabel;
    QRLabel10: TQRLabel;
    QRSysData1: TQRSysData;
    QRDBText6: TQRDBText;
    procedure QRDBText2Print(sender: TObject; var Value: String);
    procedure QRDBText3Print(sender: TObject; var Value: String);
    procedure QRDBText5Print(sender: TObject; var Value: String);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelFech: TfrmRelFech;

implementation

uses untDtMod;

{$R *.DFM}

procedure TfrmRelFech.QRDBText2Print(sender: TObject; var Value: String);
begin
  if dtMod.qrRelFechENTRADA.Value = 0 then value := '';
end;

procedure TfrmRelFech.QRDBText3Print(sender: TObject; var Value: String);
begin
  if dtMod.qrRelFechSAIDA.Value = 0 then value := '';
end;

procedure TfrmRelFech.QRDBText5Print(sender: TObject; var Value: String);
begin
  if dtMod.qrRelFechSALDO.Value = 0 then value := '';
end;

procedure TfrmRelFech.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
