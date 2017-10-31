package com.fineapple.position.chart;

import java.util.ArrayList;

public class PSChartDTO {

	private String seq;
	private String categorySeq;
	private String subject;
	private String empSeq;
	private String content;
	private String place;
	private String startDate;
	private String endDate;
	private String positionSeq;
	private String open;
	private int alarm;
	

	public String getCategorySeq() {
		return categorySeq;
	}
	public void setCategorySeq(String categorySeq) {
		this.categorySeq = categorySeq;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getEmpSeq() {
		return empSeq;
	}
	public void setEmpSeq(String empSeq) {
		this.empSeq = empSeq;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
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
	public String getPositionSeq() {
		return positionSeq;
	}
	public void setPositionSeq(String positionSeq) {
		this.positionSeq = positionSeq;
	}
	public String getOpen() {
		return open;
	}
	public void setOpen(String open) {
		this.open = open;
	}
	public int getAlarm() {
		return alarm;
	}
	public void setAlarm(int alarm) {
		this.alarm = alarm;
	}
	
	
	private String name;
	
	//private int data2010;
	//private int data2011;
	//....
	
	private ArrayList<PsChartSubDTO> data;

	public String getSeq() {
		return seq;
	}

	public void setSeq(String seq) {
		this.seq = seq;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public ArrayList<PsChartSubDTO> getData() {
		return data;
	}

	public void setData(ArrayList<PsChartSubDTO> data) {
		this.data = data;
	}
	
	
}
