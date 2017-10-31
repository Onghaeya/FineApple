package com.fineapple.department.outcome;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fineapple.DTO.OutcomeDTO;

/**
 * @author 박의영
 *
 */
public class OutcomeWriteGo extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		
		HttpSession session = req.getSession();
		
		OutcomeService service = new OutcomeService(session);
		OutcomeDTO dto = new OutcomeDTO();
		
		String empSeq = (String) session.getAttribute("seq");
		String positionSeq = (String) session.getAttribute("positionSeq");
		String departmentSeq = (String) session.getAttribute("departmentSeq");
		String cSeq = req.getParameter("category"); 
		String content = req.getParameter("content");
		int amount = Integer.parseInt(req.getParameter("amount"));
		
		dto.setEmpSeq(empSeq);
		dto.setcSeq(cSeq);
		dto.setContent(content);
		dto.setAmount(amount);
		
		int result = service.setOutcome(dto, positionSeq, departmentSeq);
		
		if (result == 0) {	//오류 시 오류메시지와 함께 오류페이지로 이동
			req.setAttribute("msg", "비용청구서 작성에 오류가 발생했습니다");
			RequestDispatcher dispatcher = req.getRequestDispatcher("/company/pages/department/error.jsp");
			dispatcher.forward(req, resp);	
			
		} else {
			RequestDispatcher dispatcher = req.getRequestDispatcher("/company/pages/department/outcome_c.do");
			dispatcher.forward(req, resp);
		}
	}
}