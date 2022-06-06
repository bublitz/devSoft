unit untConfPag;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Spin, Buttons, RXSpin, ExtCtrls;

type
  TfrmConfPag = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    EdLef: TSpinEdit;
    GroupBox2: TGroupBox;
    CBoxLen: TComboBox;
    Label5: TLabel;
    Label6: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    EdTop: TRxSpinEdit;
    EdBot: TRxSpinEdit;
    EdWid: TRxSpinEdit;
    EdLen: TRxSpinEdit;
    StaticText1: TStaticText;
    GroupBox3: TGroupBox;
    ChkBxGrade: TCheckBox;
    RGrpMod: TRadioGroup;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    procedure CBoxLenChange(Sender: TObject);
    procedure RGrpModClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConfPag: TfrmConfPag;

implementation

{$R *.DFM}

procedure TfrmConfPag.CBoxLenChange(Sender: TObject);
begin
   if CBoxLen.ItemIndex = 2 then begin
      EdWid.Enabled := True;
      EdLen.Enabled := True;
   end
   else begin
      EdWid.Enabled := False;
      EdLen.Enabled := False;
      if CBoxLen.ItemIndex = 0 then begin
         EdWid.Value := 210.0;
         EdLen.Value := 297.0;
      end
      else begin
         EdWid.Value := 215.9;
         EdLen.Value := 279.4;
      end;
   end;
end;

procedure TfrmConfPag.RGrpModClick(Sender: TObject);
begin
  Image1.Visible := False;
  Image2.Visible := False;
  Image3.Visible := False;
  Image4.Visible := False;
  case RGrpMod.ItemIndex of
  0: Image1.Visible := True;
  1: Image2.Visible := True;
  2: Image3.Visible := True;
  3: Image4.Visible := True;
  end
end;

end.
