unit untManReparo;

interface

uses
  SysUtils, Types, Classes, QGraphics, QControls, QForms, QDialogs,
  QStdCtrls, QGrids, QDBGrids, QComCtrls, QExtCtrls, Provider, SqlExpr, DB,
  DBClient, DBLocal, DBLocalS, QButtons, Registry;

type
  TfrmManReparo = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    btnIncluir: TToolButton;
    btnAlterar: TToolButton;
    ToolButton4: TToolButton;
    btnExcluir: TToolButton;
    btnAtualizar: TToolButton;
    ToolButton7: TToolButton;
    Label1: TLabel;
    edtPesq: TEdit;
    DBGrid1: TDBGrid;
    btnBusca: TSpeedButton;
    cboxVeic: TComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnBuscaClick(Sender: TObject);
    procedure cboxVeicChange(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure edtPesqChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    aCodVeic: array of integer;
  end;

var
  frmManReparo: TfrmManReparo;

implementation

uses untDatMod, untAtuReparo;

{$R *.xfm}

procedure TfrmManReparo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmManReparo.FormShow(Sender: TObject);
var
  i: integer;

begin
  if not dtMod.sqlMarca.Active then
    dtMod.sqlMarca.Active := True;
  if not dtMod.sqlModelo.Active then
    dtMod.sqlModelo.Open;
  if not dtMod.sqlVeic.Active then
    dtMod.sqlVeic.Active := True;

  SetLength(aCodVeic, dtMod.sqlVeic.RecordCount);

  cboxVeic.Text := '';
  cboxVeic.Items.Clear;
  
  i := 0;
  dtMod.sqlVeic.First;
  while not dtMod.sqlVeic.Eof do
  begin
    aCodVeic[i] := dtMod.sqlVeicCODIGOVEICULO.AsInteger;
    cboxVeic.Items.Add(dtMod.sqlVeicDESCCOMPLETA.AsString);
    dtMod.sqlVeic.Next;
    inc(i);
  end;

end;

procedure TfrmManReparo.btnBuscaClick(Sender: TObject);
begin
  Panel1.Visible := True;
  dtMod.sqlReparo.Close;
  dtMod.sqlReparo.Params[0].AsInteger := aCodVeic[cboxVeic.ItemIndex];
  dtMod.sqlReparo.Open;
end;

procedure TfrmManReparo.cboxVeicChange(Sender: TObject);
begin
  Panel1.Visible := False;
  dtMod.sqlReparo.Close;
  if cboxVeic.ItemIndex >= 0 then
    btnBusca.Click;
end;

procedure TfrmManReparo.btnIncluirClick(Sender: TObject);
begin
  with dtMod do
  begin
    SQLCon.StartTransaction(TransDesc);
    sqlReparo.Append;
    sqlReparoDATA.Value := Date;
    sqlReparoCODIGOVEICULO.Value := aCodVeic[cboxVeic.ItemIndex];
    Application.CreateForm(TfrmAtuReparo, frmAtuReparo);
    frmAtuReparo.ShowModal;
    if SQLCon.InTransaction then
      SQLCon.Commit(TransDesc);
  end;
end;

procedure TfrmManReparo.btnAlterarClick(Sender: TObject);
begin
  with dtMod do
  begin
    SQLCon.StartTransaction(TransDesc);
    sqlReparo.Edit;
    Application.CreateForm(TfrmAtuReparo, frmAtuReparo);
    frmAtuReparo.ShowModal;
    if SQLCon.InTransaction then
      SQLCon.Commit(TransDesc);
  end;
end;

procedure TfrmManReparo.btnExcluirClick(Sender: TObject);
begin
  if MessageDlg('Confirma exclusão?', mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
  begin
    dtMod.sqlReparo.Delete;
    dtMod.sqlReparo.ApplyUpdates(-1);
    btnAtualizar.Click;
  end;
end;

procedure TfrmManReparo.btnAtualizarClick(Sender: TObject);
begin
  with dtMod do
  begin
    if SQLCon.InTransaction then
      SQLCon.Commit(TransDesc);
    sqlReparo.Refresh;
  end;
end;

procedure TfrmManReparo.edtPesqChange(Sender: TObject);
var
  data: TDateTime;

begin
  if (edtPesq.Text <> '') and (Length(edtPesq.Text) > 7) then
    try
      data := StrToDate(edtPesq.Text);
      dtMod.sqlReparo.Locate('DATA', data, [loCaseInsensitive, loPartialKey]);
    except
    end;
end;

end.
