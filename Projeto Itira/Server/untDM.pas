unit untDM;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComServ, ComObj, VCLCom, StdVcl, bdemts, DataBkr, DBClient,
  MtsRdm, Mtx, AdmServer_TLB, DB, Provider, DBXpress,
  FMTBcd, SqlExpr;

type
  TDM = class(TMtsDataModule, IDM)
    dspPesqCli: TDataSetProvider;
    SQLCon: TSQLConnection;
    sqlPesqCli: TSQLDataSet;
    sqlPesqCliCODIGOCLIENTE: TIntegerField;
    sqlPesqCliNOME: TStringField;
    sqlPesqCliFONE: TStringField;
    sqlPesqCliEMAIL: TStringField;
    sqlAltTabs: TSQLDataSet;
    sqlAltTabsNOME_TABELA: TStringField;
    sqlAltTabsDATA_HORA: TSQLTimeStampField;
    dspAltTabs: TDataSetProvider;
    sqlFeriado: TSQLDataSet;
    dspFeriado: TDataSetProvider;
    sqlFPagto: TSQLDataSet;
    SQLDataSet2: TSQLDataSet;
    SQLDataSet4: TSQLDataSet;
    SQLDataSet6: TSQLDataSet;
    SQLDataSet7: TSQLDataSet;
    SQLDataSet8: TSQLDataSet;
    SQLDataSet9: TSQLDataSet;
    SQLDataSet10: TSQLDataSet;
    SQLDataSet11: TSQLDataSet;
    SQLDataSet12: TSQLDataSet;
    SQLDataSet13: TSQLDataSet;
    dqlFRecb: TSQLDataSet;
    DataSetProvider2: TDataSetProvider;
    DataSetProvider3: TDataSetProvider;
    DataSetProvider4: TDataSetProvider;
    DataSetProvider8: TDataSetProvider;
    DataSetProvider9: TDataSetProvider;
    DataSetProvider10: TDataSetProvider;
    DataSetProvider11: TDataSetProvider;
    DataSetProvider13: TDataSetProvider;
    DataSetProvider14: TDataSetProvider;
    DataSetProvider15: TDataSetProvider;
    dspFReceb: TDataSetProvider;
    dspFPagto: TDataSetProvider;
    sqlFPagtoCODIGOFORMAPAGAMENTO: TIntegerField;
    sqlFPagtoCODIGOADMCARTAO: TIntegerField;
    sqlFPagtoCODIGOFORNECEDOR: TIntegerField;
    sqlFPagtoDESCRICAO: TStringField;
    sqlFPagtoFATOR: TBCDField;
    sqlFPagtoINTERVALO: TIntegerField;
    sqlFPagtoPARCELAS: TIntegerField;
    sqlFPagtoPRIMEIROVENCTO: TIntegerField;
    sqlFPagtoVISTAPARCELADOCARTAO: TStringField;
    dqlFRecbCODIGOFORMARECEBIMENTO: TIntegerField;
    dqlFRecbDESCRICAO: TStringField;
    dqlFRecbFATOR: TBCDField;
    dqlFRecbINTERVALO: TIntegerField;
    dqlFRecbPARCELAS: TIntegerField;
    dqlFRecbPRIMEIROVENCTO: TIntegerField;
    dqlFRecbVISTAPARCELADO: TStringField;
  private
    { Private declarations }
  protected
    class procedure UpdateRegistry(Register: Boolean; const ClassID, ProgID: string); override;
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.DFM}

class procedure TDM.UpdateRegistry(Register: Boolean; const ClassID, ProgID: string);
begin
  if Register then
  begin
    inherited UpdateRegistry(Register, ClassID, ProgID);
    EnableSocketTransport(ClassID);
    EnableWebTransport(ClassID);
  end else
  begin
    DisableSocketTransport(ClassID);
    DisableWebTransport(ClassID);
    inherited UpdateRegistry(Register, ClassID, ProgID);
  end;
end;

initialization
  TComponentFactory.Create(ComServer, TDM,
    Class_DM, ciMultiInstance, tmBoth);
end.