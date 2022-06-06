
CREATE TABLE Cliente (
       CodigoLoja           INTEGER NOT NULL,
       CodigoCliente        INTEGER NOT NULL,
       NomeCompleto         VARCHAR(50),
       NickName             VARCHAR(20),
       Endereco             VARCHAR(50),
       Bairro               VARCHAR(25),
       Cidade               VARCHAR(35),
       UF                   VARCHAR(2),
       CEP                  VARCHAR(8),
       CPF                  VARCHAR(11),
       RG                   VARCHAR(15),
       DataNascto           DATE,
       DataCadastro         DATE,
       Fone1                VARCHAR(20),
       Fone2                VARCHAR(20),
       Indicacao            INTEGER,
       Quant_Indicacao      INTEGER,
       e_mail               VARCHAR(50),
       RecebePromocao       VARCHAR(1),
       RecebeMilhagem       VARCHAR(1),
       CodigoInterno        VARCHAR(50),
       NomeMae              VARCHAR(50),
       NomeLogin            VARCHAR(20),
       SenhaLogin           VARCHAR(20),
       LimiteDias           INTEGER,
       LimiteValor          DOUBLE PRECISION,
       HorasAntecip         DOUBLE PRECISION,
       ValidadeAntecip      DATE,
       HorasMilhagem        DOUBLE PRECISION,
       ValidadeMilhagem     DATE,
       Bonus                DOUBLE PRECISION,
       ValidadeBonus        DATE,
       Saldo                DOUBLE PRECISION,
       PRIMARY KEY (CodigoLoja, CodigoCliente)
);

CREATE UNIQUE INDEX XPKCliente ON Cliente
(
       CodigoLoja,
       CodigoCliente
);


CREATE TABLE LogCliente (
       CodigoLoja           INTEGER NOT NULL,
       CodigoCliente        INTEGER NOT NULL,
       Data                 DATE NOT NULL,
       Acao                 INTEGER NOT NULL,
       Controle             INTEGER NOT NULL,
       Quantidade           DOUBLE PRECISION,
       Validade             DATE,
       PRIMARY KEY (Controle, CodigoLoja, CodigoCliente, Data, Acao), 
       FOREIGN KEY (CodigoLoja, CodigoCliente)
                             REFERENCES Cliente
);

CREATE UNIQUE INDEX XPKLogCliente ON LogCliente
(
       Controle,
       CodigoLoja,
       CodigoCliente,
       Data,
       Acao
);

CREATE INDEX XIF36LogCliente ON LogCliente
(
       CodigoLoja,
       CodigoCliente
);


CREATE TABLE Troca (
       CodigoLoja           INTEGER NOT NULL,
       CodigoCliente        INTEGER NOT NULL,
       Data                 DATE NOT NULL,
       CodigoMilhagem       INTEGER NOT NULL,
       Observacao           VARCHAR(50),
       PRIMARY KEY (CodigoLoja, CodigoCliente, Data, CodigoMilhagem), 
       FOREIGN KEY (CodigoLoja, CodigoCliente)
                             REFERENCES Cliente
);

CREATE UNIQUE INDEX XPKTroca ON Troca
(
       CodigoLoja,
       CodigoCliente,
       Data,
       CodigoMilhagem
);

CREATE INDEX XIF35Troca ON Troca
(
       CodigoLoja,
       CodigoCliente
);


CREATE TABLE AcumuloMilhagem (
       CodigoLoja           INTEGER NOT NULL,
       CodigoCliente        INTEGER NOT NULL,
       Data                 DATE NOT NULL,
       Horas                DOUBLE PRECISION,
       PRIMARY KEY (CodigoLoja, CodigoCliente, Data), 
       FOREIGN KEY (CodigoLoja, CodigoCliente)
                             REFERENCES Cliente
);

CREATE UNIQUE INDEX XPKAcumuloMilhagem ON AcumuloMilhagem
(
       CodigoLoja,
       CodigoCliente,
       Data
);

CREATE INDEX XIF34AcumuloMilhagem ON AcumuloMilhagem
(
       CodigoLoja,
       CodigoCliente
);


CREATE TABLE Feriado (
       Descricao            VARCHAR(50) NOT NULL,
       Dia                  INTEGER,
       Mes                  INTEGER,
       PRIMARY KEY (Descricao)
);

CREATE UNIQUE INDEX XPKFeriado ON Feriado
(
       Descricao
);


CREATE TABLE Grupo (
       CodigoGrupo          INTEGER NOT NULL,
       Descricao            VARCHAR(50),
       PRIMARY KEY (CodigoGrupo)
);

CREATE UNIQUE INDEX XPKGrupo ON Grupo
(
       CodigoGrupo
);


CREATE TABLE Produto (
       CodigoProduto        INTEGER NOT NULL,
       CodigoGrupo          INTEGER,
       Descricao            VARCHAR(50),
       Unidade              VARCHAR(2),
       CodigoInterno        VARCHAR(50),
       DataCadastro         DATE,
       DataUltimaCompra     DATE,
       DataUltimaVenda      DATE,
       ValorCusto           DOUBLE PRECISION,
       ValorVenda           DOUBLE PRECISION,
       EstoqueFisico        INTEGER,
       EstoqueMinimo        INTEGER,
       PRIMARY KEY (CodigoProduto), 
       FOREIGN KEY (CodigoGrupo)
                             REFERENCES Grupo
);

CREATE UNIQUE INDEX XPKProduto ON Produto
(
       CodigoProduto
);

CREATE INDEX XIF20Produto ON Produto
(
       CodigoGrupo
);


CREATE TABLE Regiao (
       CodigoRegiao         INTEGER NOT NULL,
       Descricao            VARCHAR(50),
       Responsavel          VARCHAR(50),
       PRIMARY KEY (CodigoRegiao)
);

CREATE UNIQUE INDEX XPKRegiao ON Regiao
(
       CodigoRegiao
);


CREATE TABLE Loja (
       CodigoLoja           INTEGER NOT NULL,
       RazaoSocial          VARCHAR(50),
       CodigoRegiao         INTEGER,
       NomeFantasia         VARCHAR(50),
       Endereco             VARCHAR(50),
       Bairro               VARCHAR(50),
       Cidade               VARCHAR(50),
       UF                   VARCHAR(2),
       CEP                  VARCHAR(8),
       Fone1                VARCHAR(20),
       Fone2                VARCHAR(20),
       CNPJ                 VARCHAR(18),
       e_mail               VARCHAR(50),
       PRIMARY KEY (CodigoLoja), 
       FOREIGN KEY (CodigoRegiao)
                             REFERENCES Regiao
);

CREATE UNIQUE INDEX XPKLoja ON Loja
(
       CodigoLoja
);

CREATE INDEX XIF33Loja ON Loja
(
       CodigoRegiao
);


CREATE TABLE ContaCliente (
       CodigoLoja           INTEGER NOT NULL,
       NumeroFatura         INTEGER NOT NULL,
       CodigoCliente        INTEGER NOT NULL,
       Data                 DATE NOT NULL,
       Valor                DOUBLE PRECISION,
       PRIMARY KEY (CodigoLoja, NumeroFatura), 
       FOREIGN KEY (CodigoLoja)
                             REFERENCES Loja
);

CREATE UNIQUE INDEX XPKContaCliente ON ContaCliente
(
       CodigoLoja,
       NumeroFatura
);

CREATE INDEX XIF14ContaCliente ON ContaCliente
(
       CodigoLoja
);


CREATE TABLE ItemContaCliente (
       CodigoLoja           INTEGER NOT NULL,
       NumeroFatura         INTEGER NOT NULL,
       CodigoProduto        INTEGER NOT NULL,
       Quantidade           INTEGER,
       ValorUnitario        DOUBLE PRECISION,
       PRIMARY KEY (CodigoLoja, NumeroFatura, CodigoProduto), 
       FOREIGN KEY (CodigoProduto)
                             REFERENCES Produto, 
       FOREIGN KEY (CodigoLoja, NumeroFatura)
                             REFERENCES ContaCliente
);

CREATE UNIQUE INDEX XPKItemContaCliente ON ItemContaCliente
(
       CodigoLoja,
       NumeroFatura,
       CodigoProduto
);

CREATE INDEX XIF12ItemContaCliente ON ItemContaCliente
(
       NumeroFatura,
       CodigoLoja
);

CREATE INDEX XIF13ItemContaCliente ON ItemContaCliente
(
       CodigoProduto
);


CREATE TABLE Promocao (
       CodigoPromocao       INTEGER NOT NULL,
       Descricao            VARCHAR(50),
       DataInicial          DATE,
       DataFinal            DATE,
       Bonus                INTEGER,
       PanfletoInicial      INTEGER,
       PanfletoFinal        INTEGER,
       PRIMARY KEY (CodigoPromocao)
);

CREATE UNIQUE INDEX XPKPromocao ON Promocao
(
       CodigoPromocao
);


CREATE TABLE Panfleto (
       CodigoPromocao       INTEGER NOT NULL,
       NumeroPanfleto       INTEGER NOT NULL,
       Utilizado            VARCHAR(50),
       PRIMARY KEY (CodigoPromocao, NumeroPanfleto), 
       FOREIGN KEY (CodigoPromocao)
                             REFERENCES Promocao
);

CREATE UNIQUE INDEX XPKPanfleto ON Panfleto
(
       CodigoPromocao,
       NumeroPanfleto
);

CREATE INDEX XIF9Panfleto ON Panfleto
(
       CodigoPromocao
);


CREATE TABLE Params (
       CodigoLoja           INTEGER NOT NULL,
       ValidadeSenha        INTEGER,
       TempoCortesia        INTEGER,
       SenhaLibera          VARCHAR(20),
       LinhasRecibo         INTEGER,
       BonusIndicacao       INTEGER,
       QuantIndicacao       INTEGER,
       ValidadeBonus        INTEGER,
       ValidadeMilhagem     INTEGER,
       PrazoMaximoMilhagem  INTEGER,
       TempoWait            INTEGER,
       e_host               VARCHAR(50),
       e_conta              VARCHAR(50),
       e_port               INTEGER,
       e_name               VARCHAR(50),
       e_pass               VARCHAR(50),
       PRIMARY KEY (CodigoLoja), 
       FOREIGN KEY (CodigoLoja)
                             REFERENCES Loja
);

CREATE UNIQUE INDEX XPKParams ON Params
(
       CodigoLoja
);


CREATE TABLE Banco (
       CodigoBanco          INTEGER NOT NULL,
       Nome                 VARCHAR(50),
       PRIMARY KEY (CodigoBanco)
);

CREATE UNIQUE INDEX XPKBanco ON Banco
(
       CodigoBanco
);


CREATE TABLE Agencia (
       CodigoBanco          INTEGER NOT NULL,
       NumeroAgencia        VARCHAR(10) NOT NULL,
       Nome                 VARCHAR(50),
       PRIMARY KEY (CodigoBanco, NumeroAgencia), 
       FOREIGN KEY (CodigoBanco)
                             REFERENCES Banco
);

CREATE UNIQUE INDEX XPKAgencia ON Agencia
(
       CodigoBanco,
       NumeroAgencia
);

CREATE INDEX XIF24Agencia ON Agencia
(
       CodigoBanco
);


CREATE TABLE Conta (
       CodigoConta          INTEGER NOT NULL,
       CodigoBanco          INTEGER,
       NumeroAgencia        VARCHAR(10),
       NumeroConta          VARCHAR(20),
       Saldo                DOUBLE PRECISION,
       PRIMARY KEY (CodigoConta), 
       FOREIGN KEY (CodigoBanco, NumeroAgencia)
                             REFERENCES Agencia
);

CREATE UNIQUE INDEX XPKConta ON Conta
(
       CodigoConta
);

CREATE INDEX XIF28Conta ON Conta
(
       CodigoBanco,
       NumeroAgencia
);


CREATE TABLE Saldo (
       CodigoConta          INTEGER NOT NULL,
       Data                 DATE NOT NULL,
       Saldo                DOUBLE PRECISION,
       PRIMARY KEY (CodigoConta, Data), 
       FOREIGN KEY (CodigoConta)
                             REFERENCES Conta
);

CREATE UNIQUE INDEX XPKSaldo ON Saldo
(
       CodigoConta,
       Data
);

CREATE INDEX XIF27Saldo ON Saldo
(
       CodigoConta
);


CREATE TABLE Usuario (
       CodigoLoja           INTEGER NOT NULL,
       CodigoUsuario        INTEGER NOT NULL,
       NomeCompleto         VARCHAR(50),
       NomeLogin            VARCHAR(20),
       Senha                VARCHAR(20),
       Direitos             VARCHAR(50),
       Cortesia             INTEGER,
       DesctoMaximo         DOUBLE PRECISION,
       DataAlteraSenha      DATE,
       PRIMARY KEY (CodigoLoja, CodigoUsuario), 
       FOREIGN KEY (CodigoLoja)
                             REFERENCES Loja
);

CREATE UNIQUE INDEX XPKUsuario ON Usuario
(
       CodigoLoja,
       CodigoUsuario
);

CREATE INDEX XIF2Usuario ON Usuario
(
       CodigoLoja
);


CREATE TABLE Caixa (
       ControleCaixa        INTEGER NOT NULL,
       DataAbertura         DATE,
       HoraAbertura         TIME,
       SaldoAbertura        DOUBLE PRECISION,
       DataFechamento       DATE,
       HoraFechamento       TIME,
       SaldoFechamento      DOUBLE PRECISION,
       PRIMARY KEY (ControleCaixa)
);

CREATE UNIQUE INDEX XPKCaixa ON Caixa
(
       ControleCaixa
);


CREATE TABLE LanctoCaixa (
       NumeroLancto         INTEGER NOT NULL,
       ControleCaixa        INTEGER,
       CodigoLoja           INTEGER,
       CodigoUsuario        INTEGER,
       TipoLancto           VARCHAR(1),
       Historico            VARCHAR(50),
       Entrada              DOUBLE PRECISION,
       Saida                DOUBLE PRECISION,
       Saldo                DOUBLE PRECISION,
       PRIMARY KEY (NumeroLancto), 
       FOREIGN KEY (CodigoLoja, CodigoUsuario)
                             REFERENCES Usuario, 
       FOREIGN KEY (ControleCaixa)
                             REFERENCES Caixa
);

CREATE UNIQUE INDEX XPKLanctoCaixa ON LanctoCaixa
(
       NumeroLancto
);

CREATE INDEX XIF31LanctoCaixa ON LanctoCaixa
(
       ControleCaixa
);

CREATE INDEX XIF32LanctoCaixa ON LanctoCaixa
(
       CodigoLoja,
       CodigoUsuario
);


CREATE TABLE Historico (
       CodigoHistorico      INTEGER NOT NULL,
       Descricao            VARCHAR(50),
       PRIMARY KEY (CodigoHistorico)
);

CREATE UNIQUE INDEX XPKHistorico ON Historico
(
       CodigoHistorico
);


CREATE TABLE LanctoBanco (
       NumeroLancto         INTEGER NOT NULL,
       CodigoConta          INTEGER,
       CodigoHistorico      INTEGER,
       Data                 DATE,
       Tipo                 VARCHAR(1),
       Valor                DOUBLE PRECISION,
       Complemento          VARCHAR(50),
       PRIMARY KEY (NumeroLancto), 
       FOREIGN KEY (CodigoConta)
                             REFERENCES Conta, 
       FOREIGN KEY (CodigoHistorico)
                             REFERENCES Historico
);

CREATE UNIQUE INDEX XPKLanctoBanco ON LanctoBanco
(
       NumeroLancto
);

CREATE INDEX XIF29LanctoBanco ON LanctoBanco
(
       CodigoHistorico
);

CREATE INDEX XIF30LanctoBanco ON LanctoBanco
(
       CodigoConta
);


CREATE TABLE Fornecedor (
       CodigoFornecedor     INTEGER NOT NULL,
       RazaoSocial          VARCHAR(50),
       Endereco             VARCHAR(50),
       Bairro               VARCHAR(25),
       Cidade               VARCHAR(35),
       UF                   VARCHAR(2),
       CEP                  VARCHAR(8),
       Fone1                VARCHAR(20),
       Fone2                VARCHAR(20),
       Contato              VARCHAR(30),
       PRIMARY KEY (CodigoFornecedor)
);

CREATE UNIQUE INDEX XPKFornecedor ON Fornecedor
(
       CodigoFornecedor
);


CREATE TABLE ContaPagar (
       CodigoDuplicata      INTEGER NOT NULL,
       CodigoFornecedor     INTEGER,
       NumeroFatura         VARCHAR(2),
       DataEmissao          DATE,
       DataVencto           DATE,
       Valor                DOUBLE PRECISION,
       DataPagto            DATE,
       ValorPagto           DOUBLE PRECISION,
       PRIMARY KEY (CodigoDuplicata), 
       FOREIGN KEY (CodigoFornecedor)
                             REFERENCES Fornecedor
);

CREATE UNIQUE INDEX XPKContaPagar ON ContaPagar
(
       CodigoDuplicata
);

CREATE INDEX XIF23ContaPagar ON ContaPagar
(
       CodigoFornecedor
);


CREATE TABLE MovimentoProduto (
       Controle             INTEGER NOT NULL,
       CodigoProduto        INTEGER NOT NULL,
       Data                 DATE NOT NULL,
       Tipo                 VARCHAR(1),
       QuantAnterior        INTEGER,
       QuantMovimento       INTEGER,
       PRIMARY KEY (Controle, CodigoProduto, Data), 
       FOREIGN KEY (CodigoProduto)
                             REFERENCES Produto
);

CREATE UNIQUE INDEX XPKMovimentoProduto ON MovimentoProduto
(
       Controle,
       CodigoProduto,
       Data
);

CREATE INDEX XIF22MovimentoProduto ON MovimentoProduto
(
       CodigoProduto
);


CREATE TABLE ListaEspera (
       Sequencia            INTEGER NOT NULL,
       CodigoCliente        INTEGER NOT NULL,
       PRIMARY KEY (Sequencia, CodigoCliente)
);

CREATE UNIQUE INDEX XPKListaEspera ON ListaEspera
(
       Sequencia,
       CodigoCliente
);


CREATE TABLE ValorHoras (
       DiaSemana            INTEGER NOT NULL,
       Socio15              DOUBLE PRECISION,
       Socio30              DOUBLE PRECISION,
       Socio60              DOUBLE PRECISION,
       PRIMARY KEY (DiaSemana)
);

CREATE UNIQUE INDEX XPKValorHoras ON ValorHoras
(
       DiaSemana
);


CREATE TABLE Milhagem (
       CodigoMilhagem       INTEGER NOT NULL,
       Descricao            VARCHAR(50),
       Horas                DOUBLE PRECISION,
       Creditos             DOUBLE PRECISION,
       Validade             INTEGER,
       PRIMARY KEY (CodigoMilhagem)
);

CREATE UNIQUE INDEX XPKMilhagem ON Milhagem
(
       CodigoMilhagem
);


CREATE TABLE HoraAntecipada (
       CodigoHoraAntecip    INTEGER NOT NULL,
       Descricao            VARCHAR(50),
       HorasAdquiridas      DOUBLE PRECISION,
       Validade             INTEGER,
       PRIMARY KEY (CodigoHoraAntecip)
);

CREATE UNIQUE INDEX XPKHoraAntecipada ON HoraAntecipada
(
       CodigoHoraAntecip
);


CREATE TABLE ContaReceber (
       CodigoLoja           INTEGER NOT NULL,
       NumeroDuplicata      INTEGER NOT NULL,
       CodigoCliente        INTEGER,
       DataEmissao          DATE,
       DataVencto           DATE,
       Valor                DOUBLE PRECISION,
       DataPagto            DATE,
       ValorPagto           DOUBLE PRECISION,
       PRIMARY KEY (CodigoLoja, NumeroDuplicata), 
       FOREIGN KEY (CodigoLoja)
                             REFERENCES Loja
);

CREATE UNIQUE INDEX XPKContaReceber ON ContaReceber
(
       CodigoLoja,
       NumeroDuplicata
);

CREATE INDEX XIF15ContaReceber ON ContaReceber
(
       CodigoLoja
);


CREATE TABLE Log (
       CodigoLoja           INTEGER NOT NULL,
       CodigoUsuario        INTEGER NOT NULL,
       Data                 DATE NOT NULL,
       Hora                 TIME NOT NULL,
       Descricao            VARCHAR(100),
       PRIMARY KEY (CodigoLoja, CodigoUsuario, Data, Hora), 
       FOREIGN KEY (CodigoLoja, CodigoUsuario)
                             REFERENCES Usuario
);

CREATE UNIQUE INDEX XPKLog ON Log
(
       CodigoLoja,
       CodigoUsuario,
       Data,
       Hora
);

CREATE INDEX XIF3Log ON Log
(
       CodigoLoja,
       CodigoUsuario
);


CREATE TABLE Movimento (
       CodigoLoja           INTEGER NOT NULL,
       CodigoEstacao        INTEGER NOT NULL,
       CodigoCliente        INTEGER NOT NULL,
       Data                 DATE NOT NULL,
       Hora                 TIME NOT NULL,
       ValorUnitario        DOUBLE PRECISION,
       Horas                DOUBLE PRECISION,
       Tipo                 VARCHAR(1),
       TempoEstimado        DOUBLE PRECISION,
       PRIMARY KEY (CodigoLoja, CodigoEstacao, CodigoCliente, Data, 
              Hora), 
       FOREIGN KEY (CodigoLoja)
                             REFERENCES Loja
);

CREATE UNIQUE INDEX XPKMovimento ON Movimento
(
       CodigoLoja,
       CodigoEstacao,
       CodigoCliente,
       Data,
       Hora
);

CREATE INDEX XIF10Movimento ON Movimento
(
       CodigoLoja
);


CREATE TABLE Estacao (
       CodigoLoja           INTEGER NOT NULL,
       CodigoEstacao        INTEGER NOT NULL,
       Descricao            VARCHAR(50),
       NetName              VARCHAR(50),
       IP                   VARCHAR(50),
       Estado               VARCHAR(1),
       PRIMARY KEY (CodigoLoja, CodigoEstacao), 
       FOREIGN KEY (CodigoLoja)
                             REFERENCES Loja
);

CREATE UNIQUE INDEX XPKEstacao ON Estacao
(
       CodigoLoja,
       CodigoEstacao
);

CREATE INDEX XIF11Estacao ON Estacao
(
       CodigoLoja
);


CREATE TABLE ItemContaReceber (
       CodigoLoja           INTEGER NOT NULL,
       NumeroDuplicata      INTEGER NOT NULL,
       CodigoProduto        INTEGER NOT NULL,
       Quantidade           INTEGER,
       ValorUnitario        DOUBLE PRECISION,
       PRIMARY KEY (CodigoLoja, NumeroDuplicata, CodigoProduto), 
       FOREIGN KEY (CodigoProduto)
                             REFERENCES Produto, 
       FOREIGN KEY (CodigoLoja, NumeroDuplicata)
                             REFERENCES ContaReceber
);

CREATE UNIQUE INDEX XPKItemContaReceber ON ItemContaReceber
(
       CodigoLoja,
       NumeroDuplicata,
       CodigoProduto
);

CREATE INDEX XIF17ItemContaReceber ON ItemContaReceber
(
       CodigoLoja,
       NumeroDuplicata
);

CREATE INDEX XIF19ItemContaReceber ON ItemContaReceber
(
       CodigoProduto
);


CREATE TABLE Automacao_E_Mail (
       CodigoAutomacao      INTEGER NOT NULL,
       Descricao            VARCHAR(50),
       DiaMesEnvio          INTEGER,
       DiaSemanaEnvio       INTEGER,
       DataNascimento       VARCHAR(1),
       DataCadastro         VARCHAR(1),
       Mensagem             VARCHAR(500),
       Arquivo1             VARCHAR(50),
       Arquivo2             VARCHAR(50),
       Arquivo3             VARCHAR(50),
       Arquivo4             VARCHAR(50),
       Arquivo5             VARCHAR(50),
       PRIMARY KEY (CodigoAutomacao)
);

CREATE UNIQUE INDEX XPKAutomacao_E_Mail ON Automacao_E_Mail
(
       CodigoAutomacao
);



