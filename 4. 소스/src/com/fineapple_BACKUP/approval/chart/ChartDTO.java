package com.fineapple.approval.chart;

import java.util.ArrayList;

public class ChartDTO {

	private String seq;
	private String approvalcategoryname;
	private ArrayList<ChartSubDTO> data;
	
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getApprovalcategoryname() {
		return approvalcategoryname;
	}
	public void setApprovalcategoryname(String approvalcategoryname) {
		this.approvalcategoryname = approvalcategoryname;
	}
	public ArrayList<ChartSubDTO> getData() {
		return data;
	}
	public void setData(ArrayList<ChartSubDTO> data) {
		this.data = data;
	}
	
}//ChartSubDTO
