unit untAtuVeic;

interface

uses
  SysUtils, Types, Classes, QGraphics, QControls, QForms, QDialogs,
  QStdCtrls, QButtons, QMask, QDBCtrls, DB;

type
  TfrmAtuVeic = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    btnGravar: TSpeedButton;
    btnCancelar: TSpeedButton;
    btnPesq: TSpeedButton;
    DBEdit4: TDBEdit;
    Label4: TLabel;
    DBEdit5: TDBEdit;
    Label5: TLabel;
    DBEdit6: TDBEdit;
    Label6: TLabel;
    DBEdit7: TDBEdit;
    Label7: TLabel;
    DBEdit8: TDBEdit;
    Label11: TLabel;
    DBEdit12: TDBEdit;
    GroupBox1: TGroupBox;
    Label9: TLabel;
    DBEdit10: TDBEdit;
    Label10: TLabel;
    DBEdit11: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnPesqClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAtuVeic: TfrmAtuVeic;

implementation

uses untDatMod, DBClient, untPesqModelo;

{$R *.xfm}

procedure TfrmAtuVeic.btnGravarClick(Sender: TObject);
var
  erros: integer;

begin
  with dtMod do
  begin
    if sqlVeic.State in [dsInsert, dsEdit] then
      sqlVeic.Post;

    if sqlVeic.ChangeCount > 0 then
    begin
      erros := sqlVeic.ApplyUpdates(-1);
      if erros = 0 then
      begin
        SQLCon.Commit(TransDesc);
        Close;
      end;
    end
    else
      Close;
  end;
end;

procedure TfrmAtuVeic.btnCancelarClick(Sender: TObject);
begin
  with dtMod do
  begin
    if sqlVeic.State in [dsInsert, dsEdit] then
      sqlVeic.Cancel;
    if SQLCon.InTransaction then
      SQLCon.Rollback(TransDesc);
    Close;
  end;
end;

procedure TfrmAtuVeic.FormShow(Sender: TObject);
begin
  DBEdit2.SetFocus;
end;

procedure TfrmAtuVeic.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmAtuVeic.btnPesqClick(Sender: TObject);
begin
  Application.CreateForm(TfrmPesqModelo, frmPesqModelo);
  if frmPesqModelo.ShowModal = mrOk then
  begin
    dtMod.sqlVeicCODIGOMODELO.AsInteger := frmPesqModelo.codModelo;
    SelectNext(ActiveControl, True, true);
  end;
end;

end.
