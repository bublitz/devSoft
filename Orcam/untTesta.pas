unit untTesta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TfrmTesta = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    Button1: TButton;
    Edit2: TEdit;
    Edit3: TEdit;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTesta: TfrmTesta;

implementation

uses untCalculo;

{$R *.DFM}

procedure TfrmTesta.Button1Click(Sender: TObject);
var ls, bdi: real;
begin
ls  := StrToFloat( Edit2.Text);
bdi := StrToFloat( Edit3.Text);
Label1.Caption := FloatToStr( CalcServico( Edit1.Text, ls, bdi, True ) );
end;

end.
