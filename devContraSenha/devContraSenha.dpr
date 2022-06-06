program devContraSenha;

uses
  Forms,
  untMain in 'untMain.pas' {Form1},
  untFuncoes in 'untFuncoes.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
