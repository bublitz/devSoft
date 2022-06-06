unit untAdmCartao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Mask, DBCtrls, Buttons, Grids, DBGrids, ComCtrls, StdCtrls, ExtCtrls,
  DBBBtn, NavBtn, db;

type
  TfrmAdmCartao = class(TForm)
    Panel3: TPanel;
    Label1: TLabel;
    EditPesq: TEdit;
    RdGrpOrdem: TRadioGroup;
    e: TPageControl;
    TabGrid: TTabSheet;
    DBGrid1: TDBGrid;
    TabDetalhe: TTabSheet;
    PanDados: TPanel;
    DBText1: TDBText;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DBText2: TDBText;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    DBEdit1: TDBEdit;
    Label6: TLabel;
    DBEdit4: TDBEdit;
    Label7: TLabel;
    Panel2: TPanel;
    DBNav: TDBNavigator;
    dbNavBtnAppend: TDBNavigationButton;
    dbNavBtnDelete: TDBNavigationButton;
    dbNavBtnEdit: TDBNavigationButton;
    dbNavBtnSave: TDBNavigationButton;
    dbNavBtnCancel: TDBNavigationButton;
    BitBtn1: TBitBtn;
    procedure dbNavBtnAppendClick(Sender: TObject);
    procedure RdGrpOrdemClick(Sender: TObject);
    procedure EditPesqChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAdmCartao: TfrmAdmCartao;

implementation

uses untDtModEst;

{$R *.DFM}

procedure TfrmAdmCartao.dbNavBtnAppendClick(Sender: TObject);
begin
  DbEdit2.SetFocus;
end;

procedure TfrmAdmCartao.RdGrpOrdemClick(Sender: TObject);
begin
  if RdGrpOrdem.ItemIndex = 0 then
    dmEst.tbAdmCartao.IndexFieldNames := 'DESCRICAO'
  else
    dmEst.tbAdmCartao.IndexFieldNames  := '';
end;

procedure TfrmAdmCartao.EditPesqChange(Sender: TObject);
begin
  dmEst.tbAdmCartao.Locate ('Descricao', EditPesq.Text, [loCaseInsensitive, loPartialkey]);
end;

end.
