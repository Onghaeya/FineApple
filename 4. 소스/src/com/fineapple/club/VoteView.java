package com.fineapple.club;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fineapple.DTO.ClubVoteDTO;
import com.fineapple.DTO.VoteItemDTO;

public class VoteView extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		System.out.println("--voteView.java--");
		
		String seq=req.getParameter("seq");//voteSequence
		String clubseq=req.getParameter("clubseq"); //clubseq
		
		ClubVoteService service = new ClubVoteService(req.getSession());
		//내가 등록한글인지 아닌지 때문에 필요할거같음;
	
		ClubVoteDTO dto = service.getOneVote(seq, clubseq);
		//투표글 하나에대한 정보를 받아온다.
		
		
		int voteseq = service.getVoteSeq(clubseq, seq);
		//내가 투표햇냐 안햇냐
		
		req.setAttribute("dto", dto);
		req.setAttribute("clubseq", clubseq);
	
		req.setAttribute("empSeq",req.getSession().getAttribute("seq"));
		if(voteseq==0) {
			RequestDispatcher dispatcher = req.getRequestDispatcher("/company/pages/club/voteview.jsp");
			dispatcher.forward(req, resp);
		}else {
			req.setAttribute("voteseq", voteseq);
			RequestDispatcher dispatcher = req.getRequestDispatcher("/company/pages/club/voteview2.jsp");
			dispatcher.forward(req, resp);
		}
		
	}
	
}