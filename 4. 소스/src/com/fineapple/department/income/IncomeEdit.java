package com.fineapple.department.income;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fineapple.DTO.IncomeCategoryDTO;
import com.fineapple.DTO.IncomeDTO;

public class IncomeEdit extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		String departmentSeq = (String) session.getAttribute("departmentSeq");
		
		String seq = req.getParameter("seq");
		
		IncomeService service = new IncomeService(session);
		
		ArrayList<IncomeCategoryDTO> clist = service.getCategory(departmentSeq);
		IncomeDTO dto = service.editIncome(seq);
		
		req.setAttribute("clist", clist);
		req.setAttribute("dto", dto);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/company/pages/department/income/edit_i.jsp");
		dispatcher.forward(req, resp);
	}
}