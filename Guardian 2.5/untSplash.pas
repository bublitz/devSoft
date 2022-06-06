unit untSplash;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, RXCtrls, ComCtrls;

type
  TfrmSplash = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    RxLabel2: TRxLabel;
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
