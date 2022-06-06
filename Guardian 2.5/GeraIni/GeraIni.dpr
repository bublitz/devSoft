program GeraIni;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  untCrypt in 'untCrypt.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
