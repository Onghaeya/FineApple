package com.fineapple.department.income;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class IncomeDel extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		String seq = req.getParameter("seq");
		
		IncomeService service = new IncomeService(session);
		
		int result = service.delIncome(seq);
		
		if (result == 0) {	//오류 시 오류메시지와 함께 오류페이지로 이동
			req.setAttribute("msg", "수입보고서 삭제에 오류가 발생했습니다");
			RequestDispatcher dispatcher = req.getRequestDispatcher("/company/pages/department/error.jsp");
			dispatcher.forward(req, resp);	
			
		} else {
			RequestDispatcher dispatcher = req.getRequestDispatcher("/company/pages/department/income_c.do");
			dispatcher.forward(req, resp);
		}
	}
}