unit untDatMod;

interface

uses
  SysUtils, Classes, DBXpress, DB, SqlExpr,
  IniFiles, Provider, DBClient, DBLocal, DBLocalS, FMTBcd, QImgList;

type
  TdtMod = class(TDataModule)
    SQLCon: TSQLConnection;
    sqlMarca: TSQLClientDataSet;
    dsMarca: TDataSource;
    sqlMarcaCODIGOMARCA: TIntegerField;
    sqlMarcaDESCRICAO: TStringField;
    sqlMarcaSIGLA: TStringField;
    dsModelo: TDataSource;
    sqlModelo: TSQLClientDataSet;
    sqlModeloCODIGOMODELO: TIntegerField;
    sqlModeloCODIGOMARCA: TIntegerField;
    sqlModeloDESCRICAO: TStringField;
    sqlModeloDESCMODELO: TStringField;
    dsVeic: TDataSource;
    sqlVeic: TSQLClientDataSet;
    sqlModeloDESCCOMPLETA: TStringField;
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
    dsTAbast: TDataSource;
    sqlTAbast: TSQLClientDataSet;
    dsTManu: TDataSource;
    sqlTManu: TSQLClientDataSet;
    dsTRepar: TDataSource;
    sqlTRepar: TSQLClientDataSet;
    sqlTAbastCODIGOTIPOABAST: TIntegerField;
    sqlTAbastDESCRICAO: TStringField;
    sqlTAbastVALOR: TFloatField;
    sqlTManuCODIGOTIPOMANUT: TIntegerField;
    sqlTManuDESCRICAO: TStringField;
    sqlTManuVALOR: TFloatField;
    sqlTReparCODIGOTIPOREPARO: TIntegerField;
    sqlTReparDESCRICAO: TStringField;
    ImageList1: TImageList;
    sqlAbast: TSQLClientDataSet;
    sqlAbastCODIGOVEICULO: TIntegerField;
    sqlAbastCODIGOTIPOABAST: TIntegerField;
    sqlAbastDATA: TDateField;
    sqlAbastLITROS: TFloatField;
    sqlAbastHODOMETRO: TIntegerField;
    sqlAbastNOTAFISCAL: TStringField;
    sqlAbastVALORUNITARIO: TFloatField;
    sqlAbastVALORTOTAL: TFloatField;
    dsAbast: TDataSource;
    sqlVeicDESCCOMPLETA: TStringField;
    sqlAbastDESCVEICULO: TStringField;
    sqlAbastDESCABAST: TStringField;
    sqlManut: TSQLClientDataSet;
    dsManut: TDataSource;
    sqlManutCODIGOVEICULO: TIntegerField;
    sqlManutCODIGOTIPOMANUT: TIntegerField;
    sqlManutDATA: TDateField;
    sqlManutLITROS: TFloatField;
    sqlManutHODOMETRO: TIntegerField;
    sqlManutNOTAFISCAL: TStringField;
    sqlManutVALOR: TFloatField;
    sqlManutVALORTOTAL: TFloatField;
    sqlManutDESCVEICULO: TStringField;
    sqlManutDESCMANUT: TStringField;
    sqlReparo: TSQLClientDataSet;
    dsReparo: TDataSource;
    sqlReparoCODIGOVEICULO: TIntegerField;
    sqlReparoCODIGOTIPOREPARO: TIntegerField;
    sqlReparoDATA: TDateField;
    sqlReparoHODOMETRO: TIntegerField;
    sqlReparoNOTAFISCAL: TStringField;
    sqlReparoVALORMAO: TFloatField;
    sqlReparoVALORMAT: TFloatField;
    sqlReparoCOMPLEMENTO: TStringField;
    sqlReparoVALORTOTAL: TFloatField;
    sqlReparoDESCVEICULO: TStringField;
    sqlReparoDESCREPARO: TStringField;
    sqlTManuOLEOLUBRIFICANTE: TStringField;
    dsSeguro: TDataSource;
    dsVeicSeguro: TDataSource;
    sqlSeguro: TSQLClientDataSet;
    sqlVeicSeguro: TSQLClientDataSet;
    sqlSeguroCODIGOSEGURO: TIntegerField;
    sqlSeguroCONTATO: TStringField;
    sqlSeguroDATAINICIO: TDateField;
    sqlSeguroDATATERMINO: TDateField;
    sqlSeguroOBSERVACAO: TStringField;
    sqlSeguroSEGURADORA: TStringField;
    sqlSeguroTELEFONE: TStringField;
    sqlVeicSeguroCODIGOSEGURO: TIntegerField;
    sqlVeicSeguroCODIGOVEICULO: TIntegerField;
    sqlAbastVIAGEM: TStringField;
    sqlManutVIAGEM: TStringField;
    sqlReparoVIAGEM: TStringField;
    sqlVeicSeguroDESCVEICULO: TStringField;
    sqlVeicNaoSeg: TSQLClientDataSet;
    dsVeicNaoSeg: TDataSource;
    sqlVeicNaoSegCODIGOVEICULO: TIntegerField;
    sqlVeicNaoSegDESCVEICULO: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure sqlModeloCalcFields(DataSet: TDataSet);
    procedure sqlAbastCalcFields(DataSet: TDataSet);
    procedure sqlVeicCalcFields(DataSet: TDataSet);
    procedure sqlManutCalcFields(DataSet: TDataSet);
    procedure sqlReparoCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    TransDesc: TTransactionDesc;
    function GeraCodigo( Gen: String ): Integer;
  end;

var
  dtMod: TdtMod;

implementation

{$R *.xfm}

function TdtMod.GeraCodigo( Gen: String ): Integer;
var
  GeraCod: TSQLClientDataSet;

begin
  GeraCod := TSQLClientDataSet.Create(Self);
  GeraCod.DBConnection := SQLCon;
  GeraCod.CommandText := 'select GEN_ID('+Gen+', 1) from RDB$DATABASE';
  GeraCod.Open;
  Result := GeraCod.Fields[0].AsInteger;
end;

procedure TdtMod.DataModuleCreate(Sender: TObject);
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

procedure TdtMod.sqlModeloCalcFields(DataSet: TDataSet);
begin
  sqlModeloDESCCOMPLETA.Value := sqlModeloDESCMODELO.AsString +
                                 '/' +
                                 sqlModeloDESCRICAO.AsString;
end;

procedure TdtMod.sqlAbastCalcFields(DataSet: TDataSet);
begin
  sqlAbastVALORTOTAL.Value := sqlAbastLITROS.Value *
                              sqlAbastVALORUNITARIO.Value;
end;

procedure TdtMod.sqlVeicCalcFields(DataSet: TDataSet);
begin
  sqlVeicDESCCOMPLETA.Value := sqlVeicDESCMODELO.AsString + '-' +
                               sqlVeicDESCRICAO.AsString  + '/' +
                               sqlVeicPLACA.AsString;
end;

procedure TdtMod.sqlManutCalcFields(DataSet: TDataSet);
begin
  sqlManutVALORTOTAL.Value := sqlManutLITROS.Value *
                              sqlManutVALOR.Value;
end;

procedure TdtMod.sqlReparoCalcFields(DataSet: TDataSet);
begin
  sqlReparoVALORTOTAL.Value := sqlReparoVALORMAT.Value +
                               sqlReparoVALORMAO.Value;
end;

end.
