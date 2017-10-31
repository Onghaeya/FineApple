package com.fineapple.DTO;

import java.util.ArrayList;

public class SurveyQuestionDTO {

	private String seq;
	private String surveySeq;
	private int questionNumber;
	private String question;
	private int multipleNum;
	private int answerLimit;
	private String required;
	private String answerTypeSeq;
	

	ArrayList<SurveyAnswerDTO> saList;
	ArrayList<SurveyMultiChoiceDTO> smcList;


	private int totalAnswerCount; //총 대답한 사람
	
	public int getTotalAnswerCount() {
		return totalAnswerCount;
	}
	public void setTotalAnswerCount(int totalAnswerCount) {
		this.totalAnswerCount = totalAnswerCount;
	}
	public ArrayList<SurveyAnswerDTO> getSaList() {
		return saList;
	}
	public void setSaList(ArrayList<SurveyAnswerDTO> saList) {
		this.saList = saList;
	}
	public ArrayList<SurveyMultiChoiceDTO> getSmcList() {
		return smcList;
	}
	public void setSmcList(ArrayList<SurveyMultiChoiceDTO> smcList) {
		this.smcList = smcList;
	}
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getSurveySeq() {
		return surveySeq;
	}
	public void setSurveySeq(String surveySeq) {
		this.surveySeq = surveySeq;
	}
	public int getQuestionNumber() {
		return questionNumber;
	}
	public void setQuestionNumber(int questionNumber) {
		this.questionNumber = questionNumber;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public int getMultipleNum() {
		return multipleNum;
	}
	public void setMultipleNum(int multipleNum) {
		this.multipleNum = multipleNum;
	}
	public int getAnswerLimit() {
		return answerLimit;
	}
	public void setAnswerLimit(int answerLimit) {
		this.answerLimit = answerLimit;
	}
	public String getRequired() {
		return required;
	}
	public void setRequired(String required) {
		this.required = required;
	}
	public String getAnswerTypeSeq() {
		return answerTypeSeq;
	}
	public void setAnswerTypeSeq(String answerTypeSeq) {
		this.answerTypeSeq = answerTypeSeq;
	}
}
