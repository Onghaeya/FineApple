package com.fineapple.position;


import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fineapple.DTO.tblScheduleDTO;

public class Sedit extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request
											, HttpServletResponse response) 
														throws ServletException, IOException {
		
		//1. 데이터 받기(seq)
		//2. DB작업(select) -> DAO 위임
		//3. DTO 반환 -> JSP 건네주면서 호출하기
		
		String seq = request.getParameter("seq");
		
		//2.
		TblScheduleDAO dao = new TblScheduleDAO();
		
		tblScheduleDTO dto = dao.eget(seq);//글 한개 반환?
		

		//3.
		request.setAttribute("dto", dto);
		
		
		RequestDispatcher dispatcher
			= request.getRequestDispatcher("/company/pages/position/schedule/sedit.jsp");
		dispatcher.forward(request, response);		
		
	}
	
}













