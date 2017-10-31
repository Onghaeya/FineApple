package com.fineapple.position;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fineapple.DTO.tblPositionBoardDTO;

public class List extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request
											, HttpServletResponse response) 
														throws ServletException, IOException {
		
		//1. DB 작업(select) -> DAO 위임
		//2. 반환된 목록을 JSP 에게 건네주면서 호출하기
		
		//1.
		TblPositionBoardDAO dao = new TblPositionBoardDAO();
		ArrayList<tblPositionBoardDTO> list = dao.list();
		
		//1.5 일부 데이터 조작
		for (tblPositionBoardDTO dto : list) {
			
			//최신글인지 검사?
			SimpleDateFormat format
				= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			 try {
				Date regdate = format.parse(dto.getRegDate());
				long regdateTick = regdate.getTime();//글쓴 시각의 tick
				
				long span = System.currentTimeMillis() - regdateTick;
				
			/*	//1시간 이내
				if ((span / 1000 / 60) < 60) {
					//System.out.println("최신글");
					dto.setNewimg("<img src='/JSPTest/board/images/new.png'>");
				} else {
					//System.out.println("오래된글");
					//dto.setNewimg("");
				}*/
				
			} catch (ParseException e) {
				e.printStackTrace();
			}
			
			
			//날짜 자르기
			dto.setRegDate(dto.getRegDate().substring(0, 10));
			
			
			//이름 + 제목은 태그 사용 불가능
			/*dto.setName(dto.getName().replace("<", "&lt;").replace(">", "&gt;"));*/
			dto.setSubject(dto.getSubject().replace("<", "&lt;").replace(">", "&gt;"));
			
			
			//제목 길면 자르기
			String subject = dto.getSubject();
			if (subject.length() > 30) {
				subject = subject.substring(0, 30) + "..";
				
			}
			dto.setSubject(subject);
			System.out.println(subject + "여기1");
		}
		
		
		
		
		
		//조회수 증가 방지 티켓
		//서블릿에서 세션 객체 얻는 방법
		HttpSession session = request.getSession();
		session.setAttribute("readcount", "n");
		
		
		
		System.out.println(list.size());
		//2.
		request.setAttribute("list", list);
		
		RequestDispatcher dispatcher
			= request.getRequestDispatcher("/company/pages/position/board/list.jsp");
		dispatcher.forward(request, response);		
		
	}
	
}













