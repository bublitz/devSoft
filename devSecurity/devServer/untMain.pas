unit untMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ScktComp, Menus;

type
  TForm1 = class(TForm)
    sktServer: TServerSocket;
    Memo1: TMemo;
    Button1: TButton;
    MainMenu1: TMainMenu;
    Arquivo1: TMenuItem;
    Sair1: TMenuItem;
    abelas1: TMenuItem;
    Usurios1: TMenuItem;
    N1: TMenuItem;
    Senha1: TMenuItem;
    Ajuda1: TMenuItem;
    Sobre1: TMenuItem;
    Estaes1: TMenuItem;
    procedure Button1Click(Sender: TObject);
    procedure sktServerClientConnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure sktServerAccept(Sender: TObject; Socket: TCustomWinSocket);
    procedure sktServerClientRead(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure sktServerClientDisconnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure Sobre1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses Sobre;

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
     'Tentativa de conecção da Estação %s:%d.',
     [Socket.RemoteAddress, Socket.RemotePort]));
end;

procedure TForm1.sktServerAccept(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  if Socket.RemotePort <> 0 then
    Memo1.Lines.Add(format(
       'Estação %s:%d conectada.',
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
     'Estação %s:%d desconectou.',
     [Socket.RemoteAddress, Socket.RemotePort]));
end;

procedure TForm1.Sobre1Click(Sender: TObject);
begin
  AboutBox.ShowModal;
end;

end.
