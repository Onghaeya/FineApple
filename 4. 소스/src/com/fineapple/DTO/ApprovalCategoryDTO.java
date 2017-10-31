package com.fineapple.DTO;
/**
 * 결재카테고리 테이블(ApprovalCategory)의 데이터를 담는 DTO 클래스
 * @author 전슬기
 *
 */
public class ApprovalCategoryDTO {
	
	private String seq;
	private String approvalCategoryName;
	
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}	
	public String getApprovalCategoryName() {
		return approvalCategoryName;
	}
	public void setApprovalCategoryName(String approvalCategoryName) {
		this.approvalCategoryName = approvalCategoryName;
	}
	

}//ApprovalCategoryDTO
