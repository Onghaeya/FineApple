package com.fineapple.DTO;

import java.util.ArrayList;

public class FreeBoardDTO {
	private String seq;
	private String empSeq;
	private String FBCategory;
	private String title;
	private String content;
	private String regDate;
	private int readCount;
	private int thread;
	private int depth;

	ArrayList<FBFileDTO> fileList;
	
	int gap;	
	String gapImg;
	
	public int getGap() {
		return gap;
	}
	public void setGap(int gap) {
		this.gap = gap;
	}
	public String getGapImg() {
		return gapImg;
	}
	public void setGapImg(String gapImg) {
		this.gapImg = gapImg;
	}
	
	
	public ArrayList<FBFileDTO> getFileList() {
		return fileList;
	}
	public void setFileList(ArrayList<FBFileDTO> fileList) {
		this.fileList = fileList;
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
	public String getFBCategory() {
		return FBCategory;
	}
	public void setFBCategory(String fBCategory) {
		FBCategory = fBCategory;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
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
}
