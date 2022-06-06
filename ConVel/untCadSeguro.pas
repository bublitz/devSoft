unit untCadSeguro;

interface

uses
  SysUtils, Classes, DB,
  Types, QGraphics, QControls, QForms, QDialogs, QStdCtrls, QButtons,
  QMask, QDBCtrls, QGrids, QDBGrids, QComCtrls;

type
  TfrmCadSeguro = class(TForm)
    PageControl1: TPageControl;
    tbList: TTabSheet;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    btnIncluir: TToolButton;
    btnEditar: TToolButton;
    ToolButton4: TToolButton;
    btnExcluir: TToolButton;
    btnAtualizar: TToolButton;
    ToolButton7: TToolButton;
    LabPesquisa: TLabel;
    edtPesq: TEdit;
    DBGrid1: TDBGrid;
    tbDetail: TTabSheet;
    DBEdit7: TDBEdit;
    Label7: TLabel;
    DBEdit6: TDBEdit;
    Label6: TLabel;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    btnCancelar: TBitBtn;
    btnGravar: TBitBtn;
    DBMemo1: TDBMemo;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure edtPesqChange(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure tbDetailEnter(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadSeguro: TfrmCadSeguro;

implementation

uses untDatMod, untVeicSegurados;

{$R *.xfm}

procedure TfrmCadSeguro.FormCreate(Sender: TObject);
begin
  dtMod.sqlSeguro.Open;
end;

procedure TfrmCadSeguro.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dtMod.sqlSeguro.Close;
  Action := caFree;
end;

procedure TfrmCadSeguro.btnIncluirClick(Sender: TObject);
begin
  with dtMod do
  begin
    SQLCon.StartTransaction(TransDesc);
    sqlSeguro.Append;
    sqlSeguroCODIGOSEGURO.AsInteger := GeraCodigo('GEN_CODSEGURO');
    tbDetail.TabVisible := True;
    tbList.TabVisible := False;
  end;
end;

procedure TfrmCadSeguro.btnEditarClick(Sender: TObject);
begin
  with dtMod do
  begin
    SQLCon.StartTransaction(TransDesc);
    sqlSeguro.Edit;
    tbDetail.TabVisible := True;
    tbList.TabVisible := False;
  end;
end;

procedure TfrmCadSeguro.btnExcluirClick(Sender: TObject);
begin
  if MessageDlg('Confirma exclusão?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    dtMod.sqlSeguro.Delete;
    dtMod.sqlSeguro.ApplyUpdates(-1);
    btnAtualizar.Click;
  end;
end;

procedure TfrmCadSeguro.btnAtualizarClick(Sender: TObject);
begin
  with dtMod do
  begin
    if SQLCon.InTransaction then
      SQLCon.Commit(TransDesc);
    sqlSeguro.Refresh;
  end;
end;

procedure TfrmCadSeguro.edtPesqChange(Sender: TObject);
begin
  if edtPesq.Text <> '' then
    dtMod.sqlSeguro.Locate('SEGURADORA', edtPesq.Text, [loCaseInsensitive, loPartialKey]);
end;

procedure TfrmCadSeguro.btnGravarClick(Sender: TObject);
var
  erros: integer;

begin
  with dtMod do
  begin
    if sqlSeguro.State in [dsInsert, dsEdit] then
      sqlSeguro.Post;

    if sqlSeguro.ChangeCount > 0 then
    begin
      erros := sqlSeguro.ApplyUpdates(-1);
      if erros = 0 then
      begin
        SQLCon.Commit(TransDesc);
        tbList.TabVisible := True;
        tbDetail.TabVisible := False;
      end;
    end
    else
    begin
      tbList.TabVisible := True;
      tbDetail.TabVisible := False;
    end;
    if SQLCon.InTransaction then
      SQLCon.Commit(TransDesc);
  end;
end;

procedure TfrmCadSeguro.btnCancelarClick(Sender: TObject);
begin
  with dtMod do
  begin
    if sqlSeguro.State in [dsInsert, dsEdit] then
      sqlSeguro.Cancel;
    if SQLCon.InTransaction then
      SQLCon.Rollback(TransDesc);
  end;
  tbList.TabVisible := True;
  tbDetail.TabVisible := False;
end;

procedure TfrmCadSeguro.tbDetailEnter(Sender: TObject);
begin
  DBEdit6.SetFocus;
end;

procedure TfrmCadSeguro.ToolButton3Click(Sender: TObject);
begin
  Application.CreateForm(TfrmVeicSegurados, frmVeicSegurados);
  frmVeicSegurados.ShowModal;
end;

end.
