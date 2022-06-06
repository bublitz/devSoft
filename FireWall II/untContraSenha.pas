unit untContraSenha;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, registry, IniFiles, Justone;

type
  TfrmContraSenha = class(TForm)
    Panel1: TPanel;
    Bevel1: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lblComp: TLabel;
    lblHora: TLabel;
    lblData: TLabel;
    Image1: TImage;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    GroupBox1: TGroupBox;
    edtSenha: TEdit;
    Timer1: TTimer;
    JustOne1: TJustOne;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Trava(Sender: TObject);
    procedure Destrava(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure WMQueryEndSession(var Msg: TWMQueryEndSession);
    message WM_QueryEndSession;
  public
    { Public declarations }
    nomeini: string;
    showsenha, podeFechar: boolean;
  end;

var
  frmContraSenha: TfrmContraSenha;

implementation

uses untFuncoes;

{$R *.DFM}

procedure hideTaskbar;
var
  wndHandle : THandle;
  wndClass : array[0..50] of Char;
begin
  StrPCopy(@wndClass[0], 'Shell_TrayWnd');
  wndHandle := FindWindow(@wndClass[0], nil);
  ShowWindow(wndHandle, SW_HIDE);
end;

procedure showTaskbar;
var
  wndHandle : THandle;
  wndClass : array[0..50] of Char;

begin
  StrPCopy(@wndClass[0], 'Shell_TrayWnd');
  wndHandle := FindWindow(@wndClass[0], nil);
  ShowWindow(wndHandle, SW_RESTORE);
end;

procedure TfrmContraSenha.WMQueryEndSession(var Msg: TWMQueryEndSession);
begin
  podeFechar := True;
  Msg.Result := 1;
end;

procedure TfrmContraSenha.Trava(Sender: TObject);
//var
//  OldValue : LongBool;

begin
  //Trava sistema
  //Desabilita [Ctrl+Alt+Del] [Alt+Tab] [Ctrl+Esc]
  //SystemParametersInfo(97, Word(True), @OldValue, 0);
  //Esconde a Barra de Tarefas
  hideTaskBar;
  //Esconde Ícones
  ShowWindow(FindWindow(nil, 'Program Manager'), SW_HIDE);
end;

procedure TfrmContraSenha.Destrava(Sender: TObject);
//var
//  OldValue : LongBool;

begin
  //Destrava sistema
  //Habilita [Ctrl+Alt+Del] [Alt+Tab] [Ctrl+Esc]
  //SystemParametersInfo(97, Word(False), @OldValue, 0);
  //Mostra a Barra de Tarefas
  showTaskBar;
  //Mostra Ícones
  ShowWindow(FindWindow(nil, 'Program Manager'), SW_SHOW);
end;

procedure TfrmContraSenha.BitBtn1Click(Sender: TObject);

  function mistura( v: longint; c: string ): string;
  var
    v1, v2: string;
    i, d, r: integer;

  begin
    v1 := IntToStr(v);
    v2 := '';
    for i := Length(c) downto 1 do
    begin
      d := Ord(c[i]) div 16;
      r := 16 - Ord(c[i]) mod 16;
      v2 := v2 + DecToHex(d) + Copy(v1, i*2-1, 2 ) + DecToHex(r);
    end;
    mistura := Copy(v2,5,8);
  end;

var
  dia, mes, ano, hor, min, seg, mil: word;
  val1, val2, val3, val4: longint;

begin
  DecodeDate( StrToDate(lblData.Caption), ano, mes, dia );
  DecodeTime( StrToTime(lblHora.Caption), hor, min, seg, mil );
  val1 := (ano+mes+dia)*(hor+min+seg)*soma(lblData.Caption);
  val2 := (ano+mes+dia)*(hor+min+seg)*soma(lblHora.Caption);
  val3 := soma(lblComp.Caption)*(ano+mes+dia+hor+min+seg);

  val4 := Trunc(val1*val2*val3*(min+ano+min)*10000) +
          soma(lblData.Caption)*soma(lblHora.Caption);

  if edtSenha.Text = mistura(abs(val4),lblComp.Caption) then
  begin
    Destrava(Sender);
    podeFechar := True;
    Halt(0);
  end
  else
    raise exception.Create('Contra-Senha Inválida!!');

end;

procedure TfrmContraSenha.FormCreate(Sender: TObject);
var
  reg: TRegistry;
  arqini: TIniFile;

begin
  ShowWindow(Application.Handle, SW_HIDE);
  SetWindowLong(Application.Handle, GWL_EXSTYLE,
                GetWindowLong(Application.Handle, GWL_EXSTYLE) or WS_EX_TOOLWINDOW
                and not WS_EX_APPWINDOW);

  reg := TRegistry.create;
  try
    reg.RootKey := HKEY_LOCAL_MACHINE;
    reg.OpenKey('SOFTWARE\Microsoft\Windows\CurrentVersion\Run', False);
    if reg.ReadString('Joystick') <> 'C:\Windows\Joystick.exe' then
      reg.WriteString('Joystick', 'C:\Windows\Joystick.exe' );
  finally
    reg.free;
  end;

  arqini := TIniFile.Create( 'devSoft.ini' );
  nomeini := arqini.ReadString( 'Params', 'ArqIni', '' );
  arqini.free;

  showsenha := (nomeini = '') or (FileExists(nomeini) = False);

  Timer1.Enabled := True;
  Timer1Timer(Sender);

end;

procedure TfrmContraSenha.Timer1Timer(Sender: TObject);
begin
  if showsenha then
  begin
    ShowWindow(Application.Handle, SW_SHOW);
    Panel1.Visible := True;
    lblData.Caption := DateToStr(Now);
    lblHora.Caption := TimeToStr(Now);
    lblComp.Caption := 'LAN-PARTY';
    Top := 50;
    podeFechar := False;
    Trava(Sender);
    Timer1.Enabled := False;
  end
  else
  begin
    Top := -400;
    if FileExists('c:\windows\efxtpgu.tmp') = False then
    begin
      podeFechar := True;
      ExitWindowsEx(EWX_LOGOFF,1);
    end;
  end;
end;

procedure TfrmContraSenha.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose := podeFechar;
end;

procedure TfrmContraSenha.FormShow(Sender: TObject);
var
  OldValue : LongBool;
begin
  SystemParametersInfo(97, Word(True), @OldValue, 0);
end;

end.

