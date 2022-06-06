unit untMoeda;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, DBCtrls, Buttons, Grids, DBGrids, ComCtrls,
  DBBBtn, NavBtn, DB, TFlatButtonUnit;

type
  TfrmMoeda = class(TForm)
    PageCad: TPageControl;
    TabDetalhe: TTabSheet;
    Panel2: TPanel;
    PanDados: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    EditPesq: TEdit;
    RdGrpOrdem: TRadioGroup;
    DBNav: TDBNavigator;
    dbNavBtnAppend: TDBNavigationButton;
    dbNavBtnDelete: TDBNavigationButton;
    dbNavBtnEdit: TDBNavigationButton;
    dbNavBtnSave: TDBNavigationButton;
    dbNavBtnCancel: TDBNavigationButton;
    BitBtn1: TBitBtn;
    Label5: TLabel;
    DBGrid1: TDBGrid;
    Label2: TLabel;
    Panel1: TPanel;
    FlatButton1: TFlatButton;
    Label3: TLabel;
    procedure EditPesqChange(Sender: TObject);
    procedure RdGrpOrdemClick(Sender: TObject);
    procedure FlatButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMoeda: TfrmMoeda;

implementation

uses untDtModEst;

{$R *.DFM}

procedure TfrmMoeda.EditPesqChange(Sender: TObject);
begin
  dmEst.tbMoeda.Locate ('DESCRICAO', EditPesq.Text, [loCaseInsensitive, loPartialkey]);
end;

procedure TfrmMoeda.RdGrpOrdemClick(Sender: TObject);
begin
  if RdGrpOrdem.ItemIndex = 0 then
    dmEst.tbMoeda.IndexFieldNames := 'DESCRICAO'
  else
    dmEst.tbMoeda.IndexFieldNames  := '';
end;

procedure TfrmMoeda.FlatButton1Click(Sender: TObject);
begin
  dmEst.tbProduto.Close;
  dmEst.tbProduto.Open;
  Label3.Caption := 'PREÇOS ATUALIZADOS COM SUCESSO...';
end;

procedure TfrmMoeda.FormShow(Sender: TObject);
begin
  Label3.Caption := '';
end;

end.
