unit untAutores;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, RXCtrls;

type
  TfrmAutor = class(TForm)
    BitBtn1: TBitBtn;
    SPan: TSecretPanel;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAutor: TfrmAutor;

implementation

{$R *.DFM}

procedure TfrmAutor.BitBtn1Click(Sender: TObject);
begin
   frmAutor.Close;
end;

procedure TfrmAutor.FormActivate(Sender: TObject);
begin
  SPan.Active := True;
end;

procedure TfrmAutor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SPan.Active := False;
end;

end.
