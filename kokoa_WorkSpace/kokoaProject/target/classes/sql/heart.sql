create table heart(
hno number primary key,
bno number not null,
heart_writer varchar2(20) not null,
heart number default 0,
cno number,
constraint heart_bno_fk foreign key(bno) references donation(d_no) on delete cascade,
constraint heart_idd_fk foreign key(heart_writer) references user_info(u_id) on delete cascade,
constraint heart_cno_fk foreign key(cno) references comments(cno) on delete cascade
);

create sequence heart_seq;
