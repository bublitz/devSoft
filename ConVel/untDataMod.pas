unit untDataMod;

interface

uses
  SysUtils, Classes, DBXpress, DB, SqlExpr;

type
  TdataMod = class(TDataModule)
    SQLConnection1: TSQLConnection;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dataMod: TdataMod;

implementation

uses untDatMod;

{$R *.dfm}

end.
