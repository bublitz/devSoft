unit untMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ScktComp, StdCtrls, IniFiles, Buttons, ImgList, Menus, ExtCtrls,
  XPMan;

type
  TfrmMain = class(TForm)
    Client: TClientSocket;
    btnProximo: TSpeedButton;
    btnMesmo: TSpeedButton;
    TrayIcon: TTrayIcon;
    PopupMenu1: TPopupMenu;
    ImageList1: TImageList;
    ChamaroPrximo1: TMenuItem;
    Same: TMenuItem;
    XPManifest1: TXPManifest;
    procedure btnProximoClick(Sender: TObject);
    procedure ClientRead(Sender: TObject; Socket: TCustomWinSocket);
    procedure FormCreate(Sender: TObject);
    procedure ClientError(Sender: TObject; Socket: TCustomWinSocket;
      ErrorEvent: TErrorEvent; var ErrorCode: Integer);
    procedure btnMesmoClick(Sender: TObject);
    procedure ClientDisconnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure ClientConnect(Sender: TObject; Socket: TCustomWinSocket);
  private
    { Private declarations }
    procedure WMMove(var Msg: TWMMove); message WM_MOVE;
  public
    { Public declarations }
    senha: integer;
    num_mesa: String;
    especial: boolean;
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

function StrZero(Num: Real; Zeros, Deci: integer): string;
var
  tam, z: integer;
  res, zer: string;

begin
  Str(Num: Zeros: Deci, res);
  res := Trim(res);
  tam := Length(res);
  zer := '';
  for z := 1 to (Zeros - tam) do
    zer := zer + '0';
  Result := zer + res;
end;

procedure TfrmMain.btnProximoClick(Sender: TObject);
begin
  if Client.Active then
    Client.Socket.SendText('NS' + num_mesa)
  else
  begin
    Application.MessageBox('Erro ao conectar ao servidor...', 'Erro', MB_OK+MB_ICONERROR);
    Application.Terminate;
  end;
end;

procedure TfrmMain.ClientConnect(Sender: TObject; Socket: TCustomWinSocket);
var
  s: string;

begin
  s := Socket.ReceiveText;
  especial := (Copy(s, 1, 2) = 'SE');
  if especial then  
    Caption := 'ESPE ' + num_mesa
  else
    Caption := 'Mesa ' + num_mesa;
end;

procedure TfrmMain.ClientDisconnect(Sender: TObject; Socket: TCustomWinSocket);
begin
  Application.MessageBox('Erro ao conectar ao servidor...', 'Erro', MB_OK+MB_ICONERROR);
  Application.Terminate;
end;

procedure TfrmMain.ClientError(Sender: TObject; Socket: TCustomWinSocket;
  ErrorEvent: TErrorEvent; var ErrorCode: Integer);
begin
  if ErrorCode = 10061 then
  begin
    Application.MessageBox('Erro ao conectar ao servidor...', 'Erro', MB_OK +
      MB_ICONERROR);
    Application.Terminate;
  end
  else
    ShowMessage('Erro nº ' + IntToStr(ErrorCode) + #13'Chame o Suporte!!');
  ErrorCode := 0;
end;

procedure TfrmMain.ClientRead(Sender: TObject; Socket: TCustomWinSocket);
var
  s: string;

begin
  s := Socket.ReceiveText;
  if Copy(s, 1, 2) = 'OK' then
  begin
    senha := StrToInt(Copy(s, 3, 9));
    btnMesmo.Caption := 'Chamar o Mesmo (' + IntToStr(senha) + ')';
    Same.Caption := 'Chamar o Mesmo (' + IntToStr(senha) + ')';
  end;
  //Memo1.Lines.Add(s);
end;

procedure TfrmMain.FormCreate(Sender: TObject);
var
  ini: TIniFile;
  mesa: Integer;

begin
  ini := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Params.ini');
  Client.Port := ini.ReadInteger('Config', 'Porta', 3000);
  Client.Host := ini.ReadString('Config', 'Servidor', '');
  mesa := ini.ReadInteger('Config', 'Mesa', 0);
  ini.Free;
  num_mesa := StrZero(mesa, 2, 0);
  senha := 0;
  Left := Screen.Width - Width;
  Top := Screen.Height - Height - 30;
  Caption := 'Mesa ' + num_mesa;
  Client.Open;
end;

procedure TfrmMain.WMMove(var Msg: TWMMove);
begin
  if Left < 0 then
    Left := 0;
  if Top < 0 then
    Top := 0;
  if Screen.Width - (Left + Width) < 0 then
    Left := Screen.Width - Width;
  if Screen.Height - (Top + Height) < 0 then
    Top := Screen.Height - Height;
end;

procedure TfrmMain.btnMesmoClick(Sender: TObject);
begin
  if senha > 0 then
    Client.Socket.SendText('CS' + num_mesa + IntToStr(senha));
end;

end.
