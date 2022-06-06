unit untFrmImpSer;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls;

type
  TfrmImpSer = class(TForm)
    RdGrpOrdem: TRadioGroup;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    EdtCod: TEdit;
    EdtIni: TEdit;
    EdtFin: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    RdGrpTipo: TRadioGroup;
    procedure RdGrpOrdemClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmImpSer: TfrmImpSer;

implementation

{$R *.DFM}

procedure TfrmImpSer.RdGrpOrdemClick(Sender: TObject);
begin
    if RdGrpOrdem.ItemIndex = 1 then
    begin
       EdtIni.Text := '';
       EdtIni.Enabled := False;
       EdtFin.Text := '';
       EdtFin.Enabled := False;
    end
    else
    begin
       EdtIni.Enabled := True;
       EdtFin.Enabled := True;
    end;
end;

end.
