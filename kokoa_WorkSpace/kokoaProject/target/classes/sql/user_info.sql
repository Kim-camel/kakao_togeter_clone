CREATE TABLE User_Info
(
    U_Id      VARCHAR2(20)      NOT NULL, 
    U_Pwd     VARCHAR2(200)      NOT NULL,
    U_Name    VARCHAR2(20)      NOT NULL, 
    U_NickName    VARCHAR2(20)      , 
    U_Mail    VARCHAR2(40)      NOT NULL, 
    U_Img     VARCHAR2(4000)          NULL, 
    U_PostAddr    VARCHAR2(200)     NOT NULL,
    U_RoadAddr    VARCHAR2(200)     NOT NULL,
    U_DetailAddr    VARCHAR2(200)     NOT NULL, 
    U_Gen        NUMBER            NOT NULL, 
    U_Tel            VARCHAR2(30)            NOT NULL, 
    U_Birth       VARCHAR2(30)        NOT NULL,
    Session_id    varchar2(200)    null,
    limit_time        date     null,
     PRIMARY KEY (U_Id)
);