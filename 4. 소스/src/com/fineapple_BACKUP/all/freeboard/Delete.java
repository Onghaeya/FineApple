package com.fineapple.all.freeboard;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Delete extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		
		String seq = req.getParameter("seq");
		
		FreeBoardService service = new FreeBoardService();
		int result = service.delete(seq);
		
		req.setAttribute("seq", seq);
		req.setAttribute("result", result);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/company/pages/all/freeboard/delete.jsp");
		dispatcher.forward(req, resp);
		
	}
	
}
