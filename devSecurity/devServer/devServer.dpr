program devServer;

uses
  Forms,
  untMain in 'untMain.pas' {Form1},
  Sobre in 'Sobre.pas' {AboutBox},
  untDatMod in 'untDatMod.pas' {dtMod: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.CreateForm(TdtMod, dtMod);
  Application.Run;
end.
