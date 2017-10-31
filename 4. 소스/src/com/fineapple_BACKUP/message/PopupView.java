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

public class PopupView extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();
		int num = (int)session.getAttribute("num");
		
		//1) 세션에서 글번호값 가져오기
		String sseq = req.getParameter("sseq");
		String rseq = req.getParameter("rseq");
		
		//2) DB접속작업
		MessageService service = new MessageService();
		
		//2-1) 클릭한 글에 해당하는 쪽지데이터 가져오기
		//2-2) 읽은 시간 기록도 동시에 함 
		ArrayList<MsgSRDTO> pviewlist = service.popupview(sseq, rseq, num);
		System.out.println("pviewlist.size: " + pviewlist.size()); //1개
		//System.out.println(pviewlist.get(0).getTitle()); //1개
		req.setAttribute("viewlist", pviewlist);
		
		//3) 
		RequestDispatcher dispatcher = req.getRequestDispatcher("/company/pages/jaejun/popupview.jsp");
		dispatcher.forward(req, resp);
		
	}
}

