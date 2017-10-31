package com.fineapple.all.contact;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fineapple.DTO.VEmployeeDTO;

public class List extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		
		ContactService service = new ContactService();
		
		ArrayList<VEmployeeDTO> vEmpList = service.getList();
		
		req.setAttribute("vEmpList",vEmpList);
		RequestDispatcher dispatcher = req.getRequestDispatcher("/company/pages/all/contact/list.jsp");
		dispatcher.forward(req, resp);
		
	}
	
}
