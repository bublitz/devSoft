unit CadPagar;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, Forms, DBCtrls, DB, Mask, ExtCtrls, Buttons, Dialogs, RXLookup,
  ToolEdit, RXDBCtrl;

type
  TFrmCtasPagar = class(TForm)
    DBNav: TDBNavigator;
    PanelBtns: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    EditValor: TDBEdit;
    EditMulta: TDBEdit;
    EditJuros: TDBEdit;
    DBTxtNumero: TDBText;
    DBCBoxFornecedor: TDBLookupComboBox;
    DBCBoxGrupo: TDBLookupComboBox;
    DBCBoxSituacao: TDBLookupComboBox;
    DBComboTipoMulta: TDBComboBox;
    DBComboTipoJuros: TDBComboBox;
    SpBtnIncluir: TSpeedButton;
    SpBtnAlterar: TSpeedButton;
    SpBtnExcluir: TSpeedButton;
    SpBtnSalvar: TSpeedButton;
    SpBtnCancelar: TSpeedButton;
    SpBtnPesq: TSpeedButton;
    GBoxBaixa: TGroupBox;
    Label12: TLabel;
    Label13: TLabel;
    EditCheque: TDBEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    SpBtnBaixar: TSpeedButton;
    RBtnDin: TRadioButton;
    RBtnChe: TRadioButton;
    SpBtnFechar: TSpeedButton;
    Label14: TLabel;
    EdtNCheq: TEdit;
    RxCBoxBanco: TRxDBLookupCombo;
    EditEmissao: TDBDateEdit;
    EditVencimento: TDBDateEdit;
    EditPagamento: TDBDateEdit;
    procedure SwapButtons( Sender: TObject );
    procedure SpBtnFecharClick(Sender: TObject);
    procedure SpBtnIncluirClick(Sender: TObject);
    procedure SpBtnAlterarClick(Sender: TObject);
    procedure SpBtnExcluirClick(Sender: TObject);
    procedure SpBtnSalvarClick(Sender: TObject);
    procedure SpBtnCancelarClick(Sender: TObject);
    procedure SpBtnPesqClick(Sender: TObject);
    procedure SpBtnBaixarClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure RBtnDinClick(Sender: TObject);
    procedure RBtnCheClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  FrmCtasPagar: TFrmCtasPagar;

implementation

{$R *.DFM}

uses DataMod, Funcoes, PesqCtas;

procedure TFrmCtasPagar.SpBtnFecharClick(Sender: TObject);
begin
   close;
end;

procedure TFrmCtasPagar.SwapButtons( Sender: TObject );
begin
   DBNav.Enabled := not DBNav.Enabled;
   SpBtnIncluir.Enabled := not SpBtnIncluir.Enabled;
   SpBtnAlterar.Enabled := not SpBtnAlterar.Enabled;
   SpBtnExcluir.Enabled := not SpBtnExcluir.Enabled;
   SpBtnCancelar.Enabled := not SpBtnCancelar.Enabled;
   SpBtnSalvar.Enabled := not SpBtnSalvar.Enabled;
   SpBtnFechar.Enabled := not SpBtnFechar.Enabled;
   SpBtnPesq.Enabled := not SpBtnPesq.Enabled;
   EditEmissao.Enabled := not EditEmissao.Enabled;
   EditVencimento.Enabled := not EditVencimento.Enabled;
   EditValor.Enabled := not EditValor.Enabled;
   EditMulta.Enabled := not EditMulta.Enabled;
   EditJuros.Enabled := not EditJuros.Enabled;
   DBCBoxFornecedor.Enabled := not DBCBoxFornecedor.Enabled;
   DBCBoxGrupo.Enabled := not DBCBoxGrupo.Enabled;
   DBCBoxSituacao.Enabled := not DBCBoxSituacao.Enabled;
   DBComboTipoMulta.Enabled := not DBComboTipoMulta.Enabled;
   DBComboTipoJuros.Enabled := not DBComboTipoJuros.Enabled;
end;

procedure TFrmCtasPagar.SpBtnIncluirClick(Sender: TObject);
begin
   if Inclui( DatMod.TabPagar ) then begin
      SwapButtons( Sender );
      DBCBoxFornecedor.SetFocus;
   end;
end;

procedure TFrmCtasPagar.SpBtnAlterarClick(Sender: TObject);
begin
   if DatMod.TabPagarValorPago.Value = 0.00 then begin
      SwapButtons( Sender );
      DatMod.TabPagar.Edit;
      DBCBoxFornecedor.SetFocus;
   end else
      ShowMessage( 'Não é possível alterar uma'#13'Conta já baixada !!' );
end;

procedure TFrmCtasPagar.SpBtnExcluirClick(Sender: TObject);
begin
   Exclui( DatMod.TabPagar );
end;

procedure TFrmCtasPagar.SpBtnSalvarClick(Sender: TObject);
var ok: boolean;
begin
   ok := True;

   if DBCBoxFornecedor.Text = '' then begin
      ShowMessage( 'Fornecedor deve ser informado !!' );
      ok := False;
   end;
   if DBCBoxGrupo.Text = '' then begin
      ShowMessage( 'Grupo deve ser informado !!' );
      ok := False;
   end;
   if DBCBoxSituacao.Text = '' then begin
      ShowMessage( 'Situação deve ser informada !!' );
      ok := False;
   end;

   if ok then begin
      SwapButtons( Sender );
      DatMod.TabPagarValorPago.Value := 0.00;
      if DatMod.TabPagar.State in [ dsInsert, dsEdit ] then
         DatMod.TabPagar.Post;
   end;
end;

procedure TFrmCtasPagar.SpBtnCancelarClick(Sender: TObject);
begin
   SwapButtons( Sender );
   if DatMod.TabPagar.State in [ dsInsert, dsEdit ] then
      DatMod.TabPagar.Cancel;
end;

procedure TFrmCtasPagar.SpBtnPesqClick(Sender: TObject);
var
   numero: longint;
begin
   FrmPesq.Caption := 'Pesquisa Contas a Pagar';
   FrmPesq.NomeTabela := 'Pagar';
   if FrmPesq.ShowModal = mrOk then begin
      numero := DatMod.RxQryPesq.FieldByName( 'Numero' ).asInteger;
      DatMod.TabPagar.FindKey( [numero] );
   end;

end;

procedure TFrmCtasPagar.SpBtnBaixarClick(Sender: TObject);
begin
   if DatMod.TabPagarValorPago.Value = 0.00 then begin
      EditPagamento.Enabled := True;
      EditCheque.Enabled := True;
      RBtnDin.Enabled := True;
      RBtnDin.Checked := True;
      RBtnChe.Enabled := True;
      BitBtn1.Enabled := True;
      BitBtn2.Enabled := True;
      SpBtnBaixar.Enabled := False;
      DBNav.Enabled := False;
      EdtNCheq.Enabled := True;
      RxCBoxBanco.Enabled := True;
      DatMod.TabPagar.Edit;
      DatMod.TabPagarPagamento.Value := Date;
      DatMod.TabPagarValorPago.Value := DatMod.TabPagarValor.Value;
      EditPagamento.SetFocus;
   end else
      ShowMessage( 'Conta já baixada !!' );
end;

procedure TFrmCtasPagar.BitBtn2Click(Sender: TObject);
begin
   if DatMod.TabPagar.State in [ dsInsert, dsEdit ] then
      DatMod.TabPagar.Cancel;

   EditPagamento.Enabled := False;
   EditCheque.Enabled := False;
   RBtnDin.Enabled := False;
   RBtnDin.Checked := False;
   RBtnChe.Enabled := False;
   BitBtn1.Enabled := False;
   BitBtn2.Enabled := False;
   SpBtnBaixar.Enabled := True;
   DBNav.Enabled := True;
   EdtNCheq.Enabled := False;
   RxCBoxBanco.Enabled := False;
end;

procedure TFrmCtasPagar.BitBtn1Click(Sender: TObject);
var
   codbanco: longint;
   ok: boolean;

begin
   codbanco := StrToInt( RxCBoxBanco.Value );
   ok := true;
   if RBtnChe.Checked then
      if ( RxCBoxBanco.Text = '' ) or ( EdtNCheq.Text = '' ) then begin
         ShowMessage( 'Deve ser preenchido o Nº do Cheque'#13'e o Banco !!');
         ok := false;
      end;
   if ok then begin
      EditPagamento.Enabled := False;
      EditCheque.Enabled := False;
      RBtnDin.Enabled := False;
      RBtnDin.Checked := False;
      RBtnChe.Enabled := False;
      BitBtn1.Enabled := False;
      BitBtn2.Enabled := False;
      SpBtnBaixar.Enabled := True;
      DBNav.Enabled := True;
      EdtNCheq.Enabled := False;
      RxCBoxBanco.Enabled := False;

      if RBtnChe.Checked then
         DatMod.TabPagarCheque.Value := GeraChequeEmitido( DatMod.TabEmitido,
                         EdtNCheq.Text, codbanco,
                         DatMod.TabPagarPagamento.Value,
                         DatMod.TabPagarValorPago.Value,
                         DatMod.TabPagarFornecedor.Value );

      if DatMod.TabPagar.State in [ dsInsert, dsEdit ] then
         DatMod.TabPagar.Post;
      ShowMessage( 'Conta Baixada !!' );
      EdtNCheq.Text := '';
      RxCBoxBanco.ClearValue;
   end;
end;

procedure TFrmCtasPagar.RBtnDinClick(Sender: TObject);
begin
   if RBtnDin.Checked then begin
      EdtNCheq.Visible := False;
      RxCBoxBanco.Visible := False;
   end;
end;

procedure TFrmCtasPagar.RBtnCheClick(Sender: TObject);
begin
   if RBtnChe.Checked then begin
      EdtNCheq.Visible := True;
      RxCBoxBanco.Visible := True;
      EdtNCheq.SetFocus;
   end;
end;

end.