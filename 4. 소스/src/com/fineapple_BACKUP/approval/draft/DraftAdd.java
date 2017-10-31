package com.fineapple.approval.draft;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fineapple.DTO.ApprovalCategoryDTO;
import com.fineapple.all.freeboard.FreeBoardService;

public class DraftAdd extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
			
		DraftService service = new DraftService();
		
		ArrayList<ApprovalCategoryDTO> categoryList = new ArrayList<ApprovalCategoryDTO>(); 
				
		//카테고리 배열 얻어오기
		categoryList = service.getCategory();
		req.setAttribute("categoryList", categoryList);
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/company/pages/approval/draft/draftAdd.jsp");
		dispatcher.forward(req, resp);
		
	}	
	
}
