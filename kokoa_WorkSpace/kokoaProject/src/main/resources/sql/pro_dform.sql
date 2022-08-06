CREATE TABLE Pro_DForm
(
    PD_No         NUMBER            NOT NULL, 
    PDT_Sep       NUMBER            NOT NULL, 
    PDS_Date      DATE              NOT NULL, 
    PDE_Date      DATE              NOT NULL, 
    PD_Id         VARCHAR2(20)      NOT NULL, 
    PD_Title      VARCHAR2(100)     NOT NULL, 
    PD_Content    VARCHAR2(4000)    NOT NULL, 
    PDT_Img       VARCHAR2(4000)    NOT NULL, 
    PD_Cop        VARCHAR2(100)      NOT NULL, 
     PRIMARY KEY (PD_No)
);

create SEQUENCE dForm_seq INCREMENT by 1 
START WITH 1 MINVALUE 1 MAXVALUE 1000 
cycle nocache;

