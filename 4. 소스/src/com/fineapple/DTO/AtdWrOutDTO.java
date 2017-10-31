package com.fineapple.DTO;

/**
 * @author hanjukim
 *
 * 근태유형 중 외출을 다루는 DTO
 */


public class AtdWrOutDTO {

    private int seq;			//고유번호
    private int bseq;			//근태기록 고유번호
    private String leaveTime;		//외출을 나간 시각
    private String comeTime;		//외출에서 돌아온 시각
    
    public int getSeq() {
        return seq;
    }
    public void setSeq(int seq) {
        this.seq = seq;
    }
    public int getBseq() {
        return bseq;
    }
    public void setBseq(int bseq) {
        this.bseq = bseq;
    }
    public String getLeaveTime() {
        return leaveTime;
    }
    public void setLeaveTime(String leaveTime) {
        this.leaveTime = leaveTime;
    }
    public String getComeTime() {
        return comeTime;
    }
    public void setComeTime(String comeTime) {
        this.comeTime = comeTime;
    }
}
