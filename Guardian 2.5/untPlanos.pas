unit untPlanos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBBBtn, NavBtn, DBCtrls, Grids, DBGrids, ComCtrls,
  ExtCtrls, Mask, DB;

type
  TfrmPlanos = class(TForm)
    Panel3: TPanel;
    Label1: TLabel;
    EditPesq: TEdit;
    RdGrpOrdem: TRadioGroup;
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
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    DBText1: TDBText;
    Label6: TLabel;
    DBEdit1: TDBEdit;
    procedure EditPesqChange(Sender: TObject);
    procedure RdGrpOrdemClick(Sender: TObject);
    procedure dbNavBtnAppendClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPlanos: TfrmPlanos;

implementation

uses untDtMod;

{$R *.DFM}

procedure TfrmPlanos.EditPesqChange(Sender: TObject);
begin
  dtMod.tbPlano.Locate ('DESCRICAO', EditPesq.Text, [loCaseInsensitive, loPartialkey]);
end;

procedure TfrmPlanos.RdGrpOrdemClick(Sender: TObject);
begin
  if RdGrpOrdem.ItemIndex = 0 then
    dtMod.tbPlano.IndexFieldNames := 'Descricao'
  else
    dtMod.tbPlano.IndexFieldNames  := '';

end;

procedure TfrmPlanos.dbNavBtnAppendClick(Sender: TObject);
begin
  Dbedit2.SetFocus;
end;

procedure TfrmPlanos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
