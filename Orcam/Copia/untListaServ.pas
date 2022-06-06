unit untListaServ;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt;

type
  TrptListaServ = class(TForm)
    QRepServ: TQuickRep;
    procedure QRepServPreview(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rptListaServ: TrptListaServ;

implementation

uses untPreview;

{$R *.DFM}

procedure TrptListaServ.QRepServPreview(Sender: TObject);
begin
   frmPreview.QRPrev.QRPrinter := QRepServ.QRPrinter;
   frmPreview.WindowState := wsMaximized;
   frmPreview.Show;
end;

end.
