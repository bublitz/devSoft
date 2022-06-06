unit untIncTempo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, StdCtrls, RxLogin, Buttons;

type
  TfrmIncTempo = class(TForm)
    Label2: TLabel;
    DBText2: TDBText;
    Label1: TLabel;
    cboxTempo: TComboBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label3: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmIncTempo: TfrmIncTempo;

implementation

{$R *.DFM}

procedure TfrmIncTempo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
