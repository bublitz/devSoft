program WinExplorer;

uses
  Forms,
  Windows,
  untMain in 'untMain.pas' {frmMain},
  untIncIcon in 'untIncIcon.pas' {frmIncIcon},
  untDatMod in 'untDatMod.pas' {dtMod: TDataModule},
  untFuncoes in 'untFuncoes.pas',
  Sobre in 'Sobre.pas' {AboutBox},
  untContraSenha in 'untContraSenha.pas' {frmContraSenha};

{$R *.res}
var
  HprevHist : HWND;

begin
  Application.Initialize;
  HprevHist := FindWindow(Nil, PChar('Gerenciador de Jogos'));
  if HprevHist = 0 then
  begin
    Application.Title := 'Gerenciador de Jogos';
    Application.CreateForm(TfrmMain, frmMain);
    Application.CreateForm(TfrmIncIcon, frmIncIcon);
    Application.CreateForm(TdtMod, dtMod);
    Application.CreateForm(TAboutBox, AboutBox);
    Application.CreateForm(TfrmContraSenha, frmContraSenha);
    Application.Run;
  end;
end.
