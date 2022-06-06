unit untCadMarca;

interface

uses
  SysUtils, Types, Classes, QGraphics, QControls, QForms, QDialogs,
  QStdCtrls, QImgList, QComCtrls, QGrids, QDBGrids, DB;

type
  TfrmCadMarca = class(TForm)
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
  frmCadMarca: TfrmCadMarca;

implementation

uses untDatMod, untAtuMarca;

{$R *.xfm}

procedure TfrmCadMarca.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmCadMarca.btnIncluirClick(Sender: TObject);
begin
  with dtMod do
  begin
    SQLCon.StartTransaction(TransDesc);
    sqlMarca.Append;
    sqlMarcaCODIGOMARCA.AsInteger := GeraCodigo('GEN_CODMARCA');
    Application.CreateForm(TfrmAtuMarca, frmAtuMarca);
    frmAtuMarca.ShowModal;
    if SQLCon.InTransaction then
      SQLCon.Commit(TransDesc);
  end;
end;

procedure TfrmCadMarca.btnAlterarClick(Sender: TObject);
begin
  with dtMod do
  begin
    SQLCon.StartTransaction(TransDesc);
    sqlMarca.Edit;
    Application.CreateForm(TfrmAtuMarca, frmAtuMarca);
    frmAtuMarca.ShowModal;
    if SQLCon.InTransaction then
      SQLCon.Commit(TransDesc);
  end;
end;

procedure TfrmCadMarca.btnAtualizarClick(Sender: TObject);
begin
  with dtMod do
  begin
    if SQLCon.InTransaction then
      SQLCon.Commit(TransDesc);
    sqlMarca.Refresh;
  end;
end;

procedure TfrmCadMarca.FormCreate(Sender: TObject);
begin
  if not dtMod.sqlMarca.Active then
    dtMod.sqlMarca.Active := True;
end;

procedure TfrmCadMarca.btnExcluirClick(Sender: TObject);
begin
  if MessageDlg('Confirma exclusão?', mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
  begin
    dtMod.sqlMarca.Delete;
    dtMod.sqlMarca.ApplyUpdates(-1);
    btnAtualizar.Click;
  end;
end;

procedure TfrmCadMarca.edtPesqChange(Sender: TObject);
begin
  if edtPesq.Text <> '' then
    dtMod.sqlMarca.Locate('DESCRICAO', edtPesq.Text, [loCaseInsensitive, loPartialKey]);
end;

end.
