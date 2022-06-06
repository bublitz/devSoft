unit untCadPlano;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ToolWin, Grids, DBGrids, Buttons, Mask, DB,
  DBCtrls, ExtCtrls;

type
  TfrmCadPlano = class(TForm)
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
    Label4: TLabel;
    DBEdit4: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    procedure btnIncluirClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure edtPesqChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbDetailEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadPlano: TfrmCadPlano;

implementation

uses untDatModPrinc;

{$R *.dfm}

procedure TfrmCadPlano.btnIncluirClick(Sender: TObject);
var
  tipo, codcon: string;

begin
  with dmPrinc do
  begin
    SQLCon.StartTransaction(TransDesc);
    sqlPlanoConta.Last;
    tipo := sqlPlanoContaTIPO.AsString;
    codcon := sqlPlanoContaCODIGOCONTABIL.AsString;
    codcon := FloatToStr(StrToFloat(codcon) + 0.1);
    sqlPlanoConta.Append;
    sqlPlanoContaCODIGO.AsInteger := GeraCodigo('GEN_CODPLANO');
    sqlPlanoContaCODIGOCONTABIL.AsString := codcon;
    sqlPlanoContaTIPO.AsString := tipo;
    tbDetail.TabVisible := True;
    tbLIst.TabVisible := False;
  end;
end;

procedure TfrmCadPlano.btnEditarClick(Sender: TObject);
begin
  with dmPrinc do
  begin
    SQLCon.StartTransaction(TransDesc);
    sqlPlanoConta.Edit;
    tbDetail.TabVisible := True;
    tbList.TabVisible := False;
  end;
end;

procedure TfrmCadPlano.btnExcluirClick(Sender: TObject);
begin
  if MessageDlg('Confirma exclusão?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    dmPrinc.sqlPlanoConta.Delete;
    dmPrinc.sqlPlanoConta.ApplyUpdates(-1);
    btnAtualizar.Click;
  end;
end;

procedure TfrmCadPlano.btnAtualizarClick(Sender: TObject);
begin
  with dmPrinc do
  begin
    if SQLCon.InTransaction then
      SQLCon.Commit(TransDesc);
    sqlPlanoConta.Refresh;
  end;
end;

procedure TfrmCadPlano.edtPesqChange(Sender: TObject);
begin
  if edtPesq.Text <> '' then
    dmPrinc.sqlPlanoConta.Locate('DESCRICAO', edtPesq.Text, [loCaseInsensitive, loPartialKey]);
end;

procedure TfrmCadPlano.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmPrinc.sqlPlanoConta.Close;
  Action := caFree;
end;

procedure TfrmCadPlano.btnGravarClick(Sender: TObject);
var
  erros: integer;

begin
  with dmPrinc do
  begin
    if sqlPlanoConta.State in [dsInsert, dsEdit] then
      sqlPlanoConta.Post;

    if sqlPlanoConta.ChangeCount > 0 then
    begin
      erros := sqlPlanoConta.ApplyUpdates(-1);
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

procedure TfrmCadPlano.btnCancelarClick(Sender: TObject);
begin
  with dmPrinc do
  begin
    if sqlPlanoConta.State in [dsInsert, dsEdit] then
      sqlPlanoConta.Cancel;
    if SQLCon.InTransaction then
      SQLCon.Rollback(TransDesc);
  end;
  tbList.TabVisible := True;
  tbDetail.TabVisible := False;
end;

procedure TfrmCadPlano.FormCreate(Sender: TObject);
begin
  dmPrinc.sqlPlanoConta.Open;
end;

procedure TfrmCadPlano.tbDetailEnter(Sender: TObject);
begin
  DBEdit4.SetFocus;
end;

end.
