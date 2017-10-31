package com.fineapple.approval.board;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fineapple.DTO.ApprovalBoardDTO;


public class Edit extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req
											, HttpServletResponse resp) 
														throws ServletException, IOException {
		
		String seq = req.getParameter("seq");
		
		//2.
		BoardDAO dao = new BoardDAO();
		
		ApprovalBoardDTO dto = dao.get(seq);
		
		//3.
		req.setAttribute("dto", dto);
		
		RequestDispatcher dispatcher
			= req.getRequestDispatcher("/company/pages/approval/board/edit.jsp");
		dispatcher.forward(req, resp);		
		
	}
	
}//Edit
