CREATE TABLE atdWrCtgManage
(
    seq number PRIMARY KEY ,
    wrseq NUMBER NOT NULL REFERENCES atdWorkRecord(seq),
    cseq NUMBER NOT NULL REFERENCES atdWrCategory(seq)
);