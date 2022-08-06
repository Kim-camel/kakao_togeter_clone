create table totaldonation(
bno int,
totalDonationMoney int default 0,
constraint totaldonation_bno_fk foreign key(bno) references donation(d_no) on delete cascade
);