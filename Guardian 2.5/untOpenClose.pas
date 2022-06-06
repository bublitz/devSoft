unit untOpenClose;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, StdCtrls, ExtCtrls, Mask, RxDBComb, Buttons, DBBBtn, NavBtn,
  ToolEdit, CurrEdit,db;

type
  TfrmOpenClose = class(TForm)
    Label1: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    lblMens: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmOpenClose: TfrmOpenClose;
  ValorTotal:Real;
  controle: integer;
  liberado: boolean;

implementation

uses untDtMod, untMain;

{$R *.DFM}


procedure TfrmOpenClose.FormShow(Sender: TObject);
begin
  {
   **************************************
   ***  F  E  C  H  A  M  E  N  T  O  ***
   **************************************
  }
  if Label5.Visible then
  begin
    dtMod.tbOpenClose.Last;
    ValorTotal := dtMod.tbOpenCloseSALDOABERTURA.Value ;
    ValorTotal := ValorTotal + dtMod.tbEmpresaLANCTO.Value;
    controle := dtMod.tbOpenCloseCONTROLECAIXA.Value;
    dtMod.qrCxAtual.Close;
    dtMod.qrCxAtual.ParamByName('num_control').Value := controle;
    dtMod.qrCxAtual.Open;
    while not dtMod.qrCxAtual.Eof do
    begin
      ValorTotal := ValorTotal + dtMod.qrCxAtualENTRADA.Value - dtMod.qrCxAtualSAIDA.Value;
      dtMod.qrCxAtual.Next;
    end;
    dtMod.qrCalFechado.Close;
    dtMod.qrCalFechado.Open;
    dtMod.qrCalFechado.First;
    while not dtMod.qrCalFechado.Eof do
    begin
      ValorTotal := ValorTotal + dtMod.qrCalFechadoVALORTOTAL.Value;
      dtMod.qrCalFechado.Next;
    end;
    Label5.Caption := FloattoStrF(ValorTotal, ffCurrency, 15, 2);
  end
  else
  {
   A B E R T U R A
  }
  begin
    dtMod.tbOpenClose.Last;
    CurrencyEdit1.Value := dtMod.tbOpenCloseSALDOFECHAMENTO.Value;
  end;
end;

procedure TfrmOpenClose.BitBtn1Click(Sender: TObject);
begin
  {
   A B E R T U R A
  }
  if Label3.Visible = True then
  begin
    dtMod.tbOpenClose.Append;
    dtMod.tbOpenCloseDHABERTURA.Value := Now;
    dtMod.tbOpenCloseMatricula.Value := frmMain.Matricula;
    dtMod.tbOpenCloseSALDOABERTURA.Value := CurrencyEdit1.Value;
    dtMod.tbOpenClose.Post;
    controle := dtMod.tbOpenCloseCONTROLECAIXA.Value;
    dtMod.tbCaixa.Append;
    dtMod.tbCaixaCONTROLECAIXA.Value := controle;
    dtMod.tbCaixaDATAMOVIMENTO.Value := dtMod.tbOpenCloseDHABERTURA.Value;
    dtMod.tbCaixaSALDO.Value := CurrencyEdit1.Value;
    dtMod.tbCaixaDESCRICAO.Value := 'ABERTURA DO CAIXA';
    dtMod.tbCaixaMATRICULA.Value := frmMain.Matricula;
    dtMod.tbCaixaTIPOLANCTO.Value := 'A';
    dtMod.tbCaixa.Post;
    dtMod.Acao('Abriu Caixa');
  end
  else
  {
   F E C H A M E N T O
  }
  begin
    dtMod.tbOpenClose.Last;
    controle := dtMod.tbOpenCloseCONTROLECAIXA.Value;
    dtMod.qrCalFechado.First;
    lblMens.Caption := 'Aguarde... Fechando micros...';
    Refresh;
    dtMod.tbCaixa.Append;
    dtMod.tbCaixaDESCRICAO.Value := 'LANÇAMENTOS DO ESTOQUE';
    dtMod.tbCaixaTIPOLANCTO.Value := 'A';
    dtMod.tbCaixaENTRADA.Value := dtMod.tbEmpresaLANCTO.Value;
    //ValorTotal := ValorTotal + dtMod.tbEmpresaLANCTO.Value;
    dtMod.tbCaixa.Post;
    dtMod.tbEmpresa.Edit;
    dtMod.tbEmpresaLANCTO.VALUE := 0;
    dtMod.TbEmpresa.Post;
    while not dtMod.qrCalFechado.Eof do
    begin
      dtMod.tbCaixa.Append;
      dtMod.tbCaixaCONTROLECAIXA.Value := controle;
      dtMod.tbCaixaENTRADA.Value := dtMod.qrCalFechadoVALORTOTAL.Value;
      dtMod.tbCaixaDESCRICAO.Value := dtMod.qrCalFechadoMicro.Value;
      dtMod.tbCaixaMATRICULA.Value := frmMain.Matricula;
      dtMod.tbCaixaTIPOLANCTO.Value := 'A';
      dtMod.tbCaixa.Post;
      dtMod.qrCalFechado.Next;
    end;
    dtMod.tbOpenClose.Last;
    controle := dtMod.tbOpenCloseCONTROLECAIXA.Value;
    dtMod.tbOpenClose.Edit;
    dtMod.tbOpenCloseDHFECHAMENTO.Value := Now;
    dtMod.tbOpenCloseMatricula.Value := frmMain.Matricula;
    dtMod.tbOpenCloseSALDOFECHAMENTO.Value := ValorTotal;
    dtMod.tbOpenClose.Post;

    dtMod.tbCaixa.Append;
    dtMod.tbCaixaCONTROLECAIXA.Value := controle;
    dtMod.tbCaixaDATAMOVIMENTO.Value := Now;
    dtMod.tbCaixaSALDO.Value := ValorTotal;
    dtMod.tbCaixaDESCRICAO.Value := 'FECHAMENTO DO CAIXA';
    dtMod.tbCaixaMATRICULA.Value := frmMain.Matricula;
    dtMod.tbCaixaTIPOLANCTO.Value := 'A';
    dtMod.tbCaixa.Post;
    dtMod.qrMovFechado.ExecSQL;
    dtMod.tbFechado.Refresh;
    lblMens.Caption := '';
    if dtMod.IBTrans.InTransaction then
      dtMod.IBTrans.CommitRetaining;

    dtMod.Acao('Fechou Caixa');
  end;
  if dtMod.IBTrans.InTransaction then
    dtMod.IBTrans.CommitRetaining;
end;

procedure TfrmOpenClose.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
