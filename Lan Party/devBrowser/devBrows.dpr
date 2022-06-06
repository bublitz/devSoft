program devBrows;

uses
  Forms,
  Main in 'Main.pas' {MainForm},
  Sobre in 'Sobre.pas' {AboutBox};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'devBrowser 1.0';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.Run;
end.
