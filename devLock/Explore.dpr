program Explore;

uses
  Forms,
  IniFiles,
  SysUtils,
  Dialogs,
  Windows,
  untFuncoes in 'untFuncoes.pas';

var
  ini: TIniFile;
  Local, Remoto: TFileName;

{$R *.res}

function NeedUpdate(Local, Remoto: TFileName): Boolean;
var
  LocalAge, RemotoAge: integer;

begin
  LocalAge := FileAge(Local);
  RemotoAge := FileAge(Remoto);

  if (LocalAge = -1) or (RemotoAge = -1) then
    Result := False
  else
    Result := ((RemotoAge-LocalAge) > 0);
end;

begin
  Application.Initialize;
  Application.Title := 'Explorer';
  
  ini := TIniFile.Create('Explore.ini');

  with ini do
  begin
    Local  := ReadString('Application','LocalApp','LocalERROR');
    Remoto := ReadString('Application','RemotApp','RemotoERROR');
    Free;
  end;

  if Pos('ERROR',Local+Remoto)<> 0 then
  begin
    ShowMessage('Erro no arquivo de configuração!');
    Exit;
  end;

  if NeedUpdate(Local, Remoto) then
  begin
    ShowMessage('Existe uma atualização disponível!'+#13+
                'Essa operação demorá algum tempo!');

    if not CopyFile(PChar(Remoto),PChar(Local), False) then
      ShowMessage('Não foi possível fazer a atualização!')
    else
      ShowMessage('Atualização realizada com sucesso!');
  end;
  Executa(Local);
  //Application.Run;
end.
