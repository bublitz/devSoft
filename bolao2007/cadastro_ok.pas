
unit cadastro_ok;

interface

uses
  System.Collections, System.ComponentModel,
  System.Data, System.Drawing, System.Web, System.Web.SessionState,
  System.Web.UI, System.Web.UI.WebControls, System.Web.UI.HtmlControls;

type
  TWebForm2 = class(System.Web.UI.Page)
{$REGION 'Designer Managed Code'}
    strict private
      procedure InitializeComponent;
{$ENDREGION}
    strict private
      procedure Page_Load(sender: System.object; e: System.EventArgs);
    strict protected
      procedure OnInit(e: EventArgs); override;
  private
    { Private Declarations }
  public
    { Public Declarations }
    cad_nome, cad_email, cad_senha: string;
  end;

implementation

{$REGION 'Designer Managed Code'}
/// <summary>
/// Required method for Designer support -- do not modify
/// the contents of this method with the code editor.
/// </summary>

procedure TWebForm2.InitializeComponent;
begin
  Include(Self.Load, Self.Page_Load);
end;
{$ENDREGION}

procedure TWebForm2.Page_Load(sender: System.object; e: System.EventArgs);
begin
  // TODO: Put user code to initialize the page here
  if (Session['cad_nome'] = nil) or (Session['cad_email'] = nil) or (Session['cad_senha'] = nil) then
    Response.Redirect('index.aspx');
  cad_nome := Session['cad_nome'].ToString;
  cad_email := Session['cad_email'].ToString;
  cad_senha := Session['cad_senha'].ToString;
  Session['cad_nome'] := nil;
  Session['cad_email'] := nil;
  Session['cad_senha'] := nil;
end;

procedure TWebForm2.OnInit(e: EventArgs);
begin
  //
  // Required for Designer support
  //
  InitializeComponent;
  inherited OnInit(e);
end;

end.

