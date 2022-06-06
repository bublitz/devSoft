unit untContraSenha;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls;

type
  TfrmContraSenha = class(TForm)
    Bevel1: TBevel;
    edtSenha: TEdit;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmContraSenha: TfrmContraSenha;

implementation

uses untFuncoes, untCalcCSenha;

{$R *.DFM}

procedure TfrmContraSenha.FormShow(Sender: TObject);
begin
  Randomize;
  Label4.Caption := DateToStr(Now);
  Label5.Caption := TimeToStr(Now);
  Label6.Caption := IntToStr(Random(65535)+10000);
  edtSenha.Text := '';
  edtSenha.SetFocus;
end;

procedure TfrmContraSenha.BitBtn1Click(Sender: TObject);
  function inverte(s: string): string;
  var
    r: string;
    i: integer;
  begin
    r := s;
    for i := 1 to Length(s) do
      r[i] := s[Length(s)-i+1];
    inverte := r;
  end;

begin
  if edtSenha.Text = Inverte(Label6.Caption) then
    frmCalcCSenha.ShowModal;
    
  Halt(0);
end;

end.
