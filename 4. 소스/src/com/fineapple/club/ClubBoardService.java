package com.fineapple.club;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import com.fineapple.DTO.ClubBoardDTO;

public class ClubBoardService {
	ClubBoardDAO dao;
	HttpSession session;

	public ClubBoardService() {
		this.dao = new ClubBoardDAO();
	}

	public ClubBoardService(HttpSession session) {
		this.dao = new ClubBoardDAO();
		this.session = session;
	}

	public ArrayList<ClubBoardDTO> getList(String seq) {

		ArrayList<ClubBoardDTO> list = dao.getList(seq);

		// 모든 글 가져오기 -> 1개씩 뒤져서 목적에 맞는 처리 Loop
		for (ClubBoardDTO dto : list) {

			// 0. 새글인지 판단하기(날짜 자르기 전에)
			if (dto.getGap() < 60) { // 글쓴지 한시간 이내라면 새 글
				/*
				 * dto.setGapImg("<img src='/MVCTest/board/images/new.png'>");
				 */
				dto.setGapImg("<span class='label label-warning'>N</span>");
				/*
				 * dto.
				 * setGapImg("<span class='glyphicon glyphicon-bell' style='color: orange;'></span>"
				 * );
				 */
			}

			// 1. 날짜 자르기
			String temp = dto.getRegDate().substring(0, 10);
			dto.setRegDate(temp); // 긴날짜 -> 짧은 날짜 교체

			// 2. 제목이 길면 자르기
			String title = dto.getTitle();

			if (title.length() > 30) {
				title = title.substring(0, 25) + "..";
			}
			dto.setTitle(title);

			// //4. 태그 적용 못하게하기
			// dto.setName(dto.getName().replace("<", "&lt;"));
			// dto.setSubject(dto.getSubject().replace("<", "&lt;"));
			//
			// //5. 조회수가 많으면 표시하기
			// if (dto.getReadCount() > 5) {
			// dto.setHot("<span class='label label-danger'>hot</span>");
			// }
			//
			// //6. 제목으로 검색중이면 검색어 표시하기
			// if (map.get("isSearch").equals("y")
			// && map.get("column").equals("subject")) {
			// //안녕하세요. <span style='color: red; background-color:
			// yellow;>홍길동</span>입니다.
			// dto.setSubject(dto.getSubject().replace(map.get("word")
			// , "<span style='color: red; background-color: yellow;'>" +
			// map.get("word") + "</span>"));
			// }
			//
			// //7. 첨부 파일 있으면 표시하기
			// if (dto.getFilename() != null) {
			// dto.setFileImg("<img src='/MVCTest/board/images/file.png'>");
			// }

		}

		return list;
	}

	public ClubBoardDTO getBoardDTO(String realseq) {

		// 조회수 증가
		if (session.getAttribute("read") != null && session.getAttribute("read").toString().equals("n")) {

			dao.addReadCount(realseq);
			session.setAttribute("read", "y");
		}
		ClubBoardDTO dto = dao.getBoardDTO(realseq);

//		// 1. 날짜(2017.9.25 오후 03:48)
		String regDate = dto.getRegDate().replace("-", ".");
		if(Integer.parseInt(regDate.substring(11,13))>12){
			regDate=regDate.substring(0,11)+"오후 "
					+(Integer.parseInt(regDate.substring(11,13))-12)
					+regDate.substring(13,16);
		}else{
			regDate=regDate.substring(0,11)+"오전 "+regDate.substring(11,16);
		}
		if(regDate.charAt(5)=='0'){
			regDate=regDate.substring(0, 5)+regDate.substring(6);
		}
		
		dto.setRegDate(regDate);
		System.out.println(dto.toString());
		// 3. 태그 적용 유무 처리
		// 위에 올린 이유는 2 이후에 실행하면 br 태그까지 바꿔버린다.
		String content = dto.getContent();

		content = content.replace("<", "&lt;").replace(">", "&gt;");
		dto.setContent(content);

		// 사용자의 선택과 상관없이 <script> 모두 제거(보안상)
		content = content.replace("<script", "&lt;script");
		content = content.replace("</script", "&lt;/script");

		// 나머지 주관식 필드(제목, 이메일..)도 태그 미적용 처리
		dto.setName(dto.getName().replace("<", "&lt;"));
		dto.setTitle(dto.getTitle().replace("<", "&lt;"));

		// 2. 내용의 개행 문자 처리
		content = content.replace("\r\n", "<br>");
		dto.setContent(content);
		
		return dto;
	}

	public int add(HashMap<String, String> map) {
		
		return dao.add(map);
		
	}

}
