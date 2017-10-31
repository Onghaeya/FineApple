package com.fineapple.DTO;
/**
 * 결재 게시판 테이블(ApprovalBoard)의 데이터를 담는 DTO 클래스
 * @author 전슬기
 *
 */
public class ApprovalBoardDTO {
	private String seq;
	private String appovalCategoryNum;
	private String subject;
	private String regDate;
	private String content;
	private int readCount;
	private int thread;
	private int depth;
	private String empNum;
	private String name;
	private String pw;
	
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getAppovalCategoryNum() {
		return appovalCategoryNum;
	}
	public void setAppovalCategoryNum(String appovalCategoryNum) {
		this.appovalCategoryNum = appovalCategoryNum;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getReadCount() {
		return readCount;
	}
	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}
	public int getThread() {
		return thread;
	}
	public void setThread(int thread) {
		this.thread = thread;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	public String getEmpNum() {
		return empNum;
	}
	public void setEmpNum(String empNum) {
		this.empNum = empNum;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}

	
	
}//ApprovalBoard
