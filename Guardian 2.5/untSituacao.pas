unit untSituacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, DBBBtn, NavBtn, DBCtrls, Grids, DBGrids,
  ComCtrls, Mask, RxDBComb;

type
  TfrmSituacao = class(TForm)
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
    Panel3: TPanel;
    Label1: TLabel;
    EditPesq: TEdit;
    RdGrpOrdem: TRadioGroup;
    Label2: TLabel;
    DBText1: TDBText;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    RxDBComboBox2: TRxDBComboBox;
    Label17: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSituacao: TfrmSituacao;

implementation

uses untDtMod;

{$R *.DFM}

procedure TfrmSituacao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
