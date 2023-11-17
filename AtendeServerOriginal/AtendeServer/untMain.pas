unit untMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, XPMan, StdCtrls, Mask, Buttons, Spin, Sockets, ComCtrls, ScktComp,
  IniFiles, AutoUpdate;

type
  TfrmMain = class(TForm)
    edtData: TMaskEdit;
    Label1a: TLabel;
    XPManifest1: TXPManifest;
    chkEspecial: TCheckBox;
    btnIniciar: TBitBtn;
    btnParar: TBitBtn;
    GroupBox1: TGroupBox;
    Label2a: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    SpinEdit1: TSpinEdit;
    SpinEdit2: TSpinEdit;
    SpinEdit3: TSpinEdit;
    chkNova: TCheckBox;
    StatusBar1: TStatusBar;
    Memo1: TMemo;
    Server: TServerSocket;
    Label5: TLabel;
    edtSenha: TMaskEdit;
    btnTestar: TBitBtn;
    AutoUpdate1: TAutoUpdate;
    procedure btnIniciarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpinEdit1Change(Sender: TObject);
    procedure SpinEdit2Change(Sender: TObject);
    procedure SpinEdit3Change(Sender: TObject);
    procedure ServerListen(Sender: TObject; Socket: TCustomWinSocket);
    procedure ServerClientConnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure ServerClientDisconnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure ServerClientRead(Sender: TObject; Socket: TCustomWinSocket);
    procedure FormCreate(Sender: TObject);
    procedure edtDataExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnPararClick(Sender: TObject);
    procedure btnTestarClick(Sender: TObject);
    procedure AutoUpdate1NeedVersion(Sender: TObject;
      var DeployVersion: string);
    procedure ServerClientError(Sender: TObject; Socket: TCustomWinSocket;
      ErrorEvent: TErrorEvent; var ErrorCode: Integer);
    procedure chkEspecialClick(Sender: TObject);
    procedure chkNovaClick(Sender: TObject);
  private
    { Private declarations }
    //procedure AppMsg(var Msg: TMsg; var Handled: Boolean);
  public
    { Public declarations }
    arq_som: string;
  end;

var
  frmMain: TfrmMain;

implementation

uses untPainel, untDM;

{$R *.dfm}

//procedure TfrmMain.AppMsg(var Msg: TMsg; var Handled: Boolean);
//begin
//  if (Msg.Message = wm_SysCommand) and (Msg.wParam = sc_ScreenSave) then
//    Handled := true;
//end;

procedure TfrmMain.AutoUpdate1NeedVersion(Sender: TObject;
  var DeployVersion: string);
begin
  DeployVersion := '1.0.1.1';
end;

procedure TfrmMain.btnIniciarClick(Sender: TObject);
var
  senha: integer;

begin
  if frmPainel = nil then
    Application.CreateForm(TfrmPainel, frmPainel);

  if DM.cdsData.FindKey([StrToDate(edtData.Text)]) then
  begin
    if chkNova.Checked then
      senha := 0
    else
      senha := StrToInt('0' + Trim(edtSenha.Text));

    if senha >= 0 then
    begin
      DM.cdsData.Edit;
      DM.cdsDataSENHA_ATUAL.Value := senha;
      DM.cdsData.Post;
      DM.cdsData.ApplyUpdates(0);
    end;
  end
  else
  begin
    DM.cdsData.Append;
    DM.cdsDataDATA.Value := StrToDate(edtData.Text);
    DM.cdsDataSENHA_ATUAL.Value := 0;
    DM.cdsData.Post;
    DM.cdsData.ApplyUpdates(0);
  end;

  Memo1.Lines.Insert(0, 'Senha Atual: ' + DM.cdsDataSENHA_ATUAL.AsString);

  Server.Active := True;
  btnIniciar.Enabled := False;
  btnParar.Enabled := True;
  btnTestar.Enabled := True;
  frmPainel.Show;       
  frmPainel.WindowState := wsMaximized;
end;

procedure TfrmMain.btnPararClick(Sender: TObject);
begin
  //Server.Active := False;
  frmPainel.labMesa.Caption := '';
  frmPainel.labSenha.Caption := '';
  if frmPainel.Showing then
    frmPainel.Close;
  Memo1.Lines.Insert(0, 'Servidor desativado');
  btnIniciar.Enabled := True;
  btnParar.Enabled := False;
  btnTestar.Enabled := False;
end;

procedure TfrmMain.btnTestarClick(Sender: TObject);
begin
  frmPainel.Alarme('000', '000', chkEspecial.Checked);
end;

procedure TfrmMain.chkEspecialClick(Sender: TObject);
begin
  if frmPainel <> nil then
    frmPainel.Especial1.Checked := chkEspecial.Checked;
end;

procedure TfrmMain.chkNovaClick(Sender: TObject);
begin
  edtSenha.Enabled := not chkNova.Checked;
  if edtSenha.Enabled then
    edtSenha.SetFocus
  else
    edtSenha.Clear;
end;

procedure TfrmMain.edtDataExit(Sender: TObject);
var
  data: TDate;

begin
  try
    data := StrToDate(edtData.Text);
  except
    edtData.SetFocus;
  end;
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
var
  ini: TIniFile;

begin
  ini := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Params.ini');
  ini.WriteInteger('Config', 'Fonte1', SpinEdit1.Value);
  ini.WriteInteger('Config', 'Fonte2', SpinEdit2.Value);
  ini.WriteInteger('Config', 'Fonte3', SpinEdit3.Value);
  ini.Free;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  //Application.OnMessage := AppMsg;
  // Ativa Proteção de Tela
  //SendMessage(Application.Handle, WM_SYSCOMMAND, SC_SCREENSAVE, 0);
  //AutoUpdate1.Execute;
  Randomize;
  ShortDateFormat := 'dd/MM/yyyy';
  edtData.Text := DateToStr(Now);
end;

procedure TfrmMain.FormShow(Sender: TObject);
var
  ini: TIniFile;

begin
  ini := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Params.ini');
  SpinEdit1.Value := ini.ReadInteger('Config', 'Fonte1', 100);
  SpinEdit2.Value := ini.ReadInteger('Config', 'Fonte2', 40);
  SpinEdit3.Value := ini.ReadInteger('Config', 'Fonte3', 34);
  arq_som := ini.ReadString('Sons', 'Alerta', '');
  ini.Free;
end;

procedure TfrmMain.ServerClientConnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  Memo1.Lines.Insert(0, 'Cliente conectou: ' + Socket.RemoteAddress);
  if chkEspecial.Checked then
    Socket.SendText('SE')
  else
    Socket.SendText('SN')
end;

procedure TfrmMain.ServerClientDisconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  Memo1.Lines.Insert(0, 'Cliente desconectou: ' + Socket.RemoteAddress);
end;

procedure TfrmMain.ServerClientError(Sender: TObject; Socket: TCustomWinSocket;
  ErrorEvent: TErrorEvent; var ErrorCode: Integer);
begin
  Memo1.Lines.Insert(0, 'Erro ' + Socket.RemoteAddress + ' : ' + IntToStr(ErrorCode));
  ErrorCode := 0;
end;

procedure TfrmMain.ServerClientRead(Sender: TObject; Socket: TCustomWinSocket);
var
  s, comando, mesa, senha: string;
  data: TDate;
  atual: integer;

begin
  s := Socket.ReceiveText;
//  while frmPainel.tocando do
//  begin
//    Application.ProcessMessages;
//    Sleep(1);
//  end;

  Memo1.Lines.Insert(0, '> ' + Socket.RemoteAddress + ' : ' + s);
  comando := Copy(s, 1, 2);
  mesa := Copy(s, 3, 2);
  senha := Copy(s, 5, 4);
  data := StrToDate(edtData.Text);
  if comando = 'NS' then // Nova Senha
  begin
    if DM.cdsData.FindKey([data]) then
    begin
      atual := DM.cdsDataSENHA_ATUAL.Value + 1;
      DM.cdsData.Edit;
      DM.cdsDataSENHA_ATUAL.Value := atual;
      DM.cdsData.Post;
      DM.cdsData.ApplyUpdates(0);
      Socket.SendText('OK' + IntToStr(atual)); // retorna a senha atual
      frmPainel.Alarme(IntToStr(atual), mesa, chkEspecial.Checked);
    end;
//    DM.cdsAtend.Append;
//    DM.cdsAtendESTACAO.AsString := Socket.RemoteAddress + ' (' + mesa + ')';
//    DM.cdsAtendSENHA.AsString := senha;
//    DM.cdsAtend.Post;
//    DM.cdsAtend.ApplyUpdates(0);
  end
  else
  if comando = 'CS' then // Chama Senha
  begin
    frmPainel.Alarme(senha, mesa, chkEspecial.Checked);
    Socket.SendText('OK' + senha); // retorna a senha atual
  end
  else
  if comando = 'CA' then // Cancela Senha e Chama uma Nova
  begin
    if DM.cdsData.FindKey([data]) then
    begin
      atual := DM.cdsDataSENHA_ATUAL.Value + 1;
      DM.cdsData.Edit;
      DM.cdsDataSENHA_ATUAL.Value := atual;
      DM.cdsData.Post;
      DM.cdsData.ApplyUpdates(0);
      Socket.SendText('OK' + IntToStr(atual)); // retorna a senha atual
      frmPainel.Alarme(IntToStr(atual), mesa, chkEspecial.Checked);
    end;
  end;
  Sleep(500);
end;

procedure TfrmMain.ServerListen(Sender: TObject; Socket: TCustomWinSocket);
begin
  Memo1.Lines.Insert(0, 'Servidor ativo - porta ' + IntToStr(Server.Port));
end;

procedure TfrmMain.SpinEdit1Change(Sender: TObject);
begin
  if frmPainel <> nil then
  begin
    frmPainel.labSenha.Font.Size := SpinEdit1.Value;
    frmPainel.SpinEdit1.Value := SpinEdit1.Value;
  end;
end;

procedure TfrmMain.SpinEdit2Change(Sender: TObject);
begin
  if frmPainel <> nil then
  begin
    frmPainel.labMesa.Font.Size := SpinEdit2.Value;
    frmPainel.SpinEdit2.Value := SpinEdit2.Value;
  end;
end;

procedure TfrmMain.SpinEdit3Change(Sender: TObject);
begin
  if frmPainel <> nil then
  begin
    frmPainel.Label1.Font.Size := SpinEdit3.Value;
    frmPainel.Label2.Font.Size := SpinEdit3.Value;
    frmPainel.SpinEdit3.Value := SpinEdit3.Value;
  end;
end;

end.
