package com.fineapple.DTO;

/**
 * @author hanjukim
 * 
 * 한 게시글을 다루는 DTO.
 */


public class AtdBoardDTO {
    
    private int seq;			//고유번호
    private String eseq;			//글을 작성한 직원의 고유번호
    private String cseq;			//글의 카테고리 고유번호
    private String subject;		//글 제목
    private String regDate;		//글 작성날짜
    private String content;		//글 내용
    private int readCount;		//조회수
    private int thread;		//정렬을 위한 쓰레드값
    private int depth;			//정렬을 위한 뎁스값
    
    public int getSeq() {
        return seq;
    }
    public void setSeq(int seq) {
        this.seq = seq;
    }
    public String getEseq() {
        return eseq;
    }
    public void setEseq(String eseq) {
        this.eseq = eseq;
    }
    public String getCseq() {
        return cseq;
    }
    public void setCseq(String cseq) {
        this.cseq = cseq;
    }
    public String getSubject() {
        return subject;
    }
    public void setSubject(String subject) {
        this.subject = subject;
    }
    public String getRegDate() {
        return regDate;
    }
    public void setRegDate(String regDate) {
        this.regDate = regDate;
    }
    public String getContent() {
        return content;
    }
    public void setContent(String content) {
        this.content = content;
    }
    public int getReadCount() {
        return readCount;
    }
    public void setReadCount(int readCount) {
        this.readCount = readCount;
    }
    public int getThread() {
        return thread;
    }
    public void setThread(int thread) {
        this.thread = thread;
    }
    public int getDepth() {
        return depth;
    }
    public void setDepth(int depth) {
        this.depth = depth;
    }    
}