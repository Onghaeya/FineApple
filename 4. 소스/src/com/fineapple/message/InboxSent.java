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

public class InboxSent extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//보낸쪽지함 출력하기
		//세션 객체 얻어오기
		HttpSession session = req.getSession();
		int num = (int)session.getAttribute("num");
		
		//1) 
		MessageService service = new MessageService();
		
		ArrayList<MsgSRDTO> list = service.slist(num);
		System.out.println("Inbox.java_list.size: " + list.size()); //
		req.setAttribute("slist", list);
		
		//3)
		RequestDispatcher dispatcher = req.getRequestDispatcher("/company/pages/jaejun/inboxsent.jsp");
		dispatcher.forward(req, resp);
		
	}
}


