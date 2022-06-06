unit untPesqSocio;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, Buttons, Db;

type
  TfrmPesqSocio = class(TForm)
    Label1: TLabel;
    DBGrid1: TDBGrid;
    EditPesq: TEdit;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    procedure EditPesqChange(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPesqSocio: TfrmPesqSocio;

implementation

uses untDtMod;

{$R *.DFM}

procedure TfrmPesqSocio.EditPesqChange(Sender: TObject);
begin
  dtMod.tbSocio.Locate('Nome', EditPesq.Text, [loCaseInsensitive, loPartialkey]);
end;

procedure TfrmPesqSocio.SpeedButton1Click(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmPesqSocio.SpeedButton2Click(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmPesqSocio.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
