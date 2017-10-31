package com.fineapple.DTO;

import java.util.ArrayList;

public class SurveyDTO {
	private String seq;
	private String subject;
	private String purpose;
	private String empSeq;
	private String startDate;
	private String endDate;
	private String targetDepartment;
	private String targetPosition;
	private String anonymity;
	private String regDate;
	ArrayList<SurveyTimeDTO> stList;
	
	public ArrayList<SurveyTimeDTO> getStList() {
		return stList;
	}
	public void setStList(ArrayList<SurveyTimeDTO> stList) {
		this.stList = stList;
	}
	ArrayList<SurveyQuestionDTO> sqList;
	private int questionCount;
	
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	
	public int getQuestionCount() {
		return questionCount;
	}
	public void setQuestionCount(int questionCount) {
		this.questionCount = questionCount;
	}
	public ArrayList<SurveyQuestionDTO> getSqList() {
		return sqList;
	}
	public void setSqList(ArrayList<SurveyQuestionDTO> sqList) {
		this.sqList = sqList;
	}
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getPurpose() {
		return purpose;
	}
	public void setPurpose(String purpose) {
		this.purpose = purpose;
	}
	public String getEmpSeq() {
		return empSeq;
	}
	public void setEmpSeq(String empSeq) {
		this.empSeq = empSeq;
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
	public String getTargetDepartment() {
		return targetDepartment;
	}
	public void setTargetDepartment(String targetDepartment) {
		this.targetDepartment = targetDepartment;
	}
	public String getTargetPosition() {
		return targetPosition;
	}
	public void setTargetPosition(String targetPosition) {
		this.targetPosition = targetPosition;
	}
	public String getAnonymity() {
		return anonymity;
	}
	public void setAnonymity(String anonymity) {
		this.anonymity = anonymity;
	}

}
