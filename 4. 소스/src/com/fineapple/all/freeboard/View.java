package com.fineapple.all.freeboard;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fineapple.DTO.FBCommentDTO;
import com.fineapple.DTO.VFreeBoardDTO;

public class View extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		
		String seq = req.getParameter("seq");
		
		FreeBoardService service = new FreeBoardService();
		VFreeBoardDTO dto = new VFreeBoardDTO(); //첨부파일 list까지 포함
		dto = service.getView(seq); //view 출력할 내용 얻어오기		
		
		//comment 얻어오기
		ArrayList<FBCommentDTO> clist = new ArrayList<FBCommentDTO>();
		clist = service.getComments(seq);
		
		
		req.setAttribute("dto", dto);
		req.setAttribute("clist", clist);
		RequestDispatcher dispatcher = req.getRequestDispatcher("/company/pages/all/freeboard/view.jsp");
		dispatcher.forward(req, resp);
		
	}
	
}
