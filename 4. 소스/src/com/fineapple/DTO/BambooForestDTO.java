package com.fineapple.DTO;

public class BambooForestDTO {
	private String seq;
	private String empSeq;
	private String BFCategorySeq;
	private String title;
	private String content;
	private String approval;
	private String declinedReason;
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getEmpSeq() {
		return empSeq;
	}
	public void setEmpSeq(String empSeq) {
		this.empSeq = empSeq;
	}
	public String getBFCategorySeq() {
		return BFCategorySeq;
	}
	public void setBFCategorySeq(String bFCategorySeq) {
		BFCategorySeq = bFCategorySeq;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getApproval() {
		return approval;
	}
	public void setApproval(String approval) {
		this.approval = approval;
	}
	public String getDeclinedReason() {
		return declinedReason;
	}
	public void setDeclinedReason(String declinedReason) {
		this.declinedReason = declinedReason;
	}
}
