unit untDM;

interface

uses
  SysUtils, Classes, DB, DBClient, MConnect, DateUtils;

type
  TdmPrinc = class(TDataModule)
    ConAdmi: TDCOMConnection;
    cdsPesqCli: TClientDataSet;
    cdsPesqCliCODIGOCLIENTE: TIntegerField;
    cdsPesqCliNOME: TStringField;
    cdsPesqCliFONE: TStringField;
    cdsPesqCliEMAIL: TStringField;
    cdsFeriado: TClientDataSet;
    cdsFeriadoDESCRICAO: TStringField;
    cdsFeriadoDIA: TIntegerField;
    cdsFeriadoMES: TIntegerField;
    cdsAltTabs: TClientDataSet;
    cdsAltTabsNOME_TABELA: TStringField;
    cdsAltTabsDATA_HORA: TSQLTimeStampField;
    cdsFPagto: TClientDataSet;
    cdsFReceb: TClientDataSet;
    cdsFPagtoCODIGOFORMAPAGAMENTO: TIntegerField;
    cdsFPagtoCODIGOADMCARTAO: TIntegerField;
    cdsFPagtoCODIGOFORNECEDOR: TIntegerField;
    cdsFPagtoDESCRICAO: TStringField;
    cdsFPagtoFATOR: TBCDField;
    cdsFPagtoINTERVALO: TIntegerField;
    cdsFPagtoPARCELAS: TIntegerField;
    cdsFPagtoPRIMEIROVENCTO: TIntegerField;
    cdsFPagtoVISTAPARCELADOCARTAO: TStringField;
    cdsFRecebCODIGOFORMARECEBIMENTO: TIntegerField;
    cdsFRecebDESCRICAO: TStringField;
    cdsFRecebFATOR: TBCDField;
    cdsFRecebINTERVALO: TIntegerField;
    cdsFRecebPARCELAS: TIntegerField;
    cdsFRecebPRIMEIROVENCTO: TIntegerField;
    cdsFRecebVISTAPARCELADO: TStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    procedure OpenCache(cds: TClientDataSet; FileName: TFileName; UltimaAtu: TdateTime);
  public
    { Public declarations }
    procedure VerificaCache;
  end;

var
  dmPrinc: TdmPrinc;

implementation

{$R *.dfm}

{ TdmPrinc }

{ TdmPrinc }

procedure TdmPrinc.DataModuleCreate(Sender: TObject);
begin
  // http://galeradopol.blogspot.com/
  VerificaCache;
end;

procedure TdmPrinc.OpenCache(cds: TClientDataSet; FileName: TFileName;
  UltimaAtu: TdateTime);
var
  ex: boolean;
  data: TdateTime;

begin
  if FileExists(FileName) then
  begin
    data := FileDateToDateTime(FileAge(FileName));
    ex := UltimaAtu > data;
  end
  else
    ex := True;
  if ex then
  begin
    cds.Open;
    cds.SaveToFile(FileName);
  end
  else
    cds.LoadFromFile(FileName);
end;

procedure TdmPrinc.VerificaCache;
begin
  cdsAltTabs.Open;
  cdsAltTabs.First;
  while not cdsAltTabs.Eof do
  begin
    // Verifica Feriados
    if cdsAltTabsNOME_TABELA.AsString = 'FERIADO' then
      OpenCache(cdsFeriado, 'feriado.xml', cdsAltTabsDATA_HORA.AsDateTime);

    // Verifica Forma Pagamento
    if cdsAltTabsNOME_TABELA.AsString = 'FORMAPAGAMENTO' then
      OpenCache(cdsFPagto, 'fpagto.xml', cdsAltTabsDATA_HORA.AsDateTime);

    // Verifica Forma Recebimento
    if cdsAltTabsNOME_TABELA.AsString = 'FORMARECEBIMENTO' then
      OpenCache(cdsFReceb, 'freceb.xml', cdsAltTabsDATA_HORA.AsDateTime);

    cdsAltTabs.Next;
  end;
end;

end.
