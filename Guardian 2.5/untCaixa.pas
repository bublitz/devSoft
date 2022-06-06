unit untCaixa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, RXDBCtrl, Db, StdCtrls, Buttons;

type
  TfrmCaixa = class(TForm)
    RxDBGrid1: TRxDBGrid;
    btnIncluir: TButton;
    btnEditar: TButton;
    BitBtn3: TBitBtn;
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure FormShow(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCaixa: TfrmCaixa;
  controle: integer;

implementation

uses untDtMod, untLanctoCaixa;

{$R *.DFM}

procedure TfrmCaixa.RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if dtMod.qrCxAtualTIPOLANCTO.Value = 'A' then
  begin
    Background := clRed;
    AFont.Color := clWhite;
  end
  else
  begin
    Background := clWhite;
    AFont.Color := clBlack;
  end;
end;

procedure TfrmCaixa.FormShow(Sender: TObject);
begin
  dtMod.tbOpenClose.Last;
  controle := dtMod.tbOpenCloseCONTROLECAIXA.Value;
  dtMod.qrCxAtual.Close;
  dtMod.qrCxAtual.ParamByName('num_control').Value := controle;
  dtMod.qrCxAtual.Open;
end;

procedure TfrmCaixa.btnIncluirClick(Sender: TObject);
begin
  dtMod.tbCaixa.Append;
  Application.CreateForm(TfrmLanctoCaixa, frmLanctoCaixa);
  if frmLanctoCaixa.ShowModal = mrOk then
  begin
    if dtMod.tbCaixa.State in [dsEdit,dsInsert] then
      dtMod.tbCaixa.Post;
    dtMod.ApplyUpdates( dtMod.tbCaixa );
    dtMod.qrCxAtual.Close;
    dtMod.qrCxAtual.Open;
  end
  else
    dtMod.tbCaixa.Cancel;
end;

procedure TfrmCaixa.btnEditarClick(Sender: TObject);
begin
  if dtMod.qrCxAtualTIPOLANCTO.Value = 'A' then
    raise exception.Create('Não é possível alterar este lançamento !!')
  else
  begin
    dtMod.tbCaixa.Locate('CONTROLE',dtMod.qrCxAtualCONTROLE.Value,[]);
    dtMod.tbCaixa.Edit;
    Application.CreateForm(TfrmLanctoCaixa, frmLanctoCaixa);
    if frmLanctoCaixa.ShowModal = mrOk then
    begin
      if dtMod.tbCaixa.State in [dsEdit,dsInsert] then
        dtMod.tbCaixa.Post;
      dtMod.ApplyUpdates( dtMod.tbCaixa );
      dtMod.qrCxAtual.Close;
      dtMod.qrCxAtual.Open;
    end
    else
      dtMod.tbCaixa.Cancel;
  end;
end;

procedure TfrmCaixa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
