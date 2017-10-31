package com.fineapple.attendance.task;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fineapple.DTO.AtdWorkRecordDTO;

public class TaskLeaveOk extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
	//근태기록 중, 퇴근기록이 없는 행에다가 퇴근기록을 인서트.
	
	req.setCharacterEncoding("UTF-8");
	
	HttpSession session = req.getSession();
	String seq = (String)session.getAttribute("seq");

	TaskService service = new TaskService();
	int result = service.leave(seq);

	//테스트
	System.out.println("seq : "+seq);
	System.out.println("result : "+result);
	System.out.println("position : "+session.getAttribute("position"));
	
	req.setAttribute("seq", session.getAttribute("seq"));
	req.setAttribute("result", result);
	req.setAttribute("name", session.getAttribute("name"));
        req.setAttribute("position", session.getAttribute("position"));
        
	
	RequestDispatcher dispatcher = req.getRequestDispatcher("/company/pages/attendance/task/taskLeaveOk.jsp");
	dispatcher.forward(req, resp);

    }
}