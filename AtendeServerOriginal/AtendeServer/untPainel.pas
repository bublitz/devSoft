unit untPainel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, MPlayer, ExtCtrls, Menus, Spin, Buttons;

type
  TfrmPainel = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    labSenha: TLabel;
    labMesa: TLabel;
    MediaPlayer1: TMediaPlayer;
    Timer1: TTimer;
    PopupMenu1: TPopupMenu;
    estar1: TMenuItem;
    Especial1: TMenuItem;
    GroupBox1: TGroupBox;
    Label2a: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    SpinEdit1: TSpinEdit;
    SpinEdit2: TSpinEdit;
    SpinEdit3: TSpinEdit;
    Ajustar: TMenuItem;
    N1: TMenuItem;
    BitBtn1: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure estar1Click(Sender: TObject);
    procedure Especial1Click(Sender: TObject);
    procedure SpinEdit1Change(Sender: TObject);
    procedure SpinEdit2Change(Sender: TObject);
    procedure SpinEdit3Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure AjustarClick(Sender: TObject);
    procedure MediaPlayer1Notify(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    tocando: boolean;
    procedure Alarme(Senha, Mesa: String; Especial: Boolean);
  end;

var
  frmPainel: TfrmPainel;

implementation

uses untMain;

{$R *.dfm}

{ TfrmPainel }

procedure TfrmPainel.AjustarClick(Sender: TObject);
begin
  GroupBox1.Visible := True;
end;

procedure TfrmPainel.Alarme(Senha, Mesa: String; Especial: Boolean);
var
  i: integer;

begin
  tocando := True;
  if Especial then
    labSenha.Caption := 'E' + Senha
  else
    labSenha.Caption := Senha;

  labMesa.Caption := Mesa;
  labSenha.Font.Color := clYellow;
  labMesa.Font.Color := clYellow;
  Application.ProcessMessages;

  if MediaPlayer1.FileName <> '' then
  begin
    MediaPlayer1.Wait := False;
    MediaPlayer1.Notify := True;
    MediaPlayer1.Open;
    MediaPlayer1.Play;
  end;

  for i := 0 to 5 do
  begin
    labSenha.Font.Color := clBlack;
    labMesa.Font.Color := clBlack;
    Application.ProcessMessages;
    Sleep(60);
    labSenha.Font.Color := clYellow;
    labMesa.Font.Color := clYellow;
    Application.ProcessMessages;
    Sleep(50);
  end;
  for i := 0 to 5 do
  begin
    labSenha.Font.Color := clBlack;
    labMesa.Font.Color := clBlack;
    Application.ProcessMessages;
    Sleep(60);
    labSenha.Font.Color := clYellow;
    labMesa.Font.Color := clYellow;
    Application.ProcessMessages;
    Sleep(50);
  end;
end;

procedure TfrmPainel.BitBtn1Click(Sender: TObject);
begin
  GroupBox1.Visible := False;
end;

procedure TfrmPainel.Especial1Click(Sender: TObject);
begin
  Especial1.Checked := not Especial1.Checked;
  frmMain.chkEspecial.Checked := Especial1.Checked;
end;

procedure TfrmPainel.estar1Click(Sender: TObject);
begin
  Alarme('000', '000', Especial1.Checked);
end;

procedure TfrmPainel.FormCreate(Sender: TObject);
begin
  with frmMain do
  begin
    Especial1.Checked := chkEspecial.Checked;
    labSenha.Font.Size := SpinEdit1.Value;
    labMesa.Font.Size := SpinEdit2.Value;
    Label1.Font.Size := SpinEdit3.Value;
    Label2.Font.Size := SpinEdit3.Value;
    MediaPlayer1.FileName := arq_som;
    if FileExists(arq_som) then
      MediaPlayer1.Open
    else
      MediaPlayer1.FileName := '';
    MediaPlayer1.Notify := True;
  end;
  SpinEdit1.Value := frmMain.SpinEdit1.Value;
  SpinEdit2.Value := frmMain.SpinEdit2.Value;
  SpinEdit3.Value := frmMain.SpinEdit3.Value;
end;

procedure TfrmPainel.MediaPlayer1Notify(Sender: TObject);
begin
  with Sender as TMediaPlayer do
  begin
    case Mode of
      mpStopped: begin
        tocando := False;
      end;
    end;
  end;
  MediaPlayer1.Notify := True;
end;

procedure TfrmPainel.SpinEdit1Change(Sender: TObject);
begin
  labSenha.Font.Size := SpinEdit1.Value;
  frmMain.SpinEdit1.Value := SpinEdit1.Value;
end;

procedure TfrmPainel.SpinEdit2Change(Sender: TObject);
begin
  labMesa.Font.Size := SpinEdit2.Value;
  frmMain.SpinEdit2.Value := SpinEdit2.Value;
end;

procedure TfrmPainel.SpinEdit3Change(Sender: TObject);
begin
  Label1.Font.Size := SpinEdit3.Value;
  Label2.Font.Size := SpinEdit3.Value;
  frmMain.SpinEdit3.Value := SpinEdit3.Value;
end;

procedure TfrmPainel.Timer1Timer(Sender: TObject);
var
  pt: TPoint;

begin
  { Mantém pressionada CTRL }
  keybd_event(VK_CONTROL, 0, KEYEVENTF_EXTENDEDKEY or 0, 0);
  { Pressiona F1 }
  keybd_event(VK_F1, 0, 0, 0);
  { Libera (solta) CTRL }
  keybd_event(VK_CONTROL, $45, KEYEVENTF_EXTENDEDKEY or KEYEVENTF_KEYUP, 0);
  Screen.Cursor := crHourglass;
  Application.ProcessMessages;
  GetCursorPos(pt) ;
  SetCursorPos(pt.x + Random(6) - 3, pt.y + Random(6) - 3) ;
  Application.ProcessMessages;
  SetCursorPos(pt.x + Random(6) - 3, pt.y + Random(6) - 3) ;
  Screen.Cursor := crDefault;
end;
end.
