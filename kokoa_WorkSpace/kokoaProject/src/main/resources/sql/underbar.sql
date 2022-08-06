create table underbar(
bno int,
cno int,
ubwriter varchar2(20),
ubdprice int default 0,
ubshare int default 0,
ubdirect int default 0,
ubheart int default 0,
ubdno int,
constraint underbar_bno_fk foreign key(bno) references donation(d_no) on delete cascade,
constraint underbar_id_fk foreign key(ubwriter) references user_info(u_id) on delete cascade
);
create sequence ubdno_seq;
