package com.fineapple.DTO;

/**
 * @author hanjukim
 *
 * 게시글에 대한 공감과 비공감을 다루는 DTO.
 */


public class AtdBLikeDTO {

    private int seq;		//고유번호 
    private int eseq;		//공감 혹은 비공감을 누른 직원의 고유번호 
    private int bseq;		//공감 혹은 비공감을 누른 게시글의 고유번호 
    private int state;		//상태값. default 값은 0이며, -1은 비공감 뜻하고, 1은 공감을 뜻한다.
    
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
    public int getState() {
        return state;
    }
    public void setState(int state) {
        this.state = state;
    }
}
