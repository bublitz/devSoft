unit untManAbast;

interface

uses
  SysUtils, Types, Classes, QGraphics, QControls, QForms, QDialogs,
  QStdCtrls, QGrids, QDBGrids, QComCtrls, QExtCtrls, Provider, SqlExpr, DB,
  DBClient, DBLocal, DBLocalS, QButtons, Registry;

type
  TfrmManAbast = class(TForm)
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
  frmManAbast: TfrmManAbast;

implementation

uses untDatMod, untAtuAbast;

{$R *.xfm}

procedure TfrmManAbast.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmManAbast.FormShow(Sender: TObject);
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

procedure TfrmManAbast.btnBuscaClick(Sender: TObject);
begin
  Panel1.Visible := True;
  dtMod.sqlAbast.Close;
  dtMod.sqlAbast.Params[0].AsInteger := aCodVeic[cboxVeic.ItemIndex];
  dtMod.sqlAbast.Open;
end;

procedure TfrmManAbast.cboxVeicChange(Sender: TObject);
begin
  Panel1.Visible := False;
  dtMod.sqlAbast.Close;
  if cboxVeic.ItemIndex >= 0 then
    btnBusca.Click;
end;

procedure TfrmManAbast.btnIncluirClick(Sender: TObject);
begin
  with dtMod do
  begin
    SQLCon.StartTransaction(TransDesc);
    sqlAbast.Append;
    sqlAbastDATA.Value := Date;
    sqlAbastCODIGOVEICULO.Value := aCodVeic[cboxVeic.ItemIndex];
    Application.CreateForm(TfrmAtuAbast, frmAtuAbast);
    frmAtuAbast.ShowModal;
    if SQLCon.InTransaction then
      SQLCon.Commit(TransDesc);
  end;
end;

procedure TfrmManAbast.btnAlterarClick(Sender: TObject);
begin
  with dtMod do
  begin
    SQLCon.StartTransaction(TransDesc);
    sqlAbast.Edit;
    Application.CreateForm(TfrmAtuAbast, frmAtuAbast);
    frmAtuAbast.ShowModal;
    if SQLCon.InTransaction then
      SQLCon.Commit(TransDesc);
  end;
end;

procedure TfrmManAbast.btnExcluirClick(Sender: TObject);
begin
  if MessageDlg('Confirma exclusão?', mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
  begin
    dtMod.sqlAbast.Delete;
    dtMod.sqlAbast.ApplyUpdates(-1);
    btnAtualizar.Click;
  end;
end;

procedure TfrmManAbast.btnAtualizarClick(Sender: TObject);
begin
  with dtMod do
  begin
    if SQLCon.InTransaction then
      SQLCon.Commit(TransDesc);
    sqlAbast.Refresh;
  end;
end;

procedure TfrmManAbast.edtPesqChange(Sender: TObject);
var
  data: TDateTime;

begin
  if (edtPesq.Text <> '') and (Length(edtPesq.Text) > 7) then
    try
      data := StrToDate(edtPesq.Text);
      dtMod.sqlAbast.Locate('DATA', data, [loCaseInsensitive, loPartialKey]);
    except
    end;
end;

end.
