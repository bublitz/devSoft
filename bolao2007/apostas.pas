
unit apostas;

interface

uses
  System.Collections, System.ComponentModel, untDatMod,
  System.Data, System.Drawing, System.Web, System.Web.SessionState,
  System.Web.UI, System.Web.UI.WebControls, System.Web.UI.HtmlControls,
  FirebirdSql.Data.FirebirdClient, System.Globalization, Borland.Vcl.SysUtils,
  MagicAjax.UI.Controls, System.Text;

type
  TWebForm2 = class(System.Web.UI.Page)
  {$REGION 'Designer Managed Code'}
  strict private
    procedure InitializeComponent;
    procedure DataGrid1_SelectedIndexChanged(sender: System.Object; e: System.EventArgs);
    procedure btnA_Click(sender: System.Object; e: System.EventArgs);
    procedure btnB_Click(sender: System.Object; e: System.EventArgs);
    procedure btnC_Click(sender: System.Object; e: System.EventArgs);
    procedure btnD_Click(sender: System.Object; e: System.EventArgs);
    procedure btnE_Click(sender: System.Object; e: System.EventArgs);
    procedure btnF_Click(sender: System.Object; e: System.EventArgs);
    procedure btnG_Click(sender: System.Object; e: System.EventArgs);
    procedure btnH_Click(sender: System.Object; e: System.EventArgs);
    procedure btnAltera4_Click(sender: System.Object; e: System.EventArgs);
    procedure btnFase3_Click(sender: System.Object; e: System.EventArgs);
    procedure btnFase4_Click(sender: System.Object; e: System.EventArgs);
    procedure btnFase5_Click(sender: System.Object; e: System.EventArgs);
    procedure btnAlteraSemi_Click(sender: System.Object; e: System.EventArgs);
    procedure btnAlteraFinal_Click(sender: System.Object; e: System.EventArgs);
    procedure btnTableFull_Click(sender: System.Object; e: System.EventArgs);
    procedure btnGravarG_Click(sender: System.Object; e: System.EventArgs);
    procedure g1q1_SelectedIndexChanged(sender: System.Object; e: System.EventArgs);
    procedure btnFase2_Click(sender: System.Object; e: System.EventArgs);
  {$ENDREGION}
  strict private
    procedure Page_Load(sender: System.Object; e: System.EventArgs);
  strict protected
    DataGrid1: System.Web.UI.WebControls.DataGrid;
    TABELA: System.Data.DataTable;
    COD_TABELA: System.Data.DataColumn;
    COD_JOGADOR: System.Data.DataColumn;
    PONTOS: System.Data.DataColumn;
    panFase1: System.Web.UI.WebControls.Panel;
    panOitavas: System.Web.UI.WebControls.Panel;
    btnA: System.Web.UI.WebControls.Button;
    btnB: System.Web.UI.WebControls.Button;
    btnC: System.Web.UI.WebControls.Button;
    btnD: System.Web.UI.WebControls.Button;
    btnE: System.Web.UI.WebControls.Button;
    btnF: System.Web.UI.WebControls.Button;
    btnG: System.Web.UI.WebControls.Button;
    btnH: System.Web.UI.WebControls.Button;
    btnFase2: System.Web.UI.WebControls.Button;
    btnFase3: System.Web.UI.WebControls.Button;
    btnFase4: System.Web.UI.WebControls.Button;
    btnFase5: System.Web.UI.WebControls.Button;
    panFase2: System.Web.UI.WebControls.Panel;
    panQuartas: System.Web.UI.WebControls.Panel;
    panSemi: System.Web.UI.WebControls.Panel;
//    panFinal: System.Web.UI.WebControls.Panel;
    Panel1: System.Web.UI.WebControls.Panel;
    Panel2: System.Web.UI.WebControls.Panel;
    Panel3: System.Web.UI.WebControls.Panel;
    Panel4: System.Web.UI.WebControls.Panel;
    Panel5: System.Web.UI.WebControls.Panel;
    Panel6: System.Web.UI.WebControls.Panel;
    Panel7: System.Web.UI.WebControls.Panel;
    btnAltera4: System.Web.UI.WebControls.Button;
    Panel8: System.Web.UI.WebControls.Panel;
    btnAlteraSemi: System.Web.UI.WebControls.Button;
    Panel9: System.Web.UI.WebControls.Panel;
    btnAlteraFinal: System.Web.UI.WebControls.Button;
    Panel10: System.Web.UI.WebControls.Panel;
    Panel11: System.Web.UI.WebControls.Panel;
    Panel12: System.Web.UI.WebControls.Panel;
    btnTableFull: System.Web.UI.WebControls.Button;
    AjaxPanel1: MagicAjax.UI.Controls.AjaxPanel;
    panGrupos: System.Web.UI.WebControls.Panel;
    g1j1: System.Web.UI.WebControls.DropDownList;
    g1j2: System.Web.UI.WebControls.DropDownList;
    Panel14: System.Web.UI.WebControls.Panel;
    Panel15: System.Web.UI.WebControls.Panel;
    AjaxPanel2: MagicAjax.UI.Controls.AjaxPanel;
    g1j4: System.Web.UI.WebControls.DropDownList;
    Panel16: System.Web.UI.WebControls.Panel;
    Panel17: System.Web.UI.WebControls.Panel;
    AjaxPanel3: MagicAjax.UI.Controls.AjaxPanel;
    g1j3: System.Web.UI.WebControls.DropDownList;
    Panel18: System.Web.UI.WebControls.Panel;
    Panel19: System.Web.UI.WebControls.Panel;
    AjaxPanel4: MagicAjax.UI.Controls.AjaxPanel;
    g1j5: System.Web.UI.WebControls.DropDownList;
    Panel20: System.Web.UI.WebControls.Panel;
    Panel21: System.Web.UI.WebControls.Panel;
    AjaxPanel5: MagicAjax.UI.Controls.AjaxPanel;
    g1j6: System.Web.UI.WebControls.DropDownList;
    Panel22: System.Web.UI.WebControls.Panel;
    Panel23: System.Web.UI.WebControls.Panel;
    AjaxPanel6: MagicAjax.UI.Controls.AjaxPanel;
    g2j1: System.Web.UI.WebControls.DropDownList;
    Panel24: System.Web.UI.WebControls.Panel;
    Panel25: System.Web.UI.WebControls.Panel;
    AjaxPanel7: MagicAjax.UI.Controls.AjaxPanel;
    g2j2: System.Web.UI.WebControls.DropDownList;
    Panel26: System.Web.UI.WebControls.Panel;
    Panel27: System.Web.UI.WebControls.Panel;
    AjaxPanel8: MagicAjax.UI.Controls.AjaxPanel;
    g2j3: System.Web.UI.WebControls.DropDownList;
    Panel28: System.Web.UI.WebControls.Panel;
    Panel29: System.Web.UI.WebControls.Panel;
    AjaxPanel9: MagicAjax.UI.Controls.AjaxPanel;
    g2j4: System.Web.UI.WebControls.DropDownList;
    Panel30: System.Web.UI.WebControls.Panel;
    Panel31: System.Web.UI.WebControls.Panel;
    AjaxPanel10: MagicAjax.UI.Controls.AjaxPanel;
    g2j5: System.Web.UI.WebControls.DropDownList;
    Panel32: System.Web.UI.WebControls.Panel;
    Panel33: System.Web.UI.WebControls.Panel;
    AjaxPanel11: MagicAjax.UI.Controls.AjaxPanel;
    g2j6: System.Web.UI.WebControls.DropDownList;
    Panel34: System.Web.UI.WebControls.Panel;
    Panel35: System.Web.UI.WebControls.Panel;
    AjaxPanel12: MagicAjax.UI.Controls.AjaxPanel;
    btnGravarG: System.Web.UI.WebControls.Button;
    Label1: System.Web.UI.WebControls.Label;
    Label2: System.Web.UI.WebControls.Label;
    Label3: System.Web.UI.WebControls.Label;
    Label4: System.Web.UI.WebControls.Label;
    Label5: System.Web.UI.WebControls.Label;
    Label6: System.Web.UI.WebControls.Label;
    Panel36: System.Web.UI.WebControls.Panel;
    Panel37: System.Web.UI.WebControls.Panel;
    AjaxPanel13: MagicAjax.UI.Controls.AjaxPanel;
    Panel38: System.Web.UI.WebControls.Panel;
    Panel39: System.Web.UI.WebControls.Panel;
    AjaxPanel14: MagicAjax.UI.Controls.AjaxPanel;
    Panel40: System.Web.UI.WebControls.Panel;
    Panel41: System.Web.UI.WebControls.Panel;
    AjaxPanel15: MagicAjax.UI.Controls.AjaxPanel;
    Panel42: System.Web.UI.WebControls.Panel;
    Panel43: System.Web.UI.WebControls.Panel;
    AjaxPanel16: MagicAjax.UI.Controls.AjaxPanel;
    Panel44: System.Web.UI.WebControls.Panel;
    Panel45: System.Web.UI.WebControls.Panel;
    AjaxPanel17: MagicAjax.UI.Controls.AjaxPanel;
    Panel46: System.Web.UI.WebControls.Panel;
    Panel47: System.Web.UI.WebControls.Panel;
    AjaxPanel18: MagicAjax.UI.Controls.AjaxPanel;
    Panel48: System.Web.UI.WebControls.Panel;
    Panel49: System.Web.UI.WebControls.Panel;
    AjaxPanel19: MagicAjax.UI.Controls.AjaxPanel;
    Panel50: System.Web.UI.WebControls.Panel;
    Panel51: System.Web.UI.WebControls.Panel;
    AjaxPanel20: MagicAjax.UI.Controls.AjaxPanel;
    ho1: System.Web.UI.WebControls.Label;
    s1o1: System.Web.UI.WebControls.Label;
    g1o1: System.Web.UI.WebControls.DropDownList;
    g2o1: System.Web.UI.WebControls.DropDownList;
    s2o1: System.Web.UI.WebControls.Label;
    do1: System.Web.UI.WebControls.RadioButtonList;
    ho2: System.Web.UI.WebControls.Label;
    s1o2: System.Web.UI.WebControls.Label;
    g1o2: System.Web.UI.WebControls.DropDownList;
    g2o2: System.Web.UI.WebControls.DropDownList;
    s2o2: System.Web.UI.WebControls.Label;
    do2: System.Web.UI.WebControls.RadioButtonList;
    ho3: System.Web.UI.WebControls.Label;
    s1o3: System.Web.UI.WebControls.Label;
    g1o3: System.Web.UI.WebControls.DropDownList;
    g2o3: System.Web.UI.WebControls.DropDownList;
    s2o3: System.Web.UI.WebControls.Label;
    do3: System.Web.UI.WebControls.RadioButtonList;
    ho4: System.Web.UI.WebControls.Label;
    s1o4: System.Web.UI.WebControls.Label;
    g1o4: System.Web.UI.WebControls.DropDownList;
    g2o4: System.Web.UI.WebControls.DropDownList;
    s2o4: System.Web.UI.WebControls.Label;
    do4: System.Web.UI.WebControls.RadioButtonList;
    ho5: System.Web.UI.WebControls.Label;
    s1o5: System.Web.UI.WebControls.Label;
    g1o5: System.Web.UI.WebControls.DropDownList;
    g2o5: System.Web.UI.WebControls.DropDownList;
    s2o5: System.Web.UI.WebControls.Label;
    do5: System.Web.UI.WebControls.RadioButtonList;
    ho6: System.Web.UI.WebControls.Label;
    s1o6: System.Web.UI.WebControls.Label;
    g1o6: System.Web.UI.WebControls.DropDownList;
    g2o6: System.Web.UI.WebControls.DropDownList;
    s2o6: System.Web.UI.WebControls.Label;
    do6: System.Web.UI.WebControls.RadioButtonList;
    ho7: System.Web.UI.WebControls.Label;
    s1o7: System.Web.UI.WebControls.Label;
    g1o7: System.Web.UI.WebControls.DropDownList;
    g2o7: System.Web.UI.WebControls.DropDownList;
    s2o7: System.Web.UI.WebControls.Label;
    do7: System.Web.UI.WebControls.RadioButtonList;
    ho8: System.Web.UI.WebControls.Label;
    s1o8: System.Web.UI.WebControls.Label;
    g1o8: System.Web.UI.WebControls.DropDownList;
    g2o8: System.Web.UI.WebControls.DropDownList;
    s2o8: System.Web.UI.WebControls.Label;
    do8: System.Web.UI.WebControls.RadioButtonList;
    hq1: System.Web.UI.WebControls.Label;
    s1q1: System.Web.UI.WebControls.Label;
    g1q1: System.Web.UI.WebControls.DropDownList;
    g2q1: System.Web.UI.WebControls.DropDownList;
    s2q1: System.Web.UI.WebControls.Label;
    dq1: System.Web.UI.WebControls.RadioButtonList;
    hq2: System.Web.UI.WebControls.Label;
    s1q2: System.Web.UI.WebControls.Label;
    g1q2: System.Web.UI.WebControls.DropDownList;
    g2q2: System.Web.UI.WebControls.DropDownList;
    s2q2: System.Web.UI.WebControls.Label;
    dq2: System.Web.UI.WebControls.RadioButtonList;
    hq3: System.Web.UI.WebControls.Label;
    s1q3: System.Web.UI.WebControls.Label;
    g1q3: System.Web.UI.WebControls.DropDownList;
    g2q3: System.Web.UI.WebControls.DropDownList;
    s2q3: System.Web.UI.WebControls.Label;
    dq3: System.Web.UI.WebControls.RadioButtonList;
    hq4: System.Web.UI.WebControls.Label;
    s1q4: System.Web.UI.WebControls.Label;
    g1q4: System.Web.UI.WebControls.DropDownList;
    g2q4: System.Web.UI.WebControls.DropDownList;
    s2q4: System.Web.UI.WebControls.Label;
    dq4: System.Web.UI.WebControls.RadioButtonList;
    hs1: System.Web.UI.WebControls.Label;
    s1s1: System.Web.UI.WebControls.Label;
    g1s1: System.Web.UI.WebControls.DropDownList;
    g2s1: System.Web.UI.WebControls.DropDownList;
    s2s1: System.Web.UI.WebControls.Label;
    ds1: System.Web.UI.WebControls.RadioButtonList;
    hs2: System.Web.UI.WebControls.Label;
    s1s2: System.Web.UI.WebControls.Label;
    g1s2: System.Web.UI.WebControls.DropDownList;
    g2s2: System.Web.UI.WebControls.DropDownList;
    s2s2: System.Web.UI.WebControls.Label;
    ds2: System.Web.UI.WebControls.RadioButtonList;
    hf1: System.Web.UI.WebControls.Label;
    s1f1: System.Web.UI.WebControls.Label;
    g1f1: System.Web.UI.WebControls.DropDownList;
    g2f1: System.Web.UI.WebControls.DropDownList;
    s2f1: System.Web.UI.WebControls.Label;
    df1: System.Web.UI.WebControls.RadioButtonList;
    hf2: System.Web.UI.WebControls.Label;
    s1f2: System.Web.UI.WebControls.Label;
    g1f2: System.Web.UI.WebControls.DropDownList;
    g2f2: System.Web.UI.WebControls.DropDownList;
    s2f2: System.Web.UI.WebControls.Label;
    df2: System.Web.UI.WebControls.RadioButtonList;
    Button1: System.Web.UI.WebControls.Button;
    Button2: System.Web.UI.WebControls.Button;
    Button3: System.Web.UI.WebControls.Button;
    Button10: System.Web.UI.WebControls.Button;
    DropDownList1: System.Web.UI.WebControls.DropDownList;
    DropDownList2: System.Web.UI.WebControls.DropDownList;
    Label7: System.Web.UI.WebControls.Label;
    DropDownList3: System.Web.UI.WebControls.DropDownList;
    DropDownList4: System.Web.UI.WebControls.DropDownList;
    Label8: System.Web.UI.WebControls.Label;
    DropDownList5: System.Web.UI.WebControls.DropDownList;
    DropDownList6: System.Web.UI.WebControls.DropDownList;
    Label9: System.Web.UI.WebControls.Label;
    DropDownList7: System.Web.UI.WebControls.DropDownList;
    DropDownList8: System.Web.UI.WebControls.DropDownList;
    Label10: System.Web.UI.WebControls.Label;
    DropDownList9: System.Web.UI.WebControls.DropDownList;
    DropDownList10: System.Web.UI.WebControls.DropDownList;
    Label11: System.Web.UI.WebControls.Label;
    DropDownList11: System.Web.UI.WebControls.DropDownList;
    DropDownList12: System.Web.UI.WebControls.DropDownList;
    Label12: System.Web.UI.WebControls.Label;
    panGrupo: System.Web.UI.WebControls.Panel;
    Button11: System.Web.UI.WebControls.Button;
    RadioButtonList1: System.Web.UI.WebControls.RadioButtonList;
    Label13: System.Web.UI.WebControls.Label;
    DropDownList13: System.Web.UI.WebControls.DropDownList;
    DropDownList14: System.Web.UI.WebControls.DropDownList;
    Label14: System.Web.UI.WebControls.Label;
    Label15: System.Web.UI.WebControls.Label;
    RadioButtonList2: System.Web.UI.WebControls.RadioButtonList;
    Label16: System.Web.UI.WebControls.Label;
    DropDownList15: System.Web.UI.WebControls.DropDownList;
    DropDownList16: System.Web.UI.WebControls.DropDownList;
    Label17: System.Web.UI.WebControls.Label;
    Label18: System.Web.UI.WebControls.Label;
    panFinal: System.Web.UI.WebControls.Panel;
    Button12: System.Web.UI.WebControls.Button;
    RadioButtonList3: System.Web.UI.WebControls.RadioButtonList;
    Label19: System.Web.UI.WebControls.Label;
    DropDownList17: System.Web.UI.WebControls.DropDownList;
    DropDownList18: System.Web.UI.WebControls.DropDownList;
    Label20: System.Web.UI.WebControls.Label;
    Label21: System.Web.UI.WebControls.Label;
    RadioButtonList4: System.Web.UI.WebControls.RadioButtonList;
    Label22: System.Web.UI.WebControls.Label;
    DropDownList19: System.Web.UI.WebControls.DropDownList;
    DropDownList20: System.Web.UI.WebControls.DropDownList;
    Label23: System.Web.UI.WebControls.Label;
    Label24: System.Web.UI.WebControls.Label;
    Panel54: System.Web.UI.WebControls.Panel;
    bttC: System.Web.UI.WebControls.Button;
    bttD: System.Web.UI.WebControls.Button;
    bttE: System.Web.UI.WebControls.Button;
    bttF: System.Web.UI.WebControls.Button;
    bttG: System.Web.UI.WebControls.Button;
    bttH: System.Web.UI.WebControls.Button;
    btnAltera8: System.Web.UI.WebControls.Button;
    Panel13: System.Web.UI.WebControls.Panel;
    procedure OnInit(e: EventArgs); override;
  private
    { Private Declarations }
    DatMod: TDataModule;
    dr: FbDataReader;
    procedure EscondePanels;
    function GeraTabela(grupo: string): string;
    procedure AtuJogo(num_jogo: integer;
      l1, l2, l3: System.Web.UI.WebControls.Label;
      g1, g2: System.Web.UI.WebControls.DropDownList;
      de: System.Web.UI.WebControls.RadioButtonList);
    procedure GravaJogo(num_jogo: integer;
      l1, l2, l3: System.Web.UI.WebControls.Label;
      g1, g2: System.Web.UI.WebControls.DropDownList;
      de: System.Web.UI.WebControls.RadioButtonList);
    procedure VerificaFases;
    procedure VerificaGrupos;
    procedure MostraGrupo(codGrupo: String);
  public
    { Public Declarations }
    num_tabela, grupo, tabela_class,
      d1, d2, d3, d4, d5, d6, t1j1, t1j2, t1j3, t1j4, t1j5, t1j6,
      t2j1, t2j2, t2j3, t2j4, t2j5, t2j6 : string;
  end;

implementation

{$REGION 'Designer Managed Code'}
/// <summary>
/// Required method for Designer support -- do not modify
/// the contents of this method with the code editor.
/// </summary>
procedure TWebForm2.InitializeComponent;
begin
  Self.TABELA := System.Data.DataTable.Create;
  Self.COD_TABELA := System.Data.DataColumn.Create;
  Self.COD_JOGADOR := System.Data.DataColumn.Create;
  Self.PONTOS := System.Data.DataColumn.Create;
  (System.ComponentModel.ISupportInitialize(Self.TABELA)).BeginInit;
  Include(Self.DataGrid1.SelectedIndexChanged, Self.DataGrid1_SelectedIndexChanged);
  Include(Self.btnA.Click, Self.btnA_Click);
  Include(Self.btnB.Click, Self.btnB_Click);
  Include(Self.bttC.Click, Self.btnC_Click);
  Include(Self.bttD.Click, Self.btnD_Click);
  Include(Self.bttE.Click, Self.btnE_Click);
  Include(Self.bttF.Click, Self.btnF_Click);
  Include(Self.bttG.Click, Self.btnG_Click);
  Include(Self.bttH.Click, Self.btnH_Click);
  Include(Self.btnFase2.Click, Self.btnFase2_Click);
  Include(Self.btnFase3.Click, Self.btnFase3_Click);
  Include(Self.btnFase4.Click, Self.btnFase4_Click);
  Include(Self.btnFase5.Click, Self.btnFase5_Click);
  Include(Self.g1q1.SelectedIndexChanged, Self.g1q1_SelectedIndexChanged);
  Include(Self.g2q1.SelectedIndexChanged, Self.g1q1_SelectedIndexChanged);
  Include(Self.btnAltera4.Click, Self.btnAltera4_Click);
  
  // 
  // TABELA
  // 
  Self.TABELA.TableName := 'TABELA';
  // 
  // COD_TABELA
  // 
  Self.COD_TABELA.AllowDBNull := False;
  Self.COD_TABELA.ColumnName := 'COD_TABELA';
  Self.COD_TABELA.MaxLength := 12;
  // 
  // COD_JOGADOR
  // 
  Self.COD_JOGADOR.ColumnName := 'COD_JOGADOR';
  // 
  // PONTOS
  // 
  Self.PONTOS.ColumnName := 'PONTOS';
//  Self.AutoPostBackControl := nil;
  Include(Self.Load, Self.Page_Load);
  (System.ComponentModel.ISupportInitialize(Self.TABELA)).EndInit;
end;
{$ENDREGION}

function StrZero(Num:Real; Zeros, Deci:integer): string;
var
  tam, z: integer;
  res, zer: string;

begin
  Str(Num: Zeros: Deci, res);
  res := Trim(res);
  tam := Length(res);
  zer := '';
  for z := 1 to (Zeros - tam) do
    zer := zer + '0';
  Result := zer + res;
end;

procedure TWebForm2.Page_Load(sender: System.Object; e: System.EventArgs);
begin
  // TODO: Put user code to initialize the page here
  if (Session['jog_codi'] = nil) then
    Response.Redirect('index.aspx');

  //btnTableFull.Visible := (Session['num_tabela'] <> nil);

  try
    DatMod := TDataModule.Create;
    if DatMod.Conecta then
    begin
      //btnTableFull.Visible := (Session['num_tabela'] <> nil);
      VerificaFases;

      if not IsPostBack then
      begin
        DatMod.FbTabela.SelectCommand.Parameters['@codjog'].Value := Session['jog_codi'].toString;
        DataGrid1.DataSource := DatMod.FbTabela.SelectCommand.ExecuteReader;
        DataGrid1.DataBind;

        if Session['num_tabela'] <> nil then
        begin
          DataGrid1.SelectedIndex := StrToInt(Session['sel_tabela'].ToString);
          panFase1.Visible := True;
          EscondePanels;
          if Session['cod_grupo'] <> nil then
          begin
            VerificaGrupos;
            if Session['cod_grupo'].ToString = 'A' then
              btnA_Click(Sender, e)
            else
            if Session['cod_grupo'].ToString = 'B' then
              btnB_Click(Sender, e)
            else
            if Session['cod_grupo'].ToString = 'C' then
              btnC_Click(Sender, e)
            else
            if Session['cod_grupo'].ToString = 'D' then
              btnD_Click(Sender, e)
            else
            if Session['cod_grupo'].ToString = 'E' then
              btnE_Click(Sender, e)
            else
            if Session['cod_grupo'].ToString = 'F' then
              btnF_Click(Sender, e)
            else
            if Session['cod_grupo'].ToString = 'G' then
              btnG_Click(Sender, e)
            else
            if Session['cod_grupo'].ToString = 'H' then
              btnH_Click(Sender, e)
            else
            if Session['cod_grupo'].ToString = '8' then
              btnFase2_Click(Sender, e)
            else
            if Session['cod_grupo'].ToString = '4' then
              btnFase3_Click(Sender, e)
            else
            if Session['cod_grupo'].ToString = '2' then
              btnFase4_Click(Sender, e)
            else
            if Session['cod_grupo'].ToString = '1' then
              btnFase5_Click(Sender, e);
          end;
        end;
      end;
    end;
  finally
    DatMod.Desconecta;
    DatMod.Dispose;
  end;
end;

procedure TWebForm2.VerificaFases;
var
  verifica: string;

begin
  if Session['num_tabela'] <> nil then
  begin
    panFase1.Visible := True;
    panFase2.Visible := False;
    btnFase3.Visible := False;
    btnFase4.Visible := False;
    btnFase5.Visible := False;

    num_tabela := Session['num_tabela'].ToString;
    DatMod.FbVerificaFase.SelectCommand.Parameters['@fase'].Value := '1';
    DatMod.FbVerificaFase.SelectCommand.Parameters['@codtabela'].Value := num_tabela;
    verifica := DatMod.FbVerificaFase.SelectCommand.ExecuteScalar.ToString;
    if verifica = '0' then
    begin
      panFase2.Visible := True;
      btnFase3.Visible := True;
      DatMod.FbVerificaFase.SelectCommand.Parameters['@fase'].Value := '2';
      DatMod.FbVerificaFase.SelectCommand.Parameters['@codtabela'].Value := num_tabela;
      verifica := DatMod.FbVerificaFase.SelectCommand.ExecuteScalar.ToString;
      if verifica = '0' then
      begin
        btnFase4.Visible := True;
        DatMod.FbVerificaFase.SelectCommand.Parameters['@fase'].Value := '3';
        DatMod.FbVerificaFase.SelectCommand.Parameters['@codtabela'].Value := num_tabela;
        verifica := DatMod.FbVerificaFase.SelectCommand.ExecuteScalar.ToString;
        btnFase5.Visible := (verifica = '0');
      end;
    end;
  end;
  VerificaGrupos;
end;

procedure TWebForm2.VerificaGrupos;
var
  destime, sql, codtime, codtime1, codtime2, res: string;
  i, numjogo: integer;

begin
  // Verifica as fases seguintes quando houver alterações
  if btnFase3.Visible then
  begin
    for i := 0 to 3 do
    begin
      numjogo := 19 + i;
      DatMod.FbJogoTabela.SelectCommand.Parameters['@numjogo'].Value := numjogo.ToString;
      DatMod.FbJogoTabela.SelectCommand.Parameters['@codtabela'].Value := Session['num_tabela'].ToString;
      dr := DatMod.FbJogoTabela.SelectCommand.ExecuteReader;
      if dr.Read then
      begin
        res := dr.GetString(9);
        if res = '1' then
          codtime := dr.GetString(6)
        else
          codtime := dr.GetString(7);
      end;
      dr.Close;

      destime := 'V' + numjogo.ToString;
      sql := 'update APOSTAS set COD_TIME2=' + codtime +
          ' where COD_TABELA=''' + Session['num_tabela'].ToString +
          ''' and NUM_JOGO in (select NUM_JOGO from JOGOS where DESC_TIME2=''' +
          destime + ''')';
      DatMod.FbGrupoTabela.UpdateCommand.CommandText := sql;
      DatMod.FbGrupoTabela.UpdateCommand.ExecuteNonQuery;

      sql := 'update APOSTAS set COD_TIME1=' + codtime +
          ' where COD_TABELA=''' + Session['num_tabela'].ToString +
          ''' and NUM_JOGO in (select NUM_JOGO from JOGOS where DESC_TIME1=''' +
          destime + ''')';
      DatMod.FbGrupoTabela.UpdateCommand.CommandText := sql;
      DatMod.FbGrupoTabela.UpdateCommand.ExecuteNonQuery;
    end;
  end;
  if btnFase4.Visible then
  begin
    for i := 0 to 1 do
    begin
      numjogo := 23 + i;
      DatMod.FbJogoTabela.SelectCommand.Parameters['@numjogo'].Value := numjogo.ToString;
      DatMod.FbJogoTabela.SelectCommand.Parameters['@codtabela'].Value := Session['num_tabela'].ToString;
      dr := DatMod.FbJogoTabela.SelectCommand.ExecuteReader;
      if dr.Read then
      begin
        res := dr.GetString(9);
        if res = '1' then
        begin
          codtime1 := dr.GetString(6);
          codtime2 := dr.GetString(7);
        end
        else
        begin
          codtime1 := dr.GetString(7);
          codtime2 := dr.GetString(6);
        end;
      end;
      dr.Close;

      destime := 'V' + numjogo.ToString;
      sql := 'update APOSTAS set COD_TIME2=' + codtime1 +
          ' where COD_TABELA=''' + Session['num_tabela'].ToString +
          ''' and NUM_JOGO in (select NUM_JOGO from JOGOS where DESC_TIME2=''' +
          destime + ''')';
      DatMod.FbGrupoTabela.UpdateCommand.CommandText := sql;
      DatMod.FbGrupoTabela.UpdateCommand.ExecuteNonQuery;

      sql := 'update APOSTAS set COD_TIME1=' + codtime1 +
          ' where COD_TABELA=''' + Session['num_tabela'].ToString +
          ''' and NUM_JOGO in (select NUM_JOGO from JOGOS where DESC_TIME1=''' +
          destime + ''')';
      DatMod.FbGrupoTabela.UpdateCommand.CommandText := sql;
      DatMod.FbGrupoTabela.UpdateCommand.ExecuteNonQuery;

      destime := 'P' + numjogo.ToString;
      sql := 'update APOSTAS set COD_TIME2=' + codtime2 +
          ' where COD_TABELA=''' + Session['num_tabela'].ToString +
          ''' and NUM_JOGO in (select NUM_JOGO from JOGOS where DESC_TIME2=''' +
          destime + ''')';
      DatMod.FbGrupoTabela.UpdateCommand.CommandText := sql;
      DatMod.FbGrupoTabela.UpdateCommand.ExecuteNonQuery;

      sql := 'update APOSTAS set COD_TIME1=' + codtime2 +
          ' where COD_TABELA=''' + Session['num_tabela'].ToString +
          ''' and NUM_JOGO in (select NUM_JOGO from JOGOS where DESC_TIME1=''' +
          destime + ''')';
      DatMod.FbGrupoTabela.UpdateCommand.CommandText := sql;
      DatMod.FbGrupoTabela.UpdateCommand.ExecuteNonQuery;
    end;
  end;
end;

procedure TWebForm2.MostraGrupo(codGrupo: String);
begin
  EscondePanels;
  Session['cod_grupo'] := codGrupo;
  panGrupo.Visible := True;
  DatMod := TDataModule.Create;
  DatMod.FbCon.Open;
  try
    tabela_class := GeraTabela(codGrupo);
  finally
    DatMod.FbCon.Close;
    DatMod.Dispose;
  end;
end;

procedure TWebForm2.btnFase2_Click(sender: System.Object; e: System.EventArgs);
begin
  EscondePanels;
  panQuartas.Visible := True;
  DatMod := TDataModule.Create;
  try
    DatMod.FbCon.Open;
    AtuJogo(49, ho1, s1o1, s2o1, g1o1, g2o1, do1);
    AtuJogo(50, ho2, s1o2, s2o2, g1o2, g2o2, do2);
    AtuJogo(51, ho3, s1o3, s2o3, g1o3, g2o3, do3);
    AtuJogo(52, ho4, s1o4, s2o4, g1o4, g2o4, do4);
    AtuJogo(53, ho5, s1o5, s2o5, g1o5, g2o5, do5);
    AtuJogo(54, ho6, s1o6, s2o6, g1o6, g2o6, do6);
    AtuJogo(55, ho7, s1o7, s2o7, g1o7, g2o7, do7);
    AtuJogo(56, ho8, s1o8, s2o8, g1o8, g2o8, do8);
  finally
    DatMod.FbCon.Close;
    DatMod.Dispose;
  end;
end;

procedure TWebForm2.g1q1_SelectedIndexChanged(sender: System.Object; e: System.EventArgs);
begin
  dq1.Visible := (g1q1.SelectedValue = g2q1.SelectedValue);
end;

// Gravar jogos dos grupos
procedure TWebForm2.btnGravarG_Click(sender: System.Object; e: System.EventArgs);
const
  grupos = 'ABCDEFGH';

var
  i, gol1, gol2, resul, t: integer;
  numjogo, codtime, destime, sql, temp: string;
  pontos3: array[1..3] of string; // Pontuação dos terceiros colocados

begin
  try
    DatMod := TDataModule.Create;
    DatMod.FbCon.Open;

    for i := 0 to 5 do
    begin
      if i = 0 then
      begin
        numjogo := Label1.Text;
        gol1 := StrToInt(g1j1.SelectedValue);
        gol2 := StrToInt(g2j1.SelectedValue);
      end
      else
      if i = 1 then
      begin
        numjogo := Label2.Text;
        gol1 := StrToInt(g1j2.SelectedValue);
        gol2 := StrToInt(g2j2.SelectedValue);
      end
      else
      if i = 2 then
      begin
        numjogo := Label3.Text;
        gol1 := StrToInt(g1j3.SelectedValue);
        gol2 := StrToInt(g2j3.SelectedValue);
      end
      else
      if i = 3 then
      begin
        numjogo := Label4.Text;
        gol1 := StrToInt(g1j4.SelectedValue);
        gol2 := StrToInt(g2j4.SelectedValue);
      end
      else
      if i = 4 then
      begin
        numjogo := Label5.Text;
        gol1 := StrToInt(g1j5.SelectedValue);
        gol2 := StrToInt(g2j5.SelectedValue);
      end
      else
      if i = 5 then
      begin
        numjogo := Label6.Text;
        gol1 := StrToInt(g1j6.SelectedValue);
        gol2 := StrToInt(g2j6.SelectedValue);
      end;

      if gol1 > gol2 then
        resul := 1
      else
      if gol1 < gol2 then
        resul := 2
      else
        resul := 0;
      DatMod.FbGrupoTabela.UpdateCommand.CommandText := 'UPDATE APOSTAS SET' +
       ' RESULTADO = ' + resul.ToString +
       ', GOL_T1 = ' + gol1.ToString +
       ', GOL_T2 = ' + gol2.ToString +
       ' WHERE (NUM_JOGO = ' + numjogo + ') AND' +
       ' (COD_TABELA = ''' + Session['num_tabela'].ToString + ''')';

      DatMod.FbGrupoTabela.UpdateCommand.ExecuteNonQuery;
    end;

    // Atualiza Fase 2
    DatMod.FbPontoTabela.SelectCommand.Parameters['@codgrupo'].Value := Session['cod_grupo'].ToString + '%';
    DatMod.FbPontoTabela.SelectCommand.Parameters['@codtabela'].Value := Session['num_tabela'].ToString;
    dr := DatMod.FbPontoTabela.SelectCommand.ExecuteReader;

    dr.Read; // Primeiro colocado
    codtime := dr.GetString(9);
    destime := '1' + Session['cod_grupo'].ToString;
    sql := 'update APOSTAS set COD_TIME1=' + codtime +
      ' where COD_TABELA=''' + Session['num_tabela'].ToString +
      ''' and NUM_JOGO in (select NUM_JOGO from JOGOS where DESC_TIME1=''' +
      destime + ''')';
    DatMod.FbGrupoTabela.UpdateCommand.CommandText := sql;
    DatMod.FbGrupoTabela.UpdateCommand.ExecuteNonQuery;

    dr.Read; // Segundo colocado
    codtime := dr.GetString(9);
    destime := '2' + Session['cod_grupo'].ToString;
    sql := 'update APOSTAS set COD_TIME2=' + codtime +
      ' where COD_TABELA=''' + Session['num_tabela'].ToString +
      ''' and NUM_JOGO in (select NUM_JOGO from JOGOS where DESC_TIME2=''' +
      destime + ''')';
    DatMod.FbGrupoTabela.UpdateCommand.CommandText := sql;
    DatMod.FbGrupoTabela.UpdateCommand.ExecuteNonQuery;
    dr.Close;
    {
    // melhores terceiros colocados
    for i := 1 to 3 do
    begin
      DatMod.FbPontoTabela.SelectCommand.Parameters['@codgrupo'].Value := grupos[i] + '%';
      DatMod.FbPontoTabela.SelectCommand.Parameters['@codtabela'].Value := Session['num_tabela'].ToString;
      dr := DatMod.FbPontoTabela.SelectCommand.ExecuteReader;
      dr.Read;  // 1º
      dr.Read;  // 2º
      dr.Read;  // 3º
      pontos3[i] := '';
      for t := 1 to 9 do
        case t of
        1: pontos3[i] := pontos3[i] + StrZero(dr.GetInt32(t), 1, 0);
        3: pontos3[i] := pontos3[i] + StrZero(dr.GetInt32(t), 1, 0);
        8: pontos3[i] := pontos3[i] + StrZero(100 + dr.GetInt32(t), 3, 0);
        9: pontos3[i] := pontos3[i] + StrZero(dr.GetInt32(t), 2, 0);
        end;
      dr.Close;
    end;
    // ordenar array
    for i := 1 to 2 do
    begin
      if StrToInt64(pontos3[i]) < StrToInt64(pontos3[i+1]) then // troca
      begin
        temp := pontos3[i];
        pontos3[i] := pontos3[i+1];
        pontos3[i+1] := temp;
      end
    end;
    // atualiza melhores terceiros colocados
    codtime := Copy(pontos3[1], 6, 2);
    destime := '1T';
    sql := 'update APOSTAS set COD_TIME1=' + codtime +
      ' where COD_TABELA=''' + Session['num_tabela'].ToString +
      ''' and NUM_JOGO in (select NUM_JOGO from JOGOS where DESC_TIME1=''' +
      destime + ''')';
    DatMod.FbGrupoTabela.UpdateCommand.CommandText := sql;
    DatMod.FbGrupoTabela.UpdateCommand.ExecuteNonQuery;

    codtime := Copy(pontos3[2], 6, 2);
    destime := '2T';
    sql := 'update APOSTAS set COD_TIME2=' + codtime +
      ' where COD_TABELA=''' + Session['num_tabela'].ToString +
      ''' and NUM_JOGO in (select NUM_JOGO from JOGOS where DESC_TIME2=''' +
      destime + ''')';
    DatMod.FbGrupoTabela.UpdateCommand.CommandText := sql;
    DatMod.FbGrupoTabela.UpdateCommand.ExecuteNonQuery;
    }
  finally
    panGrupo.Visible := False;
    VerificaFases;
    DatMod.FbCon.Close;
    DatMod.Dispose;
  end;
end;

procedure TWebForm2.btnTableFull_Click(sender: System.Object; e: System.EventArgs);
begin
  Response.Redirect('resul_tab.aspx');
end;

procedure TWebForm2.btnAlteraFinal_Click(sender: System.Object; e: System.EventArgs);
begin
  EscondePanels;
  //panFinal.Visible := True;
  DatMod := TDataModule.Create;
  DatMod.FbCon.Open;
  try
    GravaJogo(63, hf1, s1f1, s2f1, g1f1, g2f1, df1);
    GravaJogo(64, hf2, s1f2, s2f2, g1f2, g2f2, df2);
  finally
    DatMod.FbCon.Close;
    DatMod.Dispose;
  end;
end;

procedure TWebForm2.btnAlteraSemi_Click(sender: System.Object; e: System.EventArgs);
begin
  DatMod := TDataModule.Create;
  DatMod.FbCon.Open;
  try
    GravaJogo(61, hs1, s1s1, s2s1, g1s1, g2s1, ds1);
    GravaJogo(62, hs2, s1s2, s2s2, g1s2, g2s2, ds2);
    VerificaFases;
  finally
    EscondePanels;
    DatMod.FbCon.Close;
    DatMod.Dispose;
  end;
end;

procedure TWebForm2.btnFase5_Click(sender: System.Object; e: System.EventArgs);
begin
  EscondePanels;
  panFinal.Visible := True;
  DatMod := TDataModule.Create;
  DatMod.FbCon.Open;
  try
    AtuJogo(63, hf1, s1f1, s2f1, g1f1, g2f1, df1);
    AtuJogo(64, hf2, s1f2, s2f2, g1f2, g2f2, df2);
  finally
    DatMod.FbCon.Close;
    DatMod.Dispose;
  end;
end;

procedure TWebForm2.btnFase4_Click(sender: System.Object; e: System.EventArgs);
begin
  EscondePanels;
  panSemi.Visible := True;
  DatMod := TDataModule.Create;
  DatMod.FbCon.Open;
  try
    AtuJogo(61, hs1, s1s1, s2s1, g1s1, g2s1, ds1);
    AtuJogo(62, hs2, s1s2, s2s2, g1s2, g2s2, ds2);
  finally
    DatMod.FbCon.Close;
    DatMod.Dispose;
  end;
end;

procedure TWebForm2.btnFase3_Click(sender: System.Object; e: System.EventArgs);
begin
  EscondePanels;
  panQuartas.Visible := True;
  DatMod := TDataModule.Create;
  try
    DatMod.FbCon.Open;
    AtuJogo(57, hq1, s1q1, s2q1, g1q1, g2q1, dq1);
    AtuJogo(58, hq2, s1q2, s2q2, g1q2, g2q2, dq2);
    AtuJogo(59, hq3, s1q3, s2q3, g1q3, g2q3, dq3);
    AtuJogo(60, hq4, s1q4, s2q4, g1q4, g2q4, dq4);
  finally
    DatMod.FbCon.Close;
    DatMod.Dispose;
  end;
end;

procedure TWebForm2.AtuJogo(num_jogo: integer; l1, l2,
  l3: System.Web.UI.WebControls.Label; g1,
  g2: System.Web.UI.WebControls.DropDownList;
  de: System.Web.UI.WebControls.RadioButtonList);
var
  data, hora, dh, dia, mes, gol1, gol2, c1, c2: string;
  re: integer;
  atualiza: boolean;
  horario: TDateTime;

begin
  DatMod.FbJogoTabela.SelectCommand.Parameters['@numjogo'].Value := num_jogo.ToString;
  DatMod.FbJogoTabela.SelectCommand.Parameters['@codtabela'].Value := Session['num_tabela'].ToString;
  dr := DatMod.FbJogoTabela.SelectCommand.ExecuteReader;
  if dr.Read then
  begin
    dh := dr.GetString(0);
    horario := StrToDateTime(dh) - EncodeTime(1, 30, 0, 0);
    atualiza := (horario > Now);
    data := Copy(dh, 1, Pos(' ', dh) - 1);
    dia := Copy(data, 1, Pos('/', dh) - 1);
    if Length(dia) = 1 then dia := '0' + dia;
    mes := Copy(data, Pos('/', dh) + 1, 1);
    hora := Copy(dh, Pos(' ', dh) + 1, 5);
    gol1 := dr.GetString(4);
    if gol1 = '' then gol1 := '0';
    gol2 := dr.GetString(5);
    if gol2 = '' then gol2 := '0';
    l1.Text := 'J' +num_jogo.ToString + ' ' + dia + '/' + mes + ' ' + hora + 'h';
    l2.Text := dr.GetString(1);
    l3.Text := dr.GetString(2);
    g1.SelectedValue := gol1;
    g2.SelectedValue := gol2;
    c1 := dr.GetString(6);
    c2 := dr.GetString(7);
    re := dr.GetInt16(9);
    if re >= 1 then Dec(re);
    de.Items[0].Text := l2.Text;
    de.Items[1].Text := l3.Text;
    de.Items[0].Value := c1;
    de.Items[1].Value := c2;
    //if gol1 = gol2 then
    //begin
      de.Visible := True;
      de.SelectedIndex := re;
    //end;
    //g1.AutoPostBack := True;
    g1.Enabled := atualiza;
    g2.Enabled := atualiza;
    de.Enabled := atualiza;
  end;
  dr.Close;
end;

procedure TWebForm2.btnAltera4_Click(sender: System.Object; e: System.EventArgs);
begin
  EscondePanels;
  DatMod := TDataModule.Create;
  DatMod.FbCon.Open;
  try
    GravaJogo(57, hq1, s1q1, s2q1, g1q1, g2q1, dq1);
    GravaJogo(58, hq2, s1q2, s2q2, g1q2, g2q2, dq2);
    GravaJogo(59, hq3, s1q3, s2q3, g1q3, g2q3, dq3);
    GravaJogo(60, hq4, s1q4, s2q4, g1q4, g2q4, dq4);
    VerificaFases;
  finally
    DatMod.FbCon.Close;
    DatMod.Dispose;
  end;
end;

procedure TWebForm2.OnInit(e: EventArgs);
begin
  //
  // Required for Designer support
  //
  InitializeComponent;
  inherited OnInit(e);
end;

procedure TWebForm2.DataGrid1_SelectedIndexChanged(sender: System.Object; e: System.EventArgs);
var
  numtabela: string;
  i: integer;

begin
  numtabela := DataGrid1.SelectedItem.Cells[0].Text;
  i := DataGrid1.SelectedItem.ItemIndex;
  Session['num_tabela'] := numtabela;
  Session['sel_tabela'] := i.ToString;

  //btnTableFull.Visible := True;
  num_tabela := Session['num_tabela'].ToString;
  panFase1.Visible := True;
  try
    DatMod := TDataModule.Create;
    DatMod.FbCon.Open;
    VerificaFases;
  finally
    DatMod.FbCon.Close;
    DatMod.Dispose;
  end;
  EscondePanels;
end;

procedure TWebForm2.EscondePanels;
begin
  panGrupo.Visible := False;
  panOitavas.Visible := False;
  panQuartas.Visible := False;
  panSemi.Visible := False;
  panFinal.Visible := False;
end;

function TWebForm2.GeraTabela(grupo: string): string;
var
  tabela, data, hora, dh, dia, mes: string;
  i: integer;
  atualiza: boolean;
  horario: TDateTime;

begin
  DatMod.FbGrupoTabela.SelectCommand.Parameters['@codgrupo'].Value := grupo + '%';
  DatMod.FbGrupoTabela.SelectCommand.Parameters['@codtabela'].Value := Session['num_tabela'].ToString;
  dr := DatMod.FbGrupoTabela.SelectCommand.ExecuteReader;
  i := 0;
  while dr.Read() do
  begin
    dh := dr.GetString(0);
    horario := StrToDateTime(dh) - EncodeTime(1, 30, 0, 0);
    atualiza := (horario > Now);
    data := Copy(dh, 1, Pos(' ', dh) - 1);
    dia := Copy(data, 1, Pos('/', dh) - 1);
    if Length(dia) = 1 then dia := '0' + dia;
    mes := Copy(data, Pos('/', dh) + 1, 1);
    hora := Copy(dh, Pos(' ', dh) + 1, 5);
    Inc(i);
    case i of
    1: begin
         d1 := dia + '/' + mes + ' ' + hora + 'h';
         t1j1 := dr.GetString(1);
         t2j1 := dr.GetString(2);
         g1j1.SelectedValue := dr.GetString(4);
         g2j1.SelectedValue := dr.GetString(5);
         g1j1.Enabled := atualiza;
         g2j1.Enabled := atualiza;
         Label1.Text := dr.GetString(8);
         Label1.Visible := False;
       end;
    2: begin
         d2 := dia + '/' + mes + ' ' + hora + 'h';
         t1j2 := dr.GetString(1);
         t2j2 := dr.GetString(2);
         g1j2.SelectedValue := dr.GetString(4);
         g2j2.SelectedValue := dr.GetString(5);
         g1j2.Enabled := atualiza;
         g2j2.Enabled := atualiza;
         Label2.Text := dr.GetString(8);
         Label2.Visible := False;
       end;
    3: begin
         d3 := dia + '/' + mes + ' ' + hora + 'h';
         t1j3 := dr.GetString(1);
         t2j3 := dr.GetString(2);
         g1j3.SelectedValue := dr.GetString(4);
         g2j3.SelectedValue := dr.GetString(5);
         g1j3.Enabled := atualiza;
         g2j3.Enabled := atualiza;
         Label3.Text := dr.GetString(8);
         Label3.Visible := False;
       end;
    4: begin
         d4 := dia + '/' + mes + ' ' + hora + 'h';
         t1j4 := dr.GetString(1);
         t2j4 := dr.GetString(2);
         g1j4.SelectedValue := dr.GetString(4);
         g2j4.SelectedValue := dr.GetString(5);
         g1j4.Enabled := atualiza;
         g2j4.Enabled := atualiza;
         Label4.Text := dr.GetString(8);
         Label4.Visible := False;
       end;
    5: begin
         d5 := dia + '/' + mes + ' ' + hora + 'h';
         t1j5 := dr.GetString(1);
         t2j5 := dr.GetString(2);
         g1j5.SelectedValue := dr.GetString(4);
         g2j5.SelectedValue := dr.GetString(5);
         g1j5.Enabled := atualiza;
         g2j5.Enabled := atualiza;
         Label5.Text := dr.GetString(8);
         Label5.Visible := False;
       end;
    6: begin
         d6 := dia + '/' + mes + ' ' + hora + 'h';
         t1j6 := dr.GetString(1);
         t2j6 := dr.GetString(2);
         g1j6.SelectedValue := dr.GetString(4);
         g2j6.SelectedValue := dr.GetString(5);
         g1j6.Enabled := atualiza;
         g2j6.Enabled := atualiza;
         Label6.Text := dr.GetString(8);
         Label6.Visible := False;
       end;
    end;
  end;
  dr.Close;

  tabela := '<table bordercolor="#0000ff" cellspacing="0" width="100%" border="1">';
  tabela := tabela + '<tbody><tr>';
  tabela := tabela + '<td width="44%"><font size="2">&nbsp;</font></td>';
  tabela := tabela + '<td width="7%">';
  tabela := tabela + '<p align="center"><font size="2">P</font>';
  tabela := tabela + '</p></td>';
  tabela := tabela + '<td width="7%">';
  tabela := tabela + '<p align="center"><font size="2">J</font>';
  tabela := tabela + '</p></td>';
  tabela := tabela + '<td width="7%">';
  tabela := tabela + '<p align="center"><font size="2">V</font>';
  tabela := tabela + '</p></td>';
  tabela := tabela + '<td width="7%">';
  tabela := tabela + '<p align="center"><font size="2">E</font>';
  tabela := tabela + '</p></td>';
  tabela := tabela + '<td width="7%">';
  tabela := tabela + '<p align="center"><font size="2">D</font>';
  tabela := tabela + '</p></td>';
  tabela := tabela + '<td width="7%">';
  tabela := tabela + '<p align="center"><font size="2">GP</font>';
  tabela := tabela + '</p></td>';
  tabela := tabela + '<td width="7%">';
  tabela := tabela + '<p align="center"><font size="2">GC</font>';
  tabela := tabela + '</p></td>';
  tabela := tabela + '<td width="7%">';
  tabela := tabela + '<p align="center"><font size="2">S</font>';
  tabela := tabela + '</p></td></tr>';

  DatMod.FbPontoTabela.SelectCommand.Parameters['@codgrupo'].Value := grupo + '%';
  DatMod.FbPontoTabela.SelectCommand.Parameters['@codtabela'].Value := Session['num_tabela'].ToString;
  dr := DatMod.FbPontoTabela.SelectCommand.ExecuteReader;
  while dr.Read() do
  begin
    tabela := tabela + '<tr>';
    tabela := tabela + '<td><font size="2">' + dr.GetString(0) + '</font></td>';
    tabela := tabela + '<td><p align="center">';
    tabela := tabela + '<font size="2">' + dr.GetString(1) + '</font></td>';
    tabela := tabela + '</p></td>';
    tabela := tabela + '<td><p align="center">';
    tabela := tabela + '<font size="2">' + dr.GetString(2) + '</font></td>';
    tabela := tabela + '</p></td>';
    tabela := tabela + '<td><p align="center">';
    tabela := tabela + '<font size="2">' + dr.GetString(3) + '</font></td>';
    tabela := tabela + '</p></td>';
    tabela := tabela + '<td><p align="center">';
    tabela := tabela + '<font size="2">' + dr.GetString(4) + '</font></td>';
    tabela := tabela + '</p></td>';
    tabela := tabela + '<td><p align="center">';
    tabela := tabela + '<font size="2">' + dr.GetString(5) + '</font></td>';
    tabela := tabela + '</p></td>';
    tabela := tabela + '<td><p align="center">';
    tabela := tabela + '<font size="2">' + dr.GetString(6) + '</font></td>';
    tabela := tabela + '</p></td>';
    tabela := tabela + '<td><p align="center">';
    tabela := tabela + '<font size="2">' + dr.GetString(7) + '</font></td>';
    tabela := tabela + '</p></td>';
    tabela := tabela + '<td><p align="center">';
    tabela := tabela + '<font size="2">' + dr.GetString(8) + '</font></td>';
    tabela := tabela + '</p></td></tr>';
  end;
  tabela := tabela + '</tbody></table></font>';
  dr.Close;
  GeraTabela := tabela;
end;

procedure TWebForm2.GravaJogo(num_jogo: integer; l1, l2,
  l3: System.Web.UI.WebControls.Label; g1,
  g2: System.Web.UI.WebControls.DropDownList;
  de: System.Web.UI.WebControls.RadioButtonList);
var
  gol1, gol2, resul: integer;
  codtime, destime, sql: string;

begin
  try
    gol1 := StrToInt(g1.SelectedValue);
    gol2 := StrToInt(g2.SelectedValue);
    if gol1 > gol2 then
      resul := 1
    else
    if gol1 < gol2 then
      resul := 2
    else
      resul := de.SelectedIndex + 1;
    if resul = 0 then resul := 1;
    codtime := de.Items[resul-1].Value;

    DatMod.FbGrupoTabela.UpdateCommand.CommandText := 'UPDATE APOSTAS SET' +
     ' RESULTADO = ' + resul.ToString +
     ', GOL_T1 = ' + gol1.ToString +
     ', GOL_T2 = ' + gol2.ToString +
     ' WHERE (NUM_JOGO = ' + num_jogo.ToString + ') AND' +
     ' (COD_TABELA = ''' + Session['num_tabela'].ToString + ''')';
    DatMod.FbGrupoTabela.UpdateCommand.ExecuteNonQuery;

    destime := 'V' + num_jogo.ToString;
    sql := 'update APOSTAS set COD_TIME2=' + codtime +
        ' where COD_TABELA=''' + Session['num_tabela'].ToString +
        ''' and NUM_JOGO in (select NUM_JOGO from JOGOS where DESC_TIME2=''' +
        destime + ''')';
    DatMod.FbGrupoTabela.UpdateCommand.CommandText := sql;
    DatMod.FbGrupoTabela.UpdateCommand.ExecuteNonQuery;
    sql := 'update APOSTAS set COD_TIME1=' + codtime +
        ' where COD_TABELA=''' + Session['num_tabela'].ToString +
        ''' and NUM_JOGO in (select NUM_JOGO from JOGOS where DESC_TIME1=''' +
        destime + ''')';
    DatMod.FbGrupoTabela.UpdateCommand.CommandText := sql;
    DatMod.FbGrupoTabela.UpdateCommand.ExecuteNonQuery;

    if panSemi.Visible then
    begin
      if resul = 1 then
        resul := 2
      else
        resul := 1;
      codtime := de.Items[resul-1].Value;
      destime := 'P' + num_jogo.ToString;
      sql := 'update APOSTAS set COD_TIME2=' + codtime +
          ' where COD_TABELA=''' + Session['num_tabela'].ToString +
          ''' and NUM_JOGO in (select NUM_JOGO from JOGOS where DESC_TIME2=''' +
          destime + ''')';
      DatMod.FbGrupoTabela.UpdateCommand.CommandText := sql;
      DatMod.FbGrupoTabela.UpdateCommand.ExecuteNonQuery;
      sql := 'update APOSTAS set COD_TIME1=' + codtime +
          ' where COD_TABELA=''' + Session['num_tabela'].ToString +
          ''' and NUM_JOGO in (select NUM_JOGO from JOGOS where DESC_TIME1=''' +
          destime + ''')';
      DatMod.FbGrupoTabela.UpdateCommand.CommandText := sql;
      DatMod.FbGrupoTabela.UpdateCommand.ExecuteNonQuery;
    end;
    DatMod.FbGrupoTabela.UpdateCommand.CommandText := sql;
    DatMod.FbGrupoTabela.UpdateCommand.ExecuteNonQuery;
  finally
  end;
end;

procedure TWebForm2.btnC_Click(sender: System.Object; e: System.EventArgs);
begin
  MostraGrupo('C');
end;

procedure TWebForm2.btnB_Click(sender: System.Object; e: System.EventArgs);
begin
  MostraGrupo('B');
end;

procedure TWebForm2.btnA_Click(sender: System.Object; e: System.EventArgs);
begin
  MostraGrupo('A');
end;

procedure TWebForm2.btnD_Click(sender: System.Object; e: System.EventArgs);
begin
  MostraGrupo('D');
end;

procedure TWebForm2.btnE_Click(sender: System.Object; e: System.EventArgs);
begin
  MostraGrupo('E');
end;

procedure TWebForm2.btnF_Click(sender: System.Object; e: System.EventArgs);
begin
  MostraGrupo('F');
end;

procedure TWebForm2.btnG_Click(sender: System.Object; e: System.EventArgs);
begin
  MostraGrupo('G');
end;

procedure TWebForm2.btnH_Click(sender: System.Object; e: System.EventArgs);
begin
  MostraGrupo('H');
end;

end.

