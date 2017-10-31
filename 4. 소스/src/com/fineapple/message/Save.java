package com.fineapple.message;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Save extends HttpServlet {
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//1) 게시글 번호값 받기
		String[] str = req.getParameterValues("cbs");
		int boardnum = Integer.parseInt(req.getParameter("boardnum"));
		
		System.out.println(str.length);
		System.out.println("save boardnum: " + boardnum);
		
		//2) DB변경하기
		MessageService service = new MessageService();
		int result = service.save(str, boardnum);
		
		//3) 
		RequestDispatcher dispatcher = req.getRequestDispatcher("/company/pages/jaejun/save.jsp");
		dispatcher.forward(req, resp);
		
	}
}
