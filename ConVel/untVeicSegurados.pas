unit untVeicSegurados;

interface

uses
  SysUtils, Types, Classes, QGraphics, QControls, QForms, QDialogs,
  QStdCtrls, QGrids, QDBGrids, QMask, QDBCtrls;

type
  TfrmVeicSegurados = class(TForm)
    Label1: TLabel;
    DBEdit6: TDBEdit;
    gridSegur: TDBGrid;
    btnVai: TButton;
    btnVolta: TButton;
    gridVeic: TDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnVaiClick(Sender: TObject);
    procedure btnVoltaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmVeicSegurados: TfrmVeicSegurados;

implementation

uses untDatMod;

{$R *.xfm}

procedure TfrmVeicSegurados.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dtMod.sqlVeicSeguro.Close;
  dtMod.sqlVeicNaoSeg.Close;
  Action := caFree;
end;

procedure TfrmVeicSegurados.FormCreate(Sender: TObject);
begin
  dtMod.sqlVeicSeguro.Params[0].AsInteger := dtMod.sqlSeguroCODIGOSEGURO.AsInteger;
  dtMod.sqlVeicSeguro.Open;
  dtMod.sqlVeicNaoSeg.Open;
end;

procedure TfrmVeicSegurados.btnVaiClick(Sender: TObject);
var
  erros, i: integer;

begin
  if gridVeic.SelectedRows.Count > 0 then
    with dtMod do
    begin
      SQLCon.StartTransaction(TransDesc);
      for i := 0 to gridVeic.SelectedRows.Count-1 do
      begin
        gridVeic.DataSource.DataSet.GotoBookmark(pointer(gridVeic.SelectedRows.Items[i]));
        sqlVeicSeguro.Append;
        sqlVeicSeguroCODIGOSEGURO.AsInteger := sqlSeguroCODIGOSEGURO.AsInteger;
        sqlVeicSeguroCODIGOVEICULO.AsInteger := sqlVeicNaoSegCODIGOVEICULO.AsInteger;
        sqlVeicSeguro.Post;
      end;
      erros := sqlVeicSeguro.ApplyUpdates(-1);
      if erros = 0 then
      begin
        SQLCon.Commit(TransDesc);
        sqlVeicSeguro.Refresh;
        sqlVeicNaoSeg.Refresh;
      end;
    end;
  gridVeic.SelectedRows.Clear;
end;

procedure TfrmVeicSegurados.btnVoltaClick(Sender: TObject);
var
  i: integer;

begin
  if gridSegur.SelectedRows.Count > 0 then
    with dtMod do
    begin
      SQLCon.StartTransaction(TransDesc);
      for i := 0 to gridSegur.SelectedRows.Count-1 do
      begin
        gridSegur.DataSource.DataSet.GotoBookmark(pointer(gridSegur.SelectedRows.Items[i]));
        sqlVeicSeguro.Delete;
      end;
      sqlVeicSeguro.ApplyUpdates(-1);
      SQLCon.Commit(TransDesc);
      sqlVeicSeguro.Refresh;
      sqlVeicNaoSeg.Refresh;
    end;
end;

end.
