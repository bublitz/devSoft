unit untPesqTReparo;

interface

uses
  SysUtils, Types, Classes, QGraphics, QControls, QForms, QDialogs,
  QStdCtrls, QGrids, QDBGrids, QExtCtrls, DB, QButtons;

type
  TfrmPesqTReparo = class(TForm)
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
    codTReparo: integer;
  end;

var
  frmPesqTReparo: TfrmPesqTReparo;

implementation

uses untDatMod;

{$R *.xfm}

procedure TfrmPesqTReparo.edtPesqChange(Sender: TObject);
begin
  if edtPesq.Text <> '' then
    dtMod.sqlTRepar.Locate('DESCRICAO', edtPesq.Text, [loCaseInsensitive, loPartialKey]);
end;

procedure TfrmPesqTReparo.btnOkClick(Sender: TObject);
begin
  codTReparo := dtMod.sqlTReparCODIGOTIPOREPARO.AsInteger;
end;

procedure TfrmPesqTReparo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
