package com.fineapple.DTO;

public class ClubBoardDTO {
	private String seq;
	private String realSeq;
	private String title;
	private String fullTitle;
	private String content;
	private String name;
	private String regDate;
	private int readCount;
	private String fileName;
	private String orgFileName;
	private String gapImg; //최신글
	private String hot; //조회수 많은글
	private String fileImg;
	private int commentCount;
	private int gap;
	private String memberSeq;
	private String department;
	private String position;
	
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getFullTitle() {
		return fullTitle;
	}
	public void setFullTitle(String fullTitle) {
		this.fullTitle = fullTitle;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getOrgFileName() {
		return orgFileName;
	}
	public void setOrgFileName(String orgFileName) {
		this.orgFileName = orgFileName;
	}
	public String getGapImg() {
		return gapImg;
	}
	public void setGapImg(String gapImg) {
		this.gapImg = gapImg;
	}
	public String getHot() {
		return hot;
	}
	public void setHot(String hot) {
		this.hot = hot;
	}
	public String getFileImg() {
		return fileImg;
	}
	public void setFileImg(String fileImg) {
		this.fileImg = fileImg;
	}
	public int getCommentCount() {
		return commentCount;
	}
	public void setCommentCount(int commentCount) {
		this.commentCount = commentCount;
	}
	public int getGap() {
		return gap;
	}
	public void setGap(int gap) {
		this.gap = gap;
	}
	public String getRealSeq() {
		return realSeq;
	}
	public void setRealSeq(String realSeq) {
		this.realSeq = realSeq;
	}
	public int getReadCount() {
		return readCount;
	}
	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}
	public String getMemberSeq() {
		return memberSeq;
	}
	public void setMemberSeq(String memberSeq) {
		this.memberSeq = memberSeq;
	}
	
	
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return realSeq+"/"+title+"/"+content+"/"+regDate+"\n";
	}
}
