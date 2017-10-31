package com.fineapple.DTO;

/**
 * @author hanjukim
 *
 * 게시글의 카테고리를 다루는 DTO.
 */


public class AtdBCategoryDTO {

    private int seq;			//고유번호
    private String name;		//카테고리명
    
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
