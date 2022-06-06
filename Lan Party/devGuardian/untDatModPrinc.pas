unit untDatModPrinc;

interface

uses
  SysUtils, Classes, DBXpress, DB, SqlExpr, ImgList, Controls, Provider,
  DBClient, DBLocal, DBLocalS, IniFiles, Forms;

type
  TdmPrinc = class(TDataModule)
    SQLConLocal: TSQLConnection;
    SQLConRemoto: TSQLConnection;
    imgList: TImageList;
    sqlEstacao: TSQLClientDataSet;
    dsEstacao: TDataSource;
    sqlEstacaoCODIGOESTACAO: TIntegerField;
    sqlEstacaoDESCRICAO: TStringField;
    sqlEstacaoESTADO: TStringField;
    sqlEstacaoIP: TStringField;
    sqlEstacaoNETNAME: TStringField;
    dsMovim: TDataSource;
    sqlMovim: TSQLClientDataSet;
    sqlMovimCODIGOESTACAO: TIntegerField;
    sqlMovimCODIGOCLIENTE: TIntegerField;
    sqlMovimDATA: TDateField;
    sqlMovimHORA: TTimeField;
    sqlMovimHORAS: TFloatField;
    sqlMovimVALORUNITARIO: TFloatField;
    sqlMovimTIPO: TStringField;
    sqlMovimTEMPOESTIMADO: TFloatField;
    dsClientes: TDataSource;
    sqlClientes: TSQLClientDataSet;
    sqlClientesCODIGOLOJA: TIntegerField;
    sqlClientesCODIGOCLIENTE: TIntegerField;
    sqlClientesNOMECOMPLETO: TStringField;
    sqlClientesNICKNAME: TStringField;
    sqlClientesENDERECO: TStringField;
    sqlClientesBAIRRO: TStringField;
    sqlClientesCIDADE: TStringField;
    sqlClientesUF: TStringField;
    sqlClientesCEP: TStringField;
    sqlClientesCPF: TStringField;
    sqlClientesRG: TStringField;
    sqlClientesDATANASCTO: TDateField;
    sqlClientesDATACADASTRO: TDateField;
    sqlClientesFONE1: TStringField;
    sqlClientesFONE2: TStringField;
    sqlClientesINDICACAO: TIntegerField;
    sqlClientesQUANT_INDICACAO: TIntegerField;
    sqlClientesE_MAIL: TStringField;
    sqlClientesRECEBEPROMOCAO: TStringField;
    sqlClientesRECEBEMILHAGEM: TStringField;
    sqlClientesCODIGOINTERNO: TStringField;
    sqlClientesNOMEMAE: TStringField;
    sqlClientesNOMELOGIN: TStringField;
    sqlClientesSENHALOGIN: TStringField;
    sqlClientesLIMITEDIAS: TIntegerField;
    sqlClientesLIMITEVALOR: TFloatField;
    sqlClientesHORASANTECIP: TFloatField;
    sqlClientesVALIDADEANTECIP: TDateField;
    sqlClientesHORASMILHAGEM: TFloatField;
    sqlClientesVALIDADEMILHAGEM: TDateField;
    sqlClientesBONUS: TFloatField;
    sqlClientesVALIDADEBONUS: TDateField;
    sqlClientesSALDO: TFloatField;
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
  GeraCod.CommandText := 'select cast(GEN_ID('+Gen+', 1) as integer) codigo from RDB$DATABASE';
  GeraCod.Open;
  Result := GeraCod.FieldByName('codigo').AsInteger;
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
var
  arqini: TIniFile;
  bancolocal, bancoremoto, ip, bancoalter: string;

begin
  arqini := TIniFile.Create(ExtractFilePath(Application.ExeName)+'devsoft.ini');
  bancolocal  := arqini.ReadString('DBLocal', 'Path', '?');
  ip          := arqini.ReadString('DBRemoto', 'IP', '?');
  bancoremoto := arqini.ReadString('DBRemoto', 'Path', '?');
  bancoalter  := arqini.ReadString('DBRemoto', 'Alter', '?');
  arqini.Free;

  SQLConLocal.Params.Values['Database'] := bancolocal+'devsoft.gdb';
  SQLConLocal.Connected := True;

  SQLConRemoto.Params.Values['Database'] := ip + ':' + bancoremoto+'devsoft.gdb';
  try
    SQLConRemoto.Connected := true;
  except
    SQLConRemoto.Params.Values['Database'] := bancoalter+'devsoft.gdb';
    SQLConRemoto.Connected := true;
  end;
  TransDesc.TransactionID := 1;
  TransDesc.IsolationLevel := xilREADCOMMITTED;
end;

end.

