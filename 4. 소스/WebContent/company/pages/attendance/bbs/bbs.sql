
--게시판 글 작성을 위한 sequence 객체 Create
CREATE SEQUENCE atdBoardSeq;

--게시글 더미데이터 Insert
INSERT INTO ATDBOARD (SEQ, ESEQ, CSEQ, SUBJECT, CONTENT, THREAD, DEPTH) VALUES (atdBoardSeq.nextval, 10, 1, '공지사항', '내용', 0, 0);
INSERT INTO ATDBOARD (SEQ, ESEQ, CSEQ, SUBJECT, CONTENT, THREAD, DEPTH) VALUES (atdBoardSeq.nextval, 10, 2, '일반', '내용', 0, 0);
INSERT INTO ATDBOARD (SEQ, ESEQ, CSEQ, SUBJECT, CONTENT, THREAD, DEPTH) VALUES (atdBoardSeq.nextval, 10, 3, '질문', '내용', 0, 0);
INSERT INTO ATDBOARD (SEQ, ESEQ, CSEQ, SUBJECT, CONTENT, THREAD, DEPTH) VALUES (atdBoardSeq.nextval, 10, 4, '건의', '내용', 0, 0);

--게시판 메인 List 를 위한 뷰 Create
CREATE VIEW atdMainList AS
SELECT c.NAME AS category, SUBJECT, e.NAME, to_char(REGDATE, 'yyyy-mm-dd hh:mi') as regDate, READCOUNT FROM ATDBOARD b
	INNER JOIN ATDBCATEGORY c ON b.CSEQ = c.SEQ
	INNER JOIN EMPLOYEE e ON b.ESEQ = e.SEQ;














--테스트
SELECT category, subject, name, regDate, readCount from atdMainList;

commit;


SELECT * FROM ATDBCATEGORY;





commit;

SELECT * from EMPLOYEE;


















