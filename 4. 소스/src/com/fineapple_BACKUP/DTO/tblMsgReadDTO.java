package com.fineapple.DTO;

public class tblMsgReadDTO {
	private int seq;
	private int msgNumber;
	private int readEmployeeNum;
	private String readDate;
	private String readDelete;
	private String readSave;
	
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
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


