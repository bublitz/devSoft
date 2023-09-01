
unit admin;

interface

uses
  System.Collections, System.ComponentModel,
  System.Data, System.Drawing, System.Web, System.Web.SessionState,
  System.Web.UI, System.Web.UI.WebControls, System.Web.UI.HtmlControls,
  System.Configuration, FirebirdSql.Data.FirebirdClient, System.Globalization,
  Borland.Vcl.SysUtils, System.Security.Cryptography, System.Text,
  System.Web.Mail, MagicAjax.UI.Controls;

type
  TWebForm2 = class(System.Web.UI.Page)
  {$REGION 'Designer Managed Code'}
  strict private
    procedure InitializeComponent;
    procedure DGJogos_SelectedIndexChanged(sender: System.Object; e: System.EventArgs);
    procedure btnCancelar_Click(sender: System.Object; e: System.EventArgs);
    procedure btnGravar_Click(sender: System.Object; e: System.EventArgs);
    procedure txtG1_SelectedIndexChanged(sender: System.Object; e: System.EventArgs);
    procedure btnRanking_Click(sender: System.Object; e: System.EventArgs);
    procedure btnGeraTab_Click(sender: System.Object; e: System.EventArgs);
    procedure DGJogos_PageIndexChanged(source: System.Object; e: System.Web.UI.WebControls.DataGridPageChangedEventArgs);
    procedure DGTabelas_PageIndexChanged(source: System.Object; e: System.Web.UI.WebControls.DataGridPageChangedEventArgs);
    procedure btnSelect_Click(sender: System.Object; e: System.EventArgs);
    procedure Button2_Click(sender: System.Object; e: System.EventArgs);
    procedure Button1_Click(sender: System.Object; e: System.EventArgs);
    procedure Button3_Click(sender: System.Object; e: System.EventArgs);
    procedure Button4_Click(sender: System.Object; e: System.EventArgs);
  {$ENDREGION}
  strict private
    procedure Page_Load(sender: System.Object; e: System.EventArgs);
  strict protected
    FbConAdm: FirebirdSql.Data.FirebirdClient.FbConnection;
    txtQtd: System.Web.UI.WebControls.TextBox;
    btnGeraTab: System.Web.UI.WebControls.Button;
    DGJogos: System.Web.UI.WebControls.DataGrid;
    btnRanking: System.Web.UI.WebControls.Button;
    DGTabelas: System.Web.UI.WebControls.DataGrid;
    FbDataAdapter1: FirebirdSql.Data.FirebirdClient.FbDataAdapter;
    FbCommand1: FirebirdSql.Data.FirebirdClient.FbCommand;
    FbCommand2: FirebirdSql.Data.FirebirdClient.FbCommand;
    FbCommand3: FirebirdSql.Data.FirebirdClient.FbCommand;
    FbCommand4: FirebirdSql.Data.FirebirdClient.FbCommand;
    FbTabelas: FirebirdSql.Data.FirebirdClient.FbDataAdapter;
    FbJogos: FirebirdSql.Data.FirebirdClient.FbDataAdapter;
    FbCommand5: FirebirdSql.Data.FirebirdClient.FbCommand;
    FbCommand6: FirebirdSql.Data.FirebirdClient.FbCommand;
    FbCommand7: FirebirdSql.Data.FirebirdClient.FbCommand;
    FbCommand8: FirebirdSql.Data.FirebirdClient.FbCommand;
    FbRanking: FirebirdSql.Data.FirebirdClient.FbDataAdapter;
    FbCommand9: FirebirdSql.Data.FirebirdClient.FbCommand;
    FbCommand10: FirebirdSql.Data.FirebirdClient.FbCommand;
    FbCommand11: FirebirdSql.Data.FirebirdClient.FbCommand;
    FbCommand12: FirebirdSql.Data.FirebirdClient.FbCommand;
    Panel1: System.Web.UI.WebControls.Panel;
    labS1: System.Web.UI.WebControls.Label;
    txtG1: System.Web.UI.WebControls.DropDownList;
    txtG2: System.Web.UI.WebControls.DropDownList;
    labS2: System.Web.UI.WebControls.Label;
    
    btnGravar: System.Web.UI.WebControls.Button;
    btnCancelar: System.Web.UI.WebControls.Button;
    labF: System.Web.UI.WebControls.Label;
    labR: System.Web.UI.WebControls.Label;
    labNum: System.Web.UI.WebControls.Label;
    dsJogos: System.Data.DataSet;
    Table1: System.Data.DataTable;
    NUM_JOGO: System.Data.DataColumn;
    DATA_HORA: System.Data.DataColumn;
    DESC_TIME1: System.Data.DataColumn;
    GOL_T1: System.Data.DataColumn;
    GOL_T2: System.Data.DataColumn;
    DESC_TIME2: System.Data.DataColumn;
    FASE: System.Data.DataColumn;
    RESULTADO: System.Data.DataColumn;
    COD_TIME1: System.Data.DataColumn;
    COD_TIME2: System.Data.DataColumn;
    rbResul: System.Web.UI.WebControls.RadioButtonList;
    FbVerificaFase: FirebirdSql.Data.FirebirdClient.FbDataAdapter;
    FbCommand13: FirebirdSql.Data.FirebirdClient.FbCommand;
    FbCommand14: FirebirdSql.Data.FirebirdClient.FbCommand;
    FbCommand15: FirebirdSql.Data.FirebirdClient.FbCommand;
    FbCommand16: FirebirdSql.Data.FirebirdClient.FbCommand;
    FbJogo: FirebirdSql.Data.FirebirdClient.FbDataAdapter;
    FbCommand17: FirebirdSql.Data.FirebirdClient.FbCommand;
    FbCommand18: FirebirdSql.Data.FirebirdClient.FbCommand;
    FbCommand19: FirebirdSql.Data.FirebirdClient.FbCommand;
    FbCommand20: FirebirdSql.Data.FirebirdClient.FbCommand;
    FbPontos: FirebirdSql.Data.FirebirdClient.FbDataAdapter;
    FbCommand21: FirebirdSql.Data.FirebirdClient.FbCommand;
    FbCommand22: FirebirdSql.Data.FirebirdClient.FbCommand;
    FbCommand23: FirebirdSql.Data.FirebirdClient.FbCommand;
    FbCommand24: FirebirdSql.Data.FirebirdClient.FbCommand;
    FbCommand28: FirebirdSql.Data.FirebirdClient.FbCommand;
    dsTabelas: System.Data.DataSet;
    COD_TABELA: System.Data.DataColumn;
    PONTOS: System.Data.DataColumn;
    FbGeral: FirebirdSql.Data.FirebirdClient.FbDataAdapter;
    FbCommand25: FirebirdSql.Data.FirebirdClient.FbCommand;
    FbCommand26: FirebirdSql.Data.FirebirdClient.FbCommand;
    FbCommand27: FirebirdSql.Data.FirebirdClient.FbCommand;
    FbCommand29: FirebirdSql.Data.FirebirdClient.FbCommand;
    Table: System.Data.DataTable;
    NOME_JOGADOR: System.Data.DataColumn;
    txtSQL: System.Web.UI.WebControls.TextBox;
    dsJogadores: System.Data.DataSet;
    btnSelect: System.Web.UI.WebControls.Button;
    Button2: System.Web.UI.WebControls.Button;
    DataGrid1: System.Web.UI.WebControls.DataGrid;
    txtEmail: System.Web.UI.WebControls.TextBox;
    Button1: System.Web.UI.WebControls.Button;
    txtBody: System.Web.UI.WebControls.TextBox;
    Button3: System.Web.UI.WebControls.Button;
    Button4: System.Web.UI.WebControls.Button;
    Label1: System.Web.UI.WebControls.Label;
    AjaxPanel2: MagicAjax.UI.Controls.AjaxPanel;
    AjaxPanel3: MagicAjax.UI.Controls.AjaxPanel;
    AjaxPanel1: MagicAjax.UI.Controls.AjaxPanel;
    procedure OnInit(e: EventArgs); override;
  private
    { Private Declarations }
    dr: FbDataReader;
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
type
  TArrayOfSystem_Data_DataTable = array of System.Data.DataTable;
  TArrayOfSystem_Data_DataColumn = array of System.Data.DataColumn;
  TArrayOfSystem_Data_Constraint = array of System.Data.Constraint;
  TArrayOfString = array of string;
var
  configurationAppSettings: System.Configuration.AppSettingsReader;
begin
  configurationAppSettings := System.Configuration.AppSettingsReader.Create;
  Self.FbConAdm := FirebirdSql.Data.FirebirdClient.FbConnection.Create;
  Self.FbTabelas := FirebirdSql.Data.FirebirdClient.FbDataAdapter.Create;
  Self.FbCommand4 := FirebirdSql.Data.FirebirdClient.FbCommand.Create;
  Self.FbCommand2 := FirebirdSql.Data.FirebirdClient.FbCommand.Create;
  Self.FbCommand1 := FirebirdSql.Data.FirebirdClient.FbCommand.Create;
  Self.FbCommand3 := FirebirdSql.Data.FirebirdClient.FbCommand.Create;
  Self.FbJogos := FirebirdSql.Data.FirebirdClient.FbDataAdapter.Create;
  Self.FbCommand8 := FirebirdSql.Data.FirebirdClient.FbCommand.Create;
  Self.FbCommand6 := FirebirdSql.Data.FirebirdClient.FbCommand.Create;
  Self.FbCommand5 := FirebirdSql.Data.FirebirdClient.FbCommand.Create;
  Self.FbCommand7 := FirebirdSql.Data.FirebirdClient.FbCommand.Create;
  Self.FbRanking := FirebirdSql.Data.FirebirdClient.FbDataAdapter.Create;
  Self.FbCommand12 := FirebirdSql.Data.FirebirdClient.FbCommand.Create;
  Self.FbCommand10 := FirebirdSql.Data.FirebirdClient.FbCommand.Create;
  Self.FbCommand9 := FirebirdSql.Data.FirebirdClient.FbCommand.Create;
  Self.FbCommand11 := FirebirdSql.Data.FirebirdClient.FbCommand.Create;
  Self.dsJogos := System.Data.DataSet.Create;
  Self.Table1 := System.Data.DataTable.Create;
  Self.NUM_JOGO := System.Data.DataColumn.Create;
  Self.DATA_HORA := System.Data.DataColumn.Create;
  Self.DESC_TIME1 := System.Data.DataColumn.Create;
  Self.GOL_T1 := System.Data.DataColumn.Create;
  Self.GOL_T2 := System.Data.DataColumn.Create;
  Self.DESC_TIME2 := System.Data.DataColumn.Create;
  Self.FASE := System.Data.DataColumn.Create;
  Self.RESULTADO := System.Data.DataColumn.Create;
  Self.COD_TIME1 := System.Data.DataColumn.Create;
  Self.COD_TIME2 := System.Data.DataColumn.Create;
  Self.FbVerificaFase := FirebirdSql.Data.FirebirdClient.FbDataAdapter.Create;
  Self.FbCommand16 := FirebirdSql.Data.FirebirdClient.FbCommand.Create;
  Self.FbCommand14 := FirebirdSql.Data.FirebirdClient.FbCommand.Create;
  Self.FbCommand13 := FirebirdSql.Data.FirebirdClient.FbCommand.Create;
  Self.FbCommand15 := FirebirdSql.Data.FirebirdClient.FbCommand.Create;
  Self.FbJogo := FirebirdSql.Data.FirebirdClient.FbDataAdapter.Create;
  Self.FbCommand20 := FirebirdSql.Data.FirebirdClient.FbCommand.Create;
  Self.FbCommand18 := FirebirdSql.Data.FirebirdClient.FbCommand.Create;
  Self.FbCommand17 := FirebirdSql.Data.FirebirdClient.FbCommand.Create;
  Self.FbCommand19 := FirebirdSql.Data.FirebirdClient.FbCommand.Create;
  Self.FbPontos := FirebirdSql.Data.FirebirdClient.FbDataAdapter.Create;
  Self.FbCommand24 := FirebirdSql.Data.FirebirdClient.FbCommand.Create;
  Self.FbCommand22 := FirebirdSql.Data.FirebirdClient.FbCommand.Create;
  Self.FbCommand21 := FirebirdSql.Data.FirebirdClient.FbCommand.Create;
  Self.FbCommand23 := FirebirdSql.Data.FirebirdClient.FbCommand.Create;
  Self.FbCommand28 := FirebirdSql.Data.FirebirdClient.FbCommand.Create;
  Self.FbGeral := FirebirdSql.Data.FirebirdClient.FbDataAdapter.Create;
  Self.FbCommand29 := FirebirdSql.Data.FirebirdClient.FbCommand.Create;
  Self.FbCommand26 := FirebirdSql.Data.FirebirdClient.FbCommand.Create;
  Self.FbCommand25 := FirebirdSql.Data.FirebirdClient.FbCommand.Create;
  Self.FbCommand27 := FirebirdSql.Data.FirebirdClient.FbCommand.Create;
  Self.dsTabelas := System.Data.DataSet.Create;
  Self.Table := System.Data.DataTable.Create;
  Self.COD_TABELA := System.Data.DataColumn.Create;
  Self.PONTOS := System.Data.DataColumn.Create;
  Self.NOME_JOGADOR := System.Data.DataColumn.Create;
  Self.dsJogadores := System.Data.DataSet.Create;
  (System.ComponentModel.ISupportInitialize(Self.dsJogos)).BeginInit;
  (System.ComponentModel.ISupportInitialize(Self.Table1)).BeginInit;
  (System.ComponentModel.ISupportInitialize(Self.dsTabelas)).BeginInit;
  (System.ComponentModel.ISupportInitialize(Self.Table)).BeginInit;
  (System.ComponentModel.ISupportInitialize(Self.dsJogadores)).BeginInit;
  Include(Self.btnRanking.Click, Self.btnRanking_Click);
  Include(Self.Button2.Click, Self.Button2_Click);
  Include(Self.btnSelect.Click, Self.btnSelect_Click);
  Include(Self.btnGeraTab.Click, Self.btnGeraTab_Click);
  Include(Self.DGTabelas.PageIndexChanged, Self.DGTabelas_PageIndexChanged);
  Include(Self.Button1.Click, Self.Button1_Click);
  Include(Self.Button3.Click, Self.Button3_Click);
  Include(Self.Button4.Click, Self.Button4_Click);
  // 
  // FbConAdm
  // 
  Self.FbConAdm.ConnectionString := (string(configurationAppSettings.GetValue('F' +
    'bCon.ConnectionString', TypeOf(string))));
  // 
  // FbTabelas
  // 
  Self.FbTabelas.DeleteCommand := Self.FbCommand4;
  Self.FbTabelas.InsertCommand := Self.FbCommand2;
  Self.FbTabelas.SelectCommand := Self.FbCommand1;
  Self.FbTabelas.UpdateCommand := Self.FbCommand3;
  // 
  // FbCommand2
  // 
  Self.FbCommand2.Connection := Self.FbConAdm;
  // 
  // FbCommand1
  // 
  Self.FbCommand1.CommandText := 'select t.COD_TABELA, t.PONTOS, coalesce(j.' +
  'APELIDO_JOGADOR, j.NOME_JOGADOR) NOME_JOGADOR, j.EMAIL'#13#10'from TABELA' +
  ' t'#13#10'left join  JOGADORES j'#13#10'on t.COD_JOGADOR=j.COD_JOGADOR'#13 +
  #10'order by 2 desc, 3';
  Self.FbCommand1.Connection := Self.FbConAdm;
  // 
  // FbCommand3
  // 
  Self.FbCommand3.Connection := Self.FbConAdm;
  // 
  // FbJogos
  // 
  Self.FbJogos.DeleteCommand := Self.FbCommand8;
  Self.FbJogos.InsertCommand := Self.FbCommand6;
  Self.FbJogos.SelectCommand := Self.FbCommand5;
  Self.FbJogos.UpdateCommand := Self.FbCommand7;
  // 
  // FbCommand5
  // 
  Self.FbCommand5.CommandText := 'select j.num_jogo, j.data_hora,'#13#10'   ' +
  '    coalesce(t1.nome_time, j.desc_time1) desc_time1,'#13#10'       r.gol_' +
  't1, r.gol_t2,'#13#10'       coalesce(t2.nome_time, j.desc_time2) desc_tim' +
  'e2,'#13#10'       j.fase, r.resultado, j.cod_time1, j.cod_time2'#13#10'fr' +
  'om JOGOS j'#13#10'left join resultados r on j.num_jogo=r.num_jogo'#13#10'l' +
  'eft join TIMES t1 on j.cod_time1 = t1.cod_time'#13#10'left join TIMES t2 ' +
  'on j.cod_time2 = t2.cod_time'#13#10'order by 1';
  Self.FbCommand5.Connection := Self.FbConAdm;
  // 
  // FbRanking
  // 
  Self.FbRanking.DeleteCommand := Self.FbCommand12;
  Self.FbRanking.InsertCommand := Self.FbCommand10;
  Self.FbRanking.SelectCommand := Self.FbCommand9;
  Self.FbRanking.UpdateCommand := Self.FbCommand11;
  // 
  // FbCommand9
  // 
  Self.FbCommand9.CommandText := 'ATUALIZA_PONTOS';
  Self.FbCommand9.CommandType := System.Data.CommandType.StoredProcedure;
  Self.FbCommand9.Connection := Self.FbConAdm;
  // 
  // dsJogos
  // 
  Self.dsJogos.DataSetName := 'dsJogos';
  Self.dsJogos.Locale := System.Globalization.CultureInfo.Create('pt-BR');
  Self.dsJogos.Namespace := 'http://www.tempuri.org/dsJogos.xsd';
  Self.dsJogos.Tables.AddRange(TArrayOfSystem_Data_DataTable.Create(Self.Table1));
  // 
  // Table1
  // 
  Self.Table1.Columns.AddRange(TArrayOfSystem_Data_DataColumn.Create(Self.NUM_JOGO, 
          Self.DATA_HORA, Self.DESC_TIME1, Self.GOL_T1, Self.GOL_T2, Self.DESC_TIME2, 
          Self.FASE, Self.RESULTADO, Self.COD_TIME1, Self.COD_TIME2));
  Self.Table1.Constraints.AddRange(TArrayOfSystem_Data_Constraint.Create(System.Data.UniqueConstraint.Create('C' +
          'onstraint1', TArrayOfString.Create('NUM_JOGO'), True)));
  Self.Table1.PrimaryKey := TArrayOfSystem_Data_DataColumn.Create(Self.NUM_JOGO);
  Self.Table1.TableName := 'Table';
  // 
  // NUM_JOGO
  // 
  Self.NUM_JOGO.AllowDBNull := False;
  Self.NUM_JOGO.ColumnName := 'NUM_JOGO';
  Self.NUM_JOGO.DataType := TypeOf(System.Decimal);
  // 
  // DATA_HORA
  // 
  Self.DATA_HORA.ColumnName := 'DATA_HORA';
  Self.DATA_HORA.DataType := TypeOf(System.DateTime);
  // 
  // DESC_TIME1
  // 
  Self.DESC_TIME1.ColumnName := 'DESC_TIME1';
  Self.DESC_TIME1.MaxLength := 50;
  // 
  // GOL_T1
  // 
  Self.GOL_T1.ColumnName := 'GOL_T1';
  Self.GOL_T1.DataType := TypeOf(SmallInt);
  // 
  // GOL_T2
  // 
  Self.GOL_T2.ColumnName := 'GOL_T2';
  Self.GOL_T2.DataType := TypeOf(SmallInt);
  // 
  // DESC_TIME2
  // 
  Self.DESC_TIME2.ColumnName := 'DESC_TIME2';
  Self.DESC_TIME2.MaxLength := 50;
  // 
  // FASE
  // 
  Self.FASE.ColumnName := 'FASE';
  Self.FASE.MaxLength := 1;
  // 
  // RESULTADO
  // 
  Self.RESULTADO.ColumnName := 'RESULTADO';
  Self.RESULTADO.DataType := TypeOf(System.Decimal);
  // 
  // COD_TIME1
  // 
  Self.COD_TIME1.ColumnName := 'COD_TIME1';
  Self.COD_TIME1.DataType := TypeOf(System.Decimal);
  // 
  // COD_TIME2
  // 
  Self.COD_TIME2.ColumnName := 'COD_TIME2';
  Self.COD_TIME2.DataType := TypeOf(System.Decimal);
  // 
  // FbVerificaFase
  // 
  Self.FbVerificaFase.DeleteCommand := Self.FbCommand16;
  Self.FbVerificaFase.InsertCommand := Self.FbCommand14;
  Self.FbVerificaFase.SelectCommand := Self.FbCommand13;
  Self.FbVerificaFase.UpdateCommand := Self.FbCommand15;
  // 
  // FbCommand13
  // 
  Self.FbCommand13.CommandText := 'select count(r.num_jogo) from RESULTADOS ' +
  'r, JOGOS j'#13#10'where r.num_jogo=j.num_jogo'#13#10'and r.resultado is n' +
  'ull and j.fase=@fase'#13#10;
  Self.FbCommand13.Connection := Self.FbConAdm;
  Self.FbCommand13.Parameters.Add(FirebirdSql.Data.FirebirdClient.FbParameter.Create('@' +
      'fase', FirebirdSql.Data.FirebirdClient.FbDbType.VarChar));
  // 
  // FbJogo
  // 
  Self.FbJogo.DeleteCommand := Self.FbCommand20;
  Self.FbJogo.InsertCommand := Self.FbCommand18;
  Self.FbJogo.SelectCommand := Self.FbCommand17;
  Self.FbJogo.UpdateCommand := Self.FbCommand19;
  // 
  // FbCommand17
  // 
  Self.FbCommand17.CommandText := 'select j.data_hora, coalesce(t1.nome_time' +
  ', j.desc_time1) desc_time1,'#13#10'coalesce(t2.nome_time, j.desc_time2) d' +
  'esc_time2, j.fase, r.gol_t1,'#13#10'r.gol_t2, j.cod_time1, j.cod_time2, j' +
  '.num_jogo, r.resultado'#13#10'from JOGOS j'#13#10'left join resultados r ' +
  'on j.num_jogo=r.num_jogo'#13#10'left join TIMES t1 on j.cod_time1 = t1.co' +
  'd_time'#13#10'left join TIMES t2 on j.cod_time2 = t2.cod_time'#13#10'wher' +
  'e j.num_jogo=@numjogo order by 1';
  Self.FbCommand17.Connection := Self.FbConAdm;
  Self.FbCommand17.Parameters.Add(FirebirdSql.Data.FirebirdClient.FbParameter.Create('@' +
      'numjogo', FirebirdSql.Data.FirebirdClient.FbDbType.Integer));
  // 
  // FbCommand19
  // 
  Self.FbCommand19.Connection := Self.FbConAdm;
  // 
  // FbPontos
  // 
  Self.FbPontos.DeleteCommand := Self.FbCommand24;
  Self.FbPontos.InsertCommand := Self.FbCommand22;
  Self.FbPontos.SelectCommand := Self.FbCommand21;
  Self.FbPontos.UpdateCommand := Self.FbCommand23;
  // 
  // FbCommand21
  // 
  Self.FbCommand21.CommandText := 'SELECT * FROM PONTUACAO(@codgrupo) ORDER ' +
  'BY PONTOS DESC, VITORIAS DESC, SALDOGOLS DESC, GOLSPRO DESC, COD_TIME';
  Self.FbCommand21.Connection := Self.FbConAdm;
  Self.FbCommand21.Parameters.Add(FirebirdSql.Data.FirebirdClient.FbParameter.Create('@' +
      'codgrupo', FirebirdSql.Data.FirebirdClient.FbDbType.VarChar));
  // 
  // FbCommand23
  // 
  Self.FbCommand23.Connection := Self.FbConAdm;
  // 
  // FbCommand28
  // 
  Self.FbCommand28.CommandType := System.Data.CommandType.StoredProcedure;
  Self.FbCommand28.Connection := Self.FbConAdm;
  // 
  // FbGeral
  // 
  Self.FbGeral.DeleteCommand := Self.FbCommand29;
  Self.FbGeral.InsertCommand := Self.FbCommand26;
  Self.FbGeral.SelectCommand := Self.FbCommand25;
  Self.FbGeral.UpdateCommand := Self.FbCommand27;
  // 
  // FbCommand25
  // 
  Self.FbCommand25.Connection := Self.FbConAdm;
  // 
  // FbCommand27
  // 
  Self.FbCommand27.Connection := Self.FbConAdm;
  // 
  // dsTabelas
  // 
  Self.dsTabelas.DataSetName := 'dsTabelas';
  Self.dsTabelas.Locale := System.Globalization.CultureInfo.Create('pt-BR');
  Self.dsTabelas.Namespace := 'http://www.tempuri.org/dsTabelas.xsd';
  Self.dsTabelas.Tables.AddRange(TArrayOfSystem_Data_DataTable.Create(Self.Table));
  // 
  // Table
  // 
  Self.Table.Columns.AddRange(TArrayOfSystem_Data_DataColumn.Create(Self.COD_TABELA, 
          Self.PONTOS, Self.NOME_JOGADOR));
  Self.Table.Constraints.AddRange(TArrayOfSystem_Data_Constraint.Create(System.Data.UniqueConstraint.Create('C' +
          'onstraint1', TArrayOfString.Create('COD_TABELA'), True)));
  Self.Table.PrimaryKey := TArrayOfSystem_Data_DataColumn.Create(Self.COD_TABELA);
  Self.Table.TableName := 'Table';
  // 
  // COD_TABELA
  // 
  Self.COD_TABELA.AllowDBNull := False;
  Self.COD_TABELA.ColumnName := 'COD_TABELA';
  Self.COD_TABELA.MaxLength := 12;
  // 
  // PONTOS
  // 
  Self.PONTOS.ColumnName := 'PONTOS';
  Self.PONTOS.DataType := TypeOf(System.Decimal);
  // 
  // NOME_JOGADOR
  // 
  Self.NOME_JOGADOR.ColumnName := 'NOME_JOGADOR';
  Self.NOME_JOGADOR.MaxLength := 50;
  // 
  // dsJogadores
  // 
  Self.dsJogadores.DataSetName := 'dsJogadores';
  Self.dsJogadores.Locale := System.Globalization.CultureInfo.Create('pt-BR');
  Self.dsJogadores.Namespace := 'http://www.tempuri.org/dsJogadores.xsd';
  Include(Self.DGJogos.PageIndexChanged, Self.DGJogos_PageIndexChanged);
  Include(Self.DGJogos.SelectedIndexChanged, Self.DGJogos_SelectedIndexChanged);
  Include(Self.btnCancelar.Click, Self.btnCancelar_Click);
  Include(Self.btnGravar.Click, Self.btnGravar_Click);
  Include(Self.txtG2.SelectedIndexChanged, Self.txtG1_SelectedIndexChanged);
  Include(Self.txtG1.SelectedIndexChanged, Self.txtG1_SelectedIndexChanged);
  Include(Self.Load, Self.Page_Load);
  (System.ComponentModel.ISupportInitialize(Self.dsJogos)).EndInit;
  (System.ComponentModel.ISupportInitialize(Self.Table1)).EndInit;
  (System.ComponentModel.ISupportInitialize(Self.dsTabelas)).EndInit;
  (System.ComponentModel.ISupportInitialize(Self.Table)).EndInit;
  (System.ComponentModel.ISupportInitialize(Self.dsJogadores)).EndInit;
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

  if (Session['jog_codi'] = nil) or (Session['jog_nome'] = nil) or (Session['jog_apel'] = nil) then
    Response.Redirect('index.aspx');

  if (Session['jog_codi'].ToString <> '0') then
    Response.Redirect('index.aspx');

  if not IsPostBack then
  begin
    try
      FbConAdm.Open;

      FbTabelas.Fill(dsTabelas);
      DGTabelas.DataBind;

      FbJogos.Fill(dsJogos);
      DGJogos.DataBind;
    finally
      FbConAdm.Close;
      txtBody.Text := '<html><head><title>Mensagem do Bol&atilde;o Cooperjus</title>' + #13#10 +
                      '<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">' + #13#10 +
                      '<style type="text/css">' + #13#10 +
                      '<!--' + #13#10 +
                      '.style1 {font-family: Verdana, Arial, Helvetica, sans-serif}' + #13#10 +
                      '.style2 {font-size: large}' + #13#10 +
                      '.style3 {font-size: small}' + #13#10 +
                      '.style4 {font-family: Verdana, Arial, Helvetica, sans-serif; font-size: small; }' + #13#10 +
                      '-->' + #13#10 +
                      '</style></head><body>' + #13#10 +
                      '<p class="style1 style2"><strong>Mensagem do Bol&atilde;o Cooperjus Copa do Mundo Alemanha 2006 </strong></p>' + #13#10 +
                      '<p class="style1 style3">Ol&aacute; <strong>%NOME%</strong>!!!! </p>' + #13#10 +
                      '<p class="style4">Parab&eacute;ns!!! Voc&ecirc; est&aacute; entre os <strong>20</strong> melhores colocados no Ranking do Bol&atilde;o Cooperjus.</p>' + #13#10 +
                      '<p class="style4">Voc&ecirc; est&aacute; com <strong>%PONTOS%</strong> pontos, compostos de <strong>%ACERTO_TOTAL%</strong> acertos totais e <strong>%ACERTO_PARCIAL%</strong> acertos parciais. </p>' + #13#10 +
                      '<p class="style4">Confira no site do Bol&atilde;o: <a href="http://www.bolao.fot.br/">www.bolao.fot.br</a>.</p>' + #13#10 +
                      '<p class="style4">Atenciosamente,<br>' + #13#10 +
                      '  <em><strong>Administra&ccedil;&atilde;o do Bol&atilde;o </strong></em></p>' + #13#10 +
                      '</body></html>';
    end;
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

procedure TWebForm2.Button4_Click(sender: System.Object; e: System.EventArgs);
var
  mailMsg: MailMessage;
  dr: FbDataReader;
  mens: string;

begin
  mailMsg := MailMessage.Create;
  mailMsg.From := 'bolao@bolao.fot.br';
  try
    FbConAdm.Open;
    FbGeral.SelectCommand.CommandText := 'select first 20 t.PONTOS, ' +
      ' j.NOME_JOGADOR NOME, j.EMAIL, t.acerto_total, t.acerto_parcial, ' +
      ' j.data_cadastro from TABELA t, JOGADORES j ' +
      ' where t.COD_JOGADOR=j.COD_JOGADOR ' +
      ' order by T.PONTOS DESC, t.acerto_total desc, t.acerto_parcial desc, ' +
      ' j.data_cadastro ';
    dr := FbGeral.SelectCommand.ExecuteReader;
    while dr.Read do
    begin
      mailMsg.&To := dr['EMAIL'].ToString;
      mailMsg.Subject := 'Mensagem do Bolão Cooperjus';
      mens := StringReplace(txtBody.Text, '%NOME%', dr['NOME'].toString, [rfReplaceAll]);
      mens := StringReplace(mens, '%PONTOS%', dr['PONTOS'].toString, [rfReplaceAll]);
      mens := StringReplace(mens, '%ACERTO_TOTAL%', dr['ACERTO_TOTAL'].toString, [rfReplaceAll]);
      mens := StringReplace(mens, '%ACERTO_PARCIAL%', dr['ACERTO_PARCIAL'].toString, [rfReplaceAll]);
      mailMsg.Body := mens;
      mailMsg.BodyFormat := MailFormat.Html;
      SmtpMail.SmtpServer := 'smtp.bolao.fot.br';
      SmtpMail.Send(mailMsg);
    end;
    dr.Close;
    FbConAdm.Close;
  finally
    Label1.Text := 'Status: E-Mail enviado aos 20 primeiros!';
    mailMsg := nil;
  end;
end;

procedure TWebForm2.Button3_Click(sender: System.Object; e: System.EventArgs);
var
  mailMsg: MailMessage;
  dr: FbDataReader;
  mens: string;

begin
  mailMsg := MailMessage.Create;
  mailMsg.From := 'bolao@bolao.fot.br';
  try
    FbConAdm.Open;
    FbGeral.SelectCommand.CommandText := 'select distinct ' +
      ' coalesce(j.APELIDO_JOGADOR, j.NOME_JOGADOR) NOME, j.EMAIL ' +
      ' from JOGADORES j where EMAIL is not null ';
    dr := FbGeral.SelectCommand.ExecuteReader;
    while dr.Read do
    begin
      mailMsg.&To := dr['EMAIL'].ToString;
      mailMsg.Subject := 'Mensagem do Bolão Cooperjus';
      mens := StringReplace(txtBody.Text, '%NOME%', dr['NOME'].ToString, [rfReplaceAll]);
      mailMsg.Body := mens;
      mailMsg.BodyFormat := MailFormat.Html;
      SmtpMail.SmtpServer := 'smtp.bolao.fot.br';
      SmtpMail.Send(mailMsg);
    end;
    dr.Close;
    FbConAdm.Close;
  finally
    mailMsg := nil;
    Label1.Text := 'Status: E-Mail enviado a todos!';
  end;
end;

procedure TWebForm2.Button1_Click(sender: System.Object; e: System.EventArgs);
var
  mailMsg: MailMessage;

begin
  try
    mailMsg := MailMessage.Create;
    mailMsg.From := 'bolao@bolao.fot.br';
    mailMsg.&To := txtEmail.Text;
    mailMsg.Subject := 'Mensagem de Teste';
    mailMsg.Body := txtBody.Text;
    mailMsg.BodyFormat := MailFormat.Html;
    SmtpMail.SmtpServer := 'smtp.bolao.fot.br';
    SmtpMail.Send(mailMsg);
    mailMsg := nil;
  finally
    Label1.Text := 'Status: E-Mail de teste enviado!';
  end;
end;

procedure TWebForm2.Button2_Click(sender: System.Object; e: System.EventArgs);
begin
  try
    FbConAdm.Open;
    FbGeral.UpdateCommand.CommandText := txtSQL.Text;
    FbGeral.UpdateCommand.ExecuteNonQuery;
  finally
    FbConAdm.Close;
  end;
end;

procedure TWebForm2.btnSelect_Click(sender: System.Object; e: System.EventArgs);
begin
  try
    FbConAdm.Open;
    fbGeral.SelectCommand.CommandText := txtSQL.Text;
    DataGrid1.DataSource := FbGeral.SelectCommand.ExecuteReader;
    DataGrid1.DataBind;
  finally
    FbConAdm.Close;
  end;
end;

procedure TWebForm2.DGTabelas_PageIndexChanged(source: System.Object; e: System.Web.UI.WebControls.DataGridPageChangedEventArgs);
begin
  DGTabelas.CurrentPageIndex := e.NewPageIndex;
  FbTabelas.Fill(dsTabelas);
  DGTabelas.DataBind;
end;

procedure TWebForm2.DGJogos_PageIndexChanged(source: System.Object; e: System.Web.UI.WebControls.DataGridPageChangedEventArgs);
begin
  DGJogos.CurrentPageIndex := e.NewPageIndex;
  FbJogos.Fill(dsJogos);
  DGJogos.DataBind;
end;

procedure TWebForm2.btnGeraTab_Click(sender: System.Object; e: System.EventArgs);
var
  i, ii, t, q: integer;
  cod1, cod2, cod3: string;
  myMD5: MD5;
  ar: array of byte;
  res: array of byte;

begin
  // Gera novas tabelas
  try
    FbConAdm.Open;
    t := Convert.ToInt32(txtQtd.Text);
    for ii := 1 to t do
    begin
      myMD5 := MD5CryptoServiceProvider.Create;
      q := Random(9999);
      ar := Encoding.UTF8.GetBytes(q.ToString);
      res := myMD5.ComputeHash(ar);
      cod1 := '';
      for i := 0 to Length(res)-1 do
        cod1 := cod1 + IntToHex(res[i],2);
      q := Random(9999);
      ar := Encoding.UTF8.GetBytes(q.ToString);
      res := myMD5.ComputeHash(ar);
      cod2 := '';
      for i := 0 to Length(res)-1 do
        cod2 := cod2 + IntToHex(res[i],2);
      cod1 := cod1 + cod2;
      cod3 := copy(cod1, Random(63), 4) + copy(cod1, Random(63), 4) + copy(cod1, Random(50), 4);
      FbTabelas.InsertCommand.CommandText := 'insert into TABELA (cod_tabela) values (''' + cod3 + ''')';
      FbTabelas.InsertCommand.ExecuteNonQuery;
    end;
  finally
    FbConAdm.Close;
    Response.Redirect('admin.aspx');
  end;
end;

procedure TWebForm2.btnRanking_Click(sender: System.Object; e: System.EventArgs);
begin
  try
    FbConAdm.Open;
    FbRanking.SelectCommand.ExecuteScalar;
  finally
    FbConAdm.Close;
    Response.Redirect('admin.aspx');
  end;
end;

procedure TWebForm2.txtG1_SelectedIndexChanged(sender: System.Object; e: System.EventArgs);
begin
  rbResul.Visible := (txtG1.SelectedValue = txtG2.SelectedValue) and (labF.Text <> '1');
end;

procedure TWebForm2.btnGravar_Click(sender: System.Object; e: System.EventArgs);
const
  grupos = 'ABC';

var
  i, t, gol1, gol2, resul, numjogo: integer;
  num_jogo, codtime, codtime1, codtime2, destime, sql, verifica, res,
  codgrupo, temp: string;
  fase2, fase3, fase4, fase5: boolean;
  pontos3: array[1..3] of string; // Pontuação dos terceiros colocados

begin
  try
    FbConAdm.Open;

    num_jogo := labNum.Text;
    gol1 := StrToInt(txtG1.SelectedValue);
    gol2 := StrToInt(txtG2.SelectedValue);

    if labF.Text = '1' then
    begin
      if gol1 > gol2 then
        resul := 1
      else
      if gol1 < gol2 then
        resul := 2
      else
        resul := 0;
    end
    else
    begin
      if gol1 > gol2 then
        resul := 1
      else
      if gol1 < gol2 then
        resul := 2
      else
      begin
        resul := rbResul.SelectedIndex + 1;
        if resul = 0 then resul := 1;
      end;
    end;

    FbTabelas.UpdateCommand.CommandText := 'UPDATE RESULTADOS SET' +
     ' RESULTADO = ' + resul.ToString + ', GOL_T1 = ' + gol1.ToString +
     ', GOL_T2 = ' + gol2.ToString + ' WHERE NUM_JOGO = ' + num_jogo;

    FbTabelas.UpdateCommand.ExecuteNonQuery;

    fase2 := False;
    fase3 := False;
    fase4 := False;

    FbVerificaFase.SelectCommand.Parameters['@fase'].Value := '1';
    verifica := FbVerificaFase.SelectCommand.ExecuteScalar.ToString;
    if verifica = '0' then
    begin
      fase2 := True;
      FbVerificaFase.SelectCommand.Parameters['@fase'].Value := '2';
      verifica := FbVerificaFase.SelectCommand.ExecuteScalar.ToString;
      if verifica = '0' then
      begin
        fase3 := True;
        FbVerificaFase.SelectCommand.Parameters['@fase'].Value := '3';
        verifica := FbVerificaFase.SelectCommand.ExecuteScalar.ToString;
        fase4 := (verifica = '0');
      end;
    end;

    if fase2 then
    begin
      for i := 0 to 2 do
      begin
        // Atualiza Fase 2
        codgrupo := chr(65+i);
        FbPontos.SelectCommand.Parameters['@codgrupo'].Value := codgrupo + '%';
        dr := FbPontos.SelectCommand.ExecuteReader;

        dr.Read; // Primeiro colocado
        codtime := dr.GetString(9);
        destime := '1' + codgrupo;
        sql := 'update JOGOS set COD_TIME1=' + codtime +
          ' where (DESC_TIME1=''' + destime + ''')';
        FbJogo.UpdateCommand.CommandText := sql;
        FbJogo.UpdateCommand.ExecuteNonQuery;

        dr.Read; // Segundo colocado
        codtime := dr.GetString(9);
        destime := '2' + codgrupo;
        sql := 'update JOGOS set COD_TIME2=' + codtime +
          ' where (DESC_TIME2=''' + destime + ''')';
        FbJogo.UpdateCommand.CommandText := sql;
        FbJogo.UpdateCommand.ExecuteNonQuery;
        dr.Close;
      end;

      // melhores terceiros colocados
      for i := 1 to 3 do
      begin
        FbPontos.SelectCommand.Parameters['@codgrupo'].Value := grupos[i] + '%';
        dr := FbPontos.SelectCommand.ExecuteReader;
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
        sql := 'update JOGOS set COD_TIME1=' + codtime +
            ' where (DESC_TIME1=''' + destime + ''')';
      FbJogo.UpdateCommand.CommandText := sql;
      FbJogo.UpdateCommand.ExecuteNonQuery;

      codtime := Copy(pontos3[2], 6, 2);
      destime := '2T';
        sql := 'update JOGOS set COD_TIME2=' + codtime +
            ' where (DESC_TIME2=''' + destime + ''')';
      FbJogo.UpdateCommand.CommandText := sql;
      FbJogo.UpdateCommand.ExecuteNonQuery;

    end;
    if fase3 then
    begin
      for i := 0 to 3 do
      begin
        numjogo := 19 + i;
        FbJogo.SelectCommand.Parameters['@numjogo'].Value := numjogo.ToString;
        dr := FbJogo.SelectCommand.ExecuteReader;
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
        sql := 'update JOGOS set COD_TIME2=' + codtime +
            ' where (DESC_TIME2=''' + destime + ''')';
        FbJogo.UpdateCommand.CommandText := sql;
        FbJogo.UpdateCommand.ExecuteNonQuery;

        sql := 'update JOGOS set COD_TIME1=' + codtime +
            ' where (DESC_TIME1=''' + destime + ''')';
        FbJogo.UpdateCommand.CommandText := sql;
        FbJogo.UpdateCommand.ExecuteNonQuery;
      end;
    end;
    if fase4 then
    begin
      for i := 0 to 1 do
      begin
        numjogo := 23 + i;
        FbJogo.SelectCommand.Parameters['@numjogo'].Value := numjogo.ToString;
        dr := FbJogo.SelectCommand.ExecuteReader;
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
        sql := 'update JOGOS set COD_TIME2=' + codtime1 +
            ' where (DESC_TIME2=''' + destime + ''')';
        FbJogo.UpdateCommand.CommandText := sql;
        FbJogo.UpdateCommand.ExecuteNonQuery;

        sql := 'update JOGOS set COD_TIME1=' + codtime1 +
            ' where (DESC_TIME1=''' + destime + ''')';
        FbJogo.UpdateCommand.CommandText := sql;
        FbJogo.UpdateCommand.ExecuteNonQuery;

        destime := 'P' + numjogo.ToString;
        sql := 'update JOGOS set COD_TIME2=' + codtime2 +
            ' where (DESC_TIME2=''' +
            destime + ''')';
        FbJogo.UpdateCommand.CommandText := sql;
        FbJogo.UpdateCommand.ExecuteNonQuery;

        sql := 'update JOGOS set COD_TIME1=' + codtime2 +
            ' where (DESC_TIME1=''' + destime + ''')';
        FbJogo.UpdateCommand.CommandText := sql;
        FbJogo.UpdateCommand.ExecuteNonQuery;
      end;
    end;
    FbJogos.Fill(dsJogos);
    DGJogos.DataBind;
  finally
    FbConAdm.Close;
    Panel1.Enabled := False;
    txtG1.Enabled := False;
    txtG2.Enabled := False;
    rbResul.Visible := False;
  end;
end;

procedure TWebForm2.btnCancelar_Click(sender: System.Object; e: System.EventArgs);
begin
  Panel1.Enabled := False;
  txtG1.Enabled := False;
  txtG2.Enabled := False;
  rbResul.Visible := False;
  DGJogos.SelectedIndex := -1;
end;

procedure TWebForm2.DGJogos_SelectedIndexChanged(sender: System.Object; e: System.EventArgs);
var
  sel1, sel2, g1, g2, fase, res, cod1, cod2, num: string;

begin
  num := DGJogos.SelectedItem.Cells[0].Text;
  cod1 := DGJogos.SelectedItem.Cells[8].Text;
  cod2 := DGJogos.SelectedItem.Cells[9].Text;
  sel1 := DGJogos.SelectedItem.Cells[2].Text;
  sel2 := DGJogos.SelectedItem.Cells[5].Text;
  g1   := DGJogos.SelectedItem.Cells[3].Text;
  g2   := DGJogos.SelectedItem.Cells[4].Text;
  fase := DGJogos.SelectedItem.Cells[7].Text;
  res  := DGJogos.SelectedItem.Cells[6].Text;

  if g1 = '&nbsp;' then
    g1 := '0';
  if g2 = '&nbsp;' then
    g2 := '0';
  if (res = '&nbsp;') or (res = '-1') then
    res := '0';

  labNum.Text := num;
  labS1.Text := sel1;
  labS2.Text := sel2;
  labF.Text := fase;
  labR.Text := res;
  txtG1.SelectedValue := g1;
  txtG2.SelectedValue := g2;
  rbResul.Items[0].Text := sel1;
  rbResul.Items[1].Text := sel2;
  rbResul.Items[0].Value := cod1;
  rbResul.Items[1].Value := cod2;
  rbResul.Visible := (fase <> '1') and (g1 = g2);
  if rbResul.Visible then
    rbResul.SelectedIndex := StrToInt(res)-1;
  Panel1.Enabled := True;
  txtG1.Enabled := True;
  txtG2.Enabled := True;
end;

end.

