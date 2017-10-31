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

public class Inbox extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//받은쪽지함 출력하기
		//세션 객체 얻어오기
		HttpSession session = req.getSession();
		int num = (int)session.getAttribute("num");
		
		//1) 
		MessageService service = new MessageService();
		
		//2) 받은쪽지함 쪽지목록출력
		ArrayList<MsgSRDTO> list = service.list(num);
		System.out.println("Inbox.java_list.size: " + list.size()); //
		req.setAttribute("list", list);
		
		//3) 업퍼헤더 쪽지 목록 출력, 나중에 로그인 쪽으로 옮길것
		ArrayList<MsgSRDTO> upperlist = service.upperlist(num);
		System.out.println("Inbox.java_upperlist.size: " + upperlist.size()); //
		session.setAttribute("upperlist", upperlist);
		
		//4) 
		RequestDispatcher dispatcher = req.getRequestDispatcher("/company/pages/jaejun/inbox.jsp");
		dispatcher.forward(req, resp);
		
	}
}


