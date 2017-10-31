package com.fineapple.all.freeboard;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fineapple.DTO.FBCategoryDTO;
import com.fineapple.DTO.VFreeBoardDTO;

public class Edit extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		
		FreeBoardService service = new FreeBoardService();	
		String seq = req.getParameter("seq");		
		
		//글 정보 받을 dto
		VFreeBoardDTO dto = new VFreeBoardDTO();
		dto = service.getEdit(seq);
		
		//카테고리 리스트 받을 list
		ArrayList<FBCategoryDTO> categoryList = new ArrayList<FBCategoryDTO>();	
		categoryList = service.getCategory();
		
		req.setAttribute("dto", dto);
		req.setAttribute("categoryList", categoryList);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/company/pages/all/freeboard/edit.jsp");
		dispatcher.forward(req, resp);
		
	}
	
}
