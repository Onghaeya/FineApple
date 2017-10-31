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
import com.fineapple.DTO.OutcomeDTO;
import com.fineapple.DTO.OutcomeViewDTO;
import com.fineapple.DTO.IncomeViewDTO;

public class AccountingReadGo extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		
		HttpSession session = req.getSession();
		
		AccountingService service = new AccountingService(session);
		AccountDTO adto = new AccountDTO();

		String seq = req.getParameter("seq");
		String aSeq = req.getParameter("account");	//계좌 종류
		String confirm = req.getParameter("confirm");	//no , yes
		String type = req.getParameter("type");	//in , out, account
		String mark = "";	//+ , -
		String userSeq = (String) session.getAttribute("seq");
		
		int result = 0;

		if (type.equals("in")) {	//수입보고서 수정
			IncomeDTO idto = new IncomeDTO();
			idto.setContent(req.getParameter("content"));	//DAO에서 select로 이전 내용 불러오고 추가
			idto.setGoods(req.getParameter("goods"));
			
			result = service.setIncomeConfirm(seq, idto, userSeq, aSeq, confirm);
			mark = "+";
			
		} else if (type.equals("out")) {	//지출보고서 수정
			OutcomeDTO odto = new OutcomeDTO();
			odto.setContent(req.getParameter("content"));
			
			result = service.setOutcomeConfirm(seq, odto, userSeq, aSeq, confirm);
			mark = "-";
		}
		if (result == 0) {
			req.setAttribute("msg", "보고서 승인 도중에 오류가 발생했습니다");
			RequestDispatcher dispatcher = req.getRequestDispatcher("/company/pages/department/error.jsp");
			dispatcher.forward(req, resp);
			
		} else if (confirm.equals("yes")) {	//승인된 경우에만 계좌 잔고 변동
			adto.setSeq(req.getParameter("account"));	//계좌 유형
			adto.setBalance(Integer.parseInt(req.getParameter("amount")));	//증감할 비용
			
			result = service.setAccountBalance(adto, mark);
			
			if (result == 0) {
				req.setAttribute("msg", "계좌 입출력 도중에 오류가 발생했습니다");
				RequestDispatcher dispatcher = req.getRequestDispatcher("/company/pages/department/error.jsp");
				dispatcher.forward(req, resp);
			} else {
				RequestDispatcher dispatcher = req.getRequestDispatcher("/company/pages/department/accounting_c.do");
				dispatcher.forward(req, resp);
			}
		} else {
			RequestDispatcher dispatcher = req.getRequestDispatcher("/company/pages/department/accounting_c.do");
			dispatcher.forward(req, resp);
		}
	}
}