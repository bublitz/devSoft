unit untAtuReparo;

interface

uses
  SysUtils, Types, Classes, QGraphics, QControls, QForms, QDialogs,
  QStdCtrls, QButtons, QMask, QDBCtrls, DB, DBClient;

type
  TfrmAtuReparo = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    btnGravar: TSpeedButton;
    btnCancelar: TSpeedButton;
    btnPesq: TSpeedButton;
    DBEdit4: TDBEdit;
    Label4: TLabel;
    DBEdit5: TDBEdit;
    Label5: TLabel;
    DBEdit1: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    Label8: TLabel;
    DBEdit9: TDBEdit;
    DBMemo1: TDBMemo;
    Label9: TLabel;
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
  frmAtuReparo: TfrmAtuReparo;

implementation

uses untDatMod, untPesqTReparo;

{$R *.xfm}

procedure TfrmAtuReparo.btnGravarClick(Sender: TObject);
var
  erros: integer;

begin
  with dtMod do
  begin
    if sqlReparo.State in [dsInsert, dsEdit] then
      sqlReparo.Post;

    if sqlReparo.ChangeCount > 0 then
    begin
      erros := sqlReparo.ApplyUpdates(-1);
      if erros = 0 then
      begin
        SQLCon.Commit(TransDesc);
        frmAtuReparo.Close;
      end;
    end
    else
      frmAtuReparo.Close;
  end;
end;

procedure TfrmAtuReparo.btnCancelarClick(Sender: TObject);
begin
  with dtMod do
  begin
    if sqlReparo.State in [dsInsert, dsEdit] then
      sqlReparo.Cancel;
    if SQLCon.InTransaction then
      SQLCon.Rollback(TransDesc);
  end;
  Close;
end;

procedure TfrmAtuReparo.FormShow(Sender: TObject);
begin
  DBEdit2.SetFocus;
end;

procedure TfrmAtuReparo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmAtuReparo.btnPesqClick(Sender: TObject);
begin
  Application.CreateForm(TfrmPesqTReparo, frmPesqTReparo);
  if frmPesqTReparo.ShowModal = mrOk then
  begin
    dtMod.sqlReparoCODIGOTIPOREPARO.AsInteger := frmPesqTReparo.codTReparo;
    DBEdit3.SetFocus;
  end;
end;

end.
