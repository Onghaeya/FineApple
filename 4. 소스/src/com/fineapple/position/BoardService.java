package com.fineapple.position;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import com.fineapple.DTO.tblPositionBoardDTO;

//Controller - 최고 관리자
//Service - DAO의 작업이나 다른 객체의 작업을 총괄하기 위한 중간 관리자 
// DAO - 일꾼 
public class BoardService {

	/*private tblPositionBoardDTO dao;
	private HttpSession session;
	
	public BoardService() {
		this.dao = new tblPositionBoardDTO();		//미리 준비 
	}
	
	//스프링 -> 의존 주입(Dependency Injection)
	public BoardService(HttpSession session) {
		this.dao = new tblPositionBoardDTO();		//미리 준비 
		this.session = session;
	}
	
	//AddOk 서블릿이 글써달라고 요청 -> 서비스 객체 -> DAO 요청 
	public int add(tblPositionBoardDTO dto) {
		
		int thread = 0, depth = 0;
		
		//새글 or 답변글 -> thread, depth 계산 + 추가 
		if (dto.getReply().equals("n")) {
			//새글 쓰기
			//a. 현재 테이블에 존재하는 모든 thread 값 중에서 가장 큰 값을 찾아서 + 1000 한 값을 새글의 thread 값으로 사용한다. 
			//(단, 첫글에 한해서는 1000을 넣는다.)
			 thread = dao.getThread(); 
			
			//b. depth는 무조건 0을 넣는다.
			 depth = 0;
			
		} else {
			//답변글 쓰기 
			//a. 현재 테이블에 존재하는 모든 thread 값 중에서 답변글의 부모글 thread 값보다 작고 이전 새글의 thread 값보다 큰 모든 thread 값들을 -1 업데이트한다.
			
			//부모 thread
			int parentThread = dto.getThread();
			
			//이전 새글 thread 
			int prevThread = (int)Math.floor((parentThread -1) / 1000) * 1000;
			
			dao.updateThread(parentThread, prevThread);
			
			//b. 현재 작성중인 답변글의 thread 값은 부모글의 thread -1을 사용한다.
				thread = parentThread - 1;
			//c. 현재 작성중인 답변글의 depth 값은 부모글의 depth +1을 사용한다.
				depth = dto.getDepth() + 1;
		}
		
		dto.setThread(thread);
		dto.setDepth(depth);
		
		return dao.add(dto);
	}

	//List 서블릿이 글 목록을 달라고 요청
	public ArrayList<tblPositionBoardDTO> list(HashMap<String, String> map) {
		
		//dao -> 리스트 가공해서  -> Controller
		ArrayList<tblPositionBoardDTO> list = dao.list(map);
	
		// 모든 글 가져오기 -> 1개씩 뒤져서 목적에 맞는 처리 Loop
		for (tblPositionBoardDTO dto : list) {
			System.out.println("1");
			//1. 날짜 자르기
			String temp = dto.getRegDate().substring(0, 10);
			dto.setRegDate(temp); 		//긴날짜 -> 잛은 날짜 교체 

			//2. 제목이 길면 자르기 
			String subject = dto.getSubject();
			if (subject.length() > 30) {
				subject = subject.substring(0, 30) + "..";
			}
			dto.setSubject(subject); //교체 (덮어쓰기)
			//참조형이야 그래서 list.add(dto); 해줄필요 X
			
			//3. 새글인지 아닌지 판단하기  (60분 이내 새글)	
			if (dto.getGap() < 60) {
				//dto.setGapImg("<img src='/MVCTest/board/images/new.png'>");
				dto.setGapImg("<span class='label label-danger'>new</span>");
				//dto.setGapImg("<span class='glyphicon glyphicon-bell' style='color:orange;'></span>");				
			}
			
			
			//4. 
			dto.setName(dto.getName().replace("<", "&lt;"));
			dto.setSubject(dto.getSubject().replace("<", "&lt;"));
			
			
			//5. 조회수가 많으면 표시 
			if (dto.getReadCount() > 5) {
				dto.setHot("<spa class='label label-danger'>hot</span>");
			}
			
			//6. 제목으로 검색중이면 검색어 표시하기 
			if (map.get("isSearch").equals("y") && map.get("column").equals("subject")) {
				//안녕하세요 홍길동입니다.
				//안녕하세요. <span style='color:red; background-color:yellow;'>홍길동</span>입니다.
				dto.setSubject(dto.getSubject().replaceAll(map.get("word"), "<span style='color:red; background-color:yellow;'>" + map.get("word") + "</span>" ));
			}
			
			//7. 첨부 파일 표시하기 
			//System.out.println(dto.getFilename());
			if (dto.getFilename() != null) { 
				dto.setFileImg("<img src='/MVCTest/board/images/file.png'>");
			}
		}
		
		return list;
		//return dao.list();
	}

	
	// View 서블릿이 글 번호를 주면서 레코드 1개를 달라고 요청 
	public tblPositionBoardDTO get(String seq, HashMap<String, String> map) {

		//읽음 증가하기 
		if (session.getAttribute("read") != null && session.getAttribute("read").toString().equals("n")){
			dao.addReadCount(seq);
			session.setAttribute("read", "y");
		}
		
		//DTO 조작
		tblPositionBoardDTO dto = dao.get(seq);
		
		//1. 날짜 (.0 제거)
		dto.setRegDate(dto.getRegDate().substring(0,19));
		
		//3. 태그 적용 유무 처리
		String content = dto.getContent();

		if (dto.getTag().equals("n")) { //적용안함
			//<a> -> &lt;a&gt;
			content = content.replace("<", "&lt;").replace(">", "&gt;");
			dto.setContent(content);
		}
		
		//사용자 선택과 상관없이 <script> 모두 제거 
		content = content.replace("<script", "&lt;script");
		content = content.replace("</script", "&lt;/script");
		dto.setContent(content);
		
		//나머지 주관식 필도에도 캐그 미적용 처리 
		dto.setName(dto.getName().replace("<", "&lt;"));
		dto.setEmail(dto.getEmail().replace("<", "&lt;"));
		dto.setSubject(dto.getSubject().replace("<", "&lt;"));
		
		
		//2. 내용의 개행문자 처리
		content = content.replace("\r\n","<br>");
		dto.setContent(content);  	//뻬먹지 말것 
		
		//4. 내용에서 검색중일 때 검색어 표시하기
		//Short-Circuit 처리 
		if (map != null && map.get("isSearch").equals("y") && map.get("column").equals("content")) {
		dto.setContent(dto.getContent().replaceAll(map.get("word"), "<span style='color:red; background-color:yellow;'>" + map.get("word") + "</span>" ));
		}
		
		//return dao.get(seq);
		return dto;
	}

	//Edit 서블릿이 글 번호를 줄테니 레코드 1개를  다오 ..
	public tblPositionBoardDTO get2(String seq) {
		
		return dao.get(seq);	//재사용
	}
	
	//EditOk 서블릿이 DTO를 줄테니 글 수정 요청
	public int edit(tblPositionBoardDTO dto) {
		
		//암호를 검사한 뒤 수정 
		if (dao.check(dto)) { //글번호 + 기입한 암호 
			return dao.edit(dto); 	// 0을 반환 -> 입력 오류 -> history.back();
		} else {
			return 0; 	// 메시지를 띄우려면 2를 반환 -> 거기에 맞는 메시지 출력 -> location.href 으로 이동
		}
		
		//return dao.edit(dto);
	}

	// DelOk 서블릿이 글번호 + 암호 주면서 글 삭제해달라고 요청 
	public int del(tblPositionBoardDTO dto) {
		
		if (dao.check(dto)) { 
			//자식글 -> 부모글 
			dao.delCommentAll(dto.getSeq());
			
			return dao.del(dto); 	
		} else {
			return 0; 
		}
	}

	//AddCommentOk 서블릿이 댓글 줄테니 insert요청
	public int addComment(CommentDTO cdto) {
		
		//부모글의 commentCount + 1 추가 
		dao.updateCommentCount(cdto.getBseq(), 1);		//부모글번호, 증감치 
		
		return dao.addComment(cdto);
	}

	
	// View 서블릿이 글과 함께 댓글 목록도 달라고 요청 
	public ArrayList<CommentDTO> listComment(String seq) {
		return dao.listComment(seq);
	}

	//DelCommentOk 서블릿이 댓글 번호를 줄테니 삭제해달라고 요청
	public int delComment(String seq, String bseq) {
		

		//부모글의 commentCount - 1 추가 
		dao.updateCommentCount(bseq, -1);		//부모글번호, 증감치
		
		return dao.detComment(seq);
		
	}

	//List 서블릿이 총 게시물 수 달라고 요청 
	
	public int getTotalCount(HashMap<String, String> map) {
		return dao.getTotalCount(map);
	}

	//Download 서블릿이 글번호를 건내면서 다운로드 횟수가 증가해달라고 요청 
	public void addFileCount(String seq) {

		dao.addFileCount(seq);
		
	}
*/
}











