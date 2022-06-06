unit untDatModRelat;

interface

uses
  SysUtils, Classes, DBXpress, Provider, SqlExpr, DB, DBClient, DBLocal,
  DBLocalS, IniFiles;

type
  TdmPrinc = class(TDataModule)
    SQLCon: TSQLConnection;
    sqlMarca: TSQLClientDataSet;
    sqlMarcaCODIGOMARCA: TIntegerField;
    sqlMarcaDESCRICAO: TStringField;
    sqlMarcaSIGLA: TStringField;
    dsMarca: TDataSource;
    dsModelo: TDataSource;
    sqlModelo: TSQLClientDataSet;
    sqlModeloCODIGOMODELO: TIntegerField;
    sqlModeloCODIGOMARCA: TIntegerField;
    sqlModeloDESCRICAO: TStringField;
    sqlModeloDESCMODELO: TStringField;
    sqlModeloDESCCOMPLETA: TStringField;
    dsVeic: TDataSource;
    sqlVeic: TSQLClientDataSet;
    sqlVeicCODIGOVEICULO: TIntegerField;
    sqlVeicCODIGOMODELO: TIntegerField;
    sqlVeicDESCRICAO: TStringField;
    sqlVeicANO: TIntegerField;
    sqlVeicPLACA: TStringField;
    sqlVeicUF: TStringField;
    sqlVeicULTIMATROCA: TIntegerField;
    sqlVeicLITROSCARTER: TFloatField;
    sqlVeicLITROSFILTRO: TFloatField;
    sqlVeicPROXIMATROCA: TIntegerField;
    sqlVeicTROCACOMFILTRO: TStringField;
    sqlVeicDESCMODELO: TStringField;
    sqlVeicDESCCOMPLETA: TStringField;
    procedure sqlModeloCalcFields(DataSet: TDataSet);
    procedure sqlVeicCalcFields(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    TransDesc: TTransactionDesc;
  end;

var
  dmPrinc: TdmPrinc;

implementation

{$R *.dfm}

procedure TdmPrinc.sqlModeloCalcFields(DataSet: TDataSet);
begin
  sqlModeloDESCCOMPLETA.Value := sqlModeloDESCMODELO.AsString +
                                 '/' +
                                 sqlModeloDESCRICAO.AsString;
end;

procedure TdmPrinc.sqlVeicCalcFields(DataSet: TDataSet);
begin
  sqlVeicDESCCOMPLETA.Value := sqlVeicDESCMODELO.AsString + '-' +
                               sqlVeicDESCRICAO.AsString  + '/' +
                               sqlVeicPLACA.AsString;
end;

procedure TdmPrinc.DataModuleCreate(Sender: TObject);
var
  arqini: TIniFile;
  banco: string;

begin
  arqini := TIniFile.Create('convel.ini');
  banco := arqini.ReadString('Params','Banco','-');
  arqini.Free;
  SQLCon.Params.Values['Database'] := banco;
  SQLCon.Connected := True;
  TransDesc.TransactionID := 1;
  TransDesc.IsolationLevel := xilREADCOMMITTED;
end;

end.
