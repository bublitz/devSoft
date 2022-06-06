unit untPesqTManut;

interface

uses
  SysUtils, Types, Classes, QGraphics, QControls, QForms, QDialogs,
  QStdCtrls, QGrids, QDBGrids, QExtCtrls, DB, QButtons;

type
  TfrmPesqTManut = class(TForm)
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
    codTManut: integer;
    valTManut: real;
  end;

var
  frmPesqTManut: TfrmPesqTManut;

implementation

uses untDatMod;

{$R *.xfm}

procedure TfrmPesqTManut.edtPesqChange(Sender: TObject);
begin
  if edtPesq.Text <> '' then
    dtMod.sqlTManu.Locate('DESCRICAO', edtPesq.Text, [loCaseInsensitive, loPartialKey]);
end;

procedure TfrmPesqTManut.btnOkClick(Sender: TObject);
begin
  codTManut := dtMod.sqlTManuCODIGOTIPOMANUT.AsInteger;
  valTManut := dtMod.sqlTManuVALOR.Value;
end;

procedure TfrmPesqTManut.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
