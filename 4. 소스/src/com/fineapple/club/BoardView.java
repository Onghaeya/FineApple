package com.fineapple.club;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fineapple.DTO.ClubBoardDTO;

public class BoardView extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		System.out.println("BoardView.do");
		String realseq = req.getParameter("realseq");
		
		ClubBoardService service = new ClubBoardService(req.getSession());
		
		ClubBoardDTO dto = service.getBoardDTO(realseq);
		req.setAttribute("dto", dto);
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/company/pages/club/boardview.jsp");
		dispatcher.forward(req, resp);
		
	}
}