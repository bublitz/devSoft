unit untMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, IniFiles, Buttons, ImgList;

type
  TfrmMain = class(TForm)
    TreeView1: TTreeView;
    NB: TNotebook;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Image1: TImage;
    lblRegional: TLabel;
    gboxVeic: TGroupBox;
    rbAllVeic: TRadioButton;
    rbEspVeic: TRadioButton;
    cbVeic: TComboBox;
    edtAnoA: TLabeledEdit;
    ImageList1: TImageList;
    btnVisuA: TSpeedButton;
    btnImprA: TSpeedButton;
    edtMesA: TComboBox;
    Label5: TLabel;
    rgrpFiltro: TRadioGroup;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure rbAllVeicClick(Sender: TObject);
    procedure btnVisuAClick(Sender: TObject);
    procedure TreeView1Change(Sender: TObject; Node: TTreeNode);
  private
    { Private declarations }
  public
    { Public declarations }
    regional, setor: string;
    aCodVeic: array of integer;
    CommandSQL: TStringList;
  end;

var
  frmMain: TfrmMain;

implementation

uses untDatModRelat, untRepAnaQuilo, untRepAnaAbast, untRepAnaManut,
  untRepAnaReparo, untRepAnaResumo;

{$R *.dfm}

procedure TfrmMain.FormShow(Sender: TObject);
var
  i: integer;
  d, m, a: word;

begin
  TreeView1.FullExpand;

  if not dmPrinc.sqlMarca.Active then
    dmPrinc.sqlMarca.Active := True;
  if not dmPrinc.sqlModelo.Active then
    dmPrinc.sqlModelo.Open;
  if not dmPrinc.sqlVeic.Active then
    dmPrinc.sqlVeic.Active := True;

  SetLength(aCodVeic, dmPrinc.sqlVeic.RecordCount);

  cbVeic.Text := '';
  cbVeic.Items.Clear;

  i := 0;
  dmPrinc.sqlVeic.First;
  while not dmPrinc.sqlVeic.Eof do
  begin
    aCodVeic[i] := dmPrinc.sqlVeicCODIGOVEICULO.AsInteger;
    cbVeic.Items.Add(dmPrinc.sqlVeicDESCCOMPLETA.AsString);
    dmPrinc.sqlVeic.Next;
    inc(i);
  end;

  DecodeDate(Date, a, m, d);

  edtMesA.ItemIndex := m-1;
  edtAnoA.Text := IntToStr(a);

end;

procedure TfrmMain.FormCreate(Sender: TObject);
var
  inifile: TIniFile;

begin
  NB.ActivePage := 'Escolha';
  inifile := TIniFile.Create('convel.ini');
  regional := inifile.ReadString('Conf', 'Regional', 'Tribunal Regional Eleitoral de Mato Grosso');
  setor    := inifile.ReadString('Conf', 'Setor', 'Seção de Transportes');
  lblRegional.Caption := regional;
  inifile.Free;
end;

procedure TfrmMain.rbAllVeicClick(Sender: TObject);
begin
  cbVeic.Enabled := rbEspVeic.Checked;
end;

procedure TfrmMain.btnVisuAClick(Sender: TObject);
var
  t, i: integer;

begin
  for i := 0 to TreeView1.Items.Count - 1 do
    if Treeview1.Items[i].Selected then
      break;

  // ANALÍTICO - QUILOMETRAGEM
  if i = 9 then
  begin
    rptAnaQuilo.qrLabRegional.Caption := regional;
    rptAnaQuilo.qrLabSecao.Caption := setor;
    rptAnaQuilo.qrLabPeriodo.Caption := 'Mes/Ano: ' + edtMesA.Text + '/' + edtAnoA.Text;
    rptAnaQuilo.sqlQuilo.Close;
    CommandSQL := TStringList.Create;
    CommandSQL.Add(' select v.CODIGOVEICULO,v.DESCRICAO, v.PLACA, q.CODIGOVEICULO, q.DATA, q.INICIO, q.FINAL');
    CommandSQL.Add(' from QUILOMETRAGEM q, VEICULO v');
    CommandSQL.Add(' where q.CODIGOVEICULO = v.CODIGOVEICULO');

    if rbEspVeic.Checked then
      CommandSQL.Add('   and q.CODIGOVEICULO = ' + IntToStr(aCodVeic[cbVeic.ItemIndex]));

    CommandSQL.Add('   and extract(year from q.DATA) = ' + edtAnoA.Text);
    CommandSQL.Add('   and extract(month from q.DATA) = ' + edtMesA.Text);
    CommandSQL.Add('   order by CODIGOVEICULO, DATA');

    rptAnaQuilo.sqlQuilo.CommandText := CommandSQL.Strings[0];

    for t:= 1 to CommandSql.Count-1 do
      rptAnaQuilo.sqlQuilo.CommandText := rptAnaQuilo.sqlQuilo.CommandText +
                                          CommandSQL.Strings[t];
    rptAnaQuilo.sqlQuilo.Open;
    rptAnaQuilo.acumulado := 0;
    rptAnaQuilo.QuickRep1.Preview;
    rptAnaQuilo.sqlQuilo.Close;
  end;

  // ANALÍTICO - ABASTECIMENTO
  if i = 10 then
  begin
    rptAnaAbast.qrLabRegional.Caption := regional;
    rptAnaAbast.qrLabSecao.Caption := setor;
    rptAnaAbast.qrLabPeriodo.Caption := 'Mes/Ano: ' + edtMesA.Text + '/' + edtAnoA.Text;
    rptAnaAbast.sqlReport.Close;
    CommandSQL := TStringList.Create;
    CommandSQL.Add(' select v.CODIGOVEICULO, v.DESCRICAO, v.PLACA, a.CODIGOVEICULO, a.CODIGOTIPOABAST,');
    CommandSQL.Add('        a.DATA, a.LITROS, a.VALORUNITARIO, a.LITROS*a.VALORUNITARIO as VALORTOTAL,');
    CommandSQL.Add('        a.HODOMETRO, t.CODIGOTIPOABAST, t.DESCRICAO as DESCABAST');
    CommandSQL.Add(' from ABASTECIMENTO a, VEICULO v, TIPOABAST t');
    CommandSQL.Add(' where a.CODIGOVEICULO = v.CODIGOVEICULO');
    CommandSQL.Add('   and a.CODIGOTIPOABAST = t.CODIGOTIPOABAST');

    if rbEspVeic.Checked then
      CommandSQL.Add('   and a.CODIGOVEICULO = ' + IntToStr(aCodVeic[cbVeic.ItemIndex]));

    CommandSQL.Add('   and extract(year from a.DATA) = ' + edtAnoA.Text);
    CommandSQL.Add('   and extract(month from a.DATA) = ' + edtMesA.Text);
    CommandSQL.Add('   order by CODIGOVEICULO, DATA');

    rptAnaAbast.sqlReport.CommandText := CommandSQL.Strings[0];

    for t:= 1 to CommandSql.Count-1 do
      rptAnaAbast.sqlReport.CommandText := rptAnaAbast.sqlReport.CommandText +
                                          CommandSQL.Strings[t];
    rptAnaAbast.sqlReport.Open;
    rptAnaAbast.acumulado1 := 0;
    rptAnaAbast.acumulado2 := 0;
    rptAnaAbast.QuickRep1.Preview;
    rptAnaAbast.sqlReport.Close;
  end;

  // ANALÍTICO - MANUTENÇÃO/CONSERVAÇÃO
  if i = 11 then
  begin
    rptAnaManut.qrLabRegional.Caption := regional;
    rptAnaManut.qrLabSecao.Caption := setor;
    rptAnaManut.qrLabPeriodo.Caption := 'Mes/Ano: ' + edtMesA.Text + '/' + edtAnoA.Text;
    rptAnaManut.sqlReport.Close;
    CommandSQL := TStringList.Create;
    CommandSQL.Add(' select v.CODIGOVEICULO, v.DESCRICAO, v.PLACA, m.CODIGOVEICULO, m.CODIGOTIPOMANUT,');
    CommandSQL.Add('        m.DATA, m.LITROS, m.VALOR as VALORUNITARIO, m.LITROS*m.VALOR as VALORTOTAL,');
    CommandSQL.Add('        m.HODOMETRO, t.CODIGOTIPOMANUT, t.DESCRICAO as DESCMANUT');
    CommandSQL.Add(' from MANUTENCAO m, VEICULO v, TIPOMANUT t');
    CommandSQL.Add(' where m.CODIGOVEICULO = v.CODIGOVEICULO');
    CommandSQL.Add('   and m.CODIGOTIPOMANUT = t.CODIGOTIPOMANUT');

    if rbEspVeic.Checked then
      CommandSQL.Add('   and m.CODIGOVEICULO = ' + IntToStr(aCodVeic[cbVeic.ItemIndex]));

    CommandSQL.Add('   and extract(year from m.DATA) = ' + edtAnoA.Text);
    CommandSQL.Add('   and extract(month from m.DATA) = ' + edtMesA.Text);
    CommandSQL.Add('   order by CODIGOVEICULO, DATA, t.DESCRICAO');

    rptAnaManut.sqlReport.CommandText := CommandSQL.Strings[0];

    for t:= 1 to CommandSql.Count-1 do
      rptAnaManut.sqlReport.CommandText := rptAnaManut.sqlReport.CommandText +
                                          CommandSQL.Strings[t];
    rptAnaManut.sqlReport.Open;
    rptAnaManut.acumulado := 0;
    rptAnaManut.QuickRep1.Preview;
    rptAnaManut.sqlReport.Close;
  end;

  // ANALÍTICO - REPARO
  if i = 12 then
  begin
    rptAnaReparo.qrLabRegional.Caption := regional;
    rptAnaReparo.qrLabSecao.Caption := setor;
    rptAnaReparo.qrLabPeriodo.Caption := 'Mes/Ano: ' + edtMesA.Text + '/' + edtAnoA.Text;
    rptAnaReparo.sqlReport.Close;
    CommandSQL := TStringList.Create;
    CommandSQL.Add(' select v.CODIGOVEICULO, v.DESCRICAO, v.PLACA, r.CODIGOVEICULO, r.CODIGOTIPOREPARO,');
    CommandSQL.Add('        r.DATA, r.VALORMAT, r.VALORMAO, r.HODOMETRO, r.COMPLEMENTO, r.VALORMAT+r.VALORMAO as VALORTOTAL,');
    CommandSQL.Add('        t.CODIGOTIPOREPARO, t.DESCRICAO as DESCREPARO');
    CommandSQL.Add(' from REPARO r, VEICULO v, TIPOREPARO t');
    CommandSQL.Add(' where r.CODIGOVEICULO = v.CODIGOVEICULO');
    CommandSQL.Add('   and r.CODIGOTIPOREPARO = t.CODIGOTIPOREPARO');

    if rbEspVeic.Checked then
      CommandSQL.Add('   and r.CODIGOVEICULO = ' + IntToStr(aCodVeic[cbVeic.ItemIndex]));

    CommandSQL.Add('   and extract(year from r.DATA) = ' + edtAnoA.Text);
    CommandSQL.Add('   and extract(month from r.DATA) = ' + edtMesA.Text);
    CommandSQL.Add('   order by CODIGOVEICULO, DATA, t.DESCRICAO');

    rptAnaReparo.sqlReport.CommandText := CommandSQL.Strings[0];

    for t:= 1 to CommandSql.Count-1 do
      rptAnaReparo.sqlReport.CommandText := rptAnaReparo.sqlReport.CommandText +
                                          CommandSQL.Strings[t];
    rptAnaReparo.sqlReport.Open;
    rptAnaReparo.acumulado := 0;
    rptAnaReparo.QuickRep1.Preview;
    rptAnaReparo.sqlReport.Close;
  end;

  // ANALÍTICO - RESUMO MENSAL - Veículos
  if i = 13 then
  begin
    rptAnaResumo.qrLabRegional.Caption := regional;
    rptAnaResumo.qrLabSecao.Caption := setor;
    rptAnaResumo.qrLabPeriodo.Caption := 'Mes/Ano: ' + edtMesA.Text + '/' + edtAnoA.Text;
    rptAnaResumo.sqlReport.Close;
    rptAnaResumo.sqlKM.Close;
    rptAnaResumo.sqlAbast.Close;
    rptAnaResumo.sqlManut.Close;
    rptAnaResumo.sqlOleo.Close;
    rptAnaResumo.sqlReparo.Close;

    with rptAnaResumo.sqlKM do
    begin
      Params[0].AsInteger := StrToInt(edtAnoA.Text);
      Params[1].AsInteger := StrToInt(edtMesA.Text);
    end;

    with rptAnaResumo.sqlAbast do
    begin
      Params[0].AsInteger := StrToInt(edtAnoA.Text);
      Params[1].AsInteger := StrToInt(edtMesA.Text);
    end;

    with rptAnaResumo.sqlManut do
    begin
      Params[0].AsInteger := StrToInt(edtAnoA.Text);
      Params[1].AsInteger := StrToInt(edtMesA.Text);
    end;

    with rptAnaResumo.sqlOleo do
    begin
      Params[0].AsInteger := StrToInt(edtAnoA.Text);
      Params[1].AsInteger := StrToInt(edtMesA.Text);
    end;

    with rptAnaResumo.sqlReparo do
    begin
      Params[0].AsInteger := StrToInt(edtAnoA.Text);
      Params[1].AsInteger := StrToInt(edtMesA.Text);
    end;

    try
      rptAnaResumo.sqlKM.Open;
      rptAnaResumo.sqlAbast.Open;
      rptAnaResumo.sqlManut.Open;
      rptAnaResumo.sqlReparo.Open;
      rptAnaResumo.sqlOleo.Open;
      rptAnaResumo.sqlReport.Open;
    except
    end;

    rptAnaResumo.QuickRep1.Preview;
    rptAnaResumo.sqlReport.Close;
  end;

end;

procedure TfrmMain.TreeView1Change(Sender: TObject; Node: TTreeNode);
var
  i: integer;
begin
  for i := 0 to TreeView1.Items.Count - 1 do
  begin
    if Treeview1.Items[i].Selected then
    begin
      break;
    end;
  end;

  if i in [0, 8, 15] then
    NB.ActivePage := 'Escolha'
  else
  if i < 8 then
    NB.ActivePage := 'Listagem'
  else
  if i < 15 then
    NB.ActivePage := 'Analitico'
  else
    NB.ActivePage := 'Sintetico';

  rbAllVeic.Checked := True;
  rbEspVeic.Enabled := True;
  gboxVeic.Visible := True;

  if i = 13 then
  begin
    rbAllVeic.Checked := True;
    rbEspVeic.Enabled := False;
  end
  else
  if i = 14 then
  begin
    gboxVeic.Visible := False;
  end;
end;

end.
