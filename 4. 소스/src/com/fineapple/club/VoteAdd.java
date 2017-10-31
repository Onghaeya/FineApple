package com.fineapple.club;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class VoteAdd extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		System.out.println("boardadd.java");
		System.out.println("clubseq : "+req.getParameter("clubseq"));
		req.setAttribute("clubseq", req.getParameter("clubseq"));
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/company/pages/club/voteadd.jsp");
		dispatcher.forward(req, resp);
		
	}
	
}