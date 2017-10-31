package com.fineapple.club;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fineapple.DTO.ClubDTO;

public class ClubList extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		ClubService service = new ClubService();
		ArrayList<ClubDTO> clubList= service.list();
		
		 
		req.setAttribute("clubList", clubList);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/company/pages/club/clubList.jsp");
		dispatcher.forward(req, resp);
		
	}
	
}
