unit untFornec;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, DBCtrls, Buttons, Grids, DBGrids, ComCtrls, Mask,
  DBBBtn, NavBtn,Db, ToolEdit, RXDBCtrl;

type
  TfrmFornec = class(TForm)
    Panel3: TPanel;
    Label1: TLabel;
    EditPesq: TEdit;
    RdGrpOrdem: TRadioGroup;
    PageCad: TPageControl;
    TabGrid: TTabSheet;
    DBGrid1: TDBGrid;
    TabDetalhe: TTabSheet;
    Panel2: TPanel;
    PanDados: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    DBText1: TDBText;
    Label4: TLabel;
    Label5: TLabel;
    DBEdit3: TDBEdit;
    Label6: TLabel;
    DBEdit4: TDBEdit;
    Label7: TLabel;
    DBEdit5: TDBEdit;
    Label8: TLabel;
    DBEdit6: TDBEdit;
    Label9: TLabel;
    DBEdit7: TDBEdit;
    Label10: TLabel;
    DBEdit8: TDBEdit;
    Label12: TLabel;
    DBEdit10: TDBEdit;
    Label13: TLabel;
    DBEdit11: TDBEdit;
    DBEdit13: TDBEdit;
    Label17: TLabel;
    DBEdit15: TDBEdit;
    Label18: TLabel;
    DBEdit16: TDBEdit;
    DBNav: TDBNavigator;
    dbNavBtnAppend: TDBNavigationButton;
    dbNavBtnDelete: TDBNavigationButton;
    dbNavBtnEdit: TDBNavigationButton;
    dbNavBtnSave: TDBNavigationButton;
    dbNavBtnCancel: TDBNavigationButton;
    BitBtn1: TBitBtn;
    DBEdit1: TDBDateEdit;
    SpeedButton1: TSpeedButton;
    Label11: TLabel;
    DBEdit9: TDBEdit;
    Label14: TLabel;
    DBEdit12: TDBEdit;
    Label16: TLabel;
    DBEdit14: TDBEdit;
    Label20: TLabel;
    DBEdit17: TDBEdit;
    Label21: TLabel;
    Label15: TLabel;
    DBEdit18: TDBEdit;
    Label19: TLabel;
    DBEdit19: TDBEdit;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    DBEdit20: TDBEdit;
    procedure EditPesqChange(Sender: TObject);
    procedure RdGrpOrdemClick(Sender: TObject);
    procedure dbNavBtnAppendClick(Sender: TObject);
    procedure dbNavBtnSaveBeforeAction(Sender: TObject;
      var ActionIsDone: Boolean);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFornec: TfrmFornec;

implementation

uses untDtModEst, untCrypt, untRepresentante;

{$R *.DFM}

procedure TfrmFornec.EditPesqChange(Sender: TObject);
begin
  dmEst.tbFornec.Locate ('Nome', EditPesq.Text, [loCaseInsensitive, loPartialkey]);
end;

procedure TfrmFornec.RdGrpOrdemClick(Sender: TObject);
begin
  if RdGrpOrdem.ItemIndex = 0 then
    dmEst.tbFornec.IndexFieldNames := 'Nome'
  else
    dmEst.tbFornec.IndexFieldNames  := '';

end;

procedure TfrmFornec.dbNavBtnAppendClick(Sender: TObject);
begin
  Dbedit2.SetFocus;
  dbEdit1.Text := DateToStr(Date);
end;

procedure TfrmFornec.dbNavBtnSaveBeforeAction(Sender: TObject;
  var ActionIsDone: Boolean);
begin
  if vercgc(dmEst.tbFornecCNPJ.AsString) then
    ActionIsDone := False
  else
  begin
    ActionIsDone := True;
    DBEdit15.SetFocus;
  end;
end;

procedure TfrmFornec.SpeedButton1Click(Sender: TObject);
begin
  frmRepresentante.ShowModal;
end;

end.
