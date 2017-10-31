package com.fineapple.club;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class VoteOk extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		System.out.println("보트오케이.java");
		//System.out.println(req.getParameter("checkitem"));
		//System.out.println(req.getParameter("clubseq"));
		
		String item = req.getParameter("checkitem");
		String clubseq = req.getParameter("clubseq");
		ClubVoteService service = new ClubVoteService(req.getSession());
		int result = service.playVote(item,clubseq);
		
		req.setAttribute("clubseq", clubseq);
		req.setAttribute("result", result);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/company/pages/club/voteok.jsp");
		
		dispatcher.forward(req, resp);
			
	}
	
}
