unit untCadReceber;

interface

uses
  SysUtils, Classes,
  {$IFDEF Linux}
    Types, QGraphics, QControls, QForms, QDialogs, QStdCtrls, Mask,
  DBCtrls, StdCtrls, Buttons, Controls, Grids, DBGrids, ComCtrls, ToolWin;
  {$ELSE}
    Windows, Messages, Variants, Graphics, Controls, Forms,
    Dialogs, StdCtrls, ComCtrls, ToolWin, Grids, DBGrids, Buttons, 
    Mask, DB, DBCtrls, ExtCtrls;
  {$ENDIF}

type
  TfrmCadReceber = class(TForm)
    PageControl1: TPageControl;
    tbList: TTabSheet;
    tbDetail: TTabSheet;
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
    btnGravar: TBitBtn;
    btnCancelar: TBitBtn;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    Label12: TLabel;
    DBEdit12: TDBEdit;
    Label13: TLabel;
    DBEdit13: TDBEdit;
    Label14: TLabel;
    DBEdit14: TDBEdit;
    Label15: TLabel;
    DBEdit15: TDBEdit;
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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadReceber: TfrmCadReceber;

implementation

uses untDatModPrinc;

{$IFDEF MSWINDOWS}
  {$R *.dfm}
{$ELSE}
  {$R *.xfm}
{$ENDIF}

procedure TfrmCadReceber.FormCreate(Sender: TObject);
begin
  dmPrinc.sqlReceber.Open;
end;

procedure TfrmCadReceber.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmPrinc.sqlReceber.Close;
  Action := caFree;
end;

procedure TfrmCadReceber.btnIncluirClick(Sender: TObject);
begin
  with dmPrinc do
  begin
    SQLCon.StartTransaction(TransDesc);
    sqlReceber.Append;
    sqlReceberCODIGO.AsInteger := GeraCodigo('GEN_CODRECEBER');
    tbDetail.TabVisible := True;
    tbList.TabVisible := False;
  end;
end;

procedure TfrmCadReceber.btnEditarClick(Sender: TObject);
begin
  with dmPrinc do
  begin
    SQLCon.StartTransaction(TransDesc);
    sqlReceber.Edit;
    tbDetail.TabVisible := True;
    tbList.TabVisible := False;
  end;
end;

procedure TfrmCadReceber.btnExcluirClick(Sender: TObject);
begin
  if MessageDlg('Confirma exclusão?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    dmPrinc.sqlReceber.Delete;
    dmPrinc.sqlReceber.ApplyUpdates(-1);
    btnAtualizar.Click;
  end;
end;

procedure TfrmCadReceber.btnAtualizarClick(Sender: TObject);
begin
  with dmPrinc do
  begin
    if SQLCon.InTransaction then
      SQLCon.Commit(TransDesc);
    sqlReceber.Refresh;
  end;
end;

procedure TfrmCadReceber.edtPesqChange(Sender: TObject);
begin
  if edtPesq.Text <> '' then
    dmPrinc.sqlReceber.Locate('DATAVENCTO', edtPesq.Text, [loCaseInsensitive, loPartialKey]);
end;

procedure TfrmCadReceber.btnGravarClick(Sender: TObject);
var
  erros: integer;

begin
  with dmPrinc do
  begin
    if sqlReceber.State in [dsInsert, dsEdit] then
      sqlReceber.Post;

    if sqlReceber.ChangeCount > 0 then
    begin
      erros := sqlReceber.ApplyUpdates(-1);
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

procedure TfrmCadReceber.btnCancelarClick(Sender: TObject);
begin
  with dmPrinc do
  begin
    if sqlReceber.State in [dsInsert, dsEdit] then
      sqlReceber.Cancel;
    if SQLCon.InTransaction then
      SQLCon.Rollback(TransDesc);
  end;
  tbList.TabVisible := True;
  tbDetail.TabVisible := False;
end;

procedure TfrmCadReceber.tbDetailEnter(Sender: TObject);
begin
  DBEdit2.SetFocus;
end;

end.
