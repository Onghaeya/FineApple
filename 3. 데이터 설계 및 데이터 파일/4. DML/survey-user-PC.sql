SELECT * FROM tabs;

CREATE TABLE survey
(
  seq NUMBER PRIMARY KEY,
  subject VARCHAR2(100) NOT NULL,
  purpose VARCHAR2(100) NOT NULL,
  empSeq NUMBER REFERENCES employee(seq)

)