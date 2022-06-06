unit untFormaRec;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, DBCtrls, Mask, Buttons, DBBBtn, NavBtn, Grids,
  DBGrids, ComCtrls, DB, ToolEdit, CurrEdit, RXDBCtrl, RxDBComb;

type
  TfrmFormaRec = class(TForm)
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
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBText1: TDBText;
    DBEdit3: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    Panel3: TPanel;
    Label1: TLabel;
    EditPesq: TEdit;
    RdGrpOrdem: TRadioGroup;
    RxDBComboBox1: TRxDBComboBox;
    RxDBCalcEdit1: TRxDBCalcEdit;
    GroupBox1: TGroupBox;
    procedure EditPesqChange(Sender: TObject);
    procedure RdGrpOrdemClick(Sender: TObject);
    procedure dbNavBtnAppendClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFormaRec: TfrmFormaRec;

implementation

uses untDtModEst;

{$R *.DFM}

procedure TfrmFormaRec.EditPesqChange(Sender: TObject);
begin
  dmEst.tbFormaRec.Locate ('DESCRICAO', EditPesq.Text, [loCaseInsensitive, loPartialkey]);
end;

procedure TfrmFormaRec.RdGrpOrdemClick(Sender: TObject);
begin
 if RdGrpOrdem.ItemIndex = 0 then
    dmEst.tbformaRec.IndexFieldNames := 'DESCRICAO'
  else
    dmEst.tbformaRec.IndexFieldNames  := '';
end;

procedure TfrmFormaRec.dbNavBtnAppendClick(Sender: TObject);
begin
  Dbedit3.SetFocus;
end;

end.
