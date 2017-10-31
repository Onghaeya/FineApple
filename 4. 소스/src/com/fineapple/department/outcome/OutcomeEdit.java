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

public class OutcomeEdit extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		String seq = req.getParameter("seq");
		
		OutcomeService service = new OutcomeService(session);
		
		ArrayList<OutcomeCategoryDTO> clist = service.getCategory();
		OutcomeDTO dto = service.editOutcome(seq);
		
		req.setAttribute("clist", clist);
		req.setAttribute("dto", dto);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/company/pages/department/outcome/edit_o.jsp");
		dispatcher.forward(req, resp);
	}
}