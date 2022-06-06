unit untImpOrca;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls;

type
  TfrmImpOrcam = class(TForm)
    GroupBox1: TGroupBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    RdGrpOrient: TGroupBox;
    ImagRetra: TImage;
    ImagPaisa: TImage;
    RBtnRetra: TRadioButton;
    RBtnPaisa: TRadioButton;
    RBtnApres: TRadioButton;
    RBtnConf: TRadioButton;
    ImagePaisa: TImage;
    ImageRetra: TImage;
    procedure RdGrpOrientClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmImpOrcam: TfrmImpOrcam;

implementation

{$R *.DFM}

procedure TfrmImpOrcam.RdGrpOrientClick(Sender: TObject);
begin
   if RBtnRetra.Checked then
      ImagRetra.Visible := True
   else
      ImagRetra.Visible := False;

   ImagPaisa.Visible := not ImagRetra.Visible;

   ImagePaisa.Visible := ImagPaisa.Visible;
   ImageRetra.Visible := ImagRetra.Visible;
end;

end.
