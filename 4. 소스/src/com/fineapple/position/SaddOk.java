package com.fineapple.position;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fineapple.DTO.tblScheduleDTO;

public class SaddOk extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest request
											, HttpServletResponse response) 
														throws ServletException, IOException {
		
		//1. 데이터 받기
		//2. DB 작업 -> DAO 위임
		//3. JSP 호출하기 -> 완료 메시지
		
		//1.
		request.setCharacterEncoding("UTF-8");
		
		String place = request.getParameter("place");
		String open = request.getParameter("open");
		
		String alarm = request.getParameter("alarm");
		String categorySeq = request.getParameter("scategorySeq");
		 String positionSeq = request.getParameter("positionSeq");
		
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		
		String startDate = request.getParameter("startDate");
		System.out.println("startDate : " + startDate);
		String endDate = request.getParameter("endDate");
		
		String userip = request.getRemoteAddr().toString().replace("0:0:0:0:0:0:0:1", "127.0.0.1");
		
		//2.
		tblScheduleDTO dto = new tblScheduleDTO();
		
		dto.setSubject(subject);
		dto.setContent(content);
		dto.setPlace(place);
		dto.setOpen(open);
		dto.setAlarm(Integer.parseInt(alarm));
		dto.setCategorySeq(categorySeq);
		dto.setStartDate(startDate);
		dto.setEndDate(endDate);
		dto.setPositionSeq(positionSeq);
		
		
		
		TblScheduleDAO dao = new TblScheduleDAO();
		int result = dao.add(dto);
		
		
		//3.
		request.setAttribute("result", result);
		
		RequestDispatcher dispatcher
			= request.getRequestDispatcher("/company/pages/position/schedule/saddok.jsp");
		dispatcher.forward(request, response);		
		
	}
	
}













