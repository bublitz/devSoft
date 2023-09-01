
unit cadastro;

interface

uses
  System.Collections, System.ComponentModel, System.Text,
  System.Data, System.Drawing, System.Web, System.Web.SessionState,
  System.Web.UI, System.Web.UI.WebControls, System.Web.UI.HtmlControls,
  untDatMod, Borland.Vcl.SysUtils, System.Web.Mail, MagicAjax.UI.Controls;

type
  TWebForm2 = class(System.Web.UI.Page)
{$REGION 'Designer Managed Code'}
    strict private
      procedure InitializeComponent;
    procedure btnCancelar_Click(sender: System.object; e: System.EventArgs);
    procedure btnGravar_Click(sender: System.object; e: System.EventArgs);
{$ENDREGION}
    strict private
      procedure Page_Load(sender: System.object; e: System.EventArgs);
    strict protected
      txtNome: System.Web.UI.WebControls.TextBox;
    txtApelido: System.Web.UI.WebControls.TextBox;
    txtEmail: System.Web.UI.WebControls.TextBox;
    chkOk: System.Web.UI.WebControls.CheckBox;
    btnGravar: System.Web.UI.WebControls.Button;
    btnCancelar: System.Web.UI.WebControls.Button;
    RequiredFieldValidator1: System.Web.UI.WebControls.RequiredFieldValidator;
    RegularExpressionValidator1: System.Web.UI.WebControls.RegularExpressionValidator;
    RequiredFieldValidator2: System.Web.UI.WebControls.RequiredFieldValidator;
    labErro: System.Web.UI.WebControls.Label;
    txtCodigo: System.Web.UI.WebControls.TextBox;
    labErroCodigo: System.Web.UI.WebControls.Label;
    txtCPF: System.Web.UI.WebControls.TextBox;
    AjaxPanel1: MagicAjax.UI.Controls.AjaxPanel;
    Image1: System.Web.UI.WebControls.Image;
    procedure OnInit(e: EventArgs); override;
    function GeraSenha(nome: string): string;
  private
    DatMod: TDataModule;
    { Private Declarations }
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
  Include(Self.btnCancelar.Click, Self.btnCancelar_Click);
  Include(Self.Load, Self.Page_Load);
end;
{$ENDREGION}

procedure TWebForm2.Page_Load(sender: System.object; e: System.EventArgs);
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

procedure TWebForm2.btnGravar_Click(sender: System.object; e: System.EventArgs);
var
  senha, nome, apelido, email, cpf: string;
  mailMsg: MailMessage;
  script: StringBuilder;

begin
  if chkOk.Checked then
  begin
    try
      DatMod := TDataModule.Create;
      DatMod.FbCon.Open;
      nome := DatMod.Limpa(txtNome.Text);
      apelido := DatMod.Limpa(txtApelido.Text);
      if apelido = '' then
        apelido := Copy(nome, 1, Pos(' ', nome)-1);
      email := DatMod.Limpa(txtEmail.Text.ToLower);
      cpf := DatMod.Limpa(txtCPF.Text.ToUpper);
      senha := Session['pwd_id'].ToString + IntToStr(100 + Random(898));
      if txtCodigo.Text.ToUpper <> Session['pwd_id'].ToString then
      begin
        labErroCodigo.Visible := True;
      end
      else
      begin
        labErroCodigo.Visible := False;
        if not DatMod.EMailCadastrado(email) then
        begin
          DatMod.FbJogadores.InsertCommand.Parameters['@p1'].Value := nome;
          DatMod.FbJogadores.InsertCommand.Parameters['@p2'].Value := apelido;
          DatMod.FbJogadores.InsertCommand.Parameters['@p3'].Value := cpf;
          DatMod.FbJogadores.InsertCommand.Parameters['@p4'].Value := email;
          DatMod.FbJogadores.InsertCommand.Parameters['@p5'].Value := senha.ToLower;
          DatMod.FbJogadores.InsertCommand.ExecuteNonQuery;
          Session.Add('cad_nome', nome);
          Session.Add('cad_email', email);
          Session.Add('cad_senha', senha);
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
          mailMsg.Body := 'Parabéns <strong>' + nome + '</strong><br><br>Seu cadastro foi efetuado com sucesso!' +
            '<br>Sua senha para acessar o site é <strong>' + senha.ToLower + '</strong>' +
            '<br><br>Boa sorte!!!';
          mailMsg.BodyFormat := MailFormat.Html;
          SmtpMail.SmtpServer := 'smtp.bolao.fot.br';
          SmtpMail.Send(mailMsg);
          mailMsg := nil;
        finally
          script := StringBuilder.Create;
          script.Append('<script language="JavaScript">');
          script.Append('alert(''Cadastro efetuado com sucesso!!'#13' Verifique o seu e-mail!'')');
          script.Append('</script>');
          RegisterClientScriptBlock('mensagem', script.ToString);
          Response.Redirect('cadastro_ok.aspx');
        end;
      end;
    end;
  end;
end;

procedure TWebForm2.btnCancelar_Click(sender: System.object; e: System.EventArgs);
begin
  Response.Redirect('index.aspx');
end;

function TWebForm2.GeraSenha(nome: string): string;
var
  senha: string;

begin
  senha := Copy(nome, 1, 1);
  while pos(' ', nome) > 0 do
  begin
    nome := Copy(nome, pos(' ', nome) + 1, 999);
    if pos(' ', nome) > 2 then
      senha := senha + Copy(nome, 1, 1);
  end;
  if Length(nome) > 2 then
    senha := senha + Copy(nome, 1, 1);
  GeraSenha := senha;
end;

end.

