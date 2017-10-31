package com.fineapple.DTO;

public class SurveyAnswerDTO {
	private String seq;
	private String surveyQuestionSeq;
	private String surveyMultiChoiceSeq;
	private String descriptiveAnswer;
	private String regDate;
	private String empSeq;
	private String name;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getSurveyQuestionSeq() {
		return surveyQuestionSeq;
	}
	public void setSurveyQuestionSeq(String surveyQuestionSeq) {
		this.surveyQuestionSeq = surveyQuestionSeq;
	}
	public String getSurveyMultiChoiceSeq() {
		return surveyMultiChoiceSeq;
	}
	public void setSurveyMultiChoiceSeq(String surveyMultiChoiceSeq) {
		this.surveyMultiChoiceSeq = surveyMultiChoiceSeq;
	}
	public String getDescriptiveAnswer() {
		return descriptiveAnswer;
	}
	public void setDescriptiveAnswer(String descriptiveAnswer) {
		this.descriptiveAnswer = descriptiveAnswer;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getEmpSeq() {
		return empSeq;
	}
	public void setEmpSeq(String empSeq) {
		this.empSeq = empSeq;
	}
}
