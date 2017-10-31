package com.fineapple.DTO;

import java.util.ArrayList;

public class ClubVoteDTO {
	private String seq;
	private String writer;
	private String title;
	private int gap;
	private int gap2;
	private String startDate;
	private String endDate;
	private String isOverlap;
	private String isAnonymous;
	private String isAddItem;
	private String voteCategory;
	private ArrayList<VoteItemDTO> items;
	private ArrayList<VoteJoinerDTO> joiners;
	private String dateText;
	private String processText;
	private String writerSeq;
	private SimpleEmpVO writervo;
		
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getGap() {
		return gap;
	}
	public void setGap(int gap) {
		this.gap = gap;
	}
	public int getGap2() {
		return gap2;
	}
	public void setGap2(int gap2) {
		this.gap2 = gap2;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getIsOverlap() {
		return isOverlap;
	}
	public void setIsOverlap(String isOverlap) {
		this.isOverlap = isOverlap;
	}
	public String getIsAnonymous() {
		return isAnonymous;
	}
	public void setIsAnonymous(String isAnonymous) {
		this.isAnonymous = isAnonymous;
	}
	public String getIsAddItem() {
		return isAddItem;
	}
	public void setIsAddItem(String isAddItem) {
		this.isAddItem = isAddItem;
	}
	public String getVoteCategory() {
		return voteCategory;
	}
	public void setVoteCategory(String voteCategory) {
		this.voteCategory = voteCategory;
	}
	public ArrayList<VoteItemDTO> getItems() {
		return items;
	}
	public void setItems(ArrayList<VoteItemDTO> items) {
		this.items = items;
	}
	public ArrayList<VoteJoinerDTO> getJoiners() {
		return joiners;
	}
	public void setJoiners(ArrayList<VoteJoinerDTO> joiners) {
		this.joiners = joiners;
	}
	public String getDateText() {
		return dateText;
	}
	public void setDateText(String dateText) {
		this.dateText = dateText;
	}
	public String getProcessText() {
		return processText;
	}
	public void setProcessText(String processText) {
		this.processText = processText;
	}
	
	@Override
	public String toString() {
		return seq+" / "+writer+" / "+title+"\n";
	}
	public String getWriterSeq() {
		return writerSeq;
	}
	public void setWriterSeq(String writerSeq) {
		this.writerSeq = writerSeq;
	}
	public SimpleEmpVO getWritervo() {
		return writervo;
	}
	public void setWritervo(SimpleEmpVO writervo) {
		this.writervo = writervo;
	}
	
	
}
