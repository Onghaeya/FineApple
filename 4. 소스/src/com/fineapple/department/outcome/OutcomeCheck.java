package com.fineapple.department.outcome;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fineapple.DTO.EmployeeDTO;
import com.fineapple.DTO.OutcomeCategoryDTO;
import com.fineapple.DTO.OutcomeViewDTO;

public class OutcomeCheck extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doPost(req, resp);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		OutcomeService service = new OutcomeService(req.getSession());
		
		String departmentSeq = (String) session.getAttribute("departmentSeq");
		
		if (departmentSeq == null) {
			req.setAttribute("msg", "로그인 후 이용해주세요");
			RequestDispatcher dispatcher = req.getRequestDispatcher("/company/pages/department/error.jsp");
			dispatcher.forward(req, resp);
		}
		
		ArrayList<OutcomeViewDTO> list = service.getOutcome();
		ArrayList<OutcomeCategoryDTO> clist = service.getCategory();
		ArrayList<EmployeeDTO> elist = service.getDepartmentEmployee();
		req.setAttribute("list", list);
		req.setAttribute("clist", clist);
		req.setAttribute("elist", elist);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/company/pages/department/outcome/outcome.jsp");
		dispatcher.forward(req, resp);
	}
}