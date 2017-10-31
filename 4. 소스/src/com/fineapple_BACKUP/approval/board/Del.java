package com.fineapple.approval.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Del extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req
											, HttpServletResponse resp) 
														throws ServletException, IOException {
		
		//1. 데이터 받기
		//2. DB X
		//3. JSP 호출하기
		
		//1.
		String seq = req.getParameter("seq");
		
		
		//3.
		req.setAttribute("seq", seq);
		
		RequestDispatcher dispatcher
			= req.getRequestDispatcher("/company/pages/approval/board/del.jsp");
		dispatcher.forward(req, resp);		
		
	}
	
	
}//Del
