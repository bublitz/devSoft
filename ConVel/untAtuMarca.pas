unit untAtuMarca;

interface

uses
  SysUtils, Types, Classes, QGraphics, QControls, QForms, QDialogs,
  QStdCtrls, QButtons, QMask, QDBCtrls, DB;

type
  TfrmAtuMarca = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    btnGravar: TSpeedButton;
    btnCancelar: TSpeedButton;
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAtuMarca: TfrmAtuMarca;

implementation

uses untDatMod, DBClient;

{$R *.xfm}

procedure TfrmAtuMarca.btnGravarClick(Sender: TObject);
var
  erros: integer;

begin
  with dtMod do
  begin
    if sqlMarca.State in [dsInsert, dsEdit] then
      sqlMarca.Post;
      
    if sqlMarca.ChangeCount > 0 then
    begin
      erros := sqlMarca.ApplyUpdates(-1);
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

procedure TfrmAtuMarca.btnCancelarClick(Sender: TObject);
begin
  with dtMod do
  begin
    if sqlMarca.State in [dsInsert, dsEdit] then
      sqlMarca.Cancel;
    if SQLCon.InTransaction then
      SQLCon.Rollback(TransDesc);
    Close;
  end;
end;

procedure TfrmAtuMarca.FormShow(Sender: TObject);
begin
  DBEdit2.SetFocus;
end;

procedure TfrmAtuMarca.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
