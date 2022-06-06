
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

CREATE INDEX XIF35LogCliente ON LogCliente
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

CREATE INDEX XIF34Troca ON Troca
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

CREATE INDEX XIF33AcumuloMilhagem ON AcumuloMilhagem
(
       CodigoLoja,
       CodigoCliente
);



