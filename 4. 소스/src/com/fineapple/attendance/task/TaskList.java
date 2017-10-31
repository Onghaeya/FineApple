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
	
	try {
		//응답시간 설정 (이 페이지를 로딩하기 전에, 4초 대기
		Thread.sleep(3000);
	} catch (Exception e) {
		System.out.println(e.toString());
	}
	
	RequestDispatcher dispatcher = req.getRequestDispatcher("/company/pages/attendance/task/taskList.jsp");
	dispatcher.forward(req, resp);

    }
}


