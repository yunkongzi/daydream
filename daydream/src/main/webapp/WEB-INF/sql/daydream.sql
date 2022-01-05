
--강사 테이블 생성
create table tbl_teacher(
  user_id char(4) references tbl_member(user_id),
  user_name varchar2(15)references tbl_member(user_id),
  tno char(5) not null,  --강사번호
  gender char(1) default 'M' check(gender in('M', 'F')), --강사성별
  user_phone char(15) not null, 
  address varchar2(50) not null,
  joindate timestamp default sysdate,
  content varchar2(3000)
);
commit;

--예약 테이블 생성
create table tbl_reservation(
    user_id varchar2(10) references tbl_member(user_id),
    user_name varchar2(5) not null,
    user_phone varchar2(15) not null,
    class_name varchar2(30) not null,
    res_time timestamp default null,
    res_date timestamp default null
);

