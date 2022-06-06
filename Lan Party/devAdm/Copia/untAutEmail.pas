unit untAutEmail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ToolWin, Grids, DBGrids, Buttons, Mask,
  DBCtrls, DB, ExtCtrls;

type
  TfrmAutEmail = class(TForm)
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
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label7: TLabel;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    DBMemo1: TDBMemo;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    btnPesq: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    diagEmail: TOpenDialog;
    DBRadioGroup1: TDBRadioGroup;
    procedure btnIncluirClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure edtPesqChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnGravarClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure btnPesqClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBCheckBox2Click(Sender: TObject);
    procedure DBEdit3Exit(Sender: TObject);
    procedure DBCheckBox1Exit(Sender: TObject);
    procedure DBCheckBox2Exit(Sender: TObject);
    procedure DBRadioGroup1Exit(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAutEmail: TfrmAutEmail;

implementation

uses untDatModPrinc;

{$R *.dfm}

procedure TfrmAutEmail.btnIncluirClick(Sender: TObject);
begin
  with dmPrinc do
  begin
    SQLConLocal.StartTransaction(TransDesc);
    sqlAutEmail.Append;
    sqlAutEmailCODIGOAUTOMACAO.AsInteger := GeraCodigoLocal('GEN_CODAUTOMACAO');

    TabSheet2.TabVisible := True;
    TabSheet1.TabVisible := False;
    DBEdit2.SetFocus;
  end;
end;

procedure TfrmAutEmail.btnEditarClick(Sender: TObject);
begin
  with dmPrinc do
  begin
    SQLConLocal.StartTransaction(TransDesc);
    sqlAutEmail.Edit;
    TabSheet2.TabVisible := True;
    TabSheet1.TabVisible := False;
    DBEdit2.SetFocus;
  end;
end;

procedure TfrmAutEmail.btnExcluirClick(Sender: TObject);
begin
  if MessageDlg('Confirma exclusão?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    dmPrinc.sqlAutEmail.Delete;
    dmPrinc.sqlAutEmail.ApplyUpdates(-1);
    btnAtualizarClick(Sender);
  end;
end;

procedure TfrmAutEmail.btnAtualizarClick(Sender: TObject);
begin
  with dmPrinc do
  begin
    if SQLConLocal.InTransaction then
      SQLConLocal.Commit(TransDesc);
    sqlAutEmail.Refresh;
  end;
end;

procedure TfrmAutEmail.edtPesqChange(Sender: TObject);
begin
  if edtPesq.Text <> '' then
    dmPrinc.sqlAutEmail.Locate('DESCRICAO', edtPesq.Text, [loCaseInsensitive, loPartialKey]);
end;

procedure TfrmAutEmail.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  dmPrinc.sqlAutEmail.Close;
end;

procedure TfrmAutEmail.btnGravarClick(Sender: TObject);
var
  erros: integer;

begin
  with dmPrinc do
  begin
    if sqlAutEmail.State in [dsInsert, dsEdit] then
      sqlAutEmail.Post;

    if sqlAutEmail.ChangeCount > 0 then
    begin
      erros := sqlAutEmail.ApplyUpdates(-1);
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

procedure TfrmAutEmail.BitBtn2Click(Sender: TObject);
begin
  with dmPrinc do
  begin
    if sqlAutEmail.State in [dsInsert, dsEdit] then
      sqlAutEmail.Cancel;
    if SQLConLocal.InTransaction then
      SQLConLocal.Rollback(TransDesc);
  end;
  TabSheet1.TabVisible := True;
  TabSheet2.TabVisible := False;
end;

procedure TfrmAutEmail.btnPesqClick(Sender: TObject);
begin
  diagEmail.InitialDir := ExtractFilePath(Application.ExeName);
  if diagEmail.Execute then
    dmPrinc.sqlAutEmailARQUIVO1.Value := diagEmail.FileName;
end;

procedure TfrmAutEmail.SpeedButton2Click(Sender: TObject);
begin
  diagEmail.InitialDir := ExtractFilePath(Application.ExeName);
  if diagEmail.Execute then
    dmPrinc.sqlAutEmailARQUIVO2.Value := diagEmail.FileName;
end;

procedure TfrmAutEmail.SpeedButton3Click(Sender: TObject);
begin
  diagEmail.InitialDir := ExtractFilePath(Application.ExeName);
  if diagEmail.Execute then
     dmPrinc.sqlAutEmailARQUIVO3.Value := diagEmail.FileName;
end;

procedure TfrmAutEmail.SpeedButton4Click(Sender: TObject);
begin
  diagEmail.InitialDir := ExtractFilePath(Application.ExeName);
  if diagEmail.Execute then
    dmPrinc.sqlAutEmailARQUIVO4.Value := diagEmail.FileName;

end;

procedure TfrmAutEmail.FormCreate(Sender: TObject);
begin
  dmPrinc.sqlAutEmail.Open;
end;


procedure TfrmAutEmail.DBCheckBox2Click(Sender: TObject);
begin
  dmPrinc.sqlAutEmailDATANASCIMENTO.Value := '';
  dmPrinc.sqlAutEmailDIAMESENVIO.Value := 0;
  dmPrinc.sqlAutEmailDIASEMANAENVIO.Value := 0;
end;

procedure TfrmAutEmail.DBEdit3Exit(Sender: TObject);
begin
  dmPrinc.sqlAutEmailDIASEMANAENVIO.Value :=0 ;
  dmPrinc.sqlAutEmailDATACADASTRO.Value := '';
  dmPrinc.sqlAutEmailDATANASCIMENTO.Value := '';
end;

procedure TfrmAutEmail.DBCheckBox1Exit(Sender: TObject);
begin
  dmPrinc.sqlAutEmailDATACADASTRO.Value := '';
  dmPrinc.sqlAutEmailDIAMESENVIO.Value := 0;
  dmPrinc.sqlAutEmailDIASEMANAENVIO.Value := 0;
end;

procedure TfrmAutEmail.DBCheckBox2Exit(Sender: TObject);
begin
  dmPrinc.sqlAutEmailDATACADASTRO.Value := '';
  dmPrinc.sqlAutEmailDIAMESENVIO.Value := 0;
  dmPrinc.sqlAutEmailDIASEMANAENVIO.Value := 0;
end;

procedure TfrmAutEmail.DBRadioGroup1Exit(Sender: TObject);
begin
  dmPrinc.sqlAutEmailDIAMESENVIO.Value := 0;
  dmPrinc.sqlAutEmailDATACADASTRO.Value := '';
  dmPrinc.sqlAutEmailDATANASCIMENTO.Value := '';
end;

end.


