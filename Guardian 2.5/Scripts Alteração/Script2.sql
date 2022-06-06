CONNECT "D:\Projects\Guardian 2.0\Dados\devsoft.GDB"
USER "SYSDBA" PASSWORD "devkey";
                  
      /*
      ACTION is CREATE Table ExpiraTempo
      */

CREATE TABLE ExpiraTempo (
       DHExpira             DATE NOT NULL,
       PRIMARY KEY (DHExpira)
);

CREATE UNIQUE INDEX XPKExpiraTempo ON ExpiraTempo
(
       DHExpira
);



