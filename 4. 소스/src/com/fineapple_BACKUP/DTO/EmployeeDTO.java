package com.fineapple.DTO;

public class EmployeeDTO {
	private String seq;
	private String name;
	private String jumin;
	private String pw;
	private String cellphone;
	private String email;
	private String firstDate;
	private String endDate;
	private int payment;
	private String departmentSeq;
	private String positionSeq;
	private String pwHint;
	private String pwAnswer;
	private String gender;
	private String phone;
	private String profilePic;
	private String task;
	private String bank;
	private String bankAccount;
	
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
	public String getJumin() {
		return jumin;
	}
	public void setJumin(String jumin) {
		this.jumin = jumin;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getCellphone() {
		return cellphone;
	}
	public void setCellphone(String cellphone) {
		this.cellphone = cellphone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getFirstDate() {
		return firstDate;
	}
	public void setFirstDate(String firstDate) {
		this.firstDate = firstDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public int getPayment() {
		return payment;
	}
	public void setPayment(int payment) {
		this.payment = payment;
	}
	public String getDepartmentSeq() {
		return departmentSeq;
	}
	public void setDepartmentSeq(String departmentSeq) {
		this.departmentSeq = departmentSeq;
	}
	public String getPositionSeq() {
		return positionSeq;
	}
	public void setPositionSeq(String positionSeq) {
		this.positionSeq = positionSeq;
	}
	public String getPwHint() {
		return pwHint;
	}
	public void setPwHint(String pwHint) {
		this.pwHint = pwHint;
	}
	public String getPwAnswer() {
		return pwAnswer;
	}
	public void setPwAnswer(String pwAnswer) {
		this.pwAnswer = pwAnswer;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getProfilePic() {
		return profilePic;
	}
	public void setProfilePic(String profilePic) {
		this.profilePic = profilePic;
	}
	public String getTask() {
		return task;
	}
	public void setTask(String task) {
		this.task = task;
	}
	public String getBank() {
		return bank;
	}
	public void setBank(String bank) {
		this.bank = bank;
	}
	public String getBankAccount() {
		return bankAccount;
	}
	public void setBankAccount(String bankAccount) {
		this.bankAccount = bankAccount;
	}
	
	@Override
	public String toString() {
		System.out.println(seq);
		System.out.println();
		System.out.println(name);
		System.out.println();
		System.out.println(jumin);
		System.out.println();
		System.out.println(pw);
		System.out.println();
		System.out.println(cellphone);
		System.out.println();
		System.out.println(firstDate);
		System.out.println();
		System.out.println(payment);
		return super.toString();
	}
	
}
