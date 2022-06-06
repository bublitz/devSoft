unit untBusca;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBClient, ComCtrls, DB, Grids, DBGrids, StdCtrls, Buttons,
  ExtCtrls;

type
  TfrmBusca = class(TForm)
    DBGrid: TDBGrid;
    dsBusca: TDataSource;
    StatBar: TStatusBar;
    Panel1: TPanel;
    labTitulo: TLabel;
    edtPesq: TEdit;
    btnPesq: TBitBtn;
    procedure DBGridDblClick(Sender: TObject);
    procedure btnPesqClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGridKeyPress(Sender: TObject; var Key: Char);
    procedure edtPesqKeyPress(Sender: TObject; var Key: Char);
    function OnlyOne: boolean;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBusca: TfrmBusca;

implementation

{$R *.dfm}

procedure TfrmBusca.DBGridDblClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmBusca.btnPesqClick(Sender: TObject);
begin
  // DBClient no uses
  if Length(edtPesq.Text) > 2 then
  begin
    with TClientDataSet(dsBusca.DataSet) do
    begin
      Close;
      Params[0].Value := edtPesq.Text + '%';
      if Params.Count = 2 then
        Params[1].Value := edtPesq.Text + '%';   
      Open;
      StatBar.SimpleText := Format('%d registro(s) encontrados com "%s"',
        [RecordCount, edtPesq.Text]);
      if RecordCount = 1 then
        ModalResult := mrOk
      else
        DBGrid.SetFocus;
    end;
  end
  else
    MessageDlg('Preencha ao menos 3 (três) caracteres!', mtWarning, [mbOk], 0);
end;

procedure TfrmBusca.FormShow(Sender: TObject);
begin
  if edtPesq.Text <> '' then
    btnPesq.Click
  else
    edtPesq.SetFocus;
end;

procedure TfrmBusca.DBGridKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    DBGridDblClick(Sender);
end;

procedure TfrmBusca.edtPesqKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    btnPesq.Click;
end;

function TfrmBusca.OnlyOne: boolean;
begin
  if Length(edtPesq.Text) > 2 then
  begin
    with TClientDataSet(dsBusca.DataSet) do
    begin
      Close;
      Params[0].Value := edtPesq.Text + '%';
      Open;
      Result := (RecordCount = 1);
    end;
  end
  else
    Result := False;
end;

end.

