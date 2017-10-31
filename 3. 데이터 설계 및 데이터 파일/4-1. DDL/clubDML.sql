--------------------------clubDML.sql-----------------------------------------------
INSERT INTO CLUBCATEGORY VALUES (CLUBCATEGORYSEQ.nextval, '스포츠');
INSERT INTO CLUBCATEGORY VALUES (CLUBCATEGORYSEQ.nextval, '레저');
INSERT INTO CLUBCATEGORY VALUES (CLUBCATEGORYSEQ.nextval, '교육');
INSERT INTO CLUBCATEGORY VALUES (CLUBCATEGORYSEQ.nextval, '게임');
INSERT INTO CLUBCATEGORY VALUES (CLUBCATEGORYSEQ.nextval, '문화');

commit;

INSERT INTO CLUB(seq,name,DETAIL,CATEGORYSEQ,EMPSEQ,CLUBIMAGE) VALUES (ClubSEQ.nextval, '축구왕 슛돌이들','주말아침 축구를 하기위한 모임입니다.', 1, 39,'/Project/company/images/football.PNG');
INSERT INTO CLUBMEMBER VALUES (clubmemberseq.nextval, 1, 39, sysdate);
INSERT INTO CLUB(seq,name,DETAIL,CATEGORYSEQ,EMPSEQ,CLUBIMAGE) VALUES (ClubSEQ.nextval, '테니스 왕자와 공주','IT 업계 최고의 테니스 선수가 되기위한 시작!', 1, 43,'/Project/company/images/tenis.PNG');
INSERT INTO CLUBMEMBER VALUES (clubmemberseq.nextval, 2, 43, sysdate);
INSERT INTO CLUB(seq,name,DETAIL,CATEGORYSEQ,EMPSEQ,CLUBIMAGE) VALUES (ClubSEQ.nextval, '홈런왕','야구 노잼 다들 축구하세요', 2, 44,null);
INSERT INTO CLUBMEMBER VALUES (clubmemberseq.nextval, 3, 44, sysdate);
INSERT INTO CLUB(seq,name,DETAIL,CATEGORYSEQ,EMPSEQ,CLUBIMAGE) VALUES (ClubSEQ.nextval, 'PinFineApple','볼링 동호회 입니다. 신입횐님들 환영', 1, 10,'/Project/company/images/balling.PNG');
INSERT INTO CLUBMEMBER VALUES (clubmemberseq.nextval, 4, 10, sysdate);
INSERT INTO CLUB(seq,name,DETAIL,CATEGORYSEQ,EMPSEQ,CLUBIMAGE) VALUES (ClubSEQ.nextval, '세월을 낚자','베스,블루길 강낚시 전문 모임', 2, 39,NULL );
INSERT INTO CLUBMEMBER VALUES (clubmemberseq.nextval, 5, 39, sysdate);
INSERT INTO CLUB(seq,name,DETAIL,CATEGORYSEQ,EMPSEQ,CLUBIMAGE) VALUES (ClubSEQ.nextval, '코딩은 즐거워','알고리즘 공부, 새로운 기술 연구, 여러가지 취미관련 개발', 3, 49,NULL );
INSERT INTO CLUBMEMBER VALUES (clubmemberseq.nextval, 6, 49, sysdate);
INSERT INTO CLUB(seq,name,DETAIL,CATEGORYSEQ,EMPSEQ,CLUBIMAGE) VALUES (ClubSEQ.nextval, 'FineApple of Legends','롤에 미친 사람들', 4, 38,'/Project/company/images/logo2black.png');
INSERT INTO CLUBMEMBER VALUES (clubmemberseq.nextval, 7, 38, sysdate);
INSERT INTO CLUB(seq,name,DETAIL,CATEGORYSEQ,EMPSEQ,CLUBIMAGE) VALUES (ClubSEQ.nextval, 'Club Mania','홍대, 강남, 이태원 등 각종 클럽 or 감성주점 섭렵', 2, 46,NULL );
INSERT INTO CLUBMEMBER VALUES (clubmemberseq.nextval, 8, 46, sysdate);
INSERT INTO CLUB(seq,name,DETAIL,CATEGORYSEQ,EMPSEQ,CLUBIMAGE) VALUES (ClubSEQ.nextval, '찰칵찰칵','남는건 사진이다.', 5, 40,'/Project/company/images/logo1black.PNG');
INSERT INTO CLUBMEMBER VALUES (clubmemberseq.nextval, 9, 40, sysdate);
INSERT INTO CLUB(seq,name,DETAIL,CATEGORYSEQ,EMPSEQ,CLUBIMAGE) VALUES (ClubSEQ.nextval, 'I love Idol','아이돌 콘서트 티켓 같이 예매성공해서 같이 보러가는 모임', 5, 41,NULL );
INSERT INTO CLUBMEMBER VALUES (clubmemberseq.nextval, 10, 41, sysdate);
INSERT INTO CLUB(seq,name,DETAIL,CATEGORYSEQ,EMPSEQ,CLUBIMAGE) VALUES (ClubSEQ.nextval, '시네마천국','영화를 같이 즐겨요', 5, 42,null);
INSERT INTO CLUBMEMBER VALUES (clubmemberseq.nextval, 11, 42, sysdate);

insert INTO CLUBMEMBER VALUES  (CLUBMEMBERSEQ.nextval, 8, 39, sysdate);
SELECT * FROM club;
SELECT * from CLUBCATEGORY;
SELECT * FROM EMPLOYEE;

SELECT * FROM CLUBMEMBER WHERE EMPSEQ=39;
update club set CLUBIMAGE = '/Project/company/images/baseball.jpg' where seq=3;
update club set CLUBIMAGE = '/Project/company/images/fishing.jpg' where seq=5;
update club set CLUBIMAGE = '/Project/company/images/coding.jpg' where seq=6;
update club set CLUBIMAGE = '/Project/company/images/lol.jpg' where seq=7;
update club set CLUBIMAGE = '/Project/company/images/camera.jpg' where seq=9;
UPDATE club SET CLUBIMAGE = '/Project/company/images/logo2black.png' WHERE seq = 7;
UPDATE club SET CLUBIMAGE = '/Project/company/images/logo1black.png' WHERE seq = 9;
UPDATE club SET CLUBIMAGE = '/Project/company/images/arena.jpg' WHERE seq = 8;
commit;

select * from clubboard;
--------------------------------전체 정기모임 리스트 뷰---------------------------------------------
CREATE OR REPLACE VIEW clublistView
  AS
SELECT c.SEQ as seq, c.NAME as name, c.DETAIL as detail, c.openDate as openDate, cc.NAME as categoryName, e.NAME as empName, d.department as department, c.CLUBIMAGE as clubImg FROM DEPARTMENT d
  INNER JOIN EMPLOYEE e on d.SEQ = e.DEPARTMENTSEQ
   INNER JOIN club c on e.SEQ = c.EMPSEQ
    INNER JOIN CLUBCATEGORY cc on c.CATEGORYSEQ = cc.SEQ
  order by seq ASC ;

SELECT * FROM clublistView;


select * FROM EMPLOYEE;
SELECT * FROM DEPARTMENT;

--------사원번호로 모임이름 따오기----------
SELECT c.SEQ as seq, c.NAME as clubname from club c INNER JOIN CLUBMEMBER m ON c.SEQ = m.CLUBSEQ INNER JOIN EMPLOYEE e on c.EMPSEQ = e.SEQ WHERE m.EMPSEQ=39;

SELECT c.NAME as clubname from club c INNER JOIN CLUBMEMBER m ON c.SEQ = m.CLUBSEQ INNER JOIN EMPLOYEE e on c.EMPSEQ = e.SEQ WHERE m.EMPSEQ=39;


----------------------------------------------------
INSERT INTO  () VALUES ();
INSERT INTO CLUBMEMBER VALUES (CLUBMEMBERSEQ.nextval,1,11,sysdate);
INSERT INTO CLUBMEMBER VALUES (CLUBMEMBERSEQ.nextval,1,12,sysdate);
INSERT INTO CLUBMEMBER VALUES (CLUBMEMBERSEQ.nextval,1,13,sysdate);
INSERT INTO CLUBMEMBER VALUES (CLUBMEMBERSEQ.nextval,1,14,sysdate);
INSERT INTO CLUBMEMBER VALUES (CLUBMEMBERSEQ.nextval,1,50,sysdate);
INSERT INTO CLUBMEMBER VALUES (CLUBMEMBERSEQ.nextval,1,60,sysdate);
INSERT INTO CLUBMEMBER VALUES (CLUBMEMBERSEQ.nextval,1,61,sysdate);
INSERT INTO CLUBMEMBER VALUES (CLUBMEMBERSEQ.nextval,1,62,sysdate);
INSERT INTO CLUBMEMBER VALUES (CLUBMEMBERSEQ.nextval,1,10,sysdate);
COMMIT ;

INSERT INTO CLUBBOARD(seq,CATEGORYSEQ,MEMBERSEQ,CLUBSEQ,TITLE,CONTENT) VALUES (CLUBBOARDSEQ.nextval,2,1,1,'안녕하세요','반갑습니다 ㅋㅋ');
INSERT INTO CLUBBOARD(seq,CATEGORYSEQ,MEMBERSEQ,CLUBSEQ,TITLE,CONTENT) VALUES (CLUBBOARDSEQ.nextval,2,20,1,'안녕하세요','반갑습니다 ㅋㅋ');
INSERT INTO CLUBBOARD(seq,CATEGORYSEQ,MEMBERSEQ,CLUBSEQ,TITLE,CONTENT) VALUES (CLUBBOARDSEQ.nextval,2,19,1,'안녕하세요','반갑습니다 ㅋㅋ');
INSERT INTO CLUBBOARD(seq,CATEGORYSEQ,MEMBERSEQ,CLUBSEQ,TITLE,CONTENT) VALUES (CLUBBOARDSEQ.nextval,2,1,1,'zzzz','반갑습니다 ㅋㅋ');
INSERT INTO CLUBBOARD(seq,CATEGORYSEQ,MEMBERSEQ,CLUBSEQ,TITLE,CONTENT) VALUES (CLUBBOARDSEQ.nextval,2,1,1,'sdff하세요','반갑습니다 ㅋㅋ');
INSERT INTO CLUBBOARD(seq,CATEGORYSEQ,MEMBERSEQ,CLUBSEQ,TITLE,CONTENT) VALUES (CLUBBOARDSEQ.nextval,2,1,1,'g333하세요','반갑습니다 ㅋㅋ');
INSERT INTO CLUBBOARD(seq,CATEGORYSEQ,MEMBERSEQ,CLUBSEQ,TITLE,CONTENT) VALUES (CLUBBOARDSEQ.nextval,1,1,1,'1444하세요','반갑습니다 ㅋㅋ');
INSERT INTO CLUBBOARD(seq,CATEGORYSEQ,MEMBERSEQ,CLUBSEQ,TITLE,CONTENT) VALUES (CLUBBOARDSEQ.nextval,1,1,5,'1444하세요','반갑습니다 ㅋㅋ');
INSERT INTO CLUBBOARDFILES VALUES (CLUBBOARDFILESSEQ.nextval,1,'football.png','football.png');
SELECT * from CLUBBOARDFILES;
commit;
select * FROM CLUBBOARD;


--게시판 모임별로 뽑아주기.---
SELECT * from CLUB;
SELECT * FROM EMPLOYEE;
SELECT * FROM CLUBMEMBER;

INSERT INTO CLUBBOARDCATEGORY VALUES (CLUBBOARDCATEGORYSEQ.nextval, '공지');
INSERT INTO CLUBBOARDCATEGORY VALUES (CLUBBOARDCATEGORYSEQ.nextval, '일반글');
SELECT rownum as rnum, a.* FROM (SELECT cb.SEQ, cb.TITLE as title, cb.CONTENT as content, e.NAME as name, cb.REGDATE as regdate, cb.READCOUNT, round((sysdate-cb.REGDATE)*24*60) as gap  from CLUBBOARDCATEGORY cbc INNER JOIN CLUBBOARD cb on cbc.SEQ = cb.CATEGORYSEQ INNER JOIN CLUBMEMBER cm ON cb.MEMBERSEQ = cm.SEQ INNER JOIN club c ON cb.CLUBSEQ = c.SEQ INNER JOIN employee e on cm.EMPSEQ = e.SEQ  WHERE cb.CLUBSEQ=1 order BY cb.SEQ ASC) a ORDER BY rnum ASC ;

select * from (select a.*, rownum as rnum from
  (select seq, name, subject, readCount, regDate, round((sysdate - regDate) * 24 * 60) as gap, commentCount, filename
   from tblBoard %s order by seq desc) a)
where rnum >= %s and rnum <= %s", where, map.get("start"), map.get("end"))

----------------------------------모임게시ㅏ판 뷰----------------------------------------
CREATE OR REPLACE VIEW clubBoardView
  AS
SELECT c.seq as realseq, e.NAME as name, c.CONTENT as content, c.TITLE as title, c.regdate as regdate, c.readcount as readcount, d.DEPARTMENT as department, p.POSITION as position FROM clubBoard c INNER JOIN CLUBMEMBER cm on c.MEMBERSEQ = cm.SEQ
  INNER JOIN EMPLOYEE e ON cm.EMPSEQ = e.SEQ
  inner JOIN DEPARTMENT d ON e.DEPARTMENTSEQ = d.SEQ
  INNER JOIN tblposition p on e.POSITIONSEQ = p.SEQ
  ORDER BY realseq ASC ;

select * from clubBoardView;

------------------------투표-------------------------
SELECT * from CLUBVOTE;

INSERT INTO CLUBVOTE VALUES (CLUBVOTESEQ.nextval, 1, 1, '내일 3시에 아주대에서 축구가능??', default, '2017-09-30',DEFAULT ,default,default,default);

SELECT * from CLUBVOTEITEM;
INSERT INTO CLUBVOTEITEM VALUES (CLUBVOTEITEMSEQ.nextval, 1, '가능');
INSERT INTO CLUBVOTEITEM VALUES (CLUBVOTEITEMSEQ.nextval, 1, '불가능');
commit;


SELECT * from VOTEJOINER;
insert into VOTEJOINER VALUES (VOTEJOINERSEQ.nextval, 1, 1, DEFAULT );
insert into VOTEJOINER VALUES (VOTEJOINERSEQ.nextval, 1, 15, DEFAULT );
insert into VOTEJOINER VALUES (VOTEJOINERSEQ.nextval, 1, 16, DEFAULT );
insert into VOTEJOINER VALUES (VOTEJOINERSEQ.nextval, 1, 17, DEFAULT );
insert into VOTEJOINER VALUES (VOTEJOINERSEQ.nextval, 1, 20, DEFAULT );
insert into VOTEJOINER VALUES (VOTEJOINERSEQ.nextval, 2, 19, DEFAULT );
insert into VOTEJOINER VALUES (VOTEJOINERSEQ.nextval, 2, 21, DEFAULT );

UPDATE votejoiner set ITEMSEQ = 2 WHERE  itemseq=2 AND MEMBERSEQ=(SELECT seq FROM CLUBMEMBER WHERE CLUBSEQ=1 AND EMPSEQ=39);  ---수정

insert into VOTEJOINER VALUES (VOTEJOINERSEQ.nextval, 1, (SELECT seq FROM CLUBMEMBER WHERE CLUBSEQ=1 AND EMPSEQ=39), DEFAULT);--------clubseq와 empseq가지고 투표 insert---------------
commit;
ROLLBACK ;
SELECT seq FROM CLUBMEMBER WHERE CLUBSEQ=1 AND EMPSEQ=39);

INSERT INTO CLUBVOTE VALUES (CLUBVOTESEQ.nextval, 1, 1, '모래 5시에 대회 나올수있는사람?', default, '2017-09-30',DEFAULT ,default,default,default);
INSERT INTO CLUBVOTEITEM VALUES (CLUBVOTEITEMSEQ.nextval, 2, '가능');
INSERT INTO CLUBVOTEITEM VALUES (CLUBVOTEITEMSEQ.nextval, 2, '불가능');
INSERT INTO CLUBVOTEITEM VALUES (CLUBVOTEITEMSEQ.nextval, 2, '모르겟는데요ㅋㅋ');
commit;

SELECT * FROM VOTEJOINER;
DELETE FROM VOTEJOINER WHERE SEQ=22;


insert into VOTEJOINER VALUES (VOTEJOINERSEQ.nextval, 4, 15, DEFAULT );
insert into VOTEJOINER VALUES (VOTEJOINERSEQ.nextval, 5, 16, DEFAULT );
insert into VOTEJOINER VALUES (VOTEJOINERSEQ.nextval, 3, 17, DEFAULT );
insert into VOTEJOINER VALUES (VOTEJOINERSEQ.nextval, 3, 20, DEFAULT );
insert into VOTEJOINER VALUES (VOTEJOINERSEQ.nextval, 4, 19, DEFAULT );
insert into VOTEJOINER VALUES (VOTEJOINERSEQ.nextval, 3, 21, DEFAULT );

INSERT INTO CLUBVOTE VALUES (CLUBVOTESEQ.nextval, 1, 1, '회식 언제가 괜찮을까요? ㅋㅋㅋ', default, '2017-10-04',1 ,1,1,2);
INSERT INTO CLUBVOTEITEM VALUES (CLUBVOTEITEMSEQ.nextval, 3, '2017-11-20');
INSERT INTO CLUBVOTEITEM VALUES (CLUBVOTEITEMSEQ.nextval, 3, '2017-10-20');
INSERT INTO CLUBVOTEITEM VALUES (CLUBVOTEITEMSEQ.nextval, 3, '2018-12-22');
commit;

commit;

SELECT * FROM CLUBVOTEITEM;

SELECT * FROM CLUBMEMBER;

  SELECT cv.seq as seq, e.name as writer, cv.TITLE, round((sysdate - cv.startDate) * 24 * 60) as gap, floor(cv.ENDDATE-sysdate) as gap2 FROM CLUBVOTE cv INNER JOIN CLUBMEMBER ON cv.MEMBERSEQ = CLUBMEMBER.SEQ INNER JOIN EMPLOYEE e ON CLUBMEMBER.EMPSEQ = e.SEQ
  WHERE cv.CLUBSEQ=1 ORDER BY cv.SEQ DESC;

SELECT round((sysdate - startDate) * 24 * 60) as gap FROM CLUBVOTE;

SELECT floor(ENDDATE-sysdate) as gap2 FROM CLUBVOTE;
SELECT ceil(sysdate-ENDDATE) as gap2 FROM CLUBVOTE;

SELECT vj.* FROM VOTEJOINER vj INNER JOIN CLUBVOTEITEM vi on  vj.ITEMSEQ = vi.SEQ INNER JOIN  CLUBVOTE cv ON vi.VOTESEQ = cv.SEQ WHERE cv.seq=1;

SELECT cv.seq as seq, e.name as writer, cv.TITLE as title, e.SEQ as writerseq, round((sysdate - cv.startDate) * 24 * 60) as gap, cv.enddate as enddate FROM CLUBVOTE cv INNER JOIN CLUBMEMBER ON cv.MEMBERSEQ = CLUBMEMBER.SEQ INNER JOIN EMPLOYEE e ON CLUBMEMBER.EMPSEQ = e.SEQ
  WHERE cv.seq = 1 ORDER BY cv.SEQ DESC;   ------ 투표-하나출력------

SELECT vi.* FROM CLUBVOTEITEM vi iNNER JOIN CLUBVOTE cv ON vi.VOTESEQ = cv.SEQ WHERE cv.SEQ=1 order BY vi.SEQ ASC ; --클럽보투아이템;


SELECT vi.CONTENT,count(*) FROM CLUBVOTEITEM vi iNNER JOIN CLUBVOTE cv ON vi.VOTESEQ = cv.SEQ INNER JOIN VOTEJOINER vj ON vi.SEQ = vj.ITEMSEQ WHERE cv.SEQ=1 GROUP BY vi.CONTENT ;  -----------투표인원 get-------------------

SELECT vi.CONTENT,count(*) FROM CLUBVOTEITEM vi iNNER JOIN CLUBVOTE cv ON vi.VOTESEQ = cv.SEQ INNER JOIN VOTEJOINER vj ON vi.SEQ = vj.ITEMSEQ WHERE cv.SEQ=1 GROUP BY vi.CONTENT

SELECT

SELECT e.name as name, d.department as department, p.position as position FROM DEPARTMENT d INNER JOIN EMPLOYEE e on d.SEQ = e.DEPARTMENTSEQ INNER JOIN TBLPOSITION p ON e.POSITIONSEQ = p.SEQ WHERE e.SEQ = 39;
-----------사원정보 출력---------------

SELECT vj.* FROM CLUBVOTEITEM vi INNER JOIN VOTEJOINER vj on vi.SEQ = vj.ITEMSEQ WHERE vi.VOTESEQ=1;
-----------------------

SELECT vi.seq as seq, vi.voteseq as voteseq, vi.content as content FROM CLUBVOTEITEM vi iNNER JOIN CLUBVOTE cv ON vi.VOTESEQ = cv.SEQ WHERE cv.SEQ=1 order BY vi.SEQ ASC


SELECT vi.seq as seq, vi.voteseq as voteseq, vi.content as content FROM CLUBVOTEITEM vi iNNER JOIN CLUBVOTE cv ON vi.VOTESEQ = cv.SEQ WHERE cv.SEQ=1 order BY vi.SEQ ASC;

SELECT cv.seq as seq, e.name as writer, cv.TITLE as title, e.SEQ as writerseq, round((sysdate - cv.startDate) * 24 * 60) as gap, cv.enddate as enddate FROM CLUBVOTE cv INNER JOIN CLUBMEMBER ON cv.MEMBERSEQ = CLUBMEMBER.SEQ INNER JOIN EMPLOYEE e ON CLUBMEMBER.EMPSEQ = e.SEQ WHERE cv.seq = 3 ORDER BY cv.SEQ DESC


SELECT SEQ FROM CLUBMEMBER WHERE clubseq=1 and EMPSEQ=39;


SELECT * FROM VOTEJOINER WHERE ITEMSEQ IN (SELECT seq FROM CLUBVOTEITEM WHERE VOTESEQ=1) and MEMBERSEQ=(SELECT SEQ FROM CLUBMEMBER WHERE clubseq=1 and EMPSEQ=39);  -- 로그인한사람이 투표햇는지 안햇는지

SELECT COUNT(*) as result FROM VOTEJOINER WHERE ITEMSEQ IN (SELECT seq FROM CLUBVOTEITEM WHERE VOTESEQ=?) and MEMBERSEQ=(SELECT SEQ FROM CLUBMEMBER WHERE clubseq=? and EMPSEQ=?);

SELECT seq FROM CLUBVOTEITEM WHERE VOTESEQ=1;

SELECT * FROM VOTEJOINER WHERE ITEMSEQ IN (SELECT seq FROM CLUBVOTEITEM WHERE VOTESEQ=1);

SELECT ITEMSEQ FROM VOTEJOINER WHERE ITEMSEQ IN (SELECT seq FROM CLUBVOTEITEM WHERE VOTESEQ=1) and MEMBERSEQ=(SELECT SEQ FROM CLUBMEMBER WHERE clubseq=1 and EMPSEQ=39);