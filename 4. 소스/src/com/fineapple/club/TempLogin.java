package com.fineapple.club;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fineapple.DTO.ClubDTO;

public class TempLogin extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		session.setAttribute("empSeq", "39");
		ClubService service = new ClubService(session);
		
		ArrayList<ClubDTO> myClubList = service.getClubName();
		

		
		System.out.println(myClubList.get(0).getName());
		
		session.setAttribute("myclublist", myClubList);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/company/pages/index.jsp");
		dispatcher.forward(req, resp);
		
	}
	
}
