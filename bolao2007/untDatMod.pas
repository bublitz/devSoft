unit untDatMod;

interface

uses System.ComponentModel, FirebirdSql.Data.FirebirdClient, System.Data,
  System.Globalization, Borland.Vcl.SysUtils, System.Configuration;

type
  TDataModule = class(System.ComponentModel.Component)
    strict private
      FbCommand1: FirebirdSql.Data.FirebirdClient.FbCommand;
    FbCommand2: FirebirdSql.Data.FirebirdClient.FbCommand;
    FbCommand3: FirebirdSql.Data.FirebirdClient.FbCommand;
    FbCommand4: FirebirdSql.Data.FirebirdClient.FbCommand;
    FbCommand5: FirebirdSql.Data.FirebirdClient.FbCommand;
    FbCommand6: FirebirdSql.Data.FirebirdClient.FbCommand;
    FbCommand7: FirebirdSql.Data.FirebirdClient.FbCommand;
    FbCommand8: FirebirdSql.Data.FirebirdClient.FbCommand;
    FbCommand9: FirebirdSql.Data.FirebirdClient.FbCommand;
    FbCommand10: FirebirdSql.Data.FirebirdClient.FbCommand;
    FbCommand11: FirebirdSql.Data.FirebirdClient.FbCommand;
    FbCommand12: FirebirdSql.Data.FirebirdClient.FbCommand;
    FbCommand13: FirebirdSql.Data.FirebirdClient.FbCommand;
    FbCommand14: FirebirdSql.Data.FirebirdClient.FbCommand;
    FbCommand15: FirebirdSql.Data.FirebirdClient.FbCommand;
    FbCommand16: FirebirdSql.Data.FirebirdClient.FbCommand;
    FbCommand17: FirebirdSql.Data.FirebirdClient.FbCommand;
    FbCommand18: FirebirdSql.Data.FirebirdClient.FbCommand;
    FbCommand19: FirebirdSql.Data.FirebirdClient.FbCommand;
    FbCommand20: FirebirdSql.Data.FirebirdClient.FbCommand;
    FbCommand24: FirebirdSql.Data.FirebirdClient.FbCommand;
    FbCommand25: FirebirdSql.Data.FirebirdClient.FbCommand;
    FbCommand21: FirebirdSql.Data.FirebirdClient.FbCommand;
    FbCommand22: FirebirdSql.Data.FirebirdClient.FbCommand;
    FbCommand23: FirebirdSql.Data.FirebirdClient.FbCommand;
    FbCommand26: FirebirdSql.Data.FirebirdClient.FbCommand;
    FbCommand27: FirebirdSql.Data.FirebirdClient.FbCommand;
    FbCommand28: FirebirdSql.Data.FirebirdClient.FbCommand;
    FbCommand29: FirebirdSql.Data.FirebirdClient.FbCommand;
    FbCommand30: FirebirdSql.Data.FirebirdClient.FbCommand;
    FbCommand31: FirebirdSql.Data.FirebirdClient.FbCommand;
    FbCommand32: FirebirdSql.Data.FirebirdClient.FbCommand;
    FbCommand33: FirebirdSql.Data.FirebirdClient.FbCommand;
    FbCommand34: FirebirdSql.Data.FirebirdClient.FbCommand;
    FbCommand35: FirebirdSql.Data.FirebirdClient.FbCommand;
    FbCommand36: FirebirdSql.Data.FirebirdClient.FbCommand;
    FbCommand37: FirebirdSql.Data.FirebirdClient.FbCommand;
    FbCommand38: FirebirdSql.Data.FirebirdClient.FbCommand;
    FbCommand42: FirebirdSql.Data.FirebirdClient.FbCommand;
    FbCommand39: FirebirdSql.Data.FirebirdClient.FbCommand;
    FbCommand40: FirebirdSql.Data.FirebirdClient.FbCommand;
    FbCommand41: FirebirdSql.Data.FirebirdClient.FbCommand;
    FbCommand43: FirebirdSql.Data.FirebirdClient.FbCommand;
    FbCommand44: FirebirdSql.Data.FirebirdClient.FbCommand;
    FbCommand45: FirebirdSql.Data.FirebirdClient.FbCommand;
    FbCommand46: FirebirdSql.Data.FirebirdClient.FbCommand;
    FbCommand47: FirebirdSql.Data.FirebirdClient.FbCommand;
    FbCommand48: FirebirdSql.Data.FirebirdClient.FbCommand;
    FbCommand49: FirebirdSql.Data.FirebirdClient.FbCommand;
    FbCommand50: FirebirdSql.Data.FirebirdClient.FbCommand;
    FbCommand51: FirebirdSql.Data.FirebirdClient.FbCommand;
    FbNumPag: FirebirdSql.Data.FirebirdClient.FbCommand;
    FbVerTabela: FirebirdSql.Data.FirebirdClient.FbCommand;
    procedure InitializeComponent;
  public
    FbCon: FirebirdSql.Data.FirebirdClient.FbConnection;
    FbJogos: FirebirdSql.Data.FirebirdClient.FbDataAdapter;
    FbJogadores: FirebirdSql.Data.FirebirdClient.FbDataAdapter;
    FbTimes: FirebirdSql.Data.FirebirdClient.FbDataAdapter;
    FbGrupos: FirebirdSql.Data.FirebirdClient.FbDataAdapter;
    FbPontuacao: FirebirdSql.Data.FirebirdClient.FbDataAdapter;
    FbTabela: FirebirdSql.Data.FirebirdClient.FbDataAdapter;
    FbTabJogador: FirebirdSql.Data.FirebirdClient.FbDataAdapter;
    FbApostas: FirebirdSql.Data.FirebirdClient.FbDataAdapter;
    FbGrupoTabela: FirebirdSql.Data.FirebirdClient.FbDataAdapter;
    FbPontoTabela: FirebirdSql.Data.FirebirdClient.FbDataAdapter;
    FbVerificaFase: FirebirdSql.Data.FirebirdClient.FbDataAdapter;
    FbJogoTabela: FirebirdSql.Data.FirebirdClient.FbDataAdapter;
    FbRanking: FirebirdSql.Data.FirebirdClient.FbCommand;
    FbPosicao: FirebirdSql.Data.FirebirdClient.FbCommand;
    FbJogosTab: FirebirdSql.Data.FirebirdClient.FbCommand;
    function Conecta: boolean;
    procedure Desconecta;
    function Limpa(entrada: string): string;
    function EMailCadastrado(email: string): boolean;
    function PegaSenha(email: string): string;
    function VerificaUser(email, senha: string; var nome: string;
      var apelido: string): integer;
    function VerificaTabela(CodigoTabela: string): boolean;
    function PegaPag: string;
    constructor Create;
  end;

implementation

{ TDataModule }

procedure TDataModule.InitializeComponent;
var
  configurationAppSettings: System.Configuration.AppSettingsReader;
begin
  configurationAppSettings := System.Configuration.AppSettingsReader.Create;
  Self.FbCon := FirebirdSql.Data.FirebirdClient.FbConnection.Create;
  Self.FbJogos := FirebirdSql.Data.FirebirdClient.FbDataAdapter.Create;
  Self.FbCommand4 := FirebirdSql.Data.FirebirdClient.FbCommand.Create;
  Self.FbCommand2 := FirebirdSql.Data.FirebirdClient.FbCommand.Create;
  Self.FbCommand1 := FirebirdSql.Data.FirebirdClient.FbCommand.Create;
  Self.FbCommand3 := FirebirdSql.Data.FirebirdClient.FbCommand.Create;
  Self.FbJogadores := FirebirdSql.Data.FirebirdClient.FbDataAdapter.Create;
  Self.FbCommand8 := FirebirdSql.Data.FirebirdClient.FbCommand.Create;
  Self.FbCommand6 := FirebirdSql.Data.FirebirdClient.FbCommand.Create;
  Self.FbCommand5 := FirebirdSql.Data.FirebirdClient.FbCommand.Create;
  Self.FbCommand7 := FirebirdSql.Data.FirebirdClient.FbCommand.Create;
  Self.FbTimes := FirebirdSql.Data.FirebirdClient.FbDataAdapter.Create;
  Self.FbCommand12 := FirebirdSql.Data.FirebirdClient.FbCommand.Create;
  Self.FbCommand10 := FirebirdSql.Data.FirebirdClient.FbCommand.Create;
  Self.FbCommand9 := FirebirdSql.Data.FirebirdClient.FbCommand.Create;
  Self.FbCommand11 := FirebirdSql.Data.FirebirdClient.FbCommand.Create;
  Self.FbGrupos := FirebirdSql.Data.FirebirdClient.FbDataAdapter.Create;
  Self.FbCommand16 := FirebirdSql.Data.FirebirdClient.FbCommand.Create;
  Self.FbCommand14 := FirebirdSql.Data.FirebirdClient.FbCommand.Create;
  Self.FbCommand13 := FirebirdSql.Data.FirebirdClient.FbCommand.Create;
  Self.FbCommand15 := FirebirdSql.Data.FirebirdClient.FbCommand.Create;
  Self.FbPontuacao := FirebirdSql.Data.FirebirdClient.FbDataAdapter.Create;
  Self.FbCommand20 := FirebirdSql.Data.FirebirdClient.FbCommand.Create;
  Self.FbCommand18 := FirebirdSql.Data.FirebirdClient.FbCommand.Create;
  Self.FbCommand17 := FirebirdSql.Data.FirebirdClient.FbCommand.Create;
  Self.FbCommand19 := FirebirdSql.Data.FirebirdClient.FbCommand.Create;
  Self.FbCommand24 := FirebirdSql.Data.FirebirdClient.FbCommand.Create;
  Self.FbCommand25 := FirebirdSql.Data.FirebirdClient.FbCommand.Create;
  Self.FbTabela := FirebirdSql.Data.FirebirdClient.FbDataAdapter.Create;
  Self.FbCommand26 := FirebirdSql.Data.FirebirdClient.FbCommand.Create;
  Self.FbCommand22 := FirebirdSql.Data.FirebirdClient.FbCommand.Create;
  Self.FbCommand21 := FirebirdSql.Data.FirebirdClient.FbCommand.Create;
  Self.FbCommand23 := FirebirdSql.Data.FirebirdClient.FbCommand.Create;
  Self.FbTabJogador := FirebirdSql.Data.FirebirdClient.FbDataAdapter.Create;
  Self.FbCommand30 := FirebirdSql.Data.FirebirdClient.FbCommand.Create;
  Self.FbCommand28 := FirebirdSql.Data.FirebirdClient.FbCommand.Create;
  Self.FbCommand27 := FirebirdSql.Data.FirebirdClient.FbCommand.Create;
  Self.FbCommand29 := FirebirdSql.Data.FirebirdClient.FbCommand.Create;
  Self.FbApostas := FirebirdSql.Data.FirebirdClient.FbDataAdapter.Create;
  Self.FbCommand34 := FirebirdSql.Data.FirebirdClient.FbCommand.Create;
  Self.FbCommand32 := FirebirdSql.Data.FirebirdClient.FbCommand.Create;
  Self.FbCommand31 := FirebirdSql.Data.FirebirdClient.FbCommand.Create;
  Self.FbCommand33 := FirebirdSql.Data.FirebirdClient.FbCommand.Create;
  Self.FbGrupoTabela := FirebirdSql.Data.FirebirdClient.FbDataAdapter.Create;
  Self.FbCommand38 := FirebirdSql.Data.FirebirdClient.FbCommand.Create;
  Self.FbCommand36 := FirebirdSql.Data.FirebirdClient.FbCommand.Create;
  Self.FbCommand35 := FirebirdSql.Data.FirebirdClient.FbCommand.Create;
  Self.FbCommand37 := FirebirdSql.Data.FirebirdClient.FbCommand.Create;
  Self.FbCommand42 := FirebirdSql.Data.FirebirdClient.FbCommand.Create;
  Self.FbPontoTabela := FirebirdSql.Data.FirebirdClient.FbDataAdapter.Create;
  Self.FbCommand43 := FirebirdSql.Data.FirebirdClient.FbCommand.Create;
  Self.FbCommand40 := FirebirdSql.Data.FirebirdClient.FbCommand.Create;
  Self.FbCommand41 := FirebirdSql.Data.FirebirdClient.FbCommand.Create;
  Self.FbCommand39 := FirebirdSql.Data.FirebirdClient.FbCommand.Create;
  Self.FbVerificaFase := FirebirdSql.Data.FirebirdClient.FbDataAdapter.Create;
  Self.FbCommand47 := FirebirdSql.Data.FirebirdClient.FbCommand.Create;
  Self.FbCommand45 := FirebirdSql.Data.FirebirdClient.FbCommand.Create;
  Self.FbCommand44 := FirebirdSql.Data.FirebirdClient.FbCommand.Create;
  Self.FbCommand46 := FirebirdSql.Data.FirebirdClient.FbCommand.Create;
  Self.FbJogoTabela := FirebirdSql.Data.FirebirdClient.FbDataAdapter.Create;
  Self.FbCommand51 := FirebirdSql.Data.FirebirdClient.FbCommand.Create;
  Self.FbCommand49 := FirebirdSql.Data.FirebirdClient.FbCommand.Create;
  Self.FbCommand48 := FirebirdSql.Data.FirebirdClient.FbCommand.Create;
  Self.FbCommand50 := FirebirdSql.Data.FirebirdClient.FbCommand.Create;
  Self.FbNumPag := FirebirdSql.Data.FirebirdClient.FbCommand.Create;
  Self.FbRanking := FirebirdSql.Data.FirebirdClient.FbCommand.Create;
  Self.FbVerTabela := FirebirdSql.Data.FirebirdClient.FbCommand.Create;
  Self.FbPosicao := FirebirdSql.Data.FirebirdClient.FbCommand.Create;
  Self.FbJogosTab := FirebirdSql.Data.FirebirdClient.FbCommand.Create;
  // 
  // FbCon
  // 
  Self.FbCon.ConnectionString := (string(configurationAppSettings.GetValue('F' +
    'bCon.ConnectionString', TypeOf(string))));
  // 
  // FbJogos
  // 
  Self.FbJogos.DeleteCommand := Self.FbCommand4;
  Self.FbJogos.InsertCommand := Self.FbCommand2;
  Self.FbJogos.SelectCommand := Self.FbCommand1;
  Self.FbJogos.UpdateCommand := Self.FbCommand3;
  // 
  // FbCommand4
  // 
  Self.FbCommand4.CommandText := 'SELECT * FROM PONTOS_TAB(@codgrupo,@codtab' +
  'ela) ORDER BY PONTOS DESC, VITORIAS DESC, SALDOGOLS DESC, GOLSPRO DESC, C' +
  'OD_TIME';
  Self.FbCommand4.Connection := Self.FbCon;
  Self.FbCommand4.Parameters.Add(FirebirdSql.Data.FirebirdClient.FbParameter.Create('@' +
      'codgrupo', FirebirdSql.Data.FirebirdClient.FbDbType.VarChar));
  Self.FbCommand4.Parameters.Add(FirebirdSql.Data.FirebirdClient.FbParameter.Create('@' +
      'codtabela', FirebirdSql.Data.FirebirdClient.FbDbType.VarChar));
  // 
  // FbCommand1
  // 
  Self.FbCommand1.CommandText := 'select j.data_hora, coalesce(t1.nome_time,' +
  ' j.desc_time1) desc_time1,'#13#10'coalesce(t2.nome_time, j.desc_time2) de' +
  'sc_time2, j.fase, r.gol_t1,'#13#10'r.gol_t2, j.cod_time1, j.cod_time2'#13 +
  #10'from JOGOS j'#13#10'left join resultados r on j.num_jogo=r.num_jogo'#13 +
  #10'left join TIMES t1 on j.cod_time1 = t1.cod_time'#13#10'left join TIMES' +
  ' t2 on j.cod_time2 = t2.cod_time'#13#10'where j.num_jogo=@numjogo order b' +
  'y 1';
  Self.FbCommand1.Connection := Self.FbCon;
  Self.FbCommand1.Parameters.Add(FirebirdSql.Data.FirebirdClient.FbParameter.Create('@' +
      'numjogo', FirebirdSql.Data.FirebirdClient.FbDbType.Integer, 5, System.Data.ParameterDirection.Input, 
        False, (Byte(0)), (Byte(0)), '', System.Data.DataRowVersion.Current, 
        '49'));
  // 
  // FbJogadores
  // 
  Self.FbJogadores.DeleteCommand := Self.FbCommand8;
  Self.FbJogadores.InsertCommand := Self.FbCommand6;
  Self.FbJogadores.SelectCommand := Self.FbCommand5;
  Self.FbJogadores.UpdateCommand := Self.FbCommand7;
  // 
  // FbCommand8
  // 
  Self.FbCommand8.CommandText := 'DELETE FROM "JOGADORES" WHERE (("COD_JOGAD' +
  'OR" = @p1) AND (("NOME_JOGADOR" IS NULL AND COALESCE(@p2, CAST(NULL AS VA' +
  'RCHAR(50))) IS NULL) OR ("NOME_JOGADOR" = @p2)) AND (("APELIDO_JOGADOR" I' +
  'S NULL AND COALESCE(@p3, CAST(NULL AS VARCHAR(25))) IS NULL) OR ("APELIDO' +
  '_JOGADOR" = @p3)) AND (("REGIONAL" IS NULL AND COALESCE(@p4, CAST(NULL AS' +
  ' VARCHAR(6))) IS NULL) OR ("REGIONAL" = @p4)) AND (("EMAIL" IS NULL AND C' +
  'OALESCE(@p5, CAST(NULL AS VARCHAR(50))) IS NULL) OR ("EMAIL" = @p5)) AND ' +
  '(("SENHA" IS NULL AND COALESCE(@p6, CAST(NULL AS VARCHAR(15))) IS NULL) O' +
  'R ("SENHA" = @p6)) AND (("PONTOS" IS NULL AND COALESCE(@p7, CAST(NULL AS ' +
  'NUMERIC(5,0))) IS NULL) OR ("PONTOS" = @p7)) AND (("JOGOS" IS NULL AND CO' +
  'ALESCE(@p8, CAST(NULL AS NUMERIC(2,0))) IS NULL) OR ("JOGOS" = @p8)))';
  Self.FbCommand8.Connection := Self.FbCon;
  // 
  // FbCommand6
  // 
  Self.FbCommand6.CommandText := 'INSERT INTO "JOGADORES" ("NOME_JOGADOR","A' +
  'PELIDO_JOGADOR","CPF","EMAIL","SENHA") VALUES (@p1,@p2,@p3,@p4,@p5)';
  Self.FbCommand6.Connection := Self.FbCon;
  Self.FbCommand6.Parameters.Add(FirebirdSql.Data.FirebirdClient.FbParameter.Create('@' +
      'p1', FirebirdSql.Data.FirebirdClient.FbDbType.VarChar));
  Self.FbCommand6.Parameters.Add(FirebirdSql.Data.FirebirdClient.FbParameter.Create('@' +
      'p2', FirebirdSql.Data.FirebirdClient.FbDbType.VarChar));
  Self.FbCommand6.Parameters.Add(FirebirdSql.Data.FirebirdClient.FbParameter.Create('@' +
      'p3', FirebirdSql.Data.FirebirdClient.FbDbType.VarChar));
  Self.FbCommand6.Parameters.Add(FirebirdSql.Data.FirebirdClient.FbParameter.Create('@' +
      'p4', FirebirdSql.Data.FirebirdClient.FbDbType.VarChar));
  Self.FbCommand6.Parameters.Add(FirebirdSql.Data.FirebirdClient.FbParameter.Create('@' +
      'p5', FirebirdSql.Data.FirebirdClient.FbDbType.VarChar));
  // 
  // FbCommand5
  // 
  Self.FbCommand5.CommandText := 'select COD_JOGADOR, NOME_JOGADOR, APELIDO_' +
  'JOGADOR, EMAIL, SENHA, CPF, DATA_CADASTRO from JOGADORES where EMAIL = @e' +
  'mail ORDER BY 1';
  Self.FbCommand5.Connection := Self.FbCon;
  Self.FbCommand5.Parameters.Add(FirebirdSql.Data.FirebirdClient.FbParameter.Create('@' +
      'email', FirebirdSql.Data.FirebirdClient.FbDbType.VarChar));
  // 
  // FbCommand7
  // 
  Self.FbCommand7.CommandText := 'UPDATE "JOGADORES" SET "COD_JOGADOR" = @p1' +
  ',"NOME_JOGADOR" = @p2,"APELIDO_JOGADOR" = @p3,"REGIONAL" = @p4,"EMAIL" = ' +
  '@p5,"SENHA" = @p6,"PONTOS" = @p7,"JOGOS" = @p8 WHERE (("COD_JOGADOR" = @p' +
  '9) AND (("NOME_JOGADOR" IS NULL AND COALESCE(@p10, CAST(NULL AS VARCHAR(5' +
  '0))) IS NULL) OR ("NOME_JOGADOR" = @p10)) AND (("APELIDO_JOGADOR" IS NULL' +
  ' AND COALESCE(@p11, CAST(NULL AS VARCHAR(25))) IS NULL) OR ("APELIDO_JOGA' +
  'DOR" = @p11)) AND (("REGIONAL" IS NULL AND COALESCE(@p12, CAST(NULL AS VA' +
  'RCHAR(6))) IS NULL) OR ("REGIONAL" = @p12)) AND (("EMAIL" IS NULL AND COA' +
  'LESCE(@p13, CAST(NULL AS VARCHAR(50))) IS NULL) OR ("EMAIL" = @p13)) AND ' +
  '(("SENHA" IS NULL AND COALESCE(@p14, CAST(NULL AS VARCHAR(15))) IS NULL) ' +
  'OR ("SENHA" = @p14)) AND (("PONTOS" IS NULL AND COALESCE(@p15, CAST(NULL ' +
  'AS NUMERIC(5,0))) IS NULL) OR ("PONTOS" = @p15)) AND (("JOGOS" IS NULL AN' +
  'D COALESCE(@p16, CAST(NULL AS NUMERIC(2,0))) IS NULL) OR ("JOGOS" = @p16)' +
  '))';
  Self.FbCommand7.Connection := Self.FbCon;
  // 
  // FbTimes
  // 
  Self.FbTimes.DeleteCommand := Self.FbCommand12;
  Self.FbTimes.InsertCommand := Self.FbCommand10;
  Self.FbTimes.SelectCommand := Self.FbCommand9;
  Self.FbTimes.UpdateCommand := Self.FbCommand11;
  // 
  // FbCommand9
  // 
  Self.FbCommand9.CommandText := 'select * from TIMES';
  Self.FbCommand9.Connection := Self.FbCon;
  // 
  // FbGrupos
  // 
  Self.FbGrupos.DeleteCommand := Self.FbCommand16;
  Self.FbGrupos.InsertCommand := Self.FbCommand14;
  Self.FbGrupos.SelectCommand := Self.FbCommand13;
  Self.FbGrupos.UpdateCommand := Self.FbCommand15;
  // 
  // FbCommand13
  // 
  Self.FbCommand13.CommandText := 'select j.data_hora, t.nome_time desc_time' +
  '1, t2.nome_time desc_time2, j.fase, r.gol_t1, r.gol_t2, j.cod_time1, j.co' +
  'd_time2'#13#10'from JOGOS j'#13#10'left join resultados r on j.num_jogo=r' +
  '.num_jogo'#13#10'left join TIMES t on j.cod_time1 = t.cod_time'#13#10'lef' +
  't join TIMES t2 on j.cod_time2 = t2.cod_time'#13#10'where t.cod_f1 like @' +
  'cod_grupo  and j.fase=''1'' order by 1';
  Self.FbCommand13.Connection := Self.FbCon;
  Self.FbCommand13.Parameters.Add(FirebirdSql.Data.FirebirdClient.FbParameter.Create('@' +
      'cod_grupo', FirebirdSql.Data.FirebirdClient.FbDbType.VarChar, 5));
  // 
  // FbPontuacao
  // 
  Self.FbPontuacao.DeleteCommand := Self.FbCommand20;
  Self.FbPontuacao.InsertCommand := Self.FbCommand18;
  Self.FbPontuacao.SelectCommand := Self.FbCommand17;
  Self.FbPontuacao.UpdateCommand := Self.FbCommand19;
  // 
  // FbCommand17
  // 
  Self.FbCommand17.CommandText := 'SELECT * FROM PONTUACAO(@codgrupo) ORDER ' +
  'BY PONTOS DESC, VITORIAS DESC, SALDOGOLS DESC, GOLSPRO DESC, COD_TIME';
  Self.FbCommand17.Connection := Self.FbCon;
  Self.FbCommand17.Parameters.Add(FirebirdSql.Data.FirebirdClient.FbParameter.Create('@' +
      'codgrupo', FirebirdSql.Data.FirebirdClient.FbDbType.VarChar, 2));
  // 
  // FbTabela
  // 
  Self.FbTabela.DeleteCommand := Self.FbCommand26;
  Self.FbTabela.InsertCommand := Self.FbCommand22;
  Self.FbTabela.SelectCommand := Self.FbCommand21;
  Self.FbTabela.UpdateCommand := Self.FbCommand23;
  // 
  // FbCommand21
  // 
  Self.FbCommand21.CommandText := 'select COD_TABELA, COD_JOGADOR from TABEL' +
  'A where COD_JOGADOR = @codjog order by 1';
  Self.FbCommand21.Connection := Self.FbCon;
  Self.FbCommand21.Parameters.Add(FirebirdSql.Data.FirebirdClient.FbParameter.Create('@' +
      'codjog', FirebirdSql.Data.FirebirdClient.FbDbType.Integer));
  // 
  // FbCommand23
  // 
  Self.FbCommand23.CommandText := 'update TABELA set COD_JOGADOR=@codjogador' +
  ' where COD_TABELA=@codtabela';
  Self.FbCommand23.Connection := Self.FbCon;
  Self.FbCommand23.Parameters.Add(FirebirdSql.Data.FirebirdClient.FbParameter.Create('@' +
      'codjogador', FirebirdSql.Data.FirebirdClient.FbDbType.Integer));
  Self.FbCommand23.Parameters.Add(FirebirdSql.Data.FirebirdClient.FbParameter.Create('@' +
      'codtabela', FirebirdSql.Data.FirebirdClient.FbDbType.VarChar));
  // 
  // FbTabJogador
  // 
  Self.FbTabJogador.DeleteCommand := Self.FbCommand30;
  Self.FbTabJogador.InsertCommand := Self.FbCommand28;
  Self.FbTabJogador.SelectCommand := Self.FbCommand27;
  Self.FbTabJogador.UpdateCommand := Self.FbCommand29;
  // 
  // FbCommand30
  // 
  Self.FbCommand30.CommandText := 'DELETE FROM "TABELA" WHERE (("COD_TABELA"' +
  ' = @p1) AND (("COD_JOGADOR" IS NULL AND COALESCE(@p2, CAST(NULL AS NUMERI' +
  'C(5,0))) IS NULL) OR ("COD_JOGADOR" = @p2)))';
  Self.FbCommand30.Connection := Self.FbCon;
  // 
  // FbCommand28
  // 
  Self.FbCommand28.CommandText := 'INSERT INTO "TABELA" ("COD_TABELA","COD_J' +
  'OGADOR") VALUES (@p1,@p2)';
  Self.FbCommand28.Connection := Self.FbCon;
  // 
  // FbCommand27
  // 
  Self.FbCommand27.CommandText := 'select COD_TABELA, COD_JOGADOR from TABEL' +
  'A '#13#10'where COD_TABELA=@codtab';
  Self.FbCommand27.Connection := Self.FbCon;
  Self.FbCommand27.Parameters.Add(FirebirdSql.Data.FirebirdClient.FbParameter.Create('@' +
      'codtab', FirebirdSql.Data.FirebirdClient.FbDbType.VarChar));
  // 
  // FbCommand29
  // 
  Self.FbCommand29.CommandText := 'UPDATE TABELA SET COD_JOGADOR = @p1 WHERE' +
  ' COD_TABELA = @p2';
  Self.FbCommand29.Connection := Self.FbCon;
  Self.FbCommand29.Parameters.Add(FirebirdSql.Data.FirebirdClient.FbParameter.Create('@' +
      'p1', FirebirdSql.Data.FirebirdClient.FbDbType.Integer));
  Self.FbCommand29.Parameters.Add(FirebirdSql.Data.FirebirdClient.FbParameter.Create('@' +
      'p2', FirebirdSql.Data.FirebirdClient.FbDbType.VarChar));
  // 
  // FbApostas
  // 
  Self.FbApostas.DeleteCommand := Self.FbCommand34;
  Self.FbApostas.InsertCommand := Self.FbCommand32;
  Self.FbApostas.SelectCommand := Self.FbCommand31;
  Self.FbApostas.UpdateCommand := Self.FbCommand33;
  // 
  // FbCommand34
  // 
  Self.FbCommand34.CommandText := 'DELETE FROM "APOSTAS" WHERE ((("RESULTADO' +
  '" IS NULL AND COALESCE(@p1, CAST(NULL AS NUMERIC(1,0))) IS NULL) OR ("RES' +
  'ULTADO" = @p1)) AND ("NUM_JOGO" = @p2) AND (("GOL_T1" IS NULL AND COALESC' +
  'E(@p3, CAST(NULL AS NUMERIC(2,0))) IS NULL) OR ("GOL_T1" = @p3)) AND (("G' +
  'OL_T2" IS NULL AND COALESCE(@p4, CAST(NULL AS NUMERIC(2,0))) IS NULL) OR ' +
  '("GOL_T2" = @p4)) AND ("COD_TABELA" = @p5))';
  Self.FbCommand34.Connection := Self.FbCon;
  // 
  // FbCommand32
  // 
  Self.FbCommand32.Connection := Self.FbCon;
  // 
  // FbCommand31
  // 
  Self.FbCommand31.CommandText := 'select * from APOSTAS';
  Self.FbCommand31.Connection := Self.FbCon;
  // 
  // FbCommand33
  // 
  Self.FbCommand33.CommandText := 'UPDATE "APOSTAS" SET "RESULTADO" = @p1,"N' +
  'UM_JOGO" = @p2,"GOL_T1" = @p3,"GOL_T2" = @p4,"COD_TABELA" = @p5 WHERE (((' +
  '"RESULTADO" IS NULL AND COALESCE(@p6, CAST(NULL AS NUMERIC(1,0))) IS NULL' +
  ') OR ("RESULTADO" = @p6)) AND ("NUM_JOGO" = @p7) AND (("GOL_T1" IS NULL A' +
  'ND COALESCE(@p8, CAST(NULL AS NUMERIC(2,0))) IS NULL) OR ("GOL_T1" = @p8)' +
  ') AND (("GOL_T2" IS NULL AND COALESCE(@p9, CAST(NULL AS NUMERIC(2,0))) IS' +
  ' NULL) OR ("GOL_T2" = @p9)) AND ("COD_TABELA" = @p10))';
  Self.FbCommand33.Connection := Self.FbCon;
  // 
  // FbGrupoTabela
  // 
  Self.FbGrupoTabela.DeleteCommand := Self.FbCommand38;
  Self.FbGrupoTabela.InsertCommand := Self.FbCommand36;
  Self.FbGrupoTabela.SelectCommand := Self.FbCommand35;
  Self.FbGrupoTabela.UpdateCommand := Self.FbCommand37;
  // 
  // FbCommand35
  // 
  Self.FbCommand35.CommandText := 'select j.data_hora, t.nome_time desc_time' +
  '1, t2.nome_time desc_time2, j.fase,'#13#10'coalesce(a.gol_t1,0) gol_t1, c' +
  'oalesce(a.gol_t2, 0) gol_t2, j.cod_time1, j.cod_time2, j.num_jogo'#13#10'f' +
  'rom JOGOS j'#13#10'left join APOSTAS a on j.num_jogo=a.num_jogo and a.cod' +
  '_tabela=@codtabela'#13#10'left join TIMES t on j.cod_time1 = t.cod_time'#13 +
  #10'left join TIMES t2 on j.cod_time2 = t2.cod_time'#13#10'where t.cod_f1 ' +
  'like @codgrupo and j.fase=''1'' order by 1';
  Self.FbCommand35.Connection := Self.FbCon;
  Self.FbCommand35.Parameters.Add(FirebirdSql.Data.FirebirdClient.FbParameter.Create('@' +
      'codtabela', FirebirdSql.Data.FirebirdClient.FbDbType.VarChar));
  Self.FbCommand35.Parameters.Add(FirebirdSql.Data.FirebirdClient.FbParameter.Create('@' +
      'codgrupo', FirebirdSql.Data.FirebirdClient.FbDbType.VarChar));
  // 
  // FbCommand37
  // 
  Self.FbCommand37.Connection := Self.FbCon;
  // 
  // FbCommand42
  // 
  Self.FbCommand42.CommandType := System.Data.CommandType.StoredProcedure;
  Self.FbCommand42.Connection := Self.FbCon;
  // 
  // FbPontoTabela
  // 
  Self.FbPontoTabela.DeleteCommand := Self.FbCommand43;
  Self.FbPontoTabela.InsertCommand := Self.FbCommand40;
  Self.FbPontoTabela.SelectCommand := Self.FbCommand4;
  Self.FbPontoTabela.UpdateCommand := Self.FbCommand41;
  // 
  // FbCommand39
  // 
  Self.FbCommand39.CommandText := 'SELECT * FROM PONTOS_TAB(@codgrupo, @codt' +
  'abela) ORDER BY PONTOS DESC, VITORIAS DESC, SALDOGOLS DESC, GOLSPRO DESC,' +
  ' SELECAO';
  Self.FbCommand39.Connection := Self.FbCon;
  Self.FbCommand39.Parameters.Add(FirebirdSql.Data.FirebirdClient.FbParameter.Create('@' +
      'codgrupo', FirebirdSql.Data.FirebirdClient.FbDbType.VarChar));
  Self.FbCommand39.Parameters.Add(FirebirdSql.Data.FirebirdClient.FbParameter.Create('@' +
      'codtabela', FirebirdSql.Data.FirebirdClient.FbDbType.VarChar));
  // 
  // FbVerificaFase
  // 
  Self.FbVerificaFase.DeleteCommand := Self.FbCommand47;
  Self.FbVerificaFase.InsertCommand := Self.FbCommand45;
  Self.FbVerificaFase.SelectCommand := Self.FbCommand44;
  Self.FbVerificaFase.UpdateCommand := Self.FbCommand46;
  // 
  // FbCommand44
  // 
  Self.FbCommand44.CommandText := 'select count(a.num_jogo) from APOSTAS a, ' +
  'JOGOS j'#13#10'where a.num_jogo=j.num_jogo'#13#10'and a.resultado=-1 and ' +
  'j.fase=@fase'#13#10'and a.cod_tabela=@codtabela';
  Self.FbCommand44.Connection := Self.FbCon;
  Self.FbCommand44.Parameters.Add(FirebirdSql.Data.FirebirdClient.FbParameter.Create('@' +
      'fase', FirebirdSql.Data.FirebirdClient.FbDbType.VarChar));
  Self.FbCommand44.Parameters.Add(FirebirdSql.Data.FirebirdClient.FbParameter.Create('@' +
      'codtabela', FirebirdSql.Data.FirebirdClient.FbDbType.VarChar));
  // 
  // FbJogoTabela
  // 
  Self.FbJogoTabela.DeleteCommand := Self.FbCommand51;
  Self.FbJogoTabela.InsertCommand := Self.FbCommand49;
  Self.FbJogoTabela.SelectCommand := Self.FbCommand48;
  Self.FbJogoTabela.UpdateCommand := Self.FbCommand50;
  // 
  // FbCommand48
  // 
  Self.FbCommand48.CommandText := 'select j.data_hora, coalesce(t1.nome_time' +
  ', j.desc_time1) desc_time1,'#13#10'coalesce(t2.nome_time, j.desc_time2) d' +
  'esc_time2, j.fase, r.gol_t1,'#13#10'r.gol_t2, r.cod_time1, r.cod_time2, j' +
  '.num_jogo, r.resultado'#13#10'from JOGOS j'#13#10'left join apostas r on ' +
  'j.num_jogo=r.num_jogo'#13#10'left join TIMES t1 on r.cod_time1 = t1.cod_t' +
  'ime'#13#10'left join TIMES t2 on r.cod_time2 = t2.cod_time'#13#10'where j' +
  '.num_jogo=@numjogo'#13#10'and r.cod_tabela=@codtabela'#13#10'order by 1';
  Self.FbCommand48.Connection := Self.FbCon;
  Self.FbCommand48.Parameters.Add(FirebirdSql.Data.FirebirdClient.FbParameter.Create('@' +
      'numjogo', FirebirdSql.Data.FirebirdClient.FbDbType.Integer));
  Self.FbCommand48.Parameters.Add(FirebirdSql.Data.FirebirdClient.FbParameter.Create('@' +
      'codtabela', FirebirdSql.Data.FirebirdClient.FbDbType.VarChar));
  // 
  // FbNumPag
  // 
  Self.FbNumPag.CommandText := 'select cast(GEN_ID(GEN_NUMPAG, 1) as integer' +
  ') as Num_pag from RDB$DATABASE';
  Self.FbNumPag.Connection := Self.FbCon;
  // 
  // FbRanking
  // 
  Self.FbRanking.CommandText := 'select * from RANKING(@pos)';
  Self.FbRanking.Connection := Self.FbCon;
  Self.FbRanking.Parameters.Add(FirebirdSql.Data.FirebirdClient.FbParameter.Create('@' +
      'pos', FirebirdSql.Data.FirebirdClient.FbDbType.Integer));
  // 
  // FbVerTabela
  // 
  Self.FbVerTabela.CommandText := 'select COD_TABELA'#13#10'from TABELA '#13 +
  #10'where COD_TABELA=@codtab '#13#10'and COD_JOGADOR is null';
  Self.FbVerTabela.Connection := Self.FbCon;
  Self.FbVerTabela.Parameters.Add(FirebirdSql.Data.FirebirdClient.FbParameter.Create('@' +
      'codtab', FirebirdSql.Data.FirebirdClient.FbDbType.VarChar, 0, System.Data.ParameterDirection.Input, 
        False, (Byte(0)), (Byte(0)), 'COD_TABELA', System.Data.DataRowVersion.Current, 
        nil));
  // 
  // FbPosicao
  // 
  Self.FbPosicao.CommandText := 'Select ''1'' descricao, cast(count(j.COD_JO' +
  'GADOR) as numeric(9,2)) valor,'#13#10'       current_timestamp data_atual' +
  #13#10'from JOGADORES j'#13#10#13#10'union all'#13#10#13#10'select ''2'' d' +
  'escricao, cast(count(t.COD_TABELA) as numeric(9,2)) valor,'#13#10'       ' +
  'current_timestamp data_atual'#13#10'from TABELA t'#13#10'where t.COD_JOGA' +
  'DOR is not null'#13#10#13#10'union all'#13#10#13#10'Select ''3'' descrica' +
  'o, cast(count(t.COD_TABELA)*5 as numeric(9,2)) valor,'#13#10'       curre' +
  'nt_timestamp data_atual'#13#10'from TABELA t'#13#10'where t.COD_JOGADOR i' +
  's not null'#13#10#13#10'union all'#13#10#13#10'Select ''4'' descricao, ca' +
  'st(count(t.COD_TABELA)*2 as numeric(9,2)) valor,'#13#10'       current_ti' +
  'mestamp data_atual'#13#10'from TABELA t'#13#10'where t.COD_JOGADOR is not' +
  ' null'#13#10#13#10'union all'#13#10#13#10'Select ''5'' descricao, cast(co' +
  'unt(t.COD_TABELA)*1 as numeric(9,2)) valor,'#13#10'       current_timesta' +
  'mp data_atual'#13#10'from TABELA t'#13#10'where t.COD_JOGADOR is not null' +
  #13#10#13#10'union all'#13#10#13#10'Select ''6'' descricao, cast(count(t.C' +
  'OD_TABELA)*0.6 as numeric(9,2)) valor,'#13#10'       current_timestamp da' +
  'ta_atual'#13#10'from TABELA t'#13#10'where t.COD_JOGADOR is not null'#13#10 +
  #13#10'union all'#13#10#13#10'Select ''7'' descricao, cast(count(t.COD_TAB' +
  'ELA)*0.4 as numeric(9,2)) valor,'#13#10'       current_timestamp data_atu' +
  'al'#13#10'from TABELA t'#13#10'where t.COD_JOGADOR is not null'#13#10#13#10 +
  'union all'#13#10#13#10'Select ''8'' descricao, cast(count(t.COD_TABELA)*1' +
  ' as numeric(9,2)) valor,'#13#10'       current_timestamp data_atual'#13#10 +
  'from TABELA t'#13#10'where t.COD_JOGADOR is not null';
  Self.FbPosicao.Connection := Self.FbCon;
  // 
  // FbJogosTab
  // 
  Self.FbJogosTab.CommandText := 'select * FROM jogos_tab(@cd_tab)';
  Self.FbJogosTab.Connection := Self.FbCon;
  Self.FbJogosTab.Parameters.Add(FirebirdSql.Data.FirebirdClient.FbParameter.Create('@' +
      'cd_tab', FirebirdSql.Data.FirebirdClient.FbDbType.VarChar));
end;

function TDataModule.Conecta: boolean;
begin
  try
    FbCon.Open;
  finally
    Result := (FbCon.State = System.Data.ConnectionState.Open);
  end;
end;

constructor TDataModule.Create;
begin
  inherited Create;
  InitializeComponent;
end;

procedure TDataModule.Desconecta;
begin
  try
    if FbCon.State = System.Data.ConnectionState.Open then
      FbCon.Close;
  except
  end;
end;

{
User=bolao;Password=jl230302;Database=d:/firebird/databases/bolao/bolao.fdb;DataSource=firebird.insidesign.com.br;Port=3050;Dialect=3;Charset=WIN1252;Role=;Connection lifetime=10;Connection timeout=15;Pooling=True;Packet Size=8192;Server Type=0
User=sysdba;Password=masterkey;Database=C:\Inetpub\wwwroot\Bolao2006\Banco\COPADOMUNDO.FDB;DataSource=localhost;Port=3050;Dialect=3;Charset=WIN1252;Role=;Connection lifetime=10;Connection timeout=15;Pooling=True;Packet Size=8192;Server Type=0
}

function TDataModule.Limpa(entrada: string): string;
begin
  entrada := StringReplace(entrada, '''', '', [rfReplaceAll]);
  entrada := StringReplace(entrada, '=', '', [rfReplaceAll]);
  entrada := StringReplace(entrada, '--', '', [rfReplaceAll]);
  entrada := StringReplace(entrada, ';', '', [rfReplaceAll]);
  entrada := StringReplace(entrada, '"', '', [rfReplaceAll]);
  Result := entrada;
end;

function TDataModule.PegaPag: string;
begin
  Result := FbNumPag.ExecuteScalar.ToString;
end;


function TDataModule.PegaSenha(email: string): string;
var
  dr: FbDataReader;

begin
  FbJogadores.SelectCommand.Parameters['@email'].Value := email.ToString;
  dr := FbJogadores.SelectCommand.ExecuteReader;
  if dr.Read then
    Result := dr['SENHA'].ToString
  else
    Result := '';
  dr.Close;
end;

function TDataModule.EMailCadastrado(email: string): boolean;
var
  dr: FbDataReader;

begin
  FbJogadores.SelectCommand.Parameters['@email'].Value := email.ToString;
  dr := FbJogadores.SelectCommand.ExecuteReader;
  if dr.Read then
    Result := (dr['EMAIL'].ToString = email)
  else
    Result := False;
  dr.Close;
end;

function TDataModule.VerificaTabela(CodigoTabela: string): boolean;
var
  dr: FbDataReader;

begin
  FbVerTabela.Parameters['@codtab'].Value := CodigoTabela;
  dr := FbVerTabela.ExecuteReader;
  if dr.Read then
    Result := (dr.GetString(0) = CodigoTabela)
  else
    Result := False;
  dr.Close;
end;

{
	<add key="FbCon1.ConnectionString" value="User=bolao;Password=jl230302;Database=d:/firebird/databases/bolao/bolao.fdb;DataSource=firebird.insidesign.com.br;Port=3050;Dialect=3;Charset=WIN1252;Role=;Connection lifetime=10;Connection timeout=15;Pooling=True;Packet Size=8192;Server Type=0" />
	<add key="FbCon.ConnectionString" value="User=sysdba;Password=masterkey;Database=C:\Inetpub\wwwroot\Bolao2006\Banco\COPADOMUNDO.FDB;DataSource=localhost;Port=3050;Dialect=3;Charset=WIN1252;Role=;Connection lifetime=10;Connection timeout=15;Pooling=True;Packet Size=8192;Server Type=0" />
}

function TDataModule.VerificaUser(email, senha: string; var nome: string;
  var apelido: string): integer;
var
  dr: FbDataReader;

begin
  FbJogadores.SelectCommand.Parameters['@email'].Value := email.ToString;
  dr := FbJogadores.SelectCommand.ExecuteReader;
  if dr.Read then
    if ((dr['EMAIL'].ToString = email) and (dr['SENHA'].ToString = senha)) then
    begin
      Result := dr.GetInt32(0);   // COD_JOGADOR
      nome := dr.GetString(1);
      apelido := dr.GetString(2);
    end
    else
      Result := -1
  else
    Result := -1;
  dr.Close;  
end;

end.

