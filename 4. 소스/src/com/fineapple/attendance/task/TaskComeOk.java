package com.fineapple.attendance.task;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fineapple.DTO.AtdWorkRecordDTO;

public class TaskComeOk extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
	//근태기록 중, 출근만 인서트.
	
	req.setCharacterEncoding("UTF-8");

        HttpSession session = req.getSession();
        String eseq = (String)session.getAttribute("seq");
        String name = (String)session.getAttribute("name");
        String positionSeq = (String)session.getAttribute("positionSeq");
        String position = "";
        if(positionSeq.equals("1")) {position = "사장님";}        
        if(positionSeq.equals("2")) {position = "부장님";}        
        if(positionSeq.equals("3")) {position = "과장님";}        
        if(positionSeq.equals("4")) {position = "사원님";}        
    
        AtdWorkRecordDTO dto = new AtdWorkRecordDTO();
        dto.setEseq(eseq);
        
        //테스트
        System.out.println("eseq : "+dto.getEseq());

        TaskService service = new TaskService();
        int result = service.come(dto);

        req.setAttribute("result", result);
        req.setAttribute("name", name);
        req.setAttribute("position", position);
        
	
	RequestDispatcher dispatcher = req.getRequestDispatcher("/company/pages/attendance/task/taskComeOk.jsp");
	dispatcher.forward(req, resp);

    }
}