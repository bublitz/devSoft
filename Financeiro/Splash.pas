unit Splash;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  RXCtrls, Animate, GIFCtrl, ComCtrls, ExtCtrls;

type
  TSplashForm = class(TForm)
    PBar: TProgressBar;
    RxLabel1: TRxLabel;
    Image1: TImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SplashForm: TSplashForm;

implementation

{$R *.DFM}

end.
