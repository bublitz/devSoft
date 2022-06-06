unit untPesqTAbast;

interface

uses
  SysUtils, Types, Classes, QGraphics, QControls, QForms, QDialogs,
  QStdCtrls, QGrids, QDBGrids, QExtCtrls, DB, QButtons;

type
  TfrmPesqTAbast = class(TForm)
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
    codTAbast: integer;
    valTAbast: real;
  end;

var
  frmPesqTAbast: TfrmPesqTAbast;

implementation

uses untDatMod;

{$R *.xfm}

procedure TfrmPesqTAbast.edtPesqChange(Sender: TObject);
begin
  if edtPesq.Text <> '' then
    dtMod.sqlTAbast.Locate('DESCRICAO', edtPesq.Text, [loCaseInsensitive, loPartialKey]);
end;

procedure TfrmPesqTAbast.btnOkClick(Sender: TObject);
begin
  codTAbast := dtMod.sqlTAbastCODIGOTIPOABAST.AsInteger;
  valTAbast := dtMod.sqlTAbastVALOR.Value;
end;

procedure TfrmPesqTAbast.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
