unit Sobre;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, Animate, GIFCtrl, sysinfo, RXCtrls;

type
  TAboutBox = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    RxLabel3: TRxLabel;
    RxLabel1: TRxLabel;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    Bevel1: TBevel;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AboutBox: TAboutBox;

implementation

{$R *.DFM}

procedure TAboutBox.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

end.
 
