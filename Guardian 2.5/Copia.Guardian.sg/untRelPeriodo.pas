unit untRelPeriodo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls;

type
  TfrmRelPeriodo = class(TForm)
    QuickRep1: TQuickRep;
    QRBand4: TQRBand;
    QRLabel3: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel11: TQRLabel;
    QRBand5: TQRBand;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRBand6: TQRBand;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    FooterGroup: TQRBand;
    QRExpr6: TQRExpr;
    QRLabel16: TQRLabel;
    QRExpr7: TQRExpr;
    PageFooterBand1: TQRBand;
    QRCopy: TQRLabel;
    QRLabel18: TQRLabel;
    QRSysData1: TQRSysData;
    QRGroup2: TQRGroup;
    QRLabel19: TQRLabel;
    QRDBText12: TQRDBText;
    QRBand1: TQRBand;
    QRExpr1: TQRExpr;
    QRLabel1: TQRLabel;
    QRExpr2: TQRExpr;
    QRLabel2: TQRLabel;
    QRDBText1: TQRDBText;
    procedure QRDBText2Print(sender: TObject; var Value: String);
    procedure QRDBText3Print(sender: TObject; var Value: String);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelPeriodo: TfrmRelPeriodo;

implementation

uses untDtMod;

{$R *.DFM}

procedure TfrmRelPeriodo.QRDBText2Print(sender: TObject; var Value: String);
begin
  if dtMod.qrRelFechENTRADA.Value = 0 then value := '';
end;

procedure TfrmRelPeriodo.QRDBText3Print(sender: TObject; var Value: String);
begin
  if dtMod.qrRelFechSAIDA.Value = 0 then value := '';
end;

procedure TfrmRelPeriodo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
