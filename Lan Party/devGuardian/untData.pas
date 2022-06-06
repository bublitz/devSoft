unit untData;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons;

type
  TfrmData = class(TForm)
    Label1: TLabel;
    BitBtn1: TBitBtn;
    MonthCalendar1: TMonthCalendar;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmData: TfrmData;

implementation

uses untMain;

{$R *.dfm}

procedure TfrmData.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmMain.data_atual := MonthCalendar1.Date;
  Action := caFree;
end;

procedure TfrmData.FormCreate(Sender: TObject);
begin
  MonthCalendar1.Date := Date;
end;

end.
