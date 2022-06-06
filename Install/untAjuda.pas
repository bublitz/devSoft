unit untAjuda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls;

type
  TfrmAjuda = class(TForm)
    RichEdit1: TRichEdit;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAjuda: TfrmAjuda;

implementation

{$R *.dfm}

procedure TfrmAjuda.FormShow(Sender: TObject);
begin
  RichEdit1.Lines.LoadFromFile('leia-me.rtf');
end;

end.
