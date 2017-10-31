package com.fineapple.position;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fineapple.DTO.tblScheduleDTO;

public class SdelOk extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest request
											, HttpServletResponse response) 
														throws ServletException, IOException {
		
		//1. 데이터 받기
		//2. DB 작업 -> DAO 위임
		//3. JSP 호출하기 -> 완료 메시지
		
		//1.		
		//String pw = request.getParameter("pw");
		String seq = request.getParameter("seq");
		
		//2.
		tblScheduleDTO dto = new tblScheduleDTO();
		
		dto.setSeq(seq);
		
		TblScheduleDAO dao = new TblScheduleDAO();
		
		int result = 0;
		
/*		if (dao.del(dto)>=0) {
			//0 : 실패
			//1 : 성공
			result = dao.del(dto);
		} else {
			//2 : 암호 틀림
			result  = 2;
		}*/
		
		if(dao.check(dto)){
			result = dao.del(dto);
		}else{
			result = 2;
		}
		
		//3.
		request.setAttribute("result", result);
		
		//request.setAttribute("seq", seq);
		
		
		RequestDispatcher dispatcher
			= request.getRequestDispatcher("/company/pages/position/schedule/sdelok.jsp");
		dispatcher.forward(request, response);		
		
	}
	
}
