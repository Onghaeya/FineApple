package com.fineapple.DTO;

public class SurveyMultiChoiceDTO {
	
	private String seq;
	private String answer;
	private String etc;
	private String surveyQuestionSeq;
	private int count;
	
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public String getEtc() {
		return etc;
	}
	public void setEtc(String etc) {
		this.etc = etc;
	}
	public String getSurveyQuestionSeq() {
		return surveyQuestionSeq;
	}
	public void setSurveyQuestionSeq(String surveyQuestionSeq) {
		this.surveyQuestionSeq = surveyQuestionSeq;
	}
}
