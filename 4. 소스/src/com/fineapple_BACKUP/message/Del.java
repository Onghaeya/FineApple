package com.fineapple.message;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Del extends HttpServlet {
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();
		int num = (int)session.getAttribute("num");

		//1) 게시글 번호값 받기
		String[] str = req.getParameterValues("cbs");
		int boardnum = Integer.parseInt(req.getParameter("boardnum"));
		
		System.out.println(str.length);
		System.out.println("del boardnum: " + boardnum);
		
		//2) DB변경하기
		MessageService service = new MessageService();
		int result = service.del(str, boardnum, num);
		req.setAttribute("boardnum", boardnum);
		
		//3) 
		RequestDispatcher dispatcher = req.getRequestDispatcher("/company/pages/jaejun/del.jsp");
		dispatcher.forward(req, resp);
		
	}
}

