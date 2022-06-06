unit untAtuAbast;

interface

uses
  SysUtils, Types, Classes, QGraphics, QControls, QForms, QDialogs,
  QStdCtrls, QButtons, QMask, QDBCtrls, DB, DBClient;

type
  TfrmAtuAbast = class(TForm)
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
    DBCheckBox1: TDBCheckBox;
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnPesqClick(Sender: TObject);
    procedure DBEdit2Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAtuAbast: TfrmAtuAbast;

implementation

uses untDatMod, untPesqTAbast;

{$R *.xfm}

procedure TfrmAtuAbast.btnGravarClick(Sender: TObject);
var
  erros: integer;

begin
  with dtMod do
  begin
    if sqlAbast.State in [dsInsert, dsEdit] then
      sqlAbast.Post;

    if sqlAbast.ChangeCount > 0 then
    begin
      erros := sqlAbast.ApplyUpdates(-1);
      if erros = 0 then
      begin
        SQLCon.Commit(TransDesc);
        frmAtuAbast.Close;
      end;
    end
    else
      frmAtuAbast.Close;
  end;
end;

procedure TfrmAtuAbast.btnCancelarClick(Sender: TObject);
begin
  with dtMod do
  begin
    if sqlAbast.State in [dsInsert, dsEdit] then
      sqlAbast.Cancel;
    if SQLCon.InTransaction then
      SQLCon.Rollback(TransDesc);
  end;
  Close;
end;

procedure TfrmAtuAbast.FormShow(Sender: TObject);
begin
  DBEdit2.SetFocus;
end;

procedure TfrmAtuAbast.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmAtuAbast.btnPesqClick(Sender: TObject);
begin
  Application.CreateForm(TfrmPesqTAbast, frmPesqTAbast);
  if frmPesqTAbast.ShowModal = mrOk then
  begin
    dtMod.sqlAbastCODIGOTIPOABAST.AsInteger := frmPesqTAbast.codTAbast;
    if dtMod.sqlAbastVALORUNITARIO.Value=0 then
      dtMod.sqlAbastVALORUNITARIO.Value := frmPesqTAbast.valTAbast;
    DBEdit3.SetFocus;
  end;
end;

procedure TfrmAtuAbast.DBEdit2Exit(Sender: TObject);
begin
  if dtMod.sqlAbastVALORUNITARIO.Value=0 then
    if dtMod.sqlTAbast.Locate('CODIGOTIPOABAST',dtMod.sqlAbastCODIGOTIPOABAST.Value,[]) then
      dtMod.sqlAbastVALORUNITARIO.Value := dtMod.sqlTAbastVALOR.Value;
end;

end.
