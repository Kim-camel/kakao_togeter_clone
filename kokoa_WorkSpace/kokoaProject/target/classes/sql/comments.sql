create table comments(
cno number primary key,
bno number not null,
writer varchar2(20) not null,
commentDate date,
content varchar2(4000),
cnt number default 0,
heartTotal int default 0,
money varchar2(3000) default 0,
constraint comments_bno_fk foreign key(bno) references donation(d_no) on delete cascade,
constraint comments_id_fk foreign key(writer) references user_info(u_id) on delete cascade
);
alter session set nls_date_format = 'yyyy/MM/dd hh24:mi:ss';

create sequence comment_seq;
