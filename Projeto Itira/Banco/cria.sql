
CREATE TABLE AdmCartao (
       CodigoAdmCartao      INTEGER NOT NULL,
       Descricao            VARCHAR(50) NOT NULL,
       Percentual           NUMERIC(9,2),
       Contato              VARCHAR(25),
       Telefone             VARCHAR(25)
);

CREATE UNIQUE INDEX XPKAdmCartao ON AdmCartao
(
       CodigoAdmCartao
);

CREATE UNIQUE INDEX XAK1AdmCartao ON AdmCartao
(
       Descricao
);

CREATE UNIQUE INDEX XAK2AdmCartao ON AdmCartao
(
       Descricao
);

CREATE INDEX XIE1AdmCartao ON AdmCartao
(
       Descricao
);


ALTER TABLE AdmCartao
       ADD PRIMARY KEY (CodigoAdmCartao);


CREATE TABLE Banco (
       CodigoBanco          INTEGER NOT NULL,
       Conta                VARCHAR(15) NOT NULL,
       Banco                VARCHAR(25) NOT NULL,
       Agencia              NUMERIC NOT NULL,
       Obs                  VARCHAR(25),
       Saldo                NUMERIC(9,2),
       DataAbertura         DATE,
       SaldoInicial         NUMERIC(9,2)
);

CREATE UNIQUE INDEX XPKBanco ON Banco
(
       CodigoBanco
);

CREATE INDEX XIE1Banco ON Banco
(
       Banco
);


ALTER TABLE Banco
       ADD PRIMARY KEY (CodigoBanco);


CREATE TABLE Caixa (
       NumeroLancamento     INTEGER NOT NULL,
       ContaContabil        INTEGER,
       CodigoBanco          INTEGER NOT NULL,
       Data                 DATE,
       Tipo                 VARCHAR(1),
       Documento            VARCHAR(25),
       Historico            VARCHAR(25),
       Valor                NUMERIC(9,2),
       Saldo                NUMERIC(9,2)
);

CREATE UNIQUE INDEX XPKCaixa ON Caixa
(
       NumeroLancamento,
       CodigoBanco
);

CREATE INDEX XIE1Caixa ON Caixa
(
       Data
);


ALTER TABLE Caixa
       ADD PRIMARY KEY (NumeroLancamento, CodigoBanco);


CREATE TABLE ChequesEmitidos (
       Numero               INTEGER NOT NULL,
       ContaContabil        INTEGER,
       Favorecido           VARCHAR(25),
       DataEmissao          DATE,
       DataVencto           DATE,
       Valor                NUMERIC(9,2),
       Historico            VARCHAR(25),
       Emitido              VARCHAR(1)
);

CREATE UNIQUE INDEX XPKChequesEmitidos ON ChequesEmitidos
(
       Numero
);

CREATE UNIQUE INDEX XAK1ChequesEmitidos ON ChequesEmitidos
(
       DataVencto
);


ALTER TABLE ChequesEmitidos
       ADD PRIMARY KEY (Numero);


CREATE TABLE ChequesRecebidos (
       CodigoCliente        NUMERIC(9,2) NOT NULL,
       Numero               INTEGER NOT NULL,
       Banco                INTEGER NOT NULL,
       ContaContabil        INTEGER,
       DataEmissao          DATE,
       DataVencto           DATE,
       Valor                NUMERIC(9,2),
       Historico            VARCHAR(25)
);

CREATE UNIQUE INDEX XPKChequesRecebidos ON ChequesRecebidos
(
       CodigoCliente,
       Banco,
       Numero
);

CREATE UNIQUE INDEX XAK1ChequesRecebidos ON ChequesRecebidos
(
       DataVencto
);


ALTER TABLE ChequesRecebidos
       ADD PRIMARY KEY (CodigoCliente, Banco, Numero);


CREATE TABLE Cliente (
       CodigoCliente        INTEGER NOT NULL,
       Nome                 VARCHAR(50),
       Tipo                 INTEGER,
       Ocupacao             INTEGER,
       Cpf                  VARCHAR(14) NOT NULL,
       Rg                   VARCHAR(25),
       DataNascimento       DATE,
       Sexo                 VARCHAR(1),
       Endereco             VARCHAR(50),
       Bairro               VARCHAR(25),
       Cep                  VARCHAR(25),
       Cidade               VARCHAR(25),
       Uf                   VARCHAR(2),
       Fone                 VARCHAR(25),
       Contato              VARCHAR(25),
       Fax                  VARCHAR(25),
       Celular              VARCHAR(25),
       email                VARCHAR(25)
);

CREATE UNIQUE INDEX XPKCliente ON Cliente
(
       CodigoCliente
);

CREATE INDEX XIE1Cliente ON Cliente
(
       Nome
);


ALTER TABLE Cliente
       ADD PRIMARY KEY (CodigoCliente);


CREATE TABLE ConfBoleto (
       CodigoBanco          INTEGER NOT NULL,
       Linha1               VARCHAR(25),
       Linha2               VARCHAR(25),
       Linha3               VARCHAR(25)
);

CREATE UNIQUE INDEX XPKConfBoleto ON ConfBoleto
(
       CodigoBanco
);


ALTER TABLE ConfBoleto
       ADD PRIMARY KEY (CodigoBanco);


CREATE TABLE ConfCheque (
       CodigoBanco          INTEGER NOT NULL,
       Linha1               VARCHAR(25),
       Linha2               VARCHAR(25),
       Linha3               VARCHAR(25)
);

CREATE UNIQUE INDEX XPKConfCheque ON ConfCheque
(
       CodigoBanco
);


ALTER TABLE ConfCheque
       ADD PRIMARY KEY (CodigoBanco);


CREATE TABLE ConfNF (
       CodigoEmpresa        INTEGER NOT NULL,
       Linha1               VARCHAR(25),
       Linha2               VARCHAR(25),
       Linha3               VARCHAR(25)
);

CREATE UNIQUE INDEX XPKConfNF ON ConfNF
(
       CodigoEmpresa
);


ALTER TABLE ConfNF
       ADD PRIMARY KEY (CodigoEmpresa);


CREATE TABLE Contas_Pagar (
       CodigoPagar          INTEGER NOT NULL,
       CodigoFornecedor     INTEGER,
       CodigoFormaPagamento INTEGER,
       Documento            VARCHAR(25),
       DataEmissao          DATE,
       DataVencto           DATE,
       Valor                NUMERIC(9,2),
       ContaContabil        INTEGER,
       Historico            VARCHAR(25),
       DataBaixa            DATE,
       TipoDescto           VARCHAR(1),
       Desconto             NUMERIC(9,2),
       TipoJuros            VARCHAR(1),
       Juros                NUMERIC(9,2),
       ValorPago            NUMERIC(9,2)
);

CREATE UNIQUE INDEX XPKContas_Pagar ON Contas_Pagar
(
       CodigoPagar
);

CREATE UNIQUE INDEX XAK1Contas_Pagar ON Contas_Pagar
(
       CodigoFornecedor
);

CREATE UNIQUE INDEX XAK2Contas_Pagar ON Contas_Pagar
(
       DataVencto
);


ALTER TABLE Contas_Pagar
       ADD PRIMARY KEY (CodigoPagar);


CREATE TABLE ContasReceber (
       Codigo               INTEGER NOT NULL,
       CodigoCliente        INTEGER,
       DataEmissao          DATE,
       DataVencto           DATE,
       Valor                NUMERIC,
       ContaContabil        INTEGER,
       Historico            VARCHAR(25),
       CodigoFormaRecebimneto INTEGER,
       DataBaixa            DATE,
       TipoDescto           VARCHAR(1),
       Desconto             NUMERIC(9,2),
       TipoJuros            VARCHAR(1),
       Juros                NUMERIC(9,2),
       ValorPago            NUMERIC(9,2)
);

CREATE UNIQUE INDEX XPKContasReceber ON ContasReceber
(
       Codigo
);

CREATE UNIQUE INDEX XAK1ContasReceber ON ContasReceber
(
       CodigoCliente
);

CREATE UNIQUE INDEX XAK2ContasReceber ON ContasReceber
(
       DataVencto
);


ALTER TABLE ContasReceber
       ADD PRIMARY KEY (Codigo);


CREATE TABLE Empresa (
       CodigoEmpresa        INTEGER NOT NULL,
       Nome                 VARCHAR(50) NOT NULL,
       Endereco             VARCHAR(50) NOT NULL,
       Bairro               VARCHAR(25),
       Cidade               VARCHAR(25),
       Cep                  VARCHAR(10),
       Uf                   VARCHAR(2),
       Fone                 VARCHAR(25),
       Fax                  VARCHAR(25),
       Cnpj                 VARCHAR(25) NOT NULL,
       IE                   VARCHAR(25),
       email                VARCHAR(25)
);

CREATE UNIQUE INDEX XPKEmpresa ON Empresa
(
       CodigoEmpresa
);


ALTER TABLE Empresa
       ADD PRIMARY KEY (CodigoEmpresa);


CREATE TABLE Feriado (
       Descricao            VARCHAR(25) NOT NULL,
       Dia                  INTEGER NOT NULL,
       Mes                  INTEGER NOT NULL
);

CREATE UNIQUE INDEX XPKFeriado ON Feriado
(
       Descricao
);


ALTER TABLE Feriado
       ADD PRIMARY KEY (Descricao);


CREATE TABLE FormaPagamento (
       CodigoFornecedor     INTEGER NOT NULL,
       CodigoFormaPagamento INTEGER NOT NULL,
       Descricao            VARCHAR(50),
       Percentual           NUMERIC(6,3),
       VistaParceladoCartao VARCHAR(1),
       CodigoAdmCartao      INTEGER,
       Parcelas             INTEGER,
       Intervalo            INTEGER,
       PrimeiroVencto       INTEGER
);

CREATE UNIQUE INDEX XPKFormaPagamento ON FormaPagamento
(
       CodigoFornecedor,
       CodigoFormaPagamento
);

CREATE INDEX XIE1FormaPagamento ON FormaPagamento
(
       Descricao
);


ALTER TABLE FormaPagamento
       ADD PRIMARY KEY (CodigoFornecedor, CodigoFormaPagamento);


CREATE TABLE FormaRecebimento (
       CodigoFormaRecebimento INTEGER NOT NULL,
       Descricao            VARCHAR(50),
       Percentual           NUMERIC(9,2),
       VistaParcelado       VARCHAR(1),
       Parcelas             INTEGER,
       Intervalo            INTEGER,
       PrimeiroVencto       INTEGER
);

CREATE UNIQUE INDEX XPKFormaRecebimento ON FormaRecebimento
(
       CodigoFormaRecebimento
);

CREATE INDEX XIE1FormaRecebimento ON FormaRecebimento
(
       Descricao
);


ALTER TABLE FormaRecebimento
       ADD PRIMARY KEY (CodigoFormaRecebimento);


CREATE TABLE Fornecedor (
       CodigoFornecedor     INTEGER NOT NULL,
       Nome                 VARCHAR(50),
       Tipo                 VARCHAR(1),
       Ocupacao             VARCHAR(35),
       Cnpj                 VARCHAR(25) NOT NULL,
       IE                   VARCHAR(25),
       DataCadastro         DATE,
       Endereco             VARCHAR(50),
       Bairro               VARCHAR(25),
       Cep                  VARCHAR(10),
       Cidade               VARCHAR(25),
       Uf                   VARCHAR(2),
       Fone                 VARCHAR(25),
       Contato              VARCHAR(25),
       Fax                  VARCHAR(25),
       Celular              VARCHAR(25),
       email                VARCHAR(25)
);

CREATE UNIQUE INDEX XPKFornecedor ON Fornecedor
(
       CodigoFornecedor
);

CREATE INDEX XIE1Fornecedor ON Fornecedor
(
       Nome
);


ALTER TABLE Fornecedor
       ADD PRIMARY KEY (CodigoFornecedor);


CREATE TABLE FornecProduto (
       CodigoProduto        INTEGER NOT NULL,
       CodigoFornecedor     INTEGER NOT NULL
);

CREATE UNIQUE INDEX XPKFornecProduto ON FornecProduto
(
       CodigoProduto,
       CodigoFornecedor
);


ALTER TABLE FornecProduto
       ADD PRIMARY KEY (CodigoProduto, CodigoFornecedor);


CREATE TABLE Grupo (
       CodigoGrupo          INTEGER NOT NULL,
       Descricao            VARCHAR(50) NOT NULL,
       Tipo                 CHAR(1),
       Comissao             NUMERIC(6,2)
);

CREATE UNIQUE INDEX XPKGrupo ON Grupo
(
       CodigoGrupo
);

CREATE INDEX XIE1Grupo ON Grupo
(
       Descricao
);


ALTER TABLE Grupo
       ADD PRIMARY KEY (CodigoGrupo);


CREATE TABLE ItensNfCompra (
       NumeroNFCompra       INTEGER NOT NULL,
       CodigoProduto        INTEGER NOT NULL,
       Quantidade           INTEGER,
       Valor                NUMERIC(9,2)
);

CREATE UNIQUE INDEX XPKItensNfCompra ON ItensNfCompra
(
       NumeroNFCompra,
       CodigoProduto
);


ALTER TABLE ItensNfCompra
       ADD PRIMARY KEY (NumeroNFCompra, CodigoProduto);


CREATE TABLE ItensNfVenda (
       NumeroNFVenda        NUMERIC(9,2) NOT NULL,
       CodigoProduto        INTEGER NOT NULL,
       Quantidade           INTEGER,
       Valor                NUMERIC(9,2)
);

CREATE UNIQUE INDEX XPKItensNfVenda ON ItensNfVenda
(
       NumeroNFVenda,
       CodigoProduto
);


ALTER TABLE ItensNfVenda
       ADD PRIMARY KEY (NumeroNFVenda, CodigoProduto);


CREATE TABLE ItensPedidoCompra (
       NumeroPedido         INTEGER NOT NULL,
       CodigoProduto        INTEGER NOT NULL,
       Quantidade           NUMERIC(9,2),
       ValorUnitario        NUMERIC(9,2)
);

CREATE UNIQUE INDEX XPKItensPedidoCompra ON ItensPedidoCompra
(
       NumeroPedido,
       CodigoProduto
);


ALTER TABLE ItensPedidoCompra
       ADD PRIMARY KEY (NumeroPedido, CodigoProduto);


CREATE TABLE ItensPedidoVenda (
       NumeroPedido         INTEGER NOT NULL,
       CodigoProduto        INTEGER NOT NULL,
       Quantidade           INTEGER
);

CREATE UNIQUE INDEX XPKItensPedidoVenda ON ItensPedidoVenda
(
       NumeroPedido,
       CodigoProduto
);


ALTER TABLE ItensPedidoVenda
       ADD PRIMARY KEY (NumeroPedido, CodigoProduto);


CREATE TABLE Moeda (
       CodigoMoeda          INTEGER NOT NULL,
       Descricao            VARCHAR(50) NOT NULL,
       Valor                NUMERIC(9,2)
);

CREATE UNIQUE INDEX XPKMoeda ON Moeda
(
       CodigoMoeda
);

CREATE INDEX XIE1Moeda ON Moeda
(
       Descricao
);


ALTER TABLE Moeda
       ADD PRIMARY KEY (CodigoMoeda);


CREATE TABLE Movimentacao (
       NumeroLancto         INTEGER NOT NULL,
       CodigoBanco          INTEGER,
       Data                 DATE,
       Tipo                 VARCHAR(1),
       Historico            VARCHAR(25),
       Valor                NUMERIC(9,2),
       Docto                VARCHAR(25)
);

CREATE UNIQUE INDEX XPKMovimentacao ON Movimentacao
(
       NumeroLancto
);


ALTER TABLE Movimentacao
       ADD PRIMARY KEY (NumeroLancto);


CREATE TABLE NFCompra (
       NumeroNFCompra       INTEGER NOT NULL,
       NumeroPedido         INTEGER,
       CodigoFornecedor     INTEGER,
       CodigoFormaPagamento INTEGER,
       DataNF               DATE
);

CREATE UNIQUE INDEX XPKNFCompra ON NFCompra
(
       NumeroNFCompra
);


ALTER TABLE NFCompra
       ADD PRIMARY KEY (NumeroNFCompra);


CREATE TABLE NFVenda (
       NumeroNFVenda        INTEGER NOT NULL,
       CodigoCliente        INTEGER,
       CodigoFormaRecebimento INTEGER,
       NumeroPedido         INTEGER,
       DataNF               DATE
);

CREATE UNIQUE INDEX XPKNFVenda ON NFVenda
(
       NumeroNFVenda
);


ALTER TABLE NFVenda
       ADD PRIMARY KEY (NumeroNFVenda);


CREATE TABLE Parametro (
       CodigoEmpresa        INTEGER NOT NULL,
       DiasOrcam            INTEGER,
       DiasSenha            INTEGER,
       TipoVencto           VARCHAR(1)
);

CREATE UNIQUE INDEX XPKParametro ON Parametro
(
       CodigoEmpresa
);


ALTER TABLE Parametro
       ADD PRIMARY KEY (CodigoEmpresa);


CREATE TABLE PedidoCompra (
       NumeroPedido         INTEGER NOT NULL,
       CodigoFormaPagamento INTEGER,
       CodigoFornecedor     INTEGER,
       NumeroControle       VARCHAR(25),
       DataPedido           DATE,
       DataEntrega          DATE
);

CREATE UNIQUE INDEX XPKPedidoCompra ON PedidoCompra
(
       NumeroPedido
);


ALTER TABLE PedidoCompra
       ADD PRIMARY KEY (NumeroPedido);


CREATE TABLE PedidoVenda (
       NumeroPedido         INTEGER NOT NULL,
       CodigoCliente        INTEGER,
       CodigoVendedor       INTEGER,
       CodigoFormaRecebimento INTEGER,
       DataPedido           DATE,
       DataVencto           DATE
);

CREATE UNIQUE INDEX XPKPedidoVenda ON PedidoVenda
(
       NumeroPedido
);


ALTER TABLE PedidoVenda
       ADD PRIMARY KEY (NumeroPedido);


CREATE TABLE PlanoDeContas (
       Codigo               INTEGER NOT NULL,
       Descricao            VARCHAR(50) NOT NULL,
       Tipo                 VARCHAR(1) NOT NULL
);

CREATE UNIQUE INDEX XPKPlanoDeContas ON PlanoDeContas
(
       Codigo
);

CREATE INDEX XIE1PlanoDeContas ON PlanoDeContas
(
       Descricao
);


ALTER TABLE PlanoDeContas
       ADD PRIMARY KEY (Codigo);


CREATE TABLE Produto (
       CodigoProduto        INTEGER NOT NULL,
       Descricao            VARCHAR(50) NOT NULL,
       CodigoGrupo          INTEGER NOT NULL,
       CodigoSubGrupo       INTEGER NOT NULL,
       CodigoBarra          VARCHAR(25),
       DescricaoDetalhada   VARCHAR(250),
       Foto                 BLOB,
       CodigoMoeda          INTEGER NOT NULL,
       PrecoCusto           NUMERIC(9,2),
       PrecoVenda           NUMERIC(9,2),
       EstoqueFisico        INTEGER,
       EstoqueMinimo        INTEGER,
       EstoqueCritico       INTEGER,
       Unidade              VARCHAR(2) NOT NULL,
       Comissao             NUMERIC(9,2),
       Observacao           VARCHAR(50)
);

CREATE UNIQUE INDEX XPKProduto ON Produto
(
       CodigoProduto
);

CREATE UNIQUE INDEX XAK1Produto ON Produto
(
       CodigoBarra
);

CREATE INDEX XIE1Produto ON Produto
(
       Descricao
);


ALTER TABLE Produto
       ADD PRIMARY KEY (CodigoProduto);


CREATE TABLE SubGrupo (
       CodigoSubGrupo       INTEGER NOT NULL,
       Descricao            VARCHAR(50) NOT NULL,
       Formula              VARCHAR(25)
);

CREATE UNIQUE INDEX XPKSubGrupo ON SubGrupo
(
       CodigoSubGrupo
);

CREATE INDEX XIE1SubGrupo ON SubGrupo
(
       Descricao
);


ALTER TABLE SubGrupo
       ADD PRIMARY KEY (CodigoSubGrupo);


CREATE TABLE Usuario (
       CodigoEmpresa        INTEGER NOT NULL,
       Matricula            VARCHAR(25) NOT NULL,
       Nome                 VARCHAR(50) NOT NULL,
       UserName             VARCHAR(25) NOT NULL,
       Senha                VARCHAR(25) NOT NULL,
       Direitos             VARCHAR(25) NOT NULL
);

CREATE UNIQUE INDEX XPKUsuario ON Usuario
(
       CodigoEmpresa,
       Matricula
);

CREATE INDEX XIE1Usuario ON Usuario
(
       Nome
);


ALTER TABLE Usuario
       ADD PRIMARY KEY (CodigoEmpresa, Matricula);


CREATE TABLE Vendedor (
       Codigo               INTEGER NOT NULL,
       Nome                 VARCHAR(50) NOT NULL,
       Endereco             VARCHAR(50),
       Apelido              VARCHAR(25),
       Bairro               VARCHAR(25) NOT NULL,
       Cidade               VARCHAR(25) NOT NULL,
       Cep                  VARCHAR(10),
       Uf                   VARCHAR(2),
       Fone                 VARCHAR(25),
       Celular              VARCHAR(25) NOT NULL,
       Cpf                  VARCHAR(11) NOT NULL,
       Rg                   VARCHAR(25),
       email                VARCHAR(25),
       Tipo                 VARCHAR(1) NOT NULL,
       Comissao             NUMERIC(9,2) NOT NULL,
       DescontoMaximo       NUMERIC(9,2) NOT NULL
);

CREATE UNIQUE INDEX XPKVendedor ON Vendedor
(
       Codigo
);

CREATE INDEX XIE1Vendedor ON Vendedor
(
       Apelido
);


ALTER TABLE Vendedor
       ADD PRIMARY KEY (Codigo);


ALTER TABLE Caixa
       ADD FOREIGN KEY (CodigoBanco)
                             REFERENCES Banco;


ALTER TABLE Caixa
       ADD FOREIGN KEY (ContaContabil)
                             REFERENCES PlanoDeContas;


ALTER TABLE ChequesEmitidos
       ADD FOREIGN KEY (ContaContabil)
                             REFERENCES PlanoDeContas;


ALTER TABLE ChequesRecebidos
       ADD FOREIGN KEY (CodigoCliente)
                             REFERENCES Cliente;


ALTER TABLE ChequesRecebidos
       ADD FOREIGN KEY (ContaContabil)
                             REFERENCES PlanoDeContas;


ALTER TABLE ConfBoleto
       ADD FOREIGN KEY (CodigoBanco)
                             REFERENCES Banco;


ALTER TABLE ConfCheque
       ADD FOREIGN KEY (CodigoBanco)
                             REFERENCES Banco;


ALTER TABLE ConfNF
       ADD FOREIGN KEY (CodigoEmpresa)
                             REFERENCES Empresa;


ALTER TABLE Contas_Pagar
       ADD FOREIGN KEY (ContaContabil)
                             REFERENCES PlanoDeContas;


ALTER TABLE Contas_Pagar
       ADD FOREIGN KEY (CodigoFornecedor, CodigoFormaPagamento)
                             REFERENCES FormaPagamento;


ALTER TABLE ContasReceber
       ADD FOREIGN KEY (ContaContabil)
                             REFERENCES PlanoDeContas;


ALTER TABLE ContasReceber
       ADD FOREIGN KEY (CodigoFormaRecebimneto)
                             REFERENCES FormaRecebimento;


ALTER TABLE ContasReceber
       ADD FOREIGN KEY (CodigoCliente)
                             REFERENCES Cliente;


ALTER TABLE FormaPagamento
       ADD FOREIGN KEY (CodigoFornecedor)
                             REFERENCES Fornecedor;


ALTER TABLE FormaPagamento
       ADD FOREIGN KEY (CodigoAdmCartao)
                             REFERENCES AdmCartao;


ALTER TABLE FornecProduto
       ADD FOREIGN KEY (CodigoProduto)
                             REFERENCES Produto;


ALTER TABLE FornecProduto
       ADD FOREIGN KEY (CodigoFornecedor)
                             REFERENCES Fornecedor;


ALTER TABLE ItensNfCompra
       ADD FOREIGN KEY (CodigoProduto)
                             REFERENCES Produto;


ALTER TABLE ItensNfCompra
       ADD FOREIGN KEY (NumeroNFCompra)
                             REFERENCES NFCompra;


ALTER TABLE ItensNfVenda
       ADD FOREIGN KEY (CodigoProduto)
                             REFERENCES Produto;


ALTER TABLE ItensNfVenda
       ADD FOREIGN KEY (NumeroNFVenda)
                             REFERENCES NFVenda;


ALTER TABLE ItensPedidoCompra
       ADD FOREIGN KEY (CodigoProduto)
                             REFERENCES Produto;


ALTER TABLE ItensPedidoCompra
       ADD FOREIGN KEY (NumeroPedido)
                             REFERENCES PedidoCompra;


ALTER TABLE ItensPedidoVenda
       ADD FOREIGN KEY (CodigoProduto)
                             REFERENCES Produto;


ALTER TABLE ItensPedidoVenda
       ADD FOREIGN KEY (NumeroPedido)
                             REFERENCES PedidoVenda;


ALTER TABLE Movimentacao
       ADD FOREIGN KEY (CodigoBanco)
                             REFERENCES Banco;


ALTER TABLE NFCompra
       ADD FOREIGN KEY (CodigoFornecedor, CodigoFormaPagamento)
                             REFERENCES FormaPagamento;


ALTER TABLE NFCompra
       ADD FOREIGN KEY (NumeroPedido)
                             REFERENCES PedidoCompra;


ALTER TABLE NFVenda
       ADD FOREIGN KEY (CodigoCliente)
                             REFERENCES Cliente;


ALTER TABLE NFVenda
       ADD FOREIGN KEY (NumeroPedido)
                             REFERENCES PedidoVenda;


ALTER TABLE NFVenda
       ADD FOREIGN KEY (CodigoFormaRecebimento)
                             REFERENCES FormaRecebimento;


ALTER TABLE Parametro
       ADD FOREIGN KEY (CodigoEmpresa)
                             REFERENCES Empresa;


ALTER TABLE PedidoCompra
       ADD FOREIGN KEY (CodigoFornecedor, CodigoFormaPagamento)
                             REFERENCES FormaPagamento;


ALTER TABLE PedidoVenda
       ADD FOREIGN KEY (CodigoCliente)
                             REFERENCES Cliente;


ALTER TABLE PedidoVenda
       ADD FOREIGN KEY (CodigoFormaRecebimento)
                             REFERENCES FormaRecebimento;


ALTER TABLE PedidoVenda
       ADD FOREIGN KEY (CodigoVendedor)
                             REFERENCES Vendedor;


ALTER TABLE Produto
       ADD FOREIGN KEY (CodigoGrupo)
                             REFERENCES Grupo;


ALTER TABLE Produto
       ADD FOREIGN KEY (CodigoMoeda)
                             REFERENCES Moeda;


ALTER TABLE Produto
       ADD FOREIGN KEY (CodigoSubGrupo)
                             REFERENCES SubGrupo;


ALTER TABLE Usuario
       ADD FOREIGN KEY (CodigoEmpresa)
                             REFERENCES Empresa;



