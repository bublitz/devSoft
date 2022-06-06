unit untAtualiza;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TfrmAtualiza = class(TForm)
    btnGravar: TBitBtn;
    BitBtn2: TBitBtn;
    procedure btnGravarClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAtualiza: TfrmAtualiza;

implementation

uses untDatModPrinc;

{$R *.dfm}

procedure TfrmAtualiza.btnGravarClick(Sender: TObject);
var
  erros: integer;

begin
  with dmPrinc do
  begin
    //if sqlMarca.State in [dsInsert, dsEdit] then
    //  sqlMarca.Post;

    //if sqlMarca.ChangeCount > 0 then
    //begin
    //  erros := sqlMarca.ApplyUpdates(-1);
    //  if erros = 0 then
    //  begin
    //    SQLConLocal.Commit(TransDesc);
    //    frmAtualiza.Close;
    //  end;
    //end
    //else
    //  frmAtualiza.Close;
  end;
end;

procedure TfrmAtualiza.BitBtn2Click(Sender: TObject);
begin
  with dmPrinc do
  begin
    //if sqlMarca.State in [dsInsert, dsEdit] then
    //  sqlMarca.Cancel;
    //if SQLConLocal.InTransaction then
    //  SQLConLocal.Rollback(TransDesc);
    //frmAtualiza.Close;
  end;
end;

procedure TfrmAtualiza.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
