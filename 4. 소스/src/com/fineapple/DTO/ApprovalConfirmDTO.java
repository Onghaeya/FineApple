package com.fineapple.DTO;
/**
 * 결재승인 테이블(ApprovalConfirmDTO)의 데이터를 담는 DTO 클래스
 * @author 전슬기
 *
 */
public class ApprovalConfirmDTO {
	
	private String seq;
	private String approvalNum;
	private String employeeNum;
	private String approvalProcedureNum;
	private String approvalCheck;
	//private String considerationContext;
	private String considerationContent;
	private String approvalDate;
	
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}	
	public String getApprovalNum() {
		return approvalNum;
	}
	public void setApprovalNum(String approvalNum) {
		this.approvalNum = approvalNum;
	}
	public String getEmployeeNum() {
		return employeeNum;
	}
	public void setEmployeeNum(String employeeNum) {
		this.employeeNum = employeeNum;
	}
	public String getApprovalProcedureNum() {
		return approvalProcedureNum;
	}
	public void setApprovalProcedureNum(String approvalProcedureNum) {
		this.approvalProcedureNum = approvalProcedureNum;
	}
	public String getApprovalCheck() {
		return approvalCheck;
	}
	public void setApprovalCheck(String approvalCheck) {
		this.approvalCheck = approvalCheck;
	}

	public String getApprovalDate() {
		return approvalDate;
	}
	public void setApprovalDate(String approvalDate) {
		this.approvalDate = approvalDate;
	}
	public String getConsiderationContent() {
		return considerationContent;
	}
	public void setConsiderationContent(String considerationContent) {
		this.considerationContent = considerationContent;
	}
	
	

}//ApprovalConfirmDTO
