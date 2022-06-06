
CREATE TABLE Log (
       Matricula            INTEGER NOT NULL,
       Data                 DATE NOT NULL,
       Hora                 TIME NOT NULL,
       Descricao            VARCHAR(50),
       PRIMARY KEY (Matricula, Data, Hora), 
       FOREIGN KEY (Matricula)
                             REFERENCES Usuario
);

CREATE UNIQUE INDEX XPKLog ON Log
(
       Matricula,
       Data,
       Hora
);

CREATE INDEX XIF33Log ON Log
(
       Matricula
);
