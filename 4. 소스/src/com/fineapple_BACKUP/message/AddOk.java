package com.fineapple.message;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fineapple.DTO.MsgReadDTO;
import com.fineapple.DTO.MsgSentDTO;

public class AddOk extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//세션 객체 얻어오기
		HttpSession session = req.getSession();
		int num = (int)session.getAttribute("num");
		
		//1) add.jsp 에서 보낸 값 받기 
		req.setCharacterEncoding("UTF-8"); //한글을 POST방식으로 받을때
//		System.out.println(req.getParameter("title"));
//		System.out.println(req.getParameter("content"));
		
		int readEmployeeNum = Integer.parseInt(req.getParameter("reademployeenum"));
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		
		//2) tblMsgSent에 값 쓰기
		MsgSentDTO sdto = new MsgSentDTO();
		
		sdto.setTitle(title);
		sdto.setContent(content);
		sdto.setSentEmployeeNum(num);
		
		MessageService service = new MessageService();
		int sresult = service.sAdd(sdto); //성공 1, 실패 0인데 얘는 쓸일없음
		System.out.println("sresult: " + sresult);
		req.setAttribute("sresult", sresult); 
		
		
		
		//3) tblMsgRead에 값 쓰기
		MsgReadDTO rdto = new MsgReadDTO();
		rdto.setReadEmployeeNum(readEmployeeNum);
		
		int rresult = service.rAdd(rdto); //성공 1, 실패 0, 얘로 성공여부 판단함
		System.out.println("rresult: " + rresult);
		req.setAttribute("rresult", rresult);
		
		//4) tblMsgRead에 값 쓰기 실패시 2)번 롤백
		if (rresult == 0){
			int rollback = service.rollbackAdd(rdto);
			System.out.println("rollback: " + rollback);
			req.setAttribute("rollback", rollback);
		}
		
		System.out.println("5번시작");
		
		//5) readEmployeeNum 이름 가져옴
		String nameresult = service.addgetname(readEmployeeNum);
		req.setAttribute("nameresult", nameresult); //jsp페이지에서 알림창에 쓸 이름전송
		req.setAttribute("readEmployeeNum", readEmployeeNum); //jsp페이지에서 알림창에 쓸 사번전송
		
		//6)
		RequestDispatcher dispatcher = req.getRequestDispatcher("/company/pages/jaejun/addok.jsp");
		dispatcher.forward(req, resp);
		
	}
}

