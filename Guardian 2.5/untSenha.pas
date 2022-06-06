unit untSenha;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  RXCtrls, ExtCtrls, StdCtrls, Buttons;

type
  TfrmSenha = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edtUser: TEdit;
    edtSenha: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSenha: TfrmSenha;

implementation

{$R *.DFM}

procedure TfrmSenha.FormShow(Sender: TObject);
begin
  edtSenha.Text := '';
  edtUser.Text := '';
  edtUser.SetFocus;
end;

procedure TfrmSenha.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
