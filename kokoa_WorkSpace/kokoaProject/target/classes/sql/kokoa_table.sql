create table kakao_table (
   k_number NUMBER GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1),
     CONTENT VARCHAR2(255),
    k_name varchar(20) not null,
    k_email varchar(50) null,
   primary key(k_number)
);
