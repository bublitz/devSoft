unit untSeekProduto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, DB;

type
  TfrmSeekProduto = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSeekProduto: TfrmSeekProduto;

implementation

uses untDtModEst;

{$R *.DFM}

procedure TfrmSeekProduto.Edit1Change(Sender: TObject);
begin
  dmEst.tbProduto.Locate('Descricao', Edit1.Text, [loCaseInsensitive, loPartialkey]);
end;

procedure TfrmSeekProduto.DBGrid1DblClick(Sender: TObject);
begin
  ModalResult := mrOk;
  Close;
end;

end.
