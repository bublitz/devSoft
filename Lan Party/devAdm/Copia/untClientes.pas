unit untClientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ToolWin, Grids, DBGrids, Buttons, Mask,
  DBCtrls, DB, ExtCtrls;

type
  TfrmClientes = class(TForm)
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
    edtPesq: TEdit;
    DBGrid1: TDBGrid;
    btnGravar: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    btnPesq: TSpeedButton;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    GroupBox1: TGroupBox;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    LabeledEdit1: TLabeledEdit;
    DBEdit24: TDBEdit;
    DBEdit25: TDBEdit;
    procedure btnIncluirClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure edtPesqChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnGravarClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure btnPesqClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmClientes: TfrmClientes;

implementation

uses untDatModPrinc, untPesqClientes;

{$R *.dfm}

procedure TfrmClientes.btnIncluirClick(Sender: TObject);
begin
  with dmPrinc do
  begin
    if online then
      SQLConRemoto.StartTransaction(TransDesc)
    else
      SQLConLocal.StartTransaction(TransDesc);
    sqlCliente.Append;
    sqlClienteCODIGOLOJA.Value := sqlLojaCODIGOLOJA.Value;
    sqlClienteCODIGOCliente.AsInteger := GeraCodigoRemoto('GEN_CODCliente');

    TabSheet2.TabVisible := True;
    TabSheet1.TabVisible := False;
    DBEdit2.SetFocus;
  end;
end;

procedure TfrmClientes.btnEditarClick(Sender: TObject);
begin
  with dmPrinc do
  begin
    if online then
      SQLConRemoto.StartTransaction(TransDesc)
    else
      SQLConLocal.StartTransaction(TransDesc);
    sqlCliente.Edit;
    TabSheet2.TabVisible := True;
    TabSheet1.TabVisible := False;
    DBEdit2.SetFocus;
  end;
end;

procedure TfrmClientes.btnExcluirClick(Sender: TObject);
begin
  if MessageDlg('Confirma exclusão?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    dmPrinc.sqlCliente.Delete;
    dmPrinc.sqlCliente.ApplyUpdates(-1);
    btnAtualizarClick(Sender);
  end;
end;

procedure TfrmClientes.btnAtualizarClick(Sender: TObject);
begin
  with dmPrinc do
  begin
    if SQLConRemoto.InTransaction then
      SQLConRemoto.Commit(TransDesc);
    sqlCliente.Refresh;
  end;
end;

procedure TfrmClientes.edtPesqChange(Sender: TObject);
begin
  if edtPesq.Text <> '' then
    dmPrinc.sqlCliente.Locate('NOMECOMPLETO ', edtPesq.Text, [loCaseInsensitive, loPartialKey]);
end;

procedure TfrmClientes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  dmPrinc.sqlCliente.Close;
end;

procedure TfrmClientes.btnGravarClick(Sender: TObject);
var
  erros: integer;
  estado: TDataSetState;

begin
  with dmPrinc do
  begin
    estado := sqlCliente.State;
    if estado in [dsInsert, dsEdit] then
    begin
      sqlCliente.Post;

      sqlLogCli.Append;
      if estado = dsInsert then
        sqlLogCliACAO.AsInteger := 1
      else
        sqlLogCliACAO.AsInteger := 2;

      sqlLogCliCODIGOLOJA.AsInteger    := sqlLojaCODIGOLOJA.AsInteger;
      sqlLogCliCODIGOCLIENTE.AsInteger := sqlClienteCODIGOCLIENTE.AsInteger;
      sqlLogCliDATA.AsDateTime         := Date;
      sqlLogCliQUANTIDADE.AsInteger    := 0;
      sqlLogCliVALIDADE.AsDateTime     := Date;
      if online then
        sqlLogCliControle.Value := GeraCodigoRemoto('GEN_CONLOGCLI');

      sqlLogCli.Post;
    end;

    erros := sqlCliente.ApplyUpdates(-1) + sqlLogCli.ApplyUpdates(-1);
    if erros = 0 then
    begin
      if online then
        SQLConRemoto.Commit(TransDesc)
      else
        SQLConLocal.Commit(TransDesc);
      TabSheet1.TabVisible := True;
      TabSheet2.TabVisible := False;
    end;
  end;
end;

procedure TfrmClientes.BitBtn2Click(Sender: TObject);
begin
  with dmPrinc do
  begin
    if sqlCliente.State in [dsInsert, dsEdit] then
      sqlCliente.Cancel;

    if online and SQLConRemoto.InTransaction then
      SQLConRemoto.Rollback(TransDesc)
    else
      SQLConLocal.Rollback(TransDesc);
  end;
  TabSheet1.TabVisible := True;
  TabSheet2.TabVisible := False;
end;

procedure TfrmClientes.btnPesqClick(Sender: TObject);
begin
  Application.CreateForm(TfrmPesqClientes, frmPesqClientes);
  if frmPesqClientes.ShowModal = mrOk then
  begin
    dmPrinc.sqlClienteINDICACAO.AsInteger := frmPesqClientes.codCliente;
    SelectNext(ActiveControl, True, true);
  end;

end;

procedure TfrmClientes.FormCreate(Sender: TObject);
begin
  dmPrinc.sqlLoja.Open;
  dmPrinc.sqlCliente.Open;
  dmPrinc.sqlLogCli.Open;
end;

end.
