unit untReport;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, QuickRpt, QRExport, StdCtrls, RXSpin;

type
  TfrmReport = class(TForm)
    SBtnImp: TSpeedButton;
    SBtnVis: TSpeedButton;
    SBtnFechar: TSpeedButton;
    Label1: TLabel;
    RxSpinEdit1: TRxSpinEdit;
    procedure SBtnImpClick(Sender: TObject);
    procedure SBtnVisClick(Sender: TObject);
    procedure SBtnFecharClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Report: TQuickRep;
  end;

var
  frmReport: TfrmReport;

implementation

{$R *.DFM}

procedure TfrmReport.SBtnImpClick(Sender: TObject);
begin
   Report.Prepare;
   Report.PrinterSetup;
   Report.PrintBackground;
end;

procedure TfrmReport.SBtnVisClick(Sender: TObject);
begin
   Report.Prepare;
   Report.Preview;
end;

procedure TfrmReport.SBtnFecharClick(Sender: TObject);
begin
   frmReport.Close ;
end;

procedure TfrmReport.SpeedButton1Click(Sender: TObject);
begin
   Report.Prepare;
   Report.ExportToFilter(TQRXLSFilter.Create('c:\temp\teste.xls'));
end;

end.
