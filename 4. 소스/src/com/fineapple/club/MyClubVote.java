package com.fineapple.club;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fineapple.DTO.ClubVoteDTO;

public class MyClubVote extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		System.out.println("MyClubVote.java");
		HttpSession session = req.getSession();
		
		String clubSeq= req.getParameter("clubseq");
		ClubVoteService service = new ClubVoteService(session);
		
		ArrayList<ClubVoteDTO> list = service.getVoteList(clubSeq);
		
		System.out.println(list.toString());
		
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("MM/dd/yyyy");

		
		req.setAttribute("clubseq", clubSeq);
		req.setAttribute("list", list);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/company/pages/club/myclubvote.jsp");
		dispatcher.forward(req, resp);
		
	}
	
}
