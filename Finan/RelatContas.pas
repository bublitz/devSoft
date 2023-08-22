unit RelatContas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ToolEdit, DBCtrls, Buttons, ExtCtrls, Grids, DBGrids;

type
  TFrmRelContas = class(TForm)
    GBox: TGroupBox;
    RBAllFornec: TRadioButton;
    RBEspFornec: TRadioButton;
    CBoxFornec: TDBLookupComboBox;
    GBoxVencto: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    EdtData1: TDateEdit;
    EdtData2: TDateEdit;
    GBoxGrupo: TGroupBox;
    RBAllGrupo: TRadioButton;
    RBEspGrupo: TRadioButton;
    CBoxGrupo: TDBLookupComboBox;
    RGrpConta: TRadioGroup;
    SBtnVisu: TSpeedButton;
    SBtnImp: TSpeedButton;
    SBtnExp: TSpeedButton;
    RGrpAgrup: TRadioGroup;
    SaveDlg: TSaveDialog;
    SBtnFechar: TSpeedButton;
    procedure GeraSql(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RBAllGrupoClick(Sender: TObject);
    procedure RBEspGrupoClick(Sender: TObject);
    procedure RBAllFornecClick(Sender: TObject);
    procedure RBEspFornecClick(Sender: TObject);
    procedure SBtnVisuClick(Sender: TObject);
    procedure SBtnImpClick(Sender: TObject);
    procedure SBtnExpClick(Sender: TObject);
    procedure SBtnFecharClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Tabela, campos: string;
  end;

var
  FrmRelContas: TFrmRelContas;

implementation

{$R *.DFM}

uses DataMod, ReportContas, Funcoes, Main;

procedure TFrmRelContas.GeraSql(Sender: TObject);
var
  i: integer;

begin
   DatMod.QryRelat.SQL.Clear;
   if Tabela = 'Pagar' then begin
      frmRepContas.QRLabel5.Caption := 'Fornecedor';
      DatMod.QryRelat.SQL.Add('select p.numero, d.nome, g.descricao as nomegrupo,');
      DatMod.QryRelat.SQL.Add('   p.vencimento, p.valor, p.pagamento,');
      DatMod.QryRelat.SQL.Add('   p."Valor Pago" as valorpago');
      DatMod.QryRelat.SQL.Add('from pagar p, fornecedores d, grupos g');
      DatMod.QryRelat.SQL.Add('where p.fornecedor = d.codigo');
      campos := 'Numero;Fornecedor;Grupo;DataVencimento;Valor;DataPagamento;ValorPago';
   end
   else begin // receber
      frmRepContas.QRLabel5.Caption := 'Cliente';
      DatMod.QryRelat.SQL.Add('select p.numero, d.nome, g.descricao as nomegrupo,');
      DatMod.QryRelat.SQL.Add('   p.vencimento, p.valor, p.pagamento,');
      DatMod.QryRelat.SQL.Add('   p."Valor Pago" as valorpago');
      DatMod.QryRelat.SQL.Add('from receber p, clientes d, grupos g');
      DatMod.QryRelat.SQL.Add('where p.cliente = d.codigo');
      campos := 'Numero;Cliente;Grupo;DataVencimento;Valor;DataPagamento;ValorPago';
   end;

   DatMod.QryRelat.SQL.Add('  and p.grupo = g.codigo');

   i := 0;
   if EdtData1.Date > 0 then begin
      DatMod.QryRelat.SQL.Add('  and p.vencimento >= :DataI' );
      DatMod.QryRelat.Params[i].AsDate := EdtData1.Date;
      Inc( i );
   end;

   if EdtData2.Date > 0 then begin
      DatMod.QryRelat.SQL.Add('  and p.vencimento <= :DataF' );
      DatMod.QryRelat.Params[i].AsDate := EdtData2.Date;
      Inc( i );
   end;

   if RBEspGrupo.Checked then begin
      DatMod.QryRelat.SQL.Add('  and g.descricao = :NomeGrupo' );
      DatMod.QryRelat.Params[i].asString := CBoxGrupo.Text;
      Inc( i );
   end;

   if RBEspFornec.Checked then begin
      DatMod.QryRelat.SQL.Add('  and d.nome = :NomePor' );
      DatMod.QryRelat.Params[i].asString := CBoxFornec.Text;
      Inc( i );
   end;

   if RGrpConta.ItemIndex = 1 then // Pagas
      DatMod.QryRelat.SQL.Add('  and p."Valor Pago" > 0' )
   else if RGrpConta.ItemIndex = 2 then // Não Pagas
      DatMod.QryRelat.SQL.Add('  and ( p."Valor Pago" = 0 or p."Valor Pago" is null )' );

   if RGrpAgrup.ItemIndex = 0 then begin
      DatMod.QryRelat.SQL.Add('order by vencimento, nomegrupo, nome');
      frmRepContas.QRGroup1.Expression := 'QryRelat.vencimento';
   end
   else
   if RGrpAgrup.ItemIndex = 1 then begin
      DatMod.QryRelat.SQL.Add('order by nome, vencimento, nomegrupo');
      frmRepContas.QRGroup1.Expression := 'QryRelat.nome';
   end
   else begin
      DatMod.QryRelat.SQL.Add('order by nomegrupo, vencimento, nome');
      frmRepContas.QRGroup1.Expression := 'QryRelat.grupo';
   end;

   //Datmod.QryRelat.SQL.SaveToFile('teste.sql');

   DatMod.QryRelat.Open;

end;

procedure TFrmRelContas.FormShow(Sender: TObject);
begin
  if Tabela = 'Pagar' then begin
     Caption := 'Contas a Pagar';
     GBox.Caption := 'Fornecedor:';
     CBoxFornec.ListSource := DatMod.DatFornec;
  end
  else begin
     Caption := 'Contas a Receber';
     GBox.Caption := 'Cliente:';
     CBoxFornec.ListSource := DatMod.DatCliente;
  end;
  RGrpConta.ItemIndex := 0;
  RBAllGrupo.Checked := True;
  RBAllFornec.Checked := True;
  CBoxGrupo.Visible := False;
  CBoxFornec.Visible := False;
  SBtnExp.Enabled := not FrmMain.Demo;
end;

procedure TFrmRelContas.RBAllGrupoClick(Sender: TObject);
begin
    CBoxGrupo.Visible := not RBAllGrupo.Checked;
end;

procedure TFrmRelContas.RBEspGrupoClick(Sender: TObject);
begin
    CBoxGrupo.Visible := RBEspGrupo.Checked;
end;

procedure TFrmRelContas.RBAllFornecClick(Sender: TObject);
begin
    CBoxFornec.Visible := not RBAllFornec.Checked;
end;

procedure TFrmRelContas.RBEspFornecClick(Sender: TObject);
begin
    CBoxFornec.Visible := RBEspFornec.Checked;
end;

procedure TFrmRelContas.SBtnVisuClick(Sender: TObject);
begin
   GeraSql( Sender );
   frmRepContas.QRep.Preview;
end;

procedure TFrmRelContas.SBtnImpClick(Sender: TObject);
begin
   GeraSql( Sender );
   frmRepContas.QRep.Prepare;
   frmRepContas.QRep.PrinterSetup;
   frmRepContas.QRep.PrintBackground;
end;

procedure TFrmRelContas.SBtnExpClick(Sender: TObject);
begin
   if SaveDlg.Execute then begin
      GeraSql( Sender );
      Exporta( DatMod.QryRelat, SaveDlg.FileName, campos );
      ShowMessage( 'Dados exportados!!');
   end;
end;

procedure TFrmRelContas.SBtnFecharClick(Sender: TObject);
begin
   Close;
end;

end.

