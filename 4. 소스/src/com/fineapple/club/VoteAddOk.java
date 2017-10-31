package com.fineapple.club;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class VoteAddOk extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		System.out.println("voteaddok.java");
		req.setCharacterEncoding("UTF-8");
		String title=req.getParameter("title");
		String items[]=req.getParameterValues("item");
		String endDate=	req.getParameter("endDate");
	
		String clubseq=req.getParameter("clubseq");
		
		//System.out.println(title+"/"+items[0]+"/"+items[1]+"/"+endDate);
		
		ClubVoteService service = new ClubVoteService(req.getSession());
		int result = service.addNewVote(title,items,endDate,clubseq);
				
		
		req.setAttribute("clubseq", clubseq);
		req.setAttribute("result", result);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/company/pages/club/voteaddok.jsp");
		dispatcher.forward(req, resp);
		
	}
	
}