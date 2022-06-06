unit untDtMod;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, IBCustomDataSet, IBTable, IBDatabase, IBUpdateSQL, IBQuery;

type
  TdtMod = class(TDataModule)
    dsUser: TDataSource;
    dtBase: TIBDatabase;
    IBTrans: TIBTransaction;
    tbUser: TIBTable;
    dsEmpresa: TDataSource;
    tbEmpresa: TIBTable;
    tbUserMATRICULA: TIntegerField;
    tbUserNOME: TIBStringField;
    tbUserUSERNAME: TIBStringField;
    tbUserSENHA: TIBStringField;
    tbUserCORTESIA: TIntegerField;
    tbUserDIREITOS: TIBStringField;
    dsFechado: TDataSource;
    dsSituacao: TDataSource;
    dsPlano: TDataSource;
    dsDiasSem: TDataSource;
    dsFeriado: TDataSource;
    dsCaixa: TDataSource;
    dsReceb: TDataSource;
    dsMicro: TDataSource;
    dsPreco: TDataSource;
    tbSituacao: TIBTable;
    tbPlano: TIBTable;
    tbFechado: TIBTable;
    tbPreco: TIBTable;
    tbDiasSemana: TIBTable;
    tbFeriado: TIBTable;
    tbCaixa: TIBTable;
    tbReceb: TIBTable;
    tbMicro: TIBTable;
    dsSocio: TDataSource;
    tbSocio: TIBTable;
    tbEmpresaRAZAOSOCIAL: TIBStringField;
    tbEmpresaENDERECO: TIBStringField;
    tbEmpresaBAIRRO: TIBStringField;
    tbEmpresaCIDADE: TIBStringField;
    tbEmpresaCEP: TIBStringField;
    tbEmpresaUF: TIBStringField;
    tbEmpresaFONE: TIBStringField;
    tbEmpresaFAX: TIBStringField;
    tbEmpresaCNPJ: TIBStringField;
    tbEmpresaIE: TIBStringField;
    tbEmpresaDELAY: TIntegerField;
    tbEmpresaEMAIL: TIBStringField;
    tbRecebNUMERO: TIntegerField;
    tbRecebCODIGOSOCIO: TIntegerField;
    tbRecebCODIGOSITUACAO: TIntegerField;
    tbRecebDATAEMISSAO: TDateTimeField;
    tbRecebDATAVENCIMENTO: TDateTimeField;
    tbRecebDATAPAGAMENTO: TDateTimeField;
    tbRecebCHEQUE: TIBStringField;
    tbRecebBANCO: TIBStringField;
    tbRecebOBSERVACAO: TIBStringField;
    tbDiasSemanaCODIGODIASEMANA: TIntegerField;
    tbDiasSemanaDESCRICAO: TIBStringField;
    tbFeriadoDESCRICAO: TIBStringField;
    tbFeriadoDIA: TIntegerField;
    tbFeriadoMES: TIntegerField;
    tbMicroCODIGOMICRO: TIntegerField;
    tbMicroDESCRICAO: TIBStringField;
    tbMicroESTADO: TIBStringField;
    tbMicroNETNAME: TIBStringField;
    tbPrecoCODIGODIASEMANA: TIntegerField;
    tbPrecoHORAINICIAL: TDateTimeField;
    tbPrecoHORAFINAL: TDateTimeField;
    tbSituacaoCODIGOSITUACAO: TIntegerField;
    tbSituacaoDESCRICAO: TIBStringField;
    tbPlanoCODIGOPLANO: TIntegerField;
    tbPlanoDESCRICAO: TIBStringField;
    tbPlanoHORAS: TIntegerField;
    tbSocioCODIGOSOCIO: TIntegerField;
    tbSocioCODIGOPLANO: TIntegerField;
    tbSocioNOME: TIBStringField;
    tbSocioENDERECO: TIBStringField;
    tbSocioCOMPLEMENTO: TIBStringField;
    tbSocioBAIRRO: TIBStringField;
    tbSocioCIDADE: TIBStringField;
    tbSocioUF: TIBStringField;
    tbSocioCEP: TIBStringField;
    tbSocioCPF: TIBStringField;
    tbSocioRG: TIBStringField;
    tbSocioDATANASCIMENTO: TDateTimeField;
    tbSocioFOTO: TBlobField;
    tbSocioDATACADASTRO: TDateTimeField;
    tbSocioTELEFONE: TIBStringField;
    tbSocioEMAIL: TIBStringField;
    tbSocioSITUACAO: TIBStringField;
    tbPrecoVALORAVULSO: TFloatField;
    tbPrecoVALORSOCIO: TFloatField;
    tbRecebVALOR: TFloatField;
    tbRecebMULTA: TFloatField;
    tbRecebJUROS: TFloatField;
    tbRecebVALORPAGO: TFloatField;
    tbPlanoVALOR: TFloatField;
    tbFechadoCODIGOMICRO: TIntegerField;
    tbFechadoDHINICIAL: TDateTimeField;
    tbFechadoMATRICULA: TIntegerField;
    tbFechadoDHFINAL: TDateTimeField;
    tbFechadoVALORUNITARIO: TFloatField;
    tbFechadoHORAS: TFloatField;
    tbFechadoVALORTOTAL: TFloatField;
    tbFechadoCORTESIA: TIBStringField;
    tbRecebNomeSocio: TStringField;
    tbRecebSituacao: TStringField;
    tbPrecoDescricaoDiaSemana: TStringField;
    tbSocioPLANO: TStringField;
    tbEmpresaDIASATRASO: TIntegerField;
    tbEmpresaVALIDADESENHA: TIntegerField;
    tbEmpresaTEMPOCORTESIA: TIntegerField;
    tbEmpresaSENHALIBERA: TIBStringField;
    tbSituacaoBLOQUEIASOCIO: TIBStringField;
    tbUserDESCTOMAXIMO: TFloatField;
    tbUserDATAALTSENHA: TDateTimeField;
    dsConta: TDataSource;
    tbConta: TIBTable;
    tbContaCODIGOSOCIO: TIntegerField;
    tbContaANO: TIntegerField;
    tbContaMES: TIntegerField;
    tbContaACUMULADO: TFloatField;
    tbFechadoCODIGOSOCIO: TIntegerField;
    tbFechadoTEMPOESTIMADO: TIntegerField;
    tbFechadoTIPO: TIBStringField;
    tbEmpresaMULTA: TFloatField;
    tbEmpresaJUROS: TFloatField;
    tbEmpresaDATAULTIMAGERACAO: TDateTimeField;
    tbSocioHorasAcumuladas: TFloatField;
    tbSocioHorasDisponiveis: TFloatField;
    tbMicroCODIGOSOCIO: TIntegerField;
    tbMicroDHINICIAL: TDateTimeField;
    tbMicroVALORUNITARIO: TFloatField;
    tbMicroTEMPOESTIMADO: TIntegerField;
    tbMicroTIPO: TIBStringField;
    tbMicroCORTESIA: TIBStringField;
    tbMicroHorasParcial: TFloatField;
    tbMicroValorParcial: TFloatField;
    tbMicroNomeSocio: TStringField;
    tbMicroTempoDisp: TStringField;
    dsOpCl: TDataSource;
    tbOpenClose: TIBTable;
    tbCaixaNomeMatricula: TStringField;
    dsDataCaixa: TDataSource;
    tbFechadoCONTABILIZADO: TIBStringField;
    qrDataCaixa: TIBQuery;
    tbSocioCodigoBarra: TStringField;
    tbSocioCARTEIRA: TIBStringField;
    tbSocioHAcum: TStringField;
    tbSocioHDisp: TStringField;
    tbSocioHTotal: TStringField;
    dsCalFechado: TDataSource;
    qrCalFechado: TIBQuery;
    qrCalFechadoCODIGOMICRO: TIntegerField;
    qrCalFechadoVALORTOTAL: TFloatField;
    qrCalFechadoMicro: TStringField;
    dsMovFechado: TDataSource;
    qrMovFechado: TIBQuery;
    tbEmpresaLINHAS: TIntegerField;
    dsRelFech: TDataSource;
    qrRelFech: TIBQuery;
    qrRelFechDATAMOVIMENTO: TDateTimeField;
    qrRelFechTIPOLANCTO: TIBStringField;
    qrRelFechDESCRICAO: TIBStringField;
    qrRelFechENTRADA: TFloatField;
    qrRelFechSAIDA: TFloatField;
    dsDatPer: TDataSource;
    qrDatPer: TIBQuery;
    tbCaixaDATAMOVIMENTO: TDateTimeField;
    tbCaixaCONTROLECAIXA: TIntegerField;
    tbCaixaMATRICULA: TIntegerField;
    tbCaixaTIPOLANCTO: TIBStringField;
    tbCaixaDESCRICAO: TIBStringField;
    tbCaixaENTRADA: TFloatField;
    tbCaixaSAIDA: TFloatField;
    tbCaixaSALDO: TFloatField;
    tbOpenCloseCONTROLECAIXA: TIntegerField;
    tbOpenCloseMATRICULA: TIntegerField;
    tbOpenCloseSALDOABERTURA: TFloatField;
    tbOpenCloseDHABERTURA: TDateTimeField;
    tbOpenCloseDHFECHAMENTO: TDateTimeField;
    tbOpenCloseSALDOFECHAMENTO: TFloatField;
    tbSocioHorasTotal: TIntegerField;
    qrRelFechSALDO: TFloatField;
    tbCaixaCONTROLE: TIntegerField;
    dsCxAtual: TDataSource;
    qrCxAtual: TIBQuery;
    qrCxAtualDATAMOVIMENTO: TDateTimeField;
    qrCxAtualCONTROLECAIXA: TIntegerField;
    qrCxAtualTIPOLANCTO: TIBStringField;
    qrCxAtualDESCRICAO: TIBStringField;
    qrCxAtualENTRADA: TFloatField;
    qrCxAtualSAIDA: TFloatField;
    qrCxAtualSALDO: TFloatField;
    qrCxAtualCONTROLE: TIntegerField;
    qrDatPerMENOR: TIntegerField;
    qrDatPerMAIOR: TIntegerField;
    tbSocioMesAtual: TIntegerField;
    tbSocioDATARENOVA: TDateTimeField;
    tbSocioDATAVENCTO: TDateTimeField;
    dsExpira: TDataSource;
    tbExpira: TIBTable;
    tbExpiraDHEXPIRA: TDateTimeField;
    updMicro: TIBUpdateSQL;
    dsBaixa: TDataSource;
    qrBaixa: TIBQuery;
    tbEmpresaLANCTO: TFloatField;
    dsLog: TDataSource;
    qrLog: TIBQuery;
    qrLogMATRICULA: TIntegerField;
    qrLogDATA: TDateField;
    qrLogHORA: TTimeField;
    qrLogDESCRICAO: TIBStringField;
    upLog: TIBUpdateSQL;
    qrDataCaixaCONTROLECAIXA: TIntegerField;
    qrDataCaixaMATRICULA: TIntegerField;
    qrDataCaixaSALDOABERTURA: TFloatField;
    qrDataCaixaDHABERTURA: TDateTimeField;
    qrDataCaixaDHFECHAMENTO: TDateTimeField;
    qrDataCaixaSALDOFECHAMENTO: TFloatField;
    qrRelFechDATA: TDateField;
    dsEmail: TDataSource;
    qrEmail: TIBQuery;
    qrEmailNOME: TIBStringField;
    qrEmailDATANASCIMENTO: TDateTimeField;
    qrEmailEMAIL: TIBStringField;
    dsRelVencto: TDataSource;
    qrRelVencto: TIBQuery;
    qrRelVenctoNOME: TIBStringField;
    qrRelVenctoTELEFONE: TIBStringField;
    qrRelVenctoDATAVENCTO: TDateTimeField;
    qrRelVenctoDATARENOVA: TDateTimeField;
    qrRelVenctoSITUACAO: TIBStringField;
    tbPrecoAVULSO15: TFloatField;
    tbPrecoAVULSO30: TFloatField;
    tbPrecoSOCIO15: TFloatField;
    tbPrecoSOCIO30: TFloatField;
    tbMicroVALOR15: TFloatField;
    tbMicroVALOR30: TFloatField;
    tbMicroTEMPOCORTESIA: TIntegerField;
    tbPlanoMESES: TIntegerField;
    dsDesconto: TDataSource;
    tbDesconto: TIBTable;
    tbDescontoCODIGODESCONTO: TIntegerField;
    tbDescontoHORAS: TFloatField;
    tbDescontoDESCONTO: TFloatField;
    dsSqlDescto: TDataSource;
    sqlDescto: TIBQuery;
    sqlDesctoHORAS: TFloatField;
    sqlDesctoDESCONTO: TFloatField;
    procedure DataModuleCreate(Sender: TObject);
    procedure GeraCodigo(DataSet: TDataSet);
    procedure GravaCodigo(DataSet: TDataSet);
    procedure tbUserAfterScroll(DataSet: TDataSet);
    procedure tbSocioCalcFields(DataSet: TDataSet);
    procedure tbMicroCalcFields(DataSet: TDataSet);
    procedure tbCaixaBeforePost(DataSet: TDataSet);
    procedure ApplyUpdates(DataSet: TDataSet);
    procedure tbContaAfterPost(DataSet: TDataSet);
    procedure tbSocioAfterPost(DataSet: TDataSet);
    procedure Acao(mens: string);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtMod: TdtMod;
  valor: array[1..20] of integer;


implementation

uses untFuncoes, untConfUser, untMain;

{$R *.DFM}

procedure TdtMod.DataModuleCreate(Sender: TObject);
begin
  Try
    dtBase.Connected := False;
    dtBase.DatabaseName := frmMain.caminho_gdb + '\devSoft.gdb';
    dtBase.Open;
    IBTrans.StartTransaction;
    tbUser.Open;
    tbEmpresa.Open;
    tbSituacao.Open;
    tbPlano.Open;
    tbConta.Open;
    tbFechado.Open;
    tbPreco.Open;
    tbDiasSemana.Open;
    tbFeriado.Open;
    tbCaixa.Open;
    tbSocio.Open;
    tbReceb.Open;
    tbMicro.Open;
    tbOpenClose.Open;
    tbExpira.Open;
    qrLog.OPen;
    tbDesconto.Open;
 Except
   ShowMessage('Error to connect to database !');
   Halt(0);
 end;
end;

procedure TdtMod.GeraCodigo(DataSet: TDataSet);
var
  CampoIndex: String;
  tabela: TIBTable;
  i: integer;

begin
  if DataSet.Active then
    if DataSet.RecordCount = 0 then
    begin
      valor[ DataSet.Tag ] := 0;
    end
    else
    begin

      for i := 0 to dtMod.ComponentCount - 1 do
      begin
        if dtMod.Components[i].Tag = DataSet.Tag then
        begin
          tabela := (dtMod.Components[ i ] as TIBTable);
          break;
        end;
      end;

      campoIndex := tabela.IndexFieldNames;
      tabela.IndexFieldNames := '';

      DataSet.Last;
      valor[ DataSet.Tag ] := DataSet.Fields.FieldByNumber(1).Value;

      tabela.IndexFieldNames := campoIndex;
    end;
end;

procedure TdtMod.GravaCodigo(DataSet: TDataSet);
begin
  inc(valor[ DataSet.Tag ]);
  DataSet.Fields.FieldByNumber(1).Value := valor[ DataSet.Tag ];
end;
    
procedure TdtMod.tbUserAfterScroll(DataSet: TDataSet);
var
  i: integer;
  d: string;

begin
  try
    with frmConfUser do
    begin
      altsenha := False;
      edtSenha.Text := '';
      d := tbUserDIREITOS.Value;
      if d <> '' then
        for i := 1 to chkLstEstoque.Items.Count do
          if d[i] = 'X' then
            chkLstEstoque.Checked[i-1] := True
          else
            chkLstEstoque.Checked[i-1] := False;
    end;
  except
  end;
end;

procedure TdtMod.tbSocioCalcFields(DataSet: TDataSet);
var
  Year, Month, Day, MesAtual,
  nAno, nMes, nDia: Word;
  v,f: string;

begin
  DecodeDate( Now, Year, Month, Day );
  DecodeDate( tbSocioDATAVENCTO.Value, nAno, nMes, nDia );
  try
    if Day < nDia then
      MesAtual := Month - 1
    else
      MesAtual := Month;

    if MesAtual < 1 then MesAtual := 1;
    tbSocioMesAtual.Value := MesAtual;

    v := Copy(IntToStr(Trunc((tbSocioDATACADASTRO.AsFloat+tbSocioDATANASCIMENTO.AsFloat)*(tbSocioDATACADASTRO.AsFloat+tbSocioDATANASCIMENTO.AsFloat))),2,4);
    if tbSocioCODIGOSOCIO.Value > 0 then
    begin
      f := Copy(v,1,2)+StrZero(tbSocioCODIGOSOCIO.Value,4,0)+Copy(v,3,2);
      tbSocioCodigoBarra.Value := GeraDG(f);
    end
    else
      tbSocioCodigoBarra.Value := '000000000';

    if tbConta.Locate('CODIGOSOCIO;ANO;MES',VarArrayOf([tbSocioCODIGOSOCIO.Value,Year,tbSocioMesAtual.Value]),[]) then
      tbSocioHorasAcumuladas.Value := tbContaACUMULADO.Value
    else
      tbSocioHorasAcumuladas.Value := 0.00;

    tbSocioHorasDisponiveis.Value := tbSocioHorasTotal.Value - tbSocioHorasAcumuladas.Value;

    tbSocioHAcum.Value  := MinToHoras(Trunc(tbSocioHorasAcumuladas.Value*60));
    tbSocioHDisp.Value  := MinToHoras(Trunc(tbSocioHorasDisponiveis.Value*60));
    tbSocioHTotal.Value := MinToHoras(Trunc(tbSocioHorasTotal.Value*60));
  except
  end;
end;

procedure TdtMod.tbMicroCalcFields(DataSet: TDataSet);
var
  Hour, Min, Sec, MSec: Word;
  vunit, tempo: real;
  tc, h, m: integer;

begin
  if (tbMicroESTADO.Value = 'U') or (tbMicroESTADO.Value = 'E') then
  begin
    tbMicroHorasParcial.Value := Now - tbMicroDHInicial.AsDateTime;
    //DecodeTime(tbMicroHorasParcial.Value, Hour, Min, Sec, MSec);
    tc := tbMicroTEMPOCORTESIA.Value;
    if tc > 59 then
    begin
      h := Trunc(tc / 60);
      m := Trunc(tc - h*60);
    end
    else
    begin
      h := 0;
      m := tc;
    end;

    tempo := tbMicroHorasParcial.Value -
             EncodeTime(h,m,0,0);
    if tempo > 0 then
    begin
      DecodeTime(tempo, Hour, Min, Sec, MSec);
      if Hour*60+Min < 30 then
        vunit := tbMicroVALOR15.Value*4
      else
      if Hour*60+Min < 60 then
        vunit := tbMicroVALOR30.Value*2
      else
        vunit := tbMicroVALORUNITARIO.Value;
      tbMicroValorParcial.Value := Trunca(vunit*(Hour+Min/60+Sec/3600));
    end
    else
      tbMicroValorParcial.Value := 0.00;
    tbMicroTempoDisp.Value := MinToHoras(tbMicroTEMPOESTIMADO.Value);
  end;
end;

procedure TdtMod.tbCaixaBeforePost(DataSet: TDataSet);
begin
  tbOpenClose.Last;
  tbCaixaCONTROLECAIXA.Value := tbOpenCloseCONTROLECAIXA.Value;
  tbCaixaDATAMOVIMENTO.Value := frmMain.hoje;
  tbCaixaMATRICULA.Value := frmMain.Matricula;
end;

procedure TdtMod.ApplyUpdates(DataSet: TDataSet);
begin
  dtBase.ApplyUpdates( [ DataSet ] );
  IBTrans.CommitRetaining;
end;

procedure TdtMod.tbContaAfterPost(DataSet: TDataSet);
begin
  ApplyUpdates(tbConta);
end;

procedure TdtMod.tbSocioAfterPost(DataSet: TDataSet);
begin
  ApplyUpdates(tbSocio);
end;

procedure TdtMod.Acao(mens: string);
begin
  // Grava Log
  qrLog.Append;
  qrLogMATRICULA.Value := frmMain.matricula;
  qrLogDATA.Value      := Date;
  qrLogHORA.Value      := Time;
  qrLogDESCRICAO.Value := mens;
  qrLog.Post;
  //qrLog.ApplyUpdates;
  if IBTrans.InTransaction then
    IBTrans.CommitRetaining;
end;

procedure TdtMod.DataModuleDestroy(Sender: TObject);
begin
  if IBTrans.InTransaction then
    IBTrans.Commit;
end;

end.

