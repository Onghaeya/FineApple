-- 결재 카테고리 테이블
create table approvalCategory(
	seq number primary key,
	approvalCategoryName varchar2(150) not null
);

-- 결재 카테고리 시퀀스
create sequence approvalCategorySeq nocache;

-- 결재 순서 테이블
create table approvalProcedure(
	seq number primary key,
	approvalCategoryNum number not null references approvalCategory(seq),
	positionNum number references tblPosition(seq),
	approvalProcedureNum number not null
);

-- 결재 순서 시퀀스
create sequence approvalProcedureSeq nocache;

-- 결재(기안서 작성) 테이블
create table approval(
	seq number primary key,
	employeeNum number not null references employee(seq),
	approvalCategoryNum number not null references approvalCategory(seq),
	approvalContent varchar2(1000) not null,
	approvalCategoryBoard date default sysdate not null
);

-- 결재(기안서 작성) 시퀀스
create sequence approvalSeq nocache;

-- 결재 승인 내역 테이블
create table approvalConfirm(
	seq number primary key,
	approvalNum number not null references approval(seq),
	employeeNum number not null references employee(seq),
	approvalProcedureNum number not null references approvalProcedure(seq),
	approvalCheck VARCHAR2(10),
	considerationContent varchar2(1000),
	approvalDate date
);

-- 결재 승인 내역 시퀀스
create sequence approvalConfirmSeq nocache;