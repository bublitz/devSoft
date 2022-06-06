unit untManQuilo;

interface

uses
  SysUtils, Types, Classes, QGraphics, QControls, QForms, QDialogs,
  QStdCtrls, QButtons, QMask, QExtCtrls, Provider, SqlExpr, DB, DBClient,
  DBLocal, DBLocalS, QComCtrls, QGrids, QDBGrids, QImgList;

type
  TfrmManQuilo = class(TForm)
    dsKm: TDataSource;
    sqlKm: TSQLClientDataSet;
    sqlKmCODIGOVEICULO: TIntegerField;
    sqlKmDESCRICAO: TStringField;
    sqlKmSIGLA: TStringField;
    sqlKmPLACA: TStringField;
    sqlKmDATA: TDateField;
    sqlKmINICIO: TIntegerField;
    sqlKmFINAL: TIntegerField;
    sqlKmVIAGEM: TStringField;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    DBGrid1: TDBGrid;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    btnAlterar: TToolButton;
    ToolButton4: TToolButton;
    btnAtualizar: TToolButton;
    ToolButton7: TToolButton;
    Label1: TLabel;
    edData: TMaskEdit;
    ToolButton2: TToolButton;
    TabSheet2: TTabSheet;
    Panel2: TPanel;
    btnBusca: TSpeedButton;
    cboxVeic: TComboBox;
    Label2: TLabel;
    edtMesAno: TMaskEdit;
    gdQuilo: TStringGrid;
    btnGravar: TSpeedButton;
    btnCancelar: TSpeedButton;
    dsData: TDataSource;
    sqlData: TSQLClientDataSet;
    sqlDataCODIGOVEICULO: TIntegerField;
    sqlDataDATA: TDateField;
    sqlDataFINAL: TIntegerField;
    sqlDataINICIO: TIntegerField;
    sqlDataVIAGEM: TStringField;
    btnExcluir: TToolButton;
    procedure ToolButton2Click(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure edDataChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnBuscaClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure PageControl1Changing(Sender: TObject;
      var AllowChange: Boolean);
    procedure gdQuiloKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    data: TDateTime;
    aCodVeic: array of integer;
  end;

var
  frmManQuilo: TfrmManQuilo;

implementation

uses untDatMod, untAtuQuilo;

{$R *.xfm}

procedure TfrmManQuilo.ToolButton2Click(Sender: TObject);
begin
  try
    data := StrToDate(edData.Text);
  except
    raise exception.Create('Data Inválida !!');
  end;

  sqlKm.Params[0].AsDate := data;
  sqlKm.Active := True;

  btnAlterar.Enabled := True;
  btnExcluir.Enabled := True;
  btnAtualizar.Enabled := True;
end;

procedure TfrmManQuilo.btnAlterarClick(Sender: TObject);
begin
  if sqlKm.Active then
  begin
    Application.CreateForm(TfrmAtuQuilo, frmAtuQuilo);
    frmAtuQuilo.ShowModal;
  end;
  sqlKm.Close;
  sqlKm.Open;
end;

procedure TfrmManQuilo.edDataChange(Sender: TObject);
begin
  sqlKm.Active := False;
  btnAlterar.Enabled := False;
  btnExcluir.Enabled := False;
  btnAtualizar.Enabled := False;
end;

procedure TfrmManQuilo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmManQuilo.btnBuscaClick(Sender: TObject);
var
  data: TDateTime;
  dias, i, mes, ano: integer;

begin
  try
    sqlData.Close;
    ano := StrToInt(Copy(edtMesAno.Text, 4, 4));
    mes := StrToInt(Copy(edtMesAno.Text, 1, 2));
    sqlData.Params[0].AsInteger := aCodVeic[cboxVeic.ItemIndex];
    sqlData.Params[1].AsInteger := ano;
    sqlData.Params[2].AsInteger := mes;
    sqlData.Open;
    Panel2.Enabled := False;
    btnGravar.Visible := True;
    btnCancelar.Visible := True;
    gdQuilo.Visible := True;

    if mes in [1, 3, 5, 7, 8, 10, 12] then
      dias := 31
    else
      dias := 30;

    if mes = 2 then
    begin
      dias := 28;
      if ano mod 4 = 0 then
        dias := 29;
    end;

    gdQuilo.RowCount := dias+1;

    for i := 1 to dias do
    begin
      data := EncodeDate(ano, mes, i);
      gdQuilo.Cells[0, i] := DateToStr(data);
      if sqlData.FindKey([data]) then
      begin
        gdQuilo.Cells[1, i] := sqlDataINICIO.AsString;
        gdQuilo.Cells[2, i] := sqlDataFINAL.AsString;
        gdQuilo.Cells[3, i] := sqlDataVIAGEM.AsString;
      end
      else
      begin
        gdQuilo.Cells[1, i] := '';
        gdQuilo.Cells[2, i] := '';
        gdQuilo.Cells[3, i] := '';
      end;
    end;
    gdQuilo.SetFocus;
  except
  end;
end;

procedure TfrmManQuilo.btnGravarClick(Sender: TObject);
var
  data: TDateTime;
  i, erros: integer;
  achou: boolean;

begin
  dtMod.SQLCon.StartTransaction(dtMod.TransDesc);
  for i := 1 to gdQuilo.RowCount-1 do
  begin
    try
      data := StrToDate(gdQuilo.Cells[0, i]);
      achou := sqlData.FindKey([data]);
      if (not achou) and
         (gdQuilo.Cells[1, i] <> '') and
         (gdQuilo.Cells[2, i] <> '') then
      begin
        sqlData.Append;
        sqlDataCODIGOVEICULO.Value := aCodVeic[cboxVeic.ItemIndex];
        sqlDataDATA.Value := data;
        sqlDataINICIO.Value := StrToInt(gdQuilo.Cells[1, i]);
        sqlDataFINAL.Value := StrToInt(gdQuilo.Cells[2, i]);
        if gdQuilo.Cells[3, i] <> '' then
          sqlDataVIAGEM.Value := 'X';
        sqlData.Post;
      end
      else
      begin
        if achou and
           (gdQuilo.Cells[1, i] = '') and
           (gdQuilo.Cells[2, i] = '') then
        begin
          sqlData.Delete;
        end
        else
          if (gdQuilo.Cells[1, i] <> '') and
             (gdQuilo.Cells[2, i] <> '') then
          begin
            sqlData.Edit;
            sqlDataINICIO.Value := StrToInt(gdQuilo.Cells[1, i]);
            sqlDataFINAL.Value := StrToInt(gdQuilo.Cells[2, i]);
            if gdQuilo.Cells[3, i] <> '' then
              sqlDataVIAGEM.Value := 'X';
            sqlData.Post;
          end;
      end;
    except
    end;
  end;

  erros := sqlData.ApplyUpdates(-1);
  if erros = 0 then
  begin
    dtMod.SQLCon.Commit(dtMod.TransDesc);
    sqlData.Close;
  end;

  btnGravar.Visible := False;
  btnCancelar.Visible := False;
  gdQuilo.Visible := False;
  Panel2.Enabled := True;

end;

procedure TfrmManQuilo.btnCancelarClick(Sender: TObject);
begin
  sqlData.Close;
  btnGravar.Visible := False;
  btnCancelar.Visible := False;
  gdQuilo.Visible := False;
  Panel2.Enabled := True;
end;

procedure TfrmManQuilo.PageControl1Change(Sender: TObject);
begin
  if PageControl1.ActivePage = TabSheet2 then
  begin
    cBoxVeic.ItemIndex := -1;
    edtMesAno.Text := Copy(DateToStr(Date), 4, 7);
    btnGravar.Visible := False;
    btnCancelar.Visible := False;
    gdQuilo.Visible := False;
  end;
end;

procedure TfrmManQuilo.FormCreate(Sender: TObject);
begin
  PageControl1.ActivePage := TabSheet1;
  gdQuilo.Cells[0,0] := 'Data';
  gdQuilo.Cells[1,0] := 'Km Inicial';
  gdQuilo.Cells[2,0] := 'Km Final';
  gdQuilo.Cells[3,0] := 'Em Viagem';
end;

procedure TfrmManQuilo.FormShow(Sender: TObject);
var
  i: integer;

begin
  Cursor := crSQLWait;
  if not dtMod.sqlMarca.Active then
    dtMod.sqlMarca.Active := True;
  if not dtMod.sqlModelo.Active then
    dtMod.sqlModelo.Open;
  if not dtMod.sqlVeic.Active then
    dtMod.sqlVeic.Active := True;

  SetLength(aCodVeic, dtMod.sqlVeic.RecordCount);

  cboxVeic.Text := '';
  cboxVeic.Items.Clear;
  
  i := 0;
  dtMod.sqlVeic.First;
  while not dtMod.sqlVeic.Eof do
  begin
    aCodVeic[i] := dtMod.sqlVeicCODIGOVEICULO.AsInteger;
    cboxVeic.Items.Add(dtMod.sqlVeicDESCCOMPLETA.AsString);
    dtMod.sqlVeic.Next;
    inc(i);
  end;

  Cursor := crDefault;

end;

procedure TfrmManQuilo.btnExcluirClick(Sender: TObject);
begin
  if MessageDlg('Confirma exclusão?', mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
  begin
    sqlKm.Delete;
    sqlKm.ApplyUpdates(-1);
    btnAtualizar.Click;
  end;
end;

procedure TfrmManQuilo.btnAtualizarClick(Sender: TObject);
begin
  with dtMod do
  begin
    if SQLCon.InTransaction then
      SQLCon.Commit(TransDesc);
  end;
  sqlKm.Refresh;
end;

procedure TfrmManQuilo.PageControl1Changing(Sender: TObject;
  var AllowChange: Boolean);
begin
  AllowChange := not gdQuilo.Visible;
end;

procedure TfrmManQuilo.gdQuiloKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  try
  case key of
  4101: gdQuilo.Col := gdQuilo.Col + 1;
  4116: gdQuilo.Col := gdQuilo.Col + 1;
  4114: gdQuilo.Col := gdQuilo.Col - 1;
  end;
  except
  end;
end;

end.
