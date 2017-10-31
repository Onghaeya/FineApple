package com.fineapple.message;

import java.util.ArrayList;

import com.fineapple.DTO.MsgReadDTO;
import com.fineapple.DTO.MsgSRDTO;
import com.fineapple.DTO.MsgSentDTO;

public class MessageService {

	private MessageDAO dao;
	
	public MessageService() {
		this.dao = new MessageDAO();//미리 준비
	}
	
	//받은쪽지함, Inbox.java
	public ArrayList<MsgSRDTO> list(int num) {
		ArrayList<MsgSRDTO> list = dao.list(num);
		for(MsgSRDTO dto : list){
			//날짜 자르기
			dto.setSentDate(dto.getSentDate().substring(0, 10));
			if(dto.getReadDate() != null){
				dto.setReadDate(dto.getReadDate().substring(0, 10));
			}
			
			//추가날짜 자르기
			/*
			dto.setSentDate(dto.getSentDate().substring(0, 10));
			if(dto.getReadDate() != null){
				dto.setReadDate(dto.getReadDate().substring(0, 10));
			}
			*/
			
			//제목 자르기
			String title = dto.getTitle();
			if (title.length() > 25) {
				title = title.substring(0, 25) + "...";
			}
			dto.setTitle(title);
		}
		
		return list;
	}

	//보낸쪽지함
	public ArrayList<MsgSRDTO> slist(int num) {
		ArrayList<MsgSRDTO> slist = dao.slist(num);

		for(MsgSRDTO dto : slist){
			// 날짜 자르기
			dto.setSentDate(dto.getSentDate().substring(0, 10));
			if(dto.getReadDate() != null){
				dto.setReadDate(dto.getReadDate().substring(0, 10));
			}
			
			//제목 자르기
			String title = dto.getTitle();
			if (title.length() > 25) {
				title = title.substring(0, 25) + "...";
			}
			dto.setTitle(title);
		}
		
		return slist;
	}

	//보관쪽지함
	public ArrayList<MsgSRDTO> plist(int num) {
		ArrayList<MsgSRDTO> plist = dao.plist(num);
		
		for(MsgSRDTO dto : plist){
			// 날짜 자르기
			dto.setSentDate(dto.getSentDate().substring(0, 10));
			if(dto.getReadDate() != null){
				dto.setReadDate(dto.getReadDate().substring(0, 10));
			}

			//제목 자르기
			String title = dto.getTitle();
			if (title.length() > 25) {
				title = title.substring(0, 25) + "...";
			}
			dto.setTitle(title);
		}
		
		return plist;
	}
	
	//업퍼헤더 출력
	public ArrayList<MsgSRDTO> upperlist(int num) {
		ArrayList<MsgSRDTO> upperlist = dao.upperlist(num);
		
		for(MsgSRDTO dto : upperlist){
			// 날짜 자르기
			dto.setSentDate(dto.getSentDate().substring(0, 10));
			// 제목 길면 짜르기
			String title = dto.getTitle();
			if (title.length() > 15) {
				title = title.substring(0, 15) + "...";
			}
			dto.setTitle(title);
			
			String content = dto.getContent();
			if (content.length() > 35) {
				content = content.substring(0, 35) + "...";
			}
			dto.setContent(content);
		}
		
		return upperlist;
	}
	
	public int sAdd(MsgSentDTO sdto) {
		return dao.sAdd(sdto);
	}

	public int rAdd(MsgReadDTO rdto) {
		return dao.rAdd(rdto);
	}

	public ArrayList<MsgSRDTO> view(String sseq, String rseq, int num) {
		ArrayList<MsgSRDTO> viewlist = dao.viewlist(sseq, rseq, num);
		return viewlist;
	}

	public ArrayList<MsgSRDTO> popupview(String sseq, String rseq, int num) {
		ArrayList<MsgSRDTO> pviewlist = dao.pviewlist(sseq, rseq, num);
		return pviewlist;
	}

	public int save(String[] str, int boardnum) {
		return dao.save(str, boardnum);
	}

	public int del(String[] str, int boardnum, int num) {
		return dao.del(str, boardnum, num);
	}

	public String addgetname(int readEmployeeNum) {
		return dao.addgetname(readEmployeeNum);
	}

	public int rollbackAdd(MsgReadDTO rdto) {
		return dao.rollbackAdd(rdto);
	}
	
}

