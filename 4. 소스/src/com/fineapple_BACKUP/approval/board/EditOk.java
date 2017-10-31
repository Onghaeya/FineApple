package com.fineapple.approval.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.fineapple.DTO.ApprovalBoardDTO;

public class EditOk extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req
											, HttpServletResponse resp) 
														throws ServletException, IOException {
		// 1. 
		req.setCharacterEncoding("UTF-8");

		String name = req.getParameter("name");		
		String subject = req.getParameter("subject");
		String content = req.getParameter("content");		
		String pw = req.getParameter("pw");
		String seq = req.getParameter("seq");
		
		// 2. 
		ApprovalBoardDTO dto = new ApprovalBoardDTO();
		
		dto.setName(name);
		dto.setSubject(subject);
		dto.setContent(content);
		dto.setPw(pw);
		dto.setSeq(seq);
		
		BoardDAO dao = new BoardDAO();
		
		int result = 0;
		
		System.out.println("여기까지----");
		
		System.out.println("seq : " + seq);
		System.out.println("pw : " + pw);
		
		if(dao.check(dto)){
			// 0 : 실패, 1 : 성공
			result = dao.edit(dto);
		}else{
			// 2 : 암호 틀림
			result = 2;
		}
		
		// 3. 
		req.setAttribute("result", result);
		req.setAttribute("seq", seq);
		
		RequestDispatcher dispatcher
			= req.getRequestDispatcher("/company/pages/approval/board/editok.jsp");
		dispatcher.forward(req, resp);
		
		
	}//doPost
	
}//EditOk























