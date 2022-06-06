unit untLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Buttons, StdCtrls, ExtCtrls, ScktComp;

type
  TfrmLogin = class(TForm)
    edtUser: TLabeledEdit;
    edtSenha: TLabeledEdit;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Animate1: TAnimate;
    StatusBar1: TStatusBar;
    sktClient: TClientSocket;
    edtIP: TLabeledEdit;
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure sktClientRead(Sender: TObject; Socket: TCustomWinSocket);
    procedure sktClientConnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure sktClientError(Sender: TObject; Socket: TCustomWinSocket;
      ErrorEvent: TErrorEvent; var ErrorCode: Integer);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}

procedure TfrmLogin.SpeedButton2Click(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmLogin.SpeedButton1Click(Sender: TObject);
begin
  Animate1.Visible := True;
  Animate1.CommonAVI := aviFindComputer;
  Animate1.Active  := True;
  StatusBar1.SimpleText := 'Aguarde... Localizando servidor...';
  sktClient.Active := False;
  sktClient.Address := edtIP.Text;
  sktClient.Active := True;
end;

procedure TfrmLogin.sktClientRead(Sender: TObject;
  Socket: TCustomWinSocket);
var
  ok: boolean;

begin
  if Socket.ReceiveText = 'OK' then
    ok := True
  else
    ok := False;

  if ok then
  begin
    StatusBar1.SimpleText := 'Autorização concedida!';
    sleep(500);
    ModalResult := mrOk;
  end
  else
  begin
    StatusBar1.SimpleText := 'Autorização NÃO concedida!';
    sleep(500);
    ModalResult := mrCancel;
  end;
end;

procedure TfrmLogin.sktClientConnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  StatusBar1.SimpleText := 'Enviando pedido de autorização...';
  sktClient.Socket.SendText('AS: ' + edtUser.Text );
  Animate1.CommonAVI := aviFindFolder;
  Animate1.Active  := True;
  StatusBar1.SimpleText := 'Aguardando autorização...';
end;

procedure TfrmLogin.sktClientError(Sender: TObject;
  Socket: TCustomWinSocket; ErrorEvent: TErrorEvent;
  var ErrorCode: Integer);
begin
  Animate1.Active  := False;
  Animate1.Visible := False;
  ShowMessage('Não foi possível conectar ao servidor!');
end;

procedure TfrmLogin.FormShow(Sender: TObject);
begin
  Animate1.Active  := False;
  Animate1.Visible := False;
end;

procedure TfrmLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if sktClient.Active then
    sktClient.Active := False;
end;

end.
