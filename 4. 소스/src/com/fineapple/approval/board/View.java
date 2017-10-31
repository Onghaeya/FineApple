package com.fineapple.approval.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.fineapple.DTO.ApprovalBoardDTO;

/**
 * 
 * @author Seul
 *
 */
public class View extends HttpServlet {
	
	protected void doGet(HttpServletRequest req
			, HttpServletResponse resp) 
						throws ServletException, IOException {
		
		//1. view.do?seq=5 데이터 받기
		String seq = req.getParameter("seq");
		
		// 2. 
		BoardDAO dao = new BoardDAO();
		//2.3 조회수 증가하기
				HttpSession session = req.getSession();
				
		if(session.getAttribute("readCount") != null
						&& session.getAttribute("readCount").equals("n")) {
				dao.addReadCount(seq);
				session.setAttribute("readCount", "y");
		}		
		
		ApprovalBoardDTO dto = dao.get(seq); // 글 1개 반환 
		
		//3.
		req.setAttribute("dto", dto);		
		
		RequestDispatcher dispatcher
			= req.getRequestDispatcher("/company/pages/approval/board/view.jsp");
		dispatcher.forward(req, resp);		
		
		
	}//doGet

}//View
