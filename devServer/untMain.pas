unit untMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ScktComp;

type
  TForm1 = class(TForm)
    sktServer: TServerSocket;
    Memo1: TMemo;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure sktServerClientConnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure sktServerAccept(Sender: TObject; Socket: TCustomWinSocket);
    procedure sktServerClientRead(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure sktServerClientDisconnect(Sender: TObject;
      Socket: TCustomWinSocket);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  sktServer.Active := not sktServer.Active;
  if sktServer.Active then
    Button1.Caption := 'Desativar'
  else
    Button1.Caption := 'Ativar';
end;

procedure TForm1.sktServerClientConnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  Memo1.Lines.Add(format(
     'Tentativa de conec��o da Esta��o %s:%d.',
     [Socket.RemoteAddress, Socket.RemotePort]));
end;

procedure TForm1.sktServerAccept(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  if Socket.RemotePort <> 0 then
    Memo1.Lines.Add(format(
       'Esta��o %s:%d conectada.',
       [Socket.RemoteAddress, Socket.RemotePort]));
end;

procedure TForm1.sktServerClientRead(Sender: TObject;
  Socket: TCustomWinSocket);
var
  mens: string;

begin
  mens := Socket.ReceiveText;
  Memo1.Lines.Add(format(
     '[%s:%d]: %s',
     [Socket.RemoteAddress, Socket.RemotePort, mens]));
  if Copy(mens, 1, 3) = 'AS:' then
    if MessageDlg('Confirma abertura?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      Socket.SendText('OK')
    else
      Socket.SendText('NO');
end;

procedure TForm1.sktServerClientDisconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  Memo1.Lines.Add(format(
     'Esta��o %s:%d desconectou.',
     [Socket.RemoteAddress, Socket.RemotePort]));
end;

end.
