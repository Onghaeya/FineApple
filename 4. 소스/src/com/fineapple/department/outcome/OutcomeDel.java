package com.fineapple.department.outcome;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fineapple.DTO.OutcomeCategoryDTO;
import com.fineapple.DTO.OutcomeDTO;

public class OutcomeDel extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		String seq = req.getParameter("seq");
		
		OutcomeService service = new OutcomeService(session);
		
		int result = service.delOutcome(seq);
		
		if (result == 0) {	//오류 시 오류메시지와 함께 오류페이지로 이동
			req.setAttribute("msg", "비용청구서 삭제에 오류가 발생했습니다");
			RequestDispatcher dispatcher = req.getRequestDispatcher("/company/pages/department/error.jsp");
			dispatcher.forward(req, resp);	
			
		} else {
			RequestDispatcher dispatcher = req.getRequestDispatcher("/company/pages/department/outcome_c.do");
			dispatcher.forward(req, resp);
		}
	}
}