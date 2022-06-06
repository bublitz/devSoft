unit untCadUsuario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, DBCtrls, StdCtrls, Buttons, Grids, DBGrids, ComCtrls,
  ToolWin, DB, CheckLst;

type
  TfrmCadUsuario = class(TForm)
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
    PageControl2: TPageControl;
    TabSheet3: TTabSheet;
    GroupBox1: TGroupBox;
    chkLst: TCheckListBox;
    procedure btnGravarClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure edtPesqChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadUsuario: TfrmCadUsuario;

implementation

uses untDatModPrinc;

{$R *.dfm}

procedure TfrmCadUsuario.btnGravarClick(Sender: TObject);

var
  erros: integer;
begin
  with dmPrinc do
  begin
    if SQLEstacao.State in [dsInsert, dsEdit] then
      SQLUsuario.Post;

    if SQLUsuario.ChangeCount > 0 then
    begin
      erros := SQLUsuario.ApplyUpdates(-1);
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

procedure TfrmCadUsuario.BitBtn2Click(Sender: TObject);
begin
  with dmPrinc do
  begin
    if SQLUsuario.State in [dsInsert, dsEdit] then
      SQLUsuario.Cancel;
    if SQLConLocal.InTransaction then
      SQLConLocal.Rollback(TransDesc);
  end;
  TabSheet1.TabVisible := True;
  TabSheet2.TabVisible := False;
end;

procedure TfrmCadUsuario.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  dmPrinc.sqlLoja.Close;
  dmPrinc.SQLUsuario.Close;

end;

procedure TfrmCadUsuario.FormCreate(Sender: TObject);
begin
  dmPrinc.sqlLoja.Open;
  dmPrinc.SQLUsuario.Open;
end;

procedure TfrmCadUsuario.btnIncluirClick(Sender: TObject);
begin
 with dmPrinc do
  begin
    SQLConLocal.StartTransaction(TransDesc);
    SQLUsuario.Append;
    SQLUsuarioCODIGOLOJA.Value := SQLLojaCODIGOLOJA.VALUE;
    SQLUsuarioCODIGOUSUARIO.AsInteger := GeraCodigoLocal('GEN_CODUSUARIO');
    TabSheet2.TabVisible := True;
    TabSheet1.TabVisible := False;
    DBEdit2.SetFocus;
  end;
end;

procedure TfrmCadUsuario.btnEditarClick(Sender: TObject);
begin
  with dmPrinc do
  begin
    SQLConLocal.StartTransaction(TransDesc);
    SQLUsuario.Edit;
    TabSheet2.TabVisible := True;
    TabSheet1.TabVisible := False;
    DBEdit2.SetFocus;
  end;

end;

procedure TfrmCadUsuario.btnExcluirClick(Sender: TObject);
begin
  if MessageDlg('Confirma exclusão?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    dmPrinc.SQLUsuario.Delete;
    dmPrinc.SQLUsuario.ApplyUpdates(-1);
    btnAtualizarClick(Sender);
  end;

end;

procedure TfrmCadUsuario.btnAtualizarClick(Sender: TObject);
begin
 with dmPrinc do
  begin
    if SQLConLocal.InTransaction then
      SQLConLocal.Commit(TransDesc);
    SQLUsuario.Refresh;
  end;
end;

procedure TfrmCadUsuario.edtPesqChange(Sender: TObject);
begin
 if edtPesq.Text <> '' then
   dmPrinc.SQLUsuario.Locate('NomeLogin', edtPesq.Text, [loCaseInsensitive, loPartialKey]);
end;

end.
