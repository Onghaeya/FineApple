package com.fineapple.department.income;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fineapple.DTO.IncomeViewDTO;

public class IncomeCheck extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doPost(req, resp);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		IncomeService service = new IncomeService(req.getSession());
		
		String seq = (String) session.getAttribute("seq");
		String departmentSeq = (String) session.getAttribute("departmentSeq");
		String positionSeq = (String) session.getAttribute("positionSeq");
		
		if (departmentSeq == null) {
			req.setAttribute("msg", "로그인 후 이용해주세요");
			RequestDispatcher dispatcher = req.getRequestDispatcher("/company/pages/department/error.jsp");
			dispatcher.forward(req, resp);
			
		} else if (departmentSeq.equals("3") || departmentSeq.equals("4")) {	//총무, 영업부만 접근 가능
			ArrayList<IncomeViewDTO> list = service.getIncome(departmentSeq, positionSeq, seq);
			req.setAttribute("list", list);

			RequestDispatcher dispatcher = req.getRequestDispatcher("/company/pages/department/income/income.jsp");
			dispatcher.forward(req, resp);
			
		} else {
			req.setAttribute("msg", "올바르지 않은 접근입니다");
			RequestDispatcher dispatcher = req.getRequestDispatcher("/company/pages/department/error.jsp");
			dispatcher.forward(req, resp);
		}
	}
}