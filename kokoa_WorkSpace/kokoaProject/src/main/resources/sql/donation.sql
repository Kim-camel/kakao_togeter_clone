CREATE TABLE Donation
(
    D_No         NUMBER            NOT NULL, 
    D_Sep        NUMBER            NOT NULL, 
    DS_Date      DATE              NOT NULL, 
    DE_Date      DATE              NOT NULL, 
    D_Title      VARCHAR2(100)     NOT NULL, 
    D_Content    VARCHAR2(4000)    NOT NULL, 
    D_Cop        VARCHAR2(100)      NOT NULL, 
    DT_Img       VARCHAR2(4000)    NOT NULL, 
    TD_Target    VARCHAR2(100)     NOT NULL,
     PRIMARY KEY (D_No)
);
create SEQUENCE donation_seq INCREMENT by 1 
START WITH 1 MINVALUE 1 MAXVALUE 1000 
cycle nocache;
