-- 결재 카테고리 테이블 INSERT
insert into approvalCategory values (approvalCategorySeq.nextval, '휴가');
insert into approvalCategory values (approvalCategorySeq.nextval, '출장비 청구');
insert into approvalCategory values (approvalCategorySeq.nextval, '병가처리');
insert into approvalCategory values (approvalCategorySeq.nextval, '자재 구매 승인');
insert into approvalCategory values (approvalCategorySeq.nextval, '지출 결의');
insert into approvalCategory values (approvalCategorySeq.nextval, '회식비 청구');
insert into approvalCategory values (approvalCategorySeq.nextval, '복리후생비 청구');
insert into approvalCategory values (approvalCategorySeq.nextval, '성과금 청구');
insert into approvalCategory values (approvalCategorySeq.nextval, '라이센스비 청구');
commit;

-- 확인용
select * from approvalCategory;

-- 결재 테이블 INSERT
insert into approval values (approvalSeq.nextval, 10, 3, '병가처리를 신청합니다. 내역입니다.', sysdate);
insert into approval values (approvalSeq.nextval, 13, 2, '출장비 청구합니다..', sysdate);
insert into approval values (approvalSeq.nextval, 24, 1, '휴가 신청합니다. 결재 승인 부탁드립니다.', sysdate);
insert into approval values (approvalSeq.nextval, 60, 9, '라이센스비를 청구합니다.', sysdate);
commit;
-- 확인용
select * from approval;

-- 직급 테이블 확인용
select * from TBLPOSITION;

-- 결재 순서 테이블
insert into approvalProcedure values (approvalProcedureSeq.nextval, 1, 3, 1);
insert into approvalProcedure values (approvalProcedureSeq.nextval, 2, 3, 1);
insert into approvalProcedure values (approvalProcedureSeq.nextval, 2, 4, 2);
commit;

-- 확인용
select * from approvalProcedure;

select * from EMPLOYEE;
insert into approvalConfirm values (approvalConfirmSeq.nextval, 4, 60, 1, 'y', '검토할만한 사유 없음', sysdate);

-- 확인용
select * from approvalConfirm;






























