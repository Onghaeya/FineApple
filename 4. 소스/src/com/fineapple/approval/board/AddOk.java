package com.fineapple.approval.board;

import java.io.IOException;

import javax.servlet.DispatcherType;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fineapple.DTO.ApprovalBoardDTO;

public class AddOk extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
																	throws ServletException, IOException {
		
		// 1. 데이터 가져오기
		//2. DB 작업(insert) -> DAO 위임
		//3. 결과 출력 -> JSP 위임 
		
		try {
			
			//1.
			req.setCharacterEncoding("UTF-8"); //한글 + POST
			
			String name = req.getParameter("name");
			String subject = req.getParameter("subject");
			String content = req.getParameter("content");
			String pw = req.getParameter("pw");
			
			// 2.
			ApprovalBoardDTO dto = new ApprovalBoardDTO();
			dto.setName(name);
			dto.setSubject(subject);
			dto.setContent(content);
			dto.setPw(pw);
			
			BoardDAO dao = new BoardDAO();
			int result = dao.add(dto);
			
			// 3. 
			req.setAttribute("result", result);

			RequestDispatcher dispatcher
					= req.getRequestDispatcher("/company/pages/approval/board/addok.jsp");
			dispatcher.forward(req, resp);	
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}//doPost
}//AddOk
