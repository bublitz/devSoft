unit untCadInsOrc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Grids, DBGrids, ComCtrls, DBCtrls, DB, RxDBComb, Mask,
  Buttons, ToolEdit, CurrEdit;

type
  TfrmCadInsOrc = class(TForm)
    PageCad: TPageControl;
    TabGrid: TTabSheet;
    DBGrid1: TDBGrid;
    TabDetalhe: TTabSheet;
    Panel2: TPanel;
    BtnAlterar: TSpeedButton;
    BtnSalvar: TSpeedButton;
    BtnCanc: TSpeedButton;
    DBNav: TDBNavigator;
    PanDados: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    DBText1: TDBText;
    Label7: TLabel;
    Label8: TLabel;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    DBText5: TDBText;
    DBText6: TDBText;
    DBEdit3: TDBEdit;
    TabInsGrup: TTabSheet;
    RBtnTipo: TRadioButton;
    RBtnDesc: TRadioButton;
    PanTipo: TPanel;
    SpeedButton1: TSpeedButton;
    ChkBoxMao: TCheckBox;
    ChkBoxMat: TCheckBox;
    ChkBoxEqu: TCheckBox;
    EdP1: TRxCalcEdit;
    StaticText1: TStaticText;
    PanDesc: TPanel;
    SpeedButton2: TSpeedButton;
    EdDesc: TEdit;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    EdP2: TRxCalcEdit;
    TabSheet1: TTabSheet;
    Label9: TLabel;
    ChkBxAtu: TCheckBox;
    SpeedButton3: TSpeedButton;
    Label1: TLabel;
    PBar: TProgressBar;
    procedure AlternaControl(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure BtnCancClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure RBtnTipoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadInsOrc: TfrmCadInsOrc;
  valant: real;

implementation

uses untDatMod, Funcoes;

{$R *.DFM}

procedure TfrmCadInsOrc.AlternaControl(Sender: TObject);
begin
   DBNav.Enabled := not DBNav.Enabled;
   PanDados.Enabled := not PanDados.Enabled;
   BtnAlterar.Enabled := not BtnAlterar.Enabled;
   BtnSalvar.Enabled := not BtnSalvar.Enabled;
   BtnCanc.Enabled := not BtnCanc.Enabled;
end;

procedure TfrmCadInsOrc.BtnAlterarClick(Sender: TObject);
begin
   //Alterna Controles
   AlternaControl( Sender );
   DatMod.TabInsu.Edit;
   valant := DatMod.TabInsuValor.Value;
   DBEdit3.SetFocus;
end;

procedure TfrmCadInsOrc.BtnSalvarClick(Sender: TObject);
begin
   if DatMod.TabInsu.State in [ dsInsert, dsEdit ] then begin
      if DatMod.TabInsuValor.Value <> valant then begin
         DatMod.TabInsuDataAtualiz.Value := Date;
         DatMod.TabInsuValorAnt.Value := valant;
      end;
      DatMod.TabInsu.Post;
   end;
   //Alterna Controles
   AlternaControl( Sender );
end;

procedure TfrmCadInsOrc.BtnCancClick(Sender: TObject);
begin
   if DatMod.TabInsu.State in [ dsInsert, dsEdit ] then
      DatMod.TabInsu.Cancel;
   //Alterna Controles
   AlternaControl( Sender );
end;

procedure TfrmCadInsOrc.DBGrid1DblClick(Sender: TObject);
begin
   PageCad.ActivePage := TabDetalhe;
end;

procedure TfrmCadInsOrc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if DatMod.TabInsu.State in [ dsInsert, dsEdit ] then
      DatMod.TabInsu.Cancel;
end;

procedure TfrmCadInsOrc.SpeedButton1Click(Sender: TObject);
var
   novovalor, valant: real;

begin
   { Por tipo de insumo:
     1 - Mão de Obra
     2 - Materiais
     3 - Equipamentos }
   if Application.MessageBox( 'Confirma alteração ?', 'Alterar Preços',
                              MB_OKCANCEL + MB_ICONQUESTION) = IDOK then begin
      PBar.Position := 0;
      PBar.Max := DatMod.TabInsu.RecordCount;
      DatMod.TabInsu.First;
      while not DatMod.TabInsu.Eof do begin
         PBar.Position := DatMod.TabInsu.RecNo;
         valant := DatMod.TabInsuValor.Value;
         novovalor := DatMod.TabInsuValor.Value +
                   (DatMod.TabInsuValor.Value*EdP1.Value/100);
         DatMod.TabInsu.Edit;
         if ( DatMod.TabInsuTipo.Value = 1 ) and
            ( ChkBoxMao.Checked ) then begin
            DatMod.TabInsuValor.Value := novovalor;
            DatMod.TabInsuDataAtualiz.Value := Date;
            DatMod.TabInsuValorAnt.Value := valant;
         end
         else
         if ( DatMod.TabInsuTipo.Value = 2 ) and
            ( ChkBoxMat.Checked ) then begin
            DatMod.TabInsuValor.Value := novovalor;
            DatMod.TabInsuDataAtualiz.Value := Date;
            DatMod.TabInsuValorAnt.Value := valant;
         end
         else
         if ( DatMod.TabInsuTipo.Value = 3 ) and
            ( ChkBoxEqu.Checked ) then begin
            DatMod.TabInsuValor.Value := novovalor;
            DatMod.TabInsuDataAtualiz.Value := Date;
            DatMod.TabInsuValorAnt.Value := valant;
         end;
         DatMod.TabInsu.Next;
      end;
      DatMod.TabInsu.First;
      if DatMod.TabInsu.State = dsEdit then
         DatMod.TabInsu.Post;

      ShowMessage( 'Preços alterados !!' );
      PBar.Position := 0;
   end;
end;

procedure TfrmCadInsOrc.SpeedButton2Click(Sender: TObject);
var
   desc, descc: string;
   novovalor, valant: real;
   comp: byte;

begin
   { Por inicial }
   desc := AnsiUpperCase(TrimRight(EdDesc.Text));
   comp := Length( desc );
   if Application.MessageBox( 'Confirma alteração ?', 'Alterar Preços',
                              MB_OKCANCEL+MB_ICONQUESTION) = IDOK then begin
      PBar.Position := 0;
      PBar.Max := DatMod.TabInsu.RecordCount;
      DatMod.TabInsu.First;
      while not DatMod.TabInsu.Eof do begin
         PBar.Position := DatMod.TabInsu.RecNo;
         valant := DatMod.TabInsuValor.Value;
         novovalor := DatMod.TabInsuValor.Value +
                   (DatMod.TabInsuValor.Value*EdP2.Value/100);
         DatMod.TabInsu.Edit;
         descc := AnsiUpperCase(DatMod.TabInsuDescricao.Value);
         if Copy( descc, 1, comp ) = desc then begin
            DatMod.TabInsuValor.Value := novovalor;
            DatMod.TabInsuDataAtualiz.Value := Date;
            DatMod.TabInsuValorAnt.Value := valant;
         end;
         DatMod.TabInsu.Next;
      end;
      DatMod.TabInsu.First;

      if DatMod.TabInsu.State = dsEdit then
         DatMod.TabInsu.Post;

      ShowMessage( 'Preços alterados !!' );
      PBar.Position := 0;
   end;

end;

procedure TfrmCadInsOrc.SpeedButton3Click(Sender: TObject);
var
   codi: integer;
begin
   if Application.MessageBox( 'Confirma atualização ?', 'Atualizar Tabela',
                              MB_OKCANCEL+MB_ICONQUESTION) = IDOK then
   begin
      PBar.Position := 0;
      PBar.Max := DatMod.TabInsumos.RecordCount;
      DatMod.TabInsumos.First;
      while not DatMod.TabInsumos.Eof do
      begin
         PBar.Position := DatMod.TabInsumos.RecNo;
         codi := DatMod.TabInsumosCodigoInsumo.AsInteger;
         if DatMod.TabInsu.FindKey([ codi ]) = False then
         begin
            DatMod.TabInsu.Append;
            DatMod.TabInsuCodigoInsumo.Value := codi;
            DatMod.TabInsuValor.Value := DatMod.TabInsumosValor.Value;
            DatMod.TabInsuDataAtualiz.Value := DatMod.TabInsumosDataAtualiz.Value;
            DatMod.TabInsuValorAnt.Value := DatMod.TabInsumosValorAnt.Value;
            DatMod.TabInsu.Post;
         end
         else
            if ChkBxAtu.Checked then
            begin
               DatMod.TabInsu.Edit;
               DatMod.TabInsuValorAnt.Value := DatMod.TabInsuValor.Value;
               DatMod.TabInsuValor.Value := DatMod.TabInsumosValor.Value;
               DatMod.TabInsuDataAtualiz.Value := Date;
               DatMod.TabInsu.Post;
            end;

         DatMod.TabInsumos.Next;
      end;
      DatMod.TabInsu.First;
      if DatMod.TabInsu.State in [dsEdit,dsInsert] then
         DatMod.TabInsu.Post;

      ShowMessage( 'Tabela Atualizada !!' );
      PBar.Position := 0;
   end;
end;

procedure TfrmCadInsOrc.RBtnTipoClick(Sender: TObject);
begin
   PanTipo.Enabled := RBtnTipo.Checked;
   PanDesc.Enabled := RBtnDesc.Checked;
   PBar.Position := 0;
end;

end.
