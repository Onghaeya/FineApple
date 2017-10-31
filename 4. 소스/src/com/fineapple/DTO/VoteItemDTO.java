package com.fineapple.DTO;

public class VoteItemDTO {
	private String seq;
	private String voteSeq;
	private String content;
	private int voteCount=0;
	
	
	
	public int getVoteCount() {
		return voteCount;
	}
	public void setVoteCount(int voteCount) {
		this.voteCount = voteCount;
	}
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getVoteSeq() {
		return voteSeq;
	}
	public void setVoteSeq(String voteSeq) {
		this.voteSeq = voteSeq;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}

	
}
