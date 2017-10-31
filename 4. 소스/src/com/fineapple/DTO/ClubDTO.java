package com.fineapple.DTO;

import java.util.ArrayList;

public class ClubDTO {
	private String seq;
	private String name;
	private String detail;
	private String categoryName;
	private String empName;
	private String department;
	private String openDate;
	private String clubimg;
	private ArrayList<ClubMemberDTO> memberList;
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
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public String getEmpName() {
		return empName;
	}
	public void setEmpName(String empName) {
		this.empName = empName;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getOpenDate() {
		return openDate;
	}
	public void setOpenDate(String openDate) {
		this.openDate = openDate;
	}
	public String getClubimg() {
		return clubimg;
	}
	public void setClubimg(String clubimg) {
		this.clubimg = clubimg;
	}
	public ArrayList<ClubMemberDTO> getMemberList() {
		return memberList;
	}
	public void setMemberList(ArrayList<ClubMemberDTO> memberList) {
		this.memberList = memberList;
	}
	
	@Override
	public String toString() {
		
		return seq+"/"+name+"/"+empName+"/"+detail+"/"+categoryName+"/"+department+"/"+openDate+"/"+clubimg+"\n";
	}
	
	
}
