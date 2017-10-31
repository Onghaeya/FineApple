--근무기록을 위한 Sequence 객체 생성
CREATE SEQUENCE atdWrSeq;

SELECT * FROM ATDWORKRECORD;

SELECT count(*) FROM ATDWORKRECORD WHERE eseq = 28 AND LEAVETIME is NULL ;
UPDATE ATDWORKRECORD SET LEAVETIME = sysdate WHERE eseq = 28 and LEAVETIME is NULL ;


SELECT * from ATDWORKRECORD;

SELECT * FROM ATDWORKRECORD WHERE eseq = 28 AND LEAVETIME is NULL;

update EMPLOYEE set DEPARTMENTSEQ = 1 WHERE seq = 28;

SELECT * FROM TBLPOSITION;
SELECT * FROM EMPLOYEE WHERE DEPARTMENTSEQ = 1;
--1 사장, 2부장, 3과장, 4사원
commit;

SELECT * FROM ATDWORKRECORD WHERE eseq = 28 AND LEAVETIME is NULL


SELECT * from DEPARTMENT;
SELECT * FROM TBLPOSITION;

SELECT * from DEPARTMENT;


SELECT * FROM department;
--1개발부, 2인사부, 3총무부, 4영업부
SELECT * FROM tblposition;
--1사장, 2부장, 3과장, 4사원
SELECT * FROM employee WHERE seq = 28;
--강소라, 부서2, 직급3
SELECT * FROM employee;
UPDATE employee SET departmentseq = 1 WHERE seq = 28;
COMMIT;
--	-> 강소라를 인사부에서 개발부로 이전시켰다. 



SELECT * from ATDWORKRECORD where eseq = 10 and LEAVETIME is null;
SELECT * from ATDWORKRECORD where eseq = 10 and COMETIME is null;

update EMPLOYEE set PROFILEPIC = 'usericon.png' where profilepic is null;

commit;






