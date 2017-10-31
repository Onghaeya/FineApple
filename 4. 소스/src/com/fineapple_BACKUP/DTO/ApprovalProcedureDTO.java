package com.fineapple.DTO;
/**
 * 결재순서 테이블(approvalProcedure)의 데이터를 담는 DTO 클래스
 * @author user
 *
 */
public class ApprovalProcedureDTO {
	
	private String seq;
	private String approvalCategoryNum;
	private String positionNum;
	private String approvalProcedureNum;
	
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getApprovalCategoryNum() {
		return approvalCategoryNum;
	}
	public void setApprovalCategoryNum(String approvalCategoryNum) {
		this.approvalCategoryNum = approvalCategoryNum;
	}
	public String getPositionNum() {
		return positionNum;
	}
	public void setPositionNum(String positionNum) {
		this.positionNum = positionNum;
	}
	public String getApprovalProcedureNum() {
		return approvalProcedureNum;
	}
	public void setApprovalProcedureNum(String approvalProcedureNum) {
		this.approvalProcedureNum = approvalProcedureNum;
	}
	
	
	
}//ApprovalProcedureDTO
