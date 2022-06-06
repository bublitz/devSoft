unit untAtuTRepar;

interface

uses
  SysUtils, Types, Classes, QGraphics, QControls, QForms, QDialogs,
  QStdCtrls, QButtons, QMask, QDBCtrls, DB;

type
  TfrmAtuTRepar = class(TForm)
    Label1: TLabel;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
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
  frmAtuTRepar: TfrmAtuTRepar;

implementation

uses untDatMod, DBClient;

{$R *.xfm}

procedure TfrmAtuTRepar.btnGravarClick(Sender: TObject);
var
  erros: integer;

begin
  with dtMod do
  begin
    if sqlTRepar.State in [dsInsert, dsEdit] then
      sqlTRepar.Post;
      
    if sqlTRepar.ChangeCount > 0 then
    begin
      erros := sqlTRepar.ApplyUpdates(-1);
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

procedure TfrmAtuTRepar.btnCancelarClick(Sender: TObject);
begin
  with dtMod do
  begin
    if sqlTRepar.State in [dsInsert, dsEdit] then
      sqlTRepar.Cancel;
    if SQLCon.InTransaction then
      SQLCon.Rollback(TransDesc);
    Close;
  end;
end;

procedure TfrmAtuTRepar.FormShow(Sender: TObject);
begin
  DBEdit2.SetFocus;
end;

procedure TfrmAtuTRepar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
