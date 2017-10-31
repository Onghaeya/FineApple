package com.fineapple.all.survey;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fineapple.DTO.VSurveyDTO;

public class View extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		
		SurveyService service = new SurveyService();
		
		HttpSession session = req.getSession();
		String empSeq = (String)session.getAttribute("seq"); //로그인한 사람
		String seq = req.getParameter("seq"); //설문조사 번호
	
		int result = 0; //참여한 사람인지 아닌지
		
		//이미 참여한 사람인지 검사도 해야함(true면 참여한적 없는 것)
		if(service.checkParticipants(empSeq, seq)) {
			
			VSurveyDTO dto = new VSurveyDTO();
			dto = service.getView(seq);
			req.setAttribute("dto", dto);
			result = 1;
			
		} else {
			result = 0;
		}
		
		req.setAttribute("result", result);
	
		RequestDispatcher dispatcher = req.getRequestDispatcher("/company/pages/all/survey/view.jsp");
		dispatcher.forward(req, resp);
		
	}
	
}
