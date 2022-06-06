unit Main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Menus, ComCtrls, OleCtrls, Buttons, ToolWin, Isp3,
  ActnList, ImgList, SHDocVw;

const
  CM_HOMEPAGEREQUEST = WM_USER + $1000;

type
  TMainForm = class(TForm)
    StatusBar1: TStatusBar;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Exit1: TMenuItem;
    View1: TMenuItem;
    Help1: TMenuItem;
    About1: TMenuItem;
    Toolbar3: TMenuItem;
    Statusbar2: TMenuItem;
    Go1: TMenuItem;
    Back1: TMenuItem;
    Forward1: TMenuItem;
    Stop1: TMenuItem;
    Refresh1: TMenuItem;
    N2: TMenuItem;
    ActionList1: TActionList;
    BackAction: TAction;
    ForwardAction: TAction;
    StopAction: TAction;
    RefreshAction: TAction;
    WebBrowser1: TWebBrowser;
    ToolBar2: TToolBar;
    ToolBar4: TToolBar;
    ToolButton1: TToolButton;
    BackBtn: TToolButton;
    ForwardBtn: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    StaticText1: TStaticText;
    URLs: TComboBox;
    Animate1: TAnimate;
    ImageListHot: TImageList;
    ImageListDisabled: TImageList;
    ImageListDefault: TImageList;
    ToolButton2: TToolButton;
    Image2: TImage;
    Image1: TImage;
    Image3: TImage;
    ToolButton3: TToolButton;
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure StopClick(Sender: TObject);
    procedure URLsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure LinksClick(Sender: TObject);
    procedure RefreshClick(Sender: TObject);
    procedure BackClick(Sender: TObject);
    procedure ForwardClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure URLsClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Toolbar3Click(Sender: TObject);
    procedure Statusbar2Click(Sender: TObject);
    procedure BackActionUpdate(Sender: TObject);
    procedure ForwardActionUpdate(Sender: TObject);
    procedure WebBrowser1BeforeNavigate2(Sender: TObject;
      const pDisp: IDispatch; var URL, Flags, TargetFrameName, PostData,
      Headers: OleVariant; var Cancel: WordBool);
    procedure WebBrowser1DownloadBegin(Sender: TObject);
    procedure WebBrowser1DownloadComplete(Sender: TObject);
    procedure WebBrowser1NewWindow2(Sender: TObject; var ppDisp: IDispatch;
      var Cancel: WordBool);
    procedure FormActivate(Sender: TObject);
  private
    HistoryIndex: Integer;
    HistoryList: TStringList;
    UpdateCombo: Boolean;
    procedure FindAddress;
    procedure HomePageRequest(var message: tmessage); message CM_HOMEPAGEREQUEST;
  end;

var
  MainForm: TMainForm;

implementation

uses Sobre;

{$R *.dfm}

procedure TMainForm.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.FindAddress;
var
  Flags: OLEVariant;

begin
  Flags := 0;
  UpdateCombo := True;
  if {(Pos(':\', Urls.Text) = 0) and}
     (Pos('\\', Urls.Text) = 0) and
     {(Pos('file:///', LowerCase(Urls.Text)) = 0) and}
     (Length(Urls.Text) > 4) then
    WebBrowser1.Navigate(WideString(Urls.Text), Flags, Flags, Flags, Flags)
  else
    WebBrowser1.Navigate('about:blank', Flags, Flags, Flags, Flags);
end;

procedure TMainForm.About1Click(Sender: TObject);
begin
  AboutBox.ShowModal;
end;

procedure TMainForm.StopClick(Sender: TObject);
begin
  WebBrowser1.Stop;
end;

procedure TMainForm.URLsKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_Return then
  begin
    FindAddress;
  end;
end;

procedure TMainForm.URLsClick(Sender: TObject);
begin
  FindAddress;
end;

procedure TMainForm.LinksClick(Sender: TObject);
begin
  if (Sender as TToolButton).Hint = '' then Exit;
  URLs.Text := (Sender as TToolButton).Hint;
  FindAddress;
end;

procedure TMainForm.RefreshClick(Sender: TObject);
begin
  FindAddress;
end;

procedure TMainForm.BackClick(Sender: TObject);
begin
  URLs.Text := HistoryList[HistoryIndex - 1];
  FindAddress;
end;

procedure TMainForm.ForwardClick(Sender: TObject);
begin
  URLs.Text := HistoryList[HistoryIndex + 1];
  FindAddress;
end;

procedure TMainForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Shift = [ssAlt] then
    if (Key = VK_RIGHT) and ForwardBtn.Enabled then
      ForwardBtn.Click
    else if (Key = VK_LEFT) and BackBtn.Enabled then
      BackBtn.Click;
end;

procedure TMainForm.Toolbar3Click(Sender: TObject);
begin
  with Sender as TMenuItem do
  begin
    Checked := not Checked;
    ToolBar2.Visible := Checked;
  end;
end;

procedure TMainForm.Statusbar2Click(Sender: TObject);
begin
  with Sender as TMenuItem do
  begin
    Checked := not Checked;
    StatusBar1.Visible := Checked;
  end;
end;

procedure TMainForm.HomePageRequest(var Message: TMessage);
var
  pagina: string;

begin
  pagina := ParamStr(1);
  if pagina <> '' then
    URLs.Text := pagina
  else
    URLs.Text := 'http://www.lpi.com.br';
  FindAddress;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  HistoryIndex := -1;
  HistoryList := TStringList.Create;
  Animate1.FileName := ExtractFilePath(Application.ExeName) + 'logoBrowser.avi';
  PostMessage(Handle, CM_HOMEPAGEREQUEST, 0, 0);
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  HistoryList.Free;
end;

procedure TMainForm.BackActionUpdate(Sender: TObject);
begin
  if HistoryList.Count > 0 then
    BackAction.Enabled := HistoryIndex > 0
 else
    BackAction.Enabled := False;
end;

procedure TMainForm.ForwardActionUpdate(Sender: TObject);
begin
  if HistoryList.Count > 0 then
    ForwardAction.Enabled := HistoryIndex < HistoryList.Count - 1
  else
    ForwardAction.Enabled := False;
end;

procedure TMainForm.WebBrowser1BeforeNavigate2(Sender: TObject;
  const pDisp: IDispatch; var URL, Flags, TargetFrameName, PostData,
  Headers: OleVariant; var Cancel: WordBool);
var
  NewIndex: Integer;
  
begin
  NewIndex := HistoryList.IndexOf(URL);
  if NewIndex = -1 then
  begin
    if (HistoryIndex >= 0) and (HistoryIndex < HistoryList.Count - 1) then
      while HistoryList.Count > HistoryIndex do
        HistoryList.Delete(HistoryIndex);
    HistoryIndex := HistoryList.Add(URL);
  end
  else
    HistoryIndex := NewIndex;
  if UpdateCombo then
  begin
    UpdateCombo := False;
    NewIndex := URLs.Items.IndexOf(URL);
    if NewIndex = -1 then
      URLs.Items.Insert(0, URL)
    else
      URLs.Items.Move(NewIndex, 0);
  end;
  URLs.Text := URL;
  Statusbar1.Panels[0].Text := URL;
end;

procedure TMainForm.WebBrowser1DownloadBegin(Sender: TObject);
begin
  Animate1.Active := True;
end;

procedure TMainForm.WebBrowser1DownloadComplete(Sender: TObject);
begin
  Animate1.Active := False;
end;

procedure TMainForm.WebBrowser1NewWindow2(Sender: TObject;
  var ppDisp: IDispatch; var Cancel: WordBool);
begin
  ppDisp := (Sender as  TWebBrowser).Application;
end;

procedure TMainForm.FormActivate(Sender: TObject);
begin
  WindowState := wsMaximized;
end;

end.
