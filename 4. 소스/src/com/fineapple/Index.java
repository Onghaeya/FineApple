package com.fineapple;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Index extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
	HttpSession session = req.getSession();
        String seq = (String)session.getAttribute("seq");
        System.out.println("seq : "+seq);
	
        if(seq == null) {
            RequestDispatcher dispatcher = req.getRequestDispatcher("/company/pages/login.jsp");
            dispatcher.forward(req, resp);
        }
        else {
            RequestDispatcher dispatcher = req.getRequestDispatcher("/company/pages/index.jsp");
            dispatcher.forward(req, resp);
        }

    }
}