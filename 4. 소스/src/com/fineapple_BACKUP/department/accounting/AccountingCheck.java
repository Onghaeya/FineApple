package com.fineapple.department.accounting;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fineapple.DTO.AccountDTO;
import com.fineapple.DTO.AccountRecentDTO;
import com.fineapple.DTO.IncomeViewDTO;
import com.fineapple.DTO.OutcomeViewDTO;
import com.fineapple.department.income.IncomeService;
import com.fineapple.department.outcome.OutcomeService;

public class AccountingCheck extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doPost(req, resp);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		AccountingService service = new AccountingService(session);
		
		String seq = (String) session.getAttribute("seq");
		String departmentSeq = (String) session.getAttribute("departmentSeq");
		String positionSeq = (String) session.getAttribute("positionSeq");
		String limiter = (String) req.getParameter("limiter");	//전체목록(no) 아니면 제한목록(null)
		
		if (departmentSeq == null) {
			req.setAttribute("msg", "로그인 후 이용해주세요");
			RequestDispatcher dispatcher = req.getRequestDispatcher("/company/pages/department/error.jsp");
			dispatcher.forward(req, resp);
			
		} else if (departmentSeq.equals("3")) {	//총무부만 접근 가능
			ArrayList<IncomeViewDTO> ilist = service.getIList(seq, positionSeq, limiter);	//수입목록
			req.setAttribute("ilist", ilist);
			ArrayList<OutcomeViewDTO> olist = service.getOList(seq, positionSeq, limiter);	//지출목록
			req.setAttribute("olist", olist);
			ArrayList<AccountDTO> alist = service.getAList();	//계좌현황
			req.setAttribute("alist", alist);
			ArrayList<AccountRecentDTO> rlist = service.getAccountRecent();	//최근 30일 계좌현황
			req.setAttribute("rlist", rlist);
			
			RequestDispatcher dispatcher = req.getRequestDispatcher("/company/pages/department/accounting/accounting.jsp");
			dispatcher.forward(req, resp);
			
		} else {
			req.setAttribute("msg", "올바르지 않은 접근입니다");
			RequestDispatcher dispatcher = req.getRequestDispatcher("/company/pages/department/error.jsp");
			dispatcher.forward(req, resp);
		}
	}
}