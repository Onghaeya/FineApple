SELECT * FROM EMPLOYEE;

DROP TABLE surveyAnswerType;
DROP TABLE surveyAnswer;
DROP TABLE surveyMultiChoice;
DROP TABLE surveyQuestion;
DROP TABLE survey;
------------------------------------------------------------
CREATE TABLE survey
(
  seq NUMBER PRIMARY KEY,
  subject VARCHAR2(100) NOT NULL,
  purpose VARCHAR2(100) NOT NULL,
  empSeq NUMBER REFERENCES employee(seq),
  startDate DATE DEFAULT sysdate NOT NULL,
  endDate DATE NOT NULL,
  targetDepartment NUMBER NULL REFERENCES DEPARTMENT(seq),
  targetPosition NUMBER NULL REFERENCES TBLPOSITION(seq),
  anonymity VARCHAR2(5) DEFAULT 'n' NOT NULL
);

CREATE SEQUENCE surveySeq;


------------------------------------------------------------
CREATE TABLE surveyAnswerType
(
  seq NUMBER PRIMARY KEY,
  answerType VARCHAR2(50)
);

CREATE SEQUENCE surveyAnswerTypeSeq;


------------------------------------------------------------
CREATE TABLE surveyQuestion
(
  seq NUMBER PRIMARY KEY,
  surveySeq NUMBER REFERENCES survey(seq) NOT NULL,
  questionNumber NUMBER NOT NULL,
  question VARCHAR2(200) NOT NULL ,
  multipleNum NUMBER DEFAULT 0 NOT NULL,
  answerLimit NUMBER NULL,
  required VARCHAR2(5) DEFAULT 'n' NOT NULL,
  answerTypeSeq NUMBER NOT NULL
);

CREATE SEQUENCE surveyQuestionSeq;

------------------------------------------------------------
CREATE TABLE surveyMultiChoice
(
  seq NUMBER PRIMARY KEY,
  answer VARCHAR2(50) NULL,
  etc VARCHAR2(5) DEFAULT 'n' NOT NULL,
  surveyQuestionSeq NUMBER REFERENCES surveyQuestion(seq) NOT NULL
);

CREATE SEQUENCE surveyMultiChoiceSeq;
------------------------------------------------------------

CREATE TABLE surveyAnswer
(
  seq NUMBER PRIMARY KEY,
  surveyQuestionSeq NUMBER NOT NULL REFERENCES surveyQuestion(seq),
  surveyMultiChoiceSeq NUMBER NULL REFERENCES surveyMultiChoice(seq),
  descriptiveAnswer VARCHAR2(200) NULL,
  regDate Date DEFAULT sysdate NOT NULL,
  empSeq NUMBER REFERENCES EMPLOYEE(seq) NOT NULL
);

CREATE SEQUENCE surveyAnswerSeq;

------------------------------------------------------------

SELECT * FROM survey;
SELECT * FROM surveyAnswer;
SELECT * FROM surveyAnswerType;
SELECT * FROM surveyQuestion;
SELECT * FROM surveyMultiChoice;