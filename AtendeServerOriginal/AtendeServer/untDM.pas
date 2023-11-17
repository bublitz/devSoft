unit untDM;

interface

uses
  SysUtils, Classes, WideStrings, DB, SqlExpr, IniFiles, Forms, Dialogs, FMTBcd,
  DBClient, Provider;

type
  TDM = class(TDataModule)
    AtendeTRE: TSQLConnection;
    sqlAtend: TSQLDataSet;
    sqlData: TSQLDataSet;
    sqlAtendESTACAO: TStringField;
    sqlAtendFINAL: TSQLTimeStampField;
    sqlAtendINICIO: TSQLTimeStampField;
    sqlAtendNUMERO: TIntegerField;
    sqlAtendSENHA: TIntegerField;
    sqlAtendUSUARIO: TStringField;
    dspData: TDataSetProvider;
    dspAtend: TDataSetProvider;
    cdsData: TClientDataSet;
    cdsAtend: TClientDataSet;
    cdsAtendNUMERO: TIntegerField;
    cdsAtendESTACAO: TStringField;
    cdsAtendFINAL: TSQLTimeStampField;
    cdsAtendINICIO: TSQLTimeStampField;
    cdsAtendSENHA: TIntegerField;
    cdsAtendUSUARIO: TStringField;
    cdsDataDATA: TDateField;
    cdsDataSENHA_ATUAL: TIntegerField;
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
  path, banco: string;
  porta: integer;

begin
  path := ExtractFilePath(Application.ExeName);
  ini := TIniFile.Create(path + 'Params.ini');
  banco := ini.ReadString('Config', 'PathFDB', '??');
  porta := ini.ReadInteger('Config', 'Porta', 3000);
  ini.Free;
  frmMain.Server.Port := porta;
  if banco = '??' then
    banco := 'localhost:' + path + 'banco\atende.fdb';
  AtendeTRE.Params.Values['Database'] := banco;
  try
    AtendeTRE.Open;
  except
    ShowMessage('Erro ao conectar ao banco...'#13 + banco);
    Application.Terminate;
  end;
  cdsData.Open;
  cdsAtend.Open;
end;

end.
