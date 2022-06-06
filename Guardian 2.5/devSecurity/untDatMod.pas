unit untDatMod;

interface

uses
  SysUtils, Classes, DB, DBClient, DBTables, Forms;

type
  TdtMod = class(TDataModule)
    dsLocal: TDataSource;
    Local: TTable;
    LocalNome: TStringField;
    LocalIcone: TStringField;
    LocalMSDOS: TStringField;
    LocalAtalho: TStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtMod: TdtMod;

implementation

{$R *.dfm}

procedure TdtMod.DataModuleCreate(Sender: TObject);
begin
  Local.DatabaseName := 'c:\windows';
  Local.TableName := 'icones.db';
  Local.Open;
end;

end.
