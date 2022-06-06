unit untZoom;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls;

type
  TfrmZoom = class(TForm)
    Image1: TImage;
    procedure Image1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmZoom: TfrmZoom;

implementation

{$R *.DFM}

procedure TfrmZoom.Image1Click(Sender: TObject);
begin
  CLose;
end;

end.
