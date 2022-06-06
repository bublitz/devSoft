unit untRec;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, DBCtrls, Buttons, DBBBtn, NavBtn, Grids,
  DBGrids, ComCtrls, RxLookup, ToolEdit, RXDBCtrl;

type
  TfrmRec = class(TForm)
    PageCad: TPageControl;
    TabGrid: TTabSheet;
    DBGrid1: TDBGrid;
    TabDetalhe: TTabSheet;
    Panel2: TPanel;
    DBNav: TDBNavigator;
    dbNavBtnAppend: TDBNavigationButton;
    dbNavBtnDelete: TDBNavigationButton;
    dbNavBtnEdit: TDBNavigationButton;
    dbNavBtnSave: TDBNavigationButton;
    dbNavBtnCancel: TDBNavigationButton;
    BitBtn1: TBitBtn;
    PanDados: TPanel;
    Label2: TLabel;
    DBText1: TDBText;
    Label3: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Label4: TLabel;
    RxDBLookupCombo2: TRxDBLookupCombo;
    Label5: TLabel;
    DBDateEdit1: TDBDateEdit;
    Label6: TLabel;
    DBDateEdit2: TDBDateEdit;
    Label7: TLabel;
    DBEdit1: TDBEdit;
    Label8: TLabel;
    DBEdit2: TDBEdit;
    Label9: TLabel;
    DBEdit3: TDBEdit;
    Panel1: TPanel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBDateEdit3: TDBDateEdit;
    DBEdit7: TDBEdit;
    Panel4: TPanel;
    Label10: TLabel;
    DBEdit4: TDBEdit;
    btnBaixar: TSpeedButton;
    procedure dbNavBtnAppendAfterAction(Sender: TObject;
      var Error: Boolean);
    procedure btnBaixarClick(Sender: TObject);
    procedure dbNavBtnSaveBeforeAction(Sender: TObject;
      var ActionIsDone: Boolean);
    procedure dbNavBtnSaveClick(Sender: TObject);
    procedure DBEdit6Enter(Sender: TObject);
    procedure dbNavBtnCancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRec: TfrmRec;

implementation

uses untDtMod;

{$R *.DFM}

procedure TfrmRec.dbNavBtnAppendAfterAction(Sender: TObject;
  var Error: Boolean);
begin
  dtMod.tbRecebCODIGOSITUACAO.Value := 1;
end;

procedure TfrmRec.btnBaixarClick(Sender: TObject);
var
  multa, juros, total: real;

begin
  if dtMod.tbRecebDATAPAGAMENTO.IsNull then
  begin
    Panel1.Enabled := True;
    dtMod.tbReceb.Edit;
    dtMod.tbRecebDATAPAGAMENTO.Value  := Date;
    dtMod.tbRecebCODIGOSITUACAO.Value := 2;
    multa := 0;
    juros := 0;
    if Date > dtMod.tbRecebDATAVENCIMENTO.Value then
    begin
      // Calcula multa e juros
      multa := dtMod.tbRecebVALOR.Value * dtMod.tbRecebMULTA.Value / 100;
      juros := dtMod.tbRecebVALOR.Value * dtMod.tbRecebJUROS.Value / 100;
      juros := juros * Trunc(Date - dtMod.tbRecebDATAVENCIMENTO.Value);
    end;
    total := dtMod.tbRecebVALOR.Value + multa + juros;
    dtMod.tbRecebVALORPAGO.Value := total;
    DBEdit5.SetFocus;
  end
  else
    raise exception.create('Fatura já Baixada !');
end;

procedure TfrmRec.dbNavBtnSaveBeforeAction(Sender: TObject;
  var ActionIsDone: Boolean);
begin
  if Panel1.Enabled then
  begin
    Panel1.Enabled := False;

    // Lança Fatura no Caixa
    dtMod.tbCaixa.Append;
    dtMod.tbCaixaDESCRICAO.Value := 'Receb. Fatura N. ' +
                                    IntToSTr(dtMod.tbRecebNUMERO.AsInteger) +
                                    ' => ' + dtMod.tbRecebNomeSocio.AsString;
    dtMod.tbCaixaENTRADA.Value := dtMod.tbRecebVALORPAGO.Value;
    dtMod.tbCaixaTIPOLANCTO.Value := 'A';
    dtMod.tbCaixa.Post;
    dtMod.ApplyUpdates( dtMod.tbCaixa );



    // Procura pela situação do sócio
  end;
  ActionIsDone := True;
end;

procedure TfrmRec.dbNavBtnSaveClick(Sender: TObject);
begin
  dtMod.tbReceb.Refresh;
end;

procedure TfrmRec.DBEdit6Enter(Sender: TObject);
begin
  if dtMod.tbRecebCHEQUE.Value = 'DINHEIRO' then
  begin
    SelectNext( ActiveControl, True, True );
    dtMod.tbRecebBANCO.Value := '';
  end;
end;

procedure TfrmRec.dbNavBtnCancelClick(Sender: TObject);
begin
  if Panel1.Enabled then Panel1.Enabled := False;
end;

procedure TfrmRec.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
