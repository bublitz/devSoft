unit untCadastro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ToolWin, Grids, DBGrids, Buttons, Mask, DB,
  DBCtrls;

type
  TfrmCad = class(TForm)
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
    StaticText1: TStaticText;
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
    procedure btnIncluirClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure edtPesqChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCad: TfrmCad;

implementation

uses untDatModPrinc;

{$R *.dfm}

procedure TfrmCad.btnIncluirClick(Sender: TObject);
begin
  with dmPrinc do
  begin
    //SQLCon.StartTransaction(TransDesc);
    //sqlMarca.Append;
    //sqlMarcaCODIGOMARCA.AsInteger := GeraCodigo('GEN_CODMARCA');

    tbDetail.TabVisible := True;
    tbLIst.TabVisible := False;
  end;
end;

procedure TfrmCad.btnEditarClick(Sender: TObject);
begin
  with dmPrinc do
  begin
    //SQLCon.StartTransaction(TransDesc);
    //sqlMarca.Edit;
    tbDetail.TabVisible := True;
    tbList.TabVisible := False;
  end;
end;

procedure TfrmCad.btnExcluirClick(Sender: TObject);
begin
  if MessageDlg('Confirma exclusão?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    //dmPrinc.sqlMarca.Delete;
    //dmPrinc.sqlMarca.ApplyUpdates(-1);
    //btnAtualizarClick(Sender);
  end;
end;

procedure TfrmCad.btnAtualizarClick(Sender: TObject);
begin
  with dmPrinc do
  begin
    if SQLCon.InTransaction then
      SQLCon.Commit(TransDesc);
    //sqlMarca.Refresh;
  end;
end;

procedure TfrmCad.edtPesqChange(Sender: TObject);
begin
  //if edtPesq.Text <> '' then
  //  dmPrinc.sqlMarca.Locate('DESCRICAO', edtPesq.Text, [loCaseInsensitive, loPartialKey]);
end;

procedure TfrmCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmCad.btnGravarClick(Sender: TObject);
var
  erros: integer;

begin
  with dmPrinc do
  begin
    //if sqlMarca.State in [dsInsert, dsEdit] then
    //  sqlMarca.Post;

    //if sqlMarca.ChangeCount > 0 then
    begin
      //erros := sqlMarca.ApplyUpdates(-1);
      if erros = 0 then
      begin
        SQLCon.Commit(TransDesc);
        tbList.TabVisible := True;
        tbDetail.TabVisible := False;
      end;
    //end
    //else
    //begin
      tbList.TabVisible := True;
      tbDetail.TabVisible := False;
    end;
    if SQLCon.InTransaction then
      SQLCon.Commit(TransDesc);
  end;
end;

procedure TfrmCad.btnCancelarClick(Sender: TObject);
begin
  with dmPrinc do
  begin
    //if sqlMarca.State in [dsInsert, dsEdit] then
    //  sqlMarca.Cancel;
    if SQLCon.InTransaction then
      SQLCon.Rollback(TransDesc);
  end;
  tbList.TabVisible := True;
  tbDetail.TabVisible := False;
end;

end.
