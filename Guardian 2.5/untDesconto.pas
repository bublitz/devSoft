unit untDesconto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, Buttons, DBBBtn, NavBtn, DBCtrls, ExtCtrls;

type
  TfrmDesconto = class(TForm)
    Panel2: TPanel;
    DBNav: TDBNavigator;
    dbNavBtnAppend: TDBNavigationButton;
    dbNavBtnDelete: TDBNavigationButton;
    dbNavBtnEdit: TDBNavigationButton;
    dbNavBtnSave: TDBNavigationButton;
    dbNavBtnCancel: TDBNavigationButton;
    BitBtn1: TBitBtn;
    DBGrid1: TDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDesconto: TfrmDesconto;

implementation

uses untDtMod;

{$R *.DFM}

procedure TfrmDesconto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if dtMod.IBTrans.InTransaction then
    dtMod.IBTrans.CommitRetaining;
  Action := caFree;
end;

end.
