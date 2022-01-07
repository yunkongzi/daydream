
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


-- 리뷰 테이블 생성
create table tbl_review(
	bno	number primary key, --글번호
	user_id	varchar2(25) references tbl_member(user_id), -- 작성자아이디
	title	varchar2(300) not null, -- 글제목
	content	varchar2(1000) not null, -- 글내용
	regdate	timestamp(6), -- 작성일
	viewcnt	number default 0, -- 조회수
	class_no number -- 클래스 코드
);

-- 글번호 자동생성을 위한 시퀀스
create sequence seq_bno;


-- 첨부파일 테이블
create table tbl_attach(
    fullname varchar2(150) not null,  -- 첨부파일 이름
    bno number not null, -- 글번호
    regdate date default sysdate, -- 작성일
    primary key(fullname)
);

-- bno 외래키 설정
alter table tbl_attach add constraint
fk_review_attch foreign key(bno) 
references tbl_review(bno);


-- tbl_review 테이블의 bno 컬럼을 위한 시퀀스 생성
create sequence seq_review start with 1
increment by 1;
