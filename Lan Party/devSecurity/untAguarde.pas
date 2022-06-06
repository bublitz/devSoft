unit untAguarde;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ScktComp;

type
  TfrmAguarde = class(TForm)
    Label1: TLabel;
    BitBtn1: TBitBtn;
    sktClient: TClientSocket;
    procedure sktClientConnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure sktClientRead(Sender: TObject; Socket: TCustomWinSocket);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure sktClientError(Sender: TObject; Socket: TCustomWinSocket;
      ErrorEvent: TErrorEvent; var ErrorCode: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAguarde: TfrmAguarde;

implementation

uses untMain;

{$R *.dfm}

procedure TfrmAguarde.sktClientConnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  sktClient.Socket.SendText('SQ:');
end;

procedure TfrmAguarde.sktClientRead(Sender: TObject;
  Socket: TCustomWinSocket);
var
  mens: string;

begin
  mens := Socket.ReceiveText;
  if Copy(mens, 1, 3) = 'EU:' then
  begin
    frmMain.mensagem := mens;

  end
  else
    BitBtn1.ModalResult := mrCancel;

  sktClient.Active := False;
  Label1.Caption := 'Verificação completa!';
  BitBtn1.Enabled := True;
end;

procedure TfrmAguarde.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmAguarde.FormShow(Sender: TObject);
begin
  sktClient.Active  := False;
  sktClient.Address := frmMain.ipserver;
  try
    sktClient.Active  := True;
  except
    ShowMessage('Não foi possível conectar ao servidor!');
  end;
end;

procedure TfrmAguarde.sktClientError(Sender: TObject;
  Socket: TCustomWinSocket; ErrorEvent: TErrorEvent;
  var ErrorCode: Integer);
begin
  BitBtn1.ModalResult := mrCancel;
end;

end.
