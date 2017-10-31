package com.fineapple.attendance.task;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class TaskList extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
	HttpSession session = req.getSession();
	req.setAttribute("position", session.getAttribute("position").toString().substring(0, 2));
		
	
	RequestDispatcher dispatcher = req.getRequestDispatcher("/company/pages/attendance/task/taskList.jsp");
	dispatcher.forward(req, resp);

    }
}