select * from tabs;
select * from department;
select * from tblPosition;
select * from tblOCategory;
select * from TBLOUTCOME;
select * from EMPLOYEE;

select * from vOutcome where DEPARTMENTSEQ = 1 and POSITIONSEQ = 2 order by regDate desc;

/*Outcome 접근시 리스트 출력용 view vOutcome*/
create or replace view vOutcome as
  select a.seq, a.regDate, a.amount, a.etc, b.NAME, b.DEPARTMENTSEQ, b.POSITIONSEQ, c.NAME as category from tblOutcome a
    inner join EMPLOYEE b on a.EMPSEQ = b.seq
    inner join TBLOCATEGORY c on a.CSEQ = c.SEQ;
select * from vOutcome;

-- Outcome 비용청구서 1장 출력용 view vOutcomeRead
create or replace view vOutcomeRead as
  select a.seq, a.empSeq, a.regDate, a.conDate, a.content, a.amount, a.etc, a.aSeq, a.respSeq, b.NAME, b.DEPARTMENTSEQ, c.NAME as category from tblOutcome a
    inner join EMPLOYEE b on a.empseq = b.SEQ
    inner join TBLOCATEGORY c on a.CSEQ = c.SEQ;
select * from vOutcomeRead;


/*tblOCategory*/
insert into tblOCategory (seq, name) values (OCATEGORYSEQ.nextval, '식비');
insert into tblOCategory (seq, name) values (OCATEGORYSEQ.nextval, '출장비');
insert into tblOCategory (seq, name) values (OCATEGORYSEQ.nextval, '판공비');
insert into tblOCategory (seq, name) values (OCATEGORYSEQ.nextval, '영업비');
insert into tblOCategory (seq, name) values (OCATEGORYSEQ.nextval, '관리비');
insert into tblOCategory (seq, name) values (OCATEGORYSEQ.nextval, '개발비용');
insert into tblOCategory (seq, name) values (OCATEGORYSEQ.nextval, '자재비용');
insert into tblOCategory (seq, name) values (OCATEGORYSEQ.nextval, '물류비용');
insert into tblOCategory (seq, name) values (OCATEGORYSEQ.nextval, '유지비용');
insert into tblOCategory (seq, name) values (OCATEGORYSEQ.nextval, '금융비용');
insert into tblOCategory (seq, name) values (OCATEGORYSEQ.nextval, '세금비용');
insert into tblOCategory (seq, name) values (OCATEGORYSEQ.nextval, '배당비용');
insert into tblOCategory (seq, name) values (OCATEGORYSEQ.nextval, '감가상각');
insert into tblOCategory (seq, name) values (OCATEGORYSEQ.nextval, '손실계상');

