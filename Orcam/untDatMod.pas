unit untDatMod;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, IniFiles, Db;

type
  TDatMod = class(TDataModule)
    DataBase: TDatabase;
    DatInsumos: TDataSource;
    DatCompInsu: TDataSource;
    DatCompServ: TDataSource;
    DatServicos: TDataSource;
    TabInsumos: TTable;
    TabCompInsu: TTable;
    TabCompServ: TTable;
    TabServicos: TTable;
    TabInsumosDescricao: TStringField;
    TabInsumosUnidade: TStringField;
    TabInsumosTipo: TIntegerField;
    TabInsumosValor: TFloatField;
    TabServicosCodigoServico: TStringField;
    TabServicosDescricao: TStringField;
    TabServicosUnidade: TStringField;
    TabServicosValor: TFloatField;
    QryCInsu: TQuery;
    DatQCI: TDataSource;
    DatQCS: TDataSource;
    QryCServ: TQuery;
    TabCompInsuCodigoServico: TStringField;
    TabCompInsuCodigoInsumoComp: TIntegerField;
    TabCompInsuQuantidade: TFloatField;
    TabCompServCodigoServico: TStringField;
    TabCompServCodigoServComp: TStringField;
    TabCompServQuantidade: TFloatField;
    DatServ: TDataSource;
    QryServ: TQuery;
    TabDadosGerais: TTable;
    DatDadosGerais: TDataSource;
    DatOrcam: TDataSource;
    TabOrcam: TTable;
    TabPadrao: TTable;
    TabOrcamNumero: TStringField;
    TabOrcamNivel: TStringField;
    TabOrcamCodigoServico: TStringField;
    TabOrcamDescricaoServico: TStringField;
    TabOrcamMDO: TFloatField;
    TabOrcamMAT: TFloatField;
    TabOrcamBDI: TStringField;
    TabOrcamDescServ: TStringField;
    TabOrcamTotalServ: TFloatField;
    TabOrcamValBDI: TFloatField;
    TabOrcamUnidade: TStringField;
    TabOrcamQuantidade: TFloatField;
    TabOrcamValorServ: TFloatField;
    DatInsOrc: TDataSource;
    TabInsOrc: TTable;
    DatQryInscOrc: TDataSource;
    QryInscOrc: TQuery;
    DatCompo: TDataSource;
    TabCompo: TTable;
    TabCompoCodigo: TStringField;
    TabCompoComponente: TStringField;
    TabCompoTipo: TStringField;
    TabCompoDescricao: TStringField;
    TabCompoUnidade: TStringField;
    TabCompoQuantidade: TFloatField;
    TabCompoValor: TFloatField;
    TabInsumosCodigoInsumo: TIntegerField;
    TabOrcamTotalMDO: TFloatField;
    TabOrcamTotalMAT: TFloatField;
    QryComp: TQuery;
    DatComp: TDataSource;
    TabInsumosDataAtualiz: TDateField;
    TabInsumosValorAnt: TFloatField;
    DatCrono: TDataSource;
    TabCrono: TTable;
    TabTPeri: TTable;
    TabTPeriDescricao: TStringField;
    TabTPeriDias: TIntegerField;
    DatTPeri: TDataSource;
    TabTPeriCodigo: TAutoIncField;
    TabDadosGeraisCodigoOrcam: TAutoIncField;
    TabDadosGeraisDescricao: TStringField;
    TabDadosGeraisCliente: TStringField;
    TabDadosGeraisLocal: TStringField;
    TabDadosGeraisObs: TStringField;
    TabDadosGeraisDataCriacao: TDateField;
    TabDadosGeraisDataAtualiza: TDateField;
    TabDadosGeraisLS: TFloatField;
    TabDadosGeraisBDI0: TFloatField;
    TabDadosGeraisBDI1: TFloatField;
    TabDadosGeraisBDI2: TFloatField;
    TabDadosGeraisBDI3: TFloatField;
    TabDadosGeraisBDI4: TFloatField;
    TabDadosGeraisBDI5: TFloatField;
    TabDadosGeraisBDI6: TFloatField;
    TabDadosGeraisBDI7: TFloatField;
    TabDadosGeraisBDI8: TFloatField;
    TabDadosGeraisBDI9: TFloatField;
    TabDadosGeraisTotal: TFloatField;
    TabDadosGeraisDataInicio: TDateField;
    TabDadosGeraisPerodos: TIntegerField;
    TabDadosGeraisTipoPeriodo: TIntegerField;
    TabDadosGeraisNivel: TStringField;
    DatInsu: TDataSource;
    TabInsu: TTable;
    TabInsuCodigoInsumo: TIntegerField;
    TabInsuValor: TFloatField;
    TabInsuDataAtualiz: TDateField;
    TabInsuValorAnt: TFloatField;
    TabInsuDescricao: TStringField;
    TabInsuUnidade: TStringField;
    TabInsuTipo: TIntegerField;
    DatTipoInsu: TDataSource;
    TabTipoInsu: TTable;
    TabTipoInsuCodigo: TIntegerField;
    TabTipoInsuDescricao: TStringField;
    TabInsumosDescTipo: TStringField;
    TabInsuDescTipo: TStringField;
    TabCompoLS: TFloatField;
    TabCompoBDI: TFloatField;
    TabDadosGeraisMetragem: TFloatField;
    TabDadosGeraisPavimentos: TIntegerField;
    procedure DatModCreate(Sender: TObject);
    procedure TabServicosCalcFields(DataSet: TDataSet);
    procedure DatModDestroy(Sender: TObject);
    procedure TabOrcamCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    caminhobase: string;
  end;

var
  DatMod: TDatMod;

implementation

uses Funcoes, untCalculo, untMain;

{$R *.DFM}

procedure TDatMod.DatModCreate(Sender: TObject);
var
    arqini: TIniFile;
    path, arquivo,
    Base, ArqPara, ArqOra, ArqConf: string;
    i, c: integer;

begin
    DataBase.Connected := False;

    path := ExtractFilePath(Application.ExeName);
    arquivo := 'Drache.ini';

    arqini := TIniFile.Create( path + arquivo );

    Base    := arqini.ReadString( 'Base','Tipo', '-' );
    ArqPara := arqini.ReadString( 'Paradox','ConfigParadox', '-' );
    ArqOra  := arqini.ReadString( 'Oracle','ConfigOracle', '-' );

    arqini.Free;

    if AnsiUpperCase( Base ) = 'ORACLE' then begin
       ArqConf := ArqOra;
       DataBase.DriverName := 'ORACLE';
    end
    else begin
       ArqConf := ArqPara;
       DataBase.DriverName := 'STANDARD';
    end;

    TabInsumos.Close;
    TabCompInsu.Close;
    TabCompServ.Close;
    TabServicos.Close;
    TabDadosGerais.Close;
    TabOrcam.Close;
    TabPadrao.Close;
    QryCInsu.Close;
    QryCServ.Close;
    QryServ.Close;
    TabTPeri.Close;

    DataBase.Params.Clear;
    DataBase.Params.LoadFromFile( path + ArqConf );

    if DataBase.DriverName = 'STANDARD' then
       if DataBase.Params.IndexOfName('PATH') = -1 then begin
          DataBase.Params.Add( 'PATH=' + path + 'Dados' );
          caminhobase := path + 'Dados';
       end
       else begin
          i := DataBase.Params.IndexOfName('PATH');
          c := Length( DataBase.Params.Strings[i] );
          caminhobase := Copy( DataBase.Params.Strings[i], 5, c-4 );
       end;

    DataBase.Connected := True;

    TabInsumos.Open;
    TabCompInsu.Open;
    TabCompServ.Open;
    TabServicos.Open;
    TabTPeri.Open;
    TabDadosGerais.Open;
    TabDadosGerais.IndexName := 'IndDesc';
    TabDadosGerais.First;
    // TabOrcam e TabPadrao não abrem aqui

end;

procedure TDatMod.DatModDestroy(Sender: TObject);
begin
    DataBase.Connected := False;
end;

procedure TDatMod.TabServicosCalcFields(DataSet: TDataSet);
begin
  TabServicosValor.Value := CalcServico( TabServicosCodigoServico.AsString,
                            frmMain.LS, frmMain.BDI, True );
end;

procedure TDatMod.TabOrcamCalcFields(DataSet: TDataSet);
var
   valbdi, valLS, valmat, valmdo,
   myMDO, myMAT: real;

begin
   TabOrcamDescServ.Value := Spaces((6-myInt(TabOrcamNivel.AsString)*2))+
                             TabOrcamDescricaoServico.AsString;

   case myInt(TabOrcamBDI.AsString) of
    0: valbdi := TabDadosGeraisBDI0.Value;
    1: valbdi := TabDadosGeraisBDI1.Value;
    2: valbdi := TabDadosGeraisBDI2.Value;
    3: valbdi := TabDadosGeraisBDI3.Value;
    4: valbdi := TabDadosGeraisBDI4.Value;
    5: valbdi := TabDadosGeraisBDI5.Value;
    6: valbdi := TabDadosGeraisBDI6.Value;
    7: valbdi := TabDadosGeraisBDI7.Value;
    8: valbdi := TabDadosGeraisBDI8.Value;
    9: valbdi := TabDadosGeraisBDI9.Value;
   else
       valbdi := 0;
   end;
   TabOrcamValBDI.Value := valbdi;
   valLS := TabDadosGeraisLS.Value;
   valMDO := TabOrcamMDO.Value;
   valMAT := TabOrcamMAT.Value;

   if myInt(TabOrcamNivel.AsString) = 0 then begin
      myMDO := valMDO + (valMDO * valLS / 100);
      myMDO := myMDO + (myMDO * valBDI / 100);
      myMAT := valMAT + (valMAT * valBDI / 100);
      TabOrcamTotalMDO.Value := myMDO * TabOrcamQuantidade.Value;
      TabOrcamTotalMAT.Value := myMAT * TabOrcamQuantidade.Value;
      TabOrcamTotalServ.Value := ( myMDO + myMAT ) * TabOrcamQuantidade.Value;
      TabOrcamValorServ.Value := myMDO + myMAT;
   end
   else begin
      TabOrcamTotalServ.Value := valmat+valmdo;
      TabOrcamValorServ.Value := valmat+valmdo;
   end;
end;

end.


