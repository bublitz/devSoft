unit untPendencia;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, Db, IBCustomDataSet, IBQuery;

type
  TfrmPendencia = class(TForm)
    DBGrid1: TDBGrid;
    Label1: TLabel;
    EditPesq: TEdit;
    dsFaturas: TDataSource;
    qryFaturas: TIBQuery;
    DBGrid2: TDBGrid;
    qryFaturasNUMERO: TIntegerField;
    qryFaturasDATAVENCIMENTO: TDateTimeField;
    qryFaturasVALOR: TFloatField;
    qryFaturasDESCRICAO: TIBStringField;
    Label2: TLabel;
    procedure EditPesqChange(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPendencia: TfrmPendencia;

implementation

uses untDtMod, untRec;

{$R *.DFM}

procedure TfrmPendencia.EditPesqChange(Sender: TObject);
begin
  dtMod.tbSocio.Locate ('Nome', EditPesq.Text, [loCaseInsensitive, loPartialkey]);
end;

procedure TfrmPendencia.DBGrid2DblClick(Sender: TObject);
var
  fatura: integer;

begin
  qryFaturas.DisableControls;
  fatura := qryFaturasNUMERO.Value;
  dtMod.tbReceb.Locate('NUMERO', fatura, [] );
  Application.CreateForm(TfrmRec, frmRec);
  frmRec.btnBaixar.Visible := True;
  frmRec.Panel1.Enabled    := False;
  frmRec.PanDados.Enabled  := False;
  frmRec.Height            := 426;
  frmRec.Panel1.Top        := 255;
  frmRec.ShowModal;
  qryFaturas.EnableControls;
end;

procedure TfrmPendencia.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
