unit untPrecos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, DBCtrls, StdCtrls, Mask, Buttons, DBBBtn, NavBtn, RxLookup,
  Grids, DBGrids;

type
  TfrmPrecos = class(TForm)
    Panel2: TPanel;
    DBNav: TDBNavigator;
    dbNavBtnAppend: TDBNavigationButton;
    dbNavBtnDelete: TDBNavigationButton;
    dbNavBtnEdit: TDBNavigationButton;
    dbNavBtnSave: TDBNavigationButton;
    dbNavBtnCancel: TDBNavigationButton;
    BitBtn1: TBitBtn;
    PanDados: TPanel;
    DBGrid1: TDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrecos: TfrmPrecos;

implementation

uses untDtMod;

{$R *.DFM}

procedure TfrmPrecos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if dtMod.IBTrans.InTransaction then
    dtMod.IBTrans.CommitRetaining;
  Action := caFree;
end;

end.
