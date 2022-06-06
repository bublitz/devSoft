library AdmServer;

uses
  ComServ,
  AdmServer_TLB in 'AdmServer_TLB.pas',
  untDM in 'untDM.pas' {DM: TMtsDataModule} {DM: CoClass};

exports
  DllGetClassObject,
  DllCanUnloadNow,
  DllRegisterServer,
  DllUnregisterServer;

{$R *.TLB}

{$R *.RES}

begin
end.                                                                                                                                                                                                                                                                                            
