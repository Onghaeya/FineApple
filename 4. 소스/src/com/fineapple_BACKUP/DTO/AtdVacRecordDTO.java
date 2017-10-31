package com.fineapple.DTO;

/**
 * @author hanjukim
 *
 * 직원의 휴가기록을 다루는 DTO
 */


public class AtdVacRecordDTO {

    private int seq;			//고유번호
    private int cseq;			//휴가유형 고유번호(월차, 결근 등)
    private int eseq;			//직원 고유번호
    private String date;		//날짜
    
    public int getSeq() {
        return seq;
    }
    public void setSeq(int seq) {
        this.seq = seq;
    }
    public int getCseq() {
        return cseq;
    }
    public void setCseq(int cseq) {
        this.cseq = cseq;
    }
    public int getEseq() {
        return eseq;
    }
    public void setEseq(int eseq) {
        this.eseq = eseq;
    }
    public String getDate() {
        return date;
    }
    public void setDate(String date) {
        this.date = date;
    }
}
