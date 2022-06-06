unit untAtuTManu;

interface

uses
  SysUtils, Types, Classes, QGraphics, QControls, QForms, QDialogs,
  QStdCtrls, QButtons, QMask, QDBCtrls, DB, QExtCtrls;

type
  TfrmAtuTManu = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    btnGravar: TSpeedButton;
    btnCancelar: TSpeedButton;
    DBRadioGroup1: TDBRadioGroup;
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
  frmAtuTManu: TfrmAtuTManu;

implementation

uses untDatMod, DBClient;

{$R *.xfm}

procedure TfrmAtuTManu.btnGravarClick(Sender: TObject);
var
  erros: integer;

begin
  with dtMod do
  begin
    if sqlTManu.State in [dsInsert, dsEdit] then
      sqlTManu.Post;
      
    if sqlTManu.ChangeCount > 0 then
    begin
      erros := sqlTManu.ApplyUpdates(-1);
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

procedure TfrmAtuTManu.btnCancelarClick(Sender: TObject);
begin
  with dtMod do
  begin
    if sqlTManu.State in [dsInsert, dsEdit] then
      sqlTManu.Cancel;
    if SQLCon.InTransaction then
      SQLCon.Rollback(TransDesc);
    Close;
  end;
end;

procedure TfrmAtuTManu.FormShow(Sender: TObject);
begin
  DBEdit2.SetFocus;
end;

procedure TfrmAtuTManu.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
