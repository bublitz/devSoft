unit untBonus;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, Buttons;

type
  TfrmBonus = class(TForm)
    Label2: TLabel;
    DBText1: TDBText;
    Label5: TLabel;
    DBText2: TDBText;
    Label1: TLabel;
    edtHoras: TMaskEdit;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBonus: TfrmBonus;

implementation

{$R *.DFM}

procedure TfrmBonus.SpeedButton2Click(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmBonus.SpeedButton1Click(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmBonus.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
