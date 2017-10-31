package com.fineapple.department.outcome;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fineapple.DTO.OutcomeDTO;

public class OutcomeEditGo extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		
		HttpSession session = req.getSession();
		
		OutcomeService service = new OutcomeService(session);
		OutcomeDTO dto = new OutcomeDTO();
		
		String seq = req.getParameter("userSeq");
		String cSeq = req.getParameter("category");
		String content = req.getParameter("content");
		int amount = Integer.parseInt(req.getParameter("amount"));
		
		dto.setSeq(seq);
		dto.setcSeq(cSeq);
		dto.setContent(content);
		dto.setAmount(amount);
		
		int result = service.editOutcome(dto);
		
		if (result == 0) {	//오류 시 오류메시지와 함께 오류페이지로 이동
			req.setAttribute("msg", "비용청구서 수정에 오류가 발생했습니다");
			RequestDispatcher dispatcher = req.getRequestDispatcher("/company/pages/department/error.jsp");
			dispatcher.forward(req, resp);	
			
		} else {
			RequestDispatcher dispatcher = req.getRequestDispatcher("/company/pages/department/outcome_c.do");
			dispatcher.forward(req, resp);
		}
	}
}