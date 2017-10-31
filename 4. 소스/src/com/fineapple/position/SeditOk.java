package com.fineapple.position;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fineapple.DTO.tblScheduleDTO;

public class SeditOk extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest request
											, HttpServletResponse response) 
														throws ServletException, IOException {
		
		//1. 데이터 받기
		//2. DB 작업 -> DAO 위임
		//3. JSP 호출하기 -> 완료 메시지
		
		//1.
		request.setCharacterEncoding("UTF-8");
		
		String seq = request.getParameter("seq");
		String place = request.getParameter("place");
		String open = request.getParameter("open");
		
		String alarm = request.getParameter("alarm");
		String categorySeq = request.getParameter("scategorySeq");
		 String positionSeq = request.getParameter("positionSeq");
		
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		
		String startDate = request.getParameter("startDate").substring(0,10);
		String endDate = request.getParameter("endDate").substring(0,10);
		
		System.out.println(startDate + "여기까지는 와주시겠습니까?");
		System.out.println("여기까지는 잘 와주십니다.");
		//2.
		tblScheduleDTO dto = new tblScheduleDTO();
		
		dto.setSeq(seq);
		dto.setSubject(subject);
		dto.setContent(content);
		dto.setPlace(place);
		dto.setOpen(open);
		dto.setAlarm(Integer.parseInt(alarm));
		dto.setCategorySeq(categorySeq);
		dto.setStartDate(startDate);
		dto.setEndDate(endDate);
		dto.setPositionSeq(positionSeq);
		
		System.out.println("여기인가요?");
		
		
		TblScheduleDAO dao = new TblScheduleDAO();
		
		int result = 0;
		
		if (dao.check(dto)) {
			//0 : 실패
			//1 : 성공
			result = dao.edit(dto);
		} else {
			//2 : 암호 틀림
			result  = 2;
		}
		
		//3.
		request.setAttribute("result", result);
		request.setAttribute("seq", seq);
		
		RequestDispatcher dispatcher
			= request.getRequestDispatcher("/company/pages/position/schedule/seditok.jsp");
		dispatcher.forward(request, response);		
		
	}
	
}













