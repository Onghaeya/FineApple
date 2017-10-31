package com.fineapple.all.freeboard;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fineapple.DTO.FBCategoryDTO;

public class Add extends HttpServlet {
		
		@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
				throws ServletException, IOException {
				
			FreeBoardService service = new FreeBoardService();
			
			ArrayList<FBCategoryDTO> categoryList = new ArrayList<FBCategoryDTO>(); 
					
			//카테고리 배열 얻어오기
			categoryList = service.getCategory();
			req.setAttribute("categoryList", categoryList);
			
			
			RequestDispatcher dispatcher = req.getRequestDispatcher("/company/pages/all/freeboard/add.jsp");
			dispatcher.forward(req, resp);
			
		}
	
}
