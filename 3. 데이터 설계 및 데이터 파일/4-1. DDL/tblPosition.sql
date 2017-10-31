select * from tabs;

CREATE TABLE tblPosition
(
  seq NUMBER PRIMARY KEY,
  position VARCHAR2(20) UNIQUE
);

CREATE SEQUENCE positionSeq;

DROP TABLE tblPosition;


