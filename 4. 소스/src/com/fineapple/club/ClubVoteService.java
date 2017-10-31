package com.fineapple.club;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import com.fineapple.DTO.ClubVoteDTO;
import com.fineapple.DTO.SimpleEmpVO;
import com.fineapple.DTO.VoteItemDTO;
import com.fineapple.DTO.VoteJoinerDTO;

public class ClubVoteService {
	private ClubVoteDAO dao;
	private HttpSession session;

	public ClubVoteService() {
		this.dao = new ClubVoteDAO();// 미리 준비
	}

	// 스프링 -> 의존 주입(Dependency Injection)
	public ClubVoteService(HttpSession session) {
		this.dao = new ClubVoteDAO();// 미리 준비
		this.session = session;
	}

	public ArrayList<ClubVoteDTO> getVoteList(String clubSeq) {

		ArrayList<ClubVoteDTO> list = dao.getVoteList(clubSeq);
		for (ClubVoteDTO dto : list) {
			// 투표 글 등록한 시간, 투표글 마감시간 텍스트 조정
			dto.setDateText("분 전");
			if (dto.getGap() >= 60) {
				dto.setGap((int) dto.getGap() / 60);
				dto.setDateText("시간 전");
				if (dto.getGap() >= 24) {
					dto.setGap((int) dto.getGap() / 24);
					dto.setDateText("일 전");
				}
			}
			if (dto.getGap2() >= 0) {
				dto.setProcessText("투표 진행 중");
				if (dto.getGap2() <= 1) {
					dto.setProcessText("투표 마감 임박");
				}
			} else {
				dto.setProcessText("투표 완료");
			}
			dto.setJoiners(new ArrayList<VoteJoinerDTO>());
			
			// 투표 참여한 사람 수를 받아오기위해.. votejoiner 테이블에 접근
			if (dao.getVoteJoinerList(dto.getSeq()) != null) {

				for (VoteJoinerDTO vjdto : dao.getVoteJoinerList(dto.getSeq())) {
					dto.getJoiners().add(vjdto);
				}
				
			}

		}

		return list;
	}

	public ClubVoteDTO getOneVote(String seq, String clubseq) {

		ClubVoteDTO dto = dao.getOneVote(seq);
		
		System.out.println(seq);
		// 투표 항목 받아오기
		ArrayList<VoteItemDTO> itemlist = dao.getVoteItems(seq);
		//System.out.println("투표항목"+itemlist.get(0).getContent());
		dto.setItems(itemlist);
		
		
		// 투표참여자 받아오기
		ArrayList<VoteJoinerDTO> joinerlist = dao.getVoteJoiners(seq);
		dto.setJoiners(joinerlist);
		
		// 투표 항목당 인원수 체크
		for(VoteJoinerDTO temp : joinerlist) {
			for(VoteItemDTO item : dto.getItems()) {
				if(temp.getItemSeq().equals(item.getSeq())) {
					item.setVoteCount(item.getVoteCount()+1);
				
				}
			}
		}
		

		// 투표 글 등록한 시간, 투표글 마감시간 텍스트 조정
		dto.setDateText("분 전");
		if (dto.getGap() >= 60) {
			dto.setGap((int) dto.getGap() / 60);
			dto.setDateText("시간 전");
			if (dto.getGap() >= 24) {
				dto.setGap((int) dto.getGap() / 24);
				dto.setDateText("일 전");
			}
		}
		// 1. 날짜(2017.9.25 오후 03:48)
		String regDate = dto.getEndDate().replace("-", ".");
		if (Integer.parseInt(regDate.substring(11, 13)) > 12) {
			regDate = regDate.substring(0, 11) + "오후 " + (Integer.parseInt(regDate.substring(11, 13)) - 12)
					+ regDate.substring(13, 16);
		} else {
			regDate = regDate.substring(0, 11) + "오전 " + regDate.substring(11, 16);
		}
		if (regDate.charAt(5) == '0') {
			regDate = regDate.substring(0, 5) + regDate.substring(6);
		}

		dto.setEndDate(regDate);
		
		//개행문자처리
		dto.setTitle(dto.getTitle().replace("<", "&lt;"));
		
		//등록자 정보 받아오기
		SimpleEmpVO vo = dao.getEmpInfo(dto.getWriterSeq());
		dto.setWritervo(vo);
		
		return dto;
	}

	public int playVote(String item, String clubseq) {

		String empSeq=session.getAttribute("seq").toString();
		
		int result = dao.insertVote(item,clubseq,empSeq);
		//투표하기!
		
		
		
		return result;
	}

	public int getVoteSeq(String clubseq, String voteseq) {

		String empseq=session.getAttribute("seq").toString();
		
		int result = dao.getVoteSeq(clubseq, voteseq, empseq);
		
		
		
		return result;
	}

	public int editVote(String checkitem, String prechecked, String clubseq) {

		String empseq=session.getAttribute("seq").toString();
		
		int result = dao.editVote(clubseq, prechecked, checkitem, empseq);
		
		
		return result;
	}

	public int addNewVote(String title, String[] items, String endDate, String clubseq) {
		
		String empseq = session.getAttribute("seq").toString();
		String voteseq = dao.addNewVote(title,clubseq,endDate,empseq);
		
		int result=0;
		for(String item : items) {
			result=dao.addNewVoteItem(voteseq,item);
			if(result==0) break;
		}
		
		return result;
	}

}
