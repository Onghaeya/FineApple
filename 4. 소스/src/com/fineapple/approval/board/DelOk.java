package com.fineapple.approval.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fineapple.DTO.ApprovalBoardDTO;

public class DelOk extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req
											, HttpServletResponse resp) 
														throws ServletException, IOException {
		
		//1. 데이터 받기
		//2. DB 작업 -> DAO 위임
		//3. JSP 호출하기 -> 완료 메시지
		
		//1.		
		String pw = req.getParameter("pw");
		String seq = req.getParameter("seq");
		
		//2.
		ApprovalBoardDTO dto = new ApprovalBoardDTO();
		dto.setPw(pw);
		dto.setSeq(seq);
		
		BoardDAO dao = new BoardDAO();
		
		int result = 0;
		
		// 입력한 암호가 맞거나 맞지 않았을 때의 코드
		
		if (dao.check(dto)) {
			//0 : 실패
			//1 : 성공
			result = dao.del(dto);
		} else {
			//2 : 암호 틀림
			result  = 2;
		}
		
		
		//3.
		req.setAttribute("result", result);
		
		
		RequestDispatcher dispatcher
			= req.getRequestDispatcher("/company/pages/approval/board/delok.jsp");
		dispatcher.forward(req, resp);		
		
	}	
	
	
}//DelOk
