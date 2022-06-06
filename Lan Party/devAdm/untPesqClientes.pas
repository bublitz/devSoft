unit untPesqClientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls,DB;

type
  TfrmPesqClientes = class(TForm)
    Panel1: TPanel;
    edtPesq: TEdit;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    DBGrid1: TDBGrid;
    procedure edtPesqChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
   codCliente:Integer;
  end;

var
  frmPesqClientes: TfrmPesqClientes;

implementation

uses untDatModPrinc;

{$R *.dfm}

procedure TfrmPesqClientes.edtPesqChange(Sender: TObject);
begin
  if edtPesq.Text <> '' then
    dmPrinc.sqlPesqCliente.Locate('NOMECOMPLETO', edtPesq.Text, [loCaseInsensitive, loPartialKey]);

end;

procedure TfrmPesqClientes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
  dmPrinc.sqlPesqCliente.Close;
end;

procedure TfrmPesqClientes.btnOkClick(Sender: TObject);
begin
  codCliente := dmPrinc.sqlPesqClienteCODIGOCLIENTE.AsInteger;
end;

procedure TfrmPesqClientes.FormCreate(Sender: TObject);
begin
  dmPrinc.sqlPesqCliente.Open;
end;

end.
