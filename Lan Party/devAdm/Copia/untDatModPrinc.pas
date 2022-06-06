unit untDatModPrinc;

interface

uses
  SysUtils, Classes, DBXpress, DB, SqlExpr, ImgList, Controls, Provider,
  DBClient, DBLocal, DBLocalS, Forms, IniFiles;

type
  TdmPrinc = class(TDataModule)
    SQLConLocal: TSQLConnection;
    SQLConRemoto: TSQLConnection;
    imgList: TImageList;
    sqlEstacao: TSQLClientDataSet;
    dsEstacao: TDataSource;
    sqlLog: TSQLClientDataSet;
    dsLog: TDataSource;
    sqlPreco: TSQLClientDataSet;
    dsPreco: TDataSource;
    sqlListaEspera: TSQLClientDataSet;
    dsListaEspera: TDataSource;
    sqlPromocoes: TSQLClientDataSet;
    dsPromocoes: TDataSource;
    sqlEmail: TSQLClientDataSet;
    dsEmail: TDataSource;
    sqlLoja: TSQLClientDataSet;
    dsLoja: TDataSource;
    sqlUsuario: TSQLClientDataSet;
    dsUsuario: TDataSource;
    sqlCliente: TSQLClientDataSet;
    dsCliente: TDataSource;
    sqlMovim: TSQLClientDataSet;
    dsMovim: TDataSource;
    sqlFeriado: TSQLClientDataSet;
    dsFeriado: TDataSource;
    sqlEstacaoCODIGOESTACAO: TIntegerField;
    sqlEstacaoCODIGOLOJA: TIntegerField;
    sqlEstacaoDESCRICAO: TStringField;
    sqlEstacaoESTADO: TStringField;
    sqlEstacaoIP: TStringField;
    sqlEstacaoNETNAME: TStringField;
    sqlLojaCODIGOLOJA: TIntegerField;
    sqlLojaRAZAOSOCIAL: TStringField;
    sqlLojaNOMEFANTASIA: TStringField;
    sqlLojaENDERECO: TStringField;
    sqlLojaBAIRRO: TStringField;
    sqlLojaCIDADE: TStringField;
    sqlLojaUF: TStringField;
    sqlLojaCEP: TStringField;
    sqlLojaFONE1: TStringField;
    sqlLojaFONE2: TStringField;
    sqlLojaCNPJ: TStringField;
    sqlLojaE_MAIL: TStringField;
    sqlUsuarioCODIGOLOJA: TIntegerField;
    sqlUsuarioCODIGOUSUARIO: TIntegerField;
    sqlUsuarioCORTESIA: TIntegerField;
    sqlUsuarioDATAALTERASENHA: TDateField;
    sqlUsuarioDESCTOMAXIMO: TFloatField;
    sqlUsuarioDIREITOS: TStringField;
    sqlUsuarioNOMECOMPLETO: TStringField;
    sqlUsuarioNOMELOGIN: TStringField;
    sqlUsuarioSENHA: TStringField;
    sqlPrecoDIASEMANA: TIntegerField;
    sqlPrecoSOCIO15: TFloatField;
    sqlPrecoSOCIO30: TFloatField;
    sqlPrecoSOCIO60: TFloatField;
    sqlListaEsperaSEQUENCIA: TIntegerField;
    sqlListaEsperaCODIGOCLIENTE: TIntegerField;
    sqlPromocoesBONUS: TIntegerField;
    sqlPromocoesCODIGOPROMOCAO: TIntegerField;
    sqlPromocoesDATAFINAL: TDateField;
    sqlPromocoesDATAINICIAL: TDateField;
    sqlPromocoesDESCRICAO: TStringField;
    sqlPromocoesPANFLETOFINAL: TIntegerField;
    sqlPromocoesPANFLETOINICIAL: TIntegerField;
    sqlClienteCODIGOLOJA: TIntegerField;
    sqlClienteCODIGOCLIENTE: TIntegerField;
    sqlClienteNOMECOMPLETO: TStringField;
    sqlClienteNICKNAME: TStringField;
    sqlClienteENDERECO: TStringField;
    sqlClienteBAIRRO: TStringField;
    sqlClienteCIDADE: TStringField;
    sqlClienteUF: TStringField;
    sqlClienteCEP: TStringField;
    sqlClienteCPF: TStringField;
    sqlClienteRG: TStringField;
    sqlClienteDATANASCTO: TDateField;
    sqlClienteDATACADASTRO: TDateField;
    sqlClienteFONE1: TStringField;
    sqlClienteFONE2: TStringField;
    sqlClienteINDICACAO: TIntegerField;
    sqlClienteQUANT_INDICACAO: TIntegerField;
    sqlClienteE_MAIL: TStringField;
    sqlClienteRECEBEPROMOCAO: TStringField;
    sqlClienteRECEBEMILHAGEM: TStringField;
    sqlClienteCODIGOINTERNO: TStringField;
    sqlClienteNOMEMAE: TStringField;
    sqlClienteNOMELOGIN: TStringField;
    sqlClienteSENHALOGIN: TStringField;
    sqlClienteLIMITEDIAS: TIntegerField;
    sqlClienteLIMITEVALOR: TFloatField;
    sqlClienteHORASANTECIP: TFloatField;
    sqlClienteVALIDADEANTECIP: TDateField;
    sqlClienteHORASMILHAGEM: TFloatField;
    sqlClienteVALIDADEMILHAGEM: TDateField;
    sqlClienteBONUS: TFloatField;
    sqlClienteVALIDADEBONUS: TDateField;
    sqlClienteSALDO: TFloatField;
    sqlMovimCODIGOESTACAO: TIntegerField;
    sqlMovimCODIGOCLIENTE: TIntegerField;
    sqlMovimDATA: TDateField;
    sqlMovimHORA: TTimeField;
    sqlMovimHORAS: TFloatField;
    sqlMovimTIPO: TStringField;
    sqlMovimVALORUNITARIO: TFloatField;
    dsPesqCliente: TDataSource;
    sqlPesqCliente: TSQLClientDataSet;
    sqlPesqClienteCODIGOLOJA: TIntegerField;
    sqlPesqClienteCODIGOCLIENTE: TIntegerField;
    sqlPesqClienteNOMECOMPLETO: TStringField;
    sqlPesqClienteNICKNAME: TStringField;
    sqlMovimNickCliente: TStringField;
    sqlClienteNomePesq: TStringField;
    dsLogCli: TDataSource;
    sqlLogCli: TSQLClientDataSet;
    sqlLogCliCODIGOLOJA: TIntegerField;
    sqlLogCliCODIGOCLIENTE: TIntegerField;
    sqlLogCliDATA: TDateField;
    sqlLogCliACAO: TIntegerField;
    sqlLogCliQUANTIDADE: TFloatField;
    sqlLogCliVALIDADE: TDateField;
    sqlMovimCODIGOLOJA: TIntegerField;
    sqlMovimTEMPOESTIMADO: TFloatField;
    sqlFeriadoDESCRICAO: TStringField;
    sqlFeriadoDIA: TIntegerField;
    sqlFeriadoMES: TIntegerField;
    sqlAutEmail: TSQLClientDataSet;
    sqlAutEmailCODIGOAUTOMACAO: TIntegerField;
    sqlAutEmailDESCRICAO: TStringField;
    sqlAutEmailDIAMESENVIO: TIntegerField;
    sqlAutEmailDIASEMANAENVIO: TIntegerField;
    sqlAutEmailDATANASCIMENTO: TStringField;
    sqlAutEmailDATACADASTRO: TStringField;
    sqlAutEmailMENSAGEM: TStringField;
    sqlAutEmailARQUIVO1: TStringField;
    sqlAutEmailARQUIVO2: TStringField;
    sqlAutEmailARQUIVO3: TStringField;
    sqlAutEmailARQUIVO4: TStringField;
    dsAutEmail: TDataSource;
    sqlLogCliCONTROLE: TIntegerField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    online: boolean;
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
  GeraCod.CommandText := 'select cast(GEN_ID('+Gen+', 1) as integer) codigo from RDB$DATABASE';
  GeraCod.Open;
  Result := GeraCod.Fields[0].AsInteger;
end;


procedure TdmPrinc.DataModuleCreate(Sender: TObject);
var
  arqini: TIniFile;
  bancolocal, bancoremoto, ip: string;

begin
  arqini := TIniFile.Create(ExtractFilePath(Application.ExeName)+'devsoft.ini');
  bancolocal  := arqini.ReadString('DBLocal',  'Path', '?');
  ip          := arqini.ReadString('DBRemoto', 'IP',   '?');
  bancoremoto := arqini.ReadString('DBRemoto', 'Path', '?');
  arqini.Free;

  SQLConLocal.Params.Values['Database'] := bancolocal + 'devsoft.gdb';
  SQLConLocal.Connected := True;

  SQLConRemoto.Params.Values['Database'] := ip + ':' + bancoremoto + 'devsoft.gdb';
  online := True;
  try
    SQLConRemoto.Connected := true;
  except
    online := False;
    sqlCliente.DBConnection := SQLConLocal;
    sqlPesqCliente.DBConnection := SQLConLocal;
    sqlLogCli.DBConnection := SQLConLocal;
  end;

  TransDesc.TransactionID := 1;
  TransDesc.IsolationLevel := xilREADCOMMITTED;
end;

end.

