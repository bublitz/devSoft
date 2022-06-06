unit untInsCrono;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls;

type
  TfrmInsCrono = class(TForm)
    GroupBox1: TGroupBox;
    ChkBoxMao: TCheckBox;
    ChkBoxMat: TCheckBox;
    ChkBoxEqu: TCheckBox;
    RdGrpOrdem: TRadioGroup;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ChkBoxCota: TCheckBox;
    CBoxPer: TComboBox;
    Label1: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInsCrono: TfrmInsCrono;

implementation

{$R *.DFM}

end.
