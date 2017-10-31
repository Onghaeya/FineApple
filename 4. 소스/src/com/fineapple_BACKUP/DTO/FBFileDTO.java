package com.fineapple.DTO;

public class FBFileDTO {
	private String seq;
	private String FBSeq;
	private String orgFileName;
	private String fileName;
	private String extension;
	
	public String getExtension() {
		return extension;
	}
	public void setExtension(String extension) {
		this.extension = extension;
	}
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getFBSeq() {
		return FBSeq;
	}
	public void setFBSeq(String fBSeq) {
		FBSeq = fBSeq;
	}
	public String getOrgFileName() {
		return orgFileName;
	}
	public void setOrgFileName(String orgFileName) {
		this.orgFileName = orgFileName;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
}
