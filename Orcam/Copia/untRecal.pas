unit untRecal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, RXCtrls, Mask, ToolEdit, CurrEdit, ExtCtrls, ComCtrls,
  DBCtrls, DB;

type
  TfrmRecal = class(TForm)
    Label1: TLabel;
    BitBtn2: TBitBtn;
    SpeedButton1: TSpeedButton;
    LabAtual: TLabel;
    Label3: TLabel;
    EdValor: TRxCalcEdit;
    RxLabel1: TRxLabel;
    CheckBox1: TCheckBox;
    Bevel1: TBevel;
    PBar: TProgressBar;
    LabMens: TLabel;
    DBText7: TDBText;
    procedure SpeedButton1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRecal: TfrmRecal;

implementation

uses untDatMod, Funcoes, untCalculo;

{$R *.DFM}

procedure TfrmRecal.CheckBox1Click(Sender: TObject);
begin
  EdValor.Enabled := CheckBox1.Checked;
end;

procedure TfrmRecal.SpeedButton1Click(Sender: TObject);
var
   n0: longint;
   valodif, dif, dmdo, dmat, bdi, ls,
   valMDO, valMAT: real;

begin
   if Application.MessageBox( 'Deseja recalcular o orçamento ?',
                              'Recalcular Orçamento', MB_OKCANCEL + MB_ICONWARNING ) = IDOK then
   begin
      LabMens.Caption := 'Aguarde... Passo 1/2';
      PBar.Max := DatMod.TabOrcam.RecordCount;
      PBar.Position := 0;
      n0 := 0;
      DatMod.TabOrcam.First;
      while not DatMod.TabOrcam.Eof do begin
         PBar.Position := DatMod.TabOrcam.RecNo;
         if myInt(DatMod.TabOrcamNivel.AsString) = 0 then begin
            Inc( n0 );
            if DatMod.TabServicos.FindKey([ DatMod.TabOrcamCodigoServico.AsString ]) then begin
               valMDO := 0.00;
               valMAT := 0.00;
               CalcServDesc( DatMod.TabOrcamCodigoServico.AsString, valMDO, valMAT, True );
               DatMod.TabOrcam.Edit;
               DatMod.TabOrcamMAT.Value := valMAT;
               DatMod.TabOrcamMDO.Value := valMDO;
               if DatMod.TabOrcam.State = dsEdit then DatMod.TabOrcam.Post;
            end;
         end;
         DatMod.TabOrcam.Next;
      end;

      if CheckBox1.Checked then
         if n0 < 1 then
            ShowMessage( 'Não é possível fazer o recálculo com valor pré-definido!' )
         else begin
            CalcOrcam;
            LabMens.Caption := 'Aguarde... Passo 2/2';
            PBar.Position := 0;
            DatMod.TabOrcam.First;
            valodif := EdValor.Value - DatMod.TabDadosGeraisTotal.Value;
            dif := valodif / n0;
            ls  := DatMod.TabDadosGeraisLS.Value;
            while not DatMod.TabOrcam.Eof do begin
               PBar.Position := DatMod.TabOrcam.RecNo;
               if myInt(DatMod.TabOrcamNivel.AsString) = 0 then begin
                  bdi := DatMod.TabOrcamValBDI.Value;
                  dmat := ( dif - dif*bdi/(100+bdi) ) / 2;
                  dmdo := dmat/(1+ls/100);


                  valMAT := DatMod.TabOrcamMAT.Value + dmat / DatMod.TabOrcamQuantidade.Value;
                  valMDO := DatMod.TabOrcamMDO.Value + dmdo / DatMod.TabOrcamQuantidade.Value;

                  DatMod.TabOrcam.Edit;
                  DatMod.TabOrcamMAT.Value := valMAT;
                  DatMod.TabOrcamMDO.Value := valMDO;
                  if DatMod.TabOrcam.State = dsEdit then DatMod.TabOrcam.Post;

               end;
               DatMod.TabOrcam.Next;
            end;
         end;
      ShowMessage('Recálculo efetuado !!');
   end;
   CalcOrcam;
   LabMens.Caption := ' ';
   PBar.Position := 0;
end;

end.
