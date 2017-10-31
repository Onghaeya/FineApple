package com.fineapple.DTO;

public class VoteJoinerDTO {
	private String seq;
	private String itemSeq;
	private String memberSeq;
	private String regDate;
	
	
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}

	public String getMemberSeq() {
		return memberSeq;
	}
	public void setMemberSeq(String memberSeq) {
		this.memberSeq = memberSeq;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {	
		this.regDate = regDate;
	}
	public String getItemSeq() {
		return itemSeq;
	}
	public void setItemSeq(String itemSeq) {
		this.itemSeq = itemSeq;
	}
	
	
}
