package com.fineapple.DTO;


public class AccountDTO {

	private String seq;
	private String name;
	private String aNumber;
	private int balance;
	private String regDate;
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
	public String getaNumber() {
		return aNumber;
	}
	public void setaNumber(String aNumber) {
		this.aNumber = aNumber;
	}
	public int getBalance() {
		return balance;
	}
	public void setBalance(int balance) {
		this.balance = balance;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
}
