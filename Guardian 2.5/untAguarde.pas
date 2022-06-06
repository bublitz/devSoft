unit untAguarde;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls, RXCtrls, Db, IBCustomDataSet, IBQuery;

type
  TfrmAguarde = class(TForm)
    lblMens: TRxLabel;
    dsAtual: TDataSource;
    qrAtual: TIBQuery;
    btnFechar: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAguarde: TfrmAguarde;

implementation

uses untDtMod, untFuncoes;

{$R *.DFM}

procedure TfrmAguarde.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmAguarde.FormActivate(Sender: TObject);
begin

  Screen.Cursor := crSQLWait;
  frmAguarde.Refresh;

  qrAtual.ParamByName('DATA').AsDate := Date;
  qrAtual.ExecSQL;

  qrAtual.SQL.Clear;
  qrAtual.SQL.Add('update socio set situacao=''L'' where codigosocio=0');
  qrAtual.ExecSQL;


  if dtMod.IBTrans.InTransaction then
    dtMod.IBTrans.CommitRetaining;

  Screen.Cursor := crDefault;
  lblMens.Caption := 'Atualização terminada !!';
  frmAguarde.Refresh;

  btnFechar.enabled := true;
  btnFechar.SetFocus;
  btnFechar.Click;

end;

procedure TfrmAguarde.btnFecharClick(Sender: TObject);
begin
  Close;
end;

end.
