unit untCadInsu;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Grids, DBGrids, ComCtrls, DBCtrls, DB, RxDBComb, Mask,
  Buttons;

type
  TfrmCadInsu = class(TForm)
    Panel1: TPanel;
    PageCad: TPageControl;
    TabGrid: TTabSheet;
    TabDetalhe: TTabSheet;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    EditPesq: TEdit;
    RdGrpOrdem: TRadioGroup;
    Panel2: TPanel;
    DBNav: TDBNavigator;
    PanDados: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    DBText1: TDBText;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    RxDBComboBox1: TRxDBComboBox;
    BtnIncluir: TSpeedButton;
    BtnAlterar: TSpeedButton;
    BtnExcluir: TSpeedButton;
    BtnSalvar: TSpeedButton;
    BtnCanc: TSpeedButton;
    DBEdit4: TDBEdit;
    Label7: TLabel;
    Label8: TLabel;
    DBText2: TDBText;
    DBText3: TDBText;
    procedure AlternaControl(Sender: TObject);
    procedure RdGrpOrdemClick(Sender: TObject);
    procedure EditPesqChange(Sender: TObject);
    procedure BtnIncluirClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure BtnCancClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadInsu: TfrmCadInsu;
  valant: real;

implementation

uses untDatMod, Funcoes;

{$R *.DFM}

procedure TfrmCadInsu.AlternaControl(Sender: TObject);
begin
   DBNav.Enabled := not DBNav.Enabled;
   EditPesq.Enabled := not EditPesq.Enabled;
   PanDados.Enabled := not PanDados.Enabled;
   BtnIncluir.Enabled := not BtnIncluir.Enabled;
   BtnAlterar.Enabled := not BtnAlterar.Enabled;
   BtnExcluir.Enabled := not BtnExcluir.Enabled;
   BtnSalvar.Enabled := not BtnSalvar.Enabled;
   BtnCanc.Enabled := not BtnCanc.Enabled;
end;

procedure TfrmCadInsu.RdGrpOrdemClick(Sender: TObject);
begin
   if RdGrpOrdem.ItemIndex = 0 then
      DatMod.TabInsumos.IndexName := 'IndDescricao'
   else
      DatMod.TabInsumos.IndexName := '';
end;

procedure TfrmCadInsu.EditPesqChange(Sender: TObject);
begin
   DatMod.TabInsumos.Locate( 'Descricao', EditPesq.Text, [loPartialKey,loCaseInsensitive]);
end;

procedure TfrmCadInsu.BtnIncluirClick(Sender: TObject);
begin
   //Alterna Controles
   AlternaControl( Sender );
   Inclui( DatMod.TabInsumos );
   DBEdit4.SetFocus;
end;

procedure TfrmCadInsu.BtnAlterarClick(Sender: TObject);
begin
   //Alterna Controles
   AlternaControl( Sender );
   DatMod.TabInsumos.Edit;
   valant := DatMod.TabInsumosValor.Value;
   DBEdit1.SetFocus;
end;

procedure TfrmCadInsu.BtnExcluirClick(Sender: TObject);
begin
   Exclui( DatMod.TabInsumos );
end;

procedure TfrmCadInsu.BtnSalvarClick(Sender: TObject);
begin
   if DatMod.TabInsumos.State in [ dsInsert, dsEdit ] then begin
      if DatMod.TabInsumosValor.Value <> valant then begin
         DatMod.TabInsumosDataAtualiz.Value := Date;
         DatMod.TabInsumosValorAnt.Value := valant;
      end;
      DatMod.TabInsumos.Post;         
   end;
   //Alterna Controles
   AlternaControl( Sender );
end;

procedure TfrmCadInsu.BtnCancClick(Sender: TObject);
begin
   if DatMod.TabInsumos.State in [ dsInsert, dsEdit ] then
      DatMod.TabInsumos.Cancel;
   //Alterna Controles
   AlternaControl( Sender );
end;

procedure TfrmCadInsu.DBGrid1DblClick(Sender: TObject);
begin
   PageCad.ActivePage := TabDetalhe;
end;

procedure TfrmCadInsu.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if DatMod.TabInsumos.State in [ dsInsert, dsEdit ] then
      DatMod.TabInsumos.Cancel;
   DatMod.TabInsumos.IndexName := '';
end;

end.
