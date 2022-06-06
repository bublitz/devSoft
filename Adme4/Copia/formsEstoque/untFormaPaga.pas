unit untFormaPaga;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, DBCtrls, Buttons, Grids, DBGrids, ComCtrls, Mask,
  DBBBtn, NavBtn, RxLookup, DB;

type
  TfrmFormaPaga = class(TForm)
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
    Label4: TLabel;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    Label8: TLabel;
    DBEdit7: TDBEdit;
    Label9: TLabel;
    DBEdit8: TDBEdit;
    Label10: TLabel;
    DBEdit9: TDBEdit;
    Label11: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBText1: TDBText;
    SpeedButton1: TSpeedButton;
    DBNav: TDBNavigator;
    dbNavBtnAppend: TDBNavigationButton;
    dbNavBtnDelete: TDBNavigationButton;
    dbNavBtnEdit: TDBNavigationButton;
    dbNavBtnSave: TDBNavigationButton;
    dbNavBtnCancel: TDBNavigationButton;
    BitBtn1: TBitBtn;
    RxDBLookupCombo1: TRxDBLookupCombo;
    procedure EditPesqChange(Sender: TObject);
    procedure RdGrpOrdemClick(Sender: TObject);
    procedure dbNavBtnAppendClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFormaPaga: TfrmFormaPaga;

implementation

uses untDtModEst;

{$R *.DFM}

procedure TfrmFormaPaga.EditPesqChange(Sender: TObject);
begin
  dmEst.tbFormaPag.Locate ('DESCRICAO', EditPesq.Text, [loCaseInsensitive, loPartialkey]);
end;

procedure TfrmFormaPaga.RdGrpOrdemClick(Sender: TObject);
begin
  if RdGrpOrdem.ItemIndex = 0 then
    dmEst.tbformaPag.IndexFieldNames := 'DESCRICAO'
  else
    dmEst.tbformaPag.IndexFieldNames  := '';
end;

procedure TfrmFormaPaga.dbNavBtnAppendClick(Sender: TObject);
begin
  RxDBLookupCombo1.SetFocus;
end;

end.
