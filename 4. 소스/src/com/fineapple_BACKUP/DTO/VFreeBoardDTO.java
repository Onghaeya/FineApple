package com.fineapple.DTO;

import java.util.ArrayList;

public class VFreeBoardDTO {

	private String seq;
	private String empSeq;
	private String name;
	private String fbCategorySeq;
	private String fbCategory;
	private String title;
	private String content;
	private int readCount;
	private String regDate;
	private String thread;
	private String depth;
	
	int gap;	
	String gapImg;
	
	String fileImg;
	
	ArrayList<FBFileDTO> fileList;
	
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getFbCategorySeq() {
		return fbCategorySeq;
	}
	public void setFbCategorySeq(String fbCategorySeq) {
		this.fbCategorySeq = fbCategorySeq;
	}
	public String getFbCategory() {
		return fbCategory;
	}
	public void setFbCategory(String fbCategory) {
		this.fbCategory = fbCategory;
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
	public int getReadCount() {
		return readCount;
	}
	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getThread() {
		return thread;
	}
	public void setThread(String thread) {
		this.thread = thread;
	}
	public String getDepth() {
		return depth;
	}
	public void setDepth(String depth) {
		this.depth = depth;
	}
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
	public String getFileImg() {
		return fileImg;
	}
	public void setFileImg(String fileImg) {
		this.fileImg = fileImg;
	}
	
}
