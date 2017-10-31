package com.fineapple.DTO;

public class OutcomeViewDTO {

	private String seq;
	private String name;
	private String regDate;
	private int amount;
	private String departmentSeq;
	private String category;
	private String status;	//etc
	private String empSeq;
	private String aSeq;	//계좌 유형
	private String department;	//부서이름
	private String respSeq;	//승인자 번호
	private String respName;	//승인자 이름
	private String conDate;	//승인일
	public String getConDate() {
		return conDate;
	}
	public void setConDate(String conDate) {
		this.conDate = conDate;
	}
	public String getRespSeq() {
		return respSeq;
	}
	public void setRespSeq(String respSeq) {
		this.respSeq = respSeq;
	}
	public String getRespName() {
		return respName;
	}
	public void setRespName(String respName) {
		this.respName = respName;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getaSeq() {
		return aSeq;
	}
	public void setaSeq(String aSeq) {
		this.aSeq = aSeq;
	}
	public String getEmpSeq() {
		return empSeq;
	}
	public void setEmpSeq(String empSeq) {
		this.empSeq = empSeq;
	}
	public String getStatus() {
		return status;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getDepartmentSeq() {
		return departmentSeq;
	}
	public void setDepartmentSeq(String departmentSeq) {
		this.departmentSeq = departmentSeq;
	}
}