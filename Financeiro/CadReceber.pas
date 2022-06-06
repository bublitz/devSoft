unit CadReceber;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  RXLookup, StdCtrls, Buttons, DBCtrls, Mask, ExtCtrls, DB, ToolEdit,
  RXDBCtrl;

type
  TFrmCtasReceb = class(TForm)
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
    DBTxtNumero: TDBText;
    SpBtnPesq: TSpeedButton;
    PanelBtns: TPanel;
    SpBtnIncluir: TSpeedButton;
    SpBtnAlterar: TSpeedButton;
    SpBtnExcluir: TSpeedButton;
    SpBtnSalvar: TSpeedButton;
    SpBtnCancelar: TSpeedButton;
    SpBtnBaixar: TSpeedButton;
    SpBtnFechar: TSpeedButton;
    DBNav: TDBNavigator;
    EditValor: TDBEdit;
    EditMulta: TDBEdit;
    EditJuros: TDBEdit;
    DBCBoxCliente: TDBLookupComboBox;
    DBCBoxGrupo: TDBLookupComboBox;
    DBCBoxSituacao: TDBLookupComboBox;
    DBComboTipoMulta: TDBComboBox;
    DBComboTipoJuros: TDBComboBox;
    GBoxBaixa: TGroupBox;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    EditCheque: TDBEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    RBtnDin: TRadioButton;
    RBtnChe: TRadioButton;
    EdtNCheq: TEdit;
    EdtNBanco: TEdit;
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
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCtasReceb: TFrmCtasReceb;

implementation

{$R *.DFM}

uses DataMod, Funcoes, PesqCtas;

procedure TFrmCtasReceb.SpBtnFecharClick(Sender: TObject);
begin
   close;
end;

procedure TFrmCtasReceb.SwapButtons( Sender: TObject );
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
   DBCBoxCliente.Enabled := not DBCBoxCliente.Enabled;
   DBCBoxGrupo.Enabled := not DBCBoxGrupo.Enabled;
   DBCBoxSituacao.Enabled := not DBCBoxSituacao.Enabled;
   DBComboTipoMulta.Enabled := not DBComboTipoMulta.Enabled;
   DBComboTipoJuros.Enabled := not DBComboTipoJuros.Enabled;
end;

procedure TFrmCtasReceb.SpBtnIncluirClick(Sender: TObject);
begin
   if Inclui( DatMod.TabReceb ) then begin
      SwapButtons( Sender );
      DBCBoxCliente.SetFocus;
   end;
end;

procedure TFrmCtasReceb.SpBtnAlterarClick(Sender: TObject);
begin
   if DatMod.TabRecebValorPago.Value = 0.00 then begin
      SwapButtons( Sender );
      DatMod.TabReceb.Edit;
      DBCBoxCliente.SetFocus;
   end else
      ShowMessage( 'Não é possível alterar uma'#13'Conta já baixada !!' );
end;

procedure TFrmCtasReceb.SpBtnExcluirClick(Sender: TObject);
begin
   Exclui( DatMod.TabReceb );
end;

procedure TFrmCtasReceb.SpBtnSalvarClick(Sender: TObject);
var ok: boolean;
begin
   ok := False;

   if DBCBoxCliente.Text = '' then begin
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
      DatMod.TabRecebValorPago.Value := 0.00;
      if DatMod.TabReceb.State in [ dsInsert, dsEdit ] then
         DatMod.TabReceb.Post;
   end;
end;

procedure TFrmCtasReceb.SpBtnCancelarClick(Sender: TObject);
begin
   SwapButtons( Sender );
   if DatMod.TabReceb.State in [ dsInsert, dsEdit ] then
      DatMod.TabReceb.Cancel;
end;

procedure TFrmCtasReceb.SpBtnPesqClick(Sender: TObject);
var
   numero: longint;
begin
   FrmPesq.Caption := 'Pesquisa Contas a Receber';
   FrmPesq.NomeTabela := 'Receb';
   if FrmPesq.ShowModal = mrOk then begin
      numero := DatMod.RxQryPesq.FieldByName( 'Numero' ).asInteger;
      DatMod.TabReceb.FindKey( [numero] );
   end;

end;

procedure TFrmCtasReceb.SpBtnBaixarClick(Sender: TObject);
begin
   if DatMod.TabRecebValorPago.Value = 0.00 then begin
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
      EdtNBanco.Enabled := True;
      DatMod.TabReceb.Edit;
      DatMod.TabRecebPagamento.Value := Date;
      DatMod.TabRecebValorPago.Value := DatMod.TabRecebValor.Value;
      EditPagamento.SetFocus;
   end else
      ShowMessage( 'Conta já baixada !!' );
end;

procedure TFrmCtasReceb.BitBtn2Click(Sender: TObject);
begin
   if DatMod.TabReceb.State in [ dsInsert, dsEdit ] then
      DatMod.TabReceb.Cancel;

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
   EdtNBanco.Enabled := False;
end;

procedure TFrmCtasReceb.BitBtn1Click(Sender: TObject);
var
   ok: boolean;

begin
   ok := true;
   if RBtnChe.Checked then
      if ( EdtNBanco.Text = '' ) or ( EdtNCheq.Text = '' ) then begin
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
      EdtNBanco.Enabled := False;

      if RBtnChe.Checked then
         DatMod.TabRecebCheque.Value := GeraChequeRecebido( DatMod.TabRecebido ,
                         EdtNCheq.Text, EdtNBanco.Text,
                         DatMod.TabRecebPagamento.Value,
                         DatMod.TabRecebValorPago.Value,
                         DatMod.TabRecebCliente.Value );

      if DatMod.TabReceb.State in [ dsInsert, dsEdit ] then
         DatMod.TabReceb.Post;
      ShowMessage( 'Conta Baixada !!' );
      EdtNCheq.Text := '';
      EdtNBanco.Text := '';
   end;
end;

procedure TFrmCtasReceb.RBtnDinClick(Sender: TObject);
begin
   if RBtnDin.Checked then begin
      EdtNCheq.Visible := False;
      EdtNBanco.Visible := False;
   end;
end;

procedure TFrmCtasReceb.RBtnCheClick(Sender: TObject);
begin
   if RBtnChe.Checked then begin
      EdtNCheq.Visible := True;
      EdtNBanco.Visible := True;
      EdtNCheq.SetFocus;
   end;
end;

end.
