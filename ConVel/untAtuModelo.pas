unit untAtuModelo;

interface

uses
  SysUtils, Types, Classes, QGraphics, QControls, QForms, QDialogs,
  QStdCtrls, QButtons, QMask, QDBCtrls, DB;

type
  TfrmAtuModelo = class(TForm)
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
  frmAtuModelo: TfrmAtuModelo;

implementation

uses untDatMod, DBClient, untPesqMarca;

{$R *.xfm}

procedure TfrmAtuModelo.btnGravarClick(Sender: TObject);
var
  erros: integer;

begin
  with dtMod do
  begin
    if sqlModelo.State in [dsInsert, dsEdit] then
      sqlModelo.Post;
      
    if sqlModelo.ChangeCount > 0 then
    begin
      erros := sqlModelo.ApplyUpdates(-1);
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

procedure TfrmAtuModelo.btnCancelarClick(Sender: TObject);
begin
  with dtMod do
  begin
    if sqlModelo.State in [dsInsert, dsEdit] then
      sqlModelo.Cancel;
    if SQLCon.InTransaction then
      SQLCon.Rollback(TransDesc);
    Close;
  end;
end;

procedure TfrmAtuModelo.FormShow(Sender: TObject);
begin
  DBEdit2.SetFocus;
end;

procedure TfrmAtuModelo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmAtuModelo.btnPesqClick(Sender: TObject);
begin
  Application.CreateForm(TfrmPesqMarca, frmPesqMarca);
  if frmPesqMarca.ShowModal = mrOk then
  begin
    dtMod.sqlModeloCODIGOMARCA.AsInteger := frmPesqMarca.codMarca;
    SelectNext(ActiveControl, True, true);
  end;
end;

end.
