unit untCadModelo;

interface

uses
  SysUtils, Types, Classes, QGraphics, QControls, QForms, QDialogs,
  QStdCtrls, QImgList, QComCtrls, QGrids, QDBGrids, DB;

type
  TfrmCadModelo = class(TForm)
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
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure edtPesqChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadModelo: TfrmCadModelo;

implementation

uses untDatMod, untAtuMarca, untAtuModelo;

{$R *.xfm}

procedure TfrmCadModelo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmCadModelo.btnIncluirClick(Sender: TObject);
begin
  with dtMod do
  begin
    SQLCon.StartTransaction(TransDesc);
    sqlModelo.Append;
    sqlModeloCODIGOMODELO.AsInteger := GeraCodigo('GEN_CODMODELO');
    Application.CreateForm(TfrmAtuModelo, frmAtuModelo);
    frmAtuModelo.ShowModal;
    if SQLCon.InTransaction then
      SQLCon.Commit(TransDesc);
  end;
end;

procedure TfrmCadModelo.btnAlterarClick(Sender: TObject);
begin
  with dtMod do
  begin
    SQLCon.StartTransaction(TransDesc);
    sqlModelo.Edit;
    Application.CreateForm(TfrmAtuModelo, frmAtuModelo);
    frmAtuModelo.ShowModal;
    if SQLCon.InTransaction then
      SQLCon.Commit(TransDesc);
  end;
end;

procedure TfrmCadModelo.btnAtualizarClick(Sender: TObject);
begin
  with dtMod do
  begin
    if SQLCon.InTransaction then
      SQLCon.Commit(TransDesc);
    sqlModelo.Refresh;
  end;
end;

procedure TfrmCadModelo.FormCreate(Sender: TObject);
begin
  if not dtMod.sqlMarca.Active then
    dtMod.sqlMarca.Active := True;
  if not dtMod.sqlModelo.Active then
    dtMod.sqlModelo.Active := True;
end;

procedure TfrmCadModelo.btnExcluirClick(Sender: TObject);
begin
  if MessageDlg('Confirma exclusão?', mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
  begin
    dtMod.sqlModelo.Delete;
    dtMod.sqlModelo.ApplyUpdates(-1);
    btnAtualizar.Click;
  end;
end;

procedure TfrmCadModelo.edtPesqChange(Sender: TObject);
begin
  if edtPesq.Text <> '' then
    dtMod.sqlModelo.Locate('DESCRICAO', edtPesq.Text, [loCaseInsensitive, loPartialKey]);
end;

end.

