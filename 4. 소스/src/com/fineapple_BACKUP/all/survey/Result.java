package com.fineapple.all.survey;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fineapple.DTO.VSurveyDTO;

public class Result extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		
		SurveyService service = new SurveyService();
		String seq = req.getParameter("seq"); //조회할 설문조사 번호
		
		VSurveyDTO dto = new VSurveyDTO();
		dto = service.getResult(seq);
		
		req.setAttribute("dto", dto);
		req.setAttribute("sqList", dto.getSqList());
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/company/pages/all/survey/result.jsp");
		dispatcher.forward(req, resp);
		
	}
	
}
