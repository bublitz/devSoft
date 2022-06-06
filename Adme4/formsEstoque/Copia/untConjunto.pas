unit untConjunto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBBBtn, NavBtn, DBCtrls, ExtCtrls, Grids, DBGrids,
  ComCtrls, Db, IBCustomDataSet, IBQuery, RXDBCtrl;

type
  TfrmConjunto = class(TForm)
    Panel2: TPanel;
    DBNav: TDBNavigator;
    BitBtn1: TBitBtn;
    qryPesq: TIBQuery;
    dsPesq: TDataSource;
    DBGrid2: TDBGrid;
    DBGrid3: TDBGrid;
    dsProd: TDataSource;
    qryProd: TIBQuery;
    dsConj: TDataSource;
    qryConj: TIBQuery;
    RxDBGrid1: TRxDBGrid;
    qryPesqCODIGOPRODUTO: TIntegerField;
    qryPesqDESCRICAO: TIBStringField;
    qryPesqCODIGOCOMPLETO: TIBStringField;
    qryPesqTEMCONJUNTO: TIBStringField;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    qryConjCODIGOCONJUNTO: TIntegerField;
    qryConjDescricao: TStringField;
    qryProdCODIGOPRODUTO: TIntegerField;
    qryProdDescricao: TStringField;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    Label1: TLabel;
    EditPesq: TEdit;
    Button1: TButton;
    qryExcConj: TIBQuery;
    dsExcluiConj: TDataSource;
    Button2: TButton;
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure qryConjCalcFields(DataSet: TDataSet);
    procedure SpeedButton1Click(Sender: TObject);
    procedure EditPesqChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConjunto: TfrmConjunto;

implementation

uses untDtModConf, untDtModEst;

{$R *.DFM}

procedure TfrmConjunto.RxDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);

var
  temConj: boolean;

begin
  temConj := ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TemConjunto').AsString='S');
  if temConj then
  begin
    //AFont.Color := clWhite;
    //Background := clRed;
  end
  else
  begin
    //AFont.Color := clBlack;
    //Background := clWhite;
  end;
end;

procedure TfrmConjunto.qryConjCalcFields(DataSet: TDataSet);
begin
  qryConjDescricao.Value := 'Conjunto ' + IntToStr(qryConjCODIGOCONJUNTO.Value);
end;

procedure TfrmConjunto.SpeedButton1Click(Sender: TObject);
var
  codi: integer;

begin
  if qryProd.Locate('CODIGOPRODUTO', qryPesqCODIGOPRODUTO.Value, []) then
    raise exception.create( 'Este produto já faz parte deste conjunto !!' )
  else
  begin
    codi := qryConjCODIGOCONJUNTO.Value;
    with dmEst do
    begin
      tbProduto.Locate('CODIGOPRODUTO', qryPesqCODIGOPRODUTO.Value, []);
      tbProduto.Edit;
      tbProdutoTEMCONJUNTO.Value := 'S';
      tbProduto.Post;
      tbConjunto.Append;
      tbConjuntoCODIGOCONJUNTO.Value := codi;
      tbConjuntoCODIGOPRODUTO.Value := qryPesqCODIGOPRODUTO.Value;
      try
        tbConjunto.Post;
        qryProd.Close;
        qryProd.Prepare;
        qryProd.Open;
        qryPesq.Close;
        qryPesq.Prepare;
        qryPesq.Open;
      except
        tbConjunto.Cancel;
      end;
    end;
  end;
end;

procedure TfrmConjunto.EditPesqChange(Sender: TObject);
begin
  qryPesq.Locate('Descricao', EditPesq.Text, [loCaseInsensitive, loPartialkey]);
end;

procedure TfrmConjunto.Button1Click(Sender: TObject);
var
  codi, codp: integer;

begin
  codp := qryPesqCODIGOPRODUTO.AsInteger;
  dmEst.tbProduto.Locate('CODIGOPRODUTO', codp, []);
  dmEst.tbProduto.Edit;
  dmEst.tbProdutoTEMCONJUNTO.Value := 'S';
  dmEst.tbProduto.Post;
  dmEst.tbConjunto.Last;
  codi := dmEst.tbConjuntoCODIGOCONJUNTO.Value + 1;
  dmEst.tbConjunto.Append;
  dmEst.tbConjuntoCODIGOCONJUNTO.Value := codi;
  dmEst.tbConjuntoCODIGOPRODUTO.Value := qryPesqCODIGOPRODUTO.Value;
  dmEst.tbConjunto.Post;
  qryPesq.Close;
  qryPesq.Prepare;
  qryPesq.Open;
  qryPesq.Locate('CODIGOPRODUTO', codp, []);
  qryConj.Close;
  qryConj.Prepare;
  qryConj.Open;
  qryConj.Last;
end;

procedure TfrmConjunto.Button2Click(Sender: TObject);
var
  codigos: variant;
  i, q, cod: integer;

begin
  i := qryProd.RecordCount;
  codigos := VarArrayCreate([1,i], varInteger);
  qryProd.First;
  while not qryProd.Eof do
  begin
    codigos[qryProd.RecNo] := qryProdCODIGOPRODUTO.Value;
    qryProd.Next;
  end;

  {cod := qryConjCODIGOCONJUNTO.Value;
  with dmEst.tbConjunto do
  begin
    First;
    while not Eof do
    begin
      if dmEst.tbConjuntoCODIGOCONJUNTO.Value = cod then
        Delete;
      Next;
    end;
    ApplyUpdates;
  end; }

  with qryExcConj do
  begin
    ParamByName('CODCONJ').AsInteger := qryConjCODIGOCONJUNTO.Value;
    Prepare;
    ExecSQL;
  end;

  for q := 1 to i do
  begin
    cod := codigos[q];
    if not dmEst.tbConjunto.Locate('CODIGOPRODUTO', cod, []) then
      if dmEst.tbProduto.Locate('CODIGOPRODUTO', cod, []) then
      begin
        dmEst.tbProduto.Edit;
        dmEst.tbProdutoTEMCONJUNTO.Value := 'N';
        dmEst.tbProduto.Post;
      end;
  end;
  qryConj.Close;
  qryConj.Prepare;
  qryConj.Open;
  //dmConf.dtBase.ApplyUpdates(
end;

procedure TfrmConjunto.SpeedButton2Click(Sender: TObject);
var
  codc, codp: integer;
begin
  codc := qryConjCODIGOCONJUNTO.AsInteger;
  codp := qryProdCODIGOPRODUTO.AsInteger;

  if dmEst.tbConjunto.Locate('CODIGOCONJUNTO;CODIGOPRODUTO',VarArrayOf([codc,codp]),[]) then
    dmEst.tbCOnjunto.Delete;

  qryPesq.Close;
  qryPesq.Prepare;
  qryPesq.Open;
  qryPesq.Locate('CODIGOPRODUTO', codp, []);
  qryProd.Close;
  qryProd.Prepare;
  qryProd.Open;
  qryConj.Close;
  qryCOnj.Prepare;
  qryConj.Open;
  qryConj.Locate('CODIGOCONJUNTO', codc, []);
end;

end.
