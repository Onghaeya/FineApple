package com.fineapple.position;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Sdel extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request
											, HttpServletResponse response) 
														throws ServletException, IOException {
		
		//1. 데이터 받기
		//2. DB X
		//3. JSP 호출하기
		
		//1.
		String seq = request.getParameter("seq");
		System.out.println(seq);
		
		//3.
		request.setAttribute("seq", seq);
		
		RequestDispatcher dispatcher
			= request.getRequestDispatcher("/company/pages/position/schedule/sdel.jsp");
		dispatcher.forward(request, response);		
		
	}
	
}














