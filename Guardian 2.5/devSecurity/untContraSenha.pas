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
    Label7: TLabel;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    senha: string;
  end;

var
  frmContraSenha: TfrmContraSenha;

implementation

uses untFuncoes;

{$R *.DFM}

procedure TfrmContraSenha.FormShow(Sender: TObject);
var
  pass: string;
  valor, conta: integer;

begin
  Label4.Caption := DateToStr(Now);
  Label5.Caption := TimeToStr(Now);
  Randomize;
  valor := Random(65535)+24351;
  Label6.Caption := IntToStr(valor);
  conta := Trunc(valor/3.14);
  pass  := IntToStr(conta);
  senha := pass;
  for conta := 1 to Length(pass) do
    senha[conta] := pass[Length(pass)-conta+1];
  edtSenha.Text := '';
  edtSenha.SetFocus;
end;

end.
