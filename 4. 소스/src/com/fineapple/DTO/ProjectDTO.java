package com.fineapple.DTO;

import java.util.ArrayList;

public class ProjectDTO {

	private String seq;
	private String depSeq;
	private String empSeq;
	private String respSeq;
	private String subject;
	private String goal;
	private String content;
	private String startDate;
	private String endDate;
	private String type;
	private ArrayList<ProjectCommentDTO> commentList;
	public ArrayList<ProjectCommentDTO> getCommentList() {
		return commentList;
	}
	public void setCommentList(ArrayList<ProjectCommentDTO> commentList) {
		this.commentList = commentList;
	}
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getDepSeq() {
		return depSeq;
	}
	public void setDepSeq(String depSeq) {
		this.depSeq = depSeq;
	}
	public String getEmpSeq() {
		return empSeq;
	}
	public void setEmpSeq(String empSeq) {
		this.empSeq = empSeq;
	}
	public String getRespSeq() {
		return respSeq;
	}
	public void setRespSeq(String respSeq) {
		this.respSeq = respSeq;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getGoal() {
		return goal;
	}
	public void setGoal(String goal) {
		this.goal = goal;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
}
