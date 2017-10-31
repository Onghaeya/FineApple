package com.fineapple.approval.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Add extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 사용자의 원래 요청을 다른 서블릿이나 JSP에 전달하는 작업 
		// forward 방식 : 서블릿을 거쳐서 이동 ex)A.jsp -> Servlet -> B.jsp
		RequestDispatcher dispatcher = req.getRequestDispatcher("/company/pages/approval/board/add.jsp");
		dispatcher.forward(req, resp);
		
	}
	
}















