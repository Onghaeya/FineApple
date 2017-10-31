package com.fineapple.all;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Login extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		//로그인 완성되면 지운다
		HttpSession session = req.getSession();
		session.setAttribute("seq", "10");
		session.setAttribute("pw", "1111");
		session.setAttribute("department", "개발부");
		session.setAttribute("departmentSeq", 1);
		session.setAttribute("position", "사장");
		session.setAttribute("positionSeq", 1);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/company/pages/all/login.jsp");
		dispatcher.forward(req, resp);
		
		
	}
	
}

