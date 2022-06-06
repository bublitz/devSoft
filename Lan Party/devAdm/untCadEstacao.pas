unit untCadEstacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, ComCtrls, ToolWin, Mask,
  DBCtrls, DB;

type
  TfrmCadEstacao = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    btnIncluir: TToolButton;
    btnEditar: TToolButton;
    ToolButton4: TToolButton;
    btnExcluir: TToolButton;
    btnAtualizar: TToolButton;
    ToolButton7: TToolButton;
    StaticText1: TStaticText;
    edtPesq: TEdit;
    DBGrid1: TDBGrid;
    TabSheet2: TTabSheet;
    btnGravar: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    procedure btnGravarClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure edtPesqChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadEstacao: TfrmCadEstacao;

implementation

uses untDatModPrinc, untMain;

{$R *.dfm}

procedure TfrmCadEstacao.btnGravarClick(Sender: TObject);
var
  erros: integer;

begin
  with dmPrinc do
  begin
    if SQLEstacao.State in [dsInsert, dsEdit] then
      SQLEstacao.Post;

    if SQLEstacao.ChangeCount > 0 then
    begin
      erros := SQLEstacao.ApplyUpdates(-1);
      if erros = 0 then
      begin
        SQLConLocal.Commit(TransDesc);
        TabSheet1.TabVisible := True;
        TabSheet2.TabVisible := False;
      end;
    end
    else
    begin
      TabSheet1.TabVisible := True;
      TabSheet2.TabVisible := False;
    end;
    if SQLConLocal.InTransaction then
      SQLConLocal.Commit(TransDesc);
  end;
end;

procedure TfrmCadEstacao.BitBtn2Click(Sender: TObject);
begin
  with dmPrinc do
  begin
    if SQLEstacao.State in [dsInsert, dsEdit] then
      SQLEstacao.Cancel;
    if SQLConLocal.InTransaction then
      SQLConLocal.Rollback(TransDesc);
  end;
  TabSheet1.TabVisible := True;
  TabSheet2.TabVisible := False;

end;

procedure TfrmCadEstacao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  dmPrinc.sqlLoja.Close;
  dmPrinc.sqlEstacao.Close;
end;

procedure TfrmCadEstacao.btnIncluirClick(Sender: TObject);
begin
 with dmPrinc do
  begin
    SQLConLocal.StartTransaction(TransDesc);
    sqlEstacao.Append;
    SQLEstacaoCODIGOLOJA.Value := SQLLojaCODIGOLOJA.VALUE;
    SQLEstacaoESTADO.Value:= 'A';
    SQLEstacaoCODIGOESTACAO.AsInteger := GeraCodigoLocal('GEN_CODESTACAO');
    TabSheet2.TabVisible := True;
    TabSheet1.TabVisible := False;
    DBEdit3.SetFocus;    
  end;
end;

procedure TfrmCadEstacao.btnEditarClick(Sender: TObject);
begin
  with dmPrinc do
  begin
    SQLConLocal.StartTransaction(TransDesc);
    sqlEstacao.Edit;
    TabSheet2.TabVisible := True;
    TabSheet1.TabVisible := False;
    DBEdit3.SetFocus;    
  end;
end;

procedure TfrmCadEstacao.btnExcluirClick(Sender: TObject);
begin
  if MessageDlg('Confirma exclusão?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    dmPrinc.SQLEstacao.Delete;
    dmPrinc.SQLEstacao.ApplyUpdates(-1);
    btnAtualizarClick(Sender);
  end;
end;

procedure TfrmCadEstacao.btnAtualizarClick(Sender: TObject);
begin
  with dmPrinc do
  begin
    if SQLConLocal.InTransaction then
      SQLConLocal.Commit(TransDesc);
    SQLEstacao.Refresh;
  end;
end;

procedure TfrmCadEstacao.edtPesqChange(Sender: TObject);
begin
 if edtPesq.Text <> '' then
   dmPrinc.SQLEstacao.Locate('DESCRICAO', edtPesq.Text, [loCaseInsensitive, loPartialKey]);
end;

procedure TfrmCadEstacao.FormCreate(Sender: TObject);
begin
  dmPrinc.sqlLoja.Open;
  dmPrinc.sqlEstacao.Open;
end;

end.

