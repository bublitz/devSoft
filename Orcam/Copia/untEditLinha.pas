unit untEditLinha;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, Forms, DBCtrls, DB, Mask, DBTables, ExtCtrls, Buttons,
  ToolEdit, CurrEdit, RXDBCtrl;

type
  TfrmEditLinha = class(TForm)
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
    EditNumero: TDBEdit;
    EditNivel: TDBEdit;
    EditDescricaoServico: TDBEdit;
    EditMDO: TDBEdit;
    EditMAT: TDBEdit;
    EditBDI: TDBEdit;
    DBEditUnidade: TDBEdit;
    BtnCancela: TBitBtn;
    RxDBCalcEdit1: TRxDBCalcEdit;
    DBText3: TDBText;
    BtnOk: TButton;
    RxDBComboEdit1: TRxDBComboEdit;
    Label11: TLabel;
    CBoxBdi: TComboBox;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BtnOkClick(Sender: TObject);
    procedure DBEditCodigoServicoExit(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  frmEditLinha: TfrmEditLinha;

implementation

uses untDatMod, untCalculo, untPesqServico, Funcoes;

{$R *.DFM}

procedure TfrmEditLinha.SpeedButton1Click(Sender: TObject);
var
   valMDO, valMAT: real;
begin
   if frmPesqServ.ShowModal = mrOk then begin
      valMDO := 0.00;
      valMAT := 0.00;
      DatMod.TabOrcamCodigoServico.AsString := DatMod.TabServicosCodigoServico.AsString;
      CalcServDesc( DatMod.TabOrcamCodigoServico.AsString, valMDO, valMAT, True );
      with DatMod do begin
         TabOrcamDescricaoServico.Value := TabServicosDescricao.Value;
         TabOrcamUnidade.Value := TabServicosUnidade.Value;
         TabOrcamMAT.Value := valMAT;
         TabOrcamMDO.Value := valMDO;
      end;
   end;
end;

procedure TfrmEditLinha.FormShow(Sender: TObject);
begin
    CBoxBdi.Items.Clear;
    CBoxBdi.Items.Add( FloatToStrF( DatMod.TabDadosGeraisBDI0.Value , ffFixed, 8, 2 ) + '%' );
    CBoxBdi.Items.Add( FloatToStrF( DatMod.TabDadosGeraisBDI1.Value , ffFixed, 8, 2 ) + '%' );
    CBoxBdi.Items.Add( FloatToStrF( DatMod.TabDadosGeraisBDI2.Value , ffFixed, 8, 2 ) + '%' );
    CBoxBdi.Items.Add( FloatToStrF( DatMod.TabDadosGeraisBDI3.Value , ffFixed, 8, 2 ) + '%' );
    CBoxBdi.Items.Add( FloatToStrF( DatMod.TabDadosGeraisBDI4.Value , ffFixed, 8, 2 ) + '%' );
    CBoxBdi.Items.Add( FloatToStrF( DatMod.TabDadosGeraisBDI5.Value , ffFixed, 8, 2 ) + '%' );
    CBoxBdi.Items.Add( FloatToStrF( DatMod.TabDadosGeraisBDI6.Value , ffFixed, 8, 2 ) + '%' );
    CBoxBdi.Items.Add( FloatToStrF( DatMod.TabDadosGeraisBDI7.Value , ffFixed, 8, 2 ) + '%' );
    CBoxBdi.Items.Add( FloatToStrF( DatMod.TabDadosGeraisBDI8.Value , ffFixed, 8, 2 ) + '%' );
    CBoxBdi.Items.Add( FloatToStrF( DatMod.TabDadosGeraisBDI9.Value , ffFixed, 8, 2 ) + '%' );
    CBoxBdi.Text := CBoxBdi.Items[ myInt(DatMod.TabOrcamBDI.Value) ] ;

    RxDBComboEdit1.SetFocus;
end;

procedure TfrmEditLinha.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
     if ActiveControl.Name <> 'BtnOk' then begin
        SelectNext( ActiveControl, True, True );
        Key := #0;
     end;
end;

procedure TfrmEditLinha.BtnOkClick(Sender: TObject);
begin
   DatMod.TabOrcamBDI.Value := IntToStr( CBoxBdi.ItemIndex );
   ModalResult := mrOk;
end;

procedure TfrmEditLinha.DBEditCodigoServicoExit(Sender: TObject);
var
   valMDO, valMAT: real;
begin
   if DatMod.TabServicos.FindKey([ RxDBComboEdit1.Text ]) then begin
      valMDO := 0.00;
      valMAT := 0.00;
      DatMod.TabOrcamCodigoServico.AsString := DatMod.TabServicosCodigoServico.AsString;
      CalcServDesc( DatMod.TabOrcamCodigoServico.AsString, valMDO, valMAT, True );
      with DatMod do begin
         TabOrcamDescricaoServico.Value := TabServicosDescricao.Value;
         TabOrcamUnidade.Value := TabServicosUnidade.Value;
         TabOrcamMAT.Value := valMAT;
         TabOrcamMDO.Value := valMDO;
      end;
   end;
end;

end.
