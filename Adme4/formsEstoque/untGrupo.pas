unit untGrupo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, DBCtrls, Buttons, Grids, DBGrids, ComCtrls,
  DBBBtn, NavBtn, DB;

type
  TfrmGrupo = class(TForm)
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
    DBGrid1: TDBGrid;
    procedure EditPesqChange(Sender: TObject);
    procedure RdGrpOrdemClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGrupo: TfrmGrupo;

implementation

uses untDtModEst;

{$R *.DFM}

procedure TfrmGrupo.EditPesqChange(Sender: TObject);
begin
  dmEst.tbGrupo.Locate ('DESCRICAO', EditPesq.Text, [loCaseInsensitive, loPartialkey]);
end;

procedure TfrmGrupo.RdGrpOrdemClick(Sender: TObject);
begin
  if RdGrpOrdem.ItemIndex = 0 then
    dmEst.tbGrupo.IndexFieldNames := 'DESCRICAO'
  else
    dmEst.tbGrupo.IndexFieldNames  := '';
end;

end.
