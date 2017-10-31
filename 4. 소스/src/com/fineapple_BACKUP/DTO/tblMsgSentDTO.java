package com.fineapple.DTO;

public class tblMsgSentDTO {
	private int seq;
	private int sentEmployeeNum;
	private String title;
	private String content;
	private String sentDate;
	private String sentDelete;
	private String sentSave;
	
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public int getSentEmployeeNum() {
		return sentEmployeeNum;
	}
	public void setSentEmployeeNum(int sentEmployeeNum) {
		this.sentEmployeeNum = sentEmployeeNum;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getSentDate() {
		return sentDate;
	}
	public void setSentDate(String sentDate) {
		this.sentDate = sentDate;
	}
	public String getSentDelete() {
		return sentDelete;
	}
	public void setSentDelete(String sentDelete) {
		this.sentDelete = sentDelete;
	}
	public String getSentSave() {
		return sentSave;
	}
	public void setSentSave(String sentSave) {
		this.sentSave = sentSave;
	}
	
}


