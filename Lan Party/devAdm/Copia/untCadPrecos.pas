unit untCadPrecos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ToolWin, Grids, DBGrids, Buttons, Mask,
  DBCtrls;

type
  TfrmCadPrecos = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    btnIncluir: TToolButton;
    btnEditar: TToolButton;
    ToolButton4: TToolButton;
    btnExcluir: TToolButton;
    btnAtualizar: TToolButton;
    ToolButton7: TToolButton;
    StaticText1: TStaticText;
    edtText: TEdit;
    DBGrid1: TDBGrid;
    btnGravar: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    procedure btnIncluirClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure edtTextChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnGravarClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadPrecos: TfrmCadPrecos;

implementation

uses untDatModPrinc;

{$R *.dfm}

procedure TfrmCadPrecos.btnIncluirClick(Sender: TObject);
begin
  with dmPrinc do
  begin
    //SQLConLocal.StartTransaction(TransDesc);
    //sqlMarca.Append;
    //sqlMarcaCODIGOMARCA.AsInteger := GeraCodigo('GEN_CODMARCA');

    TabSheet2.TabVisible := True;
    TabSheet1.TabVisible := False;
  end;
end;

procedure TfrmCadPrecos.btnEditarClick(Sender: TObject);
begin
  with dmPrinc do
  begin
    //SQLConLocal.StartTransaction(TransDesc);
    //sqlMarca.Edit;
    TabSheet2.TabVisible := True;
    TabSheet1.TabVisible := False;
  end;
end;

procedure TfrmCadPrecos.btnExcluirClick(Sender: TObject);
begin
  if MessageDlg('Confirma exclusão?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    //dmPrinc.sqlMarca.Delete;
    //dmPrinc.sqlMarca.ApplyUpdates(-1);
    //btnAtualizarClick(Sender);
  end;
end;

procedure TfrmCadPrecos.btnAtualizarClick(Sender: TObject);
begin
  with dmPrinc do
  begin
    //if SQLCon.InTransaction then
    //  SQLCon.Commit(TransDesc);
    //sqlMarca.Refresh;
  end;
end;

procedure TfrmCadPrecos.edtTextChange(Sender: TObject);
begin
  //if edtPesq.Text <> '' then
  //  dtMod.sqlMarca.Locate('DESCRICAO', edtPesq.Text, [loCaseInsensitive, loPartialKey]);
end;

procedure TfrmCadPrecos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmCadPrecos.btnGravarClick(Sender: TObject);
var
  erros: integer;

begin
  with dmPrinc do
  begin
    //if sqlMarca.State in [dsInsert, dsEdit] then
    //  sqlMarca.Post;

    //if sqlMarca.ChangeCount > 0 then
    //begin
    //  erros := sqlMarca.ApplyUpdates(-1);
    //  if erros = 0 then
    //  begin
    //    SQLConLocal.Commit(TransDesc);
    //    TabSheet1.TabVisible := True;
    //    TabSheet2.TabVisible := False;
    //  end;
    //end
    //else
    //begin
      TabSheet1.TabVisible := True;
      TabSheet2.TabVisible := False;
    //end;
    //if SQLConLocal.InTransaction then
    //  SQLConLocal.Commit(TransDesc);
  end;
end;

procedure TfrmCadPrecos.BitBtn2Click(Sender: TObject);
begin
  with dmPrinc do
  begin
    //if sqlMarca.State in [dsInsert, dsEdit] then
    //  sqlMarca.Cancel;
    //if SQLConLocal.InTransaction then
    //  SQLConLocal.Rollback(TransDesc);
  end;
  TabSheet1.TabVisible := True;
  TabSheet2.TabVisible := False;
end;

end.
