INSERT INTO FBCategory (SEQ, NAME) VALUES (FBCategorySeq.nextval, '사담');
INSERT INTO FBCategory (SEQ, NAME) VALUES (FBCategorySeq.nextval, '정보');
INSERT INTO FBCategory (SEQ, NAME) VALUES (FBCategorySeq.nextval, '맛집');
INSERT INTO FBCategory (SEQ, NAME) VALUES (FBCategorySeq.nextval, '업무');
INSERT INTO FBCategory (SEQ, NAME) VALUES (FBCategorySeq.nextval, '연애');

commit;

CREATE VIEW vEmployee
AS
  SELECT
    e.seq as empSeq,
    e.NAME as name,
    e.JUMIN as jumin,
    e.CELLPHONE as cellphone,
    e.EMAIL as email,
    e.FIRSTDATE as firstDate,
    e.ENDDATE as endDate,
    e.PAYMENT as payment,
    e.DEPARTMENTSEQ as departmentSeq,
    d.DEPARTMENT as department,
    e.GENDER as gender,
    e.PHONE as phone,
    e.PROFILEPIC as profilePic,
    e.task as task,
    e.POSITIONSEQ as positionSeq,
    p.POSITION as position
  FROM EMPLOYEE e
    INNER JOIN DEPARTMENT d
      ON e.DEPARTMENTSEQ = d.SEQ
        INNER JOIN TBLPOSITION p
          ON e.POSITIONSEQ = p.SEQ;

select * from EMPLOYEE;
select * from DEPARTMENT;
select * from vEmployee;

SELECT * FROM freeboard;
COMMIT;

select * from FBFILE;
DROP TABLE FBfILE;
DROP SEQUENCE FBFileSeq;

CREATE TABLE FBFILE
(
  seq NUMBER PRIMARY KEY,
  fbSeq number NOT NULL REFERENCES FREEBOARD(seq),
  orgFileName VARCHAR2(100) not null,
  fileName VARCHAR2(100) not null
);
CREATE SEQUENCE fbFileSeq;
INSERT INTO freeboard (seq, empSeq, FBCategory, title, content, readCount, regDate, thread, depth) VALUES (freeBoardSeq.nextVal, 10, 1, '열심히합시다', '야근합시다', DEFAULT, DEFAULT, DEFAULT, DEFAULT);

INSERT INTO (seq, FBSeq, orgFileName, fileName) VALUES (FBFileSeq.nextVal, 4, 'test', 'test');


SELECT * FROM FBFILE;
SELECT * FROM FREEBOARD;
SELECT * FROM FBCATEGORY;
select * from EMPLOYEE;

CREATE OR REPLACE VIEW vFreeBoard
AS
SELECT
  fb.seq as seq,
  fb.empSeq as empSeq,
  e.NAME as name,
  fb.FBCATEGORY as fbCategorySeq,
  fbc.NAME as fbCategory,
  fb.TITLE as title,
  fb.CONTENT as content,
  fb.READCOUNT as readCount,
  fb.regDate as regDate,
  fb.thread as THREAD,
  fb.depth as depth
FROM FREEBOARD fb
    INNER JOIN EMPLOYEE e
      ON fb.EMPSEQ = e.SEQ
      INNER JOIN FBCATEGORY fbc
        ON fb.FBCATEGORY = fbc.SEQ;

/*CREATE TRIGGER depthTitle
	BEFORE INSERT OR UPDATE ON FREEBOARD
	DECLARE
		tempTitle VARCHAR2(1000);
	BEGIN
		IF DEPTH = 1 THEN
			tempTitle := TITLE
		END IF;
	END;*/

commit;


select * from vFreeBoard;
select REGDATE, (sysdate - regDate) * 24 from FREEBOARD;

select * from
	(select a.*, rownum as rnum from (select seq, name, subject, readCount, regDate, round((sysdate - regDate) * 24 * 60) as gap, commentCount, filename from tblBoard %s order by seq desc) a) where rnum >= %s and rnum <= %s", where, map.get("start"), map.get("end"));




