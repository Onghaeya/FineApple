package com.fineapple.department.income;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class IncomeReadConfirm extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		String seq = req.getParameter("seq");
		String confirm = req.getParameter("confirm");
		String departmentSeq = (String) session.getAttribute("departmentSeq");
		String positionSeq = (String) session.getAttribute("positionSeq");
		
		IncomeService service = new IncomeService(session);
		
		int result = service.setIncomeConfirm(seq, departmentSeq, positionSeq, confirm);

		if (result == 0) {
			req.setAttribute("msg", "수입보고서 승인 도중에 오류가 발생했습니다");
			RequestDispatcher dispatcher = req.getRequestDispatcher("/company/pages/department/error.jsp");
			dispatcher.forward(req, resp);
		} else {
			RequestDispatcher dispatcher = req.getRequestDispatcher("/company/pages/department/income_c.do");
			dispatcher.forward(req, resp);			
		}
	}
}