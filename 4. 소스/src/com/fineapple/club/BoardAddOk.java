package com.fineapple.club;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class BoardAddOk extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		System.out.println("BoardAddOk");
		
		//파일 업로드 -> 파일명 얻기 -> insert
		String path = req.getRealPath("/company/pages/club/upload");
		int size = 100 * 1024 * 1024;
		
		
		HashMap<String, String> map = new HashMap<String,String>();
//		System.out.println(session.getAttribute("empSeq")+"|"+req.getParameter("clubseq"));
//		map.put("realSeq",session.getAttribute("empSeq").toString());
//		map.put("clubseq", req.getParameter("clubseq"));
//		map.put("title", req.getParameter("title"));
//		map.put("content", req.getParameter("content"));
		
		try {
			//1.
			req.setCharacterEncoding("UTF-8"); //한글 + POST
			
			//req -> (역할 교체) -> multi
			MultipartRequest multi = new MultipartRequest(
															req,
															path,				//업로드 폴더
															size,					//최대 크기
															"UTF-8",			//인코딩
															new DefaultFileRenamePolicy()
														);
			String empSeq = session.getAttribute("seq").toString();
			String clubSeq = multi.getParameter("clubseq");
			String title = multi.getParameter("title");
			String content = multi.getParameter("content");
			
			//첨부파일명
			
			//맵에 집어넣기
			map.put("empSeq", empSeq);
			map.put("clubSeq", clubSeq);
			map.put("title", title);
			map.put("content", content);
			

			ClubBoardService service = new ClubBoardService();
			
			
			int result = service.add(map);
			
			//3.
			req.setAttribute("clubseq", clubSeq);
			req.setAttribute("result", result);//성공1, 실패0
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/company/pages/club/boardaddok.jsp");
		dispatcher.forward(req, resp);
		
	}
	
}