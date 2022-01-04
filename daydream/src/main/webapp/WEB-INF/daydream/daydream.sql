--강사 등록 폼 생성
create table tbl_teacher(
  tno char(4) not null,  --강사번호
  class_name varchar2(30), --강의명
  price char(10) not null, --금액
  personnel char(10) not null, --인원
  target varchar2(20) not null, --참가대상
  introduce varchar2(3000)  --자기소개
);


insert into tbl_teacher(tno, class_name, price, personnel, target, introduce)
values('1001', '우드카빙', '3만원', '8명', '성인', '안녕하세요. 우드카빙 강사입니다.');

insert into tbl_teacher(tno, class_name, price, personnel, target, introduce)
values('1002', '홈브로잉', '5만원', '5명', '성인', '안녕하세요. 홈브로잉 강사입니다.');

insert into tbl_teacher(tno, class_name, price, personnel, target, introduce)
values('1003', '꼼지락공방', '4만원', '10명', '유아+성인', '안녕하세요. 꼼지락공방 강사입니다.');

select * from tbl_teacher;

commit;

