unit untCadTRepar;

interface

uses
  SysUtils, Types, Classes, QGraphics, QControls, QForms, QDialogs,
  QStdCtrls, QImgList, QComCtrls, QGrids, QDBGrids, DB;

type
  TfrmCadTRepar = class(TForm)
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
    procedure btnExcluirClick(Sender: TObject);
    procedure edtPesqChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadTRepar: TfrmCadTRepar;

implementation

uses untDatMod, untAtuMarca, untAtuTRepar;

{$R *.xfm}

procedure TfrmCadTRepar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmCadTRepar.btnIncluirClick(Sender: TObject);
begin
  with dtMod do
  begin
    SQLCon.StartTransaction(TransDesc);
    sqlTRepar.Append;
    sqlTReparCODIGOTIPOREPARO.AsInteger := GeraCodigo('GEN_CODREPARO');
    Application.CreateForm(TfrmAtuTRepar, frmAtuTRepar);
    frmAtuTRepar.ShowModal;
    if SQLCon.InTransaction then
      SQLCon.Commit(TransDesc);
  end;
end;

procedure TfrmCadTRepar.btnAlterarClick(Sender: TObject);
begin
  with dtMod do
  begin
    SQLCon.StartTransaction(TransDesc);
    sqlTRepar.Edit;
    Application.CreateForm(TfrmAtuTRepar, frmAtuTRepar);
    frmAtuTRepar.ShowModal;
    if SQLCon.InTransaction then
      SQLCon.Commit(TransDesc);
  end;
end;

procedure TfrmCadTRepar.btnAtualizarClick(Sender: TObject);
begin
  with dtMod do
  begin
    if SQLCon.InTransaction then
      SQLCon.Commit(TransDesc);
    sqlTRepar.Refresh;
  end;
end;

procedure TfrmCadTRepar.btnExcluirClick(Sender: TObject);
begin
  if MessageDlg('Confirma exclusão?', mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
  begin
    dtMod.sqlTRepar.Delete;
    dtMod.sqlTRepar.ApplyUpdates(-1);
    btnAtualizar.Click;
  end;
end;

procedure TfrmCadTRepar.edtPesqChange(Sender: TObject);
begin
  if edtPesq.Text <> '' then
    dtMod.sqlTRepar.Locate('DESCRICAO', edtPesq.Text, [loCaseInsensitive, loPartialKey]);
end;

procedure TfrmCadTRepar.FormShow(Sender: TObject);
begin
  if not dtMod.sqlTRepar.Active then
    dtMod.sqlTRepar.Active := True;
end;

end.
