unit uAD;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ActiveX, adshlp, ActiveDs_Tlb, ComObj;

type
  TfrmLogin = class(TForm)
    btnLogin: TButton;
    edtUsuario: TEdit;
    edtSenha: TEdit;
    lblUsuario: TLabel;
    lblSenha: TLabel;
    lblLogin: TLabel;
    procedure btnLoginClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}

procedure TfrmLogin.btnLoginClick(Sender: TObject);
var
  adObject: IADs;
begin
  ///Inicialização do COM
  CoInitialize(nil);
  try
    ADsOpenObject('LDAP://<nome_dominio_rede>', LowerCase(edtUsuario.Text), edtSenha.Text, ADS_SECURE_AUTHENTICATION, IADs, adObject);
    ShowMessage('Login válido!');
  except
    on e: EOleException do
    begin
      if Pos('Falha de logon', e.Message) > 0 then
        ShowMessage('Login inválido!')
      else
        ShowMessage(e.Message);
    end;
  end;
  CoUninitialize;
end;

end.
