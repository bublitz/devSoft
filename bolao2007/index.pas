
unit index;

interface

uses
  System.Collections, System.ComponentModel,
  System.Data, System.Drawing, System.Web, System.Web.SessionState,
  System.Web.UI, System.Web.UI.WebControls, System.Web.UI.HtmlControls, 
  MagicAjax.UI.Controls, untDatMod, FirebirdSql.Data.FirebirdClient,
  Borland.Vcl.SysUtils, System.Text;

type
  TWebForm1 = class(System.Web.UI.Page)
  {$REGION 'Designer Managed Code'}
  strict private
    procedure InitializeComponent;
    procedure btnLogin_Click(sender: System.Object; e: System.EventArgs);
    procedure btnSair_Click(sender: System.Object; e: System.EventArgs);
  {$ENDREGION}
  strict private
    procedure Page_Load(sender: System.Object; e: System.EventArgs);
  strict protected
    AjaxPanel1: MagicAjax.UI.Controls.AjaxPanel;
    txtLogin: System.Web.UI.WebControls.TextBox;
    txtSenha: System.Web.UI.WebControls.TextBox;
    panLogin: System.Web.UI.WebControls.Panel;
    panAcesso: System.Web.UI.WebControls.Panel;
    btnLogin: System.Web.UI.WebControls.Button;
    btnSair: System.Web.UI.WebControls.Button;
    RegularExpressionValidator1: System.Web.UI.WebControls.RegularExpressionValidator;
    RequiredFieldValidator1: System.Web.UI.WebControls.RequiredFieldValidator;
    RequiredFieldValidator2: System.Web.UI.WebControls.RequiredFieldValidator;
    labMens: System.Web.UI.WebControls.Label;
    procedure OnInit(e: EventArgs); override;
  private
    { Private Declarations }
    DatMod: TDataModule;
    dr: FbDataReader;
    jog_nome, jog_apel: string;
  public
    { Public Declarations }
    nome_joga, data_hora, participantes, tabelas,
      p1, p2, p3, p4, p5, pf1: string;
  end;

implementation

{$REGION 'Designer Managed Code'}
/// <summary>
/// Required method for Designer support -- do not modify
/// the contents of this method with the code editor.
/// </summary>
procedure TWebForm1.InitializeComponent;
begin
  Include(Self.btnLogin.Click, Self.btnLogin_Click);
  Include(Self.btnSair.Click, Self.btnSair_Click);
//  Self.AutoPostBackControl := nil;
  Include(Self.Load, Self.Page_Load);
end;
{$ENDREGION}

procedure TWebForm1.Page_Load(sender: System.Object; e: System.EventArgs);
begin
  // TODO: Put user code to initialize the page here
  if not IsPostBack then
    Randomize;

  try
    if Session['jog_codi'] = nil then
    begin
      panLogin.Visible := True;
      panAcesso.Visible := False;
      nome_joga := '';
    end
    else
    begin
      panLogin.Visible := False;
      panAcesso.Visible := True;
      try
        if Session['jog_apel'] = nil then
          nome_joga := Session['jog_nome'].ToString
        else
          nome_joga := Session['jog_apel'].ToString;
      finally
      end;
    end;
    try
      DatMod := TDataModule.Create;
      if DatMod.Conecta then
      begin
        dr := DatMod.FbPosicao.ExecuteReader;
        while dr.Read do
        begin
          if dr['DESCRICAO'].ToString = '1' then
          begin
            data_hora := dr['DATA_ATUAL'].ToString;
            participantes := dr['VALOR'].ToString;
          end
          else
          if dr['DESCRICAO'].ToString = '2' then
            tabelas := dr['VALOR'].ToString
          else
          if dr['DESCRICAO'].ToString = '3' then
            p1 := dr['VALOR'].ToString
          else
          if dr['DESCRICAO'].ToString = '4' then
            p2 := dr['VALOR'].ToString
          else
          if dr['DESCRICAO'].ToString = '5' then
            p3 := dr['VALOR'].ToString
          else
          if dr['DESCRICAO'].ToString = '6' then
            p4 := dr['VALOR'].ToString
          else
          if dr['DESCRICAO'].ToString = '7' then
            p5 := dr['VALOR'].ToString
          else
          if dr['DESCRICAO'].ToString = '8' then
            pf1 := dr['VALOR'].ToString;
        end;
        p1 := FloatToStrF(StrToFloat(p1), ffCurrency, 9, 2);
        p2 := FloatToStrF(StrToFloat(p2), ffCurrency, 9, 2);
        p3 := FloatToStrF(StrToFloat(p3), ffCurrency, 9, 2);
        p4 := FloatToStrF(StrToFloat(p4), ffCurrency, 9, 2);
        p5 := FloatToStrF(StrToFloat(p5), ffCurrency, 9, 2);
        pf1 := FloatToStrF(StrToFloat(pf1), ffCurrency, 9, 2);
        p1 := '50%';
        p2 := '20%';
        p3 := '10%';
        p4 := '6%';
        p5 := '4%';
        pf1 := '10%';
        tabelas := '0';
        dr.Close;
        DatMod.Desconecta;
        DatMod.Dispose;
      end;
    except
      p1 := '50%';
      p2 := '20%';
      p3 := '10%';
      p4 := '6%';
      p5 := '4%';
      pf1 := '10%';
      participantes := '0';
      tabelas := '0';
    end;
  except
    panLogin.Visible := True;
    panAcesso.Visible := False;
    nome_joga := '';
  end;

end;

procedure TWebForm1.OnInit(e: EventArgs);
begin
  //
  // Required for Designer support
  //
  InitializeComponent;
  inherited OnInit(e);
end;

procedure TWebForm1.btnSair_Click(sender: System.Object; e: System.EventArgs);
begin
  Session.RemoveAll;
  Session.Clear;
  panAcesso.Visible := False;
  panLogin.Visible := True;
  Response.Redirect('index.aspx');
end;

procedure TWebForm1.btnLogin_Click(sender: System.Object; e: System.EventArgs);
var
  email, senha: string;
  cod_jog: integer;
  script: StringBuilder;

begin
  labMens.Text := '';
  try
    DatMod := TDataModule.Create;
    DatMod.FbCon.Open;
    email := DatMod.Limpa(txtLogin.Text.ToLower);
    senha := DatMod.Limpa(txtSenha.Text);
    cod_jog := DatMod.VerificaUser(email, senha, jog_nome, jog_apel);
    if cod_jog <> -1 then
    begin
      Session.Add('jog_codi', cod_jog.ToString);
      Session.Add('jog_nome', jog_nome);
      Session.Add('jog_apel', jog_apel);
      if jog_apel = '' then
        nome_joga := jog_nome
      else
        nome_joga := jog_apel;
      panAcesso.Visible := True;
      panLogin.Visible := False;
//      if cod_jog = 0 then
//        Response.Redirect('admin.aspx')
//      else
      Response.Redirect('apostas.aspx');
    end
    else
    begin
      labMens.Text := 'Mensagem: Acesso negado. Usuário ou senha inválidos!';
      script := StringBuilder.Create;
      script.Append('<script language="JavaScript">');
      script.Append('alert(''Acesso negado!!! Usuário ou senha inválidos!!'')');
      script.Append('</script>');
      RegisterClientScriptBlock('mensagem', script.ToString);
    end;
  finally
    DatMod.FbCon.Close;
    DatMod.Dispose;
  end;
end;

end.

