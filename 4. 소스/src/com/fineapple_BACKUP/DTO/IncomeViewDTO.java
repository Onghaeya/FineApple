package com.fineapple.DTO;

public class IncomeViewDTO {
	
	private String seq;	//Income 번호
	private String empSeq;	//작성자 사번
	private String regDate;	//작성일
	private String goods;	//물품
	private int units;	//수량
	private int amount;	//금액
	private String confirm;	//승인여부
	private String name;	//작성자 이름
	private String departmentSeq;	//부서번호
	private String category;	//카테고리 이름
	private String aSeq;	//계좌유형
	private String department;	//부서이름
	private String respSeq;	//승인자 사번
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
	private String respName;	//승인자 이름
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
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getEmpSeq() {
		return empSeq;
	}
	public void setEmpSeq(String empSeq) {
		this.empSeq = empSeq;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getGoods() {
		return goods;
	}
	public void setGoods(String goods) {
		this.goods = goods;
	}
	public int getUnits() {
		return units;
	}
	public void setUnits(int units) {
		this.units = units;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getConfirm() {
		return confirm;
	}
	public void setConfirm(String confirm) {
		this.confirm = confirm;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDepartmentSeq() {
		return departmentSeq;
	}
	public void setDepartmentSeq(String departmentSeq) {
		this.departmentSeq = departmentSeq;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
}
