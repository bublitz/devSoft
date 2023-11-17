unit untDM;

interface

uses
  SysUtils, Classes, WideStrings, DB, SqlExpr, IniFiles, Forms, Dialogs, FMTBcd,
  DBClient, Provider;

type
  TDM = class(TDataModule)
    cdsData: TClientDataSet;
    cdsDataDATA: TDateTimeField;
    cdsDataSENHA_ATUAL: TIntegerField;
    cdsDataTIPO: TStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

uses untMain;

{$R *.dfm}

procedure TDM.DataModuleCreate(Sender: TObject);
var
  ini: TIniFile;
  path, arquivo: string;
  porta: integer;

begin
  path := ExtractFilePath(Application.ExeName);
  ini := TIniFile.Create(path + 'Params.ini');
  porta := ini.ReadInteger('Config', 'Porta', 3000);
  ini.Free;
  frmMain.Server.Port := porta;

  path := ExtractFilePath(Application.ExeName);
  ini := TIniFile.Create(path + 'Params.ini');
  arquivo := ini.ReadString('Config', 'PathXML', '??');
  porta := ini.ReadInteger('Config', 'Porta', 3000);
  ini.Free;
  frmMain.Server.Port := porta;
  if arquivo = '??' then
    arquivo := path + 'banco\atende.xml';
  cdsData.FileName := arquivo;
  cdsData.LoadFromFile(arquivo);
  try
    cdsData.Open;
  except
    on e:exception do
    begin
      ShowMessage('Erro ao conectar ao banco: ' + e.Message + #13 + arquivo);
      Application.Terminate;
    end;
  end;
end;

end.
