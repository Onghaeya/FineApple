package com.fineapple.DTO;

/**
 * @author hanjukim
 *
 * 직원의 근태기록을 다루는 DTO
 */


public class AtdWorkRecordDTO {
    
    private String seq;			//고유번호
    private String eseq;			//직원 고유번호
    private String date;		//날짜
    private String comeTime;		//출근시각
    private String leaveTime;		//퇴근시각
    
    public String getSeq() {
        return seq;
    }
    public void setSeq(String seq) {
        this.seq = seq;
    }
    public String getEseq() {
        return eseq;
    }
    public void setEseq(String eseq) {
        this.eseq = eseq;
    }
    public String getDate() {
        return date;
    }
    public void setDate(String date) {
        this.date = date;
    }
    public String getComeTime() {
        return comeTime;
    }
    public void setComeTime(String comeTime) {
        this.comeTime = comeTime;
    }
    public String getLeaveTime() {
        return leaveTime;
    }
    public void setLeaveTime(String leaveTime) {
        this.leaveTime = leaveTime;
    }    
}
