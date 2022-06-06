unit untMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, StdCtrls, Menus, ComCtrls, ImgList, ExtCtrls,
  DBClient, Buttons, ToolWin, ShellAPI;

type
  TfrmMain = class(TForm)
    MainMenu1: TMainMenu;
    Configurao1: TMenuItem;
    Ligar1: TMenuItem;
    Desligar1: TMenuItem;
    N1: TMenuItem;
    Adicionarcone1: TMenuItem;
    N2: TMenuItem;
    Explorer1: TMenuItem;
    N3: TMenuItem;
    Fechar1: TMenuItem;
    ImageList1: TImageList;
    Label1: TLabel;
    Aes1: TMenuItem;
    Desligar2: TMenuItem;
    Reiniciar1: TMenuItem;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    btnLogin: TToolButton;
    btnLogout: TToolButton;
    ToolButton4: TToolButton;
    btnAtiva: TToolButton;
    btnDesativa: TToolButton;
    ToolButton7: TToolButton;
    ImageList2: TImageList;
    lblTempo: TLabel;
    lblUser: TLabel;
    Timer1: TTimer;
    Label2: TLabel;
    Label3: TLabel;
    ToolButton2: TToolButton;
    ListView1: TListView;
    Image1: TImage;
    Sobre1: TMenuItem;
    Sobre2: TMenuItem;
    procedure Liga(Sender: TObject);
    procedure Desliga(Sender: TObject; MudaIni: boolean);
    procedure FormShow(Sender: TObject);
    procedure Explorer1Click(Sender: TObject);
    procedure Fechar1Click(Sender: TObject);
    procedure Adicionarcone1Click(Sender: TObject);
    procedure LeIcones(Sender: TObject);
    procedure btnAtivaClick(Sender: TObject);
    procedure btnDesativaClick(Sender: TObject);
    procedure Desligar1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure Desligar2Click(Sender: TObject);
    procedure Reiniciar1Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure btnLoginClick(Sender: TObject);
    procedure btnLogoutClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ListView1DblClick(Sender: TObject);
    procedure Sobre2Click(Sender: TObject);
  private
    { Private declarations }
    podeFechar: boolean;
    tempoinicial: TTime;
    comando: TStringList;
    msdos:   TStringList;
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses untIncIcon, untDatMod, untFuncoes, untLogin, Sobre;

{$R *.dfm}

procedure TfrmMain.LeIcones(Sender: TObject);
var
  ico: TIcon;
  i, q: integer;

begin
  ico := TIcon.Create;
  dtMod.Local.First;
  while not dtMod.Local.Eof do
  begin
    if dtMod.LocalATALHO.AsString <> '' then
    begin
      if dtMod.LocalIcone.AsString <> '' then
        ico.LoadFromFile(ExtractFilePath(Application.ExeName)+'Icons\'+ dtMod.LocalICONE.AsString)
      else
        Ico.Handle := ExtractIcon(Handle, PChar(dtMod.LocalAtalho.AsString), 0);

      ImageList1.AddIcon(ico);

      i := ImageList1.Count - 1;

      ListView1.Items.Add;
      q := ListView1.Items.Count - 1;
      ListView1.Items[q].Caption := dtMod.LocalNOME.AsString;
      ListView1.Items[q].ImageIndex := i;
      comando.Add(dtMod.LocalATALHO.AsString);
      msdos.Add(dtMod.LocalMSDOS.AsString);
    end;
    dtMod.Local.Next;
  end;
end;

procedure TfrmMain.Liga(Sender: TObject);
var
  OldValue : LongBool;
  ini: TIniFile;

begin
  SystemParametersInfo(97, Word(True), @OldValue, 0);
  hideTaskBar;
  ShowWindow(FindWindow(nil, 'Program Manager'), SW_HIDE);
  ini := TIniFile.Create('system.ini');
  ini.WriteString('Boot','shell','Explore.exe');
  ini.Free;
  Ligar1.Enabled := False;
  Desligar1.Enabled := True;
end;

procedure TfrmMain.Desliga(Sender: TObject; MudaIni: boolean);
var
  OldValue : LongBool;
  ini: TIniFile;

begin
  SystemParametersInfo(97, Word(False), @OldValue, 0);
  showTaskBar;
  ShowWindow(FindWindow(nil, 'Program Manager'), SW_SHOW);
  if MudaIni then
  begin
    ini := TIniFile.Create('system.ini');
    ini.WriteString('Boot','shell','Explorer.exe');
    ini.Free;
  end;
  Ligar1.Enabled := True;
  Desligar1.Enabled := False;
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  ShowWindow(Application.Handle, SW_HIDE);
  SetWindowLong(Application.Handle, GWL_EXSTYLE,
                GetWindowLong(Application.Handle, GWL_EXSTYLE) or WS_EX_TOOLWINDOW
                and not WS_EX_APPWINDOW);
end;

procedure TfrmMain.Explorer1Click(Sender: TObject);
begin
  Executa('C:\WINDOWS\EXPLORER.EXE');
end;

procedure TfrmMain.Fechar1Click(Sender: TObject);
begin
  Desliga(Sender, True); // mudar para False
  podeFechar := True;
  Close;
end;

procedure TfrmMain.Adicionarcone1Click(Sender: TObject);
begin
  frmIncIcon.ShowModal;

  ListView1.Items.Clear;
  comando.Clear;
  msdos.Clear;
  LeIcones(Sender);
end;

procedure TfrmMain.btnAtivaClick(Sender: TObject);
begin
  // chama Contra-Senha
  Configurao1.Enabled    := True;
  btnAtiva.ImageIndex    := 9;
  btnAtiva.Enabled       := False;
  btnDesativa.ImageIndex := 6;
  btnDesativa.Enabled    := True;
end;

procedure TfrmMain.btnDesativaClick(Sender: TObject);
begin
  Configurao1.Enabled    := False;
  btnAtiva.ImageIndex    := 8;
  btnAtiva.Enabled       := True;
  btnDesativa.ImageIndex := 7;
  btnDesativa.Enabled    := False;
end;

procedure TfrmMain.Desligar1Click(Sender: TObject);
begin
  Desliga(Sender, True);
end;

procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  canClose := podeFechar;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  Liga(Sender);
  podeFechar := False;
end;

procedure TfrmMain.Desligar2Click(Sender: TObject);
begin
  ExitWindowsEx(EWX_FORCE, EWX_POWEROFF);
end;

procedure TfrmMain.Reiniciar1Click(Sender: TObject);
begin
  ExitWindowsEx(EWX_FORCE, EWX_REBOOT);
end;

procedure TfrmMain.FormResize(Sender: TObject);
var
  lf : TLogFont;
  tf : TFont;
  
begin
  with frmMain.Canvas do
  begin
    Font.Name := 'Arial';
    Font.Size := 24;
    Font.Color := clBlack;
    tf := TFont.Create;
    tf.Assign(Font);
    GetObject(tf.Handle, sizeof(lf), @lf);
    lf.lfEscapement := 450;
    lf.lfOrientation := 450;
    tf.Handle := CreateFontIndirect(lf);
    Font.Assign(tf);
    TextOut(20, Height div 2, 'Texto Diagonal!');
    tf.Free;
  end;
end;

procedure TfrmMain.btnLoginClick(Sender: TObject);
begin
  frmLogin.edtUser.Text := '';
  frmLogin.edtSenha.Text := '';
  if frmLogin.ShowModal = mrOk then
  begin
    ListView1.Enabled := True;
    btnLogin.ImageIndex  := 1;
    btnLogin.Enabled     := False;
    btnLogout.ImageIndex := 2;
    btnLogout.Enabled    := True;
    lblUser.Caption      := UpperCase(frmLogin.edtUser.Text);
    lblTempo.Caption     := '';
    tempoinicial         := Time;
    Timer1.Enabled       := True;
  end;
end;

procedure TfrmMain.btnLogoutClick(Sender: TObject);
begin
  ListView1.Enabled := False;
  btnLogin.ImageIndex  := 0;
  btnLogin.Enabled     := True;
  btnLogout.ImageIndex := 3;
  btnLogout.Enabled    := False;
  Timer1.Enabled       := False;
  lblUser.Caption      := '';
  lblTempo.Caption     := '';
end;

procedure TfrmMain.Timer1Timer(Sender: TObject);
begin
  lblTempo.Caption := TimeToStr(Time-tempoinicial);
end;

procedure TfrmMain.FormActivate(Sender: TObject);
begin
  WindowState := wsMaximized;

  ToolBar1.Visible := True;;

  comando := TStringList.Create;
  msdos := TStringList.Create;

  LeIcones(Sender);
end;

procedure TfrmMain.ListView1DblClick(Sender: TObject);
var
  i: integer;

begin
  i := ListView1.ItemIndex;
  if msdos[i] = 'T' then
    ExecutaDOS(comando[i])
  else
    Executa(comando[i]);
end;

procedure TfrmMain.Sobre2Click(Sender: TObject);
begin
  AboutBox.ShowModal;
end;

end.

