unit untAtuQuilo;

interface

uses
  SysUtils, Types, Classes, QGraphics, QControls, QForms, QDialogs,
  QStdCtrls, QGrids, QButtons, Provider, SqlExpr, DB, DBClient, DBLocal,
  DBLocalS;

type
  TfrmAtuQuilo = class(TForm)
    gdQuilo: TStringGrid;
    btnGravar: TSpeedButton;
    btnCancelar: TSpeedButton;
    dsQuilo: TDataSource;
    sqlQuilo: TSQLClientDataSet;
    sqlQuiloCODIGOVEICULO: TIntegerField;
    sqlQuiloDATA: TDateField;
    sqlQuiloFINAL: TIntegerField;
    sqlQuiloINICIO: TIntegerField;
    sqlQuiloVIAGEM: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    aCodVeic: array of integer;
  end;

var
  frmAtuQuilo: TfrmAtuQuilo;

implementation

uses untDatMod, untManQuilo, untFuncoes;

{$R *.xfm}

procedure TfrmAtuQuilo.FormCreate(Sender: TObject);

begin
  gdQuilo.Cells[0,0] := 'Veículo';
  gdQuilo.Cells[1,0] := 'Km Inicial';
  gdQuilo.Cells[2,0] := 'Km Final';
  gdQuilo.Cells[3,0] := 'Em Viagem';
end;

procedure TfrmAtuQuilo.FormShow(Sender: TObject);
var
  i: integer;

begin
  if not dtMod.sqlVeic.Active then
    dtMod.sqlVeic.Active := True;

  i := dtMod.sqlVeic.RecordCount;
  gdQuilo.RowCount := i + 1;
  SetLength(aCodVeic, i + 1);

  i := 1;
  dtMod.sqlVeic.First;
  while not dtMod.sqlVeic.Eof do
  begin
    aCodVeic[i] := dtMod.sqlVeicCODIGOVEICULO.AsInteger;
    gdQuilo.Cells[0, i] := dtMod.sqlVeicPLACA.AsString + ' ' +
                           dtMod.sqlVeicDESCMODELO.AsString;
    dtMod.sqlVeic.Next;
    inc(i);
  end;

  frmManQuilo.sqlKm.First;
  while not frmManQuilo.sqlKm.Eof do
  begin
    i := AScan( aCodVeic, frmManQuilo.sqlKmCODIGOVEICULO.AsInteger);
    if i > -1 then
    begin
      gdQuilo.Cells[1, i] := frmManQuilo.sqlKmINICIO.AsString;
      gdQuilo.Cells[2, i] := frmManQuilo.sqlKmFINAL.AsString;
      gdQuilo.Cells[3, i] := frmManQuilo.sqlKmVIAGEM.AsString;
    end;
    frmManQuilo.sqlKm.Next;
  end;
end;

procedure TfrmAtuQuilo.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmAtuQuilo.btnGravarClick(Sender: TObject);
var
  i, erros: integer;

begin
  sqlQuilo.Open;
  dtMod.SQLCon.StartTransaction(dtMod.TransDesc);
  for i := 1 to Length(aCodVeic)-1 do
    if (gdQuilo.Cells[1, i] <> '') and
       (gdQuilo.Cells[2, i] <> '') then
    begin
      if sqlQuilo.FindKey([aCodVeic[i], frmManQuilo.data]) then
        sqlQuilo.Edit
      else
      begin
        sqlQuilo.Append;
        sqlQuiloCODIGOVEICULO.Value := aCodVeic[i];
        sqlQuiloDATA.Value := frmManQuilo.data;
      end;
      try
        sqlQuiloINICIO.Value := StrToInt(gdQuilo.Cells[1, i]);
        sqlQuiloFINAL.Value := StrToInt(gdQuilo.Cells[2, i]);
        if gdQuilo.Cells[3, i] <> '' then
          sqlQuiloVIAGEM.Value := 'X';
      except
      end;
      sqlQuilo.Post;
    end;
  erros := sqlQuilo.ApplyUpdates(-1);
  if erros = 0 then
  begin
    dtMod.SQLCon.Commit(dtMod.TransDesc);
    sqlQuilo.Close;
    Close;
  end;
end;

procedure TfrmAtuQuilo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
