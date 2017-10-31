package com.fineapple.club;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fineapple.DTO.ClubBoardDTO;



public class MyClubBoard extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//System.out.println("hi");
		ClubBoardService service = new ClubBoardService();
		//System.out.println(req.getParameter("clubseq"));
		ArrayList<ClubBoardDTO> boardlist = new ArrayList<ClubBoardDTO>();
		
		boardlist = service.getList(req.getParameter("clubseq"));
		
		System.out.println("넘어오나 "+req.getAttribute("templist"));
		
		req.setAttribute("boardlist", boardlist);
		req.setAttribute("clubseq", req.getParameter("clubseq"));
		RequestDispatcher dispatcher = req.getRequestDispatcher("/company/pages/club/myclubboard.jsp");
		dispatcher.forward(req, resp);
		
	}
}