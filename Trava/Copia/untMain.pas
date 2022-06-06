unit untMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TfrmMain = class(TForm)
    btnOn: TButton;
    btnOff: TButton;
    memAction: TMemo;
    procedure btnOnClick(Sender: TObject);
    procedure btnOffClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
    podeFechar: boolean;

  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.DFM}

function RegisterServiceProcess( ProcessID, RType: DWord): DWord;
  stdcall;
  external 'KERNEL32.DLL';

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

procedure TfrmMain.btnOnClick(Sender: TObject);
var
  OldValue : LongBool;

begin
  memAction.Lines.Clear;
  memAction.Lines.Add('Desabilitando [Ctrl+Alt+Del] [Alt+Tab] [Ctrl+Esc]');
  SystemParametersInfo(97, Word(True), @OldValue, 0);
  memAction.Lines.Add('Escondendo a Barra de Tarefas');
  hideTaskBar;
  memAction.Lines.Add('Escondendo Ícones');
  ShowWindow(FindWindow(nil, 'Program Manager'), SW_HIDE);
  podeFechar := False;
end;

procedure TfrmMain.btnOffClick(Sender: TObject);
var
  OldValue : LongBool;

begin
  memAction.Lines.Clear;
  memAction.Lines.Add('Habilitando [Ctrl+Alt+Del] [Alt+Tab] [Ctrl+Esc]');
  SystemParametersInfo(97, Word(False), @OldValue, 0);
  memAction.Lines.Add('Mostrando a Barra de Tarefas');
  showTaskBar;
  memAction.Lines.Add('Mostrando Ícones');
  ShowWindow(FindWindow(nil, 'Program Manager'), SW_SHOW);
  podeFechar := True;
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  ShowWindow(Application.Handle, SW_HIDE);
  SetWindowLong(Application.Handle, GWL_EXSTYLE,
                GetWindowLong(Application.Handle, GWL_EXSTYLE) or WS_EX_TOOLWINDOW
                and not WS_EX_APPWINDOW);
  podeFechar := True;
  //SendMessage( H, WM_CLOSE, 0, 0); // Fecha programa
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  RegisterServiceProcess( GetCurrentProcessID, 1 );
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
  RegisterServiceProcess( GetCurrentProcessID, 0 );
end;

procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  canClose := podeFechar;
end;

end.
