CONNECT "D:\Projects\Guardian 2.0\Dados\devsoft.GDB"
USER "SYSDBA" PASSWORD "devkey";
      
      /*
      CHANGE REPORT for Table EMPRESA
          - Adding column Host
          - Adding column Port
          - Adding column UserName
          - Adding column Senha
      ACTION is ALTER or modify Table EMPRESA
      */

ALTER TABLE EMPRESA ADD Host               VARCHAR(20);
ALTER TABLE EMPRESA ADD PORT               VARCHAR(10);
ALTER TABLE EMPRESA ADD USERNAME           VARCHAR(20);
ALTER TABLE EMPRESA ADD SENHA              VARCHAR(10);


