-- 부서테이블 생성
create table DEPARTMENT
(
	SEQ NUMBER primary key ,
	DEPARTMENT VARCHAR2(50) not null,
	PHONE VARCHAR2(20) not null,
	FAX VARCHAR2(20) not null,
	ROOM VARCHAR2(50) not null
);

-- 부서테이블 시퀀스


select * from DEPARTMENT;