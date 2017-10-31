package com.fineapple.department.project;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class FrontPage extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doPost(req, resp);
	}
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		String seq = (String) session.getAttribute("seq");
		String name = (String) session.getAttribute("name");
		String departmentSeq = (String) session.getAttribute("departmentSeq");
		String positionSeq = (String) session.getAttribute("positionSeq");
		
		req.setAttribute("seq", seq);
		req.setAttribute("name", name);
		req.setAttribute("departmentSeq", departmentSeq);
		req.setAttribute("positionSeq", positionSeq);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/company/pages/department/index.jsp");
		dispatcher.forward(req, resp);
	}
}