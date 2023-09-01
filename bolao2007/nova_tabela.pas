
unit nova_tabela;

interface

uses
  System.Collections, System.ComponentModel, untDatMod, System.Text,
  System.Data, System.Drawing, System.Web, System.Web.SessionState,
  System.Web.UI, System.Web.UI.WebControls, System.Web.UI.HtmlControls, 
  MagicAjax.UI.Controls;

type
  TWebForm2 = class(System.Web.UI.Page)
  {$REGION 'Designer Managed Code'}
  strict private
    procedure InitializeComponent;
    procedure btnConfirmar_Click(sender: System.Object; e: System.EventArgs);
    procedure btnVoltar_Click(sender: System.Object; e: System.EventArgs);
  {$ENDREGION}
  strict private
    procedure Page_Load(sender: System.Object; e: System.EventArgs);
  strict protected
    btnConfirmar: System.Web.UI.WebControls.Button;
    TextBox3: System.Web.UI.WebControls.TextBox;
    TextBox2: System.Web.UI.WebControls.TextBox;
    TextBox1: System.Web.UI.WebControls.TextBox;
    labErro: System.Web.UI.WebControls.Label;
    btnVoltar: System.Web.UI.WebControls.Button;
    AjaxPanel1: MagicAjax.UI.Controls.AjaxPanel;
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
  Include(Self.btnConfirmar.Click, Self.btnConfirmar_Click);
  Include(Self.btnVoltar.Click, Self.btnVoltar_Click);
  Include(Self.Load, Self.Page_Load);
end;
{$ENDREGION}

procedure TWebForm2.Page_Load(sender: System.Object; e: System.EventArgs);
begin
  // TODO: Put user code to initialize the page here
  if (Session['jog_codi'] = nil) then
    Response.Redirect('index.aspx');     
end;

procedure TWebForm2.OnInit(e: EventArgs);
begin
  //
  // Required for Designer support
  //
  InitializeComponent;
  inherited OnInit(e);
end;

procedure TWebForm2.btnVoltar_Click(sender: System.Object; e: System.EventArgs);
begin
  Response.Redirect('index.aspx');
end;

procedure TWebForm2.btnConfirmar_Click(sender: System.Object; e: System.EventArgs);
var
  script: StringBuilder;
  codigo: string;
  ok: boolean;

begin
  ok := False;
  try
    DatMod := TDataModule.Create;
    DatMod.FbCon.Open;
    codigo := DatMod.Limpa(TextBox1.Text.ToUpper) +
      DatMod.Limpa(TextBox2.Text.ToUpper) +
      DatMod.Limpa(TextBox3.Text.ToUpper);

    if length(codigo) <> 12 then
      labErro.Text := 'Erro na entrada de dados!!';

    if not DatMod.VerificaTabela(codigo) then
      labErro.Text := 'Erro na entrada de dados!!'
    else
    begin
      DatMod.FbTabela.UpdateCommand.Parameters['@codjogador'].Value := Session['jog_codi'].ToString;
      DatMod.FbTabela.UpdateCommand.Parameters['@codtabela'].Value := codigo;
      DatMod.FbTabela.UpdateCommand.ExecuteNonQuery;

      DatMod.FbApostas.InsertCommand.CommandText := 'insert into apostas ' +
      '(num_jogo, cod_tabela, resultado)' +
      'select num_jogo, ''' + codigo + ''' as cod_tabela, -1 as resultado ' +
      'from jogos order by 1';
      DatMod.FbApostas.InsertCommand.ExecuteNonQuery;
      ok := True;
    end;
  finally
    DatMod.FbCon.Close;
    DatMod.Dispose;
    if ok then
    begin
      labErro.Text := 'Tabela incluída com sucesso!!';
      script := StringBuilder.Create;
      script.Append('<script language="JavaScript">');
      script.Append('alert(''Tabela incluída com sucesso!!'')');
      script.Append('</script>');
      RegisterClientScriptBlock('mensagem', script.ToString);
      Session.Remove('num_tabela');
      Response.Redirect('apostas.aspx');
    end;
  end;
end;

end.

