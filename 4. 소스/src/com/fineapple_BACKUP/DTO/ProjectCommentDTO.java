package com.fineapple.DTO;

public class ProjectCommentDTO {

	private String seq;
	private String projectSeq;
	private String empSeq;
	private String regDate;
	private String content;
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getProjectSeq() {
		return projectSeq;
	}
	public void setProjectSeq(String projectSeq) {
		this.projectSeq = projectSeq;
	}
	public String getEmpSeq() {
		return empSeq;
	}
	public void setEmpSeq(String empSeq) {
		this.empSeq = empSeq;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
}
