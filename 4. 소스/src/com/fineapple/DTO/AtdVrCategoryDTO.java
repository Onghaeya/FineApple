package com.fineapple.DTO;

/**
 * @author hanjukim
 *
 * 휴가유형을 다루는 DTO
 */


public class AtdVrCategoryDTO {

    private int seq;			//고유번호
    private String name;		//휴가의 경우를 나타내는 문자열. (예: 연차. 결근. 출장)
    
    public int getSeq() {
        return seq;
    }
    public void setSeq(int seq) {
        this.seq = seq;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
}
