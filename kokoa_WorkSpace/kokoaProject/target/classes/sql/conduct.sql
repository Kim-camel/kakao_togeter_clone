CREATE TABLE Conduct
(
    CO_No         NUMBER            NOT NULL, 
    CO_Title      VARCHAR2(100)     NOT NULL, 
    CO_Content    VARCHAR2(4000)    NOT NULL, 
    CO_Img       VARCHAR2(4000)    NOT NULL, 
    CO_Cop        VARCHAR2(100)      NOT NULL, 
    CO_Sep        NUMBER NOT NULL,
     PRIMARY KEY (CO_No)
);

create SEQUENCE Conduct_seq INCREMENT by 1 
START WITH 1 MINVALUE 1 MAXVALUE 1000 
cycle nocache;
