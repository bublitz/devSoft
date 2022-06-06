unit untFuncoes;

interface

uses Windows, SysUtils, Forms;

procedure Executa(comando: string);
procedure ExecutaDOS(comando: string);
procedure hideTaskbar;
procedure showTaskbar;

implementation

procedure Executa(comando: string);
var
  pi: TProcessInformation;
  si: TStartupInfo;

begin
  //WinExec(PChar(comando), SW_SHOWNORMAL); --> antigo
  FillMemory(@si, sizeof( si ), 0);
  si.cb := sizeof(si);
  CreateProcess(Nil, PChar(comando), Nil, Nil, False,
                NORMAL_PRIORITY_CLASS, Nil, Nil, si, pi);
  CloseHandle(pi.hProcess);
  CloseHandle(pi.hThread);
end;

procedure ExecutaDOS(comando: string);
var
  T: TextFile;
  linha: string;

begin
  AssignFile(T, ExtractFilePath(Application.ExeName) + 'game.bat');
  Rewrite(T);
  linha := ExtractFileDrive(comando);
  WriteLn(T, linha);
  linha := Copy(ExtractFileDir(comando),4,999);
  WriteLn(T, 'CD\"'+linha+'"');
  linha := ExtractFileName(comando);
  WriteLn(T, linha);
  CloseFile(T);
  linha := ExtractFilePath(Application.ExeName) + 'game.bat';
  Executa(linha);
end;

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

end.
