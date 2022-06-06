unit untCadTAbast;

interface

uses
  SysUtils, Types, Classes, QGraphics, QControls, QForms, QDialogs,
  QStdCtrls, QImgList, QComCtrls, QGrids, QDBGrids, DB;

type
  TfrmCadTAbast = class(TForm)
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
  frmCadTAbast: TfrmCadTAbast;

implementation

uses untDatMod, untAtuTAbast;

{$R *.xfm}

procedure TfrmCadTAbast.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmCadTAbast.btnIncluirClick(Sender: TObject);
begin
  with dtMod do
  begin
    SQLCon.StartTransaction(TransDesc);
    sqlTAbast.Append;
    sqlTAbastCODIGOTIPOABAST.AsInteger := GeraCodigo('GEN_CODABAST');
    Application.CreateForm(TfrmAtuTAbast, frmAtuTAbast);
    frmAtuTAbast.ShowModal;
    if SQLCon.InTransaction then
      SQLCon.Commit(TransDesc);
  end;
end;

procedure TfrmCadTAbast.btnAlterarClick(Sender: TObject);
begin
  with dtMod do
  begin
    SQLCon.StartTransaction(TransDesc);
    sqlTAbast.Edit;
    Application.CreateForm(TfrmAtuTAbast, frmAtuTAbast);
    frmAtuTAbast.ShowModal;
    if SQLCon.InTransaction then
      SQLCon.Commit(TransDesc);
  end;
end;

procedure TfrmCadTAbast.btnAtualizarClick(Sender: TObject);
begin
  with dtMod do
  begin
    if SQLCon.InTransaction then
      SQLCon.Commit(TransDesc);
    sqlTAbast.Refresh;
  end;
end;

procedure TfrmCadTAbast.FormCreate(Sender: TObject);
begin
  if not dtMod.sqlTAbast.Active then
    dtMod.sqlTAbast.Active := True;
end;

procedure TfrmCadTAbast.btnExcluirClick(Sender: TObject);
begin
  if MessageDlg('Confirma exclusão?', mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
  begin
    dtMod.sqlTAbast.Delete;
    dtMod.sqlTAbast.ApplyUpdates(-1);
    btnAtualizar.Click;
  end;
end;

procedure TfrmCadTAbast.edtPesqChange(Sender: TObject);
begin
  if edtPesq.Text <> '' then
    dtMod.sqlTAbast.Locate('DESCRICAO', edtPesq.Text, [loCaseInsensitive, loPartialKey]);
end;

end.
