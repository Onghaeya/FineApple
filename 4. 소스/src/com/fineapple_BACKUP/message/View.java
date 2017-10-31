package com.fineapple.message;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fineapple.DTO.MsgSRDTO;

public class View extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		int num = (int)session.getAttribute("num");
		
		//1) 세션에서 값 가져오기
		String sseq = req.getParameter("sseq");
		String rseq = req.getParameter("rseq");
		String boardnum = req.getParameter("boardnum");
		
		//2) DB접속작업
		MessageService service = new MessageService();
		
		//2) 받은쪽지함 쪽지내용출력
		//2-2) 읽은 시간 기록도 동시에 함
		ArrayList<MsgSRDTO> viewlist = service.view(sseq, rseq, num);
		System.out.println("Inbox.java_list.size: " + viewlist.size()); //1개
		
		req.setAttribute("viewlist", viewlist);
		req.setAttribute("boardnum", boardnum);
		
		//3) 보내기
		RequestDispatcher dispatcher = req.getRequestDispatcher("/company/pages/jaejun/view.jsp");
		dispatcher.forward(req, resp);
		
	}
}
