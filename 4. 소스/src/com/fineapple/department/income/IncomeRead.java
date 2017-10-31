package com.fineapple.department.income;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fineapple.DTO.IncomeDTO;

public class IncomeRead extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		String departmentSeq = (String) session.getAttribute("departmentSeq");
		String positionSeq = (String) session.getAttribute("positionSeq");
		String userSeq = (String) session.getAttribute("seq");
		String seq = req.getParameter("seq");
		
		IncomeService service = new IncomeService(session);
		
		if (departmentSeq == null) {
			req.setAttribute("msg", "로그인 후 이용해주세요");
			RequestDispatcher dispatcher = req.getRequestDispatcher("/company/pages/department/error.jsp");
			dispatcher.forward(req, resp);
		}
		
		IncomeDTO dto = service.readIncome(seq);
		req.setAttribute("dto", dto);
		req.setAttribute("userseq", userSeq);
		req.setAttribute("departmentSeq", departmentSeq);
		req.setAttribute("positionSeq", positionSeq);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/company/pages/department/income/read_i.jsp");
		dispatcher.forward(req, resp);
	}
}