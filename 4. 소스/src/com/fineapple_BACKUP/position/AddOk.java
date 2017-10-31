package com.fineapple.position;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fineapple.DTO.tblPositionBoardDTO;

public class AddOk extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest request
											, HttpServletResponse response) 
														throws ServletException, IOException {
		
		//1. 데이터 받기
		//2. DB 작업 -> DAO 위임
		//3. JSP 호출하기 -> 완료 메시지
		
		//1.
		request.setCharacterEncoding("UTF-8");
		
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		String tag = request.getParameter("tag");
		String pw = request.getParameter("pw");
		String userip = request.getRemoteAddr().toString().replace("0:0:0:0:0:0:0:1", "127.0.0.1");
		
		//2.
		tblPositionBoardDTO dto = new tblPositionBoardDTO();
		//dto.setName(name);
		//dto.setEmail(email);
		dto.setSubject(subject);
		dto.setContent(content);
		//dto.setTag(tag);
		//dto.setPw(pw);
		//dto.setUserip(userip);
		
		TblPositionBoardDAO dao = new TblPositionBoardDAO();
		int result = dao.add(dto);
		
		
		//3.
		request.setAttribute("result", result);
		
		RequestDispatcher dispatcher
			= request.getRequestDispatcher("/company/pages/position/board/addok.jsp");
		dispatcher.forward(request, response);		
		
	}
	
}













