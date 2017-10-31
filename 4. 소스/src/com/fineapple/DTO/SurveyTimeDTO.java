package com.fineapple.DTO;

import java.util.ArrayList;

public class SurveyTimeDTO {
	private String surveySeq;
	private String regDate;
	private int count;
	
	ArrayList<String> names;
	
	public ArrayList<String> getNames() {
		return names;
	}

	public void setNames(ArrayList<String> names) {
		this.names = names;
	}

	public String getSurveySeq() {
		return surveySeq;
	}

	public void setSurveySeq(String surveySeq) {
		this.surveySeq = surveySeq;
	}

	
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}
	
}
