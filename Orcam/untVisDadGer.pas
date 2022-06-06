unit untVisDadGer;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, Forms, DBCtrls, DB, Mask, ExtCtrls, Buttons, Grids, DBGrids,
  RxDBComb, ToolEdit, RXDBCtrl;

type
  TfrmVisDadGer = class(TForm)
    PanDados: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label17: TLabel;
    EditDescricao: TDBEdit;
    EditCliente: TDBEdit;
    EditLocal: TDBEdit;
    EditObs: TDBEdit;
    DBText2: TDBText;
    Label18: TLabel;
    Label19: TLabel;
    DBText3: TDBText;
    DBText4: TDBText;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label20: TLabel;
    DBEdit2: TDBEdit;
    DBDateEdit1: TDBDateEdit;
    Label21: TLabel;
    DBEdit1: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    Label6: TLabel;
    EditLS: TDBEdit;
    GroupBox1: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    EditBDI: TDBEdit;
    EditBDI2: TDBEdit;
    EditBDI3: TDBEdit;
    EditBDI4: TDBEdit;
    EditBDI5: TDBEdit;
    EditBDI6: TDBEdit;
    EditBDI7: TDBEdit;
    EditBDI8: TDBEdit;
    EditBDI9: TDBEdit;
    EditBDI10: TDBEdit;
    Label22: TLabel;
    DBEdit3: TDBEdit;
    Label23: TLabel;
    DBEdit4: TDBEdit;
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  frmVisDadGer: TfrmVisDadGer;
  niv, per: integer;

implementation

uses untDatMod, Funcoes;

{$R *.DFM}

end.
