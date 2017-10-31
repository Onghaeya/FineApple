package com.fineapple.DTO;

/**
 * @author hanjukim
 *
 * 근태유형을 다루는 DTO
 */


public class AtdWrCategoryDTO {

    private int seq;			//고유번호
    private String categorys;		//모든 경우의 수를 대비하고, 근태의 경우를 나타내는 문자열. 구분자는 ',' 이다. (예: 정상근무. 지각. 조퇴. 지각,조퇴 ..)
    
    public int getSeq() {
        return seq;
    }
    public void setSeq(int seq) {
        this.seq = seq;
    }
    public String getCategorys() {
        return categorys;
    }
    public void setCategorys(String categorys) {
        this.categorys = categorys;
    }
}
