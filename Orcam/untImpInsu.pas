unit untImpInsu;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls;

type
  TfrmImpInsu = class(TForm)
    GroupBox1: TGroupBox;
    ChkBoxMao: TCheckBox;
    ChkBoxMat: TCheckBox;
    ChkBoxEqu: TCheckBox;
    RdGrpOrdem: TRadioGroup;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ChkBoxCota: TCheckBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmImpInsu: TfrmImpInsu;

implementation

{$R *.DFM}

end.
