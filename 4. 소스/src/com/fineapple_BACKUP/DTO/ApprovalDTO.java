package com.fineapple.DTO;
/**
 * 결재(기안서 작성) 테이블(ApprovalConfirmDTO)의 데이터를 담는 DTO 클래스
 * @author 전슬기
 *
 */
public class ApprovalDTO {

	private String seq;
	private String employeeNum;
	private String approvalCategoryNum;
	//private String approvalContext;
	private String approvalContent;
	private String approvalDraftDate;
	private String approvalCategory;
	
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getEmployeeNum() {
		return employeeNum;
	}
	public void setEmployeeNum(String employeeNum) {
		this.employeeNum = employeeNum;
	}
	public String getApprovalCategoryNum() {
		return approvalCategoryNum;
	}
	public void setApprovalCategoryNum(String approvalCategoryNum) {
		this.approvalCategoryNum = approvalCategoryNum;
	}
	public String getApprovalDraftDate() {
		return approvalDraftDate;
	}
	public void setApprovalDraftDate(String approvalDraftDate) {
		this.approvalDraftDate = approvalDraftDate;
	}
	public String getApprovalContent() {
		return approvalContent;
	}
	public void setApprovalContent(String approvalContent) {
		this.approvalContent = approvalContent;
	}
	public String getApprovalCategory() {
		return approvalCategory;
	}
	public void setApprovalCategory(String approvalCategory) {
		this.approvalCategory = approvalCategory;
	}
	
	
}//ApprovalDTO
