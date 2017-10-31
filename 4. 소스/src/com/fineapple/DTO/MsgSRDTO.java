package com.fineapple.DTO;

public class MsgSRDTO {
	private int sseq;
	private int sentEmployeeNum;
	private String title;
	private String content;
	private String sentDate;
	private String sentDelete;
	private String sentSave;
	
	private int rseq;
	private int msgNumber;
	private int readEmployeeNum;
	private String readDate;
	private String readDelete;
	private String readSave;
	
	private String addedsentDate;
	private String addedreadDate;
	private String addedsentEmployeeName;
	private String addedreadEmployeeName;
	
	public String getAddedsentDate() {
		return addedsentDate;
	}
	public void setAddedsentDate(String addedsentDate) {
		this.addedsentDate = addedsentDate;
	}
	public String getAddedreadDate() {
		return addedreadDate;
	}
	public void setAddedreadDate(String addedreadDate) {
		this.addedreadDate = addedreadDate;
	}
	public String getAddedsentEmployeeName() {
		return addedsentEmployeeName;
	}
	public void setAddedsentEmployeeName(String addedsentEmployeeName) {
		this.addedsentEmployeeName = addedsentEmployeeName;
	}
	public String getAddedreadEmployeeName() {
		return addedreadEmployeeName;
	}
	public void setAddedreadEmployeeName(String addedreadEmployeeName) {
		this.addedreadEmployeeName = addedreadEmployeeName;
	}
	
	public int getSseq() {
		return sseq;
	}
	public void setSseq(int sseq) {
		this.sseq = sseq;
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
	public int getRseq() {
		return rseq;
	}
	public void setRseq(int rseq) {
		this.rseq = rseq;
	}
	public int getMsgNumber() {
		return msgNumber;
	}
	public void setMsgNumber(int msgNumber) {
		this.msgNumber = msgNumber;
	}
	public int getReadEmployeeNum() {
		return readEmployeeNum;
	}
	public void setReadEmployeeNum(int readEmployeeNum) {
		this.readEmployeeNum = readEmployeeNum;
	}
	public String getReadDate() {
		return readDate;
	}
	public void setReadDate(String readDate) {
		this.readDate = readDate;
	}
	public String getReadDelete() {
		return readDelete;
	}
	public void setReadDelete(String readDelete) {
		this.readDelete = readDelete;
	}
	public String getReadSave() {
		return readSave;
	}
	public void setReadSave(String readSave) {
		this.readSave = readSave;
	}
	
	
}
