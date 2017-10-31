-- 테이블 생성
-- 직원 테이블
create table employee
(
	seq number primary key,                         -- 직원번호(PK)
	name varchar2(10) not null,                     -- 이름
	jumin varchar2(15) not null,                    -- 주민번호
	pw varchar2(20) not null,                       -- 비밀번호
	cellphone varchar2(15) not null,                -- 핸드폰 번호
	email varchar2(30) not null,                    -- 이메일
	firstDate date not null,                         -- 입사일
	endDate date,                                     -- 퇴사일
	payment number,                                     -- 연봉
	departmentSeq number not null
				references department(seq),      -- 부서번호(FK)
	pwHint varchar2(50) not null,               -- 비밀번호 힌트
	pwAnswer varchar2(50) not null,             -- 비밀번호 힌트 정답
	gender varchar2(2) not null,                -- 성별
	phone varchar2(15),                          -- 담당 전화번호
	profilePic varchar2(100),                    -- 프로필 사진
	task varchar2(100),                          -- 담당 업무
	bank varchar2(50),                           -- 급여 지급 은행
	bankAccount varchar2(100),                   -- 계좌 번호
	positionSeq number not null
				references tblPosition(seq)      -- 직급 시퀀스
);

-- 직원 테이블의 시퀀스 생성
create sequence employeeSeq;

-- 확인용
select * from employee;