CONNECT "D:\Projects\ADME4\Dados\Adme.GDB"
USER "SYSDBA" PASSWORD "devkey";


ALTER TABLE PRODUTO
	ADD DESCRICAO1 VARCHAR(100);

UPDATE  PRODUTO
	SET DESCRICAO1 = DESCRICAO;

ALTER TABLE PRODUTO
	DROP DESCRICAO;


ALTER TABLE PRODUTO
	ADD DESCRICAO VARCHAR(100);

UPDATE  PRODUTO
	SET DESCRICAO = DESCRICAO1;

ALTER TABLE PRODUTO
	DROP DESCRICAO1;
