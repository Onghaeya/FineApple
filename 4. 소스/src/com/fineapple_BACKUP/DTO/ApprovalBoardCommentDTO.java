package com.fineapple.DTO;
/**
 * 결재관련게시판 댓글 테이블의 데이터를 담는 DTO 클래스
 * @author 전슬기
 *
 */
public class ApprovalBoardCommentDTO {

	private String seq;
	private String empSeq;
	private String approvalBoardNum;
	private String regDate;
	private String content;
	private int thread;
	private int depth;
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
	public String getApprovalBoardNum() {
		return approvalBoardNum;
	}
	public void setApprovalBoardNum(String approvalBoardNum) {
		this.approvalBoardNum = approvalBoardNum;
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
	
	
	
}//approvalBoardCommentDTO
