unit untPreview;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ImgList, QRPrntr, Buttons, ToolWin;

type
  TfrmPreview = class(TForm)
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    SpeedButton1: TSpeedButton;
    QRPrev: TQRPreview;
    ImageList1: TImageList;
    StatusBar1: TStatusBar;
    ToolButton10: TToolButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
    procedure ToolButton7Click(Sender: TObject);
    procedure ToolButton8Click(Sender: TObject);
    procedure ToolButton10Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPreview: TfrmPreview;

implementation

{$R *.DFM}

procedure TfrmPreview.SpeedButton1Click(Sender: TObject);
begin
   Close;
end;

procedure TfrmPreview.ToolButton1Click(Sender: TObject);
begin
   Application.ProcessMessages;
   QRPrev.ZoomToFit;
end;

procedure TfrmPreview.ToolButton2Click(Sender: TObject);
begin
   Application.ProcessMessages;
   QRPrev.Zoom := 100;
end;

procedure TfrmPreview.ToolButton3Click(Sender: TObject);
begin
   Application.ProcessMessages;
   QRPrev.ZoomToWidth;
end;

procedure TfrmPreview.ToolButton5Click(Sender: TObject);
begin
   Application.ProcessMessages;
   QRPrev.PageNumber := 1;
end;

procedure TfrmPreview.ToolButton6Click(Sender: TObject);
begin
   Application.ProcessMessages;
   QRPrev.PageNumber := QRPrev.PageNumber - 1;
end;

procedure TfrmPreview.ToolButton7Click(Sender: TObject);
begin
   Application.ProcessMessages;
   QRPrev.PageNumber := QRPrev.PageNumber + 1;
end;

procedure TfrmPreview.ToolButton8Click(Sender: TObject);
begin
   Application.ProcessMessages;
   QRPrev.PageNumber := QRPrev.QRPrinter.PageCount;
end;

procedure TfrmPreview.ToolButton10Click(Sender: TObject);
begin
   QRPrev.QRPrinter.Print;
end;

end.
