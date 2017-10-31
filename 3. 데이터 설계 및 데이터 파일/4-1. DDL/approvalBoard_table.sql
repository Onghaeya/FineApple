-- 결재 카테고리 게시판
create table approvalCategoryBoard(
	seq NUMBER primary key,
	categoryName varchar2(40) not null unique
);

-- 결재 카테고리 게시판 시퀀스
create sequence approvalCategoryBoardSeq nocache;

-- 결재 게시판
create table approvalBoard(
	seq NUMBER primary key,
	appovalCategoryNum number,
	subject varchar2(30) not null,
	regDate date default sysdate not null,
	content VARCHAR2(1000) not null,
	readCount number,
	thread number,
	depth number,
	empNum number not null references employee(seq)
);

-- 결재 게시판 시퀀스
create sequence approvalBoardSeq nocache;

-- 결재 게시판 파일업로드 테이블
create table approvalBoardFile(
	seq number primary key,
	approvalBoardNum number not null references approvalBoard(seq),
	orgName VARCHAR2(100),
	saveName varchar2(100)
);

-- 결재 게시판 파일업로드 시퀀스
create sequence approvalBoardFileSeq nocache;

-- 결재 게시판 댓글 테이블
create table approvalBoardComment(
	seq number primary key,
	empSeq number not null,
	approvalBoardNum number not null references approvalBoard(seq),
	regDate date default sysdate not null,
	content varchar2(400) not null,
	thread number,
	depth number
);

-- 결재 게시판 댓글 시퀀스
create sequence approvalBoardCommentSeq nocache;
