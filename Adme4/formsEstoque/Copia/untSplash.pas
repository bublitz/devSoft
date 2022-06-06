unit untSplash;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, RXCtrls, ComCtrls;

type
  TfrmSplash = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    PBar: TProgressBar;
    RxLabel3: TRxLabel;
    RxLabel1: TRxLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSplash: TfrmSplash;

implementation

{$R *.DFM}

end.
