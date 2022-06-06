unit untManManut;

interface

uses
  SysUtils, Types, Classes, QGraphics, QControls, QForms, QDialogs,
  QStdCtrls, QGrids, QDBGrids, QComCtrls, QExtCtrls, Provider, SqlExpr, DB,
  DBClient, DBLocal, DBLocalS, QButtons, Registry;

type
  TfrmManManut = class(TForm)
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
  frmManManut: TfrmManManut;

implementation

uses untDatMod, untAtuAbast, untAtuManut;

{$R *.xfm}

procedure TfrmManManut.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmManManut.FormShow(Sender: TObject);
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

procedure TfrmManManut.btnBuscaClick(Sender: TObject);
begin
  Panel1.Visible := True;
  dtMod.sqlManut.Close;
  dtMod.sqlManut.Params[0].AsInteger := aCodVeic[cboxVeic.ItemIndex];
  dtMod.sqlManut.Open;
end;

procedure TfrmManManut.cboxVeicChange(Sender: TObject);
begin
  Panel1.Visible := False;
  dtMod.sqlManut.Close;
  if cboxVeic.ItemIndex >= 0 then
    btnBusca.Click;
end;

procedure TfrmManManut.btnIncluirClick(Sender: TObject);
begin
  with dtMod do
  begin
    SQLCon.StartTransaction(TransDesc);
    sqlManut.Append;
    sqlManutDATA.Value := Date;
    sqlManutCODIGOVEICULO.Value := aCodVeic[cboxVeic.ItemIndex];
    Application.CreateForm(TfrmAtuManut, frmAtuManut);
    frmAtuManut.ShowModal;
    if SQLCon.InTransaction then
      SQLCon.Commit(TransDesc);
  end;
end;

procedure TfrmManManut.btnAlterarClick(Sender: TObject);
begin
  with dtMod do
  begin
    SQLCon.StartTransaction(TransDesc);
    sqlManut.Edit;
    Application.CreateForm(TfrmAtuManut, frmAtuManut);
    frmAtuManut.ShowModal;
    if SQLCon.InTransaction then
      SQLCon.Commit(TransDesc);
  end;
end;

procedure TfrmManManut.btnExcluirClick(Sender: TObject);
begin
  if MessageDlg('Confirma exclusão?', mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
  begin
    dtMod.sqlManut.Delete;
    dtMod.sqlManut.ApplyUpdates(-1);
    btnAtualizar.Click;
  end;
end;

procedure TfrmManManut.btnAtualizarClick(Sender: TObject);
begin
  with dtMod do
  begin
    if SQLCon.InTransaction then
      SQLCon.Commit(TransDesc);
    sqlManut.Refresh;
  end;
end;

procedure TfrmManManut.edtPesqChange(Sender: TObject);
var
  data: TDateTime;

begin
  if (edtPesq.Text <> '') and (Length(edtPesq.Text) > 7) then
    try
      data := StrToDate(edtPesq.Text);
      dtMod.sqlManut.Locate('DATA', data, [loCaseInsensitive, loPartialKey]);
    except
    end;
end;

end.
