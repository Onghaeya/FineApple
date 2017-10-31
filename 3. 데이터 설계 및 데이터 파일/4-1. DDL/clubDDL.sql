

-- auto-generated definition
CREATE TABLE CLUBCATEGORY
(
  SEQ  NUMBER       NOT NULL
    PRIMARY KEY,
  NAME VARCHAR2(50) NOT NULL
)
/
CREATE SEQUENCE CLUBCATEGORYSEQ NOCACHE ;

-- auto-generated definition
CREATE TABLE CLUB
(
  SEQ         NUMBER                NOT NULL
    PRIMARY KEY,
  NAME        VARCHAR2(50)          NOT NULL,
  DETAIL      VARCHAR2(100)         NOT NULL,
  CATEGORYSEQ NUMBER     NOT NULL
    REFERENCES CLUBCATEGORY(SEQ),
  EMPSEQ      NUMBER                NOT NULL
    REFERENCES EMPLOYEE(SEQ),
  OPENDATE    DATE DEFAULT sysdate  NOT NULL,
  CLUBIMAGE   VARCHAR2(100)
)
/

CREATE SEQUENCE CLUBSEQ NOCACHE ;

-- auto-generated definition
CREATE TABLE CLUBMEMBER
(
  SEQ      NUMBER                NOT NULL
    PRIMARY KEY,
  CLUBSEQ  NUMBER                NOT NULL
    REFERENCES CLUB,
  EMPSEQ   NUMBER                NOT NULL
    REFERENCES EMPLOYEE,
  JOINDATE DATE DEFAULT sysdate  NOT NULL
)
/
CREATE SEQUENCE CLUBMEMBERSEQ NOCACHE ;

-- auto-generated definition
CREATE TABLE CLUBCALENDAR
(
  SEQ       NUMBER                NOT NULL
    PRIMARY KEY,
  CLUBSEQ   NUMBER                NOT NULL
    REFERENCES CLUB,
  MEMBERSEQ NUMBER                NOT NULL
    REFERENCES CLUBMEMBER,
  STARTDATE DATE DEFAULT sysdate  NOT NULL,
  ENDDATE   DATE                  NOT NULL,
  PLACE     VARCHAR2(30)          NOT NULL,
  TITLE     VARCHAR2(50)          NOT NULL,
  DETAIL    VARCHAR2(100)
)
/
CREATE SEQUENCE CLUBCALENDARSEQ NOCACHE ;

-- auto-generated definition

-- auto-generated definition
CREATE TABLE CLUBVOTE
(
  SEQ          NUMBER                   NOT NULL
    PRIMARY KEY,
  CLUBSEQ      NUMBER                   NOT NULL
    REFERENCES CLUB,
  MEMBERSEQ    NUMBER                   NOT NULL
    REFERENCES CLUBMEMBER,
  TITLE        VARCHAR2(50)             NOT NULL,
  STARTDATE    DATE DEFAULT sysdate     NOT NULL,
  ENDDATE      DATE                     NOT NULL,
  ISOVERLAP    VARCHAR2(3) DEFAULT '0'  NOT NULL,
  ISANONYMOUS  VARCHAR2(3) DEFAULT '0'  NOT NULL,
  ISADDITEM    VARCHAR2(3) DEFAULT '0'  NOT NULL,
  VOTECATEGORY VARCHAR2(3) DEFAULT '1'  NOT NULL
)
/
ALTER TABLE CLUBVOTE
drop COLUMN VOTECATEGORYSEQ;

alter TABLE CLUBVOTE
add (votecategory varchar(3) DEFAULT '1' not NULL );

CREATE SEQUENCE CLUBVOTESEQ NOCACHE ;
DROP TABLE clubvote;
-- auto-generated definition
CREATE TABLE CLUBVOTEITEM
(
  SEQ     NUMBER        NOT NULL
    PRIMARY KEY,
  VOTESEQ NUMBER        NOT NULL
    REFERENCES CLUBVOTE,
  CONTENT VARCHAR2(100) NOT NULL
)
/
CREATE SEQUENCE CLUBVOTEITEMSEQ NOCACHE ;

-- auto-generated definition
CREATE TABLE VOTEJOINER
(
  SEQ       NUMBER                NOT NULL
    PRIMARY KEY,
  ITEMSEQ   NUMBER                NOT NULL
    REFERENCES CLUBVOTEITEM,
  MEMBERSEQ NUMBER                NOT NULL
    REFERENCES CLUBMEMBER,
  REGDATE   DATE DEFAULT sysdate  NOT NULL
)
/
CREATE SEQUENCE voteJoinerSeq NOCACHE ;

-------------------------------------------------------
CREATE TABLE clubInvitation(
  seq NUMBER NOT NULL PRIMARY KEY ,
  empSeq NUMBER NOT NULL REFERENCES EMPLOYEE(seq),
  memberSeq NUMBER NOT NULL REFERENCES CLUBMEMBER(seq),
  clubSeq NUMBER NOT NULL REFERENCES CLUB(seq),
  sendDate DATE DEFAULT sysdate NOT NULL ,
  answer VARCHAR2(3) NULL
);

CREATE SEQUENCE clubInvitationSeq NOCACHE ;
-------------------------------------------------------
CREATE TABLE shortClubVote(
  seq NUMBER NOT NULL PRIMARY KEY ,
  categorySeq NUMBER NOT NULL REFERENCES CLUBCATEGORY(seq),
  empSeq NUMBER NOT NULL REFERENCES EMPLOYEE(seq),
  title varchar2(50) NOT NULL ,
  startDate DATE DEFAULT sysdate NOT NULL ,
  endDate DATE NOT NULL ,
  isOverlap VARCHAR2(3) DEFAULT '0' NOT NULL
);

CREATE SEQUENCE shortClubVoteSeq NOCACHE ;
-------------------------------------------------------
CREATE TABLE shortVoteItem (
  seq     NUMBER        NOT NULL PRIMARY KEY,
  voteSeq NUMBER        NOT NULL REFERENCES shortClubVote (seq),
  content VARCHAR2(100) NOT NULL
);
create SEQUENCE shortvoteItemSeq NOCACHE ;

-------------------------------------------------------
CREATE TABLE shortVoteJoiner(
  seq NUMBER NOT NULL PRIMARY KEY ,
  itemSeq NUMBER NOT NULL REFERENCES shortVoteItem(seq),
  empSEq NUMBER NOT NULL REFERENCES EMPLOYEE(seq),
  regDate DATE DEFAULT sysdate NOT NULL
);

CREATE SEQUENCE shortVoteJoinerSeq NOCACHE ;
-------------------------------------------------------
CREATE TABLE shortVoteReply(
  seq NUMBER NOT NULL PRIMARY KEY ,
  empSeq NUMBER NOT NULL REFERENCES EMPLOYEE(seq),
  voteSeq NUMBER NOT NULL REFERENCES shortClubVote(seq),
  content VARCHAR2(100) NOT NULL
);

CREATE SEQUENCE shortVoteReplySeq NOCACHE ;
----------------- ----------------------------------------
CREATE table clubBoardCategory(
  seq NUMBER not NULL PRIMARY KEY ,
  name varchar2(100)
);

DROP TABLE clubBoardCategory;

create SEQUENCE clubBoardCategorySeq NOCACHE ;

-------------------------------------------------------
CREATE table clubBoard(
  seq number not null primary key,
  categorySeq NUMBER NOT NULL REFERENCES clubBoardCategory(seq),
  memberSeq NUMBER NOT NULL REFERENCES CLUBMEMBER(seq),
  clubSeq NUMBER not null REFERENCES CLUB(seq),
  title VARCHAR2(50) NOT NULL ,
  content varchar2(1000) NOT NULL ,
  regDate DATE DEFAULT sysdate NOT NULL ,
  readCount NUMBER DEFAULT 0 NOT NULL,
  thread NUMBER DEFAULT 0 NOT NULL ,
  depth NUMBER DEFAULT 0 NOT NULL
);
drop table clubBoard;

CREATE SEQUENCE clubBoardSeq NOCACHE ;
-------------------------------------------------------
CREATE TABLE clubBoardFiles(
  seq NUMBER NOT NULL PRIMARY KEY ,
  clubBoardSeq NUMBER NOT NULL REFERENCES clubBoard(seq),
  orgFileName VARCHAR2(100) not null,
  fileName VARCHAR2(100) NOT NULL
);
DROP TABLE clubBoardFiles;

create SEQUENCE clubBoardFilesSeq NOCACHE ;
------------------------------------------------------------
create Table clubBoardReply(
  seq NUMBER NOT NULL PRIMARY KEY ,
  clubBoardSeq NUMBER NOT NULL REFERENCES clubBoard(seq),
  memberSeq NUMBER NOT NULL REFERENCES CLUBMEMBER(seq),
  regDate DATE DEFAULT sysdate NOT NULL ,
  content VARCHAR2(500) NOT NULL ,
  thread NUMBER DEFAULT 0 NOT NULL ,
  depth NUMBER DEFAULT 0 NOT NULL
);
drop table clubBoardReply;

create SEQUENCE clubBoardReplySeq NOCACHE ;
drop SEQUENCE clubBoardReplySeq;

