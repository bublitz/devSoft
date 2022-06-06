unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    BitBtn1: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.BitBtn1Click(Sender: TObject);
var
  comando: string;

begin
  comando := 'c:\Arquiv~1\Borland\InterB~1\bin\isql.exe';
  if FileExists(comando) then
  begin
    comando := comando + ' -i ' + ExtractFilePath(Application.ExeName) + 'script.sql';
    WinExec(PChar(comando), SW_SHOW);
    Close;
  end
  else
    raise exception.Create('Não encontrei o InterBase 6.01');
end;

end.
