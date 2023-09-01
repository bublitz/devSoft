
unit gerasenha;

interface

uses
  System.Collections, System.ComponentModel,
  System.Data, System.Drawing, System.Web, System.Web.SessionState,
  System.Web.UI, System.Web.UI.WebControls, System.Web.UI.HtmlControls,
  System.Drawing.Imaging;

type
  TWebForm1 = class(System.Web.UI.Page)
  {$REGION 'Designer Managed Code'}
  strict private
    procedure InitializeComponent;
  {$ENDREGION}
  strict private
    procedure Page_Load(sender: System.Object; e: System.EventArgs);
  strict protected
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
procedure TWebForm1.InitializeComponent;
begin
  Include(Self.Load, Self.Page_Load);
end;
{$ENDREGION}

procedure TWebForm1.Page_Load(sender: System.Object; e: System.EventArgs);
const
  carac = 'Q16ER3TYU4PAS5DFG6HJK7LZX8CVB9NH12345678';

var
  i, x: integer;
  G: graphics;
  p: SolidBrush;
  c: Color;
  b: Brush;
  senha, q, fonte: string;
  imgOut: System.Drawing.Image;

begin
  // TODO: Put user code to initialize the page here
  imgOut := System.Drawing.Image.FromFile(Server.MapPath('images\fundo.jpg'));
  g := Graphics.FromImage(imgOut);
  x := -5;
  for i := 0 to 1 do
  begin
    c := Color.FromArgb(Random(255), Random(155), Random(155));
    p := SolidBrush.Create(c);
    g.FillRectangle(p, Random(15), Random(44), Random(35)+30, Random(24)+20);
  end;

  senha := '';
  for i := 1 to 3 do
  begin
    q := carac[Random(39)+1];
    senha := senha + q;
    c := Color.FromArgb(Random(255), Random(155), Random(155));
    if i = 2 then
    begin
      b := Brushes.Aquamarine;
      fonte := 'Verdana';
    end
    else
    begin
      b := Brushes.Yellow;
      fonte := 'Arial';
    end;
    g.DrawString(q, Font.Create(fonte, 20+i, FontStyle.Bold),
      b, x, 0);
    x := x + 18;
  end;
  if Session['pwd_id'] = nil then
    Session.Add('pwd_id', senha)
  else
    Session['pwd_id'] := senha;

  Response.ContentType := 'image/jpeg';
  imgOut.Save(response.OutputStream, ImageFormat.Jpeg);
  g.Dispose;
  imgOut.Dispose;
end;

procedure TWebForm1.OnInit(e: EventArgs);
begin
  //
  // Required for Designer support
  //
  InitializeComponent;
  inherited OnInit(e);
end;

end.

