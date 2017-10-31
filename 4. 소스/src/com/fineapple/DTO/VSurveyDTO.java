package com.fineapple.DTO;

import java.util.ArrayList;

public class VSurveyDTO {
	private String name;
	private String empSeq;
	private String seq;
	private String subject;
	private String purpose;
	private String startDate;
	private String endDate;
	private String targetDepartment;
	private String department;
	private String position;
	private String targetPosition;
	private String anonymity;
	private String regDate;
	
	private int participantsCount; //참여자 수
	private int questionCount;
	private int end;
	
	ArrayList<SurveyQuestionDTO> sqList;
	ArrayList<SurveyTimeDTO> stList;
	
	public ArrayList<SurveyTimeDTO> getStList() {
		return stList;
	}
	public void setStList(ArrayList<SurveyTimeDTO> stList) {
		this.stList = stList;
	}
	
	public ArrayList<SurveyQuestionDTO> getSqList() {
		return sqList;
	}
	public void setSqList(ArrayList<SurveyQuestionDTO> sqList) {
		this.sqList = sqList;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public int getParticipantsCount() {
		return participantsCount;
	}
	public void setParticipantsCount(int participantsCount) {
		this.participantsCount = participantsCount;
	}
	
	public int getQuestionCount() {
		return questionCount;
	}
	public void setQuestionCount(int questionCount) {
		this.questionCount = questionCount;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}

}
