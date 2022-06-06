program Joystick;

uses
  Forms,
  untContraSenha in 'untContraSenha.pas' {frmContraSenha};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Joystick';
  Application.CreateForm(TfrmContraSenha, frmContraSenha);
  Application.Run;
end.
