unit CadLancto;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Dialogs,
  StdCtrls, Forms, DBCtrls, DB, Mask, DBTables, ExtCtrls, Buttons,
  ToolEdit, RXLookup, RXDBCtrl, DBFilter, Grids, DBGrids;

type
  TFrmCadLancto = class(TForm)
    DBNavigator: TDBNavigator;
    Panel1: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    EditValor: TDBEdit;
    EditComplemento: TDBEdit;
    SpBtnIncluir: TSpeedButton;
    SpBtnAlterar: TSpeedButton;
    SpBtnSalvar: TSpeedButton;
    SpBtnExcluir: TSpeedButton;
    SpBtnCancelar: TSpeedButton;
    DBoxBanco: TDBLookupComboBox;
    DBGrpTipo: TDBRadioGroup;
    DBLBoxHist: TDBLookupComboBox;
    DBGrdLan: TDBGrid;
    EditData: TDateEdit;
    SpeedButton1: TSpeedButton;
    Bevel1: TBevel;
    procedure SpeedButton1Click(Sender: TObject);
    procedure DBoxBancoEnter(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  FrmCadLancto: TFrmCadLancto;

implementation

{$R *.DFM}

uses DataMod;

procedure TFrmCadLancto.SpeedButton1Click(Sender: TObject);
var
    codbanco: integer;
    data: string;

begin
   if (DBoxBanco.Text = '') or (EditData.Date = 0) then
      ShowMessage('Preencha Banco e Data!!')

   else begin
      codbanco := DBoxBanco.KeyValue;
      data := EditData.Text;
      DatMod.TabLancto.Filtered := False;
      DatMod.TabLancto.Filter := '(Banco = '+ IntToStr( codbanco ) + ')' +
          ' and (Data = ' + chr(39) + data + chr(39) + ')';

      DatMod.TabLancto.Filtered := True;
      DBGrdLan.Visible := True;
      Label5.Visible := True;
      Label6.Visible := True;
      Label7.Visible := True;
      EditComplemento.Visible := True;
      EditValor.Visible := True;
      DBGrpTipo.Visible := True;
      EditValor.Visible := True;
      DBLBoxHist.Visible := True;
   end;
end;

procedure TFrmCadLancto.DBoxBancoEnter(Sender: TObject);
begin
   DBGrdLan.Visible := False;
   Label5.Visible := False;
   Label6.Visible := False;
   Label7.Visible := False;
   EditComplemento.Visible := False;
   EditValor.Visible := False;
   DBGrpTipo.Visible := False;
   EditValor.Visible := False;
   DBLBoxHist.Visible := False;
end;

end.
