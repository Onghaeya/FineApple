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
import com.fineapple.DTO.IncomeDTO;
import com.fineapple.DTO.IncomeViewDTO;
import com.fineapple.DTO.OutcomeDTO;
import com.fineapple.DTO.OutcomeViewDTO;
import com.fineapple.department.income.IncomeService;
import com.fineapple.department.outcome.OutcomeService;

public class AccountingRead extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		String departmentSeq = (String) session.getAttribute("departmentSeq");
		String positionSeq = (String) session.getAttribute("positionSeq");
		String userSeq = (String) session.getAttribute("seq");
		String seq = req.getParameter("seq");
		String type = req.getParameter("type");
		
		AccountingService service = new AccountingService(session);
		IncomeService iservice = new IncomeService(session);
		OutcomeService oservice = new OutcomeService(session);
		
		if (departmentSeq == null) {
			req.setAttribute("msg", "로그인 후 이용해주세요");
			RequestDispatcher dispatcher = req.getRequestDispatcher("/company/pages/department/error.jsp");
			dispatcher.forward(req, resp);
			
		} else if (departmentSeq.equals("3")) {	//총무부만 이용 가능
			if (type.equals("in")) {	//수입보고서 불러오기
				
				ArrayList<AccountDTO> list = service.getAccount();
				IncomeDTO idto = iservice.readIncome(seq);
				
				req.setAttribute("list", list);
				req.setAttribute("idto", idto);
				req.setAttribute("userseq", userSeq);
				req.setAttribute("departmentSeq", departmentSeq);
				req.setAttribute("positionSeq", positionSeq);
				
				RequestDispatcher dispatcher = req.getRequestDispatcher("/company/pages/department/accounting/read_a_i.jsp");
				dispatcher.forward(req, resp);
				
			} else if (type.equals("out")) {	//지출보고서 불러오기
				
				ArrayList<AccountDTO> list = service.getAccount();
				OutcomeDTO odto = oservice.readOutcome(seq);
				
				req.setAttribute("list", list);
				req.setAttribute("odto", odto);
				req.setAttribute("userseq", userSeq);
				req.setAttribute("departmentSeq", departmentSeq);
				req.setAttribute("positionSeq", positionSeq);
				
				RequestDispatcher dispatcher = req.getRequestDispatcher("/company/pages/department/accounting/read_a_o.jsp");
				dispatcher.forward(req, resp);
			} else if (type.equals("account")) {	//계좌 출납 기록 반환

				ArrayList<IncomeViewDTO> ilist = service.getIncome(seq);
				req.setAttribute("ilist", ilist);
				ArrayList<OutcomeViewDTO> olist = service.getOutcome(seq);
				req.setAttribute("olist", olist);
				
				//TODO 계좌 상세보기에서 출력할 차트, 완성된 sql 사용해서 dao 만들기
				
				RequestDispatcher dispatcher = req.getRequestDispatcher("/company/pages/department/accounting/read_a_a.jsp");
				dispatcher.forward(req, resp);
			}
		} else {
			req.setAttribute("msg", "총무부 부서원들만 접근 가능합니다");
			RequestDispatcher dispatcher = req.getRequestDispatcher("/company/pages/department/error.jsp");
			dispatcher.forward(req, resp);
		}
	}
}