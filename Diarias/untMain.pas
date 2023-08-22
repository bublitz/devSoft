unit untMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TfrmMain = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses untCons;

{$R *.DFM}

procedure TfrmMain.Button1Click(Sender: TObject);
begin
   frmCons.Query1.Open;
   frmCons.QRepCons.Preview;
   frmCons.Query1.Close;
end;

end.
