package com.fineapple.position;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fineapple.DTO.tblScheduleDTO;

public class ScheduleMain extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
	/*	선생님이 도와주신것!!
	 * 
	 * //Data
		tblScheduleDTO dto = new tblScheduleDTO();
		dto.setSubject("semi project");
		dto.setStartDate("2017-09-20");
		
		tblScheduleDTO dto2 = new tblScheduleDTO();
		dto2.setSubject("meeting");
		dto2.setStartDate("2017-09-23");
		
		ArrayList<tblScheduleDTO> list = new ArrayList<tblScheduleDTO>();
		list.add(dto);
		list.add(dto2);
		
		
		//ArrayList<tblScheduleDTO> list = dao.list();
		*/
		//1. DB 작업(select) -> DAO 위임
		//2. 반환된 목록을 JSP 에게 건네주면서 호출하기
		
		//1.
		TblScheduleDAO dao = new TblScheduleDAO();
		ArrayList<tblScheduleDTO> list = dao.list();
		
		System.out.println("리스트 사이즈 : " + list.size());
		System.out.println("하이");
		for(tblScheduleDTO dto : list){
			//System.out.println(dto.getSubject());
			//System.out.println(dto.getStartDate());
			
		}
		
		//2.
		req.setAttribute("list", list);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/company/pages/position/schedule/scheduleMain.jsp");
		dispatcher.forward(req, resp);
		
		
		
		
		
	}
	
}
