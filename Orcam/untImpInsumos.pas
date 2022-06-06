unit untImpInsumos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls;

type
  TfrmImpInsumos = class(TForm)
    GroupBox1: TGroupBox;
    ChkBoxMao: TCheckBox;
    ChkBoxMat: TCheckBox;
    ChkBoxEqu: TCheckBox;
    RdGrpOrdem: TRadioGroup;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BtnDetail: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    EdIni: TEdit;
    EdFin: TEdit;
    procedure BtnDetailClick(Sender: TObject);
    procedure RdGrpOrdemClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmImpInsumos: TfrmImpInsumos;

implementation

{$R *.DFM}

procedure TfrmImpInsumos.BtnDetailClick(Sender: TObject);
begin
   if BtnDetail.Caption = 'Mais >>>' then begin
      frmImpInsumos.Width := 450;
      BtnDetail.Caption := 'Menos <<<';
   end
   else begin
      frmImpInsumos.Width := 300;
      BtnDetail.Caption := 'Mais >>>';
   end;
   EdIni.Text := '';
   EdFin.Text := '';
end;

procedure TfrmImpInsumos.RdGrpOrdemClick(Sender: TObject);
begin
   if RdGrpOrdem.ItemIndex = 0 then
      BtnDetail.Enabled := True
   else begin
      BtnDetail.Enabled := False;
      if BtnDetail.Caption = 'Menos <<<' then
         BtnDetailClick(Sender);
   end;

end;

end.
