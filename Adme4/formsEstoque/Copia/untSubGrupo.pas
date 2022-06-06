unit untSubGrupo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Mask, DBCtrls, Buttons, Grids, DBGrids, ComCtrls, StdCtrls, ExtCtrls,
  DBBBtn, NavBtn, DB;

type
  TfrmSubGrupo = class(TForm)
    Panel3: TPanel;
    Label1: TLabel;
    EditPesq: TEdit;
    RdGrpOrdem: TRadioGroup;
    PageCad: TPageControl;
    TabDetalhe: TTabSheet;
    Panel2: TPanel;
    PanDados: TPanel;
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
  frmSubGrupo: TfrmSubGrupo;

implementation

uses untDtModEst;

{$R *.DFM}

procedure TfrmSubGrupo.EditPesqChange(Sender: TObject);
begin
  dmEst.tbSubGrupo.Locate ('DESCRICAO', EditPesq.Text, [loCaseInsensitive, loPartialkey]);
end;

procedure TfrmSubGrupo.RdGrpOrdemClick(Sender: TObject);
begin
begin
  if RdGrpOrdem.ItemIndex = 0 then
    dmEst.tbSubGrupo.IndexFieldNames := 'DESCRICAO'
  else
    dmEst.tbSubGrupo.IndexFieldNames  := '';
end;
end;

end.
