package com.fineapple.attendance.task;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Task extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
	
	HttpSession session = req.getSession();
	String department = (String)session.getAttribute("departmentSeq");
	String position = (String)session.getAttribute("positionSeq");
	switch (department) {
		case "1" : department="개발부"; break;
        	case "2" : department="인사부"; break;
        	case "3" : department="총무부"; break;
        	case "4" : department="영업부"; break;
	}
	switch (position) {
        	case "1" : position="사장님"; break;
        	case "2" : position="부장님"; break;
        	case "3" : position="과장님"; break;
        	case "4" : position="사원님"; break;
	}
	
	session.setAttribute("department", department);
        session.setAttribute("position", position);
        
        //테스트
        System.out.println("position : "+session.getAttribute("positionSeq")); //3

        RequestDispatcher dispatcher = req.getRequestDispatcher("/company/pages/attendance/task/task.jsp");
	dispatcher.forward(req, resp);

    }
}