unit untMovim;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, DBCGrids, Grids, DBGrids, RXDBCtrl, db, ExtCtrls,
  Printers, IniFiles, Buttons, RXSwitch, RXClock, MMSystem, Lcd99,
  TFlatSpeedButtonUnit;

type
  TfrmMovim = class(TForm)
    RxDBGrid1: TRxDBGrid;
    DBText1: TDBText;
    DBText3: TDBText;
    Label1: TLabel;
    Label3: TLabel;
    Timer1: TTimer;
    Label4: TLabel;
    Label5: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    swtImp: TRxSwitch;
    BitBtn3: TBitBtn;
    Label2: TLabel;
    Bevel4: TBevel;
    DBText2: TDBText;
    Bevel5: TBevel;
    Label6: TLabel;
    DBText4: TDBText;
    Bevel6: TBevel;
    GroupBox1: TGroupBox;
    btnCLientes: TSpeedButton;
    swtFecha: TRxSwitch;
    lblHora: TLCD99;
    btnAdiciona: TSpeedButton;
    FlatSpeedButton1: TFlatSpeedButton;
    MemoMens: TMemo;
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure btnAberturaClick(Sender: TObject);
    procedure btnFechamentoClick(Sender: TObject);
    procedure AtualizaMicros(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCLientesClick(Sender: TObject);
    procedure btnAdicionaClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure RxDBGrid1CellClick(Column: TColumn);
    procedure FlatSpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    valor, horas, horas2: real;
    data: TDateTime;
    procedure FechaAutomatico;
  end;

var
  frmMovim: TfrmMovim;

implementation

uses untDtMod, untFecha, untFuncoes, untAbreSessao, untMain, untIncTempo,
  untSocios;

{$R *.DFM}

procedure TfrmMovim.FechaAutomatico;
var
  MyFile: TextFile;
  nomeini, valortotal: string;
  hora: TDateTime;
  desctod, desctov, htot, huso, hacum, hcobra, vunit, vdescper,
  vtotal: real;
  reg, i, cods, codp: integer;
  Year, Month, Day, h, m, s, l: word;

begin
  nomeini := '\\' + dtMod.tbMicroNetName.AsString + '\c\windows\devsoft.ini';
  if dtMod.tbMicroEstado.Value = 'L' then
  begin
    Timer1.Enabled := True;
    raise exception.Create('Este micro não está em utilização !');
  end
  else
  if not FileExists(nomeini) then
  begin
    Timer1.Enabled := True;
    raise exception.Create('Este micro não está "on-line" !');
  end
  else
  begin
    hora := Now;
    reg := dtMod.tbMicro.RecNo;
    dtMod.tbMicro.Refresh;
    dtMod.tbMicroCalcFields(dtMod.tbMicro);
    dtMod.tbMicro.ApplyUpdates;
    if dtMod.IBTrans.InTransaction then
      dtMod.IBTrans.CommitRetaining;
    Update;
    dtMod.tbMicro.RecNo := reg;
    cods  := dtMod.tbMicroCODIGOSOCIO.Value;
    dtMod.tbSocio.Locate('CODIGOSOCIO', cods, []);
    codp  := dtMod.tbSocioCODIGOPLANO.Value;
    dtMod.tbPlano.Locate('CODIGOPLANO', codp, []);
    htot  := dtMod.tbPlanoHORAS.Value;
    dtMod.tbMicro.RecNo := reg;
    hacum := dtMod.tbSocioHorasAcumuladas.Value;
    horas := dtMod.tbMicroHorasParcial.Value;

    DecodeTime(horas, h, m, s, l);
    horas2 := h + m/60 + s/3600;

    DBText3.Refresh;

    // Se HorasAcumuladas for Maior que HorasPlano
    if hacum > htot then // cobra totalmente Horas Jogadas
      hcobra := horas
    else
      // Se HorasAcumuladas + HorasJogadas > HorasPlano
      if (hacum + horas2) > htot then // cobra diferença
      begin
         huso := (hacum + horas2) - htot;
         DecToTime(huso, h, m);
         hcobra := EncodeTime(h, m, 0, 0);
      end
      else
        hcobra := 0;

    if dtMod.tbMicroTIPO.Value = 'A' then
    begin
      valor   := dtMod.tbMicroValorParcial.Value;
      desctod := dtMod.tbMicroVALORUNITARIO.Value*(dtMod.tbEmpresaDELAY.Value/3600);
      if valor <  dtMod.tbMicroVALOR15.Value then
        valor := dtMod.tbMicroVALOR15.Value;

      if desctod > valor then desctod := valor;
      desctov := (valor-desctod)-int(valor-desctod);
    end
    else
      if hcobra > 0 then
      begin
        DecodeTime(hcobra, h, m, s, l);
        if h*60+m < 30 then
          vunit := dtMod.tbMicroVALOR15.Value*4
        else
        if h*60+m < 60 then
          vunit := dtMod.tbMicroVALOR30.Value*2
        else
          vunit := dtMod.tbMicroVALORUNITARIO.Value;

        valor   := vunit*(h + m/60 + s/3600);
        desctod := dtMod.tbMicroVALORUNITARIO.Value*(dtMod.tbEmpresaDELAY.Value/3600);
        if desctod > valor then desctod := valor;
        desctov := (valor-desctod)-int(valor-desctod);
      end
      else
      begin
        valor   := 0.00;
        desctod := 0.00;
        desctov := 0.00;
      end;

    if dtMod.tbMicroCORTESIA.Value = 'S' then
      valor := 0.00;

    //PEGA DESCONTO AUTOMÁTICO
    DecodeTime(hcobra, h, m, s, l);
    dtMod.sqlDescto.Open;
    dtMod.sqlDescto.First;
    vdescper := 0;
    while not dtMod.sqlDescto.Eof do
    begin
      if (h + m/60 + s/3600) >= dtMod.sqlDesctoHORAS.Value then
      begin
        vdescper := dtMod.sqlDesctoDESCONTO.Value;
        dtMod.sqlDescto.Last;
      end;
      dtMod.sqlDescto.Next;
    end;
    desctov := valor*vdescper/100;
    dtMod.sqlDescto.Close;

    valortotal := FloatToStrF(valor-(desctov+desctod), ffFixed, 15, 2);
    vtotal := StrToFloat(Copy(valortotal, 1, Length(valortotal)-1)+'0');
    desctov := desctov + (StrToFloat(valortotal)-vtotal);

    with dtMod do
    begin
      try
        tbMicro.Edit;
        tbMicroEstado.Value := 'L';
        tbMicro.ApplyUpdates;

        tbFechado.Append;
        tbFechadoDHInicial.Value     := tbMicroDHInicial.Value;
        tbFechadoCodigoMicro.Value   := tbMicroCodigoMicro.Value;
        tbFechadoDHFinal.asDateTime  := hora;
        tbFechadoHoras.Value         := horas;
        tbFechadoValorUnitario.Value := tbMicroValorUnitario.Value;
        tbFechadoValorTotal.Value    := valor;
        tbFechadoMATRICULA.Value     := frmMain.matricula;
        tbFechadoCODIGOSOCIO.Value   := tbMicroCODIGOSOCIO.Value;
        tbFechadoCORTESIA.Value      := tbMicroCORTESIA.Value;
        tbFechadoTEMPOESTIMADO.Value := tbMicroTEMPOESTIMADO.Value;
        tbFechadoTIPO.Value          := tbMicroTIPO.Value;
        tbFechadoCONTABILIZADO.Value := 'N';
        tbFechado.Post;
      except
      end;

      DecodeDate(tbFechadoDHINICIAL.AsDateTime, Year, Month, Day);
      if tbConta.Locate('CODIGOSOCIO;ANO;MES',VarArrayOf([tbFechadoCODIGOSOCIO.Value,Year,tbSocioMesAtual.Value]),[]) then
        tbConta.Edit
      else
      begin
        tbConta.Append;
        tbContaANO.Value := Year;
        tbContaMES.Value := tbSocioMesAtual.Value;
        tbContaCODIGOSOCIO.Value := tbFechadoCODIGOSOCIO.Value;
      end;
      DecodeTime(tbFechadoHoras.Value, h, m, s, l);
      tbContaACUMULADO.Value := tbContaACUMULADO.Value + (h+m/60);
      tbConta.Post;

      frmFechaSessao.lblDHInicial.Caption := DateTimeToStr(dtMod.tbMicroDHINICIAL.Value);
      frmFechaSessao.lblDHFinal.Caption   := DateTimeToStr(hora);
      frmFechaSessao.lblHTotal.Caption    := TimeToStr(hcobra);
      frmFechaSessao.lblSocio.Caption     := dtMod.tbMicroNomeSocio.AsString;
      frmFechaSessao.lblTotalP.Caption    := FloatToStrF(valor, ffCurrency, 15, 2);
      frmFechaSessao.lblDelay.Caption     := FloatToStrF(desctod, ffCurrency, 15, 2);
      frmFechaSessao.desctod              := desctod;
      frmFechaSessao.totalp               := valor;
      frmFechaSessao.CurrencyEdit1.Value  := desctov;
      frmFechaSessao.lblTotal.Caption     := FloatToStrF(vtotal, ffFixed, 15, 2);

      // Imprime Recibo
      AssignPrn(MyFile);
      if frmMain.usaNotePad then
        AssignFile(MyFile, ExtractFilePath(Application.ExeName) + 'Recibo.txt');
      ReWrite(MyFile);
      WriteLn(MyFile, '        L A N    P A R T Y  ');
      WriteLn(MyFile, '======================================');
      if frmMain.usaNotePad then
        WriteLn(MyFile, '');
      WriteLn(MyFile, 'Computador:        ' + dtMod.tbMicroDescricao.value);
      if dtMod.tbMicroCODIGOSOCIO.Value > 0 then
        WriteLn(MyFile, 'Socio:             ' + Copy(dtMod.tbMicroNomeSocio.value, 1, 20));
      WriteLn(MyFile, 'Data/Hora Inicial: ' + dtMod.tbMicroDHINICIAL.AsString);
      WriteLn(MyFile, 'Data/Hora Final:   ' + frmFechaSessao.lblDHFinal.Caption);
      WriteLn(MyFile, 'Hora Cobrada:      ' + frmFechaSessao.lblHTotal.Caption);
      WriteLn(MyFile, 'Desconto:          ' + frmFechaSessao.CurrencyEdit1.DisplayText);
      WriteLn(MyFile, 'Total a Pagar:     ' + frmFechaSessao.lblTotal.Caption);
      WriteLn(MyFile, '');
      WriteLn(MyFile, '--------------------------------------');
      WriteLn(MyFile, '                       devGuardian 2.6');
      for i := 1 to dtMod.tbEmpresaLINHAS.Value do
        WriteLn(MyFile, '');
      WriteLn(MyFile, '.');
      System.CloseFile (MyFile);

      reg := MemoMens.Lines.Count;
      for i := 0 to MemoMens.Lines.Count-1 do
        if Pos(dtMod.tbMicroDescricao.value, MemoMens.Lines[i]) > 0 then
          reg := i;

      if reg < MemoMens.Lines.Count then
        for i := 1 to 5 do
          MemoMens.Lines.Delete(reg);

      MemoMens.Lines.Insert(0,'==============================================');
      MemoMens.Lines.Insert(0,'Total: ' + frmFechaSessao.lblTotal.Caption);
      MemoMens.Lines.Insert(0,'Descto: ' + frmFechaSessao.CurrencyEdit1.DisplayText);
      MemoMens.Lines.Insert(0,'Socio: ' + Copy(dtMod.tbMicroNomeSocio.value, 1, 20));
      MemoMens.Lines.Insert(0,'Estação: ' + dtMod.tbMicroDescricao.value);

      nomeini := ExtractFilePath(Application.ExeName) + 'imp.bat';
      if frmMain.usaNotePad then
        winExec(PChar(nomeini), SW_SHOWNORMAL);

      with dtMod do
      begin
        tbMicro.Edit;
        tbMicroEstado.Value := 'L';
        tbMicroCODIGOSOCIO.Value := 0;
        tbMicroDHINICIAL.Clear;
        tbMicroVALORUNITARIO.Clear;
        tbMicroTEMPOESTIMADO.Clear;
        tbMicroTIPO.Clear;
        tbMicroCORTESIA.value := 'N';
        tbMicro.Post;
      end;

      if dtMod.IBTrans.InTransaction then
        dtMod.IBTrans.CommitRetaining;

      nomeini := '\\' + dtMod.tbMicroNetName.AsString + '\c\windows\efxtpgu.tmp';
      DeleteFile(nomeini);

      nomeini := 'c:\devsoft\' + dtMod.tbMicroNetName.AsString + '.lck';
      DeleteFile(nomeini);

    end;
  end;
  Timer1.Enabled := True;
end;

procedure TfrmMovim.RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor; Highlight: Boolean);
var
  emUso: string;

begin
  emUso := dtMod.tbMicroESTADO.AsString;
  if (emUso = 'L') or (emUso = '') or (emUso = ' ') then
  begin
    Background := clTeal;
    AFont.Color := clWhite;
  end
  else
  if emUso = 'U' then
  begin
    Background := clMaroon;
    AFont.Color := clWhite;
  end
  else
  begin
    Background := clYellow;
    AFont.Color := clBlack;
  end;
end;

procedure TfrmMovim.btnAberturaClick(Sender: TObject);
var
  dia, mes, ano, hoje: word;
  valor: array[1..3] of real;
  nomeini: string;
  data: TDateTime;
  MyFile: TextFile;
  i: integer;
  estad: string;
  estado: char;
  F: TextFile;

begin
  Timer1.Enabled := False;
  data := Now;
  nomeini := '\\' + dtMod.tbMicroNetName.AsString + '\c\windows\devSoft.ini';
  estad := Copy(dtMod.tbMicroEstado.AsString, 1, 1);
  if estad = '' then estad := 'L';
  estado := estad[1];
  if estado in ['E','U'] then
  begin
    Timer1.Enabled := True;
    raise exception.Create('Este micro já está em utilização !');
  end
  else
  if not FileExists(nomeini) then
  begin
    Timer1.Enabled := True;
    raise exception.Create('Este micro não está "on-line" !');
  end
  else
  begin
    Application.CreateForm(TfrmAbreSessao, frmAbreSessao);
    frmAbreSessao.Caption := 'Guardian - Abre Sessão [' + dtMod.tbMicroDESCRICAO.Value + ']';
    frmAbreSessao.edtCodigo.Clear;
    frmAbreSessao.DBEdtTempo.Text := '60';
    dtMod.tbSocio.IndexFieldNames := 'NOME';
    dtMod.tbMicro.Edit;
    dtMod.tbMicroCORTESIA.Value := 'N';
    dtMod.tbMicroCODIGOSOCIO.Value := 0;
    dtMod.tbSocio.Locate('NOME', 'SEM PLANO', []);

    if frmAbreSessao.ShowModal = mrOk then
    begin
      if dtMod.tbMicro.State <> dsEdit then
        dtMod.tbMicro.Edit;

      if frmAbreSessao.DBRadioGroup1.ItemIndex = 1 then
      begin
        dtMod.tbMicroCORTESIA.Value := 'S';
        dtMod.tbMicroTEMPOCORTESIA.Value := StrToInt(Trim(frmAbreSessao.DBEdtTempo.Text));
      end
      else
      begin
        dtMod.tbMicroCORTESIA.Value := 'N';
        dtMod.tbMicroTEMPOCORTESIA.Value := 0;
      end;

      dtMod.tbMicroTEMPOESTIMADO.Value := StrToInt(Trim(frmAbreSessao.DBEdtTempo.Text));

      if swtImp.StateOn then
      begin
        // Imprime Recibo de Entrada
        AssignPrn(MyFile);
        if frmMain.usaNotePad then
          AssignFile(MyFile, ExtractFilePath(Application.ExeName) + 'Recibo.txt');
        ReWrite(MyFile);
        WriteLn(MyFile, '        L A N    P A R T Y            ');
        WriteLn(MyFile, '======================================');
        if frmMain.usaNotePad then
          WriteLn ( MyFile, '');
        WriteLn(MyFile, 'Computador: ' + dtMod.tbMicroDescricao.value);
        WriteLn(MyFile, 'Data/Hora Inicial: ' + DateTimeToStr(data));
        WriteLn(MyFile, '');
        WriteLn(MyFile, '--------------------------------------');
        WriteLn(MyFile, '                       devGuardian 2.6');
        for i := 1 to dtMod.tbEmpresaLINHAS.Value do
          WriteLn(MyFile, '');
        WriteLn(MyFile, '.');
        system.CloseFile(MyFile);

        nomeini := ExtractFilePath(Application.ExeName) + 'imp.bat';
        if frmMain.usaNotePad then
          winExec(PChar(nomeini), SW_SHOWNORMAL);
      end;

      DecodeDate(data, Ano, Mes, Dia);

      if dtMod.tbMicroCODIGOSOCIO.Value = 0 then
        dtMod.tbMicroTIPO.Value := 'A'
      else
        dtMod.tbMicroTIPO.Value := 'P';

      if dtMod.tbFeriado.Locate('dia;mes', VarArrayOf([dia,mes]), []) then
        hoje := 0
      else
        hoje := DayOfWeek(data);

      dtMod.tbPreco.Locate('CODIGODIASEMANA',hoje,[]);

      if (dtMod.tbMicroTIPO.Value <> 'A') and
         (dtMod.tbSocioCODIGOPLANO.Value > 0) then
      begin
        valor[1] := dtMod.tbPrecoSOCIO15.Value;
        valor[2] := dtMod.tbPrecoSOCIO30.Value;
        valor[3] := dtMod.tbPrecoVALORSOCIO.Value;
      end
      else
      begin
        valor[1] := dtMod.tbPrecoAVULSO15.Value;
        valor[2] := dtMod.tbPrecoAVULSO30.Value;
        valor[3] := dtMod.tbPrecoVALORAVULSO.Value;
      end;

      dtMod.tbMicroDHInicial.AsDateTime := Now;
      dtMod.tbMicroVALOR15.Value := valor[1];
      dtMod.tbMicroVALOR30.Value := valor[2];
      dtMod.tbMicroValorUnitario.Value := valor[3];
      dtMod.tbMicroEstado.Value := 'U';
      dtMod.tbMicro.Post;
      dtMod.tbMicro.ApplyUpdates;

      if dtMod.IBTrans.InTransaction then
        dtMod.IBTrans.CommitRetaining;

      nomeini := '\\' + dtMod.tbMicroNetName.AsString + '\c\windows\efxtpgu.tmp';
      AssignFile(F, nomeini);
      ReWrite(F);
      Write(F, 'uyoiu ygnfhg±°Çüé+_¦¯¯ßnvshldkhfs lnjhldsjfhg d¦È?¸+');
      CloseFile(F);

      nomeini := 'c:\devsoft\' + dtMod.tbMicroNetName.AsString + '.lck';
      AssignFile(F, nomeini);
      ReWrite(F);
      Write(F, 'devSoft Informática');
      CloseFile(F);

      Timer1.Enabled := True;

    end
    else
      dtMod.tbMicro.Cancel;

    dtMod.tbSocio.IndexFieldNames := '';
  end;
end;

procedure TfrmMovim.btnFechamentoClick(Sender: TObject);
var
  MyFile: TextFile;
  nomeini, valortotal: string;
  hora: TDateTime;
  desctod, desctov, htot, huso, hacum, hcobra, vunit, vdescper,
  vtotal: real;
  reg, i, cods, codp: integer;
  Year, Month, Day, h, m, s, l: word;

begin
  Timer1.Enabled := False;
  nomeini := '\\' + dtMod.tbMicroNetName.AsString + '\c\windows\devsoft.ini';
  if dtMod.tbMicroEstado.Value = 'L' then
  begin
    Timer1.Enabled := True;
    raise exception.Create('Este micro não está em utilização !');
  end
  else
  if not FileExists(nomeini) then
  begin
    Timer1.Enabled := True;
    raise exception.Create('Este micro não está "on-line" !');
  end
  else
  begin
    hora := Now;
    reg := dtMod.tbMicro.RecNo;
    dtMod.tbMicro.Refresh;
    dtMod.tbMicroCalcFields(dtMod.tbMicro);
    dtMod.tbMicro.ApplyUpdates;
    if dtMod.IBTrans.InTransaction then
      dtMod.IBTrans.CommitRetaining;
    Update;
    dtMod.tbMicro.RecNo := reg;
    cods  := dtMod.tbMicroCODIGOSOCIO.Value;
    dtMod.tbSocio.Locate('CODIGOSOCIO', cods, []);
    codp  := dtMod.tbSocioCODIGOPLANO.Value;
    dtMod.tbPlano.Locate('CODIGOPLANO', codp, []);
    htot  := dtMod.tbPlanoHORAS.Value;
    dtMod.tbMicro.RecNo := reg;
    hacum := dtMod.tbSocioHorasAcumuladas.Value;
    horas := dtMod.tbMicroHorasParcial.Value;

    DecodeTime(horas, h, m, s, l);
    horas2 := h + m/60 + s/3600;

    DBText3.Refresh;

    // Se HorasAcumuladas for Maior que HorasPlano
    if hacum > htot then // cobra totalmente Horas Jogadas
      hcobra := horas
    else
      // Se HorasAcumuladas + HorasJogadas > HorasPlano
      if (hacum + horas2) > htot then // cobra diferença
      begin
         huso := (hacum + horas2) - htot;
         DecToTime(huso, h, m);
         hcobra := EncodeTime(h, m, 0, 0);
      end
      else
        hcobra := 0;

    if dtMod.tbMicroTIPO.Value = 'A' then
    begin
      valor   := dtMod.tbMicroValorParcial.Value;
      if valor <  dtMod.tbMicroVALOR15.Value then
        valor := dtMod.tbMicroVALOR15.Value;

      desctod := dtMod.tbMicroVALORUNITARIO.Value*(dtMod.tbEmpresaDELAY.Value/3600);

      if desctod > valor then desctod := valor;
      desctov := (valor-desctod)-int(valor-desctod);
      frmFechaSessao.CurrencyEdit1.Enabled := True;

    end
    else
      if hcobra > 0 then
      begin
        DecodeTime(hcobra, h, m, s, l);
        if h*60+m < 30 then
          vunit := dtMod.tbMicroVALOR15.Value*4
        else
        if h*60+m < 60 then
          vunit := dtMod.tbMicroVALOR30.Value*2
        else
          vunit := dtMod.tbMicroVALORUNITARIO.Value;

        valor   := vunit*(h + m/60 + s/3600);
        desctod := dtMod.tbMicroVALORUNITARIO.Value*(dtMod.tbEmpresaDELAY.Value/3600);
        if desctod > valor then desctod := valor;
        desctov := (valor-desctod)-int(valor-desctod);
        frmFechaSessao.CurrencyEdit1.Enabled := True;
      end
      else
      begin
        valor   := 0.00;
        desctod := 0.00;
        desctov := 0.00;
        frmFechaSessao.CurrencyEdit1.Enabled := False;
      end;

    //PEGA DESCONTO AUTOMÁTICO
    DecodeTime(hcobra, h, m, s, l);
    dtMod.sqlDescto.Open;
    dtMod.sqlDescto.First;
    vdescper := 0;
    while not dtMod.sqlDescto.Eof do
    begin
      if (h + m/60 + s/3600) >= dtMod.sqlDesctoHORAS.Value then
      begin
        vdescper := dtMod.sqlDesctoDESCONTO.Value;
        dtMod.sqlDescto.Last;
      end;
      dtMod.sqlDescto.Next;
    end;

    desctov := valor*vdescper/100;
    dtMod.sqlDescto.Close;

    valortotal := FloatToStrF(valor-(desctov+desctod), ffFixed, 15, 2);
    vtotal := StrToFloat(Copy(valortotal, 1, Length(valortotal)-1)+'0');
    desctov := desctov + (StrToFloat(valortotal)-vtotal);

    frmFechaSessao.Caption := 'Guardian - Fecha Sessão [' + dtMod.tbMicroDESCRICAO.Value + ']';
    frmFechaSessao.lblDHInicial.Caption := DateTimeToStr(dtMod.tbMicroDHINICIAL.Value);
    frmFechaSessao.lblDHFinal.Caption := DateTimeToStr(hora);
    frmFechaSessao.lblHTotal.Caption := TimeToStr(hcobra);
    frmFechaSessao.lblSocio.Caption := dtMod.tbMicroNomeSocio.AsString;

    frmFechaSessao.lblTotalP.Caption := FloatToStrF(valor, ffCurrency, 15, 2);
    frmFechaSessao.lblDelay.Caption  := FloatToStrF(desctod, ffCurrency, 15, 2);
    frmFechaSessao.desctod := desctod;
    frmFechaSessao.totalp  := valor;
    frmFechaSessao.CurrencyEdit1.Value := desctov;
    frmFechaSessao.CurrencyEdit1.Enabled := False;
    frmFechaSessao.lblTotal.Caption := FloatToStrF(valor-(desctov+desctod), ffFixed, 15, 2);

    if frmFechaSessao.ShowModal = mrOk then
    begin
      if (dtMod.tbMicroCORTESIA.Value <> 'S') then
        valor := StrToFloat(frmFechaSessao.lblTotal.Caption)
      else
        valor := 0.00;

      with dtMod do
      begin
        try
        tbMicro.Edit;
        tbMicroEstado.Value := 'L';
        tbMicro.ApplyUpdates;

        tbFechado.Append;
        tbFechadoDHInicial.Value     := tbMicroDHInicial.Value;
        tbFechadoCodigoMicro.Value   := tbMicroCodigoMicro.Value;
        tbFechadoDHFinal.asDateTime  := hora;
        tbFechadoHoras.Value         := horas;
        tbFechadoValorUnitario.Value := tbMicroValorUnitario.Value;
        tbFechadoValorTotal.Value    := valor;
        tbFechadoMATRICULA.Value     := frmMain.matricula;
        tbFechadoCODIGOSOCIO.Value   := tbMicroCODIGOSOCIO.Value;
        tbFechadoCORTESIA.Value      := tbMicroCORTESIA.Value;
        tbFechadoTEMPOESTIMADO.Value := tbMicroTEMPOESTIMADO.Value;
        tbFechadoTIPO.Value          := tbMicroTIPO.Value;
        tbFechadoCONTABILIZADO.Value := 'N';
        tbFechado.Post;
        except
        end;

        DecodeDate(tbFechadoDHINICIAL.AsDateTime, Year, Month, Day);
        if tbConta.Locate('CODIGOSOCIO;ANO;MES',VarArrayOf([tbFechadoCODIGOSOCIO.Value,Year,tbSocioMesAtual.Value]),[]) then
          tbConta.Edit
        else
        begin
          tbConta.Append;
          tbContaANO.Value := Year;
          tbContaMES.Value := tbSocioMesAtual.Value;
          tbContaCODIGOSOCIO.Value := tbFechadoCODIGOSOCIO.Value;
        end;
        DecodeTime(tbFechadoHoras.Value, h, m, s, l);
        tbContaACUMULADO.Value := tbContaACUMULADO.Value + (h+m/60);
        tbConta.Post;
      end;

      if swtFecha.StateOn then
      begin
        // Imprime Recibo
        AssignPrn(MyFile);
        if frmMain.usaNotePad then
          AssignFile(MyFile, ExtractFilePath(Application.ExeName) + 'Recibo.txt');
        ReWrite(MyFile);
        WriteLn(MyFile, '        L A N    P A R T Y  ');
        WriteLn(MyFile, '======================================');
        if frmMain.usaNotePad then
          WriteLn(MyFile, '');
        WriteLn(MyFile, 'Computador:        ' + dtMod.tbMicroDescricao.value);
        if dtMod.tbMicroCODIGOSOCIO.Value > 0 then
          WriteLn(MyFile, 'Socio:             ' + Copy(dtMod.tbMicroNomeSocio.value, 1, 20));
        WriteLn(MyFile, 'Data/Hora Inicial: ' + frmFechaSessao.lblDHInicial.Caption);
        WriteLn(MyFile, 'Data/Hora Final:   ' + frmFechaSessao.lblDHFinal.Caption);
        WriteLn(MyFile, 'Hora Cobrada:      ' + frmFechaSessao.lblHTotal.Caption);
        WriteLn(MyFile, 'Desconto:          ' + frmFechaSessao.CurrencyEdit1.DisplayText);
        WriteLn(MyFile, 'Total a Pagar:     ' + frmFechaSessao.lblTotal.Caption);
        WriteLn(MyFile, '');
        WriteLn(MyFile, '--------------------------------------');
        WriteLn(MyFile, '                       devGuardian 2.6');
        for i := 1 to dtMod.tbEmpresaLINHAS.Value do
          WriteLn(MyFile, '');
        WriteLn(MyFile, '.');
        System.CloseFile (MyFile);

        nomeini := ExtractFilePath(Application.ExeName) + 'imp.bat';
        if frmMain.usaNotePad then
          winExec(PChar(nomeini), SW_SHOWNORMAL);
      end;

      with dtMod do
      begin
        tbMicro.Edit;
        tbMicroEstado.Value := 'L';
        tbMicroCODIGOSOCIO.Value := 0;
        tbMicroDHINICIAL.Clear;
        tbMicroVALORUNITARIO.Clear;
        tbMicroTEMPOESTIMADO.Clear;
        tbMicroTIPO.Clear;
        tbMicroCORTESIA.value := 'N';
        tbMicro.Post;
      end;

      if dtMod.IBTrans.InTransaction then
        dtMod.IBTrans.CommitRetaining;

      nomeini := '\\' + dtMod.tbMicroNetName.AsString + '\c\windows\efxtpgu.tmp';
      DeleteFile(nomeini);

      nomeini := 'c:\devsoft\' + dtMod.tbMicroNetName.AsString + '.lck';
      DeleteFile(nomeini);
    end;
  end;
  Timer1.Enabled := True;

end;

procedure TfrmMovim.AtualizaMicros(Sender: TObject);
var
  h, m, s, l: word;
  registro: integer;
  toca, grava: boolean;

begin
  lblHora.Value := TimeToStr(Now);
  toca := False;
  grava := False;
  if (dtMod.tbMicro.Active) then
  begin
    registro := dtMod.tbMicro.RecNo;
    dtMod.tbMicro.DisableControls;
    dtMod.tbMicro.First;
    while not dtMod.tbMicro.Eof do
    begin
      lblHora.Value := TimeToStr(Now);
      DecodeTime(dtMod.tbMicroHorasParcial.Value, h, m, s, l);
      if ((h*60+m+frmMain.tempo_expira) >= dtMod.tbMicroTEMPOESTIMADO.Value) and
         (dtMod.tbMicroESTADO.Value = 'U') then
      begin
        dtMod.tbMicro.Edit;
        dtMod.tbMicroESTADO.Value := 'E';
        dtMod.tbMicro.ApplyUpdates;
        toca := True;
        grava := True;
      end
      else
        if ((h*60+m) >= dtMod.tbMicroTEMPOESTIMADO.Value) and
           (dtMod.tbMicroESTADO.Value = 'E') then
          FechaAutomatico
        else
        if (dtMod.tbMicroESTADO.Value = 'E') and
           ((h*60+m+frmMain.tempo_expira) < dtMod.tbMicroTEMPOESTIMADO.Value) then
        begin
          dtMod.tbMicro.Edit;
          dtMod.tbMicroESTADO.Value := 'U';
          dtMod.tbMicro.ApplyUpdates;
          grava := True;
        end;

      dtMod.tbMicro.Next;
    end;
    dtMod.tbMicro.RecNo := registro;
    dtMod.tbMicro.EnableControls;
    Label5.Caption := Dec2Hora(dtMod.tbMicroHorasParcial.Value);
    lblHora.Value := TimeToStr(Now);
  end;

  if grava and dtMod.IBTrans.InTransaction then
    dtMod.IBTrans.CommitRetaining ;

  lblHora.Value := TimeToStr(Now);

  if toca then
    SndPlaySound('devSoft.wav', SND_ASYNC);

  lblHora.Value := TimeToStr(Now);
end;

procedure TfrmMovim.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmMovim.FormShow(Sender: TObject);
begin
  Timer1.Enabled := True;
end;

procedure TfrmMovim.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Timer1.Enabled := False;
  if dtMod.IBTrans.InTransaction then
    dtMod.IBTrans.CommitRetaining;
end;

procedure TfrmMovim.btnCLientesClick(Sender: TObject);
begin
  Timer1.Enabled := False;
  frmSocios.ShowModal;
  Timer1.Enabled := True;
end;

procedure TfrmMovim.btnAdicionaClick(Sender: TObject);
var
  emUs: string;
  emUso: char;

begin
  Timer1.Enabled := False;
  emUs := dtMod.tbMicroESTADO.AsString;
  emUso := emUs[1];
  if emUso in ['E','U'] then
  begin
    Application.CreateForm(TfrmIncTempo, frmIncTempo);
    frmIncTempo.Caption := 'Adiciona Tempo [' + dtMod.tbMicroDESCRICAO.Value + ']';
    if frmIncTempo.ShowModal = mrOk then
    begin
      dtMod.tbMicro.Edit;
      dtMod.tbMicroTEMPOESTIMADO.Value := dtMod.tbMicroTEMPOESTIMADO.Value +
                                          StrToInt(frmIncTempo.cboxTempo.Text);
      dtMod.tbMicro.ApplyUpdates;
      if dtMod.IBTrans.InTransaction then
        dtMod.IBTrans.CommitRetaining;

    end;
  end;
  Timer1.Enabled := True;
end;

procedure TfrmMovim.Timer1Timer(Sender: TObject);
var
  agora: TDateTime;
  h, m, s, l: word;

begin
  Timer1.Enabled := False;
  agora := Now;

  DecodeTime(agora, h, m, s, l);
  if s in [0, 10, 20, 30, 40, 50] then
    AtualizaMicros(Sender);

  lblHora.Value := TimeToStr(Now);
  Label5.Caption := Dec2Hora(dtMod.tbMicroHorasParcial.Value);

  Timer1.Enabled := True;
end;

procedure TfrmMovim.RxDBGrid1CellClick(Column: TColumn);
begin
  dtMod.tbMicro.OnCalcFields(dtMod.tbMicro);
  if not Timer1.Enabled then
    Timer1.Enabled := True;
end;

procedure TfrmMovim.FlatSpeedButton1Click(Sender: TObject);
var
  Quant:Real;
  valor: string;

begin
  Quant := dtMod.tbEmpresaLANCTO.Value;
  dtMod.tbEmpresa.Edit;
  valor := '1,00';
  valor := InputBox('Venda','Entre com o valor da venda', valor);
  if valor <> '' then
  begin
    dtMod.tbEmpresaLANCTO.Value := Quant + StrToFloat(valor);
    dtMod.tbEmpresa.Post;
    dtMod.ApplyUpdates( dtMod.tbEmpresa );//atualiza fisicamente na tabela
  end;
end;

end.
