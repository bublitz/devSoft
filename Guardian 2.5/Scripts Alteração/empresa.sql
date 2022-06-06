CONNECT "D:\Projects\Guardian 2.0\Dados\devsoft.GDB"
USER "SYSDBA" PASSWORD "devkey";
      
      /*
      CHANGE REPORT for Table EMPRESA
          - Adding column Lancto
      ACTION is ALTER or modify Table EMPRESA
      */

ALTER TABLE EMPRESA ADD Lancto               DOUBLE PRECISION;

