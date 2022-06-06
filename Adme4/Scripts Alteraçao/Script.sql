CONNECT "D:\Projects\ADME4\Dados\Adme.GDB"
USER "SYSDBA" PASSWORD "devkey";
      
      /*
      CHANGE REPORT for Table CLIENTE
          - Adding column AnoNascimento
          - Adding column DataCadastro
          - Adding column DiaMes
      ACTION is ALTER or modify Table CLIENTE
      */

ALTER TABLE CLIENTE ADD AnoNascimento        VARCHAR(4);


ALTER TABLE CLIENTE ADD DataCadastro         DATE;


ALTER TABLE CLIENTE ADD DiaMes               VARCHAR(5);

      
      /*
      CHANGE REPORT for Table FORNECEDOR
          - Adding column FoneFree
          - Adding column Site
      ACTION is ALTER or modify Table FORNECEDOR
      */

ALTER TABLE FORNECEDOR ADD FoneFree             VARCHAR(25);


ALTER TABLE FORNECEDOR ADD Site                 VARCHAR(60);

      
      /*
      CHANGE REPORT for Table PRODUTO
          - Adding column Grama
          - Adding column MaoObra
          - Adding column Indice
      ACTION is ALTER or modify Table PRODUTO
      */

ALTER TABLE PRODUTO ADD Grama                DOUBLE PRECISION;


ALTER TABLE PRODUTO ADD MaoObra              DOUBLE PRECISION;


ALTER TABLE PRODUTO ADD Indice               DOUBLE PRECISION;

