package com.fineapple.club;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class VoteEditOk extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		System.out.println("VoteEditOk.java★☆☆★");
		
		String checkitem = req.getParameter("checkitem");
		String clubseq = req.getParameter("clubseq");
		String prechecked = req.getParameter("prechecked");
		
		ClubVoteService service = new ClubVoteService(req.getSession());
		
		int result = service.editVote(checkitem,prechecked,clubseq);
		
		req.setAttribute("result", result);
		req.setAttribute("clubseq", clubseq);
		RequestDispatcher dispatcher = req.getRequestDispatcher("/company/pages/club/voteeditok.jsp");
		dispatcher.forward(req, resp);
		
	}
	
}