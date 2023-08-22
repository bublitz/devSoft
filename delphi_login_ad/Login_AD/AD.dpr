program AD;

uses
  Forms,
  uAD in 'uAD.pas' {frmLogin},
  adshlp in '..\Libs AD\adshlp.pas',
  ActiveDs_TLB in '..\Libs AD\ActiveDs_TLB.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.Run;
end.
