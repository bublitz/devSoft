unit untPesqModelo;

interface

uses
  SysUtils, Types, Classes, QGraphics, QControls, QForms, QDialogs,
  QStdCtrls, QGrids, QDBGrids, QExtCtrls, DB, QButtons;

type
  TfrmPesqClientes = class(TForm)
    Panel1: TPanel;
    edtPesq: TEdit;
    DBGrid1: TDBGrid;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    procedure edtPesqChange(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    codModelo: integer;
  end;

var
  frmPesqClientes: TfrmPesqClientes;

implementation

uses untDatMod;

{$R *.xfm}

procedure TfrmPesqClientes.edtPesqChange(Sender: TObject);
begin
  if edtPesq.Text <> '' then
    dtMod.sqlModelo.Locate('DESCRICAO', edtPesq.Text, [loCaseInsensitive, loPartialKey]);
end;

procedure TfrmPesqClientes.btnOkClick(Sender: TObject);
begin
  codModelo := dtMod.sqlModeloCODIGOMODELO.AsInteger;
end;

procedure TfrmPesqClientes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
