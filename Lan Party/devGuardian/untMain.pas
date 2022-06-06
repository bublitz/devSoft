unit untMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, ImgList, Grids, ScktComp, DBGrids,
  MMSystem, IniFiles, Buttons, DB;

type
  TfrmMain = class(TForm)
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    imgFechar2: TImage;
    imgRefr2: TImage;
    imgLogin: TImage;
    imgFechar1: TImage;
    Image21: TImage;
    Image22: TImage;
    Image23: TImage;
    Image24: TImage;
    Shape1: TShape;
    Image26: TImage;
    Image27: TImage;
    Image28: TImage;
    lblHora: TLabel;
    Timer1: TTimer;
    ListView1: TListView;
    ListView2: TListView;
    ListView3: TListView;
    lblDis: TLabel;
    lblUso: TLabel;
    lblExp: TLabel;
    imgIcon: TImageList;
    memLog: TMemo;
    grdCli: TStringGrid;
    lblMens: TLabel;
    lblCliAberto: TLabel;
    sktServer: TServerSocket;
    Bevel1: TBevel;
    lblCliente: TLabel;
    imgRemoto: TImage;
    lblLoja: TLabel;
    labClientes: TLabel;
    labLancto: TLabel;
    labPromo: TLabel;
    labProdutos: TLabel;
    labBonus: TLabel;
    labMilhagem: TLabel;
    labHoras: TLabel;
    Panel1: TPanel;
    Image9: TImage;
    imgCaixa2: TImage;
    imgCaixa1: TImage;
    lblUser: TLabel;
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sktServerClientConnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure sktServerClientRead(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ListView2SelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure ListView1Click(Sender: TObject);
    procedure imgRefr2Click(Sender: TObject);
    procedure ListView2Click(Sender: TObject);
    procedure ListView3Click(Sender: TObject);
    procedure imgFechar2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure imgLoginClick(Sender: TObject);
    procedure imgCaixa2Click(Sender: TObject);
    procedure imgCaixa1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    data_atual: TDate;
    num_estacao, porta, cod_usuario: integer;
    toca_alarme, caixa_aberto: boolean;
    valor: array[1..3] of real;
    som_alarme, som_caixa: string;
    Procedure Expirou(nEst:integer);
  end;

  TEstacao = record
    codigo: integer;
    descricao: string;
    netname: string;
    ip: string;
    estado: string;
    codigocliente: integer;
    nomecliente: string;
    data: TDateTime;
    hora: TDateTime;
    horas: real;
    valor: real;
    numinterno: integer;
    tempototal: real;
  end;

  TCli = record
    codloja: integer;
    codclie: integer;
    apelido: string;
    horas: real;
    valor: real;
  end;

var
  frmMain: TfrmMain;
  estacao: array of TEstacao;
  cliente: array of TCli;

implementation

uses untDatModPrinc, untFuncoes, untData, untFlash, untLogin;

{$R *.dfm}

procedure TfrmMain.Expirou(nEst:integer);
var
  novo: TListItem;
  l, i: integer;

begin
  // Expirou Estação
  toca_alarme := True;
  novo := ListView3.Items.Add;
  l := estacao[nEst].numinterno;
  i := novo.Index;

  ListView3.Items[i].Caption := ListView2.Items[l].Caption;
  ListView3.Items[i].ImageIndex := 0;
  ListView2.Items[l].Destroy;
  ListView2.Realign;

  lblDis.Caption := 'Estações Disponíveis: ' + IntToStr(ListView1.Items.Count);
  lblUso.Caption := 'Estações em Uso: '      + IntToStr(ListView2.Items.Count);
  lblExp.Caption := 'Estações Expiradas: '   + IntToStr(ListView3.Items.Count);

  estacao[nEst].numinterno := i;
  estacao[nEst].estado     := 'E';

  with dmPrinc do
  begin
    SQLConLocal.StartTransaction(TransDesc);
    sqlEstacao.Locate('CODIGOESTACAO', estacao[nEst].codigo, []);
    sqlEstacao.Edit;
    sqlEstacaoESTADO.Value := 'E';
    sqlEstacao.Post;
    sqlEstacao.ApplyUpdates(-1);
    SQLConLocal.Commit(TransDesc);
  end;

end;

procedure TfrmMain.Timer1Timer(Sender: TObject);
var
  i: integer;

begin
  lblHora.Caption := TimeToStr(Time);
  toca_alarme := False;
  for i := 0 to num_estacao-1 do
    if estacao[i].estado = 'U' then
    begin
      estacao[i].horas := Time - estacao[i].hora;
      if estacao[i].horas > estacao[i].tempototal then
        Expirou(i);
    end;
  if toca_alarme then
    SndPlaySound(PChar(som_alarme), SND_ASYNC);
end;

procedure TfrmMain.FormShow(Sender: TObject);
var
  e1, e2, e3, i: integer;
  dia, mes, ano, diasem: word;
  feriado: boolean;
  nomeferiado: string;

begin
  // Todos os botões estão desabilitados até Login
  imgFechar1.Visible  := True;
  imgFechar2.Visible  := False;
  imgLogin.Hint       := 'Login';
  labClientes.Visible := False;
  labLancto.Visible   := False;
  labPromo.Visible    := False;
  labProdutos.Visible := False;
  labBonus.Visible    := False;
  labMilhagem.Visible := False;
  labHoras.Visible    := False;

  imgRemoto.Visible := not dmPrinc.online;

  e1 := 0;
  e2 := 0;
  e3 := 0;
  i  := 0;
  dmPrinc.sqlCliente.Open;
  dmPrinc.sqlLoja.Open;
  dmPrinc.sqlEstacao.Open;
  dmPrinc.sqlMovim.Open;
  dmPrinc.sqlPreco.Open;
  dmPrinc.sqlFeriado.Open;
  dmPrinc.sqlUsuario.Open;
  dmPrinc.sqlLog.Open;
  dmPrinc.sqlCaixa.Open;

  lblLoja.Caption := dmPrinc.sqlLojaNOMEFANTASIA.AsString;

  DecodeDate(data_atual, Ano, Mes, Dia);
  feriado := dmPrinc.sqlFeriado.FindKey([dia,mes]);
  if feriado then
  begin
    nomeferiado := dmPrinc.sqlFeriadoDESCRICAO.AsString;
    diasem := 0;
  end
  else
  begin
    nomeferiado := '';
    diasem := DayOfWeek(data_atual);
  end;

  dmPrinc.sqlPreco.FindKey([diasem]);
  valor[1] := dmPrinc.sqlPrecoSOCIO15.Value;
  valor[2] := dmPrinc.sqlPrecoSOCIO30.Value;
  valor[3] := dmPrinc.sqlPrecoSOCIO60.Value;

  memLog.Lines.Clear;
  if feriado then
    memLog.Lines.Add('Hoje é ' + DateToStr(data_atual) + ', ' + nomeferiado + '.')
  else
    memLog.Lines.Add('Hoje é ' + DateToStr(data_atual) + '.');

  memLog.Lines.Add(Format('15m: %3.2f',[valor[1]]) +
                   Format(' / 30m: %3.2f',[valor[2]]) +
                   Format(' / 60m: %3.2f',[valor[3]]));

  dmPrinc.sqlCaixa.Open;
  dmPrinc.sqlCaixa.Last;

  caixa_aberto := (dmPrinc.sqlCaixaDATAABERTURA.AsFloat <> 0) and (dmPrinc.sqlCaixaDATAFECHAMENTO.AsFloat = 0);

  memLog.Lines.Add('Situação do Caixa: ' + iif(caixa_aberto, 'ABERTO', 'FECHADO'));
  imgCaixa1.Visible := caixa_aberto;
  imgCaixa2.Visible := not caixa_aberto;

  num_estacao := dmPrinc.sqlEstacao.RecordCount;
  SetLength(estacao, num_estacao);

  while not dmPrinc.sqlEstacao.Eof do
  begin
    estacao[i].codigo    := dmPrinc.sqlEstacaoCODIGOESTACAO.AsInteger;
    estacao[i].descricao := dmPrinc.sqlEstacaoDESCRICAO.AsString;
    estacao[i].estado    := dmPrinc.sqlEstacaoESTADO.AsString;
    estacao[i].ip        := dmPrinc.sqlEstacaoIP.AsString;
    estacao[i].netname   := dmPrinc.sqlEstacaoNETNAME.AsString;

    if dmPrinc.sqlEstacaoESTADO.AsString = 'A' then
    begin
      ListView1.Items.Add;
      ListView1.Items[e1].Caption := dmPrinc.sqlEstacaoDESCRICAO.asString;
      ListView1.Items[e1].ImageIndex := 0;
      estacao[i].numinterno := e1;
      inc(e1);
    end
    else
    if dmPrinc.sqlEstacaoESTADO.AsString = 'U' then
    begin
      ListView2.Items.Add;
      ListView2.Items[e2].Caption := dmPrinc.sqlEstacaoDESCRICAO.asString;
      ListView2.Items[e2].ImageIndex := 0;
      estacao[i].numinterno := e2;
      inc(e2);
      estacao[i].codigocliente := dmPrinc.sqlMovimCODIGOCLIENTE.AsInteger;
      estacao[i].nomecliente   := dmPrinc.sqlMovimNickCliente.AsString;
      estacao[i].data          := dmPrinc.sqlMovimDATA.Value;
      estacao[i].hora          := dmPrinc.sqlMovimHORA.Value;
      estacao[i].horas         := dmPrinc.sqlMovimHORAS.Value;
      estacao[i].valor         := dmPrinc.sqlMovimVALORUNITARIO.Value;
      estacao[i].tempototal    := dmPrinc.sqlMovimTEMPOESTIMADO.Value;
    end
    else
    if dmPrinc.sqlEstacaoESTADO.AsString = 'E' then
    begin
      ListView3.Items.Add;
      ListView3.Items[e3].Caption := dmPrinc.sqlEstacaoDESCRICAO.asString;
      ListView3.Items[e3].ImageIndex := 0;
      estacao[i].numinterno := e3;
      inc(e3);
      estacao[i].codigocliente := dmPrinc.sqlMovimCODIGOCLIENTE.AsInteger;
      estacao[i].nomecliente   := dmPrinc.sqlMovimNickCliente.AsString;
      estacao[i].data          := dmPrinc.sqlMovimDATA.Value;
      estacao[i].hora          := dmPrinc.sqlMovimHORA.Value;
      estacao[i].horas         := dmPrinc.sqlMovimHORAS.Value;
      estacao[i].valor         := dmPrinc.sqlMovimVALORUNITARIO.Value;
      estacao[i].tempototal    := dmPrinc.sqlMovimTEMPOESTIMADO.Value;
    end;
    inc(i);
    dmPrinc.sqlEstacao.Next;
  end;

  lblDis.Caption := 'Estações Disponíveis: ' + IntToStr(ListView1.Items.Count);
  lblUso.Caption := 'Estações em Uso: '      + IntToStr(ListView2.Items.Count);
  lblExp.Caption := 'Estações Expiradas: '   + IntToStr(ListView3.Items.Count);

  // Ativa Socket
  sktServer.Active := True;

  //Ativa Timer
  Timer1.Enabled := True;

  frmSplash.Hide;
  frmSplash.Free;
  
end;

procedure TfrmMain.sktServerClientConnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  if sktServer.Socket.ActiveConnections > 1 then
  begin
    Socket.SendText('NO:01');
    Socket.Close;
  end;
end;

procedure TfrmMain.sktServerClientRead(Sender: TObject;
  Socket: TCustomWinSocket);
var
  novo: TListItem;
  mens, nome, pass, esta, ha, hm, hb, ht: string;
  hcobra: real;
  p, i, l, ncli: integer;
  achou: boolean;

begin
  mens := Socket.ReceiveText;
  //Abrir Sessão
  if Copy(mens, 1, 3) = 'AS:' then
  begin
    esta := Socket.RemoteAddress;
    achou := False;

    for p := 0 to num_estacao-1 do
      if estacao[p].ip = esta then
      begin
        achou := True;
        break;
      end;

    if achou and (estacao[p].estado = 'A') then
    begin
      l := Length(mens);
      i := Pos(';', mens);
      nome := Copy(mens, 5, i-5);
      pass := Copy(mens, i+1, l-i);
      if (dmPrinc.sqlCliente.Locate('NomeLogin', nome, [])) and
         (dmPrinc.sqlClienteSENHALOGIN.AsString=pass) then
      begin // tudo ok - pode logar
        ha := dTimeToStr(dmPrinc.sqlClienteHORASANTECIP.AsFloat);
        hm := dTimeToStr(dmPrinc.sqlClienteBONUS.AsFloat);
        hb := dTimeToStr(dmPrinc.sqlClienteHORASMILHAGEM.AsFloat);
        ht := dTimeToStr(dmPrinc.sqlClienteHORASANTECIP.AsFloat +
                         dmPrinc.sqlClienteBONUS.AsFloat +
                         dmPrinc.sqlClienteHORASMILHAGEM.AsFloat);

        mens := 'OK:Olá ' + dmPrinc.sqlClienteNICKNAME.AsString + '.'#13#13 +
          'Sua situação de crédito é:'#13 +
          Format('Horas Antecipadas: %s'#13 +
                 'Bônus: %s'#13 +
                 'Milhagem: %s'#13 + #13 +
                 'TOTAL: %s', [ha, hm, hb, ht]);
          //Format('%8.2f', [123.456])

        Socket.SendText(mens);

        // Abre estação
        novo := ListView2.Items.Add;
        l := estacao[p].numinterno;
        i := novo.Index;

        ListView2.Items[i].Caption := ListView1.Items[l].Caption;
        ListView2.Items[i].ImageIndex := 0;
        ListView1.Items[l].Destroy;
        ListView1.Realign;

        lblDis.Caption := 'Estações Disponíveis: ' + IntToStr(ListView1.Items.Count);
        lblUso.Caption := 'Estações em Uso: '      + IntToStr(ListView2.Items.Count);

        estacao[p].codigocliente := dmPrinc.sqlClienteCODIGOCLIENTE.AsInteger;
        estacao[p].nomecliente   := dmPrinc.sqlClienteNICKNAME.AsString;
        estacao[p].tempototal    := dmPrinc.sqlClienteBONUS.AsFloat +
                                    dmPrinc.sqlClienteHORASANTECIP.AsFloat +
                                    dmPrinc.sqlClienteHORASMILHAGEM.AsFloat;
        estacao[p].data          := data_atual;
        estacao[p].hora          := Time;
        estacao[p].estado        := 'U';
        estacao[p].numinterno    := i;

        with dmPrinc do
        begin
          SQLConLocal.StartTransaction(TransDesc);
          sqlMovim.Append;
          sqlMovimCODIGOLOJA.AsInteger    := sqlLojaCODIGOLOJA.AsInteger;
          sqlMovimCODIGOESTACAO.AsInteger := estacao[p].codigo;
          sqlMovimCODIGOCLIENTE.AsInteger := estacao[p].codigocliente;
          sqlMovimDATA.Value              := estacao[p].data;
          sqlMovimHORA.Value              := estacao[p].hora;
          sqlMovimHORAS.Value             := estacao[p].horas;
          sqlMovimTEMPOESTIMADO.Value     := estacao[p].tempototal;
          sqlMovimTIPO.Value              := 'A';
          sqlMovim.Post;
          sqlMovim.ApplyUpdates(-1);

          sqlEstacao.Locate('CODIGOESTACAO', estacao[p].codigo, []);
          sqlEstacao.Edit;
          sqlEstacaoESTADO.Value := 'U';
          sqlEstacao.Post;
          sqlEstacao.ApplyUpdates(-1);

          SQLConLocal.Commit(TransDesc);
        end;
      end
      else
        Socket.SendText('NO:02');
    end
    else
      Socket.SendText('NO:03');
  end
  else
  // Fechar Sessão
  if mens = 'FS:' then
  begin
    esta := Socket.RemoteAddress;
    achou := False;

    for p := 0 to num_estacao-1 do
      if estacao[p].ip = esta then
      begin
        achou := True;
        break;
      end;

    if achou and (estacao[p].estado <> 'A') then
    begin
      Socket.SendText('OK:');

      // Fecha estação
      novo := ListView1.Items.Add;
      l := estacao[p].numinterno;
      i := novo.Index;

      if estacao[p].estado = 'U' then
      begin
        ListView1.Items[i].Caption := ListView2.Items[l].Caption;
        ListView1.Items[i].ImageIndex := 0;
        ListView2.Items[l].Destroy;
        ListView2.Realign;
      end
      else
      begin
        ListView1.Items[i].Caption := ListView3.Items[l].Caption;
        ListView1.Items[i].ImageIndex := 0;
        ListView3.Items[l].Destroy;
        ListView3.Realign;

        Timer1.Enabled := False;

        estacao[p].horas := Time - estacao[p].hora;
        hcobra := estacao[p].horas - estacao[p].tempototal;

        ncli := Length(cliente) + 1;
        SetLength(cliente, ncli);

        cliente[ncli-1].codloja := dmPrinc.sqlLojaCODIGOLOJA.AsInteger;
        cliente[ncli-1].codclie := estacao[p].codigocliente;
        cliente[ncli-1].apelido := estacao[p].nomecliente;
        cliente[ncli-1].horas   := hcobra;
        // Calcula valor a pagar e adiciona a lista de espera
        // PAREI AQUI !!!

        if nCli > 1 then
          grdCli.RowCount := grdCli.RowCount + 1;

        grdCli.Cells[0, ncli-1] := cliente[ncli-1].apelido;

        Timer1.Enabled := True;
      end;
      ListView1.Realign;

      lblDis.Caption := 'Estações Disponíveis: ' + IntToStr(ListView1.Items.Count);
      lblUso.Caption := 'Estações em Uso: '      + IntToStr(ListView2.Items.Count);
      lblExp.Caption := 'Estações Expiradas: '   + IntToStr(ListView3.Items.Count);

      estacao[p].estado     := 'A';
      estacao[p].numinterno := i;

      with dmPrinc do
      begin
        SQLConLocal.StartTransaction(TransDesc);
        sqlEstacao.Locate('CODIGOESTACAO', estacao[p].codigo, []);
        sqlEstacao.Edit;
        sqlEstacaoESTADO.Value := 'A';
        sqlEstacao.Post;
        sqlEstacao.ApplyUpdates(-1);
        sqlMovim.Edit;
        sqlMovimHORAS.Value := estacao[p].horas;
        sqlMovimTIPO.Value  := 'F';
        sqlMovim.Post;
        sqlMovim.ApplyUpdates(-1);
        SQLConLocal.Commit(TransDesc);
      end;
      SndPlaySound(PChar(som_caixa), SND_ASYNC);
    end;
  end
  else
  // Status Quo
  if mens = 'SQ:' then
  begin
    esta := Socket.RemoteAddress;
    achou := False;

    for p := 0 to num_estacao-1 do
      if estacao[p].ip = esta then
      begin
        achou := True;
        break;
      end;

    if achou then
    begin
      if estacao[p].estado <> 'A' then // Estação em Uso ou Espirada
        Socket.SendText('EU:' + TimeToStr(estacao[p].hora)+'¦'+estacao[p].nomecliente)
      else
        Socket.SendText('EF:');
    end;
  end;


  for i := 0 to num_estacao-1 do
  begin
    nome := estacao[i].descricao;
    if estacao[i].estado = 'A' then
    begin
      for p := 0 to ListView1.Items.Count - 1 do
        if ListView1.Items[p].Caption = nome then
          estacao[i].numinterno := p;
    end;
    if estacao[i].estado = 'U' then
    begin
      for p := 0 to ListView2.Items.Count - 1 do
        if ListView2.Items[p].Caption = nome then
          estacao[i].numinterno := p;
    end;
    if estacao[i].estado = 'E' then
    begin
      for p := 0 to ListView3.Items.Count - 1 do
        if ListView3.Items[p].Caption = nome then
          estacao[i].numinterno := p;
    end;
  end;

end;

procedure TfrmMain.ListView2SelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
var
  i: integer;
  achou: boolean;

begin
  achou := False;
  for i := 0 to num_estacao-1 do
    if (estacao[i].estado <> 'A') and (estacao[i].descricao = Item.Caption) then
      begin
        achou := True;
        break;
      end;

    estacao[i].horas := Time - estacao[i].hora;

    if achou and Selected then
    begin
      lblCliente.Caption := Format('Estacao: %s   Cliente: %s'#13'Data/Hora: %s - %s'#13+
                                   'Tempo Disponível: %s     Tempo de Jogo: %s',
                                   [estacao[i].descricao, estacao[i].nomecliente,
                                    DateToStr(estacao[i].data), dTimeToStr(estacao[i].hora),
                                    dTimeToStr(estacao[i].tempototal), dTimeToStr(estacao[i].horas)]);
      imgFechar2.Visible := True;
    end
    else
    begin
      lblCliente.Caption := '';
      imgFechar2.Visible := False;
    end;
end;

procedure TfrmMain.ListView1Click(Sender: TObject);
begin
  ListView2.ClearSelection;
  ListView3.ClearSelection;
  lblCliente.Caption := '';
end;

procedure TfrmMain.imgRefr2Click(Sender: TObject);
begin
  case ListView1.ViewStyle of
    vsIcon: ListView1.ViewStyle := vsList;
    vsList: ListView1.ViewStyle := vsSmallIcon;
  else
    ListView1.ViewStyle := vsIcon;
  end;
  ListView2.ViewStyle := ListView1.ViewStyle;
  ListView3.ViewStyle := ListView1.ViewStyle;
end;

procedure TfrmMain.ListView2Click(Sender: TObject);
begin
  if ListView2.ItemIndex = -1 then
  begin
    ListView1.ClearSelection;
    ListView3.ClearSelection;
    lblCliente.Caption := '';
  end;
end;

procedure TfrmMain.ListView3Click(Sender: TObject);
begin
  if ListView3.ItemIndex = -1 then
  begin
    ListView1.ClearSelection;
    ListView2.ClearSelection;
    lblCliente.Caption := '';
  end;
end;

procedure TfrmMain.imgFechar2Click(Sender: TObject);
var
  novo: TListItem;
  p, i, l: integer;
  nome: string;
  achou: boolean;

begin
  if Application.MessageBox('Confirma fechamento da Estação ??', 'Atenção', MB_YESNO) = IDYES then
  begin
    if ListView2.ItemIndex <> -1 then
      nome := ListView2.Items[ListView2.ItemIndex].Caption
    else
      nome := ListView3.Items[ListView3.ItemIndex].Caption;

    achou := False;
    for p := 0 to num_estacao-1 do
      if (estacao[p].estado <> 'A') and (estacao[p].descricao = nome) then
        begin
          achou := True;
          break;
        end;

    if achou then
    begin
      // Fecha estação
      novo := ListView1.Items.Add;
      l := estacao[p].numinterno;
      i := novo.Index;

      if estacao[p].estado = 'U' then
      begin
        ListView1.Items[i].Caption := ListView2.Items[l].Caption;
        ListView1.Items[i].ImageIndex := 0;
        ListView2.Items[l].Destroy;
        ListView2.Realign;
      end
      else
      begin
        ListView1.Items[i].Caption := ListView3.Items[l].Caption;
        ListView1.Items[i].ImageIndex := 0;
        ListView3.Items[l].Destroy;
        ListView3.Realign;
      end;
      ListView1.Realign;

      lblDis.Caption := 'Estações Disponíveis: ' + IntToStr(ListView1.Items.Count);
      lblUso.Caption := 'Estações em Uso: '      + IntToStr(ListView2.Items.Count);
      lblExp.Caption := 'Estações Expiradas: '   + IntToStr(ListView3.Items.Count);

      estacao[p].estado     := 'A';
      estacao[p].numinterno := i;

      with dmPrinc do
      begin
        SQLConLocal.StartTransaction(TransDesc);
        sqlEstacao.Locate('CODIGOESTACAO', estacao[p].codigo, []);
        sqlEstacao.Edit;
        sqlEstacaoESTADO.Value := 'A';
        sqlEstacao.Post;
        sqlEstacao.ApplyUpdates(-1);
        sqlMovim.Edit;
        sqlMovimHORAS.Value := estacao[p].horas;
        sqlMovimTIPO.Value  := 'F';
        sqlMovim.Post;
        sqlMovim.ApplyUpdates(-1);
        SQLConLocal.Commit(TransDesc);
      end;
      SndPlaySound(PChar(som_caixa), SND_ASYNC);
    end;
  end;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
var
  arqini: TIniFile;

begin
  arqini := TIniFile.Create(ExtractFilePath(Application.ExeName)+'devsoft.ini');
  porta      := arqini.ReadInteger('Params', 'Porta', 1972);
  som_alarme := arqini.ReadString('Sounds', 'Expirou', '');
  som_caixa  := arqini.ReadString('Sounds', 'Caixa',   '');
  arqini.Free;
  sktServer.Port := porta;
end;

procedure TfrmMain.FormActivate(Sender: TObject);
begin
  Top := 1;
  frmData.ShowModal;
end;

procedure TfrmMain.imgLoginClick(Sender: TObject);
var
  direitos: string;

begin
  if (imgLogin.Hint = 'Login') and (frmLogin.ShowModal = mrOk) then
  begin
    if ((dmPrinc.sqlUsuario.Locate('NOMELOGIN', frmLogin.edtUser.Text,[loCaseInsensitive])) and
        (dmPrinc.sqlUsuarioSENHA.Value = frmLogin.edtSenha.Text)) then
    begin
      direitos := dmPrinc.sqlUsuarioDIREITOS.AsString + Spaces(100);
      if direitos[2] = 'X' then
      begin
        imgFechar1.Visible  := False;
        imgFechar2.Visible  := True;
        imgLogin.Hint       := 'Logout';
        labClientes.Visible := True;
        labLancto.Visible   := (direitos[8] = 'X');
        labPromo.Visible    := True;
        labProdutos.Visible := True;
        labBonus.Visible    := True;
        labMilhagem.Visible := True;
        labHoras.Visible    := True;
        lblUser.Caption     := 'Usuário: ' + dmPrinc.sqlUsuarioNOMECOMPLETO.AsString;
        cod_usuario         := dmPrinc.sqlUsuarioCODIGOUSUARIO.AsInteger;

        with dmPrinc do
        begin
          SQLConLocal.StartTransaction(TransDesc);
          Acao(cod_usuario, 'Acessou/Logou - devGuardian');
          SQLConLocal.Commit(TransDesc);
        end;
      end
      else
        raise exception.Create('Você não tem acesso a esse módulo !!');
    end
    else
      raise exception.Create('Usuário e/ou senha incorretos !!'#13'Tente novamente !!');
  end
  else
  if (imgLogin.Hint = 'Logout') and (Application.MessageBox('Confirma logout ??', 'Atenção', MB_YESNO) = IDYES) then
  begin
    imgFechar1.Visible  := True;
    imgFechar2.Visible  := False;
    imgLogin.Hint       := 'Login';
    labClientes.Visible := False;
    labLancto.Visible   := False;
    labPromo.Visible    := False;
    labProdutos.Visible := False;
    labBonus.Visible    := False;
    labMilhagem.Visible := False;
    labHoras.Visible    := False;
    lblUser.Caption     := 'Usuário:';
    with dmPrinc do
    begin
      SQLConLocal.StartTransaction(TransDesc);
      Acao(cod_usuario, 'Des-Logou - devGuardian');
      SQLConLocal.Commit(TransDesc);
    end;
    cod_usuario := 0;
  end;
end;

procedure TfrmMain.imgCaixa2Click(Sender: TObject);
var
  saldo_anterior: real;
  i: integer;

begin
  //Abertura do Caixa
  with dmPrinc do
  begin
    if SQLConLocal.InTransaction then
      SQLConLocal.Commit(TransDesc);
    sqlCaixa.Refresh;
    sqlCaixa.Last;
    caixa_aberto := (dmPrinc.sqlCaixaDATAABERTURA.AsFloat <> 0) and (dmPrinc.sqlCaixaDATAFECHAMENTO.AsFloat = 0);
  end;

  imgCaixa1.Visible := caixa_aberto;
  imgCaixa2.Visible := not caixa_aberto;

  if (cod_usuario = 0) or (imgLogin.Hint = 'Login') then
    MessageDlg('Só é possível abrir o caixa estando Logado!!',  mtError, [mbOK], 0)
  else if caixa_aberto then
    MessageDlg('Caixa já está aberto!!',  mtError, [mbOK], 0)
  else if Application.MessageBox('Confirma abertura do caixa ??', 'Abertura', MB_YESNO) = IDYES then
    begin
      with dmPrinc do
      begin
        sqlCaixa.Last;
        if not sqlCaixa.Bof then
          saldo_anterior := sqlCaixaSALDOFECHAMENTO.AsFloat
        else
          saldo_anterior := 0.00;

        SQLConLocal.StartTransaction(TransDesc);
        sqlCaixa.Append;
        sqlCaixaCONTROLECAIXA.AsInteger := GeraCodigoLocal('GEN_CAIXA');
        sqlCaixaDATAABERTURA.Value      := Date;
        sqlCaixaHORAABERTURA.Value      := Time;
        sqlCaixaSALDOABERTURA.Value     := saldo_anterior;
        sqlCaixa.Post;
        sqlCaixa.ApplyUpdates(-1);
        SQLConLocal.Commit(TransDesc);
      end;

      caixa_aberto := True;
      imgCaixa1.Visible := caixa_aberto;
      imgCaixa2.Visible := not caixa_aberto;

      for i := 0 to memLog.Lines.Count - 1 do
        if Pos('Situação do Caixa: ', memLog.Lines.Strings[i]) > 0 then
          memLog.Lines.Strings[i] := 'Situação do Caixa: ' + iif(caixa_aberto, 'ABERTO', 'FECHADO');

    end;
end;

procedure TfrmMain.imgCaixa1Click(Sender: TObject);
var i: integer;
begin
  //Fechamento do Caixa
  with dmPrinc do
  begin
    if SQLConLocal.InTransaction then
      SQLConLocal.Commit(TransDesc);
    sqlCaixa.Refresh;
    sqlCaixa.Last;
    caixa_aberto := (dmPrinc.sqlCaixaDATAABERTURA.AsFloat <> 0) and (dmPrinc.sqlCaixaDATAFECHAMENTO.AsFloat = 0);
  end;

  imgCaixa1.Visible := caixa_aberto;
  imgCaixa2.Visible := not caixa_aberto;

  if (cod_usuario = 0) or (imgLogin.Hint = 'Login') then
    MessageDlg('Só é possível fechar o caixa estando Logado!!',  mtError, [mbOK], 0)
  else if not caixa_aberto then
    MessageDlg('Caixa já está fechado!!',  mtError, [mbOK], 0)
  else if Application.MessageBox('Confirma fechamento do caixa ??', 'Abertura', MB_YESNO) = IDYES then
    begin
      with dmPrinc do
      begin
        sqlCaixa.Last;

        SQLConLocal.StartTransaction(TransDesc);
        sqlCaixa.Edit;
        sqlCaixaDATAFECHAMENTO.Value      := Date;
        sqlCaixaHORAFECHAMENTO.Value      := Time;
        sqlCaixaSALDOFECHAMENTO.Value     := 0.00;
        sqlCaixa.Post;
        sqlCaixa.ApplyUpdates(-1);
        SQLConLocal.Commit(TransDesc);
      end;

      caixa_aberto := False;
      imgCaixa1.Visible := caixa_aberto;
      imgCaixa2.Visible := not caixa_aberto;

      for i := 0 to memLog.Lines.Count - 1 do
        if Pos('Situação do Caixa: ', memLog.Lines.Strings[i]) > 0 then
          memLog.Lines.Strings[i] := 'Situação do Caixa: ' + iif(caixa_aberto, 'ABERTO', 'FECHADO');

    end;
end;

end.
