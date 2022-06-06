unit untDatModPrinc;

interface

uses
  SysUtils, Classes, DBXpress, DB, SqlExpr, ImgList, Controls, Provider,
  DBClient, DBLocal, DBLocalS, IniFiles, Forms;

type
  TdmPrinc = class(TDataModule)
    SQLCon: TSQLConnection;
    imgList: TImageList;
    sqlReceber: TSQLClientDataSet;
    dsReceber: TDataSource;
    sqlPlanoConta: TSQLClientDataSet;
    dsPlanoConta: TDataSource;
    sqlPlanoContaCODIGO: TIntegerField;
    sqlPlanoContaDESCRICAO: TStringField;
    sqlPlanoContaTIPO: TStringField;
    sqlPlanoContaCODIGOCONTABIL: TStringField;
    sqlReceberCODIGO: TIntegerField;
    sqlReceberCODIGOCLIENTE: TIntegerField;
    sqlReceberDATAEMISSAO: TSQLTimeStampField;
    sqlReceberDATAVENCTO: TSQLTimeStampField;
    sqlReceberVALOR: TFloatField;
    sqlReceberCONTACONTABIL: TIntegerField;
    sqlReceberHISTORICO: TStringField;
    sqlReceberCODIGOFORMARECEBIMNETO: TIntegerField;
    sqlReceberDATABAIXA: TSQLTimeStampField;
    sqlReceberTIPODESCTO: TStringField;
    sqlReceberDESCONTO: TFloatField;
    sqlReceberTIPOJUROS: TStringField;
    sqlReceberJUROS: TFloatField;
    sqlReceberVALORPAGO: TFloatField;
    sqlReceberNOMECONTA: TStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    TransDesc: TTransactionDesc;
    function GeraCodigo(Gen: String): Integer;
  end;

var
  dmPrinc: TdmPrinc;

implementation

{$R *.dfm}

function TdmPrinc.GeraCodigo(Gen: String): Integer;
var
  GeraCod: TSQLClientDataSet;

begin
  GeraCod := TSQLClientDataSet.Create(Self);
  GeraCod.DBConnection := SQLCon;
  GeraCod.CommandText := 'select GEN_ID('+Gen+', 1) from RDB$DATABASE';
  GeraCod.Open;
  Result := GeraCod.Fields[0].AsInteger;
end;

procedure TdmPrinc.DataModuleCreate(Sender: TObject);
var
  arqini: TIniFile;
  banco: string;

begin
  arqini := TIniFile.Create(ExtractFilePath(Application.ExeName)+'devsoft.ini');
  banco := arqini.ReadString('Params','Banco','-');
  arqini.Free;
  SQLCon.Params.Values['Database'] := banco;
  SQLCon.Connected := True;
  TransDesc.TransactionID := 1;
  TransDesc.IsolationLevel := xilREADCOMMITTED;
end;

end.

