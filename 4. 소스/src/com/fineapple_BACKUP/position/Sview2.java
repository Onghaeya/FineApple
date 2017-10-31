package com.fineapple.position;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fineapple.DTO.tblScheduleDTO;



public class Sview2 extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request
											, HttpServletResponse response) 
														throws ServletException, IOException {
		
		//1. view.do?seq=5 데이터 받기
		//2. DB 작업(select) -> DAO 위임
		//3. 글 한개 반환 -> JSP 건내주면서 호출하기
		System.out.println("SVIEW.JAVA");
		
		String seq = request.getParameter("seq");
		request.setAttribute("seq", seq);
		
		//1.
		//String startDate = request.getParameter("startDate");
		seq = request.getParameter("seq");
		
		System.out.println(seq);
		
		
		//2.
		TblScheduleDAO dao = new TblScheduleDAO();
			
		tblScheduleDTO dto = dao.get2(seq); //글 1개 반환
		
		//2.4 존재않는 게시물에 접근하는 경우 예외 처리
		if (dto == null) {
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('게시물이 없습니다!!');location.href='/Project/company/pages/position/scheduleMain.do';</script>");
			out.close();
			return;
		}
		
		
		
		
		//글내용 엔터값 처리
		String content = dto.getContent().replace("\r\n", "<br>");
		dto.setContent(content);
		
		
		//3.
		request.setAttribute("dto", dto);		
		
		RequestDispatcher dispatcher
			= request.getRequestDispatcher("/company/pages/position/schedule/sview.jsp");
		dispatcher.forward(request, response);		
		
	}
	
}













