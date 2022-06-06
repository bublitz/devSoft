unit untAltPrecos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Mask, ToolEdit, CurrEdit, DB, ComCtrls;

type
  TfrmAltPrecos = class(TForm)
    RBtnTipo: TRadioButton;
    RBtnDesc: TRadioButton;
    BitBtn2: TBitBtn;
    PanTipo: TPanel;
    SpeedButton1: TSpeedButton;
    PanDesc: TPanel;
    SpeedButton2: TSpeedButton;
    ChkBoxMao: TCheckBox;
    ChkBoxMat: TCheckBox;
    ChkBoxEqu: TCheckBox;
    EdP1: TRxCalcEdit;
    StaticText1: TStaticText;
    EdDesc: TEdit;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    EdP2: TRxCalcEdit;
    PBar: TProgressBar;
    procedure RBtnTipoClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAltPrecos: TfrmAltPrecos;

implementation

uses untDatMod;

{$R *.DFM}

procedure TfrmAltPrecos.RBtnTipoClick(Sender: TObject);
begin
   PanTipo.Enabled := RBtnTipo.Checked;
   PanDesc.Enabled := RBtnDesc.Checked;
   PBar.Position := 0;
end;

procedure TfrmAltPrecos.SpeedButton1Click(Sender: TObject);
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
      PBar.Max := DatMod.TabInsumos.RecordCount;
      DatMod.TabInsumos.First;
      while not DatMod.TabInsumos.Eof do begin
         PBar.Position := DatMod.TabInsumos.RecNo;
         valant := DatMod.TabInsumosValor.Value;
         novovalor := DatMod.TabInsumosValor.Value +
                   (DatMod.TabInsumosValor.Value*EdP1.Value/100);
         DatMod.TabInsumos.Edit;
         if ( DatMod.TabInsumosTipo.Value = 1 ) and
            ( ChkBoxMao.Checked ) then begin
            DatMod.TabInsumosValor.Value := novovalor;
            DatMod.TabInsumosDataAtualiz.Value := Date;
            DatMod.TabInsumosValorAnt.Value := valant;
         end
         else
         if ( DatMod.TabInsumosTipo.Value = 2 ) and
            ( ChkBoxMat.Checked ) then begin
            DatMod.TabInsumosValor.Value := novovalor;
            DatMod.TabInsumosDataAtualiz.Value := Date;
            DatMod.TabInsumosValorAnt.Value := valant;
         end
         else
         if ( DatMod.TabInsumosTipo.Value = 3 ) and
            ( ChkBoxEqu.Checked ) then begin
            DatMod.TabInsumosValor.Value := novovalor;
            DatMod.TabInsumosDataAtualiz.Value := Date;
            DatMod.TabInsumosValorAnt.Value := valant;
         end;
         DatMod.TabInsumos.Next;
      end;
      DatMod.TabInsumos.First;
      if DatMod.TabInsumos.State = dsEdit then
         DatMod.TabInsumos.Post;

      ShowMessage( 'Preços alterados !!' );
   end;
end;

procedure TfrmAltPrecos.SpeedButton2Click(Sender: TObject);
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
      PBar.Max := DatMod.TabInsumos.RecordCount;
      DatMod.TabInsumos.First;
      while not DatMod.TabInsumos.Eof do begin
         PBar.Position := DatMod.TabInsumos.RecNo;
         valant := DatMod.TabInsumosValor.Value;
         novovalor := DatMod.TabInsumosValor.Value +
                   (DatMod.TabInsumosValor.Value*EdP2.Value/100);
         DatMod.TabInsumos.Edit;
         descc := AnsiUpperCase(DatMod.TabInsumosDescricao.Value);
         if Copy( descc, 1, comp ) = desc then begin
            DatMod.TabInsumosValor.Value := novovalor;
            DatMod.TabInsumosDataAtualiz.Value := Date;
            DatMod.TabInsumosValorAnt.Value := valant;
         end;
         DatMod.TabInsumos.Next;
      end;
      DatMod.TabInsumos.First;
      if DatMod.TabInsumos.State = dsEdit then
         DatMod.TabInsumos.Post;

      ShowMessage( 'Preços alterados !!' );
   end;

end;

end.
