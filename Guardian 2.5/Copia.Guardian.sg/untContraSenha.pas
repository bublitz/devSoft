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
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
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
begin
  Label4.Caption := DateToStr(Now);
  Label5.Caption := TimeToStr(Now);
  Randomize;
  Label6.Caption := IntToStr(Random(65535)+10000);
  senha := Copy(Label4.Caption,1,2)+Copy(Label5.Caption,4,2)+Copy(Label6.Caption, 4,2);
  edtSenha.Text := '';
  edtSenha.SetFocus;
end;

procedure TfrmContraSenha.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
