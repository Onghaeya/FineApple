package com.fineapple.message;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SmsgDel extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//1) 
		
		//2) 
		
		
		//3) 
		RequestDispatcher dispatcher = req.getRequestDispatcher("/company/pages/jaejun/smsgdel.jsp");
		dispatcher.forward(req, resp);
		
	}
}


