unit PesqCtas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, Db, DBTables, RxQuery, Grids, DBGrids, RXDBCtrl, DbPrgrss,
  DBCtrls, StdCtrls, Buttons, Mask, ToolEdit;

type
  TFrmPesq = class(TForm)
    RxDBGrid1: TRxDBGrid;
    Label1: TLabel;
    GBox: TGroupBox;
    RdBtnTodos: TRadioButton;
    RdBtnEsp: TRadioButton;
    DBLCBoxNome: TDBLookupComboBox;
    SpBtnProcurar: TSpeedButton;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    EdtData1: TDateEdit;
    EdtData2: TDateEdit;
    Label2: TLabel;
    Label3: TLabel;
    procedure RdBtnTodosClick(Sender: TObject);
    procedure RdBtnEspClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpBtnProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    NomeTabela: string;
  end;

var
  FrmPesq: TFrmPesq;

implementation

{$R *.DFM}

uses DataMod;

procedure TFrmPesq.RdBtnTodosClick(Sender: TObject);
begin
    DBLCBoxNome.Visible := not RdBtnTodos.Checked;
end;

procedure TFrmPesq.RdBtnEspClick(Sender: TObject);
begin
    DBLCBoxNome.Visible := RdBtnEsp.Checked;
end;

procedure TFrmPesq.FormShow(Sender: TObject);
begin
   EdtData1.Text := '';
   EdtData2.Text := '';
   RDBtnTodos.Checked := True;
   DBLCBoxNome.Visible := False;

   if NomeTabela = 'Pagar' then begin
      GBox.Caption := 'Fornecedor';
      DBLCBoxNome.ListSource := DatMod.DatFornec;
   end
   else begin
      GBox.Caption := 'Cliente';
      DBLCBoxNome.ListSource := DatMod.DatCliente;
   end;
end;

procedure TFrmPesq.SpBtnProcurarClick(Sender: TObject);
var
   i: integer;

begin
   DatMod.RxQryPesq.SQL.Clear;
   if NomeTabela = 'Pagar' then begin
      DatMod.RxQryPesq.SQL.Add('select C.Numero, Q.Nome as Fornecedor, C.Vencimento,');
      DatMod.RxQryPesq.SQL.Add('   C.Valor');
      DatMod.RxQryPesq.SQL.Add('from Pagar C, Fornecedores Q');
      DatMod.RxQryPesq.SQL.Add('where C.Fornecedor = Q.Codigo');
   end
   else begin
      DatMod.RxQryPesq.SQL.Add('select C.Numero, Q.Nome as Cliente, C.Vencimento,');
      DatMod.RxQryPesq.SQL.Add('   C.Valor');
      DatMod.RxQryPesq.SQL.Add('from Receber C, Clientes Q');
      DatMod.RxQryPesq.SQL.Add('where C.Cliente = Q.Codigo');
   end;
   DatMod.RxQryPesq.SQL.Add('  and ( C."Valor Pago" = 0 or C."Valor Pago" is null )');

   if ( RdBtnEsp.Checked ) and ( DBLCBoxNome.Text <> '' ) then
      DatMod.RxQryPesq.SQL.Add('  and Q.Nome = "' + DBLCBoxNome.Text + '"' );

   i := 0;
   if EdtData1.Date > 0 then begin
      DatMod.RxQryPesq.SQL.Add('  and C.Vencimento >= :DataI' );
      DatMod.RxQryPesq.Params[i].AsDate := EdtData1.Date;
      Inc( i );
   end;

   if EdtData2.Date > 0 then begin
      DatMod.RxQryPesq.SQL.Add('  and C.Vencimento <= :DataF ' );
      DatMod.RxQryPesq.Params[i].AsDate := EdtData2.Date;
   end;

   DatMod.RxQryPesq.Open;

end;

{
select C.Numero, Q.Nome as Fornecedor, C.Vencimento,
   S.Descricao as Situacao, C.Valor
from Pagar C, Fornecedores Q, Situacao S
where C.Fornecedor = Q.Codigo
  and C.Situacao = S.Codigo


DataModul.Query1.SQL.Add('WHERE (D1.Codigo = D.Filial)and(d2.Codigo = D.Grupo)
and(D.DATA>=:Datai)and(D.DATA<=:Dataf)and(d1.filial = "'+combobox1.text+'")and(d2.Grupo = "'+combobox2.text+'")');
DataModul.Query1.Params[0].ASDAte:=STRTODATE(Edit1.Text);
DataModul.Query1.Params[1].ASDAte:=STRTODATE(Edit2.Text);


  }

end.
