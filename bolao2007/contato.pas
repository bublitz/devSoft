
unit contato;

interface

uses
  System.Collections, System.ComponentModel,
  System.Data, System.Drawing, System.Web, System.Web.SessionState,
  System.Web.UI, System.Web.UI.WebControls, System.Web.UI.HtmlControls,
  System.Web.Mail;

type
  TWebForm2 = class(System.Web.UI.Page)
  {$REGION 'Designer Managed Code'}
  strict private
    procedure InitializeComponent;
    procedure btnVoltar_Click(sender: System.Object; e: System.EventArgs);
    procedure btnEnviar_Click(sender: System.Object; e: System.EventArgs);
  {$ENDREGION}
  strict private
    procedure Page_Load(sender: System.Object; e: System.EventArgs);
  strict protected
    TextBox1: System.Web.UI.WebControls.TextBox;
    TextBox2: System.Web.UI.WebControls.TextBox;
    TextBox3: System.Web.UI.WebControls.TextBox;
    btnEnviar: System.Web.UI.WebControls.Button;
    btnVoltar: System.Web.UI.WebControls.Button;
    RegularExpressionValidator1: System.Web.UI.WebControls.RegularExpressionValidator;
    RequiredFieldValidator1: System.Web.UI.WebControls.RequiredFieldValidator;
    RequiredFieldValidator2: System.Web.UI.WebControls.RequiredFieldValidator;
    RequiredFieldValidator3: System.Web.UI.WebControls.RequiredFieldValidator;
    procedure OnInit(e: EventArgs); override;
  private
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
  Include(Self.btnEnviar.Click, Self.btnEnviar_Click);
  Include(Self.btnVoltar.Click, Self.btnVoltar_Click);
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

procedure TWebForm2.btnEnviar_Click(sender: System.Object; e: System.EventArgs);
var
  mailMsg: MailMessage;

begin
  try
    mailMsg := MailMessage.Create;
    mailMsg.From := 'admin@bolao.fot.br';
    mailMsg.&To := 'admin@bolao.fot.br';
    mailMsg.Subject := 'Contato Bolão 2006';
    mailMsg.Body := 'Nome: <strong>' + TextBox1.Text + '</strong><br>' +
      'Email: <strong>' + TextBox2.Text + '</strong><br>' +
      'Mensagem:<br><strong>' + TextBox3.Text + '</strong><br>' +
      '-------------------------------------';
    mailMsg.BodyFormat := MailFormat.Html;
    SmtpMail.SmtpServer := 'smtp.bolao.fot.br';
    SmtpMail.Send(mailMsg);
    mailMsg := nil;
  finally
    Response.Redirect('index.aspx');
  end;

end;

procedure TWebForm2.btnVoltar_Click(sender: System.Object; e: System.EventArgs);
begin
  Response.Redirect('index.aspx');
end;

end.

