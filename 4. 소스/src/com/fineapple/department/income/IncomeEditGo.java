package com.fineapple.department.income;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fineapple.DTO.IncomeDTO;

public class IncomeEditGo extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		
		HttpSession session = req.getSession();
		
		IncomeService service = new IncomeService(session);
		IncomeDTO dto = new IncomeDTO();
		
		String seq = req.getParameter("userSeq");
		String cSeq = req.getParameter("category");
		String content = req.getParameter("content");
		String goods = req.getParameter("goods");
		int units = Integer.parseInt(req.getParameter("units"));
		int amount = Integer.parseInt(req.getParameter("amount"));
		
		dto.setSeq(seq);
		dto.setcSeq(cSeq);
		dto.setContent(content);
		dto.setGoods(goods);
		dto.setUnits(units);
		dto.setAmount(amount);
		
		int result = service.editIncome(dto);
		
		if (result == 0) {	//오류 시 오류메시지와 함께 오류페이지로 이동
			req.setAttribute("msg", "수입보고서 수정에 오류가 발생했습니다");
			RequestDispatcher dispatcher = req.getRequestDispatcher("/company/pages/department/error.jsp");
			dispatcher.forward(req, resp);	
			
		} else {
			RequestDispatcher dispatcher = req.getRequestDispatcher("/company/pages/department/income_c.do");
			dispatcher.forward(req, resp);
		}
	}
}