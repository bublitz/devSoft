unit untPesqMarca;

interface

uses
  SysUtils, Types, Classes, QGraphics, QControls, QForms, QDialogs,
  QStdCtrls, QGrids, QDBGrids, QExtCtrls, DB, QButtons;

type
  TfrmPesqMarca = class(TForm)
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
    codMarca: integer;
  end;

var
  frmPesqMarca: TfrmPesqMarca;

implementation

uses untDatMod;

{$R *.xfm}

procedure TfrmPesqMarca.edtPesqChange(Sender: TObject);
begin
  if edtPesq.Text <> '' then
    dtMod.sqlMarca.Locate('DESCRICAO', edtPesq.Text, [loCaseInsensitive, loPartialKey]);
end;

procedure TfrmPesqMarca.btnOkClick(Sender: TObject);
begin
  codMarca := dtMod.sqlMarcaCODIGOMARCA.AsInteger;
end;

procedure TfrmPesqMarca.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
