unit CadFornec;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, Mask, DBCtrls, ExtCtrls, Buttons, StdCtrls, Grids, DBGrids, ComCtrls,
  ToolEdit, RXDBCtrl;

type
  TFrmFornec = class(TForm)
    PgCtrlBanco: TPageControl;
    TabGrid: TTabSheet;
    DBGrdFor: TDBGrid;
    RdGrpOrdem: TRadioGroup;
    EdtPesq: TEdit;
    TabCad: TTabSheet;
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
    DBText1: TDBText;
    SpBtnIncluir: TSpeedButton;
    SpBtnAlterar: TSpeedButton;
    SpBtnExcluir: TSpeedButton;
    SpBtnCancelar: TSpeedButton;
    SpBtnSalvar: TSpeedButton;
    DBNav: TDBNavigator;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    SpBtnFechar: TSpeedButton;
    DBEdit9: TDBDateEdit;
    procedure RdGrpOrdemClick(Sender: TObject);
    procedure SpBtnFecharClick(Sender: TObject);
    procedure SwapButtons( Sender: TObject );
    procedure SpBtnIncluirClick(Sender: TObject);
    procedure SpBtnAlterarClick(Sender: TObject);
    procedure SpBtnSalvarClick(Sender: TObject);
    procedure SpBtnCancelarClick(Sender: TObject);
    procedure EdtPesqChange(Sender: TObject);
    procedure SpBtnExcluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmFornec: TFrmFornec;

implementation

{$R *.DFM}

uses DataMod, Funcoes;

procedure TFrmFornec.SwapButtons( Sender: TObject );
begin
   DBNav.Enabled := not DBNav.Enabled;
   SpBtnIncluir.Enabled := not SpBtnIncluir.Enabled;
   SpBtnAlterar.Enabled := not SpBtnAlterar.Enabled;
   SpBtnExcluir.Enabled := not SpBtnExcluir.Enabled;
   SpBtnCancelar.Enabled := not SpBtnCancelar.Enabled;
   SpBtnSalvar.Enabled := not SpBtnSalvar.Enabled;
   DBEdit1.Enabled := not DBEdit1.Enabled;
   DBEdit2.Enabled := not DBEdit2.Enabled;
   DBEdit3.Enabled := not DBEdit3.Enabled;
   DBEdit4.Enabled := not DBEdit4.Enabled;
   DBEdit5.Enabled := not DBEdit5.Enabled;
   DBEdit6.Enabled := not DBEdit6.Enabled;
   DBEdit7.Enabled := not DBEdit7.Enabled;
   DBEdit8.Enabled := not DBEdit8.Enabled;
   DBEdit9.Enabled := not DBEdit9.Enabled;
   TabGrid.Enabled := not TabGrid.Enabled;
   SpBtnFechar.Enabled := not SpBtnFechar.Enabled;
end;

procedure TFrmFornec.RdGrpOrdemClick(Sender: TObject);
begin
   if RdGrpOrdem.ItemIndex = 0 then
      begin // Nome
      EdtPesq.Visible := True;
      DatMod.TabFornec.IndexName := 'IndNome';
      end
   else
      begin // Código
      EdtPesq.Visible := False;
      DatMod.TabFornec.IndexName := '';
      end;
end;

procedure TFrmFornec.SpBtnFecharClick(Sender: TObject);
begin
   Close;
end;

procedure TFrmFornec.SpBtnIncluirClick(Sender: TObject);
begin
   if Inclui( DatMod.TabFornec ) then begin
      SwapButtons( Sender );
      DBEdit1.SetFocus;
   end;
end;

procedure TFrmFornec.SpBtnAlterarClick(Sender: TObject);
begin
   SwapButtons( Sender );
   DatMod.TabFornec.Edit;
   DBEdit1.SetFocus;
end;

procedure TFrmFornec.SpBtnSalvarClick(Sender: TObject);
var
   ok: boolean;
   cgccpf: string;
begin
   ok := false;
   cgccpf := DBEdit6.Text;
   if Length( cgccpf ) = 11 then begin
      if vercpf( cgccpf ) then
         ok := true
   end
   else
      if vercgc( cgccpf ) then
         ok := true;

   if ok then
   begin
      SwapButtons( Sender );
      if DatMod.TabFornec.State in [ dsInsert, dsEdit ] then
         DatMod.TabFornec.Post;
   end;
end;

procedure TFrmFornec.SpBtnCancelarClick(Sender: TObject);
begin
   SwapButtons( Sender );
   if DatMod.TabFornec.State in [ dsInsert, dsEdit ] then
      DatMod.TabFornec.Cancel;
end;

procedure TFrmFornec.EdtPesqChange(Sender: TObject);
begin
//   DatMod.TabFornec.FindKey( [ EdtPesq.Text ] );
   DatMod.TabFornec.FindNearest( [ EdtPesq.Text ] );
end;

procedure TFrmFornec.SpBtnExcluirClick(Sender: TObject);
begin
   Exclui( DatMod.TabFornec );
end;

end.
