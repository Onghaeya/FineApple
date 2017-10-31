package com.fineapple.DTO;

/**
 * @author hanjukim
 *
 * 게시글에 첨부된 파일을 다루는 DTO
 */


public class AtdBFileDTO {
    
    private int seq;				//고유번호
    private int bseq;				//파일이 첨부된 게시글의 고유번호
    private String orgFileName;		//파일을 첨부했을 당시의 파일명(그림)
    private String fileName;			//파일이 서버에 올라와서 저장됬을 당시의 파일명(그림1, 그림2 ..)
    
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
    public String getOrgFileName() {
        return orgFileName;
    }
    public void setOrgFileName(String orgFileName) {
        this.orgFileName = orgFileName;
    }
    public String getFileName() {
        return fileName;
    }
    public void setFileName(String fileName) {
        this.fileName = fileName;
    }
}
