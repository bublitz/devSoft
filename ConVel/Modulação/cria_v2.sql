
CREATE TABLE TipoReparo (
       CodigoTipoReparo     INTEGER NOT NULL,
       Descricao            VARCHAR(50),
       PRIMARY KEY (CodigoTipoReparo)
);

CREATE UNIQUE INDEX XPKTipoReparo ON TipoReparo
(
       CodigoTipoReparo
);


CREATE TABLE Marca (
       CodigoMarca          INTEGER NOT NULL,
       Descricao            VARCHAR(50) NOT NULL,
       Sigla                VARCHAR(5),
       PRIMARY KEY (CodigoMarca)
);

CREATE UNIQUE INDEX XPKMarca ON Marca
(
       CodigoMarca
);


CREATE TABLE Modelo (
       CodigoModelo         INTEGER NOT NULL,
       CodigoMarca          INTEGER NOT NULL,
       Descricao            VARCHAR(50),
       PRIMARY KEY (CodigoModelo), 
       FOREIGN KEY (CodigoMarca)
                             REFERENCES Marca
);

CREATE UNIQUE INDEX XPKModelo ON Modelo
(
       CodigoModelo
);

CREATE INDEX XIF1Modelo ON Modelo
(
       CodigoMarca
);


CREATE TABLE Veiculo (
       CodigoVeiculo        INTEGER NOT NULL,
       CodigoModelo         INTEGER,
       Descricao            VARCHAR(50),
       Ano                  INTEGER,
       Placa                VARCHAR(8),
       UF                   VARCHAR(2),
       LITROSCARTER         DOUBLE PRECISION,
       LITROSFILTRO         DOUBLE PRECISION,
       ULTIMATROCA          INTEGER,
       PROXIMATROCA         INTEGER,
       TROCACOMFILTRO       VARCHAR(1),
       PRIMARY KEY (CodigoVeiculo), 
       FOREIGN KEY (CodigoModelo)
                             REFERENCES Modelo
);

CREATE UNIQUE INDEX XPKVeiculo ON Veiculo
(
       CodigoVeiculo
);

CREATE INDEX XIF2Veiculo ON Veiculo
(
       CodigoModelo
);


CREATE TABLE Reparo (
       CodigoTipoReparo     INTEGER NOT NULL,
       CodigoVeiculo        INTEGER NOT NULL,
       Data                 DATE NOT NULL,
       Complemento          VARCHAR(300),
       Hodometro            INTEGER,
       ValorMat             DOUBLE PRECISION,
       ValorMao             DOUBLE PRECISION,
       Viagem               VARCHAR(1),
       PRIMARY KEY (CodigoTipoReparo, CodigoVeiculo, Data), 
       FOREIGN KEY (CodigoVeiculo)
                             REFERENCES Veiculo, 
       FOREIGN KEY (CodigoTipoReparo)
                             REFERENCES TipoReparo
);

CREATE UNIQUE INDEX XPKReparo ON Reparo
(
       CodigoTipoReparo,
       CodigoVeiculo,
       Data
);

CREATE INDEX XIF8Reparo ON Reparo
(
       CodigoTipoReparo
);

CREATE INDEX XIF9Reparo ON Reparo
(
       CodigoVeiculo
);


CREATE TABLE TipoManut (
       CodigoTipoManut      INTEGER NOT NULL,
       Descricao            VARCHAR(50),
       OleoLubrificante     VARCHAR(1),
       Valor                DOUBLE PRECISION,
       PRIMARY KEY (CodigoTipoManut)
);

CREATE UNIQUE INDEX XPKTipoManut ON TipoManut
(
       CodigoTipoManut
);


CREATE TABLE Manutencao (
       CodigoVeiculo        INTEGER NOT NULL,
       CodigoTipoManut      INTEGER NOT NULL,
       Data                 DATE NOT NULL,
       Hodometro            INTEGER,
       Litros               INTEGER,
       Valor                DOUBLE PRECISION,
       Viagem               VARCHAR(1),
       PRIMARY KEY (CodigoVeiculo, CodigoTipoManut, Data), 
       FOREIGN KEY (CodigoTipoManut)
                             REFERENCES TipoManut, 
       FOREIGN KEY (CodigoVeiculo)
                             REFERENCES Veiculo
);

CREATE UNIQUE INDEX XPKManutencao ON Manutencao
(
       CodigoVeiculo,
       CodigoTipoManut,
       Data
);

CREATE INDEX XIF6Manutencao ON Manutencao
(
       CodigoVeiculo
);

CREATE INDEX XIF7Manutencao ON Manutencao
(
       CodigoTipoManut
);


CREATE TABLE TipoAbast (
       CodigoTipoAbast      INTEGER NOT NULL,
       Descricao            VARCHAR(50),
       Valor                DOUBLE PRECISION,
       PRIMARY KEY (CodigoTipoAbast)
);

CREATE UNIQUE INDEX XPKTipoAbast ON TipoAbast
(
       CodigoTipoAbast
);


CREATE TABLE Abastecimento (
       CodigoVeiculo        INTEGER NOT NULL,
       CodigoTipoAbast      INTEGER NOT NULL,
       Data                 DATE NOT NULL,
       Litros               INTEGER,
       Viagem               VARCHAR(1),
       PRIMARY KEY (CodigoVeiculo, CodigoTipoAbast, Data), 
       FOREIGN KEY (CodigoTipoAbast)
                             REFERENCES TipoAbast, 
       FOREIGN KEY (CodigoVeiculo)
                             REFERENCES Veiculo
);

CREATE UNIQUE INDEX XPKAbastecimento ON Abastecimento
(
       CodigoVeiculo,
       CodigoTipoAbast,
       Data
);

CREATE INDEX XIF4Abastecimento ON Abastecimento
(
       CodigoVeiculo
);

CREATE INDEX XIF5Abastecimento ON Abastecimento
(
       CodigoTipoAbast
);


CREATE TABLE Quilometragem (
       CodigoVeiculo        INTEGER NOT NULL,
       Data                 DATE NOT NULL,
       Inicio               INTEGER,
       Final                INTEGER,
       Viagem               VARCHAR(1),
       PRIMARY KEY (CodigoVeiculo, Data), 
       FOREIGN KEY (CodigoVeiculo)
                             REFERENCES Veiculo
);

CREATE UNIQUE INDEX XPKQuilometragem ON Quilometragem
(
       CodigoVeiculo,
       Data
);

CREATE INDEX XIF3Quilometragem ON Quilometragem
(
       CodigoVeiculo
);

CREATE TABLE Seguro (
       CodigoSeguro         INTEGER NOT NULL,
       Seguradora           VARCHAR(50),
       Contato              VARCHAR(35),
       Telefone             VARCHAR(15),
       DataInicio           DATE,
       DataTermino          DATE,
       Observacao           VARCHAR(300),
       PRIMARY KEY (CodigoSeguro)
);

CREATE UNIQUE INDEX XPKSeguro ON Seguro
(
       CodigoSeguro
);

CREATE TABLE VeiculoSeguro (
       CodigoSeguro         INTEGER NOT NULL,
       CodigoVeiculo        INTEGER NOT NULL,
       PRIMARY KEY (CodigoSeguro, CodigoVeiculo), 
       FOREIGN KEY (CodigoSeguro)
                             REFERENCES Seguro, 
       FOREIGN KEY (CodigoVeiculo)
                             REFERENCES Veiculo
);

CREATE UNIQUE INDEX XPKVeiculoSeguro ON VeiculoSeguro
(
       CodigoSeguro,
       CodigoVeiculo
);

CREATE INDEX XIF6VeiculoSeguro ON VeiculoSeguro
(
       CodigoSeguro
);

CREATE INDEX XIF7VeiculoSeguro ON VeiculoSeguro
(
       CodigoVeiculo
);


CREATE GENERATOR GEN_CODSEGURO;
SET GENERATOR GEN_CODSEGURO TO 10;

CREATE GENERATOR GEN_CODMARCA;
SET GENERATOR GEN_CODMARCA TO 10;

CREATE GENERATOR GEN_CODMODELO;
SET GENERATOR GEN_CODMODELO TO 10;

CREATE GENERATOR GEN_CODVEICULO;
SET GENERATOR GEN_CODVEICULO TO 10;

CREATE GENERATOR GEN_CODREPARO;
SET GENERATOR GEN_CODREPARO TO 10;

CREATE GENERATOR GEN_CODABAST;
SET GENERATOR GEN_CODABAST TO 10;

CREATE GENERATOR GEN_CODMANUT;
SET GENERATOR GEN_CODMANUT TO 11;

INSERT INTO TIPOMANUT
(CODIGOTIPOMANUT, DESCRICAO, VALOR, OLEOLUBRIFICANTE)
VALUES
(11, 'ÓLEO MOTOR', 0, 'S');
