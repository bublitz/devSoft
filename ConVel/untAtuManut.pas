unit untAtuManut;

interface

uses
  SysUtils, Types, Classes, QGraphics, QControls, QForms, QDialogs,
  QStdCtrls, QButtons, QMask, QDBCtrls, DB, DBClient;

type
  TfrmAtuManut = class(TForm)
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
  frmAtuManut: TfrmAtuManut;

implementation

uses untDatMod, untPesqTManut, untAtuVeiculo;

{$R *.xfm}

procedure TfrmAtuManut.btnGravarClick(Sender: TObject);
var
  estado: TDataSetState;
  erros, codmanut, codveic: integer;

begin
  with dtMod do
  begin
    estado := sqlManut.State;
    if estado in [dsInsert, dsEdit] then
      sqlManut.Post;

    if (estado = dsInsert) and (sqlManutCODIGOTIPOMANUT.Value = 11) then
    begin
      codveic  := sqlManutCODIGOVEICULO.AsInteger;
      codmanut := sqlManutCODIGOTIPOMANUT.AsInteger;
      if sqlTManu.Locate('codigotipomanut', codmanut, []) and
         sqlVeic.Locate('codigoveiculo', codVeic, []) then
      begin
        Application.CreateForm(TfrmAtuVeiculo, frmAtuVeiculo);
        sqlVeic.Edit;
        sqlVeicULTIMATROCA.Value := sqlManutHODOMETRO.Value;
        if frmAtuVeiculo.ShowModal = mrOk then
          sqlVeic.Post
        else
          sqlVeic.Cancel;
      end;
    end;

    if sqlManut.ChangeCount > 0 then
    begin
      erros := sqlManut.ApplyUpdates(-1);
      if erros = 0 then
      begin
        SQLCon.Commit(TransDesc);
        frmAtuManut.Close;
      end;
    end
    else
      frmAtuManut.Close;
  end;
end;

procedure TfrmAtuManut.btnCancelarClick(Sender: TObject);
begin
  with dtMod do
  begin
    if sqlManut.State in [dsInsert, dsEdit] then
      sqlManut.Cancel;
    if SQLCon.InTransaction then
      SQLCon.Rollback(TransDesc);
  end;
  Close;
end;

procedure TfrmAtuManut.FormShow(Sender: TObject);
begin
  DBEdit2.SetFocus;
end;

procedure TfrmAtuManut.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmAtuManut.btnPesqClick(Sender: TObject);
begin
  Application.CreateForm(TfrmPesqTManut, frmPesqTManut);
  if frmPesqTManut.ShowModal = mrOk then
  begin
    dtMod.sqlManutCODIGOTIPOMANUT.AsInteger := frmPesqTManut.codTManut;
    if dtMod.sqlManutVALOR.Value=0 then
      dtMod.sqlManutVALOR.Value := frmPesqTManut.valTManut;
    DBEdit3.SetFocus;
  end;
end;

procedure TfrmAtuManut.DBEdit2Exit(Sender: TObject);
begin
  if dtMod.sqlManutVALOR.Value=0 then
    if dtMod.sqlTManu.Locate('CODIGOTIPOMANUT',dtMod.sqlManutCODIGOTIPOMANUT.Value,[]) then
      dtMod.sqlManutVALOR.Value := dtMod.sqlTManuVALOR.Value;
end;

end.
