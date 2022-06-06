ALTER TABLE Reparo ADD Viagem VARCHAR(1);
ALTER TABLE Abastecimento ADD Viagem VARCHAR(1);
ALTER TABLE Manutencao ADD Viagem VARCHAR(1);
ALTER TABLE Quilometragem ADD Viagem VARCHAR(1);

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
