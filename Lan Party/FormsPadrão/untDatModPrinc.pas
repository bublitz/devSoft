unit untDatModPrinc;

interface

uses
  SysUtils, Classes, DBXpress, DB, SqlExpr, ImgList, Controls, Provider,
  DBClient, DBLocal, DBLocalS;

type
  TdmPrinc = class(TDataModule)
    SQLConLocal: TSQLConnection;
    SQLConRemoto: TSQLConnection;
    imgList: TImageList;
    SQLClientDataSet1: TSQLClientDataSet;
    DataSource1: TDataSource;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    TransDesc: TTransactionDesc;
    function GeraCodigoLocal(Gen: String): Integer;
    function GeraCodigoRemoto(Gen: String): Integer;
  end;

var
  dmPrinc: TdmPrinc;

implementation

{$R *.dfm}

function TdmPrinc.GeraCodigoLocal(Gen: String): Integer;
var
  GeraCod: TSQLClientDataSet;

begin
  GeraCod := TSQLClientDataSet.Create(Self);
  GeraCod.DBConnection := SQLConLocal;
  GeraCod.CommandText := 'select GEN_ID('+Gen+', 1) from RDB$DATABASE';
  GeraCod.Open;
  Result := GeraCod.Fields[0].AsInteger;
end;

function TdmPrinc.GeraCodigoRemoto(Gen: String): Integer;
var
  GeraCod: TSQLClientDataSet;

begin
  GeraCod := TSQLClientDataSet.Create(Self);
  GeraCod.DBConnection := SQLConRemoto;
  GeraCod.CommandText := 'select GEN_ID('+Gen+', 1) from RDB$DATABASE';
  GeraCod.Open;
  Result := GeraCod.Fields[0].AsInteger;
end;


procedure TdmPrinc.DataModuleCreate(Sender: TObject);
//var
//  arqini: TIniFile;
//  banco: string;
begin
  //arqini := TIniFile.Create('convel.ini');
  //banco := arqini.ReadString('Params','Banco','-');
  //arqini.Free;
  //SQLCon.Params.Values['Database'] := banco;
  //SQLCon.Connected := True;
  TransDesc.TransactionID := 1;
  TransDesc.IsolationLevel := xilREADCOMMITTED;
end;

end.

