package com.fineapple.DTO;

public class SurveyCountDTO {
	private String surveyMultiChoiceSeq;
	private int totalMultiChoiceCount;
	public String getSurveyMultiChoiceSeq() {
		return surveyMultiChoiceSeq;
	}
	public void setSurveyMultiChoiceSeq(String surveyMultiChoiceSeq) {
		this.surveyMultiChoiceSeq = surveyMultiChoiceSeq;
	}
	public int getTotalMultiChoiceCount() {
		return totalMultiChoiceCount;
	}
	public void setTotalMultiChoiceCount(int totalMultiChoiceCount) {
		this.totalMultiChoiceCount = totalMultiChoiceCount;
	}
}
