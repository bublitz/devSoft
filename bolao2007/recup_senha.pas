
unit recup_senha;

interface

uses
  System.Collections, System.ComponentModel, System.Text,
  System.Data, System.Drawing, System.Web, System.Web.SessionState,
  System.Web.UI, System.Web.UI.WebControls, System.Web.UI.HtmlControls,
  System.Web.Mail, untDatMod;

type
  TWebForm2 = class(System.Web.UI.Page)
  {$REGION 'Designer Managed Code'}
  strict private
    procedure InitializeComponent;
    procedure btnGravar_Click(sender: System.Object; e: System.EventArgs);
  {$ENDREGION}
  strict private
    procedure Page_Load(sender: System.Object; e: System.EventArgs);
  strict protected
    txtEmail: System.Web.UI.WebControls.TextBox;
    RegularExpressionValidator1: System.Web.UI.WebControls.RegularExpressionValidator;
    labErro: System.Web.UI.WebControls.Label;
    RequiredFieldValidator2: System.Web.UI.WebControls.RequiredFieldValidator;
    txtCodigo: System.Web.UI.WebControls.TextBox;
    labErroCodigo: System.Web.UI.WebControls.Label;
    btnGravar: System.Web.UI.WebControls.Button;
    procedure OnInit(e: EventArgs); override;
  private
    { Private Declarations }
    DatMod: TDataModule;
  public
    { Public Declarations }
  end;

implementation

{$REGION 'Designer Managed Code'}
/// <summary>
/// Required method for Designer support -- do not modify
/// the contents of this method with the code editor.
/// </summary>
procedure TWebForm2.InitializeComponent;
begin
  Include(Self.btnGravar.Click, Self.btnGravar_Click);
  Include(Self.Load, Self.Page_Load);
end;
{$ENDREGION}

procedure TWebForm2.Page_Load(sender: System.Object; e: System.EventArgs);
begin
  // TODO: Put user code to initialize the page here
end;

procedure TWebForm2.OnInit(e: EventArgs);
begin
  //
  // Required for Designer support
  //
  InitializeComponent;
  inherited OnInit(e);
end;

procedure TWebForm2.btnGravar_Click(sender: System.Object; e: System.EventArgs);
var
  senha, email: string;
  mailMsg: MailMessage;
  script: StringBuilder;

begin
  try
    DatMod := TDataModule.Create;
    DatMod.FbCon.Open;
    email := DatMod.Limpa(txtEmail.Text.ToLower);

    if txtCodigo.Text.ToUpper <> Session['pwd_id'].ToString then
    begin
      labErroCodigo.Visible := True;
    end
    else
    begin
      labErroCodigo.Visible := False;
      if DatMod.EMailCadastrado(email) then
      begin
        senha := DatMod.PegaSenha(email);
        labErro.Visible := False;
      end
      else
        labErro.Visible := True;
    end;
  finally
    DatMod.FbCon.Close;
    DatMod.Dispose;
    if (labErro.Visible = False) and (labErroCodigo.Visible = False) then
    begin
      try
        mailMsg := MailMessage.Create;
        mailMsg.From := 'bolao@bolao.fot.br';
        mailMsg.&To := email;
        mailMsg.Subject := 'Senha Bolão 2006';
        mailMsg.Body := 'Sua senha para acessar o site é <strong>' + senha + '</strong>';
        mailMsg.BodyFormat := MailFormat.Html;
        SmtpMail.SmtpServer := 'smtp.bolao.fot.br';
        SmtpMail.Send(mailMsg);
        mailMsg := nil;
      finally
        script := StringBuilder.Create;
        script.Append('<script language="JavaScript">');
        script.Append('alert(''Senha enviada com sucesso!!'#13' Verifique o seu e-mail!'')');
        script.Append('</script>');
        RegisterClientScriptBlock('mensagem', script.ToString);
        Response.Redirect('index.aspx');
      end;
    end;
  end;
end;

end.

