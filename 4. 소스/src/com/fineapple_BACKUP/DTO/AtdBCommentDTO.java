package com.fineapple.DTO;

/**
 * @author hanjukim
 *
 * 게시글에 대한 댓글을 다루는 DTO.
 */


public class AtdBCommentDTO {

    private int seq;			//고유번호
    private int eseq;			//댓글을 작성한 회원의 고유번호
    private int bseq;			//댓글이 작성된 게시글의 고유번호
    private String regDate;		//댓글 작성일자
    private String content;		//댓글 내용
    private int thread;		//정렬을 위한 쓰레드값
    private int depth;			//정렬을 위한 뎁스값
    
    public int getSeq() {
        return seq;
    }
    public void setSeq(int seq) {
        this.seq = seq;
    }
    public int getEseq() {
        return eseq;
    }
    public void setEseq(int eseq) {
        this.eseq = eseq;
    }
    public int getBseq() {
        return bseq;
    }
    public void setBseq(int bseq) {
        this.bseq = bseq;
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
