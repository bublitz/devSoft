unit untMainShell;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, IniFiles;

type
  TfrmMain = class(TForm)
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    BitBtn1: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ini: TIniFile;
    senha, pathcomp: string;
    LocApp, RemApp, LocRep, RemRep: TFileName;
    Cadastro, Relatorio: TFileName;
  end;

var
  frmMain: TfrmMain;

const
  SK = 1;
  MK = 2;
  AK = 2;

implementation

uses untFuncoes;

{$R *.dfm}

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

procedure TfrmMain.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmMain.SpeedButton1Click(Sender: TObject);
begin
  Screen.Cursor := crAppStart;
  Update;
  ExecAndWait(PChar(Cadastro), '', SW_SHOW);
  Screen.Cursor := crDefault;
end;

procedure TfrmMain.SpeedButton2Click(Sender: TObject);
begin
  Screen.Cursor := crAppStart;
  Update;
  ExecAndWait(PChar(Relatorio), '', SW_SHOW);
  Screen.Cursor := crDefault;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  ini := TIniFile.Create('Convel.ini');

  with ini do
  begin
    senha  := ReadString('Application', 'CompPass', '');
    senha  := EncryptSTR(senha, Sk, MK, AK);
    LocApp := ReadString('Application', 'LocalApp', 'LocalERROR');
    RemApp := ReadString('Application', 'RemotApp', 'RemotoERROR');
    LocRep := ReadString('Application', 'LocalRep', 'ReportERROR');
    RemRep := ReadString('Application', 'RemotRep', 'ReportERROR');
    Free;
  end;

  if Pos('ERROR', LocApp+RemApp+LocRep+RemRep) <> 0 then
    ShowMessage('Erro no arquivo de configuração!');

  pathcomp := ExtractFilePath(RemApp);

  if compart(PChar(pathcomp), PChar(senha), nil) then
  begin
    if NeedUpdate(LocApp, RemApp) or
       NeedUpdate(LocRep, RemRep) then
    begin
      ShowMessage('Existem uma ou mais atualizações disponíveis!'#13+
                  'Essa operação demorá algum tempo!');

      if NeedUpdate(LocApp, RemApp) then
      begin
        if not CopyFile(PChar(RemApp), PChar(LocApp), False) then
          ShowMessage('Não foi possível fazer a atualização! - Cadastro')
        else
          ShowMessage('Atualização realizada com sucesso! - Cadastro');
      end;

      if NeedUpdate(LocRep, RemRep) then
      begin
        if not CopyFile(PChar(RemRep), PChar(LocRep), False) then
          ShowMessage('Não foi possível fazer a atualização! - Relatórios')
        else
          ShowMessage('Atualização realizada com sucesso! - Relatórios');
      end;
    end;
  end;
  Cadastro  := LocApp;
  Relatorio := LocRep;
end;

end.
