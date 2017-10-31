package com.fineapple.DTO;
/**
 * 결재 관련 게시판 파일 업로드의 데이터를 담는 DTO 클래스
 * @author 전슬기
 *
 */
public class ApprovalBoardFileDTO {
	private String seq;
	private String approvalBoardNum;
	private String orgName;
	private String saveName;
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getApprovalBoardNum() {
		return approvalBoardNum;
	}
	public void setApprovalBoardNum(String approvalBoardNum) {
		this.approvalBoardNum = approvalBoardNum;
	}
	public String getOrgName() {
		return orgName;
	}
	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}
	public String getSaveName() {
		return saveName;
	}
	public void setSaveName(String saveName) {
		this.saveName = saveName;
	}
	
	

}
